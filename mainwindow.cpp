#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QtSql>
#include <iostream>
#include <QDebug>
#include <QDateTime>
#include <QTextStream>
#include <QFileInfo>
#include <QDir>
#include <QFileDialog>
#include <QLinkedList>


//Crear una nueva clase que se ejecute de manera constante para empezara a grabar basado en la lista de dates
//Hacer un botón para detener la grabación
//Verificar el último video creado y cambiar el nombre
//Limpiar detalles

static QString videoName;
static QString WebIP;
static QLinkedList<QString> dateList;
static QLinkedList<QString> nameList;
static QString currentName;
static QString outputFolder;
static QString outputVideoFolder;

void delay()
{
    QTime dieTime= QTime::currentTime().addSecs(1);
    while (QTime::currentTime() < dieTime)
        QCoreApplication::processEvents(QEventLoop::AllEvents, 100);
}


MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    connect(&theDon,SIGNAL(dataReadyRead(QByteArray)),this,SLOT(dataIn(QByteArray)));
    timerUpdate = new QTimer(this);
    timerRecord = new QTimer(this);
    //connect(timer, &QAction::triggered, this, [this]{update(flag);});
    connect(timerUpdate, SIGNAL(timeout()),this, SLOT(update()));
    connect(timerRecord, SIGNAL(timeout()),this, SLOT(recordTimeout()));
    timerUpdate->start(2000);

    QString tipo="QMYSQL";
    QSqlDatabase db;
    db = QSqlDatabase::addDatabase(tipo);
    db.setHostName("localhost");
    db.setDatabaseName("bronze");
    db.setUserName("root");
    db.setPassword("enero2009");
    db.setPort(3306);
    qDebug()<<"START AT:"<<QDateTime::currentDateTime();

    //Si la database está abierta se ejecuta un query que toma todos los nombres de empleados
    bool ok = db.open();
    if (ok)
    {
        qDebug()<<"la database se abrió de manera correcta";
    }

}

MainWindow::~MainWindow()
{
    delete ui;
    dateList.~QLinkedList();
}

void MainWindow::update()
{
    timerUpdate->start(15000);
    QString format("yyyy-MM-dd HH:mm");
    dateList.clear();
    nameList.clear();
    //qDebug()<<"UPDATE AT:"<<QDateTime::currentDateTime();
    /////////////////////////////////////Queries/////////////////////////////////////

    QSqlQuery queryEvents;
    QString today=QDate::currentDate().toString("yyyy-MM-dd");
    QString now=QDateTime::currentDateTime().toString(format);
    qDebug() << "today:" <<today;
    qDebug() << "now:" <<now;
    queryEvents.prepare("SELECT first_name, last_name, service_title, service_datetime FROM events_event WHERE date(service_datetime) =:thisDay ");
    queryEvents.bindValue(":thisDay", today);
    queryEvents.exec();
    qDebug() << "Error de query:" << queryEvents.lastError().text();

    while (queryEvents.next())
    {
        QDateTime tempQueryDate= queryEvents.value(3).toDateTime();
        QString tempQueryTitle = queryEvents.value(2).toString();
        QString stringDate = tempQueryDate.toString(format);
        if (QDateTime::fromString(now,format) < QDateTime::fromString(stringDate,format))
        {
            dateList<<tempQueryDate.toString(format);
            nameList<<tempQueryTitle;

        }
    }

    QLinkedList<QString>::iterator i;
    QLinkedList<QString>::iterator j;



    if (!dateList.isEmpty() && !nameList.isEmpty())
    {
        QDateTime tempDate=QDateTime::fromString(dateList.first(),format);
        videoName = nameList.first();

        qDebug()<<"PRIMERA HORA:"<<tempDate;
        qDebug()<<"LISTA LIGADA:";

        j=nameList.begin();
        for (i=dateList.begin(); i!=dateList.end(); i++)
        {

            QString s = *i;
            QString t = *j;


            if (tempDate > QDateTime::fromString(s,format))
            {
                tempDate = QDateTime::fromString(s,format);
                videoName=t;
            }
            j++;
        }


        QDateTime nowDateTime = QDateTime::currentDateTime();

        foreach(QString t, nameList)
        {
            qDebug()<<"Lista Nombres:"<<t;
        }

        foreach(QString t, dateList)
        {
            qDebug()<<"Lista fechas:"<<t;
        }

        int remainingTimems = nowDateTime.msecsTo(tempDate);
        qDebug()<<"SIGUIENTE HORA:"<<tempDate;
        qDebug()<<"NOMBRE DEL SIGUIENTE ARCHIVO"<<videoName;
        qDebug()<<"Time until next hour:"<<nowDateTime.msecsTo(tempDate);
        /////////////////////////////////////////////////////////////////////////////////

        //connect(timerRecord, SIGNAL(timeout()),this, SLOT(recordTimeout()));
        timerRecord->start(remainingTimems);
    }
    else
    {
        timerRecord->stop();
    }

}

void MainWindow::recordTimeout()
{
    theDon.makeRequest(WebIP+"/api/?Function=StartRecording");
    qDebug()<<"La grabacion inicio a las"<<QDateTime::currentDateTime().toString(Qt::TextDate);
    currentName=videoName;
    update();
}

void MainWindow::dataIn(QByteArray data)
{
    QString dataString;
    dataString=data;
}

void MainWindow::on_pushButton_clicked()
{
    WebIP=ui->lineWebIP->text();
    QString outputFolder=ui->linePath->text();
    update();
}

void MainWindow::on_pushButton_2_clicked()
{
    theDon.makeRequest(WebIP+"/api/?Function=StopRecording");
    qDebug()<<"La grabacion detuvo a las"<<QDateTime::currentDateTime().toString(Qt::TextDate);
    timerRecord->stop();
//    QString outputFolder;
//    QFileDialog dialog(this);
//    dialog.setFileMode(QFileDialog::Directory);
//    outputFolder = QFileDialog::getExistingDirectory(0, ("Select Output Folder"), QDir::currentPath());
    ui->linePath->setText(outputFolder);
    qDebug()<<"nombre del folder"<<outputFolder;

    QString stringOutputPath = ui->lineOutputPath->text();

    QDir outputPath(stringOutputPath);
    QDir dir(outputFolder);
    dir.setFilter(QDir::NoDotAndDotDot | QDir::Files );
    dir.setSorting(QDir::Time);
    QFileInfoList list = dir.entryInfoList();
    for (int i=0; i<list.size();i++)
    {
        QFileInfo fileInfo=list.at(i);
        QString str = fileInfo.fileName();
        qDebug()<<str;
    }
    QFileInfo fileData=list.at(0);
    QString str = fileData.absoluteFilePath();
    QString path = fileData.absolutePath();
    if (!outputPath.exists())
    {
        outputPath=path;
    }
    QString fileSuffix = fileData.suffix();
    qint64 fileSize =0;
//    QString newName="/a2425555.avi";
    if (fileSuffix=="avi")
    {
        //delay();
        QFile file(str);
        file.open(QIODevice::ReadWrite);
        qDebug()<<"SE PUEDE ABRIR?:"<<file.isReadable();
        qDebug()<<"SE PUEDE ESCRIBIR?:"<<file.isWritable();
        qDebug()<<"NOMBRE DEL ARCHIVO:"<<str;
        qDebug()<<"Path + name:"<<path+"/"+currentName+"."+fileSuffix;
        outputPath.mkpath(stringOutputPath+"/"+currentName);
        qDebug()<<"tamaño del archivo"<<file.size();
        while (fileSize!=file.size())
        {
            fileSize=file.size();
            delay();
        }
        file.close();
        qDebug()<<"rename:"<<QFile::rename(str,stringOutputPath+"/"+currentName+"/"+currentName+"."+fileSuffix);
        qDebug()<<"Exist:"<<file.exists();
        qDebug()<<"Nombre del video:"<<currentName;

    }
    update();

}


void MainWindow::on_pushButton_3_clicked()
{
    WebIP=ui->lineWebIP->text();
}

void MainWindow::on_pushButton_5_clicked()
{
    QFileDialog dialog(this);
    dialog.setFileMode(QFileDialog::Directory);
    outputFolder = QFileDialog::getExistingDirectory(0, ("Select Vmix's Default Folder"), QDir::currentPath());
    ui->linePath->setText(outputFolder);
}

void MainWindow::on_linePath_editingFinished()
{
    outputFolder=ui->linePath->text();
}


void MainWindow::on_pushButton_4_clicked()
{
    update();
}

void MainWindow::on_pushButton_6_clicked()
{

    QFileDialog dialog(this);
    dialog.setFileMode(QFileDialog::Directory);
    outputVideoFolder = QFileDialog::getExistingDirectory(0, ("Select Output Folder"), QDir::currentPath());
    ui->lineOutputPath->setText(outputVideoFolder);

}
