CREATE DATABASE  IF NOT EXISTS `bookmis` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `bookmis`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: bookmis
-- ------------------------------------------------------
-- Server version	8.0.15

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
-- Table structure for table `region_all`
--

DROP TABLE IF EXISTS `region_all`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `region_all` (
  `regionID` varchar(45) NOT NULL,
  `regionName` char(45) NOT NULL,
  `regionSum` int(11) DEFAULT '0',
  PRIMARY KEY (`regionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_all`
--

LOCK TABLES `region_all` WRITE;
/*!40000 ALTER TABLE `region_all` DISABLE KEYS */;
INSERT INTO `region_all` VALUES ('A','马列主义、毛泽东思想、邓小平理论',0),('B','哲学、宗教',0),('C','社会科学总论',0),('D','政治、法律',0),('E','军事',0),('F','经济',0),('G','文化、科学、教育、体育',0),('H','语言、文字',0),('I','文学',0),('J','艺术',0),('K','历史、地理',0),('N','自然科学总论',0),('O','数理科学与化学',0),('P','天文学、地球科学',0),('Q','生物科学',0),('R','医药、卫生',0),('S','农业科学',0),('T','工业技术',0),('U','交通运输',0),('V','航空、航天',0),('X','环境科学,安全科学',0),('Z','综合性图书',0);
/*!40000 ALTER TABLE `region_all` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-11 23:58:21
