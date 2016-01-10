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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregatecolumn`
--

LOCK TABLES `aggregatecolumn` WRITE;
/*!40000 ALTER TABLE `aggregatecolumn` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregatecolumn` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregateitem`
--

LOCK TABLES `aggregateitem` WRITE;
/*!40000 ALTER TABLE `aggregateitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregateitem` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pageitem`
--

LOCK TABLES `pageitem` WRITE;
/*!40000 ALTER TABLE `pageitem` DISABLE KEYS */;
INSERT INTO `pageitem` VALUES (1,'firstpp',NULL,'firstpp.php','2016-01-01 20:59:46','2016-01-01 21:32:49',NULL),(2,'second',NULL,'second.php','2016-01-01 21:01:44','2016-01-01 21:01:44',NULL),(3,'third0',NULL,'third0.php','2016-01-01 21:02:23','2016-01-01 21:05:21',NULL),(4,'forth',NULL,'forth.php','2016-01-02 09:43:35','2016-01-02 09:43:35',NULL),(5,'aa',NULL,'aa.php','2016-01-02 09:56:09','2016-01-02 09:56:09',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pageitem_map_pagetemplate`
--

LOCK TABLES `pageitem_map_pagetemplate` WRITE;
/*!40000 ALTER TABLE `pageitem_map_pagetemplate` DISABLE KEYS */;
INSERT INTO `pageitem_map_pagetemplate` VALUES (2,2,2),(4,3,2),(5,3,2),(8,1,2),(9,1,2),(10,4,2),(11,5,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pageitem_map_piaggregate`
--

LOCK TABLES `pageitem_map_piaggregate` WRITE;
/*!40000 ALTER TABLE `pageitem_map_piaggregate` DISABLE KEYS */;
INSERT INTO `pageitem_map_piaggregate` VALUES (10,5,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pageitem_map_picontent`
--

LOCK TABLES `pageitem_map_picontent` WRITE;
/*!40000 ALTER TABLE `pageitem_map_picontent` DISABLE KEYS */;
INSERT INTO `pageitem_map_picontent` VALUES (2,2,2),(4,3,3),(5,3,3),(8,1,1),(9,1,1),(10,4,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piaggregate`
--

LOCK TABLES `piaggregate` WRITE;
/*!40000 ALTER TABLE `piaggregate` DISABLE KEYS */;
INSERT INTO `piaggregate` VALUES (4);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piaggregate_map_aggregatecolumn`
--

LOCK TABLES `piaggregate_map_aggregatecolumn` WRITE;
/*!40000 ALTER TABLE `piaggregate_map_aggregatecolumn` DISABLE KEYS */;
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
  `titleimage` varchar(256) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picontent`
--

LOCK TABLES `picontent` WRITE;
/*!40000 ALTER TABLE `picontent` DISABLE KEYS */;
INSERT INTO `picontent` VALUES (1,'first subby',NULL,'firsst body'),(2,'second subby',NULL,'second body'),(3,'third subby',NULL,'third body'),(4,'forth subby',NULL,'forth body');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_map_pageitem`
--

LOCK TABLES `tag_map_pageitem` WRITE;
/*!40000 ALTER TABLE `tag_map_pageitem` DISABLE KEYS */;
INSERT INTO `tag_map_pageitem` VALUES (1,34,1),(2,36,1),(3,4,1);
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

-- Dump completed on 2016-01-05 21:16:26
