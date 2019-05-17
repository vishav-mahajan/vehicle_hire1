-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.48 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5222
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for vehicle_db
CREATE DATABASE IF NOT EXISTS `vehicle_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `vehicle_db`;

-- Dumping structure for table vehicle_db.adminapp_mysite_admin
CREATE TABLE IF NOT EXISTS `adminapp_mysite_admin` (
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(225) NOT NULL,
  `admin_password` varchar(20) NOT NULL,
  `admin_image` varchar(255) DEFAULT NULL,
  `admin_login_time` varchar(255) NOT NULL,
  `admin_logout_time` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vehicle_db.adminapp_mysite_admin: ~0 rows (approximately)
/*!40000 ALTER TABLE `adminapp_mysite_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminapp_mysite_admin` ENABLE KEYS */;

-- Dumping structure for table vehicle_db.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vehicle_db.auth_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Dumping structure for table vehicle_db.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vehicle_db.auth_group_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Dumping structure for table vehicle_db.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

-- Dumping data for table vehicle_db.auth_permission: ~51 rows (approximately)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can add permission', 2, 'add_permission'),
	(5, 'Can change permission', 2, 'change_permission'),
	(6, 'Can delete permission', 2, 'delete_permission'),
	(7, 'Can add group', 3, 'add_group'),
	(8, 'Can change group', 3, 'change_group'),
	(9, 'Can delete group', 3, 'delete_group'),
	(10, 'Can add user', 4, 'add_user'),
	(11, 'Can change user', 4, 'change_user'),
	(12, 'Can delete user', 4, 'delete_user'),
	(13, 'Can add content type', 5, 'add_contenttype'),
	(14, 'Can change content type', 5, 'change_contenttype'),
	(15, 'Can delete content type', 5, 'delete_contenttype'),
	(16, 'Can add session', 6, 'add_session'),
	(17, 'Can change session', 6, 'change_session'),
	(18, 'Can delete session', 6, 'delete_session'),
	(19, 'Can add contact_us', 7, 'add_contact_us'),
	(20, 'Can change contact_us', 7, 'change_contact_us'),
	(21, 'Can delete contact_us', 7, 'delete_contact_us'),
	(22, 'Can add my site user', 8, 'add_mysiteuser'),
	(23, 'Can change my site user', 8, 'change_mysiteuser'),
	(24, 'Can delete my site user', 8, 'delete_mysiteuser'),
	(25, 'Can add user_role', 9, 'add_user_role'),
	(26, 'Can change user_role', 9, 'change_user_role'),
	(27, 'Can delete user_role', 9, 'delete_user_role'),
	(28, 'Can add vehicle company', 10, 'add_vehiclecompany'),
	(29, 'Can change vehicle company', 10, 'change_vehiclecompany'),
	(30, 'Can delete vehicle company', 10, 'delete_vehiclecompany'),
	(31, 'Can add vehicles details', 11, 'add_vehiclesdetails'),
	(32, 'Can change vehicles details', 11, 'change_vehiclesdetails'),
	(33, 'Can delete vehicles details', 11, 'delete_vehiclesdetails'),
	(34, 'Can add vehicle categories', 12, 'add_vehiclecategories'),
	(35, 'Can change vehicle categories', 12, 'change_vehiclecategories'),
	(36, 'Can delete vehicle categories', 12, 'delete_vehiclecategories'),
	(37, 'Can add login_details', 13, 'add_login_details'),
	(38, 'Can change login_details', 13, 'change_login_details'),
	(39, 'Can delete login_details', 13, 'delete_login_details'),
	(40, 'Can add my site_ admin', 14, 'add_mysite_admin'),
	(41, 'Can change my site_ admin', 14, 'change_mysite_admin'),
	(42, 'Can delete my site_ admin', 14, 'delete_mysite_admin'),
	(43, 'Can add booking_details', 15, 'add_booking_details'),
	(44, 'Can change booking_details', 15, 'change_booking_details'),
	(45, 'Can delete booking_details', 15, 'delete_booking_details'),
	(46, 'Can add PayPal IPN', 16, 'add_paypalipn'),
	(47, 'Can change PayPal IPN', 16, 'change_paypalipn'),
	(48, 'Can delete PayPal IPN', 16, 'delete_paypalipn'),
	(49, 'Can add payment_token', 17, 'add_payment_token'),
	(50, 'Can change payment_token', 17, 'change_payment_token'),
	(51, 'Can delete payment_token', 17, 'delete_payment_token');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Dumping structure for table vehicle_db.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table vehicle_db.auth_user: ~1 rows (approximately)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$100000$B6bRdntAI7dH$qRujzd1z8hOypUy0pbonPIeYyh85qb3vzbSsNtERSVE=', '2019-05-09 07:45:02', 1, 'admin', '', '', 'vishav@live.com', 1, 1, '2019-04-06 05:34:37');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Dumping structure for table vehicle_db.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vehicle_db.auth_user_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Dumping structure for table vehicle_db.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vehicle_db.auth_user_user_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Dumping structure for table vehicle_db.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table vehicle_db.django_admin_log: ~13 rows (approximately)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2019-04-06 05:35:19', '1', 'User_role object (1)', 1, '[{"added": {}}]', 9, 1),
	(2, '2019-04-06 05:35:22', '2', 'User_role object (2)', 1, '[{"added": {}}]', 9, 1),
	(3, '2019-04-06 05:35:27', '3', 'User_role object (3)', 1, '[{"added": {}}]', 9, 1),
	(4, '2019-04-06 05:35:35', '4', 'User_role object (4)', 1, '[{"added": {}}]', 9, 1),
	(5, '2019-04-16 10:14:20', '8', 'VehicleCategories object (8)', 3, '', 12, 1),
	(6, '2019-04-16 10:14:20', '7', 'VehicleCategories object (7)', 3, '', 12, 1),
	(7, '2019-04-16 10:14:20', '6', 'VehicleCategories object (6)', 3, '', 12, 1),
	(8, '2019-04-16 10:14:20', '5', 'VehicleCategories object (5)', 3, '', 12, 1),
	(9, '2019-04-16 10:15:04', '9', 'VehicleCategories object (9)', 1, '[{"added": {}}]', 12, 1),
	(10, '2019-04-16 10:15:10', '9', 'VehicleCategories object (9)', 2, '[]', 12, 1),
	(11, '2019-04-26 03:46:35', 'vishavmahajan96@gmail.com', 'vishavmahajan96@gmail.com', 1, '[{"added": {}}]', 8, 1),
	(12, '2019-04-26 03:47:09', 'vishavmahajan96@gmail.com', 'vishavmahajan96@gmail.com', 2, '[{"changed": {"fields": ["registered_on"]}}]', 8, 1),
	(13, '2019-04-26 03:47:23', 'vishavmahajan96@gmail.com', 'vishavmahajan96@gmail.com', 2, '[]', 8, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Dumping structure for table vehicle_db.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table vehicle_db.django_content_type: ~17 rows (approximately)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(14, 'adminapp', 'mysite_admin'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(15, 'front_app', 'booking_details'),
	(7, 'front_app', 'contact_us'),
	(13, 'front_app', 'login_details'),
	(8, 'front_app', 'mysiteuser'),
	(17, 'front_app', 'payment_token'),
	(9, 'front_app', 'user_role'),
	(16, 'ipn', 'paypalipn'),
	(12, 'managerapp', 'vehiclecategories'),
	(10, 'managerapp', 'vehiclecompany'),
	(11, 'managerapp', 'vehiclesdetails'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Dumping structure for table vehicle_db.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

-- Dumping data for table vehicle_db.django_migrations: ~62 rows (approximately)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2019-04-05 18:21:30'),
	(2, 'auth', '0001_initial', '2019-04-05 18:21:31'),
	(3, 'admin', '0001_initial', '2019-04-05 18:21:31'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2019-04-05 18:21:31'),
	(5, 'contenttypes', '0002_remove_content_type_name', '2019-04-05 18:21:31'),
	(6, 'auth', '0002_alter_permission_name_max_length', '2019-04-05 18:21:31'),
	(7, 'auth', '0003_alter_user_email_max_length', '2019-04-05 18:21:31'),
	(8, 'auth', '0004_alter_user_username_opts', '2019-04-05 18:21:31'),
	(9, 'auth', '0005_alter_user_last_login_null', '2019-04-05 18:21:31'),
	(10, 'auth', '0006_require_contenttypes_0002', '2019-04-05 18:21:31'),
	(11, 'auth', '0007_alter_validators_add_error_messages', '2019-04-05 18:21:31'),
	(12, 'auth', '0008_alter_user_username_max_length', '2019-04-05 18:21:31'),
	(13, 'auth', '0009_alter_user_last_name_max_length', '2019-04-05 18:21:31'),
	(14, 'front_app', '0001_initial', '2019-04-05 18:21:32'),
	(15, 'sessions', '0001_initial', '2019-04-05 18:21:32'),
	(16, 'managerapp', '0001_initial', '2019-04-05 18:44:33'),
	(17, 'managerapp', '0002_auto_20190406_0029', '2019-04-05 19:00:00'),
	(18, 'managerapp', '0003_auto_20190406_0032', '2019-04-05 19:02:15'),
	(19, 'front_app', '0002_auto_20190411_1002', '2019-04-11 04:32:50'),
	(20, 'front_app', '0003_auto_20190411_1434', '2019-04-11 09:04:38'),
	(21, 'front_app', '0004_auto_20190411_1435', '2019-04-11 09:05:32'),
	(22, 'managerapp', '0004_vehiclesdetails_vehicle_model', '2019-04-11 12:39:25'),
	(23, 'front_app', '0005_auto_20190412_1138', '2019-04-12 06:08:54'),
	(24, 'front_app', '0006_auto_20190413_1425', '2019-04-13 08:55:29'),
	(25, 'adminapp', '0001_initial', '2019-04-16 17:20:17'),
	(26, 'managerapp', '0005_auto_20190416_2249', '2019-04-16 17:20:17'),
	(27, 'managerapp', '0006_auto_20190416_2251', '2019-04-16 17:21:27'),
	(28, 'front_app', '0007_mysiteuser_isverified', '2019-04-16 18:18:54'),
	(29, 'front_app', '0008_auto_20190416_2351', '2019-04-16 18:21:10'),
	(30, 'front_app', '0009_mysiteuser_user_token', '2019-04-17 06:18:39'),
	(31, 'front_app', '0010_booking_details', '2019-04-22 05:11:54'),
	(32, 'front_app', '0011_booking_details_vehicle_info', '2019-04-25 16:45:53'),
	(33, 'managerapp', '0007_auto_20190425_2308', '2019-04-25 17:38:31'),
	(34, 'managerapp', '0008_auto_20190425_2347', '2019-04-25 18:17:29'),
	(35, 'managerapp', '0009_auto_20190425_2352', '2019-04-25 18:23:04'),
	(36, 'managerapp', '0010_auto_20190425_2357', '2019-04-25 18:27:10'),
	(37, 'front_app', '0012_auto_20190501_1258', '2019-05-01 07:28:40'),
	(38, 'front_app', '0013_booking_details_booking_date', '2019-05-01 11:14:38'),
	(39, 'front_app', '0014_booking_details_cancel_token', '2019-05-02 08:15:55'),
	(40, 'front_app', '0015_booking_details_is_active', '2019-05-02 09:34:01'),
	(41, 'front_app', '0016_booking_details_cancellation_time', '2019-05-02 09:35:06'),
	(42, 'front_app', '0017_auto_20190503_1024', '2019-05-03 04:54:15'),
	(43, 'front_app', '0018_booking_details_return_date', '2019-05-03 17:49:29'),
	(44, 'front_app', '0019_remove_booking_details_return_date', '2019-05-04 03:24:30'),
	(45, 'front_app', '0020_booking_details_return_date', '2019-05-04 03:26:54'),
	(46, 'front_app', '0021_auto_20190504_0859', '2019-05-04 03:29:45'),
	(47, 'front_app', '0022_auto_20190504_0900', '2019-05-04 03:30:19'),
	(48, 'front_app', '0023_auto_20190504_0931', '2019-05-04 04:01:52'),
	(49, 'front_app', '0024_auto_20190504_1405', '2019-05-04 08:35:43'),
	(50, 'front_app', '0025_booking_details_total_fine', '2019-05-04 10:41:55'),
	(51, 'front_app', '0026_booking_details_earnings', '2019-05-07 09:04:07'),
	(52, 'managerapp', '0011_vehiclesdetails_role_id', '2019-05-09 05:43:44'),
	(53, 'ipn', '0001_initial', '2019-05-15 04:13:34'),
	(54, 'ipn', '0002_paypalipn_mp_id', '2019-05-15 04:13:34'),
	(55, 'ipn', '0003_auto_20141117_1647', '2019-05-15 04:13:34'),
	(56, 'ipn', '0004_auto_20150612_1826', '2019-05-15 04:13:36'),
	(57, 'ipn', '0005_auto_20151217_0948', '2019-05-15 04:13:37'),
	(58, 'ipn', '0006_auto_20160108_1112', '2019-05-15 04:13:37'),
	(59, 'ipn', '0007_auto_20160219_1135', '2019-05-15 04:13:37'),
	(60, 'ipn', '0008_auto_20181128_1032', '2019-05-15 04:13:37'),
	(61, 'front_app', '0027_payment_token', '2019-05-16 04:59:49'),
	(62, 'front_app', '0028_booking_details_refunded', '2019-05-16 14:54:14');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Dumping structure for table vehicle_db.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vehicle_db.django_session: ~87 rows (approximately)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('12xk3b7t0lns2qsz6fgp9neii2re7k3w', 'M2U2Y2ZlNTQ1MTJmYmI1MjdjMDMzMzFiYzdhZDIyY2M1OGY5MjZkYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJ2aXNoYXZAbGl2ZS5jb20iLCJyb2xlX2lkIjoxLCJuYW1lIjoiVmlzaGF2IE1haGFqYW4iLCJyb2xlbmFtZSI6Im1hbmFnZXIiLCJpbWFnZSI6IklNR18xMjAyLmpwZyIsImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZSwiaWQiOiIifQ==', '2019-05-23 10:18:20'),
	('1u3ey4dtipmfwzusbezkszy15t5l4264', 'MTUwYjJiMDNkMjcwNmUzMGQ2ZDRhZTljYjU0ZWUzZDcwMDY5NGE2NDp7ImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZSwiYXV0aGVudGljYXRlIjp0cnVlLCJlbWFpbCI6InZpc2hhdkBsaXZlLmNvbSIsInJvbGVfaWQiOjEsIm5hbWUiOiJWaXNoYXYgTWFoYWphbiIsInJvbGVuYW1lIjoibWFuYWdlciIsImltYWdlIjoiSU1HXzEyMDIuanBnIn0=', '2019-05-23 08:33:35'),
	('1y11v2cry5o6f2tbotjofuj4as1azp1q', 'ZTBjODY1ZGM5YjVkZmY1ODI2YmQzM2JkYTUxZjZlZjMyOTRmNWVlMjp7ImF1dGhlbnRpY2F0ZSI6ZmFsc2UsImVtYWlsIjoidmlzaGF2bWFoYWphbkBnbWFpbC5jb20iLCJyb2xlX2lkIjo0fQ==', '2019-04-29 04:14:04'),
	('3kc9jd7vec4axhv5qhi448cr63mcyxnq', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-10 18:03:19'),
	('3ykhzj3rcruifrhuwn3z04mn8gb9p3jd', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-10 05:48:31'),
	('4mxwja26xcasbt4bgwlzag7zq8euin7b', 'OGU5NDZlNzg3YjM5YzQ4OGE2OTQwNTE1ODE3YTA0Y2UyMjNkZjU3Nzp7ImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZX0=', '2019-05-23 08:26:49'),
	('4pzq4h7vqtd3ahxmrpnlfhs063ox1aw5', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-10 17:46:47'),
	('4vtbldmorqfc9s50y0uqyhbjyx1kpdui', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-10 15:57:31'),
	('4w7zo7y2ier3e3xzxxgunwmd2iyc3bj2', 'NzYyODhiNDhlNmE2MGM5NDMwM2YzNmVmNmRjNzY3NzQyNWI4ODBiOTp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJidXNlcjFAZ21haWwuY29tIiwicm9sZV9pZCI6NH0=', '2019-04-10 08:28:26'),
	('55o9bbr814wmiu53f3obs1lpuvmhxqla', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-10 18:26:51'),
	('5ct4inknm3dknud4y9bihfr2kudtbwuh', 'ZGI2ZmEwNWI2ZjQwZmYyM2M5N2QzNTkyMDNkZDQ4Y2RkMjUwNjg5NDp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJ2aXNoYXZtYWhhamFuOTZAZ21haWwuY29tIiwicm9sZV9pZCI6Mn0=', '2019-05-14 09:31:03'),
	('5o2yzy0bfj8tsra1u1s9cc4fkrs5fsem', 'N2MyN2MyNjdkNWI5NTA4YTdlNjRiNTQ0MDE5ZjExZmQzZWEyY2IzZjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJ2aXNoYXZtYWhhamFuQGdtYWlsLmNvbSIsInJvbGVfaWQiOjF9', '2019-05-14 18:05:48'),
	('5sqawkez2d3o2anl32vnck9wa3smfk71', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-10 17:22:49'),
	('7098o1h0uluv04ej1lfie1fpjhuqx3cf', 'OGMxODM2MDlmYzdiYTI5MzkwODE4ZjE2Njg1NTJjZDgyZTQ0ZDZjNzp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJ2aXNoYXYubWFoYWphbkByZWRpZmZtYWlsLmNvbSIsInJvbGVfaWQiOjQsIm5hbWUiOiJWaXNoYXYgTWFoYWphbiIsInJvbGVuYW1lIjoiYnVzaW5lc3NfdXNlciIsImltYWdlIjoiSm9obm5pZS1XYWxrZXItSEQtRGVza3RvcC5qcGciLCJkYXRlX2dyZWF0ZXIiOmZhbHNlLCJkdXJhdGlvbiI6ZmFsc2UsImludm9pY2UiOiIiLCJ2ZWhpY2xlX25hbWUiOiIiLCJ2ZWhpY2xlX2Rlc2NyaXB0aW9uIjoiIiwidmVoaWNsZV9pZCI6IiIsInN0YXJ0X2RhdGUiOiIiLCJjYXRlZ29yeSI6IiIsInVzZXJfbmFtZSI6IiIsInNlbGxlciI6IiIsImVuZF9kYXRlIjoiIiwiYW10IjoiIiwidG90YWwiOiIiLCJib29raW5nX2RhdGUiOiIiLCJjYW5jZWwiOjEwMDAsImNhbmNlbGxlZCI6ZmFsc2UsIm5vdF9jYW5jZWwiOmZhbHNlLCJpZCI6IiJ9', '2019-05-31 06:35:15'),
	('75ahlqlzwdyk3b5tnz209fd9zfq0c222', 'NWU4NzcxYTE5Mzc4ZTNiZmNiMjhkYjY0NmQ5NGZiZTY4YmYwYmJmNzp7ImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZSwiYXV0aGVudGljYXRlIjp0cnVlLCJlbWFpbCI6InZpc2hhdm1haGFqYW5AZ21haWwuY29tIiwicm9sZV9pZCI6MywibmFtZSI6IlZpc2hhdmplZXQgTWFoYWphbiIsInJvbGVuYW1lIjoidXNlciIsImltYWdlIjoiOS5qcGciLCJpbnZvaWNlIjo1MzgzNDI3LCJ2ZWhpY2xlX25hbWUiOiJIeXVuZGFpIGkyMCIsInZlaGljbGVfZGVzY3JpcHRpb24iOiJpMjAiLCJ2ZWhpY2xlX2lkIjozLCJzdGFydF9kYXRlIjoiMjAxOS0wNS0wNyAxMjowMDowMCIsImNhdGVnb3J5IjoiSGF0Y2hiYWNrIiwidXNlcl9uYW1lIjoiVmlzaGF2amVldCBNYWhhamFuIiwic2VsbGVyIjoidmlzaGF2QGxpdmUuY29tIiwiZW5kX2RhdGUiOiIyMDE5LTA1LTEzIDEyOjE1OjAwIiwiYW10Ijo4NjUwLCJ0b3RhbCI6MTg2NTAsImJvb2tpbmdfZGF0ZSI6IjIwMTktMDUtMDUgMTE6NTI6NTUifQ==', '2019-05-19 06:22:55'),
	('7dfaw7bftggbqi2w2zgxvkzh8i2wixcq', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-10 07:15:52'),
	('7jwbxfgxsd7u9tgyce4ni51dh7fq74jv', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-10 17:17:14'),
	('7u1apaoso5bvcprgflcv20n7m3m7kjf2', 'ZmJkYmQ0OTU1YmU0YzZmM2RmMTFlYmMzMzVlNTdjZGRiYmZlODc5OTp7ImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZSwiaW52b2ljZSI6IiIsInZlaGljbGVfbmFtZSI6IiIsInZlaGljbGVfZGVzY3JpcHRpb24iOiIiLCJ2ZWhpY2xlX2lkIjoiIiwic3RhcnRfZGF0ZSI6IiIsImNhdGVnb3J5IjoiIiwidXNlcl9uYW1lIjoiIiwic2VsbGVyIjoiIiwiZW5kX2RhdGUiOiIiLCJhbXQiOiIiLCJ0b3RhbCI6IiIsImJvb2tpbmdfZGF0ZSI6IiIsImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJkYWxqaXRzaW5naG5ldG1heEBnbWFpbC5jb20iLCJyb2xlX2lkIjozLCJuYW1lIjoiRGFsaml0IFNpbmdoIiwicm9sZW5hbWUiOiJ1c2VyIiwiaW1hZ2UiOiJQZW5ndWlucy5qcGcifQ==', '2019-05-31 08:27:49'),
	('8an985ht5lsnxejn79uu5wr6is18w8l7', 'NTE0NTkwMmY2ODYxMTFhZjEyMDgxY2E2ZWYzY2M3YTA4ODg1M2NiMDp7ImF1dGhlbnRpY2F0ZSI6ZmFsc2UsImVtYWlsIjoibWFuYWdlcjJAZ21haWwuY29tIiwicm9sZV9pZCI6MX0=', '2019-04-10 15:10:05'),
	('8jj5brhmqvg451r5sfsx661a1ga08v74', 'N2MyN2MyNjdkNWI5NTA4YTdlNjRiNTQ0MDE5ZjExZmQzZWEyY2IzZjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJ2aXNoYXZtYWhhamFuQGdtYWlsLmNvbSIsInJvbGVfaWQiOjF9', '2019-05-09 16:47:16'),
	('8qicjtalfg1rbs1bq86aje28y65ntg93', 'N2MyN2MyNjdkNWI5NTA4YTdlNjRiNTQ0MDE5ZjExZmQzZWEyY2IzZjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJ2aXNoYXZtYWhhamFuQGdtYWlsLmNvbSIsInJvbGVfaWQiOjF9', '2019-05-14 14:27:09'),
	('b43f6nsefmqrtdsebi6vlji3zm3cpxnc', 'NWJiNmFlMTI5MjExODE4ZjEwOGQxYWNjZjI1YWIwNmQ5M2RkY2E4NTp7ImF1dGhlbnRpY2F0ZSI6ZmFsc2UsImVtYWlsIjoidmlzaGF2bWFoYWphbkBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-05-01 20:17:06'),
	('b9tir9p31zq71j5v5wmh3kv32xnkyqdh', 'NjA2M2VmODIzMTY4NDUwMWQ0NTU5Zjk0N2FmMTVhMGJmYWUxMmY5ODp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMkBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-10 07:24:17'),
	('bj9uhaw2u8dz8asets2teljq5q0rgk4k', 'NjA2M2VmODIzMTY4NDUwMWQ0NTU5Zjk0N2FmMTVhMGJmYWUxMmY5ODp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMkBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-10 08:20:26'),
	('br491hk8k31o4o528yh61qs5rvkm0mwv', 'Y2I3MGYwMzAwNTU2YjQ2Y2I5YmNjNTQ0MDJhNjg0ZWQzZTgzNjRjZTp7ImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZSwiYXV0aGVudGljYXRlIjp0cnVlLCJlbWFpbCI6InZpc2hhdm1haGFqYW5AZ21haWwuY29tIiwicm9sZV9pZCI6MywibmFtZSI6IlZpc2hhdmplZXQgTWFoYWphbiIsInJvbGVuYW1lIjoidXNlciIsImltYWdlIjoiOS5qcGciLCJjYW5jZWwiOjEwMDAwLCJjYW5jZWxsZWQiOmZhbHNlLCJpZCI6IiIsImludm9pY2UiOiIiLCJ2ZWhpY2xlX25hbWUiOiIiLCJ2ZWhpY2xlX2Rlc2NyaXB0aW9uIjoiIiwidmVoaWNsZV9pZCI6IiIsInN0YXJ0X2RhdGUiOiIiLCJjYXRlZ29yeSI6IiIsInVzZXJfbmFtZSI6IiIsInNlbGxlciI6IiIsImVuZF9kYXRlIjoiIiwiYW10IjoiIiwidG90YWwiOiIiLCJib29raW5nX2RhdGUiOiIifQ==', '2019-05-23 10:24:04'),
	('brzf28j3chjd1f6sjdvqhis42m8f73dx', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-10 18:09:48'),
	('bturva011jl8smz5m9leazu5g5w1vc00', 'OTMwYzkxNTc3OTc2MjY3ZDlmZjg1NTIwZmMyNjhhOWFkOWEwZjRlYTp7ImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZSwiaW52b2ljZSI6IiIsInZlaGljbGVfbmFtZSI6IiIsInZlaGljbGVfZGVzY3JpcHRpb24iOiIiLCJ2ZWhpY2xlX2lkIjoiIiwic3RhcnRfZGF0ZSI6IiIsImNhdGVnb3J5IjoiIiwidXNlcl9uYW1lIjoiIiwic2VsbGVyIjoiIiwiZW5kX2RhdGUiOiIiLCJhbXQiOiIiLCJ0b3RhbCI6IiIsImJvb2tpbmdfZGF0ZSI6IiIsImF1dGhlbnRpY2F0ZSI6ZmFsc2UsImVtYWlsIjoiIiwicm9sZV9pZCI6IiIsIm5hbWUiOiIiLCJyb2xlbmFtZSI6IiIsImltYWdlIjoiIn0=', '2019-05-31 07:20:15'),
	('bzxg606x0z69onnke1sgobq5xs8u9qky', 'NzYzZTViYzZjMzM1N2UzOGRmY2I1YTJjMzAwNTg1OTA3Y2IwZTVhMjp7ImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZSwiYXV0aGVudGljYXRlIjp0cnVlLCJlbWFpbCI6InZpc2hhdkBsaXZlLmNvbSIsInJvbGVfaWQiOjEsIm5hbWUiOiJWaXNoYXYgTWFoYWphbiIsInJvbGVuYW1lIjoibWFuYWdlciIsImltYWdlIjoiSU1HXzEyMDIuanBnIiwiaW52b2ljZSI6IiIsInZlaGljbGVfbmFtZSI6IiIsInZlaGljbGVfZGVzY3JpcHRpb24iOiIiLCJ2ZWhpY2xlX2lkIjoiIiwic3RhcnRfZGF0ZSI6IiIsImNhdGVnb3J5IjoiIiwidXNlcl9uYW1lIjoiIiwic2VsbGVyIjoiIiwiZW5kX2RhdGUiOiIiLCJhbXQiOiIiLCJ0b3RhbCI6IiIsImJvb2tpbmdfZGF0ZSI6IiIsImNhbmNlbCI6NTAwMCwiY2FuY2VsbGVkIjpmYWxzZSwibm90X2NhbmNlbCI6ZmFsc2UsImlkIjoiMzI2NzYwODQifQ==', '2019-05-21 18:08:58'),
	('d3lu1qv1ak68qyf8juz6jcqouyx35smo', 'NGMyNTJjNzY3ZjM4MzZmMWM4ZjBjNjcxNDE5M2U4ZDRhMWMyZWRiYzp7ImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZSwiYXV0aGVudGljYXRlIjp0cnVlLCJlbWFpbCI6IjAzOTVhbmtpdGFAZ21haWwuY29tIiwicm9sZV9pZCI6MSwibmFtZSI6IkFua2l0YSBTaGFybWEiLCJyb2xlbmFtZSI6Im1hbmFnZXIiLCJpbWFnZSI6IjI2MjE3My5qcGcifQ==', '2019-05-23 05:28:12'),
	('e5olhdyqemjcjzdp33uw2vl0cy8aynu8', 'OGU5NDZlNzg3YjM5YzQ4OGE2OTQwNTE1ODE3YTA0Y2UyMjNkZjU3Nzp7ImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZX0=', '2019-05-21 17:36:32'),
	('e7p1j4ck32zrls0nn97m88y6wr7pgp3s', 'N2EwMWJhYWMyYTdjNjExMDExZjVkMDcxMDAwY2FkMTU0OTc0MWYzMzp7ImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZSwiYXV0aGVudGljYXRlIjp0cnVlLCJlbWFpbCI6InZpc2hhdkBsaXZlLmNvbSIsInJvbGVfaWQiOjEsIm5hbWUiOiJWaXNoYXYgTWFoYWphbiIsInJvbGVuYW1lIjoibWFuYWdlciIsImltYWdlIjoiSU1HXzEyMDIuanBnIiwiaW52b2ljZSI6NzU1MTg1NywidmVoaWNsZV9uYW1lIjoiVG95b3RhIEZvcnR1bmVyIiwidmVoaWNsZV9kZXNjcmlwdGlvbiI6IkZlZWwgVGhlIFBvd2VyIiwidmVoaWNsZV9pZCI6NSwic3RhcnRfZGF0ZSI6IjIwMTktMDUtMTYgMTU6MDA6MDAiLCJjYXRlZ29yeSI6IlNVViIsInVzZXJfbmFtZSI6IlZpc2hhdiBNYWhhamFuIiwic2VsbGVyIjoidmlzaGF2QGxpdmUuY29tIiwiZW5kX2RhdGUiOiIyMDE5LTA1LTE2IDE1OjE1OjAwIiwiYW10Ijo3NTAsInRvdGFsIjoxMDc1MCwiYm9va2luZ19kYXRlIjoiMjAxOS0wNS0xNSAxNDo1NTo0OCIsImlkIjoiIiwiY2FuY2VsIjoxMDAwMCwiY2FuY2VsbGVkIjpmYWxzZSwibm90X2NhbmNlbCI6ZmFsc2UsInJlZ2lzdGVyZWQiOmZhbHNlfQ==', '2019-05-29 09:26:39'),
	('edwme7aj91tdt8y230n3gwexu1i9bgde', 'N2MyN2MyNjdkNWI5NTA4YTdlNjRiNTQ0MDE5ZjExZmQzZWEyY2IzZjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJ2aXNoYXZtYWhhamFuQGdtYWlsLmNvbSIsInJvbGVfaWQiOjF9', '2019-05-09 17:35:44'),
	('epqik9hhtn6ukx6tv6ra14epcjn6olrx', 'N2MyN2MyNjdkNWI5NTA4YTdlNjRiNTQ0MDE5ZjExZmQzZWEyY2IzZjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJ2aXNoYXZtYWhhamFuQGdtYWlsLmNvbSIsInJvbGVfaWQiOjF9', '2019-05-14 04:35:39'),
	('f9achm2bit16vcvay3ko6f6t8roc1zu7', 'ZGY2Y2IwZDg4NDlhNzhkZjlkYzU0NjM4ODkyN2RmYjY0ZjVkZDEwNjp7ImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZSwiaW52b2ljZSI6IiIsInZlaGljbGVfbmFtZSI6IiIsInZlaGljbGVfZGVzY3JpcHRpb24iOiIiLCJ2ZWhpY2xlX2lkIjoiIiwic3RhcnRfZGF0ZSI6IiIsImNhdGVnb3J5IjoiIiwidXNlcl9uYW1lIjoiIiwic2VsbGVyIjoiIiwiZW5kX2RhdGUiOiIiLCJhbXQiOiIiLCJ0b3RhbCI6IiIsImJvb2tpbmdfZGF0ZSI6IiIsImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiIwMzk1YW5raXRhQGdtYWlsLmNvbSIsInJvbGVfaWQiOjEsIm5hbWUiOiJBbmtpdGEgU2hhcm1hIiwicm9sZW5hbWUiOiJtYW5hZ2VyIiwiaW1hZ2UiOiIyMjQ3QzYwRi1ENDI5LTQzOEEtQkExNy03MjUxMkVGNTJENjEuanBlZyIsImlkIjoiIn0=', '2019-05-31 08:31:49'),
	('fggxm5n584eukd2q0b33pv9u09hkfl36', 'ZGI2ZmEwNWI2ZjQwZmYyM2M5N2QzNTkyMDNkZDQ4Y2RkMjUwNjg5NDp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJ2aXNoYXZtYWhhamFuOTZAZ21haWwuY29tIiwicm9sZV9pZCI6Mn0=', '2019-05-13 04:17:09'),
	('ftdd6ytryn1w6r3452cf3xbwrekw6fwa', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-09 08:51:26'),
	('g1mlfz9drf947ri541h2k6irphqwpygg', 'YzIyM2U0OGRkODAyMjc2NjgyYjk4ZDY0MzNlMjc2ZTdlZmNiZDFlZjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJ2aXNoYXYubWFoYWphbkByZWRpZmZtYWlsLmNvbSIsInJvbGVfaWQiOjQsIm5hbWUiOiJWaXNoYXYgTWFoYWphbiIsInJvbGVuYW1lIjoiYnVzaW5lc3NfdXNlciIsImltYWdlIjoiSm9obm5pZS1XYWxrZXItSEQtRGVza3RvcC5qcGciLCJkYXRlX2dyZWF0ZXIiOmZhbHNlLCJkdXJhdGlvbiI6ZmFsc2UsImNhbmNlbGxlZCI6ZmFsc2UsIm5vdF9jYW5jZWwiOmZhbHNlLCJpbnZvaWNlIjoxMjA2ODE5LCJ2ZWhpY2xlX25hbWUiOiJWb2xrc3dhZ2VuIFBvbG8iLCJ2ZWhpY2xlX2Rlc2NyaXB0aW9uIjoiRmVlbCBUaGUgcmlkZSB3aXRoIHRoZSBOZXcgdm9sa3N3YWdlbiIsInZlaGljbGVfaWQiOjE5LCJzdGFydF9kYXRlIjoiMjAxOS0wNS0wOCAxMzo0NTowMCIsImNhdGVnb3J5IjoiSGF0Y2hiYWNrIiwidXNlcl9uYW1lIjoiVmlzaGF2amVldCBNYWhhamFuIiwic2VsbGVyIjoidmlzaGF2QGxpdmUuY29tIiwiZW5kX2RhdGUiOiIyMDE5LTA1LTA5IDEzOjQ1OjAwIiwiYW10IjoxMjUwLCJ0b3RhbCI6MTEyNTAsImJvb2tpbmdfZGF0ZSI6IjIwMTktMDUtMDggMTM6MzA6NTAiLCJpZCI6IjMzNzY3NTg3NCIsImNhbmNlbCI6MTAwMH0=', '2019-05-22 08:38:59'),
	('g3qod78v23amnzb12iwmnikig4kx3qs8', 'MTUwYjJiMDNkMjcwNmUzMGQ2ZDRhZTljYjU0ZWUzZDcwMDY5NGE2NDp7ImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZSwiYXV0aGVudGljYXRlIjp0cnVlLCJlbWFpbCI6InZpc2hhdkBsaXZlLmNvbSIsInJvbGVfaWQiOjEsIm5hbWUiOiJWaXNoYXYgTWFoYWphbiIsInJvbGVuYW1lIjoibWFuYWdlciIsImltYWdlIjoiSU1HXzEyMDIuanBnIn0=', '2019-05-23 08:50:09'),
	('gc7u102oozsgszgfpb81w9imsl1cgk6n', 'OGU5NDZlNzg3YjM5YzQ4OGE2OTQwNTE1ODE3YTA0Y2UyMjNkZjU3Nzp7ImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZX0=', '2019-05-23 08:25:50'),
	('go4run3dz28ae0ro0ok2jm13la95fa6z', 'OGM0NjBhYjM0NTE0ZmIxMmI2ZWQxYTc2N2Y4MjBkYWI5NzYyNzU5NDp7ImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZSwiYXV0aGVudGljYXRlIjp0cnVlLCJlbWFpbCI6InZpc2hhdm1haGFqYW5AZ21haWwuY29tIiwicm9sZV9pZCI6MywibmFtZSI6IlZpc2hhdmplZXQgTWFoYWphbiIsInJvbGVuYW1lIjoidXNlciIsImltYWdlIjoiOS5qcGcifQ==', '2019-05-19 06:46:12'),
	('gpadqixwn3jvay6s3y94h8pami3uaz1q', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-10 17:35:30'),
	('hefc51qzfy5nw7o5yz8rpn587ukjqtxq', 'N2MyN2MyNjdkNWI5NTA4YTdlNjRiNTQ0MDE5ZjExZmQzZWEyY2IzZjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJ2aXNoYXZtYWhhamFuQGdtYWlsLmNvbSIsInJvbGVfaWQiOjF9', '2019-05-14 04:32:49'),
	('hlzxno1ekvoi811iz6hhnukbxs877kx1', 'ZTBjODY1ZGM5YjVkZmY1ODI2YmQzM2JkYTUxZjZlZjMyOTRmNWVlMjp7ImF1dGhlbnRpY2F0ZSI6ZmFsc2UsImVtYWlsIjoidmlzaGF2bWFoYWphbkBnbWFpbC5jb20iLCJyb2xlX2lkIjo0fQ==', '2019-04-29 15:49:11'),
	('j1gxecwud1bggmgtuooptwg714ar9eri', 'NzYyODhiNDhlNmE2MGM5NDMwM2YzNmVmNmRjNzY3NzQyNWI4ODBiOTp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJidXNlcjFAZ21haWwuY29tIiwicm9sZV9pZCI6NH0=', '2019-04-10 15:42:40'),
	('jgvk0xp7te6ieyoqo1zks2p0ccw7yfot', 'N2MyN2MyNjdkNWI5NTA4YTdlNjRiNTQ0MDE5ZjExZmQzZWEyY2IzZjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJ2aXNoYXZtYWhhamFuQGdtYWlsLmNvbSIsInJvbGVfaWQiOjF9', '2019-05-14 17:05:42'),
	('jm2xbzmqdir9eifs771t0tlmh0xa0bp2', 'NjA2M2VmODIzMTY4NDUwMWQ0NTU5Zjk0N2FmMTVhMGJmYWUxMmY5ODp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMkBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-10 17:01:35'),
	('jmm3kzqgtsyjev0xk0wei0t3it282yhz', 'MTUwYjJiMDNkMjcwNmUzMGQ2ZDRhZTljYjU0ZWUzZDcwMDY5NGE2NDp7ImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZSwiYXV0aGVudGljYXRlIjp0cnVlLCJlbWFpbCI6InZpc2hhdkBsaXZlLmNvbSIsInJvbGVfaWQiOjEsIm5hbWUiOiJWaXNoYXYgTWFoYWphbiIsInJvbGVuYW1lIjoibWFuYWdlciIsImltYWdlIjoiSU1HXzEyMDIuanBnIn0=', '2019-05-22 07:36:42'),
	('jq5dv1xhxmt8mptnteigu13dlukuwe07', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-10 18:21:04'),
	('kz5puqxcwtwwxkbq7nns33h437h77oov', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-09 09:27:00'),
	('lr4ulrkmh0e9ghfhlocgpu1ku4dgq3o1', 'NzYyODhiNDhlNmE2MGM5NDMwM2YzNmVmNmRjNzY3NzQyNWI4ODBiOTp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJidXNlcjFAZ21haWwuY29tIiwicm9sZV9pZCI6NH0=', '2019-04-10 07:52:49'),
	('m4zrfdlb2k1aycfv00es3cfpyt6pn92z', 'MmMzMDRmNzBjYTgzOTMwOTJjZDFlYjRjYTk3M2I4ZWNlY2M4ZGIyMjp7ImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZSwiYXV0aGVudGljYXRlIjpmYWxzZSwiZW1haWwiOiIiLCJyb2xlX2lkIjoiIiwibmFtZSI6IiIsInJvbGVuYW1lIjoiIiwiaW1hZ2UiOiIiLCJpbnZvaWNlIjoiIiwidmVoaWNsZV9uYW1lIjoiIiwidmVoaWNsZV9kZXNjcmlwdGlvbiI6IiIsInZlaGljbGVfaWQiOiIiLCJzdGFydF9kYXRlIjoiIiwiY2F0ZWdvcnkiOiIiLCJ1c2VyX25hbWUiOiIiLCJzZWxsZXIiOiIiLCJlbmRfZGF0ZSI6IiIsImFtdCI6IiIsInRvdGFsIjoiIiwiYm9va2luZ19kYXRlIjoiIn0=', '2019-05-23 03:45:14'),
	('m5rmard3h78s2oa9zggouj2vpw0cnt43', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-10 17:41:21'),
	('na8ylbexwktccs1ndm2dye56bosq6tij', 'MTUwYjJiMDNkMjcwNmUzMGQ2ZDRhZTljYjU0ZWUzZDcwMDY5NGE2NDp7ImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZSwiYXV0aGVudGljYXRlIjp0cnVlLCJlbWFpbCI6InZpc2hhdkBsaXZlLmNvbSIsInJvbGVfaWQiOjEsIm5hbWUiOiJWaXNoYXYgTWFoYWphbiIsInJvbGVuYW1lIjoibWFuYWdlciIsImltYWdlIjoiSU1HXzEyMDIuanBnIn0=', '2019-05-23 08:51:48'),
	('nr55i77uuz4g3h54z61ontnp31td5h23', 'NjE2ZDA2MDQxNTAyYjJhNDJiZGFiNTU4Yjg4ZGIwNWUwODU0Y2NmZTp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJ2aXNoYXZAbGl2ZS5jb20iLCJyb2xlX2lkIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmFiM2JlYjQ0MmE4ZjdjNWFiOTFkZGIwOWYxYzgzZTgzNzIxYTZiYyJ9', '2019-05-07 05:43:47'),
	('o6gnfb9dslq8hkfr9baxj6nwdqj4nl4x', 'Zjk1OWZhMTkyNzcxZTRiM2ZjM2QyY2IzOTQxODAzNGMyMDA2NmUyMTp7ImF1dGhlbnRpY2F0ZSI6ZmFsc2UsImVtYWlsIjoiIiwicm9sZV9pZCI6IiIsIm5hbWUiOiIiLCJyb2xlbmFtZSI6IiIsImltYWdlIjoiIiwiZGF0ZV9ncmVhdGVyIjpmYWxzZSwiZHVyYXRpb24iOmZhbHNlLCJjYW5jZWxsZWQiOmZhbHNlLCJub3RfY2FuY2VsIjpmYWxzZX0=', '2019-05-21 05:00:29'),
	('p1jxml5m2xq9ozcxcgwr73yoeuctyzlw', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-10 17:28:44'),
	('p7nt2zqw8qu8umvpjwy4liamrtirc6fq', 'MzQ2YWYxYzIyYTg3OGJhZThlYzY2ODE2ZjU5ZGQ0ODJiNTBlZDA1Yzp7ImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZSwiaW52b2ljZSI6IiIsInZlaGljbGVfbmFtZSI6IiIsInZlaGljbGVfZGVzY3JpcHRpb24iOiIiLCJ2ZWhpY2xlX2lkIjoiIiwic3RhcnRfZGF0ZSI6IiIsImNhdGVnb3J5IjoiIiwidXNlcl9uYW1lIjoiIiwic2VsbGVyIjoiIiwiZW5kX2RhdGUiOiIiLCJhbXQiOiIiLCJ0b3RhbCI6IiIsImJvb2tpbmdfZGF0ZSI6IiIsImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJqYWdkZWVwLmphc3NhckBnbWFpbC5jb20iLCJyb2xlX2lkIjozLCJuYW1lIjoiSmFnZGVlcCBTaW5naCIsInJvbGVuYW1lIjoidXNlciIsImltYWdlIjpudWxsfQ==', '2019-05-31 07:33:38'),
	('ql9o7xa7ga8eqhro4w7m49nggagiwxoe', 'NzYyODhiNDhlNmE2MGM5NDMwM2YzNmVmNmRjNzY3NzQyNWI4ODBiOTp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJidXNlcjFAZ21haWwuY29tIiwicm9sZV9pZCI6NH0=', '2019-04-10 15:24:47'),
	('qplit83het42ehpa8uin6qgrcvvcadeu', 'OWNjNDZjNjk4MDVlNjFiZjA5ZjdhNjU4ODYwNjIyMDkwMWQxN2Y3Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWIzYmViNDQyYThmN2M1YWI5MWRkYjA5ZjFjODNlODM3MjFhNmJjIiwiYXV0aGVudGljYXRlIjp0cnVlLCJlbWFpbCI6Im1hbmFnZXIxQGdtYWlsLmNvbSIsInJvbGVfaWQiOjF9', '2019-04-06 05:43:04'),
	('qx5kgb670bxswbj51ohwu5gcawfwjwa0', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-09 11:53:26'),
	('r5hwhzs4y0qye2icyshi51oy8k0r22qo', 'NjA2M2VmODIzMTY4NDUwMWQ0NTU5Zjk0N2FmMTVhMGJmYWUxMmY5ODp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMkBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-10 15:50:53'),
	('recae0uzzsf0xl92br53hnk9izwxm1o3', 'ZDcxNzNjMGNjZDliZTdkODA3YWYzYmUxMTlkYmU3OTlkNmUxYTUzNjp7ImF1dGhlbnRpY2F0ZSI6ZmFsc2UsImVtYWlsIjoidmlzaGF2QGxpdmUuY29tIiwicm9sZV9pZCI6MX0=', '2019-05-01 19:42:31'),
	('rwne2dp6nto8gozx34wfow922bku596m', 'NzYyODhiNDhlNmE2MGM5NDMwM2YzNmVmNmRjNzY3NzQyNWI4ODBiOTp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJidXNlcjFAZ21haWwuY29tIiwicm9sZV9pZCI6NH0=', '2019-04-10 08:34:12'),
	('sd47yj7dkukw0tojlwf2bjcxqla1ps8k', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-09 09:39:07'),
	('sx96q5jq4skk4tnqim4ycyl272y8lcy8', 'NDg2YTdjMmNhN2FhZjhmZjA1YzIyYTk3ZTI4MWQyZGE2ZjgyMDNjZjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJ2aXNoYXZtYWhhamFuQGdtYWlsLmNvbSIsInJvbGVfaWQiOjMsImludm9pY2UiOiIiLCJ2ZWhpY2xlX25hbWUiOiIiLCJ2ZWhpY2xlX2Rlc2NyaXB0aW9uIjoiIiwidmVoaWNsZV9pZCI6IiIsInN0YXJ0X2RhdGUiOiIiLCJjYXRlZ29yeSI6IiIsInNlbGxlciI6IiIsImVuZF9kYXRlIjoiIiwiYW10IjoiIiwidG90YWwiOiIiLCJ1c2VyX25hbWUiOiIiLCJib29raW5nX2RhdGUiOiIiLCJub3RfY2FuY2VsIjpmYWxzZSwiY2FuY2VsbGVkIjpmYWxzZSwiZGF0ZV9ncmVhdGVyIjpmYWxzZSwiZHVyYXRpb24iOmZhbHNlLCJncmVhdGVyIjpmYWxzZSwibmFtZSI6IlZpc2hhdmplZXQgTWFoYWphbiIsInJvbGVuYW1lIjoidXNlciIsImltYWdlIjoiOS5qcGciLCJzZWxsZXJfZGV0YWlsIjoidmlzaGF2QGxpdmUuY29tIiwiaWQiOiI4NjA5NTk5MiIsInBheSI6MjIyMDB9', '2019-05-18 18:04:27'),
	('t1tcgoudqe4s2ne9i8ev5b4igizn6mjw', 'NzM3M2I1NTQ2MGFmMTdmYjg3NDkzZTc0MWI0OTVkMWI4YmQzZGMxMjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJ2aXNoYXZAbGl2ZS5jb20iLCJyb2xlX2lkIjoxLCJ2ZWhpY2xlX25hbWUiOiJNYXJ1dGkgQnJlZXphIiwidmVoaWNsZV9kZXNjcmlwdGlvbiI6IkZlZWwgVGhlIEJyZWV6ZSIsInN0YXJ0X2RhdGUiOiIyMDE5LTA1LTA4IDE2OjE1OjAwIiwiY2F0ZWdvcnkiOiJIYXRjaGJhY2siLCJzZWxsZXIiOiJ2aXNoYXZtYWhhamFuQGdtYWlsLmNvbSIsImVuZF9kYXRlIjoiMjAxOS0wNS0yOCAxNjozMDowMCIsImFtdCI6MzM1NzAsInRvdGFsIjo0MzU3MCwiaW52b2ljZSI6ODAyMDgxNywidmVoaWNsZV9pZCI6MTZ9', '2019-05-15 11:23:58'),
	('t9xcq1hyvcoxpsj3sm3jf7d2q5h7412n', 'ODRjYzk4Y2VkMzQxOThjODYyZThkYjg1N2EyMWY3ZWY3MTVlMTcxYTp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJ2aXNoYXZAbGl2ZS5jb20iLCJyb2xlX2lkIjoxLCJuYW1lIjoiVmlzaGF2IE1haGFqYW4iLCJyb2xlbmFtZSI6Im1hbmFnZXIiLCJpbWFnZSI6IklNR18xMjAyLmpwZyIsImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZSwiaW52b2ljZSI6IiIsInZlaGljbGVfbmFtZSI6IiIsInZlaGljbGVfZGVzY3JpcHRpb24iOiIiLCJ2ZWhpY2xlX2lkIjoiIiwic3RhcnRfZGF0ZSI6IiIsImNhdGVnb3J5IjoiIiwidXNlcl9uYW1lIjoiIiwic2VsbGVyIjoiIiwiZW5kX2RhdGUiOiIiLCJhbXQiOiIiLCJ0b3RhbCI6IiIsImJvb2tpbmdfZGF0ZSI6IiIsImNhbmNlbGxlZCI6ZmFsc2UsImlkIjoiMTUxNzQ1OTYyIiwibm90X2NhbmNlbCI6ZmFsc2V9', '2019-05-19 07:38:45'),
	('tfov2wnzojy51fni3faln3wps042sjp6', 'NzYyODhiNDhlNmE2MGM5NDMwM2YzNmVmNmRjNzY3NzQyNWI4ODBiOTp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJidXNlcjFAZ21haWwuY29tIiwicm9sZV9pZCI6NH0=', '2019-04-10 14:56:48'),
	('tp1v59iqf6fvrs4udgjc5f6imn187y5q', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-10 17:07:25'),
	('txum0u24l0scmyn9hhpv4jz9u70yo15r', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-09 17:31:51'),
	('vqqezg1d38tqcx1cl3vmam5ou74nj8sh', 'MDQ1MDIwODNiZWQxYmQxMzZkM2QzMzg3Nzc2YzUyNDhlYmIyMmQxZTp7ImF1dGhlbnRpY2F0ZSI6ZmFsc2UsImVtYWlsIjoicGFsa2luYW5nbGExMzk2QGdtYWlsLmNvbSIsInJvbGVfaWQiOjR9', '2019-05-06 05:36:16'),
	('wi863d6qem0khrk8ispheusmkndsj9n7', 'YTc3MGIyYWM2MTk4YmY3M2NmODllZGQzOGM2MWIzNzA2NzA4ZmMyNDp7ImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZSwiYXV0aGVudGljYXRlIjp0cnVlLCJlbWFpbCI6InZpc2hhdkBsaXZlLmNvbSIsInJvbGVfaWQiOjEsIm5hbWUiOiJWaXNoYXYgTWFoYWphbiIsInJvbGVuYW1lIjoibWFuYWdlciIsImltYWdlIjoiSU1HXzEyMDIuanBnIiwiaWQiOiIzODc2NjkzMiIsImNhbmNlbCI6MTAwMDAsImNhbmNlbGxlZCI6ZmFsc2UsIm5vdF9jYW5jZWwiOmZhbHNlLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmFiM2JlYjQ0MmE4ZjdjNWFiOTFkZGIwOWYxYzgzZTgzNzIxYTZiYyJ9', '2019-05-23 08:23:02'),
	('wljukc99mmzeyx1myhju6gdqptrgjee6', 'NzYyODhiNDhlNmE2MGM5NDMwM2YzNmVmNmRjNzY3NzQyNWI4ODBiOTp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJidXNlcjFAZ21haWwuY29tIiwicm9sZV9pZCI6NH0=', '2019-04-10 07:42:45'),
	('wpn9pqycu03k2fkysas5rpajvistelqi', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-10 05:54:56'),
	('wt4krie8c71mby5ljewttx6ujrnmypo2', 'Y2U2Y2MzZGJjNmMyOTJhOTA3YTE4ZDc2YmU2MjE3M2Q4Y2RjNjEzMjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJidXNlcjJAZ21haWwuY29tIiwicm9sZV9pZCI6NH0=', '2019-04-10 15:32:57'),
	('y034pydd1udttu1mlxbw5ag0i7nb67hz', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-09 09:19:56'),
	('y4ack6kfy5i4j3czn9ypun3nh0kksu5g', 'YjUzODMzNzFiOTIyMzk1MTZmMDJlMDY0MWU0OGU5YmU0ZWQyMzk4NDp7ImRhdGVfZ3JlYXRlciI6ZmFsc2UsImR1cmF0aW9uIjpmYWxzZSwiaW52b2ljZSI6IiIsInZlaGljbGVfbmFtZSI6IiIsInZlaGljbGVfZGVzY3JpcHRpb24iOiIiLCJ2ZWhpY2xlX2lkIjoiIiwic3RhcnRfZGF0ZSI6IiIsImNhdGVnb3J5IjoiIiwidXNlcl9uYW1lIjoiIiwic2VsbGVyIjoiIiwiZW5kX2RhdGUiOiIiLCJhbXQiOiIiLCJ0b3RhbCI6IiIsImJvb2tpbmdfZGF0ZSI6IiIsImF1dGhlbnRpY2F0ZSI6ZmFsc2UsImVtYWlsIjoiIiwicm9sZV9pZCI6IiIsIm5hbWUiOiIiLCJyb2xlbmFtZSI6IiIsImltYWdlIjoiIiwiaWQiOiIifQ==', '2019-05-31 07:33:12'),
	('y60as6041whdynh0e73gxmjt4wwl1vge', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-09 08:40:19'),
	('y6sezry01b2ou2hfr8uwoy94h6tcsk6c', 'NmU4MGU4ZmM2NTA2ZmY3NzJkNmE0YTc1YTBlODljOWIyYTEyM2EyYjp7ImF1dGhlbnRpY2F0ZSI6dHJ1ZSwiZW1haWwiOiJtYW5hZ2VyMUBnbWFpbC5jb20iLCJyb2xlX2lkIjoxfQ==', '2019-04-09 09:07:33');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Dumping structure for table vehicle_db.front_app_booking_details
CREATE TABLE IF NOT EXISTS `front_app_booking_details` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `refunded` tinyint(1) NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `booking_date` varchar(255) NOT NULL,
  `user_detail_id` varchar(225) NOT NULL,
  `seller_detail` varchar(255) NOT NULL,
  `vehicle_info_id` int(11) NOT NULL,
  `vehicle_detail` varchar(255) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_returned` tinyint(1) NOT NULL,
  `security_amount` bigint(20) NOT NULL,
  `is_fine` tinyint(1) NOT NULL,
  `fine_amount` bigint(20) NOT NULL,
  `extension` bigint(20) NOT NULL,
  `ext_amount` bigint(20) NOT NULL,
  `damage_amount` bigint(20) NOT NULL,
  `total_fine` bigint(20) NOT NULL,
  `amount_exp` bigint(20) NOT NULL,
  `total` bigint(20) NOT NULL,
  `balance_amount` bigint(20) NOT NULL,
  `earnings` bigint(20) NOT NULL,
  `cancel_token` varchar(255) NOT NULL,
  `cancellation_time` varchar(255) NOT NULL,
  `return_date` varchar(255) NOT NULL,
  PRIMARY KEY (`booking_id`),
  UNIQUE KEY `invoice` (`invoice`),
  KEY `front_app_booking_de_vehicle_info_id_1ee9653a_fk_managerap` (`vehicle_info_id`),
  KEY `front_app_booking_details_user_detail_id_136274ee` (`user_detail_id`),
  CONSTRAINT `front_app_booking_de_user_detail_id_136274ee_fk_front_app` FOREIGN KEY (`user_detail_id`) REFERENCES `front_app_mysiteuser` (`user_email`),
  CONSTRAINT `front_app_booking_de_vehicle_info_id_1ee9653a_fk_managerap` FOREIGN KEY (`vehicle_info_id`) REFERENCES `managerapp_vehiclesdetails` (`vehicle_ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

-- Dumping data for table vehicle_db.front_app_booking_details: ~32 rows (approximately)
/*!40000 ALTER TABLE `front_app_booking_details` DISABLE KEYS */;
INSERT INTO `front_app_booking_details` (`booking_id`, `refunded`, `invoice`, `booking_date`, `user_detail_id`, `seller_detail`, `vehicle_info_id`, `vehicle_detail`, `start_date`, `end_date`, `is_active`, `is_returned`, `security_amount`, `is_fine`, `fine_amount`, `extension`, `ext_amount`, `damage_amount`, `total_fine`, `amount_exp`, `total`, `balance_amount`, `earnings`, `cancel_token`, `cancellation_time`, `return_date`) VALUES
	(3, 0, '31395506', '2019-05-03 23:01:58', 'sanyamm02@gmail.com', 'vishav@live.com', 5, 'Toyota Fortuner', '2019-05-08 23:15:00', '2019-05-04 23:30:00', 0, 1, 10000, 0, 0, 0, 0, 0, 0, 4750, 14750, 10000, 4750, '', '', '2019-05-04 16:53:05'),
	(8, 1, '86095992', '2019-05-04 18:04:42', 'vishavmahajan@gmail.com', 'vishav@live.com', 6, 'Mercedes CLA', '2019-05-02 18:15:00', '2019-05-03 17:30:00', 0, 1, 10000, 0, 0, 25, 25000, 1000, 26000, 12000, 22000, 16000, 38000, '', '', '2019-05-04 18:12:39'),
	(12, 0, '12133889', '2019-05-05 12:11:57', 'vishav.mahajan@rediffmail.com', 'vishav@live.com', 4, 'Hyundai Verna', '2019-05-09 12:15:00', '2019-05-10 12:30:00', 0, 1, 10000, 1, 500, 0, 0, 5980, 6480, 2900, 12900, 3520, 9380, '', '', '2019-05-05 17:33:32'),
	(14, 1, '147273587', '2019-05-05 12:13:27', 'sanyamm02@gmail.com', 'vishav@live.com', 6, 'Mercedes CLA', '2019-05-03 12:15:00', '2019-05-04 12:30:00', 0, 1, 10000, 0, 0, 30, 30000, 0, 30000, 72000, 82000, 20000, 102000, '', '', '2019-05-05 17:34:43'),
	(23, 1, '235407970', '2019-05-07 11:41:25', 'vishav.mahajan@rediffmail.com', 'vishav.mahajan@rediffmail.com', 18, 'Ford Endaveour', '2019-05-08 11:45:00', '2019-05-17 12:00:00', 0, 1, 10000, 0, 0, 0, 0, 0, 0, 43150, 53150, 10000, 43150, '', '', '2019-05-07 11:47:20'),
	(29, 0, '295366230', '2019-05-07 16:52:11', 'vishav@live.com', 'vishav@live.com', 6, 'Mercedes CLA', '2019-05-09 17:00:00', '2019-05-30 17:15:00', 0, 1, 10000, 0, 0, 0, 0, 0, 1000, 90000, 100000, 99000, 1000, '', '2019-05-07 17:05:48', ''),
	(33, 1, '337675874', '2019-05-08 10:46:02', 'vishav@live.com', 'vishav@live.com', 5, 'Toyota Fortuner', '2019-05-10 10:45:00', '2019-05-16 11:00:00', 0, 1, 10000, 1, 300, 0, 0, 50000, 50300, 28750, 38750, 40300, 79050, '', '', '2019-05-08 10:47:55'),
	(34, 1, '34336703', '2019-05-08 15:20:31', '0395ankita@gmail.com', 'vishav.mahajan@rediffmail.com', 18, 'Ford Endaveour', '2019-05-08 15:30:00', '2019-05-08 22:45:00', 0, 1, 10000, 1, 1234, 17, 13600, 1000, 15834, 1350, 11350, 5834, 17184, '', '', '2019-05-09 15:40:18'),
	(35, 0, '358163195', '2019-05-08 15:21:21', 'palkinangla1396@gmail.com', 'vishav@live.com', 9, 'BMW 5-Series', '2019-05-08 21:30:00', '2019-05-09 09:30:00', 0, 1, 10000, 0, 0, 2, 2000, 0, 2000, 3000, 13000, 8000, 5000, '', '', '2019-05-09 11:26:29'),
	(36, 0, '361614863', '2019-05-08 15:22:06', 'vishavmahajan@gmail.com', 'vishav@live.com', 5, 'Toyota Fortuner', '2019-05-10 15:30:00', '2019-05-14 15:45:00', 0, 1, 10000, 0, 0, 0, 0, 0, 0, 19150, 29150, 10000, 19150, '', '', '2019-05-09 11:41:41'),
	(37, 0, '371475534', '2019-05-08 15:22:59', 'sanyamm02@gmail.com', 'vishav@live.com', 4, 'Hyundai Verna', '2019-05-13 15:30:00', '2019-05-16 15:45:00', 0, 1, 10000, 0, 0, 0, 0, 0, 1000, 8660, 18660, 17660, 1000, '', '2019-05-09 11:40:47', ''),
	(38, 1, '38766932', '2019-05-08 15:25:03', 'vishav.mahajan@rediffmail.com', 'vishav@live.com', 6, 'Mercedes CLA', '2019-05-08 15:30:00', '2019-05-08 23:30:00', 0, 1, 10000, 0, 0, 17, 17000, 0, 17000, 2000, 12000, 7000, 19000, '', '', '2019-05-09 15:41:44'),
	(39, 1, '391920423', '2019-05-08 23:29:18', 'vishav@live.com', 'vishav.mahajan@rediffmail.com', 18, 'Ford Endaveour', '2019-05-09 23:30:00', '2019-05-28 23:45:00', 0, 1, 10000, 0, 0, 0, 0, 0, 0, 91150, 101150, 10000, 91150, '', '', '2019-05-09 15:38:20'),
	(40, 0, '406997907', '2019-05-09 15:45:52', '0395ankita@gmail.com', 'vishav@live.com', 4, 'Hyundai Verna', '2019-05-14 16:00:00', '2019-05-22 16:15:00', 0, 1, 10000, 0, 0, 0, 0, 0, 0, 23060, 33060, 10000, 23060, '', '', '2019-05-09 15:46:32'),
	(41, 1, '415495647', '2019-05-10 11:23:28', 'palkinangla1396@gmail.com', '0395ankita@gmail.com', 21, 'Honda Amaze', '2019-05-11 11:15:00', '2019-05-13 11:30:00', 0, 1, 10000, 0, 0, 0, 0, 0, 10000, 3140, 13140, 3140, 10000, '', '2019-05-10 11:27:50', ''),
	(42, 0, '42911280', '2019-05-15 13:08:08', 'vishav@live.com', 'vishav@live.com', 5, 'Toyota Fortuner', '2019-05-16 13:15:00', '2019-05-23 13:30:00', 0, 1, 10000, 0, 0, 0, 0, 0, 5000, 33550, 43550, 38550, 5000, '', '2019-05-15 13:11:54', ''),
	(43, 0, '439636115', '2019-05-15 14:11:00', 'vishav@live.com', 'vishav@live.com', 4, 'Hyundai Verna', '2019-05-16 14:15:00', '2019-05-17 14:30:00', 0, 1, 10000, 0, 0, 0, 0, 0, 10000, 2900, 12900, 2900, 10000, '', '2019-05-15 14:30:00', ''),
	(44, 0, '44161366', '2019-05-15 15:12:40', 'vishavmahajan@gmail.com', 'vishav@live.com', 5, 'Toyota Fortuner', '2019-05-16 15:00:00', '2019-05-16 15:15:00', 0, 1, 10000, 0, 0, 0, 0, 0, 10000, 750, 10750, 750, 10000, '', '2019-05-15 15:40:34', ''),
	(45, 0, '458534609', '2019-05-15 15:42:22', 'vishavmahajan@gmail.com', 'vishav@live.com', 6, 'Mercedes CLA', '2019-05-24 15:45:00', '2019-05-24 16:00:00', 0, 1, 10000, 0, 0, 0, 0, 0, 0, 1000, 11000, 10000, 1000, '', '', '2019-05-15 16:15:31'),
	(47, 0, '573435700', '2019-05-15 22:56:54', 'vishav@live.com', 'vishav@live.com', 4, 'Hyundai Verna', '2019-05-23 23:00:00', '2019-05-23 23:15:00', 0, 1, 10000, 0, 0, 0, 0, 1000, 1000, 500, 10500, 9000, 1500, '', '', '2019-05-15 23:38:59'),
	(48, 1, '116327439', '2019-05-16 00:05:54', 'vishav@live.com', 'vishav@live.com', 5, 'Toyota Fortuner', '2019-05-24 00:15:00', '2019-05-29 00:30:00', 0, 1, 10000, 0, 0, 0, 0, 10000, 10000, 23950, 33950, 0, 33950, '', '', '2019-05-16 00:06:44'),
	(49, 1, '478018090', '2019-05-16 09:24:51', 'vishav@live.com', 'vishav@live.com', 4, 'Hyundai Verna', '2019-05-16 09:30:00', '2019-05-17 09:45:00', 0, 1, 10000, 1, 400, 0, 0, 1000, 1400, 2900, 12900, 8600, 4300, '', '', '2019-05-17 02:58:42'),
	(50, 1, '40595250', '2019-05-16 11:00:31', 'sanyamm02@gmail.com', 'vishav@live.com', 19, 'Volkswagen Polo', '2019-05-23 11:00:00', '2019-05-23 11:15:00', 0, 1, 10000, 1, 500, 0, 0, 4000, 4500, 250, 10250, 5500, 4750, '', '', '2019-05-17 02:42:52'),
	(51, 1, '686386555', '2019-05-17 03:04:00', 'sanyamm02@gmail.com', 'vishav@live.com', 5, 'Toyota Fortuner', '2019-05-23 03:15:00', '2019-05-25 03:30:00', 0, 1, 10000, 0, 0, 0, 0, 0, 1000, 9550, 19550, 18550, 1000, '', '2019-05-17 03:04:31', ''),
	(52, 1, '519282300', '2019-05-17 03:09:13', 'sanyamm02@gmail.com', 'vishav@live.com', 4, 'Hyundai Verna', '2019-05-19 03:15:00', '2019-05-19 03:30:00', 0, 1, 10000, 0, 0, 0, 0, 0, 0, 500, 10500, 10000, 500, '', '', '2019-05-17 03:15:16'),
	(53, 1, '264947000', '2019-05-17 03:17:55', 'vishav@live.com', 'vishav@live.com', 6, 'Mercedes CLA', '2019-05-17 03:30:00', '2019-05-18 03:45:00', 0, 1, 10000, 1, 1000, 0, 0, 11000, 12000, 6000, 16000, 2000, 18000, '', '', '2019-05-17 03:19:38'),
	(54, 1, '554231200', '2019-05-17 03:22:10', 'vishav@live.com', 'vishav@live.com', 6, 'Mercedes CLA', '2019-05-18 03:30:00', '2019-05-18 03:45:00', 0, 1, 10000, 0, 0, 0, 0, 0, 0, 1000, 11000, 10000, 1000, '', '', '2019-05-17 03:24:41'),
	(55, 1, '952914975', '2019-05-17 12:43:07', 'daljitsinghnetmax@gmail.com', 'vishav@live.com', 5, 'Toyota Fortuner', '2019-05-29 12:45:00', '2019-05-30 13:00:00', 0, 1, 10000, 0, 0, 0, 0, 0, 0, 4750, 14750, 10000, 4750, '', '', '2019-05-17 13:46:00'),
	(56, 1, '769251950', '2019-05-17 12:54:59', 'vishav@live.com', 'sanyammoudgil@icloud.com', 26, 'Honda Honda City', '2019-05-18 13:00:00', '2019-05-19 13:15:00', 0, 1, 10000, 1, 2000, 0, 0, 4000, 6000, 9500, 19500, 4000, 15500, '', '', '2019-05-17 12:56:49'),
	(57, 0, '661269860', '2019-05-17 13:03:19', 'jagdeep.jassar@gmail.com', 'vishav@live.com', 9, 'BMW 5-Series', '2019-05-24 13:00:00', '2019-05-30 13:15:00', 1, 0, 10000, 0, 0, 0, 0, 0, 0, 36000, 46000, 0, 0, '88050949jagdeep.jassar@gmail.com', '', ''),
	(58, 0, '253240105', '2019-05-17 13:50:38', 'daljitsinghnetmax@gmail.com', '0395ankita@gmail.com', 22, 'Ford Titanium', '2019-05-29 12:45:00', '2019-05-30 13:00:00', 0, 1, 10000, 1, 200, 0, 0, 1000, 1200, 2050, 12050, 8800, 3250, '', '', '2019-05-17 13:55:21'),
	(59, 0, '505041100', '2019-05-17 13:57:45', 'daljitsinghnetmax@gmail.com', 'vishav@live.com', 6, 'Mercedes CLA', '2019-05-30 12:45:00', '2019-05-31 13:00:00', 1, 0, 10000, 0, 0, 0, 0, 0, 0, 6000, 16000, 0, 0, '31117533daljitsinghnetmax@gmail.com', '', '');
/*!40000 ALTER TABLE `front_app_booking_details` ENABLE KEYS */;

-- Dumping structure for table vehicle_db.front_app_contact_us
CREATE TABLE IF NOT EXISTS `front_app_contact_us` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(180) NOT NULL,
  `user_mobile` varchar(180) NOT NULL,
  `user_subject` varchar(180) NOT NULL,
  `user_message` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table vehicle_db.front_app_contact_us: ~3 rows (approximately)
/*!40000 ALTER TABLE `front_app_contact_us` DISABLE KEYS */;
INSERT INTO `front_app_contact_us` (`id`, `user_name`, `user_email`, `user_mobile`, `user_subject`, `user_message`) VALUES
	(1, 'Vishav mahajan', 'vishavmahajan@gmail.com', '7508001801', 'booking regarding', 'FAcing Some issues in booking related'),
	(2, 'Vishav mahajan', 'vishavmahajan@gmail.com', '7508001801', 'Login Issue', 'Not able to Log in'),
	(3, 'Sanyam Moudgil', 'sanyamm02@gmail.com', '1234567890', 'Cancellation Issue', 'What happens when user does Cancellation earlier');
/*!40000 ALTER TABLE `front_app_contact_us` ENABLE KEYS */;

-- Dumping structure for table vehicle_db.front_app_login_details
CREATE TABLE IF NOT EXISTS `front_app_login_details` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(225) NOT NULL,
  `login_time` varchar(225) NOT NULL,
  `logout_time` varchar(225) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=latin1;

-- Dumping data for table vehicle_db.front_app_login_details: ~218 rows (approximately)
/*!40000 ALTER TABLE `front_app_login_details` DISABLE KEYS */;
INSERT INTO `front_app_login_details` (`login_id`, `user_email`, `login_time`, `logout_time`) VALUES
	(1, 'vishavmahajan@gmail.com', '10:00:54', '10:04:57'),
	(2, 'vishav@live.com', '10:05:14', '11:28:09'),
	(3, 'vishavmahajan@gmail.com', '11:34:07', '12:25:07'),
	(4, 'vishavmahajan@gmail.com', '12:25:23', '12:57:31'),
	(5, 'vishav@live.com', '13:07:26', '21:23:11'),
	(6, 'vishavmahajan@gmail.com', '21:23:39', '21:33:49'),
	(7, 'vishavmahajan@gmail.com', '21:36:27', '11:29:52'),
	(8, 'vishavmahajan@gmail.com', '13:35:11', '13:46:29'),
	(9, 'rekzmahajan@gmail.com', '14:13:13', '14:31:55'),
	(10, 'rekzmahajan@gmail.com', '14:32:08', '14:35:35'),
	(11, 'rekzmahajan@gmail.com', '14:36:21', '14:53:35'),
	(12, 'vishav@live.com', '02:20:11', '02:21:24'),
	(13, 'vishavmahajan@gmail.com', '09:41:39', '09:44:04'),
	(14, 'vishavmahajan@gmail.com', '11:17:56', '11:21:56'),
	(15, 'vishavmahajan@gmail.com', '11:36:54', '19:18:21'),
	(16, 'vishavmahajan@gmail.com', '19:38:17', '21:19:11'),
	(17, '0395ankita@gmail.com', '23:46:35', '23:53:09'),
	(18, 'vishavmahajan@gmail.com', '23:53:33', '23:55:05'),
	(19, '0395ankita@gmail.com', '23:55:20', '00:30:16'),
	(20, 'vishavmahajan@gmail.com', '09:33:37', '09:47:19'),
	(21, 'vishav@live.com', '09:48:33', '09:52:28'),
	(22, 'vishav@live.com', '09:53:47', '09:59:03'),
	(23, 'vishav@live.com', '10:26:15', '10:28:00'),
	(24, 'vishav@live.com', '10:32:05', '10:46:28'),
	(25, 'vishav@live.com', '11:38:14', '11:48:30'),
	(26, 'vishav@live.com', '15:43:07', '15:50:08'),
	(27, 'vishav@live.com', '15:50:39', '21:03:03'),
	(28, 'vishav@live.com', '22:38:16', '23:02:31'),
	(29, 'vishav@live.com', '23:11:55', '23:32:21'),
	(30, 'vishav@live.com', '23:32:30', '23:34:21'),
	(31, 'vishav@live.com', '23:34:30', '23:35:46'),
	(32, 'vishavmahajan@gmail.com', '23:35:55', '00:00:53'),
	(33, 'vishav.mahajan@rediffmail.com', '00:04:21', '10:40:31'),
	(34, 'vishavmahajan@gmail.com', '10:55:31', '10:59:31'),
	(35, 'vishavmahajan@gmail.com', '10:59:43', '11:03:56'),
	(36, 'vishavmahajan@gmail.com', '11:04:14', '11:18:52'),
	(37, 'daljitsingh1987@outlook.com', '11:56:41', '11:56:53'),
	(38, 'vishavmahajan@gmail.com', '21:22:43', '21:24:33'),
	(39, 'vishav@live.com', '21:58:31', '22:25:07'),
	(40, 'vishavmahajan@gmail.com', '00:24:23', '00:25:19'),
	(41, 'vishav@live.com', '00:27:41', ''),
	(42, 'vishav@live.com', '00:29:11', '01:13:37'),
	(43, 'vishavmahajan@gmail.com', '01:45:50', '01:47:06'),
	(44, 'vishav@live.com', '10:15:27', '10:31:32'),
	(45, 'vishavmahajan@gmail.com', '10:07:53', ''),
	(46, 'palkinangla1396@gmail.com', '11:05:46', '10:18:17'),
	(47, 'vishav@live.com', '11:13:47', ''),
	(48, 'vishavmahajan@gmail.com', '22:17:16', ''),
	(49, 'vishavmahajan@gmail.com', '23:05:44', ''),
	(50, 'vishavmahajan@gmail.com', '23:23:36', '09:21:27'),
	(51, 'vishavmahajan96@gmail.com', '09:23:01', '10:16:46'),
	(52, 'vishavmahajan@gmail.com', '10:17:03', '10:20:00'),
	(53, 'vishavmahajan96@gmail.com', '10:20:18', '15:25:08'),
	(54, 'vishavmahajan@gmail.com', '15:25:22', '21:43:51'),
	(55, 'vishavmahajan96@gmail.com', '23:06:18', '09:42:46'),
	(56, 'vishavmahajan96@gmail.com', '09:47:09', ''),
	(57, 'vishavmahajan@gmail.com', '10:02:49', ''),
	(58, 'vishavmahajan@gmail.com', '10:05:39', ''),
	(59, 'vishavmahajan96@gmail.com', '15:01:02', ''),
	(60, 'vishavmahajan@gmail.com', '19:57:09', ''),
	(61, 'vishavmahajan@gmail.com', '22:35:42', ''),
	(62, 'vishavmahajan@gmail.com', '23:35:48', ''),
	(63, 'vishavmahajan@gmail.com', '09:33:24', '16:05:08'),
	(64, 'vishav@live.com', '16:05:20', ''),
	(65, 'vishav@live.com', '17:43:49', '17:54:35'),
	(66, 'vishavmahajan@gmail.com', '17:54:46', '19:21:53'),
	(67, 'vishavmahajan96@gmail.com', '19:22:10', '10:58:21'),
	(68, 'vishavmahajan@gmail.com', '10:58:36', '11:02:29'),
	(69, 'sanyamm02@gmail.com', '11:19:20', '14:28:05'),
	(70, 'vishavmahajan96@gmail.com', '14:28:27', '14:44:19'),
	(71, 'vishavmahajan@gmail.com', '14:44:29', '16:41:27'),
	(72, 'sanyamm02@gmail.com', '16:42:29', '20:02:18'),
	(73, 'rekzmahajan@gmail.com', '20:41:22', '22:41:51'),
	(74, 'sanyamm02@gmail.com', '22:42:01', '23:31:08'),
	(75, 'sanyamm02@gmail.com', '23:31:21', '09:44:26'),
	(76, 'vishav@live.com', '09:45:37', '09:45:48'),
	(77, 'sanyamm02@gmail.com', '09:46:05', '09:49:05'),
	(78, 'vishav@live.com', '10:09:23', '10:09:46'),
	(79, '0395ankita@gmail.com', '10:19:33', '10:50:27'),
	(80, 'sparshkumar3333@gmail.com', '11:03:04', '21:49:54'),
	(81, 'vishavmahajan@gmail.com', '21:51:41', '21:53:57'),
	(82, 'vishavmahajan96@gmail.com', '22:08:01', '22:15:18'),
	(83, 'vishavmahajan@gmail.com', '22:15:30', '22:27:06'),
	(84, 'vishavmahajan96@gmail.com', '22:27:52', '22:34:17'),
	(85, 'vishav@live.com', '22:54:28', '22:59:12'),
	(86, 'vishav@live.com', '22:59:37', '23:01:28'),
	(87, 'sanyamm02@gmail.com', '23:01:39', '23:02:08'),
	(88, '0395ankita@gmail.com', '23:02:21', '23:02:49'),
	(89, 'palkinangla1396@gmail.com', '23:03:23', '23:03:56'),
	(90, 'vishav@live.com', '23:04:08', '23:05:09'),
	(91, '0395ankita@gmail.com', '23:05:19', '23:06:12'),
	(92, 'vishav@live.com', '23:06:22', '13:36:53'),
	(93, 'khannashivam20@gmail.com', '13:38:53', '13:43:32'),
	(94, 'khannashivam20@gmail.com', '13:43:43', '13:44:46'),
	(95, 'vishav@live.com', '13:45:09', '17:12:20'),
	(96, 'khannashivam20@gmail.com', '17:12:40', '17:19:04'),
	(97, 'vishav@live.com', '17:19:17', '17:49:49'),
	(98, 'vishav.mahajan@rediffmail.com', '17:50:02', '18:01:48'),
	(99, 'vishavmahajan@gmail.com', '18:03:33', '18:07:38'),
	(100, 'vishav@live.com', '18:07:51', '18:14:55'),
	(101, 'vishavmahajan@gmail.com', '19:16:00', '19:18:01'),
	(102, 'vishav@live.com', '19:18:15', '19:51:22'),
	(103, 'vishav.mahajan@rediffmail.com', '19:51:34', '19:53:23'),
	(104, 'vishavmahajan@gmail.com', '19:53:33', '19:54:09'),
	(105, 'vishavmahajan@gmail.com', '19:54:59', ''),
	(106, 'vishavmahajan@gmail.com', '23:49:13', '00:00:21'),
	(107, 'vishav@live.com', '10:15:37', '11:14:53'),
	(108, 'vishavmahajan@gmail.com', '11:15:10', '11:20:39'),
	(109, 'vishav@live.com', '11:21:02', '11:31:12'),
	(110, 'sanyamm02@gmail.com', '11:31:49', ''),
	(111, 'vishavmahajan@gmail.com', '11:43:34', '11:59:40'),
	(112, 'vishavmahajan96@gmail.com', '12:00:00', '12:06:03'),
	(113, 'vishav.mahajan@rediffmail.com', '12:06:53', '12:12:19'),
	(114, 'vishavmahajan@gmail.com', '12:12:29', '12:12:57'),
	(115, 'sanyamm02@gmail.com', '12:13:09', '12:13:37'),
	(116, '0395ankita@gmail.com', '12:14:17', '12:14:46'),
	(117, 'vishav@live.com', '12:15:01', ''),
	(118, 'vishavmahajan@gmail.com', '12:16:11', ''),
	(119, 'vishav@live.com', '13:22:38', '17:08:43'),
	(120, 'vishav@live.com', '17:17:01', '17:23:38'),
	(121, 'vishav@live.com', '17:25:34', '17:47:08'),
	(122, 'vishav@live.com', '17:48:34', '17:50:53'),
	(123, 'vishavmahajan@gmail.com', '17:51:02', '17:57:31'),
	(124, 'vishavmahajan@gmail.com', '17:58:30', '18:10:41'),
	(125, 'vishav@live.com', '09:51:22', '10:16:19'),
	(126, 'vishav@live.com', '10:19:29', ''),
	(127, 'vishavmahajan@gmail.com', '10:22:29', '10:30:42'),
	(128, 'sanyamm02@gmail.com', '10:30:52', '11:25:39'),
	(129, '0395ankita@gmail.com', '11:26:18', '11:28:17'),
	(130, 'vishav.mahajan@rediffmail.com', '11:28:31', '11:48:12'),
	(131, 'vishavmahajan96@gmail.com', '11:48:27', '11:49:30'),
	(132, 'vishav@live.com', '15:02:55', ''),
	(133, 'rekzmahajan@gmail.com', '23:11:51', '23:15:50'),
	(134, 'rekzmahajan@gmail.com', '23:16:38', '23:17:17'),
	(135, 'rekzmahajan@gmail.com', '23:17:54', '23:20:16'),
	(136, 'vishav@live.com', '23:20:28', '23:23:49'),
	(137, 'vishav@live.com', '23:27:59', '00:07:21'),
	(138, 'vishav.mahajan@rediffmail.com', '00:07:34', '00:09:05'),
	(139, 'vishavmahajan@gmail.com', '00:09:16', '00:30:24'),
	(140, 'vishavmahajan@gmail.com', '10:11:26', '10:15:18'),
	(141, 'vishav@live.com', '10:15:30', '13:05:10'),
	(142, 'vishav.mahajan@rediffmail.com', '13:05:32', ''),
	(143, 'vishav@live.com', '13:06:42', '13:11:32'),
	(144, 'vishavmahajan@gmail.com', '13:11:43', '14:03:33'),
	(145, 'vishav@live.com', '14:03:42', '14:04:33'),
	(146, 'vishav.mahajan@rediffmail.com', '14:04:43', ''),
	(147, 'vishav@live.com', '14:55:43', '15:19:52'),
	(148, '0395ankita@gmail.com', '15:20:04', '15:20:36'),
	(149, 'palkinangla1396@gmail.com', '15:20:47', '15:21:26'),
	(150, 'vishavmahajan@gmail.com', '15:21:37', '15:22:12'),
	(151, 'sanyamm02@gmail.com', '15:22:33', '15:23:15'),
	(152, 'vishav@live.com', '15:23:25', '15:23:58'),
	(153, '0395ankita@gmail.com', '15:24:12', '15:24:18'),
	(154, 'vishav.mahajan@rediffmail.com', '15:24:35', '15:25:07'),
	(155, 'vishav@live.com', '15:25:29', '22:10:19'),
	(156, 'vishavmahajan@gmail.com', '23:22:35', '23:23:41'),
	(157, 'vishav.mahajan@rediffmail.com', '23:24:04', '23:26:12'),
	(158, 'vishav@live.com', '23:26:26', '23:38:36'),
	(159, 'vishav@live.com', '09:11:02', '09:15:12'),
	(160, '0395ankita@gmail.com', '10:42:05', ''),
	(161, '0395ankita@gmail.com', '11:00:02', '11:24:21'),
	(162, 'vishav@live.com', '11:24:33', '11:35:58'),
	(163, 'sanyamm02@gmail.com', '11:40:31', '11:41:03'),
	(164, 'vishav@live.com', '11:41:15', '11:55:05'),
	(165, 'vishav@live.com', '11:58:25', '12:02:58'),
	(166, 'vishavmahajan@gmail.com', '12:03:05', '12:04:25'),
	(167, 'vishav@live.com', '12:57:12', '12:57:56'),
	(168, '0395ankita@gmail.com', '12:58:09', '13:01:16'),
	(169, 'vishav@live.com', '13:01:26', '13:01:47'),
	(170, 'vishav@live.com', '13:05:29', ''),
	(171, 'vishav@live.com', '14:03:35', ''),
	(172, 'vishav@live.com', '14:06:18', ''),
	(173, 'vishav@live.com', '14:10:28', ''),
	(174, 'vishav@live.com', '14:22:35', ''),
	(175, 'vishavmahajan@gmail.com', '14:31:35', '14:37:00'),
	(176, 'vishav@live.com', '14:38:28', '14:49:45'),
	(177, 'vishav@live.com', '14:51:04', ''),
	(178, 'vishavmahajan@gmail.com', '14:53:59', '14:54:45'),
	(179, 'vishav@live.com', '14:55:24', '14:56:01'),
	(180, '0395ankita@gmail.com', '14:56:25', '14:59:53'),
	(181, 'vishav@live.com', '15:03:46', '15:04:08'),
	(182, 'vishav.mahajan@rediffmail.com', '15:15:54', '15:44:13'),
	(183, '0395ankita@gmail.com', '15:44:25', '15:47:24'),
	(184, 'vishavmahajan@gmail.com', '15:47:42', ''),
	(185, 'vishavmahajan@gmail.com', '16:00:50', '16:24:06'),
	(186, '0395ankita@gmail.com', '16:24:17', '10:40:21'),
	(187, 'palkinangla1396@gmail.com', '10:44:24', '2019-05-10 11:08:02.434253'),
	(188, 'palkinangla1396@gmail.com', '2019-05-10 11:12:17.803756', '2019-05-10 11:28:01.888251'),
	(189, 'vishav@live.com', '2019-05-10 19:22:11.842842', '2019-05-10 19:35:46.220447'),
	(190, 'vishav@live.com', '2019-05-11 14:14:47.480130', '2019-05-11 14:22:21.162051'),
	(191, 'vishav@live.com', '2019-05-15 13:00:50.253270', ''),
	(192, 'vishavmahajan@gmail.com', '2019-05-15 14:58:40.508344', '2019-05-15 15:45:00.679854'),
	(193, 'vishav@live.com', '2019-05-15 15:45:13.123174', '2019-05-15 23:20:11.919508'),
	(194, '0395ankita@gmail.com', '2019-05-15 23:20:22.679867', '2019-05-15 23:21:31.544584'),
	(195, 'vishav@live.com', '2019-05-15 23:21:44.112325', '2019-05-16 00:18:21.846490'),
	(196, 'vishav.mahajan@rediffmail.com', '2019-05-16 00:18:34.448628', '2019-05-16 00:21:45.300155'),
	(197, 'vishav@live.com', '2019-05-16 00:21:57.391007', '2019-05-16 09:52:14.667725'),
	(198, 'sanyamm02@gmail.com', '2019-05-16 09:52:24.872401', '2019-05-16 11:01:36.205536'),
	(199, 'vishav@live.com', '2019-05-16 11:02:11.366129', '2019-05-16 11:11:01.894764'),
	(200, 'vishav@live.com', '2019-05-16 20:25:15.271993', '2019-05-16 21:04:05.795180'),
	(201, 'vishavmahajan@gmail.com', '2019-05-16 21:04:18.275429', '2019-05-16 21:11:23.861226'),
	(202, 'vishav@live.com', '2019-05-16 21:11:51.577999', ''),
	(203, 'vishav@live.com', '2019-05-16 21:11:51.636841', '2019-05-17 03:00:45.146625'),
	(204, 'sanyamm02@gmail.com', '2019-05-17 03:01:05.354278', '2019-05-17 03:12:30.275248'),
	(205, 'vishav@live.com', '2019-05-17 03:12:42.814553', '2019-05-17 04:27:30.347118'),
	(206, 'vishav@live.com', '2019-05-17 11:35:50.137654', '2019-05-17 12:01:51.066853'),
	(207, 'vishav.mahajan@rediffmail.com', '2019-05-17 12:02:07.150677', ''),
	(208, 'sanyamm02@gmail.com', '2019-05-17 12:09:34.317839', '2019-05-17 12:12:24.857347'),
	(209, 'daljitsinghnetmax@gmail.com', '2019-05-17 12:30:04.825431', ''),
	(210, 'sanyammoudgil@icloud.com', '2019-05-17 12:33:50.978253', ''),
	(211, 'snehilsharma29@gmail.com', '2019-05-17 12:34:10.490147', '2019-05-17 12:45:45.296865'),
	(212, 'snehilsharma29@gmail.com', '2019-05-17 12:46:05.152009', '2019-05-17 12:49:47.423416'),
	(213, 'snehilsharma29@gmail.com', '2019-05-17 12:50:11.158117', '2019-05-17 12:50:15.957118'),
	(214, 'vishav@live.com', '2019-05-17 12:52:21.972223', ''),
	(215, 'jagdeep.jassar@gmail.com', '2019-05-17 12:59:30.889620', '2019-05-17 13:14:48.030851'),
	(216, 'vishav.mahajan@rediffmail.com', '2019-05-17 13:15:05.056330', '2019-05-17 13:45:23.810738'),
	(217, 'vishav@live.com', '2019-05-17 13:45:32.951449', '2019-05-17 13:54:45.512787'),
	(218, '0395ankita@gmail.com', '2019-05-17 13:54:55.032509', '');
/*!40000 ALTER TABLE `front_app_login_details` ENABLE KEYS */;

-- Dumping structure for table vehicle_db.front_app_mysiteuser
CREATE TABLE IF NOT EXISTS `front_app_mysiteuser` (
  `site_role_id_id` int(11) NOT NULL,
  `user_fname` varchar(255) NOT NULL,
  `user_lname` varchar(255) NOT NULL,
  `user_email` varchar(225) NOT NULL,
  `user_password` varchar(1000) NOT NULL,
  `user_mobile` bigint(20) NOT NULL,
  `user_dob` varchar(255) NOT NULL,
  `user_image` varchar(255) DEFAULT NULL,
  `user_gender` varchar(12) NOT NULL,
  `user_isverified` tinyint(1) NOT NULL,
  `user_isactive` tinyint(1) NOT NULL,
  `user_isavailable` tinyint(1) NOT NULL,
  `user_isqueue` tinyint(1) NOT NULL,
  `registered_on` varchar(225) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `otp_time_generation` varchar(255) DEFAULT NULL,
  `user_token` varchar(255),
  PRIMARY KEY (`user_email`),
  KEY `front_app_mysiteuser_site_role_id_id_c71c9b76_fk_front_app` (`site_role_id_id`),
  CONSTRAINT `front_app_mysiteuser_site_role_id_id_c71c9b76_fk_front_app` FOREIGN KEY (`site_role_id_id`) REFERENCES `front_app_user_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vehicle_db.front_app_mysiteuser: ~12 rows (approximately)
/*!40000 ALTER TABLE `front_app_mysiteuser` DISABLE KEYS */;
INSERT INTO `front_app_mysiteuser` (`site_role_id_id`, `user_fname`, `user_lname`, `user_email`, `user_password`, `user_mobile`, `user_dob`, `user_image`, `user_gender`, `user_isverified`, `user_isactive`, `user_isavailable`, `user_isqueue`, `registered_on`, `otp`, `otp_time_generation`, `user_token`) VALUES
	(1, 'Ankita', 'Sharma', '0395ankita@gmail.com', 'pbkdf2_sha256$100000$DutxkthJih19$4n/IRnpG6+UZlGg7IbGsYSHm/6lSVNY9TcEa0nQ5YMQ=', 8894526047, '1995-04-03', '2247C60F-D429-438A-BA17-72512EF52D61.jpeg', 'Female', 1, 1, 1, 0, '2019-04-15', '', '', ''),
	(3, 'Daljit', 'Singh', 'daljitsinghnetmax@gmail.com', 'pbkdf2_sha256$100000$lRaqh1ZmkK3j$Lk53dk2R3StP30nRQQpRjDSSvybXbB1xA1ZJ9a0sIGU=', 8219440761, '1987-12-01', 'Penguins.jpg', 'Male', 1, 1, 1, 0, '2019-05-17', '', '', ''),
	(3, 'Jagdeep', 'Singh', 'jagdeep.jassar@gmail.com', 'pbkdf2_sha256$100000$J2O4KG7Num8R$0PCno2mKZ0rXbn1FJst8StKsWFIUZbdq3v6gAJms2Tw=', 9872938883, '20/06/1979', NULL, 'Male', 1, 1, 1, 0, '2019-05-17', '', '', ''),
	(1, 'Palki', 'Nangla', 'palkinangla1396@gmail.com', 'pbkdf2_sha256$100000$DutxkthJih19$4n/IRnpG6+UZlGg7IbGsYSHm/6lSVNY9TcEa0nQ5YMQ=', 8628003936, '1996-12-31', '4k-Windows-10-Wallpaper-For-PC.jpg', 'Female', 1, 1, 1, 0, '2019-04-17', '946427', '2019-05-10 11:08:46.827552', ''),
	(3, 'Abhi', 'Shekh', 'rekzmahajan@gmail.com', 'pbkdf2_sha256$100000$pfZdIMyMVvno$gFAcuIg6PJykmy+/thSYEU+VrgCwJLutA1IosRzUdwc=', 9803512121, '1996-11-30', NULL, 'Male', 1, 1, 1, 0, '2019-05-07', '', '', ''),
	(3, 'Sanyam', 'Moudgil', 'sanyamm02@gmail.com', 'pbkdf2_sha256$100000$DutxkthJih19$4n/IRnpG6+UZlGg7IbGsYSHm/6lSVNY9TcEa0nQ5YMQ=', 8283822432, '1997-12-26', 'IMG_6120.JPG', 'Male', 1, 1, 1, 0, '2019-04-23', '', '', ''),
	(4, 'Sanyam', 'Moudgil', 'sanyammoudgil@icloud.com', 'pbkdf2_sha256$100000$WL2waDYbnvWT$dAnWztGBypLcwBrPM+W7wclW0gsWX/2vQONTLiRm6OI=', 8283822432, '1997-12-26', 'IMG_6120.JPG', 'Male', 1, 1, 1, 0, '2019-05-17', '', '', ''),
	(3, 'Sahil', 'Sharma', 'snehilsharma29@gmail.com', 'pbkdf2_sha256$100000$h4qNA0gxLbwU$ZMoaus5GikIPboloxlArchuAyueYbsjrYOOi7LBSXtk=', 9464479551, '2019-05-17', '6384.png', 'Male', 1, 1, 1, 0, '2019-05-17', '', '', ''),
	(3, 'Sparsh', 'Kumar', 'sparshkumar3333@gmail.com', 'pbkdf2_sha256$100000$h06Jh6nCNNIV$4UAvVfJn5SaD9mt09NA4BveJ22D+iBYpBnEL+8u2e64=', 7508001801, '1991-03-31', NULL, 'Male', 1, 1, 1, 0, '2019-05-03', '', '', ''),
	(4, 'Vishav', 'Mahajan', 'vishav.mahajan@rediffmail.com', 'pbkdf2_sha256$100000$DutxkthJih19$4n/IRnpG6+UZlGg7IbGsYSHm/6lSVNY9TcEa0nQ5YMQ=', 7508001801, '1996-11-26', 'Johnnie-Walker-HD-Desktop.jpg', 'Male', 1, 1, 1, 0, '2019-04-17', '482665', '2019-05-09 15:30:54.340507', ''),
	(1, 'Vishav', 'Mahajan', 'vishav@live.com', 'pbkdf2_sha256$100000$LawK7CbeemEN$QhdyAV60EYAWqhfYiDT29bq30J34x8tZbCmCUOSDruA=', 7508001801, '1996-11-26', 'IMG_1202.jpg', 'Male', 1, 1, 1, 0, '2019-04-11', '872259', '2019-05-17 03:24:53.731896', ''),
	(3, 'Vishavjeet', 'Mahajan', 'vishavmahajan@gmail.com', 'pbkdf2_sha256$100000$DutxkthJih19$4n/IRnpG6+UZlGg7IbGsYSHm/6lSVNY9TcEa0nQ5YMQ=', 9090909090, '1999-08-08', '9.jpg', 'Male', 1, 1, 1, 0, '2019-04-18', '389438', '2019-05-05 11:50:16.179756', '');
/*!40000 ALTER TABLE `front_app_mysiteuser` ENABLE KEYS */;

-- Dumping structure for table vehicle_db.front_app_payment_token
CREATE TABLE IF NOT EXISTS `front_app_payment_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `invoice` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice` (`invoice`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table vehicle_db.front_app_payment_token: ~16 rows (approximately)
/*!40000 ALTER TABLE `front_app_payment_token` DISABLE KEYS */;
INSERT INTO `front_app_payment_token` (`id`, `user_email`, `token`, `invoice`) VALUES
	(1, 'sanyamm02@gmail.com', '887776948247475', '948247475'),
	(2, 'sanyamm02@gmail.com', '61504340595250', '40595250'),
	(3, 'vishavmahajan@gmail.com', '121337253064820', '253064820'),
	(4, 'sanyamm02@gmail.com', '364956686386555', '686386555'),
	(5, 'sanyamm02@gmail.com', '593293709582800', '709582800'),
	(6, 'sanyamm02@gmail.com', '828381443583400', '443583400'),
	(7, 'sanyamm02@gmail.com', '581783', ''),
	(8, 'sanyamm02@gmail.com', '812750519282300', '519282300'),
	(9, 'vishav@live.com', '727037264947000', '264947000'),
	(10, 'vishav@live.com', '323651554231200', '554231200'),
	(11, 'snehilsharma29@gmail.com', '155630356819190', '356819190'),
	(12, 'daljitsinghnetmax@gmail.com', '343444952914975', '952914975'),
	(13, 'vishav@live.com', '635979769251950', '769251950'),
	(14, 'jagdeep.jassar@gmail.com', '648219661269860', '661269860'),
	(15, 'daljitsinghnetmax@gmail.com', '134982253240105', '253240105'),
	(16, 'daljitsinghnetmax@gmail.com', '519439505041100', '505041100');
/*!40000 ALTER TABLE `front_app_payment_token` ENABLE KEYS */;

-- Dumping structure for table vehicle_db.front_app_user_role
CREATE TABLE IF NOT EXISTS `front_app_user_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(225) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table vehicle_db.front_app_user_role: ~4 rows (approximately)
/*!40000 ALTER TABLE `front_app_user_role` DISABLE KEYS */;
INSERT INTO `front_app_user_role` (`role_id`, `role_name`) VALUES
	(4, 'business_user'),
	(1, 'manager'),
	(2, 'superuser'),
	(3, 'user');
/*!40000 ALTER TABLE `front_app_user_role` ENABLE KEYS */;

-- Dumping structure for table vehicle_db.managerapp_vehiclecategories
CREATE TABLE IF NOT EXISTS `managerapp_vehiclecategories` (
  `vehicle_category_name` varchar(225) NOT NULL,
  `vehicle_category_price` int(11) NOT NULL,
  `type_isactive` tinyint(1) NOT NULL,
  `vehicle_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`vehicle_id`),
  UNIQUE KEY `managerapp_vehiclecategories_vehicle_category_name_3649db23_uniq` (`vehicle_category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table vehicle_db.managerapp_vehiclecategories: ~4 rows (approximately)
/*!40000 ALTER TABLE `managerapp_vehiclecategories` DISABLE KEYS */;
INSERT INTO `managerapp_vehiclecategories` (`vehicle_category_name`, `vehicle_category_price`, `type_isactive`, `vehicle_id`) VALUES
	('Hatchback', 250, 1, 1),
	('Sedan', 500, 1, 2),
	('SUV', 750, 1, 3),
	('Luxury', 1000, 1, 4);
/*!40000 ALTER TABLE `managerapp_vehiclecategories` ENABLE KEYS */;

-- Dumping structure for table vehicle_db.managerapp_vehiclecompany
CREATE TABLE IF NOT EXISTS `managerapp_vehiclecompany` (
  `company_name` varchar(225) NOT NULL,
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_isactive` tinyint(1) NOT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `managerapp_vehiclecompany_company_name_ec9f4f77_uniq` (`company_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table vehicle_db.managerapp_vehiclecompany: ~10 rows (approximately)
/*!40000 ALTER TABLE `managerapp_vehiclecompany` DISABLE KEYS */;
INSERT INTO `managerapp_vehiclecompany` (`company_name`, `company_id`, `company_isactive`) VALUES
	('Hyundai', 1, 1),
	('Maruti', 2, 1),
	('Honda', 3, 1),
	('Volkswagen', 5, 1),
	('Mercedes', 6, 1),
	('Nissan', 7, 1),
	('Ford', 8, 1),
	('BMW', 9, 1),
	('Toyota', 10, 1),
	('Volvo', 11, 1);
/*!40000 ALTER TABLE `managerapp_vehiclecompany` ENABLE KEYS */;

-- Dumping structure for table vehicle_db.managerapp_vehiclesdetails
CREATE TABLE IF NOT EXISTS `managerapp_vehiclesdetails` (
  `vehicle_ref_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_name` varchar(225) NOT NULL,
  `vehicle_price` int(11) NOT NULL,
  `vehicle_description` varchar(225) NOT NULL,
  `vehicle_model` bigint(20) NOT NULL,
  `vehicle_image` varchar(225) DEFAULT NULL,
  `vehicle_isactive` tinyint(1) NOT NULL,
  `u_email` varchar(225) NOT NULL,
  `vehicle_isavailable` tinyint(1) NOT NULL,
  `company_id_id` int(11) NOT NULL,
  `vehicle_id_id` int(11) NOT NULL,
  `abs` tinyint(1) NOT NULL,
  `airbags` varchar(255) NOT NULL,
  `seats` varchar(255) NOT NULL,
  `transmission` varchar(20) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`vehicle_ref_id`),
  KEY `managerapp_vehiclesd_company_id_id_ff32e737_fk_managerap` (`company_id_id`),
  KEY `managerapp_vehiclesd_vehicle_id_id_f640fcbb_fk_managerap` (`vehicle_id_id`),
  CONSTRAINT `managerapp_vehiclesd_company_id_id_ff32e737_fk_managerap` FOREIGN KEY (`company_id_id`) REFERENCES `managerapp_vehiclecompany` (`company_id`),
  CONSTRAINT `managerapp_vehiclesd_vehicle_id_id_f640fcbb_fk_managerap` FOREIGN KEY (`vehicle_id_id`) REFERENCES `managerapp_vehiclecategories` (`vehicle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- Dumping data for table vehicle_db.managerapp_vehiclesdetails: ~12 rows (approximately)
/*!40000 ALTER TABLE `managerapp_vehiclesdetails` DISABLE KEYS */;
INSERT INTO `managerapp_vehiclesdetails` (`vehicle_ref_id`, `vehicle_name`, `vehicle_price`, `vehicle_description`, `vehicle_model`, `vehicle_image`, `vehicle_isactive`, `u_email`, `vehicle_isavailable`, `company_id_id`, `vehicle_id_id`, `abs`, `airbags`, `seats`, `transmission`, `role_id`) VALUES
	(4, 'Verna', 120, 'Make the Difference', 2018, 'car-5.jpg', 1, 'vishav@live.com', 1, 1, 2, 1, '2-Airbags', '5-Seater', 'Manual', 1),
	(5, 'Fortuner', 200, 'Feel The Power', 2017, 'car-7.jpg', 1, 'vishav@live.com', 1, 10, 3, 1, '6-Airbags', '7-Seater', 'Manual', 1),
	(6, 'CLA', 250, 'For the Best Experience', 2018, 'car-10.jpg', 1, 'vishav@live.com', 1, 6, 4, 1, '6-Airbags', '2-Seater', 'Manual', 1),
	(9, '5-Series', 250, 'For The best Comfort and Ride Experience', 2019, 'car-11.jpg', 1, 'vishav@live.com', 1, 9, 4, 1, '12-Airbags', '5-Seater', 'Manual', 1),
	(18, 'Endaveour', 200, 'The Drive is all Yours', 2019, 'car-8.jpg', 1, 'vishav.mahajan@rediffmail.com', 1, 8, 3, 1, '2-Airbags', '7-Seater', 'Automatic', 4),
	(19, 'Polo', 50, 'Feel The ride with the New volkswagen', 2017, 'car-4.jpg', 1, 'vishav@live.com', 1, 5, 1, 0, '0-Airbags', '5-Seater', 'Manual', 1),
	(20, 'Baleno', 60, 'Make the  Memories you drive', 2018, 'car-1.jpg', 1, 'vishav@live.com', 1, 2, 1, 0, '2-Airbags', '5-Seater', 'Automatic', 1),
	(21, 'Amaze', 60, 'For Your Better Experience all new Amaze', 2018, 'car-16.jpg', 1, '0395ankita@gmail.com', 1, 3, 2, 1, '2-Airbags', '5-Seater', 'Manual', 1),
	(22, 'Titanium', 65, 'Ford Titanium for better ride', 2017, 'car-17.jpg', 1, '0395ankita@gmail.com', 1, 8, 3, 1, '2-Airbags', '5-Seater', 'Manual', 1),
	(24, 'Swift Dzire', 60, 'the best road experience', 2018, 'car-18.png', 1, '0395ankita@gmail.com', 1, 2, 2, 1, '2-Airbags', '5-Seater', 'Manual', 1),
	(25, 'i20', 80, 'Feel The Ride', 2019, 'car-2.jpg', 1, 'vishav@live.com', 1, 1, 1, 1, '6-Airbags', '5-Seater', 'Automatic', 1),
	(26, 'Honda City', 450, 'Good', 2019, 'pexels-photo-1020315.jpeg', 1, 'sanyammoudgil@icloud.com', 1, 3, 2, 1, '2-Airbags', '5-Seater', 'Manual', 4);
/*!40000 ALTER TABLE `managerapp_vehiclesdetails` ENABLE KEYS */;

-- Dumping structure for table vehicle_db.paypal_ipn
CREATE TABLE IF NOT EXISTS `paypal_ipn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business` varchar(127) NOT NULL,
  `charset` varchar(255) NOT NULL,
  `custom` varchar(256) NOT NULL,
  `notify_version` decimal(64,2) DEFAULT NULL,
  `parent_txn_id` varchar(19) NOT NULL,
  `receiver_email` varchar(254) NOT NULL,
  `receiver_id` varchar(255) NOT NULL,
  `residence_country` varchar(2) NOT NULL,
  `test_ipn` tinyint(1) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `txn_type` varchar(255) NOT NULL,
  `verify_sign` varchar(255) NOT NULL,
  `address_country` varchar(64) NOT NULL,
  `address_city` varchar(40) NOT NULL,
  `address_country_code` varchar(64) NOT NULL,
  `address_name` varchar(128) NOT NULL,
  `address_state` varchar(40) NOT NULL,
  `address_status` varchar(255) NOT NULL,
  `address_street` varchar(200) NOT NULL,
  `address_zip` varchar(20) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `payer_business_name` varchar(127) NOT NULL,
  `payer_email` varchar(127) NOT NULL,
  `payer_id` varchar(13) NOT NULL,
  `auth_amount` decimal(64,2) DEFAULT NULL,
  `auth_exp` varchar(28) NOT NULL,
  `auth_id` varchar(19) NOT NULL,
  `auth_status` varchar(255) NOT NULL,
  `exchange_rate` decimal(64,16) DEFAULT NULL,
  `invoice` varchar(127) NOT NULL,
  `item_name` varchar(127) NOT NULL,
  `item_number` varchar(127) NOT NULL,
  `mc_currency` varchar(32) NOT NULL,
  `mc_fee` decimal(64,2) DEFAULT NULL,
  `mc_gross` decimal(64,2) DEFAULT NULL,
  `mc_handling` decimal(64,2) DEFAULT NULL,
  `mc_shipping` decimal(64,2) DEFAULT NULL,
  `memo` varchar(255) NOT NULL,
  `num_cart_items` int(11) DEFAULT NULL,
  `option_name1` varchar(64) NOT NULL,
  `option_name2` varchar(64) NOT NULL,
  `payer_status` varchar(255) NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_gross` decimal(64,2) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `pending_reason` varchar(255) NOT NULL,
  `protection_eligibility` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reason_code` varchar(255) NOT NULL,
  `remaining_settle` decimal(64,2) DEFAULT NULL,
  `settle_amount` decimal(64,2) DEFAULT NULL,
  `settle_currency` varchar(32) NOT NULL,
  `shipping` decimal(64,2) DEFAULT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `tax` decimal(64,2) DEFAULT NULL,
  `transaction_entity` varchar(255) NOT NULL,
  `auction_buyer_id` varchar(64) NOT NULL,
  `auction_closing_date` datetime DEFAULT NULL,
  `auction_multi_item` int(11) DEFAULT NULL,
  `for_auction` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_per_cycle` decimal(64,2) DEFAULT NULL,
  `initial_payment_amount` decimal(64,2) DEFAULT NULL,
  `next_payment_date` datetime DEFAULT NULL,
  `outstanding_balance` decimal(64,2) DEFAULT NULL,
  `payment_cycle` varchar(255) NOT NULL,
  `period_type` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `profile_status` varchar(255) NOT NULL,
  `recurring_payment_id` varchar(255) NOT NULL,
  `rp_invoice_id` varchar(127) NOT NULL,
  `time_created` datetime DEFAULT NULL,
  `amount1` decimal(64,2) DEFAULT NULL,
  `amount2` decimal(64,2) DEFAULT NULL,
  `amount3` decimal(64,2) DEFAULT NULL,
  `mc_amount1` decimal(64,2) DEFAULT NULL,
  `mc_amount2` decimal(64,2) DEFAULT NULL,
  `mc_amount3` decimal(64,2) DEFAULT NULL,
  `password` varchar(24) NOT NULL,
  `period1` varchar(255) NOT NULL,
  `period2` varchar(255) NOT NULL,
  `period3` varchar(255) NOT NULL,
  `reattempt` varchar(1) NOT NULL,
  `recur_times` int(11) DEFAULT NULL,
  `recurring` varchar(1) NOT NULL,
  `retry_at` datetime DEFAULT NULL,
  `subscr_date` datetime DEFAULT NULL,
  `subscr_effective` datetime DEFAULT NULL,
  `subscr_id` varchar(19) NOT NULL,
  `username` varchar(64) NOT NULL,
  `case_creation_date` datetime DEFAULT NULL,
  `case_id` varchar(255) NOT NULL,
  `case_type` varchar(255) NOT NULL,
  `receipt_id` varchar(255) NOT NULL,
  `currency_code` varchar(32) NOT NULL,
  `handling_amount` decimal(64,2) DEFAULT NULL,
  `transaction_subject` varchar(256) NOT NULL,
  `ipaddress` char(39) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL,
  `flag_code` varchar(16) NOT NULL,
  `flag_info` longtext NOT NULL,
  `query` longtext NOT NULL,
  `response` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `from_view` varchar(6) DEFAULT NULL,
  `mp_id` varchar(128) DEFAULT NULL,
  `option_selection1` varchar(200) NOT NULL,
  `option_selection2` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paypal_ipn_txn_id_8fa22c44` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vehicle_db.paypal_ipn: ~0 rows (approximately)
/*!40000 ALTER TABLE `paypal_ipn` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_ipn` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
