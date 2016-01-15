-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mktayal_ufesm
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

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
-- Table structure for table `aggregatecolumn`
--

DROP TABLE IF EXISTS `aggregatecolumn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregatecolumn` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `position` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregatecolumn`
--

LOCK TABLES `aggregatecolumn` WRITE;
/*!40000 ALTER TABLE `aggregatecolumn` DISABLE KEYS */;
INSERT INTO `aggregatecolumn` VALUES (1,1),(2,1),(3,1),(4,1),(5,2),(6,1),(7,2),(8,1),(9,2),(10,1),(11,2);
/*!40000 ALTER TABLE `aggregatecolumn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregatecolumn_map_aggregateitem`
--

DROP TABLE IF EXISTS `aggregatecolumn_map_aggregateitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregatecolumn_map_aggregateitem` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `aggregateitemid` tinyint(3) unsigned NOT NULL,
  `aggregatecolumnid` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aggregateitemid` (`aggregateitemid`),
  KEY `aggregatecolumnid` (`aggregatecolumnid`),
  CONSTRAINT `aggregatecolumn_map_aggregateitem_ibfk_1` FOREIGN KEY (`aggregateitemid`) REFERENCES `aggregateitem` (`id`),
  CONSTRAINT `aggregatecolumn_map_aggregateitem_ibfk_2` FOREIGN KEY (`aggregatecolumnid`) REFERENCES `aggregatecolumn` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregatecolumn_map_aggregateitem`
--

LOCK TABLES `aggregatecolumn_map_aggregateitem` WRITE;
/*!40000 ALTER TABLE `aggregatecolumn_map_aggregateitem` DISABLE KEYS */;
INSERT INTO `aggregatecolumn_map_aggregateitem` VALUES (1,1,1),(2,2,2),(3,3,3),(42,4,6),(43,7,6),(44,9,7),(55,12,9);
/*!40000 ALTER TABLE `aggregatecolumn_map_aggregateitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregateitem`
--

DROP TABLE IF EXISTS `aggregateitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregateitem` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `maxlength` tinyint(3) unsigned NOT NULL,
  `position` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregateitem`
--

LOCK TABLES `aggregateitem` WRITE;
/*!40000 ALTER TABLE `aggregateitem` DISABLE KEYS */;
INSERT INTO `aggregateitem` VALUES (1,0,1),(2,200,1),(3,0,1),(4,0,1),(5,0,1),(6,0,2),(7,0,2),(8,0,3),(9,0,1),(10,0,1),(11,0,1),(12,0,1);
/*!40000 ALTER TABLE `aggregateitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregateitemtype`
--

DROP TABLE IF EXISTS `aggregateitemtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregateitemtype` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `lengthismandatory` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregateitemtype`
--

LOCK TABLES `aggregateitemtype` WRITE;
/*!40000 ALTER TABLE `aggregateitemtype` DISABLE KEYS */;
INSERT INTO `aggregateitemtype` VALUES (1,'Snippet','1'),(2,'Group','1'),(3,'Content Only','0');
/*!40000 ALTER TABLE `aggregateitemtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregateitemtype_map_aggregateitem`
--

DROP TABLE IF EXISTS `aggregateitemtype_map_aggregateitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregateitemtype_map_aggregateitem` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `aggregateitemid` tinyint(3) unsigned NOT NULL,
  `aggregateitemtypeid` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aggregateitemid` (`aggregateitemid`),
  KEY `aggregateitemtypeid` (`aggregateitemtypeid`),
  CONSTRAINT `aggregateitemtype_map_aggregateitem_ibfk_1` FOREIGN KEY (`aggregateitemid`) REFERENCES `aggregateitem` (`id`),
  CONSTRAINT `aggregateitemtype_map_aggregateitem_ibfk_2` FOREIGN KEY (`aggregateitemtypeid`) REFERENCES `aggregateitemtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregateitemtype_map_aggregateitem`
--

LOCK TABLES `aggregateitemtype_map_aggregateitem` WRITE;
/*!40000 ALTER TABLE `aggregateitemtype_map_aggregateitem` DISABLE KEYS */;
INSERT INTO `aggregateitemtype_map_aggregateitem` VALUES (1,1,1),(2,2,1),(3,3,1),(13,8,3),(22,5,2),(23,6,1),(25,4,1),(26,7,3),(27,9,3),(29,10,2),(32,11,1),(34,12,3);
/*!40000 ALTER TABLE `aggregateitemtype_map_aggregateitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset`
--

DROP TABLE IF EXISTS `asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset`
--

LOCK TABLES `asset` WRITE;
/*!40000 ALTER TABLE `asset` DISABLE KEYS */;
INSERT INTO `asset` VALUES (18,'AH_Vectron_Wave.pdf'),(17,'beyblade-beyraiderz-firegate-battle-set.png'),(1,'gorilla-warfere.png'),(5,'takara-test.png');
/*!40000 ALTER TABLE `asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `position` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (27,'b2',1),(28,'a1',5),(29,'b11',3),(30,'b3',2),(31,'b12',4),(32,'a2',6);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitem`
--

DROP TABLE IF EXISTS `menuitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menuitem` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `position` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitem`
--

LOCK TABLES `menuitem` WRITE;
/*!40000 ALTER TABLE `menuitem` DISABLE KEYS */;
INSERT INTO `menuitem` VALUES (17,'',19),(18,'',18),(19,'',17),(20,'',16),(21,'',15),(22,'',14),(23,'',13),(24,'',12),(25,'',11),(26,'',10),(27,'',9),(28,'',8),(29,'',7),(30,'',6),(31,'',5),(32,'',4),(33,'',3),(34,'',2),(35,'',1);
/*!40000 ALTER TABLE `menuitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitem_map_menu`
--

DROP TABLE IF EXISTS `menuitem_map_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menuitem_map_menu` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `menuitemid` tinyint(3) NOT NULL,
  `menuid` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menuitemid` (`menuitemid`),
  KEY `menuid` (`menuid`),
  CONSTRAINT `menuitem_map_menu_ibfk_1` FOREIGN KEY (`menuitemid`) REFERENCES `menuitem` (`id`),
  CONSTRAINT `menuitem_map_menu_ibfk_2` FOREIGN KEY (`menuid`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitem_map_menu`
--

LOCK TABLES `menuitem_map_menu` WRITE;
/*!40000 ALTER TABLE `menuitem_map_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menuitem_map_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitem_map_pageitem`
--

DROP TABLE IF EXISTS `menuitem_map_pageitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menuitem_map_pageitem` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `menuitemid` tinyint(3) NOT NULL,
  `pageitemid` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menuitemid` (`menuitemid`),
  KEY `pageitemid` (`pageitemid`),
  CONSTRAINT `menuitem_map_pageitem_ibfk_1` FOREIGN KEY (`menuitemid`) REFERENCES `menuitem` (`id`),
  CONSTRAINT `menuitem_map_pageitem_ibfk_2` FOREIGN KEY (`pageitemid`) REFERENCES `pageitem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitem_map_pageitem`
--

LOCK TABLES `menuitem_map_pageitem` WRITE;
/*!40000 ALTER TABLE `menuitem_map_pageitem` DISABLE KEYS */;
INSERT INTO `menuitem_map_pageitem` VALUES (23,18,18),(24,19,3),(25,20,3),(26,21,18),(27,22,18),(28,23,17),(29,24,2),(30,25,3),(31,26,4),(32,27,2),(33,28,1),(34,29,19),(35,30,1),(36,31,17),(37,32,16);
/*!40000 ALTER TABLE `menuitem_map_pageitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pageitem`
--

DROP TABLE IF EXISTS `pageitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pageitem` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) NOT NULL,
  `publishdate` datetime DEFAULT NULL,
  `pagename` varchar(256) NOT NULL,
  `createdate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `readonly` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pageitem`
--

LOCK TABLES `pageitem` WRITE;
/*!40000 ALTER TABLE `pageitem` DISABLE KEYS */;
INSERT INTO `pageitem` VALUES (1,'firstpp',NULL,'firstpp.php','2016-01-01 20:59:46','2016-01-10 22:14:20',NULL),(2,'second',NULL,'second.php','2016-01-01 21:01:44','2016-01-10 22:50:52',NULL),(3,'third0',NULL,'third0.php','2016-01-01 21:02:23','2016-01-10 22:53:13',NULL),(4,'forth',NULL,'forth.php','2016-01-02 09:43:35','2016-01-10 22:23:20',NULL),(5,'aa',NULL,'aa.php','2016-01-02 09:56:09','2016-01-02 09:56:09',NULL),(6,'kkk',NULL,'kkk.php','2016-01-07 21:57:17','2016-01-08 07:51:53',NULL),(7,'abc',NULL,'abc.php','2016-01-08 22:13:24','2016-01-08 22:13:24',NULL),(8,'ddd',NULL,'ddd.php','2016-01-08 22:20:03','2016-01-08 22:20:03',NULL),(9,'aaa',NULL,'aaa.php','2016-01-08 22:25:04','2016-01-08 22:25:04',NULL),(10,'try 1',NULL,'try-1.php','2016-01-09 14:24:04','2016-01-09 14:24:04',NULL),(11,'aaaaa',NULL,'aaaaa.php','2016-01-09 14:37:23','2016-01-09 14:37:23',NULL),(12,'pop',NULL,'pop.php','2016-01-09 14:39:10','2016-01-09 14:39:10',NULL),(13,'try2',NULL,'try2.php','2016-01-09 15:02:51','2016-01-09 15:02:51',NULL),(14,'try 3',NULL,'try-3.php','2016-01-09 15:27:23','2016-01-09 15:43:10',NULL),(15,'try 4e',NULL,'try-4e.php','2016-01-09 15:43:34','2016-01-09 16:32:32',NULL),(16,'another story',NULL,'another-story.php','2016-01-10 22:23:58','2016-01-10 22:23:58',NULL),(17,'yet another',NULL,'yet-another.php','2016-01-10 22:49:58','2016-01-14 20:56:49',NULL),(18,'aaaa',NULL,'aaaa.php','2016-01-12 08:54:52','2016-01-12 08:55:21',NULL),(19,'aaaaaaa',NULL,'aaaaaaa.php','2016-01-12 08:55:04','2016-01-12 08:55:14',NULL);
/*!40000 ALTER TABLE `pageitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pageitem_map_pagetemplate`
--

DROP TABLE IF EXISTS `pageitem_map_pagetemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pageitem_map_pagetemplate` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `pageitemid` tinyint(3) unsigned NOT NULL,
  `pagetemplateid` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pageitemid` (`pageitemid`),
  KEY `pagetemplateid` (`pagetemplateid`),
  CONSTRAINT `pageitem_map_pagetemplate_ibfk_1` FOREIGN KEY (`pageitemid`) REFERENCES `pageitem` (`id`),
  CONSTRAINT `pageitem_map_pagetemplate_ibfk_2` FOREIGN KEY (`pagetemplateid`) REFERENCES `pagetemplate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pageitem_map_pagetemplate`
--

LOCK TABLES `pageitem_map_pagetemplate` WRITE;
/*!40000 ALTER TABLE `pageitem_map_pagetemplate` DISABLE KEYS */;
INSERT INTO `pageitem_map_pagetemplate` VALUES (11,5,1),(19,6,1),(20,7,1),(21,8,1),(22,9,1),(23,10,1),(24,11,1),(25,12,1),(26,13,1),(32,14,1),(41,15,1),(47,1,2),(50,4,2),(52,16,2),(55,2,2),(59,3,2),(62,19,1),(63,18,2),(64,17,2);
/*!40000 ALTER TABLE `pageitem_map_pagetemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pageitem_map_piaggregate`
--

DROP TABLE IF EXISTS `pageitem_map_piaggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pageitem_map_piaggregate` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `pageitemid` tinyint(3) unsigned NOT NULL,
  `piaggregateid` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pageitemid` (`pageitemid`),
  KEY `piaggregateid` (`piaggregateid`),
  CONSTRAINT `pageitem_map_piaggregate_ibfk_1` FOREIGN KEY (`pageitemid`) REFERENCES `pageitem` (`id`),
  CONSTRAINT `pageitem_map_piaggregate_ibfk_2` FOREIGN KEY (`piaggregateid`) REFERENCES `piaggregate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pageitem_map_piaggregate`
--

LOCK TABLES `pageitem_map_piaggregate` WRITE;
/*!40000 ALTER TABLE `pageitem_map_piaggregate` DISABLE KEYS */;
INSERT INTO `pageitem_map_piaggregate` VALUES (33,12,3),(34,13,4),(44,14,5),(45,14,5),(46,14,5),(63,15,6),(64,15,6),(66,19,7),(67,19,7);
/*!40000 ALTER TABLE `pageitem_map_piaggregate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pageitem_map_picontent`
--

DROP TABLE IF EXISTS `pageitem_map_picontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pageitem_map_picontent` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `pageitemid` tinyint(3) unsigned NOT NULL,
  `picontentid` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pageitemid` (`pageitemid`),
  KEY `picontentid` (`picontentid`),
  CONSTRAINT `pageitem_map_picontent_ibfk_1` FOREIGN KEY (`pageitemid`) REFERENCES `pageitem` (`id`),
  CONSTRAINT `pageitem_map_picontent_ibfk_2` FOREIGN KEY (`picontentid`) REFERENCES `picontent` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pageitem_map_picontent`
--

LOCK TABLES `pageitem_map_picontent` WRITE;
/*!40000 ALTER TABLE `pageitem_map_picontent` DISABLE KEYS */;
INSERT INTO `pageitem_map_picontent` VALUES (25,1,1),(26,1,1),(34,4,4),(35,4,4),(36,4,4),(40,16,5),(46,2,2),(47,2,2),(58,3,3),(59,3,3),(62,18,7),(63,18,7),(65,17,6),(66,17,6);
/*!40000 ALTER TABLE `pageitem_map_picontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagetemplate`
--

DROP TABLE IF EXISTS `pagetemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagetemplate` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `pagetype` varchar(20) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `title` varchar(50) NOT NULL,
  `template` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagetemplate`
--

LOCK TABLES `pagetemplate` WRITE;
/*!40000 ALTER TABLE `pagetemplate` DISABLE KEYS */;
INSERT INTO `pagetemplate` VALUES (1,'piaggregate','Use this template to create aggregate pages that include references to other pages','Aggregate page','aggregate'),(2,'picontent','Use this template to create detail page that have content such as body text, images etc','Content page','content');
/*!40000 ALTER TABLE `pagetemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piaggregate`
--

DROP TABLE IF EXISTS `piaggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piaggregate` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piaggregate`
--

LOCK TABLES `piaggregate` WRITE;
/*!40000 ALTER TABLE `piaggregate` DISABLE KEYS */;
INSERT INTO `piaggregate` VALUES (1),(2),(3),(4),(5),(6),(7);
/*!40000 ALTER TABLE `piaggregate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piaggregate_map_aggregatecolumn`
--

DROP TABLE IF EXISTS `piaggregate_map_aggregatecolumn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piaggregate_map_aggregatecolumn` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `aggregatecolumnid` tinyint(3) unsigned NOT NULL,
  `piaggregateid` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aggregatecolumnid` (`aggregatecolumnid`),
  KEY `piaggregateid` (`piaggregateid`),
  CONSTRAINT `piaggregate_map_aggregatecolumn_ibfk_1` FOREIGN KEY (`aggregatecolumnid`) REFERENCES `aggregatecolumn` (`id`),
  CONSTRAINT `piaggregate_map_aggregatecolumn_ibfk_2` FOREIGN KEY (`piaggregateid`) REFERENCES `piaggregate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piaggregate_map_aggregatecolumn`
--

LOCK TABLES `piaggregate_map_aggregatecolumn` WRITE;
/*!40000 ALTER TABLE `piaggregate_map_aggregatecolumn` DISABLE KEYS */;
INSERT INTO `piaggregate_map_aggregatecolumn` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,4),(16,6,5),(17,7,5),(35,8,6),(36,9,6),(39,10,7),(40,11,7);
/*!40000 ALTER TABLE `piaggregate_map_aggregatecolumn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picontent`
--

DROP TABLE IF EXISTS `picontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picontent` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `subtitle` varchar(256) DEFAULT NULL,
  `body` text,
  `titleimageurl` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picontent`
--

LOCK TABLES `picontent` WRITE;
/*!40000 ALTER TABLE `picontent` DISABLE KEYS */;
INSERT INTO `picontent` VALUES (1,'first subby','<p><strong>firsst</strong> body</p>\n\n<p>&nbsp;</p>\n\n<p><span style=\"color:#FF0000\">kkjjkkk</span></p>\n','http://localhost:9000/images/beyblade-beyraiderz-firegate-battle-set.png'),(2,'second subby','<p>second body</p>\n','http://localhost:9000/images/beyblade-beyraiderz-firegate-battle-set.png'),(3,'third subby','<p>third body</p>\n','http://localhost:9000/images/beyblade-beyraiderz-firegate-battle-set.png'),(4,'forth subby','<p>forth body</p>\n','http://localhost:9000/images/takara-test.png'),(5,NULL,NULL,'http://localhost:9000/images/beyblade-beyraiderz-firegate-battle-set.png'),(6,NULL,NULL,'http://localhost:9000/images/takara-test.png'),(7,NULL,NULL,'http://localhost:9000/images/beyblade-beyraiderz-firegate-battle-set.png');
/*!40000 ALTER TABLE `picontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (34,'a'),(36,'htuuu'),(4,'pokerj'),(33,'pokerj008'),(12,'pokerj12'),(6,'pokerja'),(35,'pol'),(22,'pop');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_map_aggregateitem`
--

DROP TABLE IF EXISTS `tag_map_aggregateitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_map_aggregateitem` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `aggregateitemid` tinyint(3) unsigned NOT NULL,
  `tagid` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aggregateitemid` (`aggregateitemid`),
  KEY `tagid` (`tagid`),
  CONSTRAINT `tag_map_aggregateitem_ibfk_1` FOREIGN KEY (`aggregateitemid`) REFERENCES `aggregateitem` (`id`),
  CONSTRAINT `tag_map_aggregateitem_ibfk_2` FOREIGN KEY (`tagid`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_map_aggregateitem`
--

LOCK TABLES `tag_map_aggregateitem` WRITE;
/*!40000 ALTER TABLE `tag_map_aggregateitem` DISABLE KEYS */;
INSERT INTO `tag_map_aggregateitem` VALUES (1,1,34),(2,2,34),(3,3,34),(13,8,22),(22,5,36),(23,6,33),(25,4,34),(26,7,4),(27,9,4),(29,10,34),(32,11,34),(34,12,33);
/*!40000 ALTER TABLE `tag_map_aggregateitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_map_pageitem`
--

DROP TABLE IF EXISTS `tag_map_pageitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_map_pageitem` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` tinyint(2) unsigned NOT NULL,
  `pageitemid` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagid` (`tagid`),
  KEY `pageitemid` (`pageitemid`),
  CONSTRAINT `tagid_map_pageitem_ibfk_1` FOREIGN KEY (`tagid`) REFERENCES `tag` (`id`),
  CONSTRAINT `tagid_map_pageitem_ibfk_2` FOREIGN KEY (`pageitemid`) REFERENCES `pageitem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_map_pageitem`
--

LOCK TABLES `tag_map_pageitem` WRITE;
/*!40000 ALTER TABLE `tag_map_pageitem` DISABLE KEYS */;
INSERT INTO `tag_map_pageitem` VALUES (19,4,1),(20,34,1),(21,36,1);
/*!40000 ALTER TABLE `tag_map_pageitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-15 10:32:47
