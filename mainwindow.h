#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "mynetworkclass.h"
#include <QTimer>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void update();

    void recordTimeout();

    void dataIn(QByteArray data);

    void on_pushButton_clicked();

    void on_pushButton_2_clicked();

    void on_pushButton_3_clicked();

    void on_pushButton_5_clicked();

    void on_linePath_editingFinished();

    void on_pushButton_4_clicked();

    void on_pushButton_6_clicked();

private:
    Ui::MainWindow *ui;
    MyNetworkClass theDon;
    QTimer *timerUpdate;
    QTimer *timerRecord;
};

#endif // MAINWINDOW_H
