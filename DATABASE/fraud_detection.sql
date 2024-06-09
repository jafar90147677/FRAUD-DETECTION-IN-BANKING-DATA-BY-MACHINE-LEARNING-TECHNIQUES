-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 14, 2023 at 12:10 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fraud_detection`
--
CREATE DATABASE IF NOT EXISTS `fraud_detection` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fraud_detection`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user model', 7, 'add_usermodel'),
(26, 'Can change user model', 7, 'change_usermodel'),
(27, 'Can delete user model', 7, 'delete_usermodel'),
(28, 'Can view user model', 7, 'view_usermodel'),
(29, 'Can add user model', 8, 'add_usermodel'),
(30, 'Can change user model', 8, 'change_usermodel'),
(31, 'Can delete user model', 8, 'delete_usermodel'),
(32, 'Can view user model', 8, 'view_usermodel'),
(33, 'Can add dataset model', 9, 'add_datasetmodel'),
(34, 'Can change dataset model', 9, 'change_datasetmodel'),
(35, 'Can delete dataset model', 9, 'delete_datasetmodel'),
(36, 'Can view dataset model', 9, 'view_datasetmodel'),
(37, 'Can add predict', 10, 'add_predict'),
(38, 'Can change predict', 10, 'change_predict'),
(39, 'Can delete predict', 10, 'delete_predict'),
(40, 'Can view predict', 10, 'view_predict');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'mainapp', 'usermodel'),
(8, 'userapp', 'usermodel'),
(9, 'adminapp', 'datasetmodel'),
(10, 'adminapp', 'predict');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-03-21 09:48:02.540667'),
(2, 'auth', '0001_initial', '2023-03-21 09:48:03.253749'),
(3, 'admin', '0001_initial', '2023-03-21 09:48:03.436417'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-03-21 09:48:03.447176'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-03-21 09:48:03.458176'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-03-21 09:48:03.528364'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-03-21 09:48:03.565317'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-03-21 09:48:03.599536'),
(9, 'auth', '0004_alter_user_username_opts', '2023-03-21 09:48:03.611531'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-03-21 09:48:03.769847'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-03-21 09:48:03.775271'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-03-21 09:48:03.785268'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-03-21 09:48:03.823994'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-03-21 09:48:03.857864'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-03-21 09:48:03.891858'),
(16, 'auth', '0011_update_proxy_permissions', '2023-03-21 09:48:03.902807'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-03-21 09:48:03.961014'),
(18, 'mainapp', '0001_initial', '2023-03-21 09:48:03.983597'),
(19, 'mainapp', '0002_alter_mainmodel_table', '2023-03-21 09:48:03.995603'),
(20, 'mainapp', '0003_rename_mainmodel_usermodel', '2023-03-21 09:48:04.016604'),
(21, 'mainapp', '0004_alter_usermodel_table', '2023-03-21 09:48:04.030605'),
(22, 'sessions', '0001_initial', '2023-03-21 09:48:04.073244'),
(23, 'mainapp', '0005_delete_usermodel', '2023-03-21 09:49:13.621955'),
(24, 'userapp', '0001_initial', '2023-03-21 09:49:37.012003'),
(25, 'userapp', '0002_rename_sno_usermodel_user_id_usermodel_user_status', '2023-03-21 12:23:35.810124'),
(26, 'userapp', '0003_alter_usermodel_address', '2023-03-21 12:52:47.960357'),
(27, 'adminapp', '0001_initial', '2023-03-25 07:17:24.899707'),
(28, 'adminapp', '0002_rename_filesize_datasetmodel_file_size', '2023-03-25 08:29:52.175651'),
(29, 'adminapp', '0003_alter_datasetmodel_file_size', '2023-03-25 09:07:09.762397'),
(30, 'adminapp', '0004_alter_datasetmodel_file_size', '2023-03-25 09:07:09.798950'),
(31, 'adminapp', '0005_alter_datasetmodel_file_size', '2023-03-25 09:07:09.833196'),
(32, 'adminapp', '0006_alter_datasetmodel_file_size', '2023-03-25 09:07:09.867130'),
(33, 'adminapp', '0007_alter_datasetmodel_file_size', '2023-03-25 09:07:09.923588'),
(34, 'adminapp', '0008_alter_datasetmodel_file_size', '2023-03-25 09:07:09.957758'),
(35, 'adminapp', '0009_alter_datasetmodel_file_size', '2023-03-25 09:15:23.870846'),
(36, 'adminapp', '0010_datasetmodel_ad_accuracy_datasetmodel_ad_algo_and_more', '2023-04-10 10:46:21.125320'),
(37, 'adminapp', '0011_remove_datasetmodel_file_size', '2023-04-11 06:11:15.363175'),
(38, 'adminapp', '0012_rename_user_id_datasetmodel_data_id_and_more', '2023-04-11 08:31:26.004276'),
(39, 'adminapp', '0013_predict', '2023-04-12 07:22:23.602159'),
(40, 'adminapp', '0014_delete_predict', '2023-04-12 08:39:45.931507'),
(41, 'adminapp', '0015_predict', '2023-04-12 08:40:23.262663'),
(42, 'adminapp', '0016_predict_newbalancedest_predict_newbalanceorig_and_more', '2023-04-12 08:42:55.039126'),
(43, 'adminapp', '0017_rename_id_predict_predict_id', '2023-04-12 09:36:52.381717'),
(44, 'adminapp', '0018_predict_amount', '2023-04-12 11:07:10.891424'),
(45, 'userapp', '0004_alter_usermodel_options', '2023-04-13 06:46:02.897420');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('c1efer1e67bsdgormdflv8et64c0i3l2', 'eyJpZCI6Mn0:1pnHvy:9dm-7kFwZ8vhzd_2WiclCi-FqpSGLe1HZkiif1dXjds', '2023-04-28 11:49:42.343088');

-- --------------------------------------------------------

--
-- Table structure for table `predict form data`
--

DROP TABLE IF EXISTS `predict form data`;
CREATE TABLE IF NOT EXISTS `predict form data` (
  `predict_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `result` varchar(100) NOT NULL,
  `newbalanceDest` double DEFAULT NULL,
  `newbalanceOrig` double DEFAULT NULL,
  `oldbalanceDest` double DEFAULT NULL,
  `oldbalanceOrg` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`predict_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `predict form data`
--

INSERT INTO `predict form data` (`predict_id`, `type`, `result`, `newbalanceDest`, `newbalanceOrig`, `oldbalanceDest`, `oldbalanceOrg`, `amount`) VALUES
(14, '[1]', 'Fake', 0, 0, 0, 0, 1100),
(2, '[1]', 'Fake', 0, 0, 0, 1100, NULL),
(3, '[1]', 'Fake', 0, 0, 0, 1100, NULL),
(4, '[4]', 'Genuine', 14000, 7000, 12000, 5000, NULL),
(5, '[4]', 'Genuine', 14000, 7000, 12000, 5000, NULL),
(6, '[4]', 'Genuine', 14000, 7000, 12000, 5000, NULL),
(7, '[4]', 'Genuine', 2000, 7000, 0, 5000, NULL),
(8, '[4]', 'Fake', 2000, 0, 0, 0, NULL),
(9, '[1]', 'Fake', 2559208.13, 0, 2466124.85, 93083.27, NULL),
(10, '[0]', 'Genuine', 2460090.55, 1581629.42, 2713220.48, 1328499.49, NULL),
(11, '[0]', 'Genuine', 0, 0, 0, 0, NULL),
(12, '[3]', 'Genuine', 0, 4053.13, 0, 5769.17, NULL),
(13, '[3]', 'Genuine', 0, 4053.13, 0, 5769.17, 1716.05),
(15, '[3]', 'Genuine', 0, 0, 0, 500, 100),
(16, '[3]', 'Genuine', 0, 16374.82, 0, 19853, 3478.18),
(17, '[1]', 'Fake', 2424878.87, 0, 835115.25, 1589763.63, 1589763.63),
(18, '[1]', 'Genuine', 2607246.37, 0, 2482527.99, 0, 124718.38),
(19, '[1]', 'Fake', 0, 0, 0, 843174.04, 843174.04),
(20, '[3]', 'Genuine', 0, 0, 0, 0, 4752.56);

-- --------------------------------------------------------

--
-- Table structure for table `upload dataset`
--

DROP TABLE IF EXISTS `upload dataset`;
CREATE TABLE IF NOT EXISTS `upload dataset` (
  `data_id` int(11) NOT NULL AUTO_INCREMENT,
  `dataset` varchar(100) NOT NULL,
  `date_time` datetime(6) NOT NULL,
  `ad_accuracy` double DEFAULT NULL,
  `ad_algo` varchar(500) DEFAULT NULL,
  `ad_f1_score` double DEFAULT NULL,
  `ad_precision` double DEFAULT NULL,
  `ad_recall` double DEFAULT NULL,
  `lr_accuracy` double DEFAULT NULL,
  `lr_algo` varchar(500) DEFAULT NULL,
  `lr_f1_score` double DEFAULT NULL,
  `lr_precision` double DEFAULT NULL,
  `lr_recall` double DEFAULT NULL,
  `mnb_accuracy` double DEFAULT NULL,
  `mnb_algo` varchar(500) DEFAULT NULL,
  `mnb_f1_score` double DEFAULT NULL,
  `mnb_precision` double DEFAULT NULL,
  `mnb_recall` double DEFAULT NULL,
  PRIMARY KEY (`data_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upload dataset`
--

INSERT INTO `upload dataset` (`data_id`, `dataset`, `date_time`, `ad_accuracy`, `ad_algo`, `ad_f1_score`, `ad_precision`, `ad_recall`, `lr_accuracy`, `lr_algo`, `lr_f1_score`, `lr_precision`, `lr_recall`, `mnb_accuracy`, `mnb_algo`, `mnb_f1_score`, `mnb_precision`, `mnb_recall`) VALUES
(22, 'media/dataset/fraud_detection_hggm07p.csv', '2023-04-14 07:19:09.825143', 0.9712993564098104, 'ADA Boost', 0.9649682498971024, 0.9662387351357116, 0.9637206198233874, 0.9116368064011132, 'Logistic Regression', 0.8989790858289597, 0.9304601634108913, 0.8816786885073655, 0.6968168377109062, 'Multinomial Naive Bayes', 0.683340325090644, 0.7448482316903369, 0.7000990696123817),
(21, 'media/dataset/fraud_detection_SFFZ9w2.csv', '2023-04-14 06:51:25.292953', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'media/dataset/fraud_detection_mOB1L2R.csv', '2023-04-14 06:51:03.877633', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'media/dataset/fraud_detection_3CXX9rl.csv', '2023-04-10 11:38:25.327561', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'media/dataset/fraud_detection_IleC6Yb.csv', '2023-04-13 06:48:08.526017', 0.9712993564098104, 'ADA Boost', 0.9649682498971024, 0.9662387351357116, 0.9637206198233874, 0.9116368064011132, 'Logistic Regression', 0.8989790858289597, 0.9304601634108913, 0.8816786885073655, 0.6968168377109062, 'Multinomial Naive Bayes', 0.683340325090644, 0.7448482316903369, 0.7000990696123817),
(23, 'media/dataset/fraud_detection_Yq4SHq2.csv', '2023-04-14 11:24:37.683256', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'media/dataset/fraud_detection_XV75Ccu.csv', '2023-04-14 11:29:38.319736', 0.9712993564098104, 'ADA Boost', 0.9649682498971024, 0.9662387351357116, 0.9637206198233874, 0.9116368064011132, 'Logistic Regression', 0.8989790858289597, 0.9304601634108913, 0.8816786885073655, 0.6968168377109062, 'Multinomial Naive Bayes', 0.683340325090644, 0.7448482316903369, 0.7000990696123817);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
CREATE TABLE IF NOT EXISTS `user_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `password` varchar(25) NOT NULL,
  `image` varchar(100) NOT NULL,
  `user_status` varchar(10) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `name`, `email`, `phone`, `address`, `password`, `image`, `user_status`) VALUES
(1, 'Kath', 'user33@gmail.com', '123456787', 'Kolkat', '0000', 'media/user/hyundai_n_vision_74_2022_4k-3840x2160.jpg', 'accepted'),
(2, 'John Doe', 'john@gmail.com', '9234567895', 'USA', '0000', 'media/user/lion.jpg', 'accepted'),
(3, 'F1234', 'userr@gmail.com', '1234567895', 'Hyd', '0000', 'media/user/person_1.jpg', 'rejected'),
(4, 'User1', 'user1@gmail.com', '1234567895', 'Ranchi', '0000', 'media/user/person_6.jpg', 'pending'),
(5, 'user2', 'user2@gmail.com', '1234567895', 'Mumbai', '0000', 'media/user/person_5.jpg', 'pending'),
(8, 'ABCD', 'user4@gmail.com', '1234567895', 'Delhi', '0000', 'media/user/person_3.jpg', 'pending');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
