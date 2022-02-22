-- --------------------------------------------------------
-- Host:                         kron1
-- Server version:               10.1.10-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for codebreed
CREATE DATABASE IF NOT EXISTS `codebreed` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `codebreed`;


-- Dumping structure for table codebreed.artifactpropertyvalue
CREATE TABLE IF NOT EXISTS `artifactpropertyvalue` (
  `ARTIFACTPROPERTYVALUEID` bigint(20) NOT NULL,
  `ARTIFACTPROPVALUETOPROPERTY` bigint(20) DEFAULT NULL,
  `ARTIFACTTOPROPERTYVALUE` bigint(20) DEFAULT NULL,
  `SCREENARTIFACTTOPROPERTYVALUE` bigint(20) DEFAULT NULL,
  `PROPERTYVALUE` varchar(2000) NOT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ARTIFACTPROPERTYVALUEID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.artifactpropertyvalue: ~34 rows (approximately)
/*!40000 ALTER TABLE `artifactpropertyvalue` DISABLE KEYS */;
INSERT INTO `artifactpropertyvalue` (`ARTIFACTPROPERTYVALUEID`, `ARTIFACTPROPVALUETOPROPERTY`, `ARTIFACTTOPROPERTYVALUE`, `SCREENARTIFACTTOPROPERTYVALUE`, `PROPERTYVALUE`, `VERSION`, `CREATEDBY`, `UPDATEDBY`, `CREATEDON`, `UPDATEDON`) VALUES
	(1, 2, NULL, 63, 'Name', '2012-12-31 17:10:58', NULL, NULL, NULL, NULL),
	(2, 6, NULL, 63, 'true', '2012-12-31 17:10:58', NULL, NULL, NULL, NULL),
	(3, 7, NULL, 63, '-1', '2012-12-31 17:10:58', NULL, NULL, NULL, NULL),
	(4, 6, 89, NULL, 'true', '2012-12-31 18:19:25', NULL, NULL, NULL, NULL),
	(5, 7, 89, NULL, '4', '2012-12-31 18:19:25', NULL, NULL, NULL, NULL),
	(6, 4, 63, NULL, 'TextBox', '2016-01-09 11:15:49', 'paulm', NULL, '2013-04-07 10:53:52', '2016-01-09 11:15:49'),
	(7, 2, 63, NULL, 'Name', '2016-01-09 11:15:49', 'paulm', NULL, '2013-04-07 10:53:53', '2016-01-09 11:15:49'),
	(8, 5, 63, NULL, '1', '2016-01-09 11:15:49', 'paulm', NULL, '2013-04-07 10:53:53', '2016-01-09 11:15:49'),
	(9, 6, 63, NULL, 'True', '2016-01-09 11:15:49', 'paulm', NULL, '2013-04-07 10:53:53', '2016-01-09 11:15:49'),
	(10, 7, 63, NULL, '-1', '2016-01-09 11:15:49', 'paulm', NULL, '2013-04-07 10:53:53', '2016-01-09 11:15:49'),
	(16, 6, 175, NULL, 'true', '2016-01-01 13:45:26', 'testing', 'testing', '2016-01-01 13:45:26', '2016-01-01 13:45:26'),
	(17, 2, 175, NULL, 'First Name', '2016-01-01 13:45:26', 'testing', 'testing', '2016-01-01 13:45:26', '2016-01-01 13:45:26'),
	(18, 4, 175, NULL, 'TextBox', '2016-01-01 13:45:26', 'testing', 'testing', '2016-01-01 13:45:26', '2016-01-01 13:45:26'),
	(19, 5, 175, NULL, '1', '2016-01-01 13:45:26', 'testing', 'testing', '2016-01-01 13:45:26', '2016-01-01 13:45:26'),
	(20, 6, 176, NULL, 'True', '2016-01-03 19:14:44', 'testing', 'testing', '2016-01-01 13:45:47', '2016-01-03 19:14:44'),
	(21, 2, 176, NULL, 'Last Name', '2016-01-03 19:14:44', 'testing', 'testing', '2016-01-01 13:45:47', '2016-01-03 19:14:44'),
	(22, 4, 176, NULL, 'TextBox', '2016-01-03 19:14:44', 'testing', 'testing', '2016-01-01 13:45:47', '2016-01-03 19:14:44'),
	(23, 5, 176, NULL, '3', '2016-01-03 19:14:44', 'testing', 'testing', '2016-01-01 13:45:47', '2016-01-03 19:14:44'),
	(24, 6, 179, NULL, 'True', '2016-01-01 18:37:57', 'testing', 'testing', '2016-01-01 18:32:27', '2016-01-01 18:37:57'),
	(25, 2, 179, NULL, 'fred', '2016-01-01 18:37:57', 'testing', 'testing', '2016-01-01 18:32:27', '2016-01-01 18:37:57'),
	(26, 4, 179, NULL, 'TextBox', '2016-01-01 18:37:57', 'testing', 'testing', '2016-01-01 18:32:27', '2016-01-01 18:37:57'),
	(27, 6, 178, NULL, 'True', '2016-01-02 11:57:04', 'testing', 'testing', '2016-01-02 11:57:04', '2016-01-02 11:57:04'),
	(28, 4, 178, NULL, 'TextBox', '2016-01-02 11:57:04', 'testing', 'testing', '2016-01-02 11:57:04', '2016-01-02 11:57:04'),
	(29, 6, 180, NULL, 'True', '2016-01-05 11:33:33', 'testing', 'testing', '2016-01-05 11:33:33', '2016-01-05 11:33:33'),
	(30, 6, 183, NULL, 'true', '2016-01-18 10:43:22', 'testing', 'testing', '2016-01-18 10:43:22', '2016-01-18 10:43:22'),
	(31, 2, 183, NULL, 'Last Update', '2016-01-18 10:43:22', 'testing', 'testing', '2016-01-18 10:43:22', '2016-01-18 10:43:22'),
	(32, 4, 183, NULL, 'TextBox', '2016-01-18 10:43:32', 'testing', 'testing', '2016-01-18 10:43:32', '2016-01-18 10:43:32'),
	(33, 5, 183, NULL, '3', '2016-01-18 10:43:32', 'testing', 'testing', '2016-01-18 10:43:32', '2016-01-18 10:43:32'),
	(34, 6, 181, NULL, 'true', '2016-01-20 11:18:29', 'testing', 'testing', '2016-01-20 11:18:29', '2016-01-20 11:18:29'),
	(35, 2, 181, NULL, 'First Name', '2016-01-20 11:18:29', 'testing', 'testing', '2016-01-20 11:18:29', '2016-01-20 11:18:29'),
	(36, 11, 181, NULL, 'True', '2016-01-20 11:18:29', 'testing', 'testing', '2016-01-20 11:18:29', '2016-01-20 11:18:29'),
	(37, 6, 182, NULL, 'true', '2016-01-20 11:18:37', 'testing', 'testing', '2016-01-20 11:18:37', '2016-01-20 11:18:37'),
	(38, 2, 182, NULL, 'Last Name', '2016-01-20 11:18:37', 'testing', 'testing', '2016-01-20 11:18:37', '2016-01-20 11:18:37'),
	(39, 11, 182, NULL, 'True', '2016-01-20 11:18:37', 'testing', 'testing', '2016-01-20 11:18:37', '2016-01-20 11:18:37');
/*!40000 ALTER TABLE `artifactpropertyvalue` ENABLE KEYS */;


-- Dumping structure for table codebreed.association
CREATE TABLE IF NOT EXISTS `association` (
  `ASSOCIATIONID` bigint(20) NOT NULL,
  `OWNED` bigint(20) DEFAULT NULL,
  `OWNER` bigint(20) DEFAULT NULL,
  `MODELASSOCIATION` bigint(20) DEFAULT NULL,
  `NAME` varchar(30) NOT NULL,
  `TYPE` int(11) NOT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ASSOCIATIONID`),
  KEY `ModelAssociation_idx` (`MODELASSOCIATION`),
  CONSTRAINT `ModelAssociation` FOREIGN KEY (`MODELASSOCIATION`) REFERENCES `model` (`MODELID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_MODELASSOCIATION` FOREIGN KEY (`MODELASSOCIATION`) REFERENCES `model` (`MODELID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.association: ~43 rows (approximately)
/*!40000 ALTER TABLE `association` DISABLE KEYS */;
INSERT INTO `association` (`ASSOCIATIONID`, `OWNED`, `OWNER`, `MODELASSOCIATION`, `NAME`, `TYPE`, `VERSION`, `CREATEDBY`, `UPDATEDBY`, `CREATEDON`, `UPDATEDON`) VALUES
	(2, 15, 13, 14, 'jbosstochild', 0, '2012-12-23 09:32:49', NULL, NULL, NULL, NULL),
	(3, 16, 38, 26, 'RelationToPropertyValue', 0, '2013-01-11 15:51:46', NULL, 'paulm', NULL, '2013-01-11 15:51:46'),
	(18, 38, 36, 26, 'ModelRelation', 0, '2012-07-21 18:06:54', NULL, NULL, NULL, NULL),
	(19, 37, 36, 26, 'ModelAssociation', 0, '2012-07-21 18:07:16', NULL, NULL, NULL, NULL),
	(20, 39, 38, 26, 'RelationAttribute', 0, '2012-07-21 18:07:59', NULL, NULL, NULL, NULL),
	(37, 66, 67, 39, 'UsersGroups', 2, '2012-07-25 14:48:15', NULL, NULL, NULL, NULL),
	(38, 70, 69, 26, 'MasterPropertyToCategory', 2, '2012-07-26 10:17:33', NULL, NULL, NULL, NULL),
	(39, 71, 69, 26, 'MasterPropertyToGroup', 3, '2012-11-15 10:13:47', NULL, NULL, NULL, NULL),
	(41, 74, 72, 26, 'ArtifactToPropertyValue', 0, '2012-07-26 10:20:17', NULL, NULL, NULL, NULL),
	(42, 69, 73, 26, 'ScreenPropValueToProperty', 1, '2012-07-26 10:47:19', NULL, NULL, NULL, NULL),
	(43, 69, 74, 26, 'ArtifactPropValueToProperty', 1, '2012-07-26 10:50:59', NULL, NULL, NULL, NULL),
	(46, 76, 69, 26, 'MasterPropertyToType', 3, '2012-11-15 10:14:19', NULL, NULL, NULL, NULL),
	(49, 78, 36, 26, 'ModelToBuild', 0, '2012-08-01 12:57:24', NULL, NULL, NULL, NULL),
	(51, 79, 36, 26, 'ModelToScreenFamily', 0, '2012-08-02 16:03:32', NULL, NULL, NULL, NULL),
	(52, 80, 79, 26, 'ScreenFamilyToScreenChild', 0, '2012-08-02 16:04:12', NULL, NULL, NULL, NULL),
	(53, 38, 79, 26, 'ScreenFamilyToRelation', 3, '2012-11-15 10:14:35', NULL, NULL, NULL, NULL),
	(55, 37, 80, 26, 'ScreenChildToAssociation', 3, '2012-11-15 10:14:49', NULL, NULL, NULL, NULL),
	(56, 80, 80, 26, 'ScreenChildToSelf', 0, '2012-08-02 20:54:48', NULL, NULL, NULL, NULL),
	(57, 38, 37, 26, 'Owned', 3, '2012-11-15 10:15:12', NULL, NULL, NULL, NULL),
	(58, 38, 37, 26, 'Owner', 3, '2012-11-15 10:15:24', NULL, NULL, NULL, NULL),
	(60, 72, 80, 26, 'ChildToArtifact', 0, '2012-08-31 13:46:23', NULL, NULL, NULL, NULL),
	(61, 73, 79, 26, 'FamilyToScreenPropValue', 0, '2012-08-31 13:43:15', NULL, NULL, NULL, NULL),
	(62, 74, 72, 26, 'ScreenArtifactToPropertyValue', 0, '2012-08-31 07:18:07', NULL, NULL, NULL, NULL),
	(63, 73, 80, 26, 'ChildToScreenPropValue', 0, '2012-08-31 13:44:04', NULL, NULL, NULL, NULL),
	(64, 72, 79, 26, 'FamilyToArtifact', 0, '2012-08-31 13:49:07', NULL, NULL, NULL, NULL),
	(65, 39, 72, 26, 'ArtifactToAttribute', 3, '2012-11-15 10:15:41', NULL, NULL, NULL, NULL),
	(66, 102, 69, 26, 'MasterProperyToValueList', 0, '2012-09-01 04:17:13', NULL, NULL, NULL, NULL),
	(67, 104, 103, 26, 'ListHeaderToDetail', 0, '2012-09-01 17:00:47', NULL, NULL, NULL, NULL),
	(68, 121, 120, 48, 'arsetobarse', 0, '2015-11-14 18:26:12', NULL, NULL, '2015-11-14 18:26:12', '2015-11-14 18:26:12'),
	(70, 145, 143, 53, 'Address_City', 3, '2016-01-18 10:48:02', NULL, NULL, '2016-01-17 20:41:03', '2016-01-18 10:48:02'),
	(71, 146, 145, 53, 'City_Country', 3, '2016-01-17 20:41:40', NULL, NULL, '2016-01-17 20:41:40', '2016-01-17 20:41:40'),
	(72, 155, 147, 53, 'Customer_Store', 3, '2016-01-17 20:42:31', NULL, NULL, '2016-01-17 20:42:31', '2016-01-17 20:42:31'),
	(73, 143, 147, 53, 'Customer_Address', 1, '2016-01-17 20:43:08', NULL, NULL, '2016-01-17 20:43:08', '2016-01-17 20:43:08'),
	(74, 151, 148, 53, 'Film_Lanaguage', 3, '2016-01-17 20:43:44', NULL, NULL, '2016-01-17 20:43:44', '2016-01-17 20:43:44'),
	(75, 142, 148, 53, 'Film_Actor', 2, '2016-01-17 20:44:23', NULL, NULL, '2016-01-17 20:44:23', '2016-01-17 20:44:23'),
	(76, 144, 148, 53, 'Film_Category', 2, '2016-01-17 20:45:00', NULL, NULL, '2016-01-17 20:45:00', '2016-01-17 20:45:00'),
	(77, 152, 147, 53, 'Customer_Payment', 0, '2016-01-17 21:32:45', NULL, NULL, '2016-01-17 21:32:45', '2016-01-17 21:32:45'),
	(78, 153, 152, 53, 'Payment_Rental', 1, '2016-01-17 21:33:46', NULL, NULL, '2016-01-17 21:33:46', '2016-01-17 21:33:46'),
	(79, 153, 147, 53, 'Customer_Rental', 0, '2016-01-17 21:36:41', NULL, NULL, '2016-01-17 21:36:41', '2016-01-17 21:36:41'),
	(80, 150, 153, 53, 'Rental_Inventory', 3, '2016-01-17 21:37:50', NULL, NULL, '2016-01-17 21:37:50', '2016-01-17 21:37:50'),
	(81, 99, 156, 42, 'test', 2, '2016-01-18 20:38:06', NULL, NULL, '2016-01-18 20:38:06', '2016-01-18 20:38:06'),
	(82, 100, 99, 42, 'test2', 0, '2016-01-18 20:38:39', NULL, NULL, '2016-01-18 20:38:39', '2016-01-18 20:38:39'),
	(83, 158, 157, 42, 'I am testing', 2, '2016-01-20 16:04:02', NULL, NULL, '2016-01-20 16:04:02', '2016-01-20 16:04:02');
/*!40000 ALTER TABLE `association` ENABLE KEYS */;


-- Dumping structure for table codebreed.attribute
CREATE TABLE IF NOT EXISTS `attribute` (
  `ATTRIBUTEID` bigint(20) NOT NULL,
  `RELATIONATTRIBUTE` bigint(20) DEFAULT NULL,
  `NAME` varchar(30) NOT NULL,
  `TYPE` int(11) NOT NULL,
  `ATTRIBUTELENGTH` int(11) DEFAULT NULL,
  `ALLOWNULL` tinyint(1) NOT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ATTRIBUTEID`),
  KEY `fk_RELATIONATTRIBUTE` (`RELATIONATTRIBUTE`),
  CONSTRAINT `fk_RELATIONATTRIBUTE` FOREIGN KEY (`RELATIONATTRIBUTE`) REFERENCES `relation` (`RELATIONID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.attribute: ~135 rows (approximately)
/*!40000 ALTER TABLE `attribute` DISABLE KEYS */;
INSERT INTO `attribute` (`ATTRIBUTEID`, `RELATIONATTRIBUTE`, `NAME`, `TYPE`, `ATTRIBUTELENGTH`, `ALLOWNULL`, `VERSION`, `CREATEDBY`, `UPDATEDBY`, `CREATEDON`, `UPDATEDON`) VALUES
	(6, 13, 'myname', 0, 0, 1, '2012-12-23 09:31:42', NULL, NULL, NULL, NULL),
	(7, 16, 'PropertyValue', 1, 2000, 0, '2013-01-11 16:06:02', NULL, 'paulm', NULL, '2013-01-11 16:05:52'),
	(14, 15, 'test', 1, 4, 0, '2013-01-29 17:12:52', 'paulm', NULL, '2013-01-29 17:12:52', NULL),
	(15, 22, 'ImageName', 1, 150, 0, '2013-03-31 13:07:39', 'paulm', NULL, '2013-03-31 13:07:39', NULL),
	(64, 36, 'name', 1, 40, 0, '2012-07-21 17:58:25', NULL, NULL, NULL, NULL),
	(65, 37, 'Name', 1, 30, 0, '2012-07-21 17:59:23', NULL, NULL, NULL, NULL),
	(66, 37, 'type', 2, 0, 0, '2012-07-21 17:59:37', NULL, NULL, NULL, NULL),
	(69, 38, 'name', 1, 30, 0, '2012-07-21 18:01:14', NULL, NULL, NULL, NULL),
	(70, 38, 'lastmodified', 9, 0, 1, '2012-07-21 18:01:35', NULL, NULL, NULL, NULL),
	(71, 38, 'lastbuilt', 9, 0, 1, '2012-07-21 18:01:50', NULL, NULL, NULL, NULL),
	(72, 38, 'frozen', 3, 0, 1, '2012-07-21 18:02:15', NULL, NULL, NULL, NULL),
	(73, 39, 'name', 1, 30, 0, '2012-07-21 18:04:29', NULL, NULL, NULL, NULL),
	(74, 39, 'type', 2, 0, 0, '2012-07-21 18:04:43', NULL, NULL, NULL, NULL),
	(75, 39, 'attributelength', 2, 0, 1, '2012-07-21 18:05:10', NULL, NULL, NULL, NULL),
	(76, 39, 'allownull', 3, 0, 0, '2012-07-21 18:05:23', NULL, NULL, NULL, NULL),
	(139, 66, 'Name', 1, 30, 0, '2012-07-25 14:43:16', NULL, NULL, NULL, NULL),
	(140, 66, 'AppID', 2, 0, 1, '2012-07-25 14:43:35', NULL, NULL, NULL, NULL),
	(141, 67, 'UserName', 1, 30, 0, '2012-07-25 14:44:45', NULL, NULL, NULL, NULL),
	(142, 67, 'Password', 1, 64, 0, '2012-07-25 14:45:02', NULL, NULL, NULL, NULL),
	(143, 67, 'AppID', 2, 0, 1, '2012-07-25 14:45:20', NULL, NULL, NULL, NULL),
	(144, 67, 'Email', 1, 254, 1, '2012-07-25 14:45:42', NULL, NULL, NULL, NULL),
	(146, 69, 'Name', 1, 40, 0, '2012-07-26 10:09:01', NULL, NULL, NULL, NULL),
	(147, 70, 'Name', 1, 40, 0, '2012-07-26 10:09:36', NULL, NULL, NULL, NULL),
	(148, 71, 'Name', 1, 40, 0, '2012-07-26 10:10:30', NULL, NULL, NULL, NULL),
	(149, 74, 'PropertyValue', 1, 2000, 0, '2015-11-13 15:57:10', NULL, NULL, NULL, '2015-11-13 15:57:10'),
	(150, 73, 'PropertyValue', 1, 2000, 0, '2012-07-26 10:52:44', NULL, NULL, NULL, NULL),
	(151, 75, 'Name', 1, 40, 0, '2012-07-26 10:54:20', NULL, NULL, NULL, NULL),
	(152, 76, 'Name', 1, 40, 0, '2012-07-26 10:59:53', NULL, NULL, NULL, NULL),
	(153, 76, 'DisplayControl', 2, 0, 0, '2012-07-26 11:00:46', NULL, NULL, NULL, NULL),
	(154, 76, 'Notes', 1, 256, 1, '2012-07-26 11:00:57', NULL, NULL, NULL, NULL),
	(157, 72, 'Name', 1, 40, 0, '2012-08-01 10:34:04', NULL, NULL, NULL, NULL),
	(158, 78, 'Name', 1, 40, 0, '2012-08-01 12:54:48', NULL, NULL, NULL, NULL),
	(159, 78, 'ProjectPath', 1, 256, 0, '2012-08-01 12:55:03', NULL, NULL, NULL, NULL),
	(160, 78, 'ebjname', 1, 40, 0, '2012-08-01 12:55:26', NULL, NULL, NULL, NULL),
	(161, 78, 'warname', 1, 40, 0, '2012-08-01 12:55:49', NULL, NULL, NULL, NULL),
	(162, 78, 'persistencename', 1, 999, 0, '2012-11-10 13:54:16', NULL, NULL, NULL, NULL),
	(163, 78, 'packagecom', 1, 40, 0, '2012-08-01 12:56:37', NULL, NULL, NULL, NULL),
	(164, 78, 'packagedot', 1, 40, 0, '2012-08-01 12:56:51', NULL, NULL, NULL, NULL),
	(165, 79, 'Name', 1, 40, 0, '2012-08-02 16:01:22', NULL, NULL, NULL, NULL),
	(166, 80, 'Name', 1, 40, 0, '2012-08-02 16:02:36', NULL, NULL, NULL, NULL),
	(170, 99, 'testattribute', 5, 0, 1, '2015-11-14 22:04:59', NULL, NULL, NULL, '2015-11-14 22:04:59'),
	(172, 69, 'DefaultValue', 1, 40, 1, '2012-08-31 16:21:11', NULL, NULL, NULL, NULL),
	(173, 69, 'Notes', 1, 999, 1, '2012-09-01 00:57:45', NULL, NULL, NULL, NULL),
	(174, 102, 'Name', 1, 40, 0, '2012-09-01 04:13:39', NULL, NULL, NULL, NULL),
	(175, 102, 'Code', 1, 10, 0, '2012-09-01 04:14:32', NULL, NULL, NULL, NULL),
	(176, 102, 'Display', 1, 40, 0, '2012-09-01 04:15:07', NULL, NULL, NULL, NULL),
	(177, 103, 'Name', 1, 40, 0, '2012-09-01 16:57:37', NULL, NULL, NULL, NULL),
	(178, 104, 'Code', 1, 5, 0, '2012-09-01 16:59:17', NULL, NULL, NULL, NULL),
	(179, 104, 'Label', 1, 40, 0, '2012-09-01 16:59:26', NULL, NULL, NULL, NULL),
	(187, 78, 'host', 1, 256, 1, '2012-11-21 11:13:44', NULL, NULL, NULL, NULL),
	(188, 78, 'port', 2, 0, 1, '2012-11-21 11:13:58', NULL, NULL, NULL, NULL),
	(189, 78, 'databaseserver', 1, 256, 1, '2012-11-21 11:14:23', NULL, NULL, NULL, NULL),
	(190, 78, 'databaseName', 1, 256, 1, '2012-11-21 11:14:45', NULL, NULL, NULL, NULL),
	(191, 78, 'membershipserver', 1, 256, 1, '2012-11-21 11:15:10', NULL, NULL, NULL, NULL),
	(192, 78, 'templatepath', 1, 260, 1, '2012-11-21 11:16:42', NULL, NULL, NULL, NULL),
	(193, 78, 'toolspath', 1, 260, 1, '2012-11-21 11:17:11', NULL, NULL, NULL, NULL),
	(194, 78, 'libpath', 1, 260, 1, '2012-11-21 11:18:05', NULL, NULL, NULL, NULL),
	(195, 78, 'servertype', 2, 0, 1, '2012-11-21 11:19:12', NULL, NULL, NULL, NULL),
	(196, 78, 'hostplatform', 2, 0, 1, '2012-11-21 11:19:34', NULL, NULL, NULL, NULL),
	(198, 78, 'MembershipDatabase', 1, 256, 1, '2012-11-24 20:35:46', NULL, NULL, NULL, NULL),
	(199, 113, 'MembershipServer', 1, 256, 1, '2012-11-24 20:42:40', NULL, NULL, NULL, NULL),
	(200, 113, 'MembershipDatabase', 1, 256, 0, '2012-11-24 20:43:04', NULL, NULL, NULL, NULL),
	(201, 113, 'DatabaseServer', 1, 256, 0, '2012-11-24 20:44:16', NULL, NULL, NULL, NULL),
	(202, 113, 'DatabaseName', 1, 256, 0, '2012-11-24 20:44:39', NULL, NULL, NULL, NULL),
	(203, 78, 'serviceHost', 1, 256, 1, '2012-11-25 15:15:40', NULL, NULL, NULL, NULL),
	(204, 78, 'servicePort', 2, 0, 1, '2012-11-25 15:15:56', NULL, NULL, NULL, NULL),
	(205, 117, 'Name', 4, 1, 1, '2015-11-13 23:09:24', NULL, '14', '2015-11-13 15:13:40', '2015-11-13 23:09:24'),
	(206, 118, 'LeoWanker', 11, 0, 1, '2015-11-26 19:44:37', NULL, NULL, '2015-11-13 23:09:47', '2015-11-13 23:09:47'),
	(207, 119, 'Myself', 3, 0, 1, '2015-11-26 19:44:37', NULL, NULL, '2015-11-14 17:35:25', '2015-11-14 17:38:53'),
	(208, 119, 'Brask', 4, 0, 0, '2015-11-26 19:44:37', NULL, NULL, '2015-11-14 17:36:50', '2015-11-14 17:38:55'),
	(212, 121, 'One', 5, 0, 0, '2015-11-26 19:44:37', NULL, NULL, '2015-11-14 18:20:05', '2015-11-14 18:20:05'),
	(213, 121, 'Two', 1, 0, 0, '2015-11-26 19:44:37', NULL, NULL, '2015-11-14 18:20:19', '2015-11-14 18:20:19'),
	(214, 120, 'One', 6, 0, 0, '2015-11-26 19:44:37', NULL, NULL, '2015-11-14 18:20:47', '2015-11-14 18:20:47'),
	(215, 100, 'Second', 3, 0, 1, '2015-11-26 19:44:37', NULL, NULL, '2015-11-14 22:05:25', '2015-11-14 22:05:25'),
	(216, 122, 'Test Attribute', 1, 0, 1, '2015-11-26 19:44:37', NULL, NULL, '2015-11-15 21:31:03', '2015-11-15 21:31:03'),
	(219, 123, 'child', 1, 0, 1, '2015-11-26 19:44:37', NULL, NULL, '2015-11-15 21:32:30', '2015-11-15 21:32:30'),
	(220, 124, 'Name', 1, 0, 0, '2015-11-26 19:44:37', NULL, NULL, '2015-11-16 18:34:41', '2015-11-16 18:34:41'),
	(225, 125, 'FirstName', 1, NULL, 0, '2015-12-30 16:17:30', NULL, NULL, '2015-12-30 16:17:30', '2015-12-30 16:17:30'),
	(226, 125, 'LastName', 1, NULL, 0, '2015-12-30 16:17:57', NULL, NULL, '2015-12-30 16:17:57', '2015-12-30 16:17:57'),
	(227, 126, 'Name', 1, NULL, 0, '2015-12-30 16:18:24', NULL, NULL, '2015-12-30 16:18:24', '2015-12-30 16:18:24'),
	(228, 127, 'FirstName', 1, NULL, 0, '2015-12-30 16:18:46', NULL, NULL, '2015-12-30 16:18:46', '2015-12-30 16:18:46'),
	(230, 130, 'Abraham', 1, NULL, 0, '2016-01-01 13:43:55', NULL, NULL, '2016-01-01 13:43:55', '2016-01-01 13:43:55'),
	(231, 133, 'ProductName', 1, NULL, 0, '2016-01-01 18:47:16', NULL, NULL, '2016-01-01 18:47:16', '2016-01-01 18:47:16'),
	(232, 133, 'ProductType', 2, NULL, 0, '2016-01-01 18:47:31', NULL, NULL, '2016-01-01 18:47:31', '2016-01-01 18:47:31'),
	(233, 138, 'ID', 1, NULL, 0, '2016-01-04 14:42:09', NULL, NULL, '2016-01-04 14:42:09', '2016-01-04 14:42:09'),
	(234, 138, 'DateDue', 4, NULL, 0, '2016-01-04 14:42:27', NULL, NULL, '2016-01-04 14:42:27', '2016-01-04 14:42:27'),
	(235, 138, 'DateReceived', 4, NULL, 1, '2016-01-04 14:42:41', NULL, NULL, '2016-01-04 14:42:41', '2016-01-04 14:42:41'),
	(236, 138, 'Amount', 5, NULL, 0, '2016-01-04 14:42:57', NULL, NULL, '2016-01-04 14:42:57', '2016-01-04 14:42:57'),
	(237, 139, 'Description', 1, NULL, 0, '2016-01-04 14:43:25', NULL, NULL, '2016-01-04 14:43:25', '2016-01-04 14:43:25'),
	(238, 139, 'Amount', 5, NULL, 0, '2016-01-04 14:43:51', NULL, NULL, '2016-01-04 14:43:51', '2016-01-04 14:43:51'),
	(239, 139, 'Discount', 5, NULL, 0, '2016-01-04 14:44:08', NULL, NULL, '2016-01-04 14:44:08', '2016-01-04 14:44:08'),
	(240, 135, 'Amount', 2, NULL, 0, '2016-01-04 14:44:27', NULL, NULL, '2016-01-04 14:44:27', '2016-01-04 14:44:27'),
	(241, 135, 'Taxable', 3, NULL, 0, '2016-01-04 14:44:49', NULL, NULL, '2016-01-04 14:44:49', '2016-01-04 14:44:49'),
	(242, 140, 'Name', 1, 50, 0, '2016-01-16 17:57:59', NULL, NULL, '2016-01-16 17:57:59', '2016-01-16 17:57:59'),
	(243, 140, 'GroupName', 1, 50, 0, '2016-01-18 11:48:32', NULL, NULL, '2016-01-16 18:27:29', '2016-01-18 11:48:32'),
	(244, 141, 'NationalIDNumber', 1, 15, 0, '2016-01-16 23:37:48', NULL, NULL, '2016-01-16 18:32:19', '2016-01-16 23:37:48'),
	(245, 141, 'LoginID', 1, 256, 0, '2016-01-16 18:33:17', NULL, NULL, '2016-01-16 18:33:17', '2016-01-16 18:33:17'),
	(246, 141, 'JobTitle', 1, 50, 0, '2016-01-16 23:38:08', NULL, NULL, '2016-01-16 23:36:01', '2016-01-16 23:38:08'),
	(247, 141, 'OrganizaitonLevel', 2, NULL, 0, '2016-01-17 00:00:14', NULL, NULL, '2016-01-17 00:00:14', '2016-01-17 00:00:14'),
	(248, 142, 'first_name', 1, 45, 0, '2016-01-17 10:21:05', NULL, NULL, '2016-01-17 10:21:05', '2016-01-17 10:21:05'),
	(249, 142, 'last_name', 1, 45, 0, '2016-01-17 10:21:25', NULL, NULL, '2016-01-17 10:21:25', '2016-01-17 10:21:25'),
	(250, 142, 'last_update', 4, NULL, 0, '2016-01-17 10:22:03', NULL, NULL, '2016-01-17 10:22:03', '2016-01-17 10:22:03'),
	(251, 143, 'address', 1, 50, 0, '2016-01-17 10:22:46', NULL, NULL, '2016-01-17 10:22:46', '2016-01-17 10:22:46'),
	(253, 143, 'address2', 1, 55, 0, '2016-01-17 10:23:53', NULL, NULL, '2016-01-17 10:23:53', '2016-01-17 10:23:53'),
	(254, 143, 'district', 1, 20, 0, '2016-01-17 10:24:18', NULL, NULL, '2016-01-17 10:24:18', '2016-01-17 10:24:18'),
	(255, 143, 'postal_code', 1, 10, 0, '2016-01-17 10:24:44', NULL, NULL, '2016-01-17 10:24:44', '2016-01-17 10:24:44'),
	(256, 143, 'phone', 1, 20, 0, '2016-01-17 10:25:03', NULL, NULL, '2016-01-17 10:25:03', '2016-01-17 10:25:03'),
	(257, 144, 'Name', 1, 25, 0, '2016-01-17 10:26:29', NULL, NULL, '2016-01-17 10:26:29', '2016-01-17 10:26:29'),
	(258, 145, 'city', 1, 50, 0, '2016-01-17 10:27:08', NULL, NULL, '2016-01-17 10:27:08', '2016-01-17 10:27:08'),
	(259, 146, 'country', 1, 50, 0, '2016-01-17 10:40:31', NULL, NULL, '2016-01-17 10:40:31', '2016-01-17 10:40:31'),
	(260, 147, 'first_name', 1, 45, 0, '2016-01-17 17:26:50', NULL, NULL, '2016-01-17 17:26:50', '2016-01-17 17:26:50'),
	(261, 147, 'last_name', 1, 45, 0, '2016-01-17 17:27:19', NULL, NULL, '2016-01-17 17:27:19', '2016-01-17 17:27:19'),
	(262, 147, 'email', 1, 50, 0, '2016-01-17 17:31:36', NULL, NULL, '2016-01-17 17:31:36', '2016-01-17 17:31:36'),
	(263, 147, 'active', 3, NULL, 0, '2016-01-17 17:32:18', NULL, NULL, '2016-01-17 17:32:18', '2016-01-17 17:32:18'),
	(264, 148, 'title', 1, 255, 0, '2016-01-17 17:33:00', NULL, NULL, '2016-01-17 17:33:00', '2016-01-17 17:33:00'),
	(265, 148, 'description', 13, NULL, 1, '2016-01-17 17:33:31', NULL, NULL, '2016-01-17 17:33:31', '2016-01-17 17:33:31'),
	(266, 148, 'release_year', 2, NULL, 1, '2016-01-17 17:34:03', NULL, NULL, '2016-01-17 17:34:03', '2016-01-17 17:34:03'),
	(267, 148, 'rental_duration', 8, NULL, 1, '2016-01-17 18:02:25', NULL, NULL, '2016-01-17 18:02:25', '2016-01-17 18:02:25'),
	(268, 148, 'rental_rate', 5, NULL, 1, '2016-01-17 18:02:54', NULL, NULL, '2016-01-17 18:02:54', '2016-01-17 18:02:54'),
	(269, 148, 'length', 8, NULL, 1, '2016-01-17 18:03:13', NULL, NULL, '2016-01-17 18:03:13', '2016-01-17 18:03:13'),
	(270, 148, 'replacement_cost', 5, NULL, 1, '2016-01-17 18:03:34', NULL, NULL, '2016-01-17 18:03:34', '2016-01-17 18:03:34'),
	(271, 149, 'title', 1, 255, 0, '2016-01-17 18:53:42', NULL, NULL, '2016-01-17 18:53:42', '2016-01-17 18:53:42'),
	(272, 157, 'fred', 1, 88, 1, '2016-01-18 20:56:39', NULL, NULL, '2016-01-18 20:56:39', '2016-01-18 20:56:39'),
	(273, 156, 'testingit', 1, 45, 1, '2016-01-18 21:08:14', NULL, NULL, '2016-01-18 21:08:14', '2016-01-18 21:08:14'),
	(274, 156, 'testing002', 1, 88, 1, '2016-01-18 21:08:36', NULL, NULL, '2016-01-18 21:08:36', '2016-01-18 21:08:36'),
	(275, 156, 'testing003', 1, 88, 1, '2016-01-18 21:15:45', NULL, NULL, '2016-01-18 21:15:45', '2016-01-18 21:15:45'),
	(276, 156, 'testing8', 3, NULL, 0, '2016-01-18 21:15:57', NULL, NULL, '2016-01-18 21:15:57', '2016-01-18 21:15:57'),
	(277, 159, 'PropertyValue', 1, 2000, 0, '2016-01-20 12:07:08', NULL, NULL, '2016-01-20 12:07:08', '2016-01-20 12:07:08'),
	(278, 160, 'FirstName', 3, NULL, 0, '2016-01-20 15:14:49', NULL, NULL, '2016-01-20 15:14:49', '2016-01-20 15:14:49'),
	(279, 161, 'FirstName', 3, NULL, 0, '2016-01-20 15:15:39', NULL, NULL, '2016-01-20 15:15:39', '2016-01-20 15:15:39'),
	(280, 162, 'FirstName', 1, 34, 0, '2016-01-20 15:46:37', NULL, NULL, '2016-01-20 15:46:37', '2016-01-20 15:46:37'),
	(281, 162, 'LastName', 5, NULL, 1, '2016-01-20 15:50:32', NULL, NULL, '2016-01-20 15:50:32', '2016-01-20 15:50:32'),
	(282, 162, 'Address', 1, 88, 0, '2016-01-20 15:50:43', NULL, NULL, '2016-01-20 15:50:43', '2016-01-20 15:50:43'),
	(283, 163, 'Wino', 2, NULL, 0, '2016-01-26 18:23:07', NULL, NULL, '2016-01-26 18:23:07', '2016-01-26 18:23:07'),
	(284, 164, 'firstName', 8, 12, 0, '2016-02-10 19:39:33', NULL, NULL, '2016-02-09 21:50:12', '2016-02-10 19:39:33');
/*!40000 ALTER TABLE `attribute` ENABLE KEYS */;


-- Dumping structure for table codebreed.build
CREATE TABLE IF NOT EXISTS `build` (
  `BUILDID` bigint(20) NOT NULL,
  `MODELTOBUILD` bigint(20) DEFAULT NULL,
  `HOST` varchar(256) DEFAULT NULL,
  `PORT` int(11) DEFAULT NULL,
  `DATABASESERVER` varchar(256) DEFAULT NULL,
  `NAME` varchar(40) NOT NULL,
  `PROJECTPATH` varchar(256) NOT NULL,
  `EBJNAME` varchar(40) NOT NULL,
  `WARNAME` varchar(40) NOT NULL,
  `PERSISTENCENAME` varchar(999) NOT NULL,
  `PACKAGECOM` varchar(40) NOT NULL,
  `PACKAGEDOT` varchar(40) NOT NULL,
  `DATABASENAME` varchar(256) DEFAULT NULL,
  `MEMBERSHIPSERVER` varchar(256) DEFAULT NULL,
  `TEMPLATEPATH` varchar(260) DEFAULT NULL,
  `TOOLSPATH` varchar(260) DEFAULT NULL,
  `LIBPATH` varchar(260) DEFAULT NULL,
  `SERVERTYPE` int(11) DEFAULT NULL,
  `HOSTPLATFORM` int(11) DEFAULT NULL,
  `MEMBERSHIPDATABASE` varchar(256) DEFAULT NULL,
  `SERVICEHOST` varchar(256) DEFAULT NULL,
  `SERVICEPORT` int(11) DEFAULT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`BUILDID`),
  KEY `fk_MODELTOBUILD` (`MODELTOBUILD`),
  CONSTRAINT `fk_MODELTOBUILD` FOREIGN KEY (`MODELTOBUILD`) REFERENCES `model` (`MODELID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.build: ~12 rows (approximately)
/*!40000 ALTER TABLE `build` DISABLE KEYS */;
INSERT INTO `build` (`BUILDID`, `MODELTOBUILD`, `HOST`, `PORT`, `DATABASESERVER`, `NAME`, `PROJECTPATH`, `EBJNAME`, `WARNAME`, `PERSISTENCENAME`, `PACKAGECOM`, `PACKAGEDOT`, `DATABASENAME`, `MEMBERSHIPSERVER`, `TEMPLATEPATH`, `TOOLSPATH`, `LIBPATH`, `SERVERTYPE`, `HOSTPLATFORM`, `MEMBERSHIPDATABASE`, `SERVICEHOST`, `SERVICEPORT`, `VERSION`, `CREATEDBY`, `UPDATEDBY`, `CREATEDON`, `UPDATEDON`) VALUES
	(7, 26, '0', 0, 'jboss/datasources/MysqlDS', 'Live', 'C:\\Users\\paulm\\Documents\\EclipseProjects\\falconware\\codebreed\\', 'CodeBreedTest001', 'CodeBreedTest001', 'codebreed', 'com', 'falconware', 'codebreed', '0', 'C:\\Users\\paulm\\Documents\\EclipseProjects\\falconware\\codebreed\\src\\main\\resources\\templates\\', '0', '0', 0, 0, '0', '0', 0, '2013-01-10 21:24:28', NULL, NULL, NULL, NULL),
	(8, 14, '08', 0, '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '', 0, 0, '', '', 0, '2013-01-01 21:16:27', NULL, NULL, NULL, NULL),
	(9, 26, '0', 0, 'jboss/datasources/MysqlDS ', 'JBOSSTEST', 'C:\\Users\\paulm\\Documents\\EclipseProjects\\falconware\\codebreedx\\', 'jbosstest', 'jbosstest', 'codebreed', 'com', 'falconware', 'codebreed', '0', 'C:\\Users\\paulm\\Documents\\EclipseProjects\\falconware\\codebreed\\src\\main\\resources\\templates\\', '0', '0', 0, 0, '0', '0', 0, '2013-01-10 11:28:20', NULL, NULL, NULL, NULL),
	(12, 39, '0', 0, 'java:jboss/datasources/MysqlDS', 'falconware', 'C:\\Users\\paulm\\Documents\\EclipseProjects\\falconware\\Security\\', 'security', 'security', 'codebreed', 'com', 'falconware', 'codebreed', '0', 'C:\\Users\\paulm\\Documents\\EclipseProjects\\falconware\\codebreed\\src\\main\\resources\\templates\\', '0', '0', 0, 0, '0', '0', 0, '2013-01-07 15:50:16', NULL, NULL, NULL, NULL),
	(13, 26, '0', 0, 'java:jboss/datasources/MysqlDS', 'openshift', 'C:\\Users\\paulm\\Documents\\EclipseProjects\\codebreed\\codebreed\\', ' ', '', 'codebreed', 'com', 'falconware', 'codebreed', '0', 'C:\\Users\\paulm\\Documents\\EclipseProjects\\falconware\\codebreed\\src\\main\\resources\\templates\\', '0', '0', 0, 0, '0', '0', 0, '2013-01-16 21:39:42', NULL, 'paulm', NULL, '2013-01-10 18:07:03'),
	(14, 26, 'localhost', 9400, 'KRON\\SQLEXPRESS', 'DotNetBuild', 'C:\\Users\\paulm\\Documents\\Visual Studio 2012\\Projects\\DotConnect\\falconware2\\', 'Service', 'Web', 'Data Source=\'C:\\Users\\paulm\\Documents\\Visual Studio 2012\\Projects\\DotConnect\\falconware\\Service\\DotConnect.sdf\';Password=reddingo;Persist Security Info=True', 'com', 'muss', 'DotConnect', 'KRON\\SQLEXPRESS', 'C:\\Users\\paulm\\Documents\\EclipseProjects\\falconware\\codebreed\\src\\main\\resources\\templates', 'C:\\Program Files (x86)\\Microsoft Visual Studio 10.0\\VC\\', 'C:\\Users\\paulm\\Documents\\Visual Studio 2012\\Projects\\packages\\', 0, 0, 'DefaultConnection', 'localhost', 9410, '2015-03-07 23:38:48', 'paulm', NULL, '2013-05-05 15:18:14', NULL),
	(16, 48, 'localhosttest', 88, 'localhosttest', 'testersaaa', 'F:\\ATL Server\\source\\test', 'testering', 'testwar15', 'testdb', 'comtest', 'boggy1', 'testdb', 'localhosttest', 'F:\\ATL Server\\test', 'F:\\ATL Server\\include\\test', 'F:\\ATL Server\\test', 0, 0, 'testdb', 'localhosttest', 34, '2016-01-06 10:13:31', NULL, NULL, '2015-11-17 19:56:48', '2015-11-18 19:49:24'),
	(17, 49, 'localhost', 2500, 'fred', 'TestBuild1234', 'F:\\Downloads', 'fred', 'fredderings', 'fred', 'fred', 'boggy', 'fred', 'fred', 'F:\\Downloads', 'F:\\Downloads', 'F:\\Downloads', 3, 2, 'fred', 'localhost', 2600, '2016-01-06 10:13:23', NULL, NULL, '2015-11-28 12:12:35', '2015-11-28 12:12:35'),
	(18, 18, 'LOCALHOST', 2500, 'LOCALHOST', 'DotNet', 'F:\\Projects\\CodeGenerator\\DotNet\\Rabbits', 'TRAPSERVICE', 'TRAPWEB', 'RTRAPS', 'com', 'hardsource', 'APPS', 'LOCALHOST', 'C:\\Projects\\Java\\Luna\\buildService\\src\\main\\resources\\templates', 'F:\\Books', 'F:\\Books', 0, 0, 'APPS', 'LOCALHOST', 2502, '2016-01-05 11:32:48', NULL, NULL, '2016-01-05 11:32:48', '2016-01-05 11:32:48'),
	(19, 26, 'localhost', 0, 'localhost', 'Lazarus', 'F:/Projects/CodeGenerator/MySql/ApplicaitonArchitect', 'codebreed', 'web', 'codebreed', 'com', 'falconware', 'codebreed', 'localhost', 'C:\\Projects\\Java\\Luna\\buildService\\src\\main\\resources\\templates', 'C:\\Program Files (x86)\\Microsoft Visual Studio 10.0\\VC\\', 'C:\\Users\\paulm\\Documents\\Visual Studio 2012\\Projects\\packages\\', 0, 4, 'default', 'localhost', 0, '2016-02-06 23:13:34', NULL, NULL, '2016-01-10 11:39:36', '2016-02-06 23:13:34'),
	(20, 60, NULL, NULL, NULL, 'fred', 'fred', 'fred', 'fred', 'fred', 'fred', 'fred', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-01-20 15:55:53', NULL, NULL, '2016-01-20 15:55:53', '2016-01-20 15:55:53'),
	(21, 26, 'localhost', 0, 'localhost', 'Mustache', 'F:\\Projects\\CodeGenerator\\Lazarus\\ApplicationArchitect', 'AppArch', 'AppArch', 'codebreed', 'com', 'falconware', 'codebreed', 'localhost', 'F:/Projects/Lazarus/Falconware/Templates', 'F:\\Projects\\Lazarus', 'F:\\Projects\\Lazarus', 3, 0, 'codebreed', 'localhost', 0, '2016-02-06 23:15:34', NULL, NULL, '2016-01-31 12:13:51', '2016-02-06 23:15:34');
/*!40000 ALTER TABLE `build` ENABLE KEYS */;


-- Dumping structure for table codebreed.edesigntest
CREATE TABLE IF NOT EXISTS `edesigntest` (
  `firstname` varchar(30) NOT NULL,
  PRIMARY KEY (`firstname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.edesigntest: ~0 rows (approximately)
/*!40000 ALTER TABLE `edesigntest` DISABLE KEYS */;
/*!40000 ALTER TABLE `edesigntest` ENABLE KEYS */;


-- Dumping structure for table codebreed.environment
CREATE TABLE IF NOT EXISTS `environment` (
  `ENVIRONMENTID` bigint(20) NOT NULL,
  `MEMBERSHIPSERVER` varchar(256) DEFAULT NULL,
  `MEMBERSHIPDATABASE` varchar(256) NOT NULL,
  `DATABASESERVER` varchar(256) NOT NULL,
  `DATABASENAME` varchar(256) NOT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ENVIRONMENTID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.environment: ~0 rows (approximately)
/*!40000 ALTER TABLE `environment` DISABLE KEYS */;
/*!40000 ALTER TABLE `environment` ENABLE KEYS */;


-- Dumping structure for function codebreed.fGenerateSequentialKey
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `fGenerateSequentialKey`(
	sequenceName CHAR(50)
) RETURNS bigint(20)
BEGIN
DECLARE sequenceValue BIGINT;

IF (SELECT 1 = 1 FROM codebreed.id_gen WHERE SEQ_NAME = sequenceName) THEN
BEGIN
    UPDATE codebreed.id_gen SET SEQ_VALUE = SEQ_VALUE + 1 WHERE SEQ_NAME =  sequenceName;
END;
ELSE
BEGIN
    INSERT INTO codebreed.id_gen (SEQ_NAME, SEQ_VALUE) VALUES(sequenceName, 0);
END;
END IF;

SELECT SEQ_VALUE FROM codebreed.id_gen WHERE SEQ_NAME =  sequenceName INTO sequenceValue;

RETURN sequenceValue;
END//
DELIMITER ;


-- Dumping structure for table codebreed.group
CREATE TABLE IF NOT EXISTS `group` (
  `GROUPID` bigint(20) NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `APPID` int(11) DEFAULT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`GROUPID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.group: ~3 rows (approximately)
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` (`GROUPID`, `NAME`, `APPID`, `VERSION`, `CREATEDBY`, `UPDATEDBY`, `CREATEDON`, `UPDATEDON`) VALUES
	(1, 'administrator', 0, '2013-01-07 16:04:48', NULL, NULL, NULL, NULL),
	(2, 'guest', 0, '2013-01-12 12:36:02', NULL, NULL, NULL, NULL),
	(3, 'test', 0, '2013-01-10 14:02:58', 'paulm', NULL, '2013-01-10 14:02:58', NULL);
/*!40000 ALTER TABLE `group` ENABLE KEYS */;


-- Dumping structure for table codebreed.hibernate_sequence
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table codebreed.hibernate_sequence: ~0 rows (approximately)
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` (`next_val`) VALUES
	(4);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;


-- Dumping structure for table codebreed.id_gen
CREATE TABLE IF NOT EXISTS `id_gen` (
  `SEQ_NAME` varchar(50) DEFAULT NULL,
  `SEQ_VALUE` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.id_gen: ~22 rows (approximately)
/*!40000 ALTER TABLE `id_gen` DISABLE KEYS */;
INSERT INTO `id_gen` (`SEQ_NAME`, `SEQ_VALUE`) VALUES
	('MODEL_GEN', 60),
	('RELATION_GEN', 166),
	('BUILD_GEN', 21),
	('ATTRIBUTE_GEN', 286),
	('ASSOCIATION_GEN', 83),
	('MASTERPROPERTY_GEN', 11),
	('MASTERCATEGORY_GEN', 6),
	('PROPERTYGROUP_GEN', 10),
	('SCREENARTIFACT_GEN', 196),
	('SCREENPROPERTYVALUE_GEN', 27),
	('ARTIFACTPROPERTYVALUE_GEN', 39),
	('SCREENARTIFACTTYPE_GEN', 1),
	('PROPERTYTYPE_GEN', 7),
	('SCREENFAMILY_GEN', 32),
	('SCREENCHILD_GEN', 146),
	('MASTERPROPERTYVALUELIST_GEN', 7),
	('LISTHEADER_GEN', 7),
	('LISTDETAIL_GEN', 27),
	('ENVIRONMENT_GEN', 1),
	('GROUP_GEN', 4),
	('USER_GEN', 22),
	('RELATIONPROPERTYVALUE_GEN', 1);
/*!40000 ALTER TABLE `id_gen` ENABLE KEYS */;


-- Dumping structure for table codebreed.listdetail
CREATE TABLE IF NOT EXISTS `listdetail` (
  `LISTDETAILID` bigint(20) NOT NULL,
  `LISTHEADERTODETAIL` bigint(20) DEFAULT NULL,
  `CODE` varchar(5) NOT NULL,
  `LABEL` varchar(40) NOT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`LISTDETAILID`),
  KEY `fk_LISTHEADERTODETAIL` (`LISTHEADERTODETAIL`),
  CONSTRAINT `fk_LISTHEADERTODETAIL` FOREIGN KEY (`LISTHEADERTODETAIL`) REFERENCES `listheader` (`LISTHEADERID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.listdetail: ~24 rows (approximately)
/*!40000 ALTER TABLE `listdetail` DISABLE KEYS */;
INSERT INTO `listdetail` (`LISTDETAILID`, `LISTHEADERTODETAIL`, `CODE`, `LABEL`, `VERSION`, `CREATEDBY`, `UPDATEDBY`, `CREATEDON`, `UPDATEDON`) VALUES
	(2, 2, '1', 'String', '2012-09-01 17:13:54', NULL, NULL, NULL, NULL),
	(3, 2, '2', 'Integer', '2012-09-01 17:14:14', NULL, NULL, NULL, NULL),
	(4, 2, '3', 'Boolean', '2012-09-01 17:14:35', NULL, NULL, NULL, NULL),
	(5, 2, '4', 'Date', '2012-09-01 17:14:58', NULL, NULL, NULL, NULL),
	(6, 2, '5', 'Decimal', '2012-09-01 17:15:18', NULL, NULL, NULL, NULL),
	(7, 2, '6', 'Char', '2012-09-01 17:15:34', NULL, NULL, NULL, NULL),
	(8, 2, '7', 'Byte', '2012-09-01 17:15:50', NULL, NULL, NULL, NULL),
	(9, 2, '8', 'Short', '2012-09-01 17:16:07', NULL, NULL, NULL, NULL),
	(10, 2, '9', 'Long', '2012-09-01 17:16:23', NULL, NULL, NULL, NULL),
	(11, 2, '10', 'Float', '2012-09-01 17:16:42', NULL, NULL, NULL, NULL),
	(12, 2, '11', 'Double', '2012-09-01 17:17:03', NULL, NULL, NULL, NULL),
	(13, 2, '12', 'Blob', '2012-09-01 17:17:20', NULL, NULL, NULL, NULL),
	(14, 2, '13', 'Clob', '2012-09-01 17:17:43', NULL, NULL, NULL, NULL),
	(15, 2, '14', 'Time', '2012-09-01 17:18:00', NULL, NULL, NULL, NULL),
	(16, 2, '15', 'Timestamp', '2012-09-01 17:18:20', NULL, NULL, NULL, NULL),
	(17, 3, '0', 'Backordered', '2012-09-02 08:15:56', NULL, NULL, NULL, NULL),
	(18, 3, '1', 'In Stock', '2016-01-16 12:05:32', NULL, NULL, NULL, '2016-01-16 12:05:32'),
	(19, 4, '0', 'One To Many', '2012-11-15 10:12:27', NULL, NULL, NULL, NULL),
	(20, 4, '1', 'One To One', '2012-11-15 10:12:18', NULL, NULL, NULL, NULL),
	(21, 4, '2', 'Many To Many', '2012-11-15 10:12:43', NULL, NULL, NULL, NULL),
	(22, 4, '3', 'Lookup', '2012-11-15 10:12:52', NULL, NULL, NULL, NULL),
	(25, 2, '16', 'uniqueidentifier', '2016-01-16 23:50:51', NULL, NULL, '2016-01-16 23:50:51', '2016-01-16 23:50:51'),
	(26, 7, 'auto', 'Auto Increment', '2016-01-19 13:58:21', NULL, NULL, '2016-01-19 13:58:21', '2016-01-19 13:58:21'),
	(27, 7, 'seq', 'Generated Sequence', '2016-01-19 13:58:52', NULL, NULL, '2016-01-19 13:58:52', '2016-01-19 13:58:52');
/*!40000 ALTER TABLE `listdetail` ENABLE KEYS */;


-- Dumping structure for table codebreed.listheader
CREATE TABLE IF NOT EXISTS `listheader` (
  `LISTHEADERID` bigint(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`LISTHEADERID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.listheader: ~4 rows (approximately)
/*!40000 ALTER TABLE `listheader` DISABLE KEYS */;
INSERT INTO `listheader` (`LISTHEADERID`, `NAME`, `VERSION`, `CREATEDBY`, `UPDATEDBY`, `CREATEDON`, `UPDATEDON`) VALUES
	(2, 'DataTypes', '2012-09-01 17:13:07', NULL, NULL, NULL, NULL),
	(3, 'DummyOrderCode', '2012-09-02 08:15:40', NULL, NULL, NULL, NULL),
	(4, 'AssociationTypes', '2012-11-15 10:11:36', NULL, NULL, NULL, NULL),
	(7, 'PrimaryKeyType', '2016-01-19 13:58:06', NULL, NULL, '2016-01-19 13:58:06', '2016-01-19 13:58:06');
/*!40000 ALTER TABLE `listheader` ENABLE KEYS */;


-- Dumping structure for table codebreed.mastercategory
CREATE TABLE IF NOT EXISTS `mastercategory` (
  `MASTERCATEGORYID` bigint(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`MASTERCATEGORYID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.mastercategory: ~4 rows (approximately)
/*!40000 ALTER TABLE `mastercategory` DISABLE KEYS */;
INSERT INTO `mastercategory` (`MASTERCATEGORYID`, `NAME`, `VERSION`, `CREATEDBY`, `UPDATEDBY`, `CREATEDON`, `UPDATEDON`) VALUES
	(1, 'Relation', '2013-01-11 15:07:47', 'paulm', NULL, '2013-01-11 15:07:47', NULL),
	(2, 'Screen', '2012-08-01 11:37:53', NULL, NULL, NULL, NULL),
	(3, 'ScreenArtifact', '2012-08-01 14:15:39', NULL, NULL, NULL, NULL),
	(4, 'Attribute', '2013-01-11 15:09:25', 'paulm', 'paulm', '2013-01-11 15:08:30', '2013-01-11 15:09:25');
/*!40000 ALTER TABLE `mastercategory` ENABLE KEYS */;


-- Dumping structure for table codebreed.masterproperty
CREATE TABLE IF NOT EXISTS `masterproperty` (
  `MASTERPROPERTYID` bigint(20) NOT NULL,
  `MASTERPROPERTYTOGROUP` bigint(20) DEFAULT NULL,
  `MASTERPROPERTYTOTYPE` bigint(20) DEFAULT NULL,
  `DEFAULTVALUE` varchar(40) DEFAULT NULL,
  `NAME` varchar(40) NOT NULL,
  `NOTES` varchar(999) DEFAULT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`MASTERPROPERTYID`),
  KEY `fk_MASTERPROPERTYTOTYPE` (`MASTERPROPERTYTOTYPE`),
  KEY `fk_MASTERPROPERTYTOGROUP` (`MASTERPROPERTYTOGROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.masterproperty: ~8 rows (approximately)
/*!40000 ALTER TABLE `masterproperty` DISABLE KEYS */;
INSERT INTO `masterproperty` (`MASTERPROPERTYID`, `MASTERPROPERTYTOGROUP`, `MASTERPROPERTYTOTYPE`, `DEFAULTVALUE`, `NAME`, `NOTES`, `VERSION`, `CREATEDBY`, `UPDATEDBY`, `CREATEDON`, `UPDATEDON`) VALUES
	(2, 7, 3, '', 'Caption', 'text that appears in user interface', '2016-01-12 16:50:06', NULL, NULL, NULL, '2016-01-12 16:50:06'),
	(3, 8, 3, NULL, 'Type', NULL, '2012-12-20 15:33:36', NULL, NULL, NULL, NULL),
	(4, 7, 4, '', 'ControlType', '"\r\n5,7,3,"Sequenc', '2016-01-13 11:12:52', NULL, NULL, NULL, '2016-01-13 11:12:52'),
	(5, 7, 3, NULL, 'Sequence', NULL, '2012-12-20 16:36:29', NULL, NULL, NULL, NULL),
	(6, 7, 2, 'true', 'AppearsInLists', '\r', '2016-01-14 15:03:24', NULL, 'Fred', NULL, '2016-01-14 15:03:24'),
	(7, 7, 5, '', 'MasterList', '"A ListHeader entity"\r\n', '2012-09-01 18:14:36', NULL, NULL, NULL, NULL),
	(10, 7, 2, NULL, 'Testing', 'just a test', '2016-01-17 13:05:05', NULL, NULL, '2016-01-17 13:03:38', '2016-01-17 13:05:05'),
	(11, 7, 2, 'True', 'Visible', 'does the field show up on forms', '2016-01-18 10:50:04', NULL, NULL, '2016-01-18 10:49:42', '2016-01-18 10:50:04');
/*!40000 ALTER TABLE `masterproperty` ENABLE KEYS */;


-- Dumping structure for table codebreed.masterpropertytocategory
CREATE TABLE IF NOT EXISTS `masterpropertytocategory` (
  `MASTERPROPERTYID` bigint(20) DEFAULT NULL,
  `MASTERCATEGORYID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.masterpropertytocategory: ~11 rows (approximately)
/*!40000 ALTER TABLE `masterpropertytocategory` DISABLE KEYS */;
INSERT INTO `masterpropertytocategory` (`MASTERPROPERTYID`, `MASTERCATEGORYID`) VALUES
	(2, 2),
	(4, 3),
	(2, 3),
	(3, 2),
	(3, 3),
	(5, 2),
	(5, 3),
	(6, 3),
	(7, 3),
	(0, 3),
	(11, 3);
/*!40000 ALTER TABLE `masterpropertytocategory` ENABLE KEYS */;


-- Dumping structure for table codebreed.masterpropertyvaluelist
CREATE TABLE IF NOT EXISTS `masterpropertyvaluelist` (
  `MASTERPROPERTYVALUELISTID` bigint(20) NOT NULL,
  `MASTERPROPERYTOVALUELIST` bigint(20) DEFAULT NULL,
  `NAME` varchar(40) NOT NULL,
  `CODE` varchar(10) NOT NULL,
  `DISPLAY` varchar(40) NOT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`MASTERPROPERTYVALUELISTID`),
  KEY `fk_MasterProperty` (`MASTERPROPERYTOVALUELIST`),
  CONSTRAINT `fk_MasterProperty` FOREIGN KEY (`MASTERPROPERYTOVALUELIST`) REFERENCES `masterproperty` (`MASTERPROPERTYID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.masterpropertyvaluelist: ~3 rows (approximately)
/*!40000 ALTER TABLE `masterpropertyvaluelist` DISABLE KEYS */;
INSERT INTO `masterpropertyvaluelist` (`MASTERPROPERTYVALUELISTID`, `MASTERPROPERYTOVALUELIST`, `NAME`, `CODE`, `DISPLAY`, `VERSION`, `CREATEDBY`, `UPDATEDBY`, `CREATEDON`, `UPDATEDON`) VALUES
	(2, 4, 'TextBox', '0', 'display as line editor', '2016-01-15 22:09:08', NULL, NULL, NULL, '2016-01-15 22:09:08'),
	(3, 4, 'ComboBox', '1', 'display as menu choice', '2012-09-01 04:31:19', NULL, NULL, NULL, NULL),
	(4, 4, 'Checkbox', '2', 'display as checkbox', '2012-09-01 04:31:59', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `masterpropertyvaluelist` ENABLE KEYS */;


-- Dumping structure for table codebreed.model
CREATE TABLE IF NOT EXISTS `model` (
  `MODELID` bigint(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`MODELID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.model: ~18 rows (approximately)
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` (`MODELID`, `NAME`, `VERSION`, `CREATEDBY`, `UPDATEDBY`, `CREATEDON`, `UPDATEDON`) VALUES
	(14, 'JBOSS', '2013-01-29 17:13:06', NULL, 'paulm', NULL, '2013-01-29 17:13:06'),
	(16, 'MadeByPaul', '2013-01-16 15:22:33', 'paulm', 'paulm', '2013-01-13 22:28:10', '2013-01-16 15:22:33'),
	(17, 'madeByGuest', '2013-01-13 22:30:40', 'guest', NULL, '2013-01-13 22:30:40', NULL),
	(18, 'RabbitTraps', '2013-03-31 13:07:10', 'paulm', 'paulm', '2013-03-31 13:06:47', '2013-03-31 13:07:10'),
	(26, 'DOTCONNECT', '2015-03-07 23:38:48', NULL, 'paulm', NULL, '2015-03-07 23:38:48'),
	(39, 'SECURITY', '2013-01-07 15:51:44', NULL, NULL, NULL, NULL),
	(42, 'testing001', '2016-01-06 10:12:18', NULL, NULL, NULL, '2016-01-06 10:12:18'),
	(48, 'Freddies', '2016-01-06 12:04:42', '', '', '2015-11-13 14:28:09', '2016-01-06 12:04:42'),
	(49, 'TestModel', '2016-01-06 10:13:23', '', '', '2015-11-15 21:28:54', '2016-01-06 10:13:23'),
	(50, 'Cogran', '2015-12-26 17:07:02', '', '', '2015-12-26 17:07:02', '2015-12-26 17:07:02'),
	(51, 'Inventory', '2016-01-01 18:45:47', '', '', '2016-01-01 18:45:47', '2016-01-01 18:45:47'),
	(52, 'AdventureWorks', '2016-01-16 17:35:41', '', '', '2016-01-16 17:35:41', '2016-01-16 17:35:41'),
	(53, 'Sakila', '2016-01-17 10:20:03', '', '', '2016-01-17 10:20:03', '2016-01-17 10:20:03'),
	(54, 'TestModel002', '2016-01-19 15:07:19', '', '', '2016-01-19 15:07:19', '2016-01-19 15:07:19'),
	(55, 'New Model', '2016-01-19 15:08:45', '', '', '2016-01-19 15:08:45', '2016-01-19 15:08:45'),
	(56, 'TestModel003', '2016-01-19 15:13:20', '', '', '2016-01-19 15:13:20', '2016-01-19 15:13:20'),
	(57, 'TestModel004', '2016-01-19 15:19:22', '', '', '2016-01-19 15:19:22', '2016-01-19 15:19:22'),
	(60, 'BuildTest', '2016-01-20 15:55:28', '', '', '2016-01-20 15:55:28', '2016-01-20 15:55:28');
/*!40000 ALTER TABLE `model` ENABLE KEYS */;


-- Dumping structure for table codebreed.noteheader
CREATE TABLE IF NOT EXISTS `noteheader` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `body` longtext,
  `user_id` bigint(20) NOT NULL,
  `site_id` int(11) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`),
  UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table codebreed.noteheader: ~118 rows (approximately)
/*!40000 ALTER TABLE `noteheader` DISABLE KEYS */;
INSERT INTO `noteheader` (`id`, `name`, `body`, `user_id`, `site_id`, `version`) VALUES
	(0, 'jocker', NULL, 0, 0, '2014-09-17 21:48:51'),
	(1, 'fred', 'freddo', 0, 0, '2014-09-17 21:49:07'),
	(3, 'fred3', 'freddo', 0, 0, '2014-09-20 21:48:15'),
	(4, 'fred4', 'freddo', 0, 0, '2014-09-20 22:29:51'),
	(5, 'fred5', 'freddo', 0, 0, '2014-09-20 22:30:27'),
	(6, 'fred6', 'freddo', 0, 0, '2014-09-20 22:30:45'),
	(7, 'fred7', 'freddo', 0, 0, '2014-09-21 10:14:07'),
	(8, 'fred8', 'freddo', 0, 0, '2014-09-21 10:16:38'),
	(9, 'fred9', 'freddo', 0, 0, '2014-09-21 10:17:35'),
	(10, 'fred10', 'freddo', 0, 0, '2014-09-21 10:18:52'),
	(11, 'fred11', 'freddo', 0, 0, '2014-09-21 10:20:54'),
	(12, 'fred12', 'freddo', 0, 0, '2014-09-21 10:22:15'),
	(13, 'fred13', 'freddo', 0, 0, '2014-09-25 22:31:24'),
	(14, 'fred14', 'freddo', 0, 0, '2014-09-28 11:52:31'),
	(15, 'fred15', 'freddo', 0, 0, '2014-09-28 11:56:43'),
	(16, 'fred16', 'freddo', 0, 0, '2014-09-28 12:02:44'),
	(17, 'fred17', 'freddo', 0, 0, '2014-09-28 12:03:24'),
	(18, 'fred18', 'freddo', 0, 0, '2014-09-28 12:05:05'),
	(19, 'fred19', 'freddo', 0, 0, '2014-09-28 13:07:58'),
	(20, 'fred20', 'freddo', 0, 0, '2014-09-28 22:16:38'),
	(21, 'fred21', 'freddo', 0, 0, '2014-09-28 22:29:25'),
	(22, 'fred22', 'freddo', 0, 0, '2014-09-28 22:29:47'),
	(23, 'fred23', 'freddo', 0, 0, '2014-09-28 22:32:18'),
	(24, 'fred24', 'freddo', 0, 0, '2014-09-28 22:32:41'),
	(25, 'fred25', 'freddo', 0, 0, '2014-09-28 22:47:24'),
	(26, 'fred26', 'freddo', 0, 0, '2014-09-28 22:47:51'),
	(27, 'fred27', 'freddo', 0, 0, '2014-09-29 21:50:57'),
	(28, 'fred28', 'freddo', 0, 0, '2014-09-29 21:59:22'),
	(29, 'fred29', 'freddo', 0, 0, '2014-09-29 22:01:47'),
	(30, 'fred30', 'freddo', 0, 0, '2014-09-29 22:02:00'),
	(31, 'fred31', 'freddo', 0, 0, '2014-09-29 22:02:06'),
	(32, 'fred32', 'freddo', 0, 0, '2014-09-29 22:02:14'),
	(33, 'fred33', 'freddo', 0, 0, '2014-09-29 22:30:31'),
	(34, 'fred34', 'freddo', 0, 0, '2014-09-29 22:30:38'),
	(35, 'fred35', 'freddo', 0, 0, '2014-10-02 20:27:30'),
	(36, 'fred36', 'freddo', 0, 0, '2014-10-02 20:27:51'),
	(37, 'fred37', 'freddo', 0, 0, '2014-10-04 08:55:05'),
	(38, 'fred38', 'freddo', 0, 0, '2014-10-04 08:55:12'),
	(39, 'fred39', 'freddo', 0, 0, '2014-10-04 10:37:58'),
	(40, 'fred40', 'freddo', 0, 0, '2014-10-04 10:38:05'),
	(41, 'fred41', 'freddo', 0, 0, '2014-10-04 10:49:06'),
	(42, 'fred42', 'freddo', 0, 0, '2014-10-04 10:49:14'),
	(43, 'fred43', 'freddo', 0, 0, '2014-10-05 11:41:41'),
	(44, 'fred44', 'freddo', 0, 0, '2014-10-05 11:41:43'),
	(45, 'fred45', 'freddo', 0, 0, '2014-10-05 11:58:47'),
	(46, 'fred46', 'freddo', 0, 0, '2014-10-05 11:58:48'),
	(47, 'fred47', 'freddo', 0, 0, '2014-10-05 12:00:28'),
	(48, 'fred48', 'freddo', 0, 0, '2014-10-05 13:03:51'),
	(49, 'fred49', 'freddo', 0, 0, '2014-10-05 13:07:57'),
	(50, 'fred50', 'freddo', 0, 0, '2014-10-05 13:09:40'),
	(51, 'fred51', 'freddo', 0, 0, '2014-10-05 13:09:49'),
	(52, 'fred52', 'freddo', 0, 0, '2014-10-05 17:58:32'),
	(53, 'fred53', 'freddo', 0, 0, '2014-10-05 17:58:35'),
	(54, 'fred54', 'freddo', 0, 0, '2014-10-05 18:00:06'),
	(55, 'fred55', 'freddo', 0, 0, '2014-10-05 18:00:08'),
	(56, 'fred56', 'freddo', 0, 0, '2014-10-05 18:05:22'),
	(57, 'fred57', 'freddo', 0, 0, '2014-10-05 18:05:30'),
	(58, 'fred58', 'freddo', 0, 0, '2014-10-05 18:06:17'),
	(59, 'fred59', 'freddo', 0, 0, '2014-10-05 18:06:19'),
	(60, 'fred60', 'freddo', 0, 0, '2014-10-05 18:07:39'),
	(61, 'fred61', 'freddo', 0, 0, '2014-10-05 18:07:41'),
	(62, 'fred62', 'freddo', 0, 0, '2014-10-05 18:14:38'),
	(63, 'fred63 a', 'freddo', 0, 0, '2014-10-05 18:15:13'),
	(64, 'fred64 a', 'freddo', 0, 0, '2014-10-05 18:15:29'),
	(65, 'fred65 a', 'freddo', 0, 0, '2014-10-05 18:40:12'),
	(66, 'fred66 a', 'freddo', 0, 0, '2014-10-05 18:41:16'),
	(67, 'fred67 a', 'freddo', 0, 0, '2014-10-05 18:42:06'),
	(68, 'fred68 a', 'freddo', 0, 0, '2014-10-05 18:44:00'),
	(69, 'fred69 a', 'freddo', 0, 0, '2014-10-05 18:47:21'),
	(70, 'fred70 a', 'freddo', 0, 0, '2014-10-05 18:47:23'),
	(71, 'fred71 a', 'freddo', 0, 0, '2014-10-05 18:47:26'),
	(72, 'fred72 a', 'freddo', 0, 0, '2014-10-05 18:50:04'),
	(73, 'fred73 a', 'freddo', 0, 0, '2014-10-05 18:50:54'),
	(74, 'fred74 a', 'freddo', 0, 0, '2014-10-05 18:50:56'),
	(75, 'fred75 a', 'freddo', 0, 0, '2014-10-05 18:51:58'),
	(76, 'fred76 a', 'freddo', 0, 0, '2014-10-05 18:53:06'),
	(77, 'fred77 a', 'freddo', 0, 0, '2014-10-05 18:54:15'),
	(78, 'fred78 a', 'freddo', 0, 0, '2014-10-05 18:54:17'),
	(79, 'fred79 a', 'freddo', 0, 0, '2014-10-05 18:54:18'),
	(80, 'fred80 a', 'freddo', 0, 0, '2014-10-05 18:54:19'),
	(81, 'fred81 a', 'freddo', 0, 0, '2014-10-05 18:54:22'),
	(82, 'fred82 a', 'freddo', 0, 0, '2014-10-05 19:03:17'),
	(83, 'fred83 a', 'freddo', 0, 0, '2014-10-05 19:03:23'),
	(84, 'fred84 a', 'freddo', 0, 0, '2014-10-05 19:03:24'),
	(85, 'fred85 a', 'freddo', 0, 0, '2014-10-05 19:09:30'),
	(86, 'fred86 a', 'freddo', 0, 0, '2014-10-05 19:11:40'),
	(87, 'fred87 a', 'freddo', 0, 0, '2014-10-05 19:12:14'),
	(88, 'fred88 a', 'freddo', 0, 0, '2014-10-05 19:18:09'),
	(89, 'fred89 a', 'freddo', 0, 0, '2014-10-05 19:19:16'),
	(90, 'fred90 a', 'freddo', 0, 0, '2014-10-05 19:19:18'),
	(91, 'fred91 a', 'freddo', 0, 0, '2014-10-05 19:20:14'),
	(92, 'fred92 a', 'freddo', 0, 0, '2014-10-05 19:20:51'),
	(93, 'fred93 a', 'freddo', 0, 0, '2014-10-05 19:20:53'),
	(94, 'fred94 a', 'freddo', 0, 0, '2014-10-05 19:20:56'),
	(95, 'fred95 a', 'freddo', 0, 0, '2014-10-05 19:20:59'),
	(96, 'fred96 a', 'freddo', 0, 0, '2014-10-05 19:21:02'),
	(97, 'fred97 a', 'freddo', 0, 0, '2014-10-05 19:23:04'),
	(98, 'fred98 a', 'freddo', 0, 0, '2014-10-05 19:24:35'),
	(99, 'fred99 a', 'freddo', 0, 0, '2014-10-05 19:26:53'),
	(100, 'fred100 a', 'freddo', 0, 0, '2014-10-06 20:30:26'),
	(101, 'fred101 a', 'freddo', 0, 0, '2014-10-06 20:31:12'),
	(102, 'fred102 a', 'freddo', 0, 0, '2014-10-06 20:33:48'),
	(103, 'fred103 a', 'freddo', 0, 0, '2014-10-08 21:43:52'),
	(104, 'fred104 a', 'freddo', 0, 0, '2014-10-08 21:44:03'),
	(105, 'null105 a', NULL, 0, 0, '2014-10-08 21:51:15'),
	(106, 'null106 a', NULL, 0, 0, '2014-10-08 21:51:19'),
	(107, 'fred107 a', 'fred is my temple', 0, 0, '2014-10-08 21:51:31'),
	(108, 'fred108 a', 'freddo frog here', 0, 0, '2014-10-08 22:04:58'),
	(109, 'fred109 a', 'this is the age of aquarious', 0, 0, '2014-10-08 22:06:33'),
	(110, 'fred110 a', 'I\'m fred', 0, 0, '2014-10-10 22:06:31'),
	(111, '111 a', '', 0, 0, '2014-10-10 22:14:44'),
	(112, '112 a', '', 0, 0, '2014-10-10 22:15:29'),
	(113, 'null113 a', NULL, 0, 0, '2014-10-12 11:35:45'),
	(114, 'fred114 a', 'I bow out', 0, 0, '2014-10-12 11:46:30'),
	(115, 'null115 a', NULL, 0, 0, '2014-10-12 11:46:34'),
	(116, 'null116 a', NULL, 0, 0, '2014-10-12 11:46:37'),
	(117, 'null117 a', NULL, 0, 0, '2014-10-13 19:03:04'),
	(118, 'null118 a', NULL, 0, 0, '2014-10-13 19:03:07');
/*!40000 ALTER TABLE `noteheader` ENABLE KEYS */;


-- Dumping structure for procedure codebreed.pArtifactPropertyValueDelete
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pArtifactPropertyValueDelete`(
in ArtifactPropertyValueId bigint
)
BEGIN
	DELETE FROM ArtifactPropertyValue where ArtifactPropertyValue.ArtifactPropertyValueId = ArtifactPropertyValueId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pArtifactPropertyValueInsert
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pArtifactPropertyValueInsert`(
in ARTIFACTPROPVALUETOPROPERTY bigint,
in ARTIFACTTOPROPERTYVALUE bigint,
in PROPERTYVALUE varchar(2000),
in CREATEDBY varchar(30)
)
BEGIN

DECLARE artifactPropertyValueId bigint DEFAULT 0;

CALL pGenerateSequentialKey('ARTIFACTPROPERTYVALUE_GEN', artifactPropertyValueId);

INSERT INTO ArtifactPropertyValue (ARTIFACTPROPERTYVALUEID, ARTIFACTPROPVALUETOPROPERTY, ARTIFACTTOPROPERTYVALUE, PROPERTYVALUE, VERSION, CREATEDBY, UPDATEDBY, CREATEDON, UPDATEDON)
VALUES (artifactPropertyValueId, ARTIFACTPROPVALUETOPROPERTY, ARTIFACTTOPROPERTYVALUE, PROPERTYVALUE, CURRENT_TIMESTAMP, CreatedBy, CreatedBy, NOW(), NOW());


END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pArtifactPropertyValueUpdate
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pArtifactPropertyValueUpdate`(
in ARTIFACTPROPERTYVALUEID bigint,
in ARTIFACTPROPVALUETOPROPERTY bigint,
in ARTIFACTTOPROPERTYVALUE bigint,
in PROPERTYVALUE varchar(2000),
in UPDATEDBY varchar(30)
)
BEGIN
UPDATE ARTIFACTPROPERTYVALUE
SET ARTIFACTPROPERTYVALUE.ARTIFACTPROPVALUETOPROPERTY = ARTIFACTPROPVALUETOPROPERTY,
ARTIFACTPROPERTYVALUE.ARTIFACTTOPROPERTYVALUE = ARTIFACTTOPROPERTYVALUE,
ARTIFACTPROPERTYVALUE.PROPERTYVALUE = PROPERTYVALUE,
ARTIFACTPROPERTYVALUE.UPDATEDBY = UPDATEDBY,
ARTIFACTPROPERTYVALUE.UpdatedOn = Now()
WHERE ARTIFACTPROPERTYVALUE.ARTIFACTPROPERTYVALUEID = ARTIFACTPROPERTYVALUEID;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pAssociationDelete
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pAssociationDelete`(in associationId bigint)
BEGIN
	DELETE FROM Association where Association.AssociationId = associationId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pAssociationInsert
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pAssociationInsert`(
in associationId bigint,
in owned bigint, 
in `owner` bigint,
in modelAssociation bigint,
in `name` varchar(30),
in `type` int,
in createdBy varchar(30)
)
BEGIN

/*
DECLARE associationId bigint DEFAULT 0;
CALL pGenerateSequentialKey('ASSOCIATION_GEN', associationId);
*/

INSERT INTO Association (ASSOCIATIONID, OWNED, `OWNER`, MODELASSOCIATION, `NAME`, `TYPE`, VERSION, CREATEDBY, UPDATEDBY, CREATEDON, UPDATEDON)
VALUES (associationId, owned, `owner`, modelAssociation, `Name`, `type`, CURRENT_TIMESTAMP, CreatedBy, CreatedBy, NOW(), NOW());

END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pAssociationUpdate
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pAssociationUpdate`(
in associationId bigint,
in owned bigint,
in `owner` bigint,
in modelAssociation bigint,
in `Name` varchar(30),
in `Type` int,
in UpdatedBy varchar(30)
)
BEGIN
UPDATE `association`
SET
association.owned = owned,
association.`owner` = `owner`,
association.`ModelAssociation` = modelAssociation,
association.`NAME` = `Name`,
association.`TYPE` = `Type`,
association.`VERSION` = CURRENT_TIMESTAMP,
association.`UPDATEDBY` = UpdatedBy,
association.`UPDATEDON` = Now()
WHERE association.AssociationId = associationId;

END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pAttributeDelete
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pAttributeDelete`(in AttributeId bigint)
BEGIN
	DELETE FROM Attribute where Attribute.AttributeId = AttributeId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pAttributeInsert
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pAttributeInsert`(
in attributeId bigint,
in RelationAttribute bigint,
in `Name` varchar(30),
in `Type` int,
in AttributeLength int,
in AllowNull bit,
in CreatedBy varchar(30)
)
BEGIN

/*
DECLARE attributeId bigint DEFAULT 0;
CALL pGenerateSequentialKey('ATTRIBUTE_GEN', attributeId) ;
*/

INSERT INTO `attribute`
(`ATTRIBUTEID`,
`RELATIONATTRIBUTE`,
`NAME`,
`TYPE`,
`ATTRIBUTELENGTH`,
`ALLOWNULL`,
`VERSION`,
`CREATEDBY`,
`UPDATEDBY`,
`CREATEDON`,
`UPDATEDON`)
VALUES
(
attributeId,
RelationAttribute,
`Name`,
`Type`,
AttributeLength,
AllowNull,
CURRENT_TIMESTAMP,
CreatedBy,
CreatedBy,
Now(),
Now()
);



END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pAttributeUpdate
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pAttributeUpdate`(
in AttributeId bigint,
in RelationAttribute bigint,
in `Name` varchar(30),
in `Type` int,
in AttributeLength int,
in AllowNull bit,
in UpdatedBy varchar(30)
)
BEGIN
UPDATE `attribute`
SET
attribute.`ATTRIBUTEID` = AttributeId,
attribute.`RELATIONATTRIBUTE` = RelationAttribute,
attribute.`NAME` = `Name`,
attribute.`TYPE` = `Type`,
attribute.`ATTRIBUTELENGTH` = AttributeLength,
attribute.`ALLOWNULL` = AllowNull,
attribute.`VERSION` = CURRENT_TIMESTAMP,
attribute.`UPDATEDBY` = UpdatedBy,
attribute.`UPDATEDON` = Now()
WHERE attribute.AttributeId = AttributeId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pBuildDelete
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pBuildDelete`(BuildId BIGINT)
BEGIN
DELETE FROM Build where Build.BuildId = BuildId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pBuildInsert
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pBuildInsert`(
	in BuildId bigint,
  in `MODELTOBUILD` bigint(20) ,
  in `HOST` varchar(256),
  in `PORT` int(11) ,
  in `DATABASESERVER` varchar(256) ,
  in `NAME` varchar(40) ,
  in `PROJECTPATH` varchar(256) ,
  in `EBJNAME` varchar(40) ,
  in `WARNAME` varchar(40) ,
  in `PERSISTENCENAME` varchar(999) ,
  in `PACKAGECOM` varchar(40) ,
  in `PACKAGEDOT` varchar(40) ,
  in `DATABASENAME` varchar(256) ,
  in `MEMBERSHIPSERVER` varchar(256) ,
  in `TEMPLATEPATH` varchar(260) ,
  in `TOOLSPATH` varchar(260) ,
  in `LIBPATH` varchar(260) ,
  in `SERVERTYPE` int(11) ,
  in `HOSTPLATFORM` int(11) ,
  in `MEMBERSHIPDATABASE` varchar(256) ,
  in `SERVICEHOST` varchar(256) ,
  in `SERVICEPORT` int(11) ,
   in `CREATEDBY` varchar(30)
)
BEGIN

/*
DECLARE buildId bigint DEFAULT 0;
CALL pGenerateSequentialKey('BUILD_GEN', buildId);
*/

INSERT INTO `build`
(`BUILDID`,
`MODELTOBUILD`,
`HOST`,
`PORT`,
`DATABASESERVER`,
`NAME`,
`PROJECTPATH`,
`EBJNAME`,
`WARNAME`,
`PERSISTENCENAME`,
`PACKAGECOM`,
`PACKAGEDOT`,
`DATABASENAME`,
`MEMBERSHIPSERVER`,
`TEMPLATEPATH`,
`TOOLSPATH`,
`LIBPATH`,
`SERVERTYPE`,
`HOSTPLATFORM`,
`MEMBERSHIPDATABASE`,
`SERVICEHOST`,
`SERVICEPORT`,
`VERSION`,
`CREATEDBY`,
`UPDATEDBY`,
`CREATEDON`,
`UPDATEDON`)
VALUES
(
BuildId,
MODELTOBUILD,
HOST,
PORT,
DATABASESERVER,
NAME,
PROJECTPATH,
EBJNAME,
WARNAME,
PERSISTENCENAME,
PACKAGECOM,
PACKAGEDOT,
DATABASENAME,
MEMBERSHIPSERVER,
TEMPLATEPATH,
TOOLSPATH,
LIBPATH,
SERVERTYPE,
HOSTPLATFORM,
MEMBERSHIPDATABASE,
SERVICEHOST,
SERVICEPORT,
CURRENT_TIMESTAMP,
CREATEDBY,
CREATEDBY,
NOW(),
NOW()
);


END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pBuildUpdate
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pBuildUpdate`(
`BUILDID` bigint(20),
`MODELTOBUILD` bigint(20) ,
  `HOST` varchar(256),
  `PORT` int(11) ,
  `DATABASESERVER` varchar(256) ,
  `NAME` varchar(40) ,
  `PROJECTPATH` varchar(256) ,
  `EBJNAME` varchar(40) ,
  `WARNAME` varchar(40) ,
  `PERSISTENCENAME` varchar(999) ,
  `PACKAGECOM` varchar(40) ,
  `PACKAGEDOT` varchar(40) ,
  `DATABASENAME` varchar(256) ,
  `MEMBERSHIPSERVER` varchar(256) ,
  `TEMPLATEPATH` varchar(260) ,
  `TOOLSPATH` varchar(260) ,
  `LIBPATH` varchar(260) ,
  `SERVERTYPE` int(11) ,
  `HOSTPLATFORM` int(11) ,
  `MEMBERSHIPDATABASE` varchar(256) ,
  `SERVICEHOST` varchar(256) ,
  `SERVICEPORT` int(11) ,
   `UPDATEDBY` varchar(30)
)
BEGIN

UPDATE `build`
SET
 build.`MODELTOBUILD` = MODELTOBUILD,
 build.`HOST` = HOST,
 build.`PORT` = PORT,
 build.`DATABASESERVER` = DATABASESERVER,
 build.`NAME` = NAME,
 build.`PROJECTPATH` = PROJECTPATH,
 build.`EBJNAME` = EBJNAME,
 build.`WARNAME` = WARNAME,
 build.`PERSISTENCENAME` = PERSISTENCENAME,
 build.`PACKAGECOM` = PACKAGECOM,
 build.`PACKAGEDOT` = PACKAGEDOT,
 build.`DATABASENAME` = DATABASENAME,
 build.`MEMBERSHIPSERVER` = MEMBERSHIPSERVER,
 build.`TEMPLATEPATH` = TEMPLATEPATH,
 build.`TOOLSPATH` = TOOLSPATH,
 build.`LIBPATH` = LIBPATH,
 build.`SERVERTYPE` = SERVERTYPE,
 build.`HOSTPLATFORM` = HOSTPLATFORM,
 build.`MEMBERSHIPDATABASE` = MEMBERSHIPDATABASE,
 build.`SERVICEHOST` = SERVICEHOST,
 build.`SERVICEPORT` = SERVICEPORT,
  build.`UPDATEDBY` = UPDATEDBY,
 build.`UPDATEDON` = Now()
WHERE build.`BUILDID` = BUILDID;


END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pGenerateSequentialKey
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pGenerateSequentialKey`(IN sequenceName CHAR(50), out sequenceValue BIGINT)
BEGIN

IF (SELECT 1 = 1 FROM codebreed.id_gen WHERE SEQ_NAME = sequenceName) THEN
BEGIN
    UPDATE codebreed.id_gen SET SEQ_VALUE = SEQ_VALUE + 1 WHERE SEQ_NAME =  sequenceName;
END;
ELSE
BEGIN
    INSERT INTO codebreed.id_gen (SEQ_NAME, SEQ_VALUE) VALUES(sequenceName, 0);
END;
END IF;

SELECT SEQ_VALUE FROM codebreed.id_gen WHERE SEQ_NAME =  sequenceName INTO sequenceValue;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pListDetailDelete
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pListDetailDelete`(
in LISTDETAILId bigint
)
BEGIN
	DELETE FROM LISTDETAIL where LISTDETAIL.LISTDETAILId = LISTDETAILId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pListDetailInsert
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pListDetailInsert`(
in `LISTHEADERTODETAIL` BIGINT (20),

in `CODE` NVARCHAR(5)
,in `LABEL` NVARCHAR(40)

,in CREATEDBY varchar(30)
)
BEGIN
DECLARE LISTDETAILID bigint DEFAULT 0;
CALL pGenerateSequentialKey('LISTDETAIL_GEN', LISTDETAILID);
INSERT INTO LISTDETAIL (LISTDETAILID,  `LISTHEADERTODETAIL`, `CODE`,`LABEL` ,VERSION, CREATEDBY, UPDATEDBY, CREATEDON, UPDATEDON)
VALUES (LISTDETAILID,  `LISTHEADERTODETAIL`, `CODE`,`LABEL` ,CURRENT_TIMESTAMP, CREATEDBY, CREATEDBY, NOW(), NOW());
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pListDetailUpdate
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pListDetailUpdate`(
in LISTDETAILId bigint,
in `LISTHEADERTODETAIL` BIGINT (20),

in `CODE` NVARCHAR(5)
,in `LABEL` NVARCHAR(40)

,in UPDATEDBY varchar(30)
)
BEGIN

UPDATE LISTDETAIL SET
LISTDETAIL.`LISTHEADERTODETAIL` = `LISTHEADERTODETAIL`,

LISTDETAIL.`CODE` = `CODE`
,LISTDETAIL.`LABEL` = `LABEL`
,
LISTDETAIL.VERSION = CURRENT_TIMESTAMP,
LISTDETAIL.UPDATEDBY = UPDATEDBY, 
LISTDETAIL.UPDATEDON = Now()
WHERE LISTDETAIL.LISTDETAILID =  LISTDETAILId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pListHeaderDelete
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pListHeaderDelete`(
in LISTHEADERId bigint
)
BEGIN
	DELETE FROM LISTHEADER where LISTHEADER.LISTHEADERId = LISTHEADERId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pListHeaderInsert
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pListHeaderInsert`(
in `NAME` NVARCHAR(40)

,in CREATEDBY varchar(30)
)
BEGIN
DECLARE LISTHEADERID bigint DEFAULT 0;
CALL pGenerateSequentialKey('LISTHEADER_GEN', LISTHEADERID);
INSERT INTO LISTHEADER (LISTHEADERID,   `NAME` ,VERSION, CREATEDBY, UPDATEDBY, CREATEDON, UPDATEDON)
VALUES (LISTHEADERID,   `NAME` ,CURRENT_TIMESTAMP, CREATEDBY, CREATEDBY, NOW(), NOW());
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pListHeaderUpdate
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pListHeaderUpdate`(
in LISTHEADERId bigint,
in `NAME` NVARCHAR(40)

,in UPDATEDBY varchar(30)
)
BEGIN

UPDATE LISTHEADER SET
LISTHEADER.`NAME` = `NAME`
,
LISTHEADER.VERSION = CURRENT_TIMESTAMP,
LISTHEADER.UPDATEDBY = UPDATEDBY, 
LISTHEADER.UPDATEDON = Now()
WHERE LISTHEADER.LISTHEADERID =  LISTHEADERId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pMasterCategoryDelete
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pMasterCategoryDelete`(
in MASTERCATEGORYId bigint
)
BEGIN
	DELETE FROM MASTERCATEGORY where MASTERCATEGORY.MASTERCATEGORYId = MASTERCATEGORYId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pMasterCategoryInsert
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pMasterCategoryInsert`(
in `NAME` NVARCHAR(40)

,in CREATEDBY varchar(30)
)
BEGIN
DECLARE MASTERCATEGORYID bigint DEFAULT 0;
CALL pGenerateSequentialKey('MASTERCATEGORY_GEN', MASTERCATEGORYID);
INSERT INTO MASTERCATEGORY (MASTERCATEGORYID,   `NAME` ,VERSION, CREATEDBY, UPDATEDBY, CREATEDON, UPDATEDON)
VALUES (MASTERCATEGORYID,   `NAME` ,CURRENT_TIMESTAMP, CREATEDBY, CREATEDBY, NOW(), NOW());
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pMasterCategoryUpdate
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pMasterCategoryUpdate`(
in MASTERCATEGORYId bigint,
in `NAME` NVARCHAR(40)

,in UPDATEDBY varchar(30)
)
BEGIN

UPDATE MASTERCATEGORY SET
 
 
MASTERCATEGORY.`NAME` = `NAME`
,
MASTERCATEGORY.VERSION = CURRENT_TIMESTAMP,
MASTERCATEGORY.UPDATEDBY = UPDATEDBY, 
MASTERCATEGORY.UPDATEDON = Now()
WHERE MASTERCATEGORY.MASTERCATEGORYID =  MASTERCATEGORYId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pMasterPropertyDelete
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pMasterPropertyDelete`(
in MASTERPROPERTYId bigint
)
BEGIN
	DELETE FROM MASTERPROPERTY where MASTERPROPERTY.MASTERPROPERTYId = MASTERPROPERTYId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pMasterPropertyInsert
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pMasterPropertyInsert`(
in `MASTERPROPERTYTOGROUP` BIGINT (20),
in `MASTERPROPERTYTOTYPE` BIGINT (20),
in `NAME` NVARCHAR(40)
,in `DEFAULTVALUE` NVARCHAR(40)
,in `NOTES` NVARCHAR(999)

,in CREATEDBY varchar(30)
)
BEGIN
DECLARE MASTERPROPERTYID bigint DEFAULT 0;
CALL pGenerateSequentialKey('MASTERPROPERTY_GEN', MASTERPROPERTYID);
INSERT INTO MASTERPROPERTY (MASTERPROPERTYID, `MASTERPROPERTYTOGROUP`,`MASTERPROPERTYTOTYPE`,  `NAME`,`DEFAULTVALUE`,`NOTES` ,VERSION, CREATEDBY, UPDATEDBY, CREATEDON, UPDATEDON)
VALUES (MASTERPROPERTYID, `MASTERPROPERTYTOGROUP`,`MASTERPROPERTYTOTYPE`,  `NAME`,`DEFAULTVALUE`,`NOTES` ,CURRENT_TIMESTAMP, CREATEDBY, CREATEDBY, NOW(), NOW());
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pMasterPropertyUpdate
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pMasterPropertyUpdate`(
in MASTERPROPERTYId bigint,
in `MASTERPROPERTYTOGROUP` BIGINT (20),
in `MASTERPROPERTYTOTYPE` BIGINT (20),
in `NAME` NVARCHAR(40)
,in `DEFAULTVALUE` NVARCHAR(40)
,in `NOTES` NVARCHAR(999)

,in UPDATEDBY varchar(30)
)
BEGIN

UPDATE MASTERPROPERTY SET
MASTERPROPERTY.`MASTERPROPERTYTOGROUP` = `MASTERPROPERTYTOGROUP`,
MASTERPROPERTY.`MASTERPROPERTYTOTYPE` = `MASTERPROPERTYTOTYPE`,
 
 
MASTERPROPERTY.`NAME` = `NAME`
,MASTERPROPERTY.`DEFAULTVALUE` = `DEFAULTVALUE`
,MASTERPROPERTY.`NOTES` = `NOTES`
,
MASTERPROPERTY.VERSION = CURRENT_TIMESTAMP,
MASTERPROPERTY.UPDATEDBY = UPDATEDBY, 
MASTERPROPERTY.UPDATEDON = Now()
WHERE MASTERPROPERTY.MASTERPROPERTYID =  MASTERPROPERTYId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pMasterPropertyValueListDelete
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pMasterPropertyValueListDelete`(
in MASTERPROPERTYVALUELISTId bigint
)
BEGIN
	DELETE FROM MASTERPROPERTYVALUELIST where MASTERPROPERTYVALUELIST.MASTERPROPERTYVALUELISTId = MASTERPROPERTYVALUELISTId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pMasterPropertyValueListInsert
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pMasterPropertyValueListInsert`(
in `MASTERPROPERYTOVALUELIST` BIGINT (20),

in `DISPLAY` NVARCHAR(40)
,in `NAME` NVARCHAR(40)
,in `CODE` NVARCHAR(10)

,in CREATEDBY varchar(30)
)
BEGIN
DECLARE MASTERPROPERTYVALUELISTID bigint DEFAULT 0;
CALL pGenerateSequentialKey('MASTERPROPERTYVALUELIST_GEN', MASTERPROPERTYVALUELISTID);
INSERT INTO MASTERPROPERTYVALUELIST (MASTERPROPERTYVALUELISTID,  `MASTERPROPERYTOVALUELIST`, `DISPLAY`,`NAME`,`CODE` ,VERSION, CREATEDBY, UPDATEDBY, CREATEDON, UPDATEDON)
VALUES (MASTERPROPERTYVALUELISTID,  `MASTERPROPERYTOVALUELIST`, `DISPLAY`,`NAME`,`CODE` ,CURRENT_TIMESTAMP, CREATEDBY, CREATEDBY, NOW(), NOW());
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pMasterPropertyValueListUpdate
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pMasterPropertyValueListUpdate`(
in MASTERPROPERTYVALUELISTId bigint,
in `MASTERPROPERYTOVALUELIST` BIGINT (20),

in `DISPLAY` NVARCHAR(40)
,in `NAME` NVARCHAR(40)
,in `CODE` NVARCHAR(10)

,in UPDATEDBY varchar(30)
)
BEGIN

UPDATE MASTERPROPERTYVALUELIST SET
 
MASTERPROPERTYVALUELIST.`MASTERPROPERYTOVALUELIST` = `MASTERPROPERYTOVALUELIST`,
 
MASTERPROPERTYVALUELIST.`DISPLAY` = `DISPLAY`
,MASTERPROPERTYVALUELIST.`NAME` = `NAME`
,MASTERPROPERTYVALUELIST.`CODE` = `CODE`
,
MASTERPROPERTYVALUELIST.VERSION = CURRENT_TIMESTAMP,
MASTERPROPERTYVALUELIST.UPDATEDBY = UPDATEDBY, 
MASTERPROPERTYVALUELIST.UPDATEDON = Now()
WHERE MASTERPROPERTYVALUELIST.MASTERPROPERTYVALUELISTID =  MASTERPROPERTYVALUELISTId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pModelDelete
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pModelDelete`(in ModelId BIGINT)
BEGIN
DELETE FROM Model WHERE model.ModelId = modelId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pModelInsert
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pModelInsert`(in ModelId bigint, in `Name` varchar(40), in CreatedBy varchar(30))
BEGIN

/*
	DECLARE modelId bigint DEFAULT 0;
	CALL pGenerateSequentialKey('MODEL_GEN', modelId) ;
*/
	INSERT INTO Model (MODELID, `NAME`, VERSION, CREATEDBY, UPDATEDBY, CREATEDON, UPDATEDON)
	VALUES (ModelId, `Name`, NOW(), CreatedBy, CreatedBy, NOW(), NOW());
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pModelUpdate
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pModelUpdate`(in ModelId BIGINT, in `Name` varchar(40), in UpdatedBy varchar(30))
BEGIN
	UPDATE Model SET model.Name = `Name`, model.UpdatedBy = UpdatedBy, model.UpdatedOn = Now()
	WHERE model.ModelId = ModelId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pPropertyGroupDelete
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pPropertyGroupDelete`(
in PROPERTYGROUPId bigint
)
BEGIN
	DELETE FROM PROPERTYGROUP where PROPERTYGROUP.PROPERTYGROUPId = PROPERTYGROUPId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pPropertyGroupInsert
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pPropertyGroupInsert`(
in `NAME` NVARCHAR(40)

,in CREATEDBY varchar(30)
)
BEGIN
DECLARE PROPERTYGROUPID bigint DEFAULT 0;
CALL pGenerateSequentialKey('PROPERTYGROUP_GEN', PROPERTYGROUPID);
INSERT INTO PROPERTYGROUP (PROPERTYGROUPID,   `NAME` ,VERSION, CREATEDBY, UPDATEDBY, CREATEDON, UPDATEDON)
VALUES (PROPERTYGROUPID,   `NAME` ,CURRENT_TIMESTAMP, CREATEDBY, CREATEDBY, NOW(), NOW());
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pPropertyGroupUpdate
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pPropertyGroupUpdate`(
in PROPERTYGROUPId bigint,
in `NAME` NVARCHAR(40)

,in UPDATEDBY varchar(30)
)
BEGIN

UPDATE PROPERTYGROUP SET
 
 
PROPERTYGROUP.`NAME` = `NAME`
,
PROPERTYGROUP.VERSION = CURRENT_TIMESTAMP,
PROPERTYGROUP.UPDATEDBY = UPDATEDBY, 
PROPERTYGROUP.UPDATEDON = Now()
WHERE PROPERTYGROUP.PROPERTYGROUPID =  PROPERTYGROUPId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pPropertyTypeDelete
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pPropertyTypeDelete`(
in PROPERTYTYPEId bigint
)
BEGIN
	DELETE FROM PROPERTYTYPE where PROPERTYTYPE.PROPERTYTYPEId = PROPERTYTYPEId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pPropertyTypeInsert
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pPropertyTypeInsert`(
in `NAME` NVARCHAR(40)
,in `DISPLAYCONTROL` INT
,in `NOTES` NVARCHAR(256)

,in CREATEDBY varchar(30)
)
BEGIN
DECLARE PROPERTYTYPEID bigint DEFAULT 0;
CALL pGenerateSequentialKey('PROPERTYTYPE_GEN', PROPERTYTYPEID);
INSERT INTO PROPERTYTYPE (PROPERTYTYPEID,   `NAME`,`DISPLAYCONTROL`,`NOTES` ,VERSION, CREATEDBY, UPDATEDBY, CREATEDON, UPDATEDON)
VALUES (PROPERTYTYPEID,   `NAME`,`DISPLAYCONTROL`,`NOTES` ,CURRENT_TIMESTAMP, CREATEDBY, CREATEDBY, NOW(), NOW());
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pPropertyTypeUpdate
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pPropertyTypeUpdate`(
in PROPERTYTYPEId bigint,
in `NAME` NVARCHAR(40)
,in `DISPLAYCONTROL` INT
,in `NOTES` NVARCHAR(256)

,in UPDATEDBY varchar(30)
)
BEGIN

UPDATE PROPERTYTYPE SET
 
 
PROPERTYTYPE.`NAME` = `NAME`
,PROPERTYTYPE.`DISPLAYCONTROL` = `DISPLAYCONTROL`
,PROPERTYTYPE.`NOTES` = `NOTES`
,
PROPERTYTYPE.VERSION = CURRENT_TIMESTAMP,
PROPERTYTYPE.UPDATEDBY = UPDATEDBY, 
PROPERTYTYPE.UPDATEDON = Now()
WHERE PROPERTYTYPE.PROPERTYTYPEID =  PROPERTYTYPEId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pRelationDelete
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pRelationDelete`(in RelationId BIGINT)
BEGIN
	DELETE FROM relation where relation.RelationId = RelationId;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pRelationInsert
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pRelationInsert`(
in RelationId bigint,
in ModelRelation BIGINT,
in `Name` varchar(30),
in LastModified BIGINT,
in LastBuilt BIGINT,
in Frozen BIT,
in CreatedBy varchar(30)
)
BEGIN
/*
DECLARE relationId bigint DEFAULT 0;

CALL pGenerateSequentialKey('RELATION_GEN', relationId) ;*/

INSERT INTO Relation (RelationId, ModelRelation, `Name`, LastModified, LastBuilt, Frozen, Version, CreatedBy, UpdatedBy, CreatedOn, UpdatedOn)
VALUES (relationId, ModelRelation, `Name`, LastModified, LastBuilt, Frozen, Now(), CreatedBy, CreatedBy, Now(), Now());

END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pRelationUpdate
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pRelationUpdate`(
in RelationId BIGINT,
in ModelRelation BIGINT,
in `Name` varchar(30),
in LastModified BIGINT,
in LastBuilt BIGINT,
in Frozen BIT,
in UpdatedBy varchar(30)
)
BEGIN
	UPDATE Relation 
	SET Relation.ModelRelation = ModelRelation,
	Relation.Name = `Name`,
	Relation.LastModified = LastModified,
	Relation.LastBuilt = LastBuilt,
	Relation.Frozen = Frozen,
	Relation.UpdatedBy = UpdatedBy,
	Relation.UpdatedOn = Now()
	WHERE Relation.RelationId = RelationId;
END//
DELIMITER ;


-- Dumping structure for table codebreed.propertygroup
CREATE TABLE IF NOT EXISTS `propertygroup` (
  `PROPERTYGROUPID` bigint(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`PROPERTYGROUPID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.propertygroup: ~2 rows (approximately)
/*!40000 ALTER TABLE `propertygroup` DISABLE KEYS */;
INSERT INTO `propertygroup` (`PROPERTYGROUPID`, `NAME`, `VERSION`, `CREATEDBY`, `UPDATEDBY`, `CREATEDON`, `UPDATEDON`) VALUES
	(7, 'Display', '2012-08-01 18:50:38', NULL, NULL, NULL, NULL),
	(8, 'Logic', '2012-08-01 18:50:46', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `propertygroup` ENABLE KEYS */;


-- Dumping structure for table codebreed.propertytype
CREATE TABLE IF NOT EXISTS `propertytype` (
  `PROPERTYTYPEID` bigint(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `DISPLAYCONTROL` int(11) NOT NULL,
  `NOTES` varchar(256) DEFAULT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`PROPERTYTYPEID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.propertytype: ~4 rows (approximately)
/*!40000 ALTER TABLE `propertytype` DISABLE KEYS */;
INSERT INTO `propertytype` (`PROPERTYTYPEID`, `NAME`, `DISPLAYCONTROL`, `NOTES`, `VERSION`, `CREATEDBY`, `UPDATEDBY`, `CREATEDON`, `UPDATEDON`) VALUES
	(2, 'Boolean', 0, 'shows as a checkbox', '2012-08-02 05:34:29', NULL, NULL, NULL, NULL),
	(3, 'Text', 1, 'shows as a text box', '2012-09-01 03:48:42', NULL, NULL, NULL, NULL),
	(4, 'List', 2, 'shows as a combo', '2012-09-01 03:48:53', NULL, NULL, NULL, NULL),
	(5, 'Lookup', 3, 'combo bound to the ListHeader entity', '2012-09-01 18:52:28', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `propertytype` ENABLE KEYS */;


-- Dumping structure for procedure codebreed.pScreenChildCreateArtifacts
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pScreenChildCreateArtifacts`(
	in ScreenChildId bigint,
	in CREATEDBY varchar(30)
)
BEGIN

/*
DECLARE screenArtifactId bigint DEFAULT 0;
CALL pGenerateSequentialKey('SCREENARTIFACT_GEN', screenArtifactId);
*/

insert into ScreenArtifact (SCREENARTIFACTID, ARTIFACTTOATTRIBUTE, CHILDTOARTIFACT, `NAME`, VERSION, CREATEDBY, UPDATEDBY, CREATEDON, UPDATEDON)
select  fGenerateSequentialKey('SCREENARTIFACT_GEN'), a.attributeId,  ScreenChildId, a.Name, CURRENT_TIMESTAMP, CREATEDBY, CREATEDBY, NOW(), NOW()
from screenchild c 
inner join association r on r.ASSOCIATIONID = c.SCREENCHILDTOASSOCIATION
inner join attribute a on r.OWNED = a.RELATIONATTRIBUTE
 where c.ScreenChildId = ScreenChildId 
and a.ATTRIBUTEID not in (
select s.ARTIFACTTOATTRIBUTE from screenartifact s where s.CHILDTOARTIFACT = ScreenChildId
);
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pScreenChildDelete
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pScreenChildDelete`(
 in SCREENCHILDID bigint
)
BEGIN

DELETE FROM SCREENCHILD WHERE SCREENCHILD.SCREENCHILDID = SCREENCHILDID;

END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pScreenChildInsert
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pScreenChildInsert`(
	in SCREENCHILDTOASSOCIATION bigint,
	in SCREENFAMILYTOSCREENCHILD bigint,
	in SCREENCHILDTOSELF bigint,
	in `NAME` varchar(40),
	in CREATEDBY varchar(30)
)
BEGIN

DECLARE screenChildId bigint DEFAULT 0;


	CALL pGenerateSequentialKey('SCREENCHILD_GEN', screenChildId);

	INSERT INTO ScreenChild (SCREENCHILDID, SCREENCHILDTOASSOCIATION, SCREENFAMILYTOSCREENCHILD, SCREENCHILDTOSELF, `NAME`, VERSION, CREATEDBY, UPDATEDBY, CREATEDON, UPDATEDON)
	VALUES (screenChildId, SCREENCHILDTOASSOCIATION, SCREENFAMILYTOSCREENCHILD, SCREENCHILDTOSELF, `NAME`, CURRENT_TIMESTAMP, CreatedBy, CreatedBy, NOW(), NOW());

	select screenChildId as ScreenChildId;

END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pScreenChildUpdate
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pScreenChildUpdate`(
	in SCREENCHILDID bigint,
	in SCREENCHILDTOASSOCIATION bigint,
	in SCREENFAMILYTOSCREENCHILD bigint,
	in SCREENCHILDTOSELF bigint,
	in `NAME` varchar(40),
	in UPDATEDBY varchar(30)
)
BEGIN
UPDATE SCREENCHILD
SET
SCREENCHILD.SCREENCHILDTOASSOCIATION = SCREENCHILDTOASSOCIATION,
SCREENCHILD.SCREENFAMILYTOSCREENCHILD = SCREENFAMILYTOSCREENCHILD,
SCREENCHILD.SCREENCHILDTOSELF = SCREENCHILDTOSELF,
SCREENCHILD.`NAME` = `Name`,
SCREENCHILD.`VERSION` = CURRENT_TIMESTAMP,
SCREENCHILD.`UPDATEDBY` = UpdatedBy,
SCREENCHILD.`UPDATEDON` = Now()
WHERE SCREENCHILD.SCREENCHILDID = SCREENCHILDID;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pScreenFamilyCreateArtifacts
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pScreenFamilyCreateArtifacts`(
	in ScreenFamilyId bigint,
	in CREATEDBY varchar(30)
)
BEGIN

/*
DECLARE screenArtifactId bigint DEFAULT 0;
CALL pGenerateSequentialKey('SCREENARTIFACT_GEN', screenArtifactId);
*/

insert into ScreenArtifact (SCREENARTIFACTID, ARTIFACTTOATTRIBUTE, FAMILYTOARTIFACT, `NAME`, VERSION, CREATEDBY, UPDATEDBY, CREATEDON, UPDATEDON)
select  fGenerateSequentialKey('SCREENARTIFACT_GEN'), a.attributeId,  ScreenFamilyId, a.Name, CURRENT_TIMESTAMP, CREATEDBY, CREATEDBY, NOW(), NOW()
from screenfamily f 
inner join relation r on r.RELATIONID = f.SCREENFAMILYTORELATION
inner join attribute a on r.RELATIONID = a.RELATIONATTRIBUTE
 where f.SCREENFAMILYID = ScreenFamilyId 
and a.ATTRIBUTEID not in (
select s.ARTIFACTTOATTRIBUTE from screenartifact s where s.FAMILYTOARTIFACT = ScreenFamilyId
);

END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pScreenFamilyDelete
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pScreenFamilyDelete`(
	in ScreenFamilyId bigint
)
BEGIN

DELETE FROM ScreenFamily WHERE ScreenFamily.ScreenFamilyId = ScreenFamilyId;

END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pScreenFamilyInsert
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pScreenFamilyInsert`(
in screenFamilyId bigint,
in ScreenFamilyToRelation bigint,
in ModelToScreenFamily bigint,
in Name varchar(40),
in CreatedBy varchar(30) 
)
BEGIN
/*
DECLARE screenFamilyId bigint DEFAULT 0;
CALL pGenerateSequentialKey('SCREENFAMILY_GEN', screenFamilyId);
*/

INSERT INTO ScreenFamily (screenFamilyId, ScreenFamilyToRelation, ModelToScreenFamily, Name, VERSION, CREATEDBY, UPDATEDBY, CREATEDON, UPDATEDON)
VALUES (screenFamilyId,  ScreenFamilyToRelation, ModelToScreenFamily, Name, CURRENT_TIMESTAMP, CreatedBy, CreatedBy, NOW(), NOW());

END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pScreenFamilyUpdate
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pScreenFamilyUpdate`(
	in ScreenFamilyId bigint,
	in ScreenFamilyToRelation bigint,
	in ModelToScreenFamily bigint,
	in `Name` varchar (40),
	in UpdatedBy varchar(30)
)
BEGIN

	UPDATE ScreenFamily 
	SET 
	ScreenFamily.Name = `Name`,
	ScreenFamily.ScreenFamilyToRelation = ScreenFamilyToRelation,
	ScreenFamily.ModelToScreenFamily = ModelToScreenFamily,
	ScreenFamily.UpdatedBy = UpdatedBy,
	ScreenFamily.UpdatedOn = Now()
	WHERE ScreenFamily.ScreenFamilyId = ScreenFamilyId;

END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pScreenPropertyValueDelete
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pScreenPropertyValueDelete`(
in ScreenPropertyValueId bigint
)
BEGIN

DELETE FROM ScreenPropertyValue where ScreenPropertyValue.ScreenPropertyValueId = ScreenPropertyValueId;

END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pScreenPropertyValueInsert
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pScreenPropertyValueInsert`(
in SCREENPROPVALUETOPROPERTY bigint,
in FAMILYTOSCREENPROPVALUE bigint,
in CHILDTOSCREENPROPVALUE bigint,
in PROPERTYVALUE varchar(2000),
in CREATEDBY varchar(30)
)
BEGIN

DECLARE screenPropertyValueId bigint DEFAULT 0;

CALL pGenerateSequentialKey('SCREENPROPERTYVALUE_GEN', screenPropertyValueId);

INSERT INTO ScreenPropertyValue (SCREENPROPERTYVALUEID, SCREENPROPVALUETOPROPERTY, FAMILYTOSCREENPROPVALUE, CHILDTOSCREENPROPVALUE, PROPERTYVALUE, VERSION, CREATEDBY, UPDATEDBY, CREATEDON, UPDATEDON)
VALUES (screenPropertyValueId, SCREENPROPVALUETOPROPERTY, FAMILYTOSCREENPROPVALUE, CHILDTOSCREENPROPVALUE, PROPERTYVALUE, CURRENT_TIMESTAMP, CreatedBy, CreatedBy, NOW(), NOW());


END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pScreenPropertyValueUpdate
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pScreenPropertyValueUpdate`(
in SCREENPROPERTYVALUEID bigint,
in SCREENPROPVALUETOPROPERTY bigint,
in FAMILYTOSCREENPROPVALUE bigint,
in CHILDTOSCREENPROPVALUE bigint,
in PROPERTYVALUE varchar(2000),
in UPDATEDBY varchar(30)
)
BEGIN
UPDATE SCREENPROPERTYVALUE
SET SCREENPROPERTYVALUE.SCREENPROPVALUETOPROPERTY = SCREENPROPVALUETOPROPERTY,
SCREENPROPERTYVALUE.FAMILYTOSCREENPROPVALUE = FAMILYTOSCREENPROPVALUE,
SCREENPROPERTYVALUE.CHILDTOSCREENPROPVALUE = CHILDTOSCREENPROPVALUE,
SCREENPROPERTYVALUE.PROPERTYVALUE = PROPERTYVALUE,
SCREENPROPERTYVALUE.UPDATEDBY = UPDATEDBY,
SCREENPROPERTYVALUE.UpdatedOn = Now()
WHERE SCREENPROPERTYVALUE.SCREENPROPERTYVALUEID = SCREENPROPERTYVALUEID;
END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pSelectFormProperties
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pSelectFormProperties`( in ScreenFamilyId bigint)
BEGIN

select m.masterpropertyid, m.name, m.defaultvalue, m.notes, ac.name as categoryname, 
pt.name as propertyTypeName, pt.displaycontrol, pt.notes as propertyTypeNotes,  g.name as groupName,
pv.screenpropertyvalueid, familytoscreenpropvalue, IFNULL(propertyvalue,m.defaultvalue) as propertyvalue
from masterproperty m 
inner join masterpropertytocategory c on m.masterpropertyid = c.masterpropertyid
inner join mastercategory ac on c.mastercategoryid = ac.mastercategoryid
inner join propertytype pt on pt.propertytypeid = m.masterpropertytotype
inner join propertygroup g on g.propertygroupid = m.masterpropertytogroup
left join screenpropertyvalue pv on screenpropvaluetoproperty = m.masterpropertyid
where ac.name = 'Screen' and (pv.familytoscreenpropvalue = ScreenFamilyId or (pv.familytoscreenpropvalue is null and pv.childtoscreenpropvalue is null));

END//
DELIMITER ;


-- Dumping structure for procedure codebreed.pSelectSequentialKey
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pSelectSequentialKey`(IN sequenceName CHAR(50))
BEGIN

IF (SELECT 1 = 1 FROM id_gen WHERE SEQ_NAME = sequenceName) THEN
BEGIN
    UPDATE id_gen SET SEQ_VALUE = SEQ_VALUE + 1 WHERE SEQ_NAME =  sequenceName;
END;
ELSE
BEGIN
    INSERT INTO id_gen (SEQ_NAME, SEQ_VALUE) VALUES(sequenceName, 0);
END;
END IF;

SELECT SEQ_VALUE FROM id_gen WHERE SEQ_NAME =  sequenceName;
END//
DELIMITER ;


-- Dumping structure for table codebreed.registrant
CREATE TABLE IF NOT EXISTS `registrant` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(25) NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_it677o4jaydleb048j9oub9mk` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table codebreed.registrant: ~2 rows (approximately)
/*!40000 ALTER TABLE `registrant` DISABLE KEYS */;
INSERT INTO `registrant` (`id`, `email`, `name`, `phone_number`) VALUES
	(1, 'test@test.com', 'test', '222'),
	(3, 'tesst@test.com', 'test', '12343445');
/*!40000 ALTER TABLE `registrant` ENABLE KEYS */;


-- Dumping structure for table codebreed.relation
CREATE TABLE IF NOT EXISTS `relation` (
  `RELATIONID` bigint(20) NOT NULL,
  `MODELRELATION` bigint(20) DEFAULT NULL,
  `NAME` varchar(30) NOT NULL,
  `LASTMODIFIED` bigint(20) DEFAULT NULL,
  `LASTBUILT` bigint(20) DEFAULT NULL,
  `FROZEN` bit(1) DEFAULT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`RELATIONID`),
  KEY `ModelRelation_idx` (`MODELRELATION`),
  CONSTRAINT `ModelRelation` FOREIGN KEY (`MODELRELATION`) REFERENCES `model` (`MODELID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.relation: ~73 rows (approximately)
/*!40000 ALTER TABLE `relation` DISABLE KEYS */;
INSERT INTO `relation` (`RELATIONID`, `MODELRELATION`, `NAME`, `LASTMODIFIED`, `LASTBUILT`, `FROZEN`, `VERSION`, `CREATEDBY`, `UPDATEDBY`, `CREATEDON`, `UPDATEDON`) VALUES
	(13, 14, 'jboss', 0, 0, b'1', '2012-12-23 09:31:42', NULL, NULL, NULL, NULL),
	(15, 14, 'jchild', 0, 0, b'0', '2013-01-29 17:12:52', NULL, 'paulm', NULL, '2013-01-29 17:12:52'),
	(16, 26, 'RelationPropertyValue', 0, 0, b'0', '2013-01-11 16:06:02', NULL, 'paulm', NULL, '2013-01-11 16:06:02'),
	(17, 16, 'Customer', 0, 0, b'0', '2013-01-16 15:22:33', 'paulm', NULL, '2013-01-16 15:22:33', NULL),
	(22, 18, 'ItemPost', 0, 0, b'0', '2013-03-31 13:07:39', 'paulm', 'paulm', '2013-03-31 13:07:10', '2013-03-31 13:07:39'),
	(36, 26, 'Model', 0, 0, b'0', '2012-07-21 17:58:03', NULL, NULL, NULL, NULL),
	(37, 26, 'Association', 0, 0, b'0', '2012-07-21 17:58:52', NULL, NULL, NULL, NULL),
	(38, 26, 'Relation', 0, 0, b'0', '2012-07-21 18:00:49', NULL, NULL, NULL, NULL),
	(39, 26, 'Attribute', 0, 0, b'0', '2012-07-21 18:04:17', NULL, NULL, NULL, NULL),
	(66, 39, 'Group', 0, 0, b'0', '2012-07-25 14:41:56', NULL, NULL, NULL, NULL),
	(67, 39, 'User', 0, 0, b'1', '2012-12-23 09:29:53', NULL, NULL, NULL, NULL),
	(69, 26, 'MasterProperty', 0, 0, b'0', '2012-07-26 10:08:44', NULL, NULL, NULL, NULL),
	(70, 26, 'MasterCategory', 0, 0, b'0', '2012-07-26 10:09:25', NULL, NULL, NULL, NULL),
	(71, 26, 'PropertyGroup', 0, 0, b'0', '2012-07-26 10:10:16', NULL, NULL, NULL, NULL),
	(72, 26, 'ScreenArtifact', 0, 0, b'0', '2012-07-26 10:12:14', NULL, NULL, NULL, NULL),
	(73, 26, 'ScreenPropertyValue', 0, 0, b'0', '2012-07-26 10:12:49', NULL, NULL, NULL, NULL),
	(74, 26, 'ArtifactPropertyValue', 0, 0, b'0', '2012-07-26 10:13:06', NULL, NULL, NULL, NULL),
	(75, 26, 'ScreenArtifactType', 0, 0, b'0', '2012-07-26 10:54:01', NULL, NULL, NULL, NULL),
	(76, 26, 'PropertyType', 0, 0, b'0', '2012-07-26 10:59:40', NULL, NULL, NULL, NULL),
	(78, 26, 'Build', 0, 0, b'0', '2012-08-01 12:54:38', NULL, NULL, NULL, NULL),
	(79, 26, 'ScreenFamily', 0, 0, b'0', '2012-08-02 16:01:08', NULL, NULL, NULL, NULL),
	(80, 26, 'ScreenChild', 0, 0, b'0', '2012-08-02 16:01:54', NULL, NULL, NULL, NULL),
	(99, 42, 'testing001', 0, 0, b'0', '2012-08-06 17:19:04', NULL, NULL, NULL, NULL),
	(100, 42, 'testing002', 0, 0, b'0', '2012-08-06 22:08:21', NULL, NULL, NULL, NULL),
	(102, 26, 'MasterPropertyValueList', 0, 0, b'0', '2012-09-01 04:13:22', NULL, NULL, NULL, NULL),
	(103, 26, 'ListHeader', 0, 0, b'0', '2012-09-01 16:57:10', NULL, NULL, NULL, NULL),
	(104, 26, 'ListDetail', 0, 0, b'0', '2012-09-01 16:57:52', NULL, NULL, NULL, NULL),
	(113, 26, 'Environment', 0, 0, b'0', '2012-11-24 20:42:12', NULL, NULL, NULL, NULL),
	(117, 48, 'Captain', 0, 0, b'0', '2015-12-08 15:26:41', NULL, NULL, '2015-11-13 14:52:39', '2015-12-08 15:26:41'),
	(118, 48, 'Friedrich', 0, 0, b'0', '2015-11-26 19:46:50', NULL, NULL, '2015-11-13 14:52:55', '2015-11-13 14:52:55'),
	(119, 48, 'Lart', 0, 0, b'0', '2015-11-26 19:46:50', NULL, NULL, '2015-11-14 17:35:12', '2015-11-14 17:35:12'),
	(120, 48, 'Arskiss', 0, 0, b'0', '2015-11-26 19:46:50', NULL, NULL, '2015-11-14 18:17:06', '2015-11-14 18:17:06'),
	(121, 48, 'BarsKiss', 0, 0, b'0', '2015-11-26 19:46:50', NULL, NULL, '2015-11-14 18:19:03', '2015-11-14 18:19:03'),
	(122, 49, 'testclass', 0, 0, b'0', '2015-11-26 19:46:50', NULL, NULL, '2015-11-15 21:30:47', '2015-11-15 21:30:47'),
	(123, 49, 'testchildclass', 0, 0, b'0', '2015-11-26 19:46:50', NULL, NULL, '2015-11-15 21:31:18', '2015-11-15 21:31:18'),
	(124, 48, 'zarkov', 0, 0, b'0', '2015-11-26 19:46:50', NULL, NULL, '2015-11-16 18:34:25', '2015-11-16 18:34:25'),
	(125, 50, 'Contact', NULL, NULL, NULL, '2015-12-26 17:10:30', NULL, NULL, '2015-12-26 17:10:30', '2015-12-26 17:10:30'),
	(126, 50, 'Field', NULL, NULL, NULL, '2015-12-26 17:10:44', NULL, NULL, '2015-12-26 17:10:44', '2015-12-26 17:10:44'),
	(127, 50, 'Referee', NULL, NULL, NULL, '2015-12-26 17:10:50', NULL, NULL, '2015-12-26 17:10:50', '2015-12-26 17:10:50'),
	(130, 50, 'Zebra', NULL, NULL, NULL, '2016-01-01 13:43:39', NULL, NULL, '2016-01-01 13:43:39', '2016-01-01 13:43:39'),
	(132, 50, 'Yak', NULL, NULL, NULL, '2016-01-01 18:20:44', NULL, NULL, '2016-01-01 18:20:44', '2016-01-01 18:20:44'),
	(133, 51, 'Product', NULL, NULL, NULL, '2016-01-01 18:46:00', NULL, NULL, '2016-01-01 18:46:00', '2016-01-01 18:46:00'),
	(134, 51, 'Location', NULL, NULL, NULL, '2016-01-01 18:46:07', NULL, NULL, '2016-01-01 18:46:07', '2016-01-01 18:46:07'),
	(135, 51, 'Price', NULL, NULL, NULL, '2016-01-01 18:46:15', NULL, NULL, '2016-01-01 18:46:15', '2016-01-01 18:46:15'),
	(136, 51, 'Order', NULL, NULL, NULL, '2016-01-01 18:46:25', NULL, NULL, '2016-01-01 18:46:25', '2016-01-01 18:46:25'),
	(137, 51, 'OrderDetail', NULL, NULL, NULL, '2016-01-01 18:46:35', NULL, NULL, '2016-01-01 18:46:35', '2016-01-01 18:46:35'),
	(138, 51, 'Invoice', NULL, NULL, NULL, '2016-01-01 18:46:46', NULL, NULL, '2016-01-01 18:46:46', '2016-01-01 18:46:46'),
	(139, 51, 'InvoiceDetail', NULL, NULL, NULL, '2016-01-01 18:46:54', NULL, NULL, '2016-01-01 18:46:54', '2016-01-01 18:46:54'),
	(140, 52, 'Departments', NULL, NULL, NULL, '2016-01-18 12:12:25', NULL, NULL, '2016-01-16 17:36:31', '2016-01-18 12:12:25'),
	(141, 52, 'Employee', NULL, NULL, NULL, '2016-01-16 18:31:53', NULL, NULL, '2016-01-16 18:31:53', '2016-01-16 18:31:53'),
	(142, 53, 'Actor', NULL, NULL, NULL, '2016-01-18 20:26:56', NULL, NULL, '2016-01-17 10:20:40', '2016-01-18 20:26:56'),
	(143, 53, 'Address', NULL, NULL, NULL, '2016-01-17 10:22:24', NULL, NULL, '2016-01-17 10:22:24', '2016-01-17 10:22:24'),
	(144, 53, 'Category', NULL, NULL, NULL, '2016-01-17 10:26:09', NULL, NULL, '2016-01-17 10:26:09', '2016-01-17 10:26:09'),
	(145, 53, 'City', NULL, NULL, NULL, '2016-01-17 10:26:48', NULL, NULL, '2016-01-17 10:26:48', '2016-01-17 10:26:48'),
	(146, 53, 'Country', NULL, NULL, NULL, '2016-01-17 10:40:12', NULL, NULL, '2016-01-17 10:40:12', '2016-01-17 10:40:12'),
	(147, 53, 'Customer', NULL, NULL, NULL, '2016-01-17 17:26:18', NULL, NULL, '2016-01-17 17:26:18', '2016-01-17 17:26:18'),
	(148, 53, 'Film', NULL, NULL, NULL, '2016-01-17 17:32:32', NULL, NULL, '2016-01-17 17:32:32', '2016-01-17 17:32:32'),
	(149, 53, 'Film_Text', NULL, NULL, NULL, '2016-01-17 18:37:05', NULL, NULL, '2016-01-17 18:37:05', '2016-01-17 18:37:05'),
	(150, 53, 'Inventory', NULL, NULL, NULL, '2016-01-17 19:42:00', NULL, NULL, '2016-01-17 19:42:00', '2016-01-17 19:42:00'),
	(151, 53, 'Language', NULL, NULL, NULL, '2016-01-17 19:46:37', NULL, NULL, '2016-01-17 19:46:37', '2016-01-17 19:46:37'),
	(152, 53, 'Payment', NULL, NULL, NULL, '2016-01-17 19:46:52', NULL, NULL, '2016-01-17 19:46:52', '2016-01-17 19:46:52'),
	(153, 53, 'rental', NULL, NULL, NULL, '2016-01-17 19:47:03', NULL, NULL, '2016-01-17 19:47:03', '2016-01-17 19:47:03'),
	(154, 53, 'staff', NULL, NULL, NULL, '2016-01-17 19:47:13', NULL, NULL, '2016-01-17 19:47:13', '2016-01-17 19:47:13'),
	(155, 53, 'store', NULL, NULL, NULL, '2016-01-17 19:47:19', NULL, NULL, '2016-01-17 19:47:19', '2016-01-17 19:47:19'),
	(156, 42, 'frederick', NULL, NULL, NULL, '2016-01-18 20:33:46', NULL, NULL, '2016-01-18 20:33:46', '2016-01-18 20:33:46'),
	(157, 42, 'testing0032', NULL, NULL, NULL, '2016-01-18 20:47:55', NULL, NULL, '2016-01-18 20:41:05', '2016-01-18 20:47:55'),
	(158, 42, 'testing009', NULL, NULL, NULL, '2016-01-18 21:07:56', NULL, NULL, '2016-01-18 21:07:56', '2016-01-18 21:07:56'),
	(159, 26, 'AttributePropertyValue', NULL, NULL, b'0', '2016-01-20 12:06:34', NULL, NULL, '2016-01-20 12:06:27', '2016-01-20 12:06:34'),
	(160, 42, 'Testing010', NULL, NULL, NULL, '2016-01-20 15:13:49', NULL, NULL, '2016-01-20 15:13:49', '2016-01-20 15:13:49'),
	(161, 42, 'Test011', NULL, NULL, NULL, '2016-01-20 15:15:23', NULL, NULL, '2016-01-20 15:15:23', '2016-01-20 15:15:23'),
	(162, 42, 'Testing011', NULL, NULL, NULL, '2016-01-20 15:46:23', NULL, NULL, '2016-01-20 15:46:23', '2016-01-20 15:46:23'),
	(163, 57, 'Testing', NULL, NULL, NULL, '2016-01-26 18:22:47', NULL, NULL, '2016-01-26 18:22:47', '2016-01-26 18:22:47'),
	(164, 60, 'ian', 0, 0, b'0', '2016-02-07 23:11:47', NULL, NULL, '2016-02-07 23:11:07', '2016-02-07 23:11:47'),
	(166, 60, 'janis', 0, 0, b'0', '2016-02-15 12:12:23', NULL, NULL, '2016-02-15 12:12:23', '2016-02-15 12:12:23');
/*!40000 ALTER TABLE `relation` ENABLE KEYS */;


-- Dumping structure for table codebreed.relationpropertyvalue
CREATE TABLE IF NOT EXISTS `relationpropertyvalue` (
  `RELATIONPROPERTYVALUEID` bigint(20) NOT NULL,
  `RELATIONTOPROPERTYVALUE` bigint(20) DEFAULT NULL,
  `PROPERTYVALUE` varchar(2000) NOT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`RELATIONPROPERTYVALUEID`),
  KEY `fk_RELATIONTOPROPERTYVALUE` (`RELATIONTOPROPERTYVALUE`),
  CONSTRAINT `fk_RELATIONTOPROPERTYVALUE` FOREIGN KEY (`RELATIONTOPROPERTYVALUE`) REFERENCES `relation` (`RELATIONID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.relationpropertyvalue: ~0 rows (approximately)
/*!40000 ALTER TABLE `relationpropertyvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `relationpropertyvalue` ENABLE KEYS */;


-- Dumping structure for table codebreed.screenartifact
CREATE TABLE IF NOT EXISTS `screenartifact` (
  `SCREENARTIFACTID` bigint(20) NOT NULL,
  `ARTIFACTTOATTRIBUTE` bigint(20) DEFAULT NULL,
  `FAMILYTOARTIFACT` bigint(20) DEFAULT NULL,
  `CHILDTOARTIFACT` bigint(20) DEFAULT NULL,
  `NAME` varchar(40) NOT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`SCREENARTIFACTID`),
  KEY `fk_FAMILYTOARTIFACT` (`FAMILYTOARTIFACT`),
  KEY `fk_CHILDTOARTIFACT` (`CHILDTOARTIFACT`),
  CONSTRAINT `fk_CHILDTOARTIFACT` FOREIGN KEY (`CHILDTOARTIFACT`) REFERENCES `screenchild` (`SCREENCHILDID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_FAMILYTOARTIFACT` FOREIGN KEY (`FAMILYTOARTIFACT`) REFERENCES `screenfamily` (`SCREENFAMILYID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.screenartifact: ~134 rows (approximately)
/*!40000 ALTER TABLE `screenartifact` DISABLE KEYS */;
INSERT INTO `screenartifact` (`SCREENARTIFACTID`, `ARTIFACTTOATTRIBUTE`, `FAMILYTOARTIFACT`, `CHILDTOARTIFACT`, `NAME`, `VERSION`, `CREATEDBY`, `UPDATEDBY`, `CREATEDON`, `UPDATEDON`) VALUES
	(42, 204, NULL, 15, 'servicePort', '2012-12-27 10:54:06', NULL, NULL, NULL, NULL),
	(43, 203, NULL, 15, 'serviceHost', '2012-12-27 10:54:06', NULL, NULL, NULL, NULL),
	(44, 163, NULL, 15, 'packagecom', '2012-12-27 10:54:06', NULL, NULL, NULL, NULL),
	(45, 196, NULL, 15, 'hostplatform', '2012-12-27 10:54:06', NULL, NULL, NULL, NULL),
	(46, 162, NULL, 15, 'persistencename', '2012-12-27 10:54:06', NULL, NULL, NULL, NULL),
	(47, 161, NULL, 15, 'warname', '2012-12-27 10:54:06', NULL, NULL, NULL, NULL),
	(48, 198, NULL, 15, 'MembershipDatabase', '2012-12-27 10:54:06', NULL, NULL, NULL, NULL),
	(49, 160, NULL, 15, 'ebjname', '2012-12-27 10:54:06', NULL, NULL, NULL, NULL),
	(50, 193, NULL, 15, 'toolspath', '2012-12-27 10:54:06', NULL, NULL, NULL, NULL),
	(51, 192, NULL, 15, 'templatepath', '2012-12-27 10:54:06', NULL, NULL, NULL, NULL),
	(52, 195, NULL, 15, 'servertype', '2012-12-27 10:54:06', NULL, NULL, NULL, NULL),
	(53, 194, NULL, 15, 'libpath', '2012-12-27 10:54:06', NULL, NULL, NULL, NULL),
	(54, 164, NULL, 15, 'packagedot', '2012-12-27 10:54:06', NULL, NULL, NULL, NULL),
	(55, 187, NULL, 15, 'host', '2012-12-27 10:54:06', NULL, NULL, NULL, NULL),
	(56, 190, NULL, 15, 'databaseName', '2012-12-27 10:54:06', NULL, NULL, NULL, NULL),
	(57, 191, NULL, 15, 'membershipserver', '2012-12-27 10:54:06', NULL, NULL, NULL, NULL),
	(58, 158, NULL, 15, 'Name', '2012-12-27 10:54:06', NULL, NULL, NULL, NULL),
	(59, 188, NULL, 15, 'port', '2012-12-27 10:54:06', NULL, NULL, NULL, NULL),
	(60, 159, NULL, 15, 'ProjectPath', '2012-12-27 10:54:06', NULL, NULL, NULL, NULL),
	(61, 189, NULL, 15, 'databaseserver', '2012-12-27 10:54:06', NULL, NULL, NULL, NULL),
	(63, 64, 9, NULL, 'name', '2013-04-07 10:53:53', NULL, 'paulm', NULL, '2013-04-07 10:53:53'),
	(65, 177, 17, NULL, 'Name', '2012-12-30 14:20:36', NULL, NULL, NULL, NULL),
	(66, 178, NULL, 32, 'Code', '2012-12-30 14:21:01', NULL, NULL, NULL, NULL),
	(67, 179, NULL, 32, 'Label', '2012-12-30 14:21:01', NULL, NULL, NULL, NULL),
	(68, 69, NULL, 10, 'name', '2012-12-31 16:43:49', NULL, NULL, NULL, NULL),
	(69, 70, NULL, 10, 'lastmodified', '2012-12-31 16:43:49', NULL, NULL, NULL, NULL),
	(70, 71, NULL, 10, 'lastbuilt', '2012-12-31 16:43:49', NULL, NULL, NULL, NULL),
	(71, 72, NULL, 10, 'frozen', '2012-12-31 16:43:49', NULL, NULL, NULL, NULL),
	(72, 76, NULL, 9, 'allownull', '2012-12-31 17:23:42', NULL, NULL, NULL, NULL),
	(73, 73, NULL, 9, 'name', '2012-12-31 17:23:42', NULL, NULL, NULL, NULL),
	(74, 74, NULL, 9, 'type', '2012-12-31 17:23:42', NULL, NULL, NULL, NULL),
	(75, 75, NULL, 9, 'attributelength', '2012-12-31 17:23:42', NULL, NULL, NULL, NULL),
	(76, 166, NULL, 14, 'Name', '2012-12-31 17:25:03', NULL, NULL, NULL, NULL),
	(77, 173, 10, NULL, 'Notes', '2012-12-31 18:10:09', NULL, NULL, NULL, NULL),
	(78, 172, 10, NULL, 'DefaultValue', '2012-12-31 18:10:09', NULL, NULL, NULL, NULL),
	(79, 146, 10, NULL, 'Name', '2012-12-31 18:10:09', NULL, NULL, NULL, NULL),
	(80, 175, NULL, 30, 'Code', '2012-12-31 18:10:23', NULL, NULL, NULL, NULL),
	(81, 174, NULL, 30, 'Name', '2012-12-31 18:10:23', NULL, NULL, NULL, NULL),
	(82, 176, NULL, 30, 'Display', '2012-12-31 18:10:23', NULL, NULL, NULL, NULL),
	(83, 147, 12, NULL, 'Name', '2012-12-31 18:10:39', NULL, NULL, NULL, NULL),
	(84, 152, 13, NULL, 'Name', '2012-12-31 18:10:47', NULL, NULL, NULL, NULL),
	(85, 153, 13, NULL, 'DisplayControl', '2012-12-31 18:10:47', NULL, NULL, NULL, NULL),
	(86, 154, 13, NULL, 'Notes', '2012-12-31 18:10:47', NULL, NULL, NULL, NULL),
	(87, 148, 14, NULL, 'Name', '2012-12-31 18:11:03', NULL, NULL, NULL, NULL),
	(88, 65, NULL, 11, 'Name', '2012-12-31 18:11:38', NULL, NULL, NULL, NULL),
	(89, 66, NULL, 11, 'type', '2012-12-31 18:19:25', NULL, NULL, NULL, NULL),
	(90, 165, NULL, 13, 'Name', '2012-12-31 18:11:50', NULL, NULL, NULL, NULL),
	(91, 150, NULL, 25, 'PropertyValue', '2012-12-31 18:47:31', NULL, NULL, NULL, NULL),
	(92, 157, NULL, 26, 'Name', '2012-12-31 18:47:50', NULL, NULL, NULL, NULL),
	(93, 166, NULL, 17, 'Name', '2012-12-31 18:48:19', NULL, NULL, NULL, NULL),
	(94, 150, NULL, 29, 'PropertyValue', '2012-12-31 18:48:30', NULL, NULL, NULL, NULL),
	(95, 157, NULL, 28, 'Name', '2012-12-31 18:48:40', NULL, NULL, NULL, NULL),
	(96, 150, NULL, 36, 'PropertyValue', '2012-12-31 18:49:06', NULL, NULL, NULL, NULL),
	(97, 157, NULL, 37, 'Name', '2012-12-31 18:49:16', NULL, NULL, NULL, NULL),
	(102, 141, 6, NULL, 'UserName', '2013-01-07 15:51:27', NULL, NULL, NULL, NULL),
	(103, 143, 6, NULL, 'AppID', '2013-01-07 15:51:27', NULL, NULL, NULL, NULL),
	(104, 142, 6, NULL, 'Password', '2013-01-07 15:51:27', NULL, NULL, NULL, NULL),
	(105, 144, 6, NULL, 'Email', '2013-01-07 15:51:27', NULL, NULL, NULL, NULL),
	(106, 139, 7, NULL, 'Name', '2013-01-07 15:51:47', NULL, NULL, NULL, NULL),
	(107, 140, 7, NULL, 'AppID', '2013-01-07 15:51:47', NULL, NULL, NULL, NULL),
	(109, 6, 20, NULL, 'myname', '2013-01-29 17:13:06', NULL, NULL, NULL, NULL),
	(115, 7, NULL, 119, 'PropertyValue', '2015-12-18 13:49:19', 'system', 'system', '2015-12-18 13:49:19', '2015-12-18 13:49:19'),
	(122, 149, NULL, 31, 'PropertyValue', '2015-12-18 13:49:23', 'system', 'system', '2015-12-18 13:49:23', '2015-12-18 13:49:23'),
	(124, 146, NULL, 120, 'Name', '2015-12-18 13:59:26', 'system', 'system', '2015-12-18 13:59:26', '2015-12-18 13:59:26'),
	(125, 172, NULL, 120, 'DefaultValue', '2015-12-18 13:59:26', 'system', 'system', '2015-12-18 13:59:26', '2015-12-18 13:59:26'),
	(126, 173, NULL, 120, 'Notes', '2015-12-18 13:59:26', 'system', 'system', '2015-12-18 13:59:26', '2015-12-18 13:59:26'),
	(127, 147, NULL, 121, 'Name', '2015-12-18 13:59:26', 'system', 'system', '2015-12-18 13:59:26', '2015-12-18 13:59:26'),
	(128, 174, NULL, 122, 'Name', '2015-12-18 13:59:26', 'system', 'system', '2015-12-18 13:59:26', '2015-12-18 13:59:26'),
	(129, 175, NULL, 122, 'Code', '2015-12-18 13:59:26', 'system', 'system', '2015-12-18 13:59:26', '2015-12-18 13:59:26'),
	(130, 176, NULL, 122, 'Display', '2015-12-18 13:59:26', 'system', 'system', '2015-12-18 13:59:26', '2015-12-18 13:59:26'),
	(131, 149, NULL, 123, 'PropertyValue', '2015-12-18 13:59:26', 'system', 'system', '2015-12-18 13:59:26', '2015-12-18 13:59:26'),
	(132, 146, NULL, 124, 'Name', '2015-12-18 13:59:26', 'system', 'system', '2015-12-18 13:59:26', '2015-12-18 13:59:26'),
	(133, 172, NULL, 124, 'DefaultValue', '2015-12-18 13:59:26', 'system', 'system', '2015-12-18 13:59:26', '2015-12-18 13:59:26'),
	(134, 173, NULL, 124, 'Notes', '2015-12-18 13:59:26', 'system', 'system', '2015-12-18 13:59:26', '2015-12-18 13:59:26'),
	(135, 147, NULL, 125, 'Name', '2015-12-18 13:59:26', 'system', 'system', '2015-12-18 13:59:26', '2015-12-18 13:59:26'),
	(136, 174, NULL, 126, 'Name', '2015-12-18 13:59:26', 'system', 'system', '2015-12-18 13:59:26', '2015-12-18 13:59:26'),
	(137, 175, NULL, 126, 'Code', '2015-12-18 13:59:26', 'system', 'system', '2015-12-18 13:59:26', '2015-12-18 13:59:26'),
	(138, 176, NULL, 126, 'Display', '2015-12-18 13:59:26', 'system', 'system', '2015-12-18 13:59:26', '2015-12-18 13:59:26'),
	(139, 146, NULL, 127, 'Name', '2015-12-18 13:59:26', 'system', 'system', '2015-12-18 13:59:26', '2015-12-18 13:59:26'),
	(140, 172, NULL, 127, 'DefaultValue', '2015-12-18 13:59:26', 'system', 'system', '2015-12-18 13:59:26', '2015-12-18 13:59:26'),
	(141, 173, NULL, 127, 'Notes', '2015-12-18 13:59:26', 'system', 'system', '2015-12-18 13:59:26', '2015-12-18 13:59:26'),
	(142, 147, NULL, 128, 'Name', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(143, 174, NULL, 129, 'Name', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(144, 175, NULL, 129, 'Code', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(145, 176, NULL, 129, 'Display', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(146, 146, NULL, 130, 'Name', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(147, 172, NULL, 130, 'DefaultValue', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(148, 173, NULL, 130, 'Notes', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(149, 147, NULL, 131, 'Name', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(150, 174, NULL, 132, 'Name', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(151, 175, NULL, 132, 'Code', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(152, 176, NULL, 132, 'Display', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(153, 149, NULL, 133, 'PropertyValue', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(154, 146, NULL, 134, 'Name', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(155, 172, NULL, 134, 'DefaultValue', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(156, 173, NULL, 134, 'Notes', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(157, 147, NULL, 135, 'Name', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(158, 174, NULL, 136, 'Name', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(159, 175, NULL, 136, 'Code', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(160, 176, NULL, 136, 'Display', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(161, 149, NULL, 27, 'PropertyValue', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(162, 146, NULL, 137, 'Name', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(163, 172, NULL, 137, 'DefaultValue', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(164, 173, NULL, 137, 'Notes', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(165, 147, NULL, 138, 'Name', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(166, 174, NULL, 139, 'Name', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(167, 175, NULL, 139, 'Code', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(168, 176, NULL, 139, 'Display', '2015-12-18 13:59:27', 'system', 'system', '2015-12-18 13:59:27', '2015-12-18 13:59:27'),
	(170, 147, NULL, 141, 'Name', '2015-12-18 14:20:49', 'system', 'system', '2015-12-18 14:20:49', '2015-12-18 14:20:49'),
	(171, 139, NULL, 142, 'Name', '2015-12-21 22:34:39', 'system', 'system', '2015-12-21 22:34:39', '2015-12-21 22:34:39'),
	(172, 140, NULL, 142, 'AppID', '2015-12-21 22:34:39', 'system', 'system', '2015-12-21 22:34:39', '2015-12-21 22:34:39'),
	(173, 6, 4, NULL, 'myname', '2015-12-24 15:06:36', 'system', 'system', '2015-12-24 15:06:36', '2015-12-24 15:06:36'),
	(174, 14, NULL, 143, 'test', '2015-12-24 15:06:36', 'system', 'system', '2015-12-24 15:06:36', '2015-12-24 15:06:36'),
	(175, 225, 23, NULL, 'FirstName', '2016-01-01 13:44:58', 'system', 'system', '2016-01-01 13:44:58', '2016-01-01 13:44:58'),
	(176, 226, 23, NULL, 'LastName', '2016-01-01 13:44:58', 'system', 'system', '2016-01-01 13:44:58', '2016-01-01 13:44:58'),
	(178, 227, 24, NULL, 'Name', '2016-01-01 18:30:33', 'system', 'system', '2016-01-01 18:30:33', '2016-01-01 18:30:33'),
	(179, 228, 25, NULL, 'FirstName', '2016-01-01 18:32:04', 'system', 'system', '2016-01-01 18:32:04', '2016-01-01 18:32:04'),
	(180, 15, 26, NULL, 'ImageName', '2016-01-05 11:33:22', 'system', 'system', '2016-01-05 11:33:22', '2016-01-05 11:33:22'),
	(181, 248, 27, NULL, 'first_name', '2016-01-18 10:41:17', 'system', 'system', '2016-01-18 10:41:17', '2016-01-18 10:41:17'),
	(182, 249, 27, NULL, 'last_name', '2016-01-18 10:41:17', 'system', 'system', '2016-01-18 10:41:17', '2016-01-18 10:41:17'),
	(183, 250, 27, NULL, 'last_update', '2016-01-18 10:41:17', 'system', 'system', '2016-01-18 10:41:17', '2016-01-18 10:41:17'),
	(184, 251, 28, NULL, 'address', '2016-01-18 10:46:53', 'system', 'system', '2016-01-18 10:46:53', '2016-01-18 10:46:53'),
	(185, 253, 28, NULL, 'address2', '2016-01-18 10:46:53', 'system', 'system', '2016-01-18 10:46:53', '2016-01-18 10:46:53'),
	(186, 254, 28, NULL, 'district', '2016-01-18 10:46:53', 'system', 'system', '2016-01-18 10:46:53', '2016-01-18 10:46:53'),
	(187, 255, 28, NULL, 'postal_code', '2016-01-18 10:46:53', 'system', 'system', '2016-01-18 10:46:53', '2016-01-18 10:46:53'),
	(188, 256, 28, NULL, 'phone', '2016-01-18 10:46:53', 'system', 'system', '2016-01-18 10:46:53', '2016-01-18 10:46:53'),
	(189, 258, NULL, 144, 'city', '2016-01-18 10:46:54', 'system', 'system', '2016-01-18 10:46:54', '2016-01-18 10:46:54'),
	(190, 257, 29, NULL, 'Name', '2016-01-18 13:47:57', 'system', 'system', '2016-01-18 13:47:57', '2016-01-18 13:47:57'),
	(191, 170, 30, NULL, 'testattribute', '2016-01-18 20:50:11', 'system', 'system', '2016-01-18 20:50:11', '2016-01-18 20:50:11'),
	(192, 215, NULL, 145, 'Second', '2016-01-18 20:50:11', 'system', 'system', '2016-01-18 20:50:11', '2016-01-18 20:50:11'),
	(193, 170, 31, NULL, 'testattribute', '2016-01-19 11:48:22', 'system', 'system', '2016-01-19 11:48:22', '2016-01-19 11:48:22'),
	(194, 215, NULL, 146, 'Second', '2016-01-19 11:48:22', 'system', 'system', '2016-01-19 11:48:22', '2016-01-19 11:48:22'),
	(195, 215, 31, NULL, 'Second', '2016-01-19 11:48:30', 'system', 'system', '2016-01-19 11:48:30', '2016-01-19 11:48:30'),
	(196, 278, 32, NULL, 'FirstName', '2016-01-20 16:04:26', 'system', 'system', '2016-01-20 16:04:26', '2016-01-20 16:04:26');
/*!40000 ALTER TABLE `screenartifact` ENABLE KEYS */;


-- Dumping structure for table codebreed.screenartifacttype
CREATE TABLE IF NOT EXISTS `screenartifacttype` (
  `SCREENARTIFACTTYPEID` bigint(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`SCREENARTIFACTTYPEID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.screenartifacttype: ~6 rows (approximately)
/*!40000 ALTER TABLE `screenartifacttype` DISABLE KEYS */;
INSERT INTO `screenartifacttype` (`SCREENARTIFACTTYPEID`, `NAME`, `VERSION`, `CREATEDBY`, `UPDATEDBY`, `CREATEDON`, `UPDATEDON`) VALUES
	(2, 'VerticalBox', '2012-08-01 15:18:44', NULL, NULL, NULL, NULL),
	(3, 'HorizontalBox', '2012-08-01 15:18:56', NULL, NULL, NULL, NULL),
	(4, 'TextBox', '2012-08-01 15:19:14', NULL, NULL, NULL, NULL),
	(5, 'ComboBox', '2012-08-01 15:19:25', NULL, NULL, NULL, NULL),
	(6, 'CheckBox', '2012-08-01 15:19:37', NULL, NULL, NULL, NULL),
	(7, 'DatePicker', '2012-08-01 15:20:20', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `screenartifacttype` ENABLE KEYS */;


-- Dumping structure for table codebreed.screenchild
CREATE TABLE IF NOT EXISTS `screenchild` (
  `SCREENCHILDID` bigint(20) NOT NULL,
  `SCREENCHILDTOASSOCIATION` bigint(20) DEFAULT NULL,
  `SCREENFAMILYTOSCREENCHILD` bigint(20) DEFAULT NULL,
  `SCREENCHILDTOSELF` bigint(20) DEFAULT NULL,
  `NAME` varchar(40) NOT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`SCREENCHILDID`),
  KEY `fk_SCREENFAMILYTOSCREENCHILD` (`SCREENFAMILYTOSCREENCHILD`),
  KEY `fk_SCREENCHILDTOSELF` (`SCREENCHILDTOSELF`),
  CONSTRAINT `fk_SCREENCHILDTOSELF` FOREIGN KEY (`SCREENCHILDTOSELF`) REFERENCES `screenchild` (`SCREENCHILDID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_SCREENFAMILYTOSCREENCHILD` FOREIGN KEY (`SCREENFAMILYTOSCREENCHILD`) REFERENCES `screenfamily` (`SCREENFAMILYID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.screenchild: ~45 rows (approximately)
/*!40000 ALTER TABLE `screenchild` DISABLE KEYS */;
INSERT INTO `screenchild` (`SCREENCHILDID`, `SCREENCHILDTOASSOCIATION`, `SCREENFAMILYTOSCREENCHILD`, `SCREENCHILDTOSELF`, `NAME`, `VERSION`, `CREATEDBY`, `UPDATEDBY`, `CREATEDON`, `UPDATEDON`) VALUES
	(9, 20, NULL, 10, 'Attribute', '2012-12-31 17:23:42', NULL, NULL, NULL, NULL),
	(10, 18, 9, NULL, 'Relations', '2012-12-31 16:58:21', NULL, NULL, NULL, NULL),
	(11, 19, 9, NULL, 'Associations', '2012-12-31 18:11:38', NULL, NULL, NULL, NULL),
	(12, 58, NULL, 11, 'AssociationOwner', '2012-12-26 11:11:50', NULL, NULL, NULL, NULL),
	(13, 51, 9, NULL, 'ScreenFamily', '2012-12-31 18:11:50', NULL, NULL, NULL, NULL),
	(14, 52, NULL, 13, 'ScreenChild', '2012-12-31 18:55:53', NULL, NULL, NULL, NULL),
	(15, 49, 9, NULL, 'Build', '2012-12-27 10:54:07', NULL, NULL, NULL, NULL),
	(17, 56, NULL, 14, 'ScreenGrandChild', '2012-12-31 18:48:19', NULL, NULL, NULL, NULL),
	(25, 61, NULL, 13, 'ScreenProperties', '2012-12-31 18:55:40', NULL, NULL, NULL, NULL),
	(26, 64, NULL, 13, 'FamilyArtifacts', '2012-12-31 18:55:28', NULL, NULL, NULL, NULL),
	(27, 62, NULL, 26, 'ArtifactProperties', '2012-12-26 11:16:20', NULL, NULL, NULL, NULL),
	(28, 60, NULL, 14, 'ChildArtifacts', '2012-12-31 18:48:40', NULL, NULL, NULL, NULL),
	(29, 63, NULL, 14, 'ChildScreenProperties', '2012-12-31 18:48:30', NULL, NULL, NULL, NULL),
	(30, 66, 10, NULL, 'MasterPropertyValueLists', '2012-12-31 18:10:23', NULL, NULL, NULL, NULL),
	(31, 41, NULL, 28, 'ChildScreenAtrifactToProperty', '2012-12-26 11:20:34', NULL, NULL, NULL, NULL),
	(32, 67, 17, NULL, 'ListDetail', '2012-12-30 14:21:01', NULL, NULL, NULL, NULL),
	(36, 63, NULL, 17, 'GrandChildScreenProperties', '2012-12-31 18:49:06', NULL, NULL, NULL, NULL),
	(37, 60, NULL, 17, 'GrandChildArtifacts', '2012-12-31 18:49:16', NULL, NULL, NULL, NULL),
	(119, 3, NULL, 10, 'RelationToPropertyValue', '2015-12-18 11:54:16', 'system', 'system', '2015-12-18 11:54:16', '2015-12-18 11:54:16'),
	(120, 43, NULL, 31, 'ArtifactPropValueToProperty', '2015-12-18 11:54:25', 'system', 'system', '2015-12-18 11:54:25', '2015-12-18 11:54:25'),
	(121, 38, NULL, 120, 'MasterPropertyToCategory', '2015-12-18 11:54:47', 'system', 'system', '2015-12-18 11:54:47', '2015-12-18 11:54:47'),
	(122, 66, NULL, 120, 'MasterProperyToValueList', '2015-12-18 11:54:47', 'system', 'system', '2015-12-18 11:54:47', '2015-12-18 11:54:47'),
	(123, 62, NULL, 28, 'ScreenArtifactToPropertyValue', '2015-12-18 11:54:47', 'system', 'system', '2015-12-18 11:54:47', '2015-12-18 11:54:47'),
	(124, 43, NULL, 123, 'ArtifactPropValueToProperty', '2015-12-18 11:54:47', 'system', 'system', '2015-12-18 11:54:47', '2015-12-18 11:54:47'),
	(125, 38, NULL, 124, 'MasterPropertyToCategory', '2015-12-18 11:54:47', 'system', 'system', '2015-12-18 11:54:47', '2015-12-18 11:54:47'),
	(126, 66, NULL, 124, 'MasterProperyToValueList', '2015-12-18 11:54:47', 'system', 'system', '2015-12-18 11:54:47', '2015-12-18 11:54:47'),
	(127, 42, NULL, 29, 'ScreenPropValueToProperty', '2015-12-18 11:54:47', 'system', 'system', '2015-12-18 11:54:47', '2015-12-18 11:54:47'),
	(128, 38, NULL, 127, 'MasterPropertyToCategory', '2015-12-18 11:54:47', 'system', 'system', '2015-12-18 11:54:47', '2015-12-18 11:54:47'),
	(129, 66, NULL, 127, 'MasterProperyToValueList', '2015-12-18 11:54:47', 'system', 'system', '2015-12-18 11:54:47', '2015-12-18 11:54:47'),
	(130, 42, NULL, 25, 'ScreenPropValueToProperty', '2015-12-18 11:54:47', 'system', 'system', '2015-12-18 11:54:47', '2015-12-18 11:54:47'),
	(131, 38, NULL, 130, 'MasterPropertyToCategory', '2015-12-18 11:54:48', 'system', 'system', '2015-12-18 11:54:48', '2015-12-18 11:54:48'),
	(132, 66, NULL, 130, 'MasterProperyToValueList', '2015-12-18 11:54:48', 'system', 'system', '2015-12-18 11:54:48', '2015-12-18 11:54:48'),
	(133, 41, NULL, 26, 'ArtifactToPropertyValue', '2015-12-18 11:54:48', 'system', 'system', '2015-12-18 11:54:48', '2015-12-18 11:54:48'),
	(134, 43, NULL, 133, 'ArtifactPropValueToProperty', '2015-12-18 11:54:48', 'system', 'system', '2015-12-18 11:54:48', '2015-12-18 11:54:48'),
	(135, 38, NULL, 134, 'MasterPropertyToCategory', '2015-12-18 11:54:48', 'system', 'system', '2015-12-18 11:54:48', '2015-12-18 11:54:48'),
	(136, 66, NULL, 134, 'MasterProperyToValueList', '2015-12-18 11:54:48', 'system', 'system', '2015-12-18 11:54:48', '2015-12-18 11:54:48'),
	(137, 43, NULL, 27, 'ArtifactPropValueToProperty', '2015-12-18 11:54:48', 'system', 'system', '2015-12-18 11:54:48', '2015-12-18 11:54:48'),
	(138, 38, NULL, 137, 'MasterPropertyToCategory', '2015-12-18 11:54:48', 'system', 'system', '2015-12-18 11:54:48', '2015-12-18 11:54:48'),
	(139, 66, NULL, 137, 'MasterProperyToValueList', '2015-12-18 11:54:48', 'system', 'system', '2015-12-18 11:54:48', '2015-12-18 11:54:48'),
	(141, 38, 10, NULL, 'MasterPropertyToCategory', '2015-12-18 14:20:49', 'system', 'system', '2015-12-18 14:20:49', '2015-12-18 14:20:49'),
	(142, 37, 6, NULL, 'UsersGroups', '2015-12-21 22:34:39', 'system', 'system', '2015-12-21 22:34:39', '2015-12-21 22:34:39'),
	(143, 2, 4, NULL, 'jbosstochild', '2015-12-24 15:06:36', 'system', 'system', '2015-12-24 15:06:36', '2015-12-24 15:06:36'),
	(144, 70, 28, NULL, 'Address_City', '2016-01-18 10:46:54', 'system', 'system', '2016-01-18 10:46:54', '2016-01-18 10:46:54'),
	(145, 82, 30, NULL, 'test2', '2016-01-18 20:50:11', 'system', 'system', '2016-01-18 20:50:11', '2016-01-18 20:50:11'),
	(146, 82, 31, NULL, 'test2', '2016-01-19 11:48:22', 'system', 'system', '2016-01-19 11:48:22', '2016-01-19 11:48:22');
/*!40000 ALTER TABLE `screenchild` ENABLE KEYS */;


-- Dumping structure for table codebreed.screenfamily
CREATE TABLE IF NOT EXISTS `screenfamily` (
  `SCREENFAMILYID` bigint(20) NOT NULL,
  `SCREENFAMILYTORELATION` bigint(20) DEFAULT NULL,
  `MODELTOSCREENFAMILY` bigint(20) DEFAULT NULL,
  `NAME` varchar(40) NOT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`SCREENFAMILYID`),
  KEY `fk_MODELTOSCREENFAMILY` (`MODELTOSCREENFAMILY`),
  CONSTRAINT `fk_MODELTOSCREENFAMILY` FOREIGN KEY (`MODELTOSCREENFAMILY`) REFERENCES `model` (`MODELID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.screenfamily: ~21 rows (approximately)
/*!40000 ALTER TABLE `screenfamily` DISABLE KEYS */;
INSERT INTO `screenfamily` (`SCREENFAMILYID`, `SCREENFAMILYTORELATION`, `MODELTOSCREENFAMILY`, `NAME`, `VERSION`, `CREATEDBY`, `UPDATEDBY`, `CREATEDON`, `UPDATEDON`) VALUES
	(4, 13, 14, 'jfam', '2012-12-24 14:51:36', NULL, NULL, NULL, NULL),
	(6, 67, 39, 'Users', '2013-01-07 15:51:27', NULL, NULL, NULL, NULL),
	(7, 66, 39, 'Groups', '2013-01-07 15:51:47', NULL, NULL, NULL, NULL),
	(8, NULL, 16, 'testing', '2013-01-16 13:25:32', 'paulm', NULL, '2013-01-16 13:25:31', NULL),
	(9, 36, 26, 'ModelInterface', '2012-12-31 18:52:57', NULL, NULL, NULL, NULL),
	(10, 69, 26, 'MasterProperty', '2012-12-31 18:53:16', NULL, NULL, NULL, NULL),
	(12, 70, 26, 'MasterCategory', '2012-12-31 18:54:09', NULL, NULL, NULL, NULL),
	(13, 76, 26, 'PropertyType', '2012-12-31 18:54:23', NULL, NULL, NULL, NULL),
	(14, 71, 26, 'PropertyGroup', '2012-12-31 18:54:36', NULL, NULL, NULL, NULL),
	(17, 103, 26, 'Lists', '2012-12-30 14:20:36', NULL, NULL, NULL, NULL),
	(20, 13, 14, 'jbam', '2013-01-29 17:13:06', 'paulm', NULL, '2013-01-29 17:13:06', NULL),
	(23, 125, 50, 'Main', '2016-01-01 13:44:36', NULL, NULL, '2016-01-01 13:44:36', '2016-01-01 13:44:36'),
	(24, 126, 50, 'Secondary', '2016-01-01 18:30:22', NULL, NULL, '2016-01-01 18:30:22', '2016-01-01 18:30:22'),
	(25, 127, 50, 'Thirdly', '2016-01-01 18:32:02', NULL, NULL, '2016-01-01 18:32:02', '2016-01-01 18:32:02'),
	(26, 22, 18, 'TrapsForm', '2016-01-05 11:33:09', NULL, NULL, '2016-01-05 11:33:09', '2016-01-05 11:33:09'),
	(27, 142, 53, 'Actor', '2016-01-18 10:43:46', NULL, NULL, '2016-01-18 00:05:08', '2016-01-18 10:43:46'),
	(28, 143, 53, 'Address', '2016-01-18 10:46:51', NULL, NULL, '2016-01-18 10:46:51', '2016-01-18 10:46:51'),
	(29, 144, 53, 'Category', '2016-01-18 13:47:55', NULL, NULL, '2016-01-18 13:47:55', '2016-01-18 13:47:55'),
	(30, 99, 42, 'fred', '2016-01-18 20:50:10', NULL, NULL, '2016-01-18 20:50:10', '2016-01-18 20:50:10'),
	(31, 100, 42, 'ian', '2016-01-19 11:48:28', NULL, NULL, '2016-01-19 11:48:20', '2016-01-19 11:48:28'),
	(32, 160, 42, 'malcom', '2016-01-20 16:04:26', NULL, NULL, '2016-01-20 16:04:26', '2016-01-20 16:04:26');
/*!40000 ALTER TABLE `screenfamily` ENABLE KEYS */;


-- Dumping structure for table codebreed.screenpropertyvalue
CREATE TABLE IF NOT EXISTS `screenpropertyvalue` (
  `SCREENPROPERTYVALUEID` bigint(20) NOT NULL,
  `SCREENPROPVALUETOPROPERTY` bigint(20) DEFAULT NULL,
  `FAMILYTOSCREENPROPVALUE` bigint(20) DEFAULT NULL,
  `CHILDTOSCREENPROPVALUE` bigint(20) DEFAULT NULL,
  `PROPERTYVALUE` varchar(2000) NOT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`SCREENPROPERTYVALUEID`),
  KEY `fk_FAMILYTOSCREENPROPVALUE` (`FAMILYTOSCREENPROPVALUE`),
  KEY `fk_CHILDTOSCREENPROPVALUE` (`CHILDTOSCREENPROPVALUE`),
  CONSTRAINT `fk_CHILDTOSCREENPROPVALUE` FOREIGN KEY (`CHILDTOSCREENPROPVALUE`) REFERENCES `screenchild` (`SCREENCHILDID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_FAMILYTOSCREENPROPVALUE` FOREIGN KEY (`FAMILYTOSCREENPROPVALUE`) REFERENCES `screenfamily` (`SCREENFAMILYID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.screenpropertyvalue: ~19 rows (approximately)
/*!40000 ALTER TABLE `screenpropertyvalue` DISABLE KEYS */;
INSERT INTO `screenpropertyvalue` (`SCREENPROPERTYVALUEID`, `SCREENPROPVALUETOPROPERTY`, `FAMILYTOSCREENPROPVALUE`, `CHILDTOSCREENPROPVALUE`, `PROPERTYVALUE`, `VERSION`, `CREATEDBY`, `UPDATEDBY`, `CREATEDON`, `UPDATEDON`) VALUES
	(1, 5, 9, NULL, '2', '2015-12-24 13:21:33', NULL, NULL, NULL, '2015-12-24 13:21:33'),
	(2, 5, NULL, 10, '2', '2012-12-31 16:58:21', NULL, NULL, NULL, NULL),
	(3, 5, NULL, 9, '1', '2012-12-31 17:20:05', NULL, NULL, NULL, NULL),
	(4, 5, NULL, 14, '2', '2012-12-31 17:26:34', NULL, NULL, NULL, NULL),
	(5, 2, 9, NULL, 'Screen Family', '2015-12-24 13:21:33', NULL, NULL, NULL, '2015-12-24 13:21:33'),
	(6, 2, 10, NULL, 'Master Property', '2015-12-08 15:15:39', NULL, NULL, NULL, '2015-12-08 15:15:39'),
	(7, 2, 12, NULL, 'Master Category', '2015-12-08 15:15:48', NULL, NULL, NULL, '2015-12-08 15:15:48'),
	(8, 2, 13, NULL, 'Property Type', '2015-12-08 15:15:51', NULL, NULL, NULL, '2015-12-08 15:15:51'),
	(9, 2, 14, NULL, 'Property Group', '2015-12-08 15:15:55', NULL, NULL, NULL, '2015-12-08 15:15:55'),
	(10, 2, NULL, 26, 'Family Artifacts', '2012-12-31 18:55:28', NULL, NULL, NULL, NULL),
	(11, 2, NULL, 25, 'Screen Properties', '2012-12-31 18:55:40', NULL, NULL, NULL, NULL),
	(12, 2, NULL, 14, 'Screen Child', '2012-12-31 18:55:53', NULL, NULL, NULL, NULL),
	(17, 5, 10, NULL, '1', '2015-12-08 15:15:39', 'testing', 'testing', '2015-12-08 15:15:39', '2015-12-08 15:15:39'),
	(18, 5, 12, NULL, '1', '2015-12-08 15:15:48', 'testing', 'testing', '2015-12-08 15:15:48', '2015-12-08 15:15:48'),
	(19, 5, 13, NULL, '1', '2015-12-08 15:15:51', 'testing', 'testing', '2015-12-08 15:15:51', '2015-12-08 15:15:51'),
	(20, 5, 14, NULL, '1', '2015-12-08 15:15:55', 'testing', 'testing', '2015-12-08 15:15:55', '2015-12-08 15:15:55'),
	(21, 5, 17, NULL, '1', '2015-12-08 20:29:16', 'testing', 'testing', '2015-12-08 20:29:16', '2015-12-08 20:29:16'),
	(26, 2, 27, NULL, 'Actor', '2016-01-20 10:49:30', 'testing', 'testing', '2016-01-20 10:49:16', '2016-01-20 10:49:30'),
	(27, 5, 27, NULL, '1', '2016-01-20 10:49:30', 'testing', 'testing', '2016-01-20 10:49:30', '2016-01-20 10:49:30');
/*!40000 ALTER TABLE `screenpropertyvalue` ENABLE KEYS */;


-- Dumping structure for table codebreed.user
CREATE TABLE IF NOT EXISTS `user` (
  `USERID` bigint(20) NOT NULL,
  `USERNAME` varchar(30) NOT NULL,
  `APPID` int(11) DEFAULT NULL,
  `PASSWORD` varchar(64) NOT NULL,
  `EMAIL` varchar(254) DEFAULT NULL,
  `VERSION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDBY` varchar(30) DEFAULT NULL,
  `UPDATEDBY` varchar(30) DEFAULT NULL,
  `CREATEDON` timestamp NULL DEFAULT NULL,
  `UPDATEDON` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`USERID`),
  UNIQUE KEY `ux_user_username_primary` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.user: ~18 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`USERID`, `USERNAME`, `APPID`, `PASSWORD`, `EMAIL`, `VERSION`, `CREATEDBY`, `UPDATEDBY`, `CREATEDON`, `UPDATEDON`) VALUES
	(1, 'paulm', 0, 'reddingo', 'cogranpm@gmail.com', '2013-01-07 16:05:13', NULL, NULL, NULL, NULL),
	(2, 'guest', 0, 'guest', 'email@email.com', '2013-01-08 11:53:12', NULL, NULL, NULL, NULL),
	(3, 'fred', 0, 'reddingo', '', '2013-01-09 12:06:34', NULL, NULL, NULL, NULL),
	(4, 'roger', 0, 'gormless', '', '2013-01-09 12:44:02', NULL, NULL, NULL, NULL),
	(5, 'ian', 0, 'fandango', 'ian@gmail.com', '2013-01-09 13:27:11', NULL, NULL, NULL, NULL),
	(6, 'malcolm', 0, 'ian', '', '2013-01-09 13:28:36', NULL, NULL, NULL, NULL),
	(7, 'reggie', 0, 'abab', '', '2013-01-09 13:29:54', NULL, NULL, NULL, NULL),
	(9, 'trevor', 0, 'weener', '', '2013-01-09 13:39:08', NULL, NULL, NULL, NULL),
	(10, 'brianni', 0, 'copouts', '', '2013-01-10 14:09:17', NULL, 'paulm', NULL, '2013-01-10 14:09:17'),
	(11, 'misty', 0, 'misty', '', '2013-01-09 13:52:52', NULL, NULL, NULL, NULL),
	(12, 'pennysss1234567891123456789212', 0, 'crapshoot', '', '2013-01-09 16:55:15', NULL, NULL, NULL, NULL),
	(13, 'jeeves', 0, 'crybaby', '', '2013-01-09 14:02:36', NULL, NULL, NULL, NULL),
	(14, 'leiber', 0, 'strong', '', '2013-01-09 15:51:55', NULL, NULL, NULL, NULL),
	(16, 'red', 0, 'red', '', '2013-01-09 16:32:02', NULL, NULL, NULL, NULL),
	(17, 'ted', 0, 'ted', '', '2013-01-09 17:14:50', NULL, NULL, NULL, NULL),
	(18, 'pony', 0, 'xone', '', '2013-01-10 12:31:12', 'paulm', NULL, '2013-01-10 12:31:12', NULL),
	(19, 'tony', 0, 'tony', '', '2013-01-10 14:09:56', 'paulm', NULL, '2013-01-10 14:09:56', NULL),
	(21, 'reginald', 0, 'tryhard', 'mack@email.com', '2013-01-12 12:36:02', 'paulm', NULL, '2013-01-12 12:36:02', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Dumping structure for table codebreed.usersgroups
CREATE TABLE IF NOT EXISTS `usersgroups` (
  `USERID` bigint(20) DEFAULT NULL,
  `GROUPID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codebreed.usersgroups: ~9 rows (approximately)
/*!40000 ALTER TABLE `usersgroups` DISABLE KEYS */;
INSERT INTO `usersgroups` (`USERID`, `GROUPID`) VALUES
	(1, 1),
	(2, 2),
	(3, 2),
	(4, 2),
	(11, 2),
	(12, 2),
	(13, 2),
	(14, 2),
	(21, 2);
/*!40000 ALTER TABLE `usersgroups` ENABLE KEYS */;


-- Dumping structure for view codebreed.vscreenfamilypropertyvalue
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vscreenfamilypropertyvalue` (
	`masterpropertyid` BIGINT(20) NOT NULL,
	`name` VARCHAR(40) NOT NULL COLLATE 'latin1_swedish_ci',
	`defaultvalue` VARCHAR(40) NULL COLLATE 'latin1_swedish_ci',
	`notes` VARCHAR(999) NULL COLLATE 'latin1_swedish_ci',
	`categoryname` VARCHAR(40) NOT NULL COLLATE 'latin1_swedish_ci',
	`propertyTypeName` VARCHAR(40) NOT NULL COLLATE 'latin1_swedish_ci',
	`displaycontrol` INT(11) NOT NULL,
	`propertyTypeNotes` VARCHAR(256) NULL COLLATE 'latin1_swedish_ci',
	`groupName` VARCHAR(40) NOT NULL COLLATE 'latin1_swedish_ci',
	`screenpropertyvalueid` BIGINT(20) NULL,
	`familytoscreenpropvalue` BIGINT(20) NULL,
	`childtoscreenpropvalue` BIGINT(20) NULL,
	`propertyvalue` TEXT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view codebreed.vusergroups
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vusergroups` (
	`USERNAME` VARCHAR(30) NOT NULL COLLATE 'latin1_swedish_ci',
	`GROUPNAME` VARCHAR(30) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for trigger codebreed.trgMasterPropertyDelete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trgMasterPropertyDelete` AFTER DELETE ON `masterproperty` FOR EACH ROW BEGIN

   DELETE FROM masterpropertytocategory where masterpropertytocategory.MASTERPROPERTYID = old.masterpropertyid;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for view codebreed.vscreenfamilypropertyvalue
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vscreenfamilypropertyvalue`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vscreenfamilypropertyvalue` AS select `m`.`MASTERPROPERTYID` AS `masterpropertyid`,`m`.`NAME` AS `name`,`m`.`DEFAULTVALUE` AS `defaultvalue`,`m`.`NOTES` AS `notes`,`ac`.`NAME` AS `categoryname`,`pt`.`NAME` AS `propertyTypeName`,`pt`.`DISPLAYCONTROL` AS `displaycontrol`,`pt`.`NOTES` AS `propertyTypeNotes`,`g`.`NAME` AS `groupName`,`pv`.`SCREENPROPERTYVALUEID` AS `screenpropertyvalueid`,`pv`.`FAMILYTOSCREENPROPVALUE` AS `familytoscreenpropvalue`,`pv`.`CHILDTOSCREENPROPVALUE` AS `childtoscreenpropvalue`,ifnull(`pv`.`PROPERTYVALUE`,`m`.`DEFAULTVALUE`) AS `propertyvalue` from (((((`masterproperty` `m` join `masterpropertytocategory` `c` on((`m`.`MASTERPROPERTYID` = `c`.`MASTERPROPERTYID`))) join `mastercategory` `ac` on((`c`.`MASTERCATEGORYID` = `ac`.`MASTERCATEGORYID`))) join `propertytype` `pt` on((`pt`.`PROPERTYTYPEID` = `m`.`MASTERPROPERTYTOTYPE`))) join `propertygroup` `g` on((`g`.`PROPERTYGROUPID` = `m`.`MASTERPROPERTYTOGROUP`))) left join `screenpropertyvalue` `pv` on((`pv`.`SCREENPROPVALUETOPROPERTY` = `m`.`MASTERPROPERTYID`))) where (`ac`.`NAME` = 'Screen') ;


-- Dumping structure for view codebreed.vusergroups
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vusergroups`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vusergroups` AS select `u`.`USERNAME` AS `USERNAME`,`g`.`NAME` AS `GROUPNAME` from ((`usersgroups` `ug` join `user` `u` on((`u`.`USERID` = `ug`.`USERID`))) join `group` `g` on((`g`.`GROUPID` = `ug`.`GROUPID`))) ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
