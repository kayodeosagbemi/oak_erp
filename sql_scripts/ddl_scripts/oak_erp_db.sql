CREATE DATABASE  IF NOT EXISTS `oak_erp_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `oak_erp_db`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: oak_erp_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.40-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `name` varchar(200) NOT NULL,
  `code` char(10) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('Andorra','AD'),('United Arab Emirates','AE'),('Afghanistan','AF'),('Antigua and Barbuda','AG'),('Anguilla','AI'),('Albania','AL'),('Armenia','AM'),('Angola','AO'),('Antarctica','AQ'),('Argentina','AR'),('American Samoa','AS'),('Austria','AT'),('Australia','AU'),('Aruba','AW'),('Åland Islands','AX'),('Azerbaijan','AZ'),('Bosnia and Herzegovina','BA'),('Barbados','BB'),('Bangladesh','BD'),('Belgium','BE'),('Burkina Faso','BF'),('Bulgaria','BG'),('Bahrain','BH'),('Burundi','BI'),('Benin','BJ'),('Saint Barthélemy','BL'),('Bermuda','BM'),('Brunei Darussalam','BN'),('Bolivia, Plurinational State of','BO'),('Bonaire, Sint Eustatius and Saba','BQ'),('Brazil','BR'),('Bahamas','BS'),('Bhutan','BT'),('Bouvet Island','BV'),('Botswana','BW'),('Belarus','BY'),('Belize','BZ'),('Canada','CA'),('Cocos (Keeling) Islands','CC'),('Congo, the Democratic Republic of the','CD'),('Central African Republic','CF'),('Congo','CG'),('Switzerland','CH'),('Côte d\'Ivoire','CI'),('Cook Islands','CK'),('Chile','CL'),('Cameroon','CM'),('China','CN'),('Colombia','CO'),('Name','Code'),('Costa Rica','CR'),('Cuba','CU'),('Cape Verde','CV'),('Curaçao','CW'),('Christmas Island','CX'),('Cyprus','CY'),('Czech Republic','CZ'),('Germany','DE'),('Djibouti','DJ'),('Denmark','DK'),('Dominica','DM'),('Dominican Republic','DO'),('Algeria','DZ'),('Ecuador','EC'),('Estonia','EE'),('Egypt','EG'),('Western Sahara','EH'),('Eritrea','ER'),('Spain','ES'),('Ethiopia','ET'),('Finland','FI'),('Fiji','FJ'),('Falkland Islands (Malvinas)','FK'),('Micronesia, Federated States of','FM'),('Faroe Islands','FO'),('France','FR'),('Gabon','GA'),('United Kingdom','GB'),('Grenada','GD'),('Georgia','GE'),('French Guiana','GF'),('Guernsey','GG'),('Ghana','GH'),('Gibraltar','GI'),('Greenland','GL'),('Gambia','GM'),('Guinea','GN'),('Guadeloupe','GP'),('Equatorial Guinea','GQ'),('Greece','GR'),('South Georgia and the South Sandwich Islands','GS'),('Guatemala','GT'),('Guam','GU'),('Guinea-Bissau','GW'),('Guyana','GY'),('Hong Kong','HK'),('Heard Island and McDonald Islands','HM'),('Honduras','HN'),('Croatia','HR'),('Haiti','HT'),('Hungary','HU'),('Indonesia','ID'),('Ireland','IE'),('Israel','IL'),('Isle of Man','IM'),('India','IN'),('British Indian Ocean Territory','IO'),('Iraq','IQ'),('Iran, Islamic Republic of','IR'),('Iceland','IS'),('Italy','IT'),('Jersey','JE'),('Jamaica','JM'),('Jordan','JO'),('Japan','JP'),('Kenya','KE'),('Kyrgyzstan','KG'),('Cambodia','KH'),('Kiribati','KI'),('Comoros','KM'),('Saint Kitts and Nevis','KN'),('Korea, Democratic People\'s Republic of','KP'),('Korea, Republic of','KR'),('Kuwait','KW'),('Cayman Islands','KY'),('Kazakhstan','KZ'),('Lao People\'s Democratic Republic','LA'),('Lebanon','LB'),('Saint Lucia','LC'),('Liechtenstein','LI'),('Sri Lanka','LK'),('Liberia','LR'),('Lesotho','LS'),('Lithuania','LT'),('Luxembourg','LU'),('Latvia','LV'),('Libya','LY'),('Morocco','MA'),('Monaco','MC'),('Moldova, Republic of','MD'),('Montenegro','ME'),('Saint Martin (French part)','MF'),('Madagascar','MG'),('Marshall Islands','MH'),('Macedonia, the Former Yugoslav Republic of','MK'),('Mali','ML'),('Myanmar','MM'),('Mongolia','MN'),('Macao','MO'),('Northern Mariana Islands','MP'),('Martinique','MQ'),('Mauritania','MR'),('Montserrat','MS'),('Malta','MT'),('Mauritius','MU'),('Maldives','MV'),('Malawi','MW'),('Mexico','MX'),('Malaysia','MY'),('Mozambique','MZ'),('Namibia','NA'),('New Caledonia','NC'),('Niger','NE'),('Norfolk Island','NF'),('Nigeria','NG'),('Nicaragua','NI'),('Netherlands','NL'),('Norway','NO'),('Nepal','NP'),('Nauru','NR'),('Niue','NU'),('New Zealand','NZ'),('Oman','OM'),('Panama','PA'),('Peru','PE'),('French Polynesia','PF'),('Papua New Guinea','PG'),('Philippines','PH'),('Pakistan','PK'),('Poland','PL'),('Saint Pierre and Miquelon','PM'),('Pitcairn','PN'),('Puerto Rico','PR'),('Palestine, State of','PS'),('Portugal','PT'),('Palau','PW'),('Paraguay','PY'),('Qatar','QA'),('Réunion','RE'),('Romania','RO'),('Serbia','RS'),('Russian Federation','RU'),('Rwanda','RW'),('Saudi Arabia','SA'),('Solomon Islands','SB'),('Seychelles','SC'),('Sudan','SD'),('Sweden','SE'),('Singapore','SG'),('Saint Helena, Ascension and Tristan da Cunha','SH'),('Slovenia','SI'),('Svalbard and Jan Mayen','SJ'),('Slovakia','SK'),('Sierra Leone','SL'),('San Marino','SM'),('Senegal','SN'),('Somalia','SO'),('Suriname','SR'),('South Sudan','SS'),('Sao Tome and Principe','ST'),('El Salvador','SV'),('Sint Maarten (Dutch part)','SX'),('Syrian Arab Republic','SY'),('Swaziland','SZ'),('Turks and Caicos Islands','TC'),('Chad','TD'),('French Southern Territories','TF'),('Togo','TG'),('Thailand','TH'),('Tajikistan','TJ'),('Tokelau','TK'),('Timor-Leste','TL'),('Turkmenistan','TM'),('Tunisia','TN'),('Tonga','TO'),('Turkey','TR'),('Trinidad and Tobago','TT'),('Tuvalu','TV'),('Taiwan, Province of China','TW'),('Tanzania, United Republic of','TZ'),('Ukraine','UA'),('Uganda','UG'),('United States Minor Outlying Islands','UM'),('United States','US'),('Uruguay','UY'),('Uzbekistan','UZ'),('Holy See (Vatican City State)','VA'),('Saint Vincent and the Grenadines','VC'),('Venezuela, Bolivarian Republic of','VE'),('Virgin Islands, British','VG'),('Virgin Islands, U.S.','VI'),('Viet Nam','VN'),('Vanuatu','VU'),('Wallis and Futuna','WF'),('Samoa','WS'),('Yemen','YE'),('Mayotte','YT'),('South Africa','ZA'),('Zambia','ZM'),('Zimbabwe','ZW');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investment`
--

DROP TABLE IF EXISTS `investment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `investmentPlanId` int(11) NOT NULL,
  `investorId` bigint(20) NOT NULL,
  `creationTimeStamp` timestamp NULL DEFAULT NULL,
  `principalAmountInKobo` int(11) NOT NULL,
  `startDate` date DEFAULT NULL,
  `rate` decimal(65,4) DEFAULT NULL,
  `tenor` int(11) DEFAULT NULL,
  `tenorUnit` char(1) DEFAULT NULL COMMENT 'Either in days, months, weeks, years. i.e D, M, W, Y\n',
  `status` varchar(45) NOT NULL DEFAULT 'ACTIVE',
  `maturityDate` date DEFAULT NULL,
  `actualMaturityDate` date DEFAULT NULL,
  `investmentAgreementSent` char(1) DEFAULT 'N',
  `investmentAgreementSentDate` date DEFAULT NULL,
  `relatedInvestmentId` bigint(20) DEFAULT NULL COMMENT 'The related investment that gave rise to this one. A scenario is when an investment was rolled over at maturity. The original investments status is changed to expired and another investment is created with the ID of the original (now expired) one set as the relatedInvestmentId of the new investment.',
  PRIMARY KEY (`id`),
  KEY `Id_idx` (`investorId`),
  KEY `Id_idx1` (`investmentPlanId`),
  CONSTRAINT `investment_ibfk_1` FOREIGN KEY (`investorId`) REFERENCES `investor` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `investment_ibfk_2` FOREIGN KEY (`investmentPlanId`) REFERENCES `investmentplan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investment`
--

LOCK TABLES `investment` WRITE;
/*!40000 ALTER TABLE `investment` DISABLE KEYS */;
/*!40000 ALTER TABLE `investment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investmentplan`
--

DROP TABLE IF EXISTS `investmentplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investmentplan` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `defaultRate` decimal(65,4) NOT NULL,
  `defaultTenor` int(11) NOT NULL,
  `defaultTenorUnit` char(1) NOT NULL,
  `rateAppliesPerTenor` int(11) NOT NULL DEFAULT '2' COMMENT 'The profit rate applies every 2 (rateappliestenorunit), 4 etc. THat is profit is every 2 months etc\n',
  `rateAppliesPerTenorUnit` char(1) NOT NULL DEFAULT 'M' COMMENT 'The profit rate applies every D(Day), M(month), W(Week), Y(Year)',
  `minimumInvestmentAmountInKobo` int(11) NOT NULL DEFAULT '10000000' COMMENT 'The minimum investment amount for this plan. This is expressed in kobo',
  `canTenorBeNegotiatedWithCustomer` char(1) NOT NULL DEFAULT 'N' COMMENT 'Whether or not the tenor in the actual investment can be less than the investment default tenor.',
  `payOutRule` varchar(45) DEFAULT NULL COMMENT 'Pay at maturity or pay each schedule entry. If pay at maturity, then each schedule entry will have status "DEFERRED_TILL_MATURITY" but if pay per schedule, then each schedule entry will read "DUE"',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Investment plans available in peaceful peace investment company\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investmentplan`
--

LOCK TABLES `investmentplan` WRITE;
/*!40000 ALTER TABLE `investmentplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `investmentplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investor`
--

DROP TABLE IF EXISTS `investor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investor` (
  `username` varchar(16) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(45) DEFAULT NULL COMMENT 'Mr, Mrs, Miss, Chief etc',
  `surname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `dateOfBirth` date NOT NULL,
  `gender` char(1) NOT NULL DEFAULT 'M',
  `mobilephoneno` varchar(20) NOT NULL,
  `residentialAddress` varchar(300) NOT NULL,
  `countryOfResidence` varchar(300) NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `investorReferralCode` varchar(45) DEFAULT NULL,
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `etlId` varchar(255) DEFAULT NULL,
  `etlCreateTime` timestamp NULL DEFAULT NULL COMMENT 'For those investors loaded from the ETL process we will insert the ID they had from the previous ERP database here',
  `creationApprovedByUserId` int(11) DEFAULT NULL,
  `creationApprovalDate` timestamp NULL DEFAULT NULL,
  `recordStatus` int(11) DEFAULT NULL,
  `referrerId` int(11) DEFAULT NULL COMMENT 'References the Referrer table. The person that referred the investor',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `etlId_UNIQUE` (`etlId`),
  KEY `createdByUserId_idx` (`referrerId`),
  CONSTRAINT `createdByUserId` FOREIGN KEY (`referrerId`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `creationApprovedByUserId` FOREIGN KEY (`referrerId`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investor`
--

LOCK TABLES `investor` WRITE;
/*!40000 ALTER TABLE `investor` DISABLE KEYS */;
INSERT INTO `investor` VALUES ('kaybaba','tok2kayode@gmail.com','123456','2020-08-07 00:41:06','Mr','Osagbemi','','Kayode','1986-09-11','M','08080530396','14, ABOLADE STREET OFF MOGAJI IJESHA-TEDO SURULERE','NG',1,'OSA0396014106',1,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `investor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investorbankinfo`
--

DROP TABLE IF EXISTS `investorbankinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investorbankinfo` (
  `bankInfoId` bigint(20) NOT NULL AUTO_INCREMENT,
  `bankName` varchar(255) NOT NULL,
  `bankAccountNumber` varchar(20) NOT NULL,
  `investorId` bigint(20) NOT NULL,
  `status` varchar(45) DEFAULT 'ACTIVE',
  PRIMARY KEY (`bankInfoId`),
  KEY `Id_idx` (`investorId`),
  CONSTRAINT `Id` FOREIGN KEY (`investorId`) REFERENCES `investor` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investorbankinfo`
--

LOCK TABLES `investorbankinfo` WRITE;
/*!40000 ALTER TABLE `investorbankinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `investorbankinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymententry`
--

DROP TABLE IF EXISTS `paymententry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymententry` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `narration` varchar(2000) NOT NULL COMMENT 'A free-text description of the payment',
  `trackingRef` varchar(2000) DEFAULT NULL COMMENT 'A reference ID to track the particular transaction. This reference may come from the channel that the transaction was processed through. For instance if it was a bank transfer, the teller number can be put in this field. If it''s from a payment gateway, the transaction reference fromthe gateway can go in here.',
  `channel` varchar(45) DEFAULT NULL COMMENT 'The means of this payment. Bank transfer, cash deposit, payment gateway etc',
  `fromAccount` varchar(45) NOT NULL COMMENT 'The entity that was debited or doing the payment',
  `fromEntityType` varchar(45) NOT NULL COMMENT 'The kind of entity the fromAccount field reference. e.g. Investor|Referrer|Internal_Account',
  `toAccount` varchar(45) NOT NULL COMMENT 'The entity that was credited or received the payment',
  `toEntityType` varchar(45) NOT NULL COMMENT 'The kind of entity the toAccount field references. Investor|Referrer|Internal_Account\netc\n',
  `bookingDate` datetime DEFAULT NULL COMMENT 'The system date and time that this payment entry was made.',
  `valueDate` datetime DEFAULT NULL COMMENT 'The date the entry should be recorded in an accounting sense.',
  `amountInKobo` int(11) NOT NULL COMMENT 'The amount in Kobo\n',
  `status` varchar(45) NOT NULL DEFAULT 'PENDING' COMMENT 'Pending|Reversed|Active',
  `paymentType` varchar(45) NOT NULL COMMENT 'What this payment was for. Investment|Referrer_Payment|schedule_payment|salary etc',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymententry`
--

LOCK TABLES `paymententry` WRITE;
/*!40000 ALTER TABLE `paymententry` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymententry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentschedule`
--

DROP TABLE IF EXISTS `paymentschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentschedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amountInKobo` int(11) NOT NULL,
  `scheduledDate` date NOT NULL,
  `type` varchar(45) DEFAULT NULL COMMENT 'Whether a PAYIN (that is, the investor paid a principal) or a PAYOUT(an interest payment)',
  `investmentId` bigint(20) NOT NULL,
  `status` varchar(45) NOT NULL COMMENT 'Paid|Missed|Canceled\n',
  PRIMARY KEY (`id`),
  KEY `investmentId_idx` (`investmentId`),
  CONSTRAINT `investmentId` FOREIGN KEY (`investmentId`) REFERENCES `investment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentschedule`
--

LOCK TABLES `paymentschedule` WRITE;
/*!40000 ALTER TABLE `paymentschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymentschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilege` (
  `name` varchar(20) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` VALUES ('CREATE_USER_ACCESS',3),('FULL_ACCESS',1),('VIEW_ONLY_ACCESS',2);
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `privilegeId` int(11) DEFAULT NULL,
  `privilegeValue` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `privilegeId_idx` (`privilegeId`),
  CONSTRAINT `privilegeId` FOREIGN KEY (`privilegeId`) REFERENCES `privilege` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'CUSTOMER_CARE',2,'ACTIVE'),(2,'ADMIN',1,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `surname` varchar(100) NOT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) NOT NULL,
  `mobileno` varchar(50) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `referralCode` varchar(45) NOT NULL COMMENT 'A referral code for each staff who can refer a customer and is eligible to a reward as a result.',
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`Id`,`username`),
  UNIQUE KEY `referralCode_UNIQUE` (`referralCode`),
  KEY `roleId_idx` (`roleId`),
  CONSTRAINT `roleId` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (5,'admin','tok2kayode@gmail.com','123456','2020-07-26 19:10:10','Osagbemi',NULL,'Kayode','08080530396','Mr','ADMIN1',2),(6,'abimbola','abimbolamaryj@gmail.com','123456','2020-07-26 19:10:10','Abimbola','Jane','Mary','07034384221','Mrs','ABIMBOLA2',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'oak_erp_db'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_generate_ref_code` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generate_ref_code`(surname VARCHAR(100), mobile varchar(50)) RETURNS varchar(45) CHARSET utf8
BEGIN
	DECLARE vRefCode VARCHAR(45);
    SET vRefCode = UPPER(CONCAT(SUBSTR(surname, 1, 3), SUBSTR(mobile, -4, 4), SUBSTR(REPLACE(NOW(), ':', ''), 12)));
    RETURN (vRefCode);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_investor_new` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_investor_new`(IN username varchar(20), IN email VARCHAR(255), IN pwd VARCHAR(32),
IN title VARCHAR(45),  IN surname VARCHAR(50), IN middlename VARCHAR(50), IN firstname VARCHAR(50),
IN dob DATE, IN gender CHAR(1), IN mobilephoneno VARCHAR(20), IN residenceAddr VARCHAR(300), 
IN countryOfResidence VARCHAR(300), IN createdByUserId INT, IN investorReferralCode VARCHAR(45),
IN etlID VARCHAR(255),
IN etlCreationTime TIMESTAMP, 
IN creationApprovedByUserId INT, 
IN creationApprovalDate TIMESTAMP, 
IN recordStatus INT, 
IN referrerId INT,
INOUT ID BIGINT)
BEGIN

IF ID <= 0 THEN -- This means that if the ID is less than or equal to Zero, then insert a record

	INSERT INTO `oak_erp_db`.`investor` 
    (`username`, `email`, `password`, `title`, `surname`, `middlename`, `firstname`, `dateOfBirth`,
	`gender`, `mobilephoneno`, `residentialAddress`, `countryOfResidence`, 
    `createdByUserId`, `investorReferralCode` ,
    `etlId`,
    `etlCreateTime`,
    `creationApprovedByUserId`,
    `creationApprovalDate`,
    `recordStatus`,
    `referrerId`) 
    VALUES (username, email, pwd, title, surname, middlename, firstname, dob, 
	gender, mobilephoneno, residenceAddr, countryOfResidence,
	createdByUserId, investorReferralCode, 
    etlID,
    etlCreationTime, 
    creationApprovedByUserId,
    creationApprovalDate,
    recordStatus,
    referrerId);
    
    SELECT LAST_INSERT_ID() INTO ID;
END IF;
IF ID > 0 THEN -- Then we do an update where the ID matches this INOUT argument.
	UPDATE `oak_erp_db`.`investor` 
    SET `username`=username ,
`email` = email,
`password` = pwd,
`title` =title,
`surname` = surname,
`middlename` =middlename,
`firstname` = firstname,
`dateOfBirth` = dob,
`gender` = gender,
`mobilephoneno` =mobilephoneno,
`residentialAddress` = residenceAddr,
`countryOfResidence` = countryOfResidence,
`createdByUserId` = createdByUserId,
`investorReferralCode` = investorReferralCode,
`etlId` = etlID,
`etlCreateTime` = etlCreationTime,
`creationApprovedByUserId` = creationApprovedByUserId,
`creationApprovalDate` =creationApprovalDate,
`recordStatus` = recordStatus,
`referrerId` = referrerId,
`Id`= ID 
    WHERE Id=ID;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-07  3:08:41
