-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bronze
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add equipment status',7,'add_equipmentstatus'),(26,'Can change equipment status',7,'change_equipmentstatus'),(27,'Can delete equipment status',7,'delete_equipmentstatus'),(28,'Can view equipment status',7,'view_equipmentstatus'),(29,'Can add location installed',8,'add_locationinstalled'),(30,'Can change location installed',8,'change_locationinstalled'),(31,'Can delete location installed',8,'delete_locationinstalled'),(32,'Can view location installed',8,'view_locationinstalled'),(33,'Can add serial communication status',9,'add_serialcommunicationstatus'),(34,'Can change serial communication status',9,'change_serialcommunicationstatus'),(35,'Can delete serial communication status',9,'delete_serialcommunicationstatus'),(36,'Can view serial communication status',9,'view_serialcommunicationstatus'),(37,'Can add video status',10,'add_videostatus'),(38,'Can change video status',10,'change_videostatus'),(39,'Can delete video status',10,'delete_videostatus'),(40,'Can view video status',10,'view_videostatus'),(41,'Can add events',11,'add_events'),(42,'Can change events',11,'change_events'),(43,'Can delete events',11,'delete_events'),(44,'Can view events',11,'view_events'),(45,'Can add events for approval',12,'add_eventsforapproval'),(46,'Can change events for approval',12,'change_eventsforapproval'),(47,'Can delete events for approval',12,'delete_eventsforapproval'),(48,'Can view events for approval',12,'view_eventsforapproval'),(49,'Can add event',13,'add_event'),(50,'Can change event',13,'change_event'),(51,'Can delete event',13,'delete_event'),(52,'Can view event',13,'view_event'),(53,'Can add event',14,'add_event'),(54,'Can change event',14,'change_event'),(55,'Can delete event',14,'delete_event'),(56,'Can view event',14,'view_event'),(57,'Can add events for approval',15,'add_eventsforapproval'),(58,'Can change events for approval',15,'change_eventsforapproval'),(59,'Can delete events for approval',15,'delete_eventsforapproval'),(60,'Can view events for approval',15,'view_eventsforapproval');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(14,'events','event'),(15,'events','eventsforapproval'),(7,'monitoring_station','equipmentstatus'),(13,'monitoring_station','event'),(11,'monitoring_station','events'),(12,'monitoring_station','eventsforapproval'),(8,'monitoring_station','locationinstalled'),(9,'monitoring_station','serialcommunicationstatus'),(10,'monitoring_station','videostatus'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-10-10 03:36:56.257894'),(2,'auth','0001_initial','2018-10-10 03:36:56.598760'),(3,'admin','0001_initial','2018-10-10 03:36:56.677867'),(4,'admin','0002_logentry_remove_auto_add','2018-10-10 03:36:56.693736'),(5,'admin','0003_logentry_add_action_flag_choices','2018-10-10 03:36:56.706293'),(6,'contenttypes','0002_remove_content_type_name','2018-10-10 03:36:56.761514'),(7,'auth','0002_alter_permission_name_max_length','2018-10-10 03:36:56.785647'),(8,'auth','0003_alter_user_email_max_length','2018-10-10 03:36:56.819961'),(9,'auth','0004_alter_user_username_opts','2018-10-10 03:36:56.837501'),(10,'auth','0005_alter_user_last_login_null','2018-10-10 03:36:56.865794'),(11,'auth','0006_require_contenttypes_0002','2018-10-10 03:36:56.869139'),(12,'auth','0007_alter_validators_add_error_messages','2018-10-10 03:36:56.884940'),(13,'auth','0008_alter_user_username_max_length','2018-10-10 03:36:56.920888'),(14,'auth','0009_alter_user_last_name_max_length','2018-10-10 03:36:56.951290'),(15,'monitoring_station','0001_initial','2018-10-10 03:36:57.144550'),(16,'sessions','0001_initial','2018-10-10 03:36:57.185177'),(17,'monitoring_station','0002_auto_20181011_0131','2018-10-11 01:31:22.149115'),(18,'monitoring_station','0003_auto_20181011_0132','2018-10-11 01:32:36.739024'),(19,'monitoring_station','0004_auto_20181015_0239','2018-10-15 02:39:08.517711'),(20,'monitoring_station','0005_auto_20181027_1801','2018-10-27 18:01:34.807031'),(21,'monitoring_station','0006_auto_20181027_1802','2018-10-27 18:02:32.128631'),(22,'monitoring_station','0007_auto_20181028_1818','2018-10-28 18:19:07.084873'),(23,'monitoring_station','0008_auto_20181103_1904','2018-11-03 19:05:02.991414'),(24,'monitoring_station','0009_events','2018-12-07 00:04:16.553271'),(25,'monitoring_station','0010_auto_20181207_2048','2018-12-07 20:48:54.344785'),(26,'events','0001_initial','2018-12-07 21:48:03.984874'),(27,'monitoring_station','0011_auto_20181207_2147','2018-12-07 21:48:04.034729'),(28,'events','0002_auto_20181207_2230','2018-12-07 22:30:48.771317'),(29,'events','0003_auto_20181207_2252','2018-12-07 22:52:43.558639'),(30,'events','0004_event_service_title','2018-12-08 16:13:37.339290'),(31,'events','0005_auto_20181210_1641','2018-12-10 16:41:34.707510');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_event`
--

DROP TABLE IF EXISTS `events_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `events_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `service_location` varchar(100) NOT NULL,
  `service_type` varchar(100) NOT NULL,
  `service_datetime` datetime(6) NOT NULL,
  `approval` varchar(1) NOT NULL,
  `service_title` varchar(100) NOT NULL,
  `service_live_stream` tinyint(1) NOT NULL,
  `service_within_7_days` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_event`
--

LOCK TABLES `events_event` WRITE;
/*!40000 ALTER TABLE `events_event` DISABLE KEYS */;
INSERT INTO `events_event` VALUES (22,'Raul Dos','Dosten','dosten@gmail.com','Congregation Or Ami','Shabbat Service','2018-12-11 10:52:00.000000','3','title testing',0,0),(23,'Raul Dos','Dosten','dosten@gmail.com','Congregation Or Ami','Shabbat Service','2018-12-11 10:52:00.000000','3','title testing',0,0),(24,'Raul Dos','Dosten','dosten@gmail.com','Congregation Or Ami','Shabbat Service','2018-12-11 10:52:00.000000','3','title testing',0,0),(25,'Final','Test','final@test.com','Congregation Or Ami','Wedding','2018-12-31 16:19:00.000000','2','FinalTest',0,0),(26,'Final','Test','final@test.com','Congregation Or Ami','Wedding','2018-12-31 16:19:00.000000','1','FinalTest',1,0),(27,'Jacob','Braunstein','jacob@bronzeproductions.com','Congregation Or Ami','Bat Mitzvah','2018-12-12 14:29:00.000000','2','Test Name',1,0),(28,'Nestor','Cuello','cuellonicholson@gmail.com','Congregation Or Ami','Bar Mitzvah','2018-12-20 17:37:00.000000','3','Kyle\'s Bar',1,0),(29,'Jacob','Braunstein','Jacob@bronzeproductions.com','Congregation Or Ami','Bar Mitzvah','2019-01-09 14:08:00.000000','1','Jacob\'s Live Stream Test',1,0),(30,'Gian Nestor','Cuello Nicholson','Test@gmail.com','Wilshire Boulevard Temple - Glazer Campus','Bar Mitzvah','2018-12-29 08:25:00.000000','1','Yucs weddimg',1,0),(31,'Gian Nestor','Nicholson','giancuello26@gmail.com','Wilshire Boulevard Temple - Glazer Campus','Shabbat Service','2018-12-24 09:24:00.000000','1','Iron fest',0,0),(32,'Jacob','Braunstein','Jacob@bronzeproductions.com','Congregation Or Ami','Bar Mitzvah','2019-01-08 14:08:00.000000','1','Graduacion',1,0),(33,'Gian Nestor','Cuello Nicholson','Test@gmail.com','Wilshire Boulevard Temple - Glazer Campus','Bar Mitzvah','2019-01-08 14:25:00.000000','1','Prueba',1,0),(34,'Gian Nestor','Nicholson','giancuello26@gmail.com','Wilshire Boulevard Temple - Glazer Campus','Shabbat Service','2019-01-08 15:13:00.000000','1','fiesta2',0,0),(35,'Jacob','Braunstein','Jacob@bronzeproductions.com','Congregation Or Ami','Bar Mitzvah','2019-01-08 14:14:00.000000','1','Resultados',1,0),(36,'Jacob','Braunstein','Jacob@bronzeproductions.com','Congregation Or Ami','Bar Mitzvah','2019-01-08 14:12:00.000000','1','Examen',1,0);
/*!40000 ALTER TABLE `events_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitoring_station_equipmentstatus`
--

DROP TABLE IF EXISTS `monitoring_station_equipmentstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `monitoring_station_equipmentstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `internet_speed_upload` double NOT NULL,
  `system_date` datetime(6) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `location_id` int(11) NOT NULL,
  `serial_status_id` int(11) NOT NULL,
  `video_status_id` int(11) NOT NULL,
  `internet_speed_download` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitoring_station_e_location_id_648e4d4d_fk_monitorin` (`location_id`),
  KEY `monitoring_station_e_serial_status_id_f8518dc6_fk_monitorin` (`serial_status_id`),
  KEY `monitoring_station_e_video_status_id_6f0c58bb_fk_monitorin` (`video_status_id`),
  CONSTRAINT `monitoring_station_e_location_id_648e4d4d_fk_monitorin` FOREIGN KEY (`location_id`) REFERENCES `monitoring_station_locationinstalled` (`id`),
  CONSTRAINT `monitoring_station_e_serial_status_id_f8518dc6_fk_monitorin` FOREIGN KEY (`serial_status_id`) REFERENCES `monitoring_station_serialcommunicationstatus` (`id`),
  CONSTRAINT `monitoring_station_e_video_status_id_6f0c58bb_fk_monitorin` FOREIGN KEY (`video_status_id`) REFERENCES `monitoring_station_videostatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitoring_station_equipmentstatus`
--

LOCK TABLES `monitoring_station_equipmentstatus` WRITE;
/*!40000 ALTER TABLE `monitoring_station_equipmentstatus` DISABLE KEYS */;
INSERT INTO `monitoring_station_equipmentstatus` VALUES (3,30000,'2018-10-07 12:52:11.000000','2018-10-10 05:53:07.890521',13,13,18,40000),(4,30000,'2018-10-07 12:52:11.000000','2018-10-10 06:12:58.578613',13,14,19,40000),(5,30000,'2018-10-07 12:52:11.000000','2018-10-10 06:13:01.279983',13,15,20,40000),(6,30000,'2018-10-07 12:52:11.000000','2018-10-10 06:13:02.083303',13,16,21,40000),(7,30000,'2018-10-07 12:52:11.000000','2018-10-10 06:13:02.672856',13,17,22,40000),(8,30000,'2018-10-07 12:52:11.000000','2018-10-10 06:13:03.210984',13,18,23,40000),(9,30000,'2018-10-07 12:52:11.000000','2018-10-10 19:07:11.766625',14,20,25,50),(10,34000,'2018-10-07 12:52:11.000000','2018-10-10 19:07:49.306263',14,21,26,50),(11,30000,'2018-10-07 12:52:11.000000','2018-10-10 19:48:07.060982',14,22,27,50),(12,30000,'2018-10-07 15:52:11.000000','2018-10-10 19:59:27.847647',14,23,28,50),(13,30000,'2018-10-07 15:52:11.000000','2018-10-10 20:25:18.500992',14,26,31,50),(14,30000,'2018-10-07 15:52:11.000000','2018-10-10 20:27:54.946555',14,27,32,50),(15,30000,'2018-10-07 15:52:11.000000','2018-10-10 23:15:36.659713',14,28,33,50),(16,30000,'2018-10-07 15:52:11.000000','2018-10-11 01:33:18.526709',14,29,34,50),(17,30000,'2018-10-07 15:52:11.000000','2018-10-11 01:35:48.358023',14,30,35,50),(18,30000,'2018-10-11 01:56:41.000000','2018-10-11 01:58:41.497876',14,33,38,50),(19,30000,'2018-10-11 01:56:41.000000','2018-10-11 02:04:43.271579',14,35,40,50),(20,30000,'2018-10-11 01:56:41.000000','2018-10-11 02:09:17.603523',14,36,41,50),(21,30000,'2018-10-11 01:56:41.000000','2018-10-11 02:13:38.552560',14,37,42,50),(22,16121,'2018-10-11 02:16:41.000000','2018-10-11 02:17:01.565238',14,38,43,50),(23,16121,'2018-10-11 02:16:41.000000','2018-10-11 02:17:09.130130',14,39,44,40000),(24,16121,'2018-10-11 02:16:41.000000','2018-10-11 02:17:16.086313',14,40,45,40000),(25,28363,'2018-10-11 02:17:07.000000','2018-10-11 02:17:19.823521',14,41,46,40000),(26,28363,'2018-10-11 02:17:07.000000','2018-10-11 02:17:26.476603',14,42,47,40000),(27,28363,'2018-10-11 02:17:07.000000','2018-10-11 02:17:33.011814',14,43,48,40000),(28,35789,'2018-10-11 02:17:37.000000','2018-10-11 02:17:45.708266',14,44,49,40000),(29,35789,'2018-10-11 02:17:37.000000','2018-10-11 02:17:52.592017',14,45,50,40000),(30,35789,'2018-10-11 02:17:37.000000','2018-10-11 02:17:59.147137',14,46,51,40000),(31,23532,'2018-10-11 02:19:30.000000','2018-10-11 02:19:40.385152',14,47,52,40000),(32,23532,'2018-10-11 02:19:30.000000','2018-10-11 02:19:50.458915',14,48,53,40000),(33,23532,'2018-10-11 02:19:30.000000','2018-10-11 02:19:57.765296',14,49,54,40000),(34,14684,'2018-10-11 02:26:03.000000','2018-10-11 02:26:13.129045',14,50,55,40000),(35,14684,'2018-10-11 02:26:03.000000','2018-10-11 02:26:20.865731',14,51,56,40000),(36,14684,'2018-10-11 02:26:03.000000','2018-10-11 02:26:29.095239',14,52,57,40000),(37,24900,'2018-10-11 02:26:29.000000','2018-10-11 02:26:38.177110',14,53,58,40000),(38,22229,'2018-10-11 02:30:42.000000','2018-10-11 02:30:51.230990',14,54,59,40000),(39,41049,'2018-10-11 02:31:09.000000','2018-10-11 02:31:19.205461',14,55,60,40000),(40,29401,'2018-10-11 02:32:46.000000','2018-10-11 02:32:51.169902',14,56,61,40000),(41,28363,'2018-10-11 02:33:13.000000','2018-10-11 02:33:17.553309',14,57,62,40000),(42,48302,'2018-10-11 02:33:44.000000','2018-10-11 02:33:48.009143',14,58,63,40000),(43,30446,'2018-10-11 02:34:14.000000','2018-10-11 02:34:17.901862',14,59,64,40000),(44,30446,'2018-10-11 02:34:14.000000','2018-10-15 03:34:17.914091',14,60,65,40000),(45,30446,'2018-10-11 02:34:14.000000','2018-10-15 03:42:39.152019',14,61,66,40000),(46,30446,'2018-10-11 02:34:14.000000','2018-10-18 00:32:57.864938',14,63,68,40000),(47,30446,'2018-10-11 02:34:14.000000','2018-10-27 18:14:55.022217',14,72,78,30446),(48,2.89499056401905,'2018-11-03 19:05:15.000000','2018-11-03 19:05:26.658712',13,77,83,54.2839380367154),(49,2.6,'2018-11-03 19:13:44.000000','2018-11-03 19:14:03.631260',13,78,84,53.84),(50,3.05,'2018-11-03 19:38:48.000000','2018-11-03 19:39:39.695527',13,79,85,71.43),(51,4.05,'0000-00-00 00:00:00.000000','0000-00-00 00:00:00.000000',15,79,85,70);
/*!40000 ALTER TABLE `monitoring_station_equipmentstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitoring_station_locationinstalled`
--

DROP TABLE IF EXISTS `monitoring_station_locationinstalled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `monitoring_station_locationinstalled` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `bad_internet_speed_download` double NOT NULL,
  `max_internet_speed_upload` double NOT NULL,
  `regular_internet_speed_download` double NOT NULL,
  `bad_internet_speed_upload` double NOT NULL,
  `max_internet_speed_download` double NOT NULL,
  `regular_internet_speed_upload` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitoring_station_locationinstalled`
--

LOCK TABLES `monitoring_station_locationinstalled` WRITE;
/*!40000 ALTER TABLE `monitoring_station_locationinstalled` DISABLE KEYS */;
INSERT INTO `monitoring_station_locationinstalled` VALUES (13,'Wilshire Boulevard Temple - Irmas Campus',NULL,NULL,15000,50000,25000,15000,50000,25000),(14,'Wilshire Boulevard Temple - Glazer Campus',NULL,NULL,15000,50000,25000,15000,50000,25000),(15,'Congregation Or Ami',NULL,NULL,15000,50000,25000,15000,50000,25000);
/*!40000 ALTER TABLE `monitoring_station_locationinstalled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitoring_station_serialcommunicationstatus`
--

DROP TABLE IF EXISTS `monitoring_station_serialcommunicationstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `monitoring_station_serialcommunicationstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pcl` int(11) DEFAULT NULL,
  `pcr` int(11) DEFAULT NULL,
  `rcl` int(11) DEFAULT NULL,
  `rcr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitoring_station_serialcommunicationstatus`
--

LOCK TABLES `monitoring_station_serialcommunicationstatus` WRITE;
/*!40000 ALTER TABLE `monitoring_station_serialcommunicationstatus` DISABLE KEYS */;
INSERT INTO `monitoring_station_serialcommunicationstatus` VALUES (13,0,0,0,0),(14,0,0,1,1),(15,0,0,1,1),(16,0,0,1,1),(17,0,0,1,1),(18,1,1,1,1),(19,0,0,1,1),(20,0,0,1,1),(21,0,0,1,1),(22,1,0,1,1),(23,1,0,1,1),(24,1,0,1,1),(25,1,0,1,1),(26,1,0,1,1),(27,1,0,1,1),(28,1,0,1,1),(29,2,1,1,1),(30,2,1,2,1),(31,2,1,1,1),(32,2,1,1,1),(33,2,1,1,1),(34,2,1,1,1),(35,2,1,1,1),(36,2,1,1,1),(37,2,1,1,1),(38,1,0,1,1),(39,1,0,1,1),(40,1,0,2,1),(41,1,0,2,1),(42,1,0,2,1),(43,1,0,2,1),(44,1,0,2,1),(45,1,0,2,1),(46,1,0,2,1),(47,1,0,2,1),(48,1,0,2,1),(49,1,0,2,1),(50,2,0,2,1),(51,2,0,2,1),(52,2,0,2,1),(53,1,0,2,1),(54,1,0,2,1),(55,1,0,2,1),(56,2,0,2,1),(57,1,0,2,1),(58,1,0,2,1),(59,1,0,2,1),(60,1,0,2,1),(61,1,0,2,1),(62,1,0,2,1),(63,1,0,2,1),(64,1,2,1,1),(65,1,2,1,1),(66,1,2,1,1),(67,1,2,1,1),(68,1,2,1,1),(69,1,2,1,1),(70,1,2,1,1),(71,1,2,1,1),(72,1,0,2,1),(73,0,0,0,0),(74,0,0,0,0),(75,0,0,0,0),(76,0,0,0,0),(77,0,0,0,0),(78,0,0,0,0),(79,0,0,0,0);
/*!40000 ALTER TABLE `monitoring_station_serialcommunicationstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitoring_station_videostatus`
--

DROP TABLE IF EXISTS `monitoring_station_videostatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `monitoring_station_videostatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rcl` tinyint(1) NOT NULL,
  `rcr` tinyint(1) NOT NULL,
  `pcl` tinyint(1) NOT NULL,
  `pcr` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitoring_station_videostatus`
--

LOCK TABLES `monitoring_station_videostatus` WRITE;
/*!40000 ALTER TABLE `monitoring_station_videostatus` DISABLE KEYS */;
INSERT INTO `monitoring_station_videostatus` VALUES (18,1,0,1,0),(19,1,0,1,0),(20,1,0,1,0),(21,1,0,1,0),(22,1,0,1,0),(23,1,1,1,1),(24,1,0,1,0),(25,1,0,1,0),(26,1,0,1,0),(27,1,0,1,0),(28,1,0,1,0),(29,1,0,1,0),(30,1,0,1,0),(31,1,0,1,0),(32,1,0,1,0),(33,1,0,1,0),(34,1,0,1,0),(35,1,0,0,0),(36,1,0,0,0),(37,1,0,0,0),(38,1,0,0,0),(39,1,0,0,0),(40,1,0,0,0),(41,1,0,0,0),(42,1,0,0,0),(43,1,1,1,1),(44,1,1,1,1),(45,1,1,1,1),(46,1,1,1,1),(47,1,1,1,1),(48,1,1,1,1),(49,1,1,1,1),(50,1,1,1,1),(51,1,1,1,1),(52,1,1,1,1),(53,1,1,1,1),(54,1,1,1,1),(55,1,1,1,1),(56,1,1,1,1),(57,1,1,1,1),(58,1,1,1,1),(59,1,1,1,1),(60,1,1,1,1),(61,1,1,1,1),(62,1,1,1,1),(63,1,1,1,1),(64,1,1,1,1),(65,1,1,1,1),(66,1,1,1,1),(67,1,1,1,1),(68,1,1,1,1),(69,1,1,1,1),(70,1,1,1,1),(71,1,1,1,1),(72,1,1,1,1),(73,1,1,1,1),(74,1,1,1,1),(75,1,1,1,1),(76,1,1,1,1),(77,1,0,1,0),(78,1,1,1,1),(79,1,1,0,0),(80,1,1,0,0),(81,1,1,0,0),(82,1,1,0,0),(83,1,1,0,0),(84,1,1,0,0),(85,1,1,0,0);
/*!40000 ALTER TABLE `monitoring_station_videostatus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-08 15:15:13
