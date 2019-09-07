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
-- Table structure for table `press`
--

DROP TABLE IF EXISTS `press`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `press` (
  `pressID` int(11) NOT NULL AUTO_INCREMENT,
  `pressName` varchar(45) NOT NULL,
  `pressAddress` varchar(45) DEFAULT NULL,
  `pressPhone` varchar(45) DEFAULT NULL,
  `preeFax` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pressID`,`pressName`)
) ENGINE=InnoDB AUTO_INCREMENT=492 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `press`
--

LOCK TABLES `press` WRITE;
/*!40000 ALTER TABLE `press` DISABLE KEYS */;
INSERT INTO `press` VALUES (1,'人民出版社','北京',NULL,NULL),(2,'南京大学出版社','南京',NULL,NULL),(3,'北京出版社','北京',NULL,NULL),(4,'人民日报出版社','北京',NULL,NULL),(5,'中国人民大学出版社','北京',NULL,NULL),(6,'四川大学出版社','成都',NULL,NULL),(7,'中国人民公安大学出版社','北京',NULL,NULL),(8,'山东人民出版社','济南',NULL,NULL),(9,'中国社会出版社','北京',NULL,NULL),(10,'中央编译出版社','北京',NULL,NULL),(11,'红旗出版社','北京',NULL,NULL),(12,'中央文献出版社','北京',NULL,NULL),(13,'军事科学出版社','北京',NULL,NULL),(14,'中共中央党校出版社','北京',NULL,NULL),(15,'人民文学出版社','北京',NULL,NULL),(16,'江苏美术出版社','南京',NULL,NULL),(17,'中国社会科学出版社','北京',NULL,NULL),(18,'作家出版社','北京',NULL,NULL),(19,'郑州大学出版社','郑州',NULL,NULL),(20,'山东大学出版社','济南',NULL,NULL),(21,'浙江大学出版社','杭州',NULL,NULL),(22,'安徽大学出版社','合肥',NULL,NULL),(23,'群众出版社','北京',NULL,NULL),(24,'商务印书馆','北京',NULL,NULL),(25,'北京联合出版公司','北京',NULL,NULL),(26,'国际文化出版公司','北京',NULL,NULL),(27,'台海出版社','北京',NULL,NULL),(28,'中国民主法制出版社','北京',NULL,NULL),(29,'团结出版社','北京',NULL,NULL),(30,'中国少年儿童新闻出版社','北京',NULL,NULL),(31,'北京少年儿童出版社','北京',NULL,NULL),(32,'湖南人民出版社','长沙',NULL,NULL),(33,'四川人民出版社','成都',NULL,NULL),(34,'长征出版社','北京',NULL,NULL),(35,'九州出版社','北京',NULL,NULL),(36,'三联书店','北京',NULL,NULL),(37,'新华出版社','北京',NULL,NULL),(38,'新世界出版社','北京',NULL,NULL),(39,'中共党史出版社','北京',NULL,NULL),(40,'中国工人出版社','北京',NULL,NULL),(41,'辽宁人民出版社','沈阳',NULL,NULL),(42,'高等教育出版社','北京',NULL,NULL),(43,'经济管理出版社','北京',NULL,NULL),(44,'解放军出版社','北京',NULL,NULL),(45,'中国书籍出版社','北京',NULL,NULL),(46,'社会科学文献出版社','北京',NULL,NULL),(47,'北京师范大学出版社','北京',NULL,NULL),(48,'重庆出版社','重庆',NULL,NULL),(49,'中山大学出版社','广州',NULL,NULL),(50,'广西师范大学出版社','桂林',NULL,NULL),(51,'东北大学出版社','沈阳',NULL,NULL),(52,'光明日报出版社','北京',NULL,NULL),(53,'东方出版社','北京',NULL,NULL),(54,'中国文史出版社','北京',NULL,NULL),(55,'武汉大学出版社','武汉',NULL,NULL),(56,'暨南大学出版社','广州',NULL,NULL),(57,'科学出版社','北京',NULL,NULL),(58,'电子工业出版社','北京',NULL,NULL),(59,'福建教育出版社','福州',NULL,NULL),(60,'黑龙江教育出版社','哈尔滨',NULL,NULL),(61,'青岛出版社','青岛',NULL,NULL),(62,'中国铁道出版社','北京',NULL,NULL),(63,'湖南科学出版社','长沙',NULL,NULL),(64,'厦门大学出版社','厦门',NULL,NULL),(65,'江苏大学出版社','镇江',NULL,NULL),(66,'三晋出版社','太原',NULL,NULL),(67,'北京理工大学出版社','北京',NULL,NULL),(68,'清华大学出版社','北京',NULL,NULL),(69,'华东师范大学出版社','上海',NULL,NULL),(70,'中国美术学院出版社','杭州',NULL,NULL),(71,'上海科学技术文献出版社','上海',NULL,NULL),(72,'南海出版公司','海口',NULL,NULL),(73,'北京大学出版社','北京',NULL,NULL),(74,'译林出版社','南京',NULL,NULL),(75,'华夏出版社','北京',NULL,NULL),(76,'学林出版社','上海',NULL,NULL),(77,'吉林人民出版社','长春',NULL,NULL),(78,'中国言实出版社','北京',NULL,NULL),(79,'陕西人民出版社','西安',NULL,NULL),(80,'北京工业大学出版社','北京',NULL,NULL),(81,'哈尔滨工程大学出版社','哈尔滨',NULL,NULL),(82,'重庆大学出版社','重庆',NULL,NULL),(83,'上海三联书店','上海',NULL,NULL),(84,'中国文联出版社','北京',NULL,NULL),(85,'中华工商联合出版社','北京',NULL,NULL),(86,'中华书局','北京',NULL,NULL),(87,'四季出版有限公司','香港',NULL,NULL),(88,'华中科技大学出版社','武汉',NULL,NULL),(89,'民族出版社','北京',NULL,NULL),(90,'黄山书社','合肥',NULL,NULL),(91,'吉林大学出版社','长春',NULL,NULL),(92,'世界知识出版社','北京',NULL,NULL),(93,'中国华侨出版社','北京',NULL,NULL),(94,'中信出版集团股份有限公司','北京',NULL,NULL),(95,'上海人民出版社','上海',NULL,NULL),(96,'中国商业出版社','北京',NULL,NULL),(97,'北京时代华文书局','北京',NULL,NULL),(98,'知识产权出版社','北京',NULL,NULL),(99,'长江文艺出版社','武汉',NULL,NULL),(100,'上海译文出版社','上海',NULL,NULL),(101,'煤炭工业出版社','北京',NULL,NULL),(102,'时事出版社','北京',NULL,NULL),(103,'华文出版社','北京',NULL,NULL),(104,'江苏人民出版社','南京',NULL,NULL),(105,'金城出版社','北京',NULL,NULL),(106,'吉林美术出版社','长春',NULL,NULL),(107,'京华出版社','北京',NULL,NULL),(108,'安徽教育出版社','合肥',NULL,NULL),(109,'机械工业出版社','北京',NULL,NULL),(110,'江西人民出版社','南昌',NULL,NULL),(111,'企业管理出版社','北京',NULL,NULL),(112,'立信会计出版社','上海',NULL,NULL),(113,'江苏凤凰文艺出版社','南京',NULL,NULL),(114,'天津人民出版社','天津',NULL,NULL),(115,'人民邮电出版社','北京',NULL,NULL),(116,'浙江人民出版社','杭州',NULL,NULL),(117,'安徽人民出版社','合肥',NULL,NULL),(118,'山西人民出版社','太原',NULL,NULL),(119,'人民交通出版社股份有限公司','北京',NULL,NULL),(120,'中国轻工业出版社','北京',NULL,NULL),(121,'外语教学与研究出版社','北京',NULL,NULL),(122,'中国政法大学出版社','北京',NULL,NULL),(123,'新星出版社','北京',NULL,NULL),(124,'上海财经大学出版社','上海',NULL,NULL),(125,'苏州大学出版社','苏州',NULL,NULL),(126,'中国农业大学出版社','北京',NULL,NULL),(127,'上海社会科学院出版社','上海',NULL,NULL),(128,'湘潭大学出版社','湘潭',NULL,NULL),(129,'中国水利水电出版社','北京',NULL,NULL),(130,'化学工业出版社','北京',NULL,NULL),(131,'世界图书出版公司北京公司','北京',NULL,NULL),(132,'华中师范大学出版社','武汉',NULL,NULL),(133,'东南大学出版社','南京',NULL,NULL),(134,'中信出版集团','北京',NULL,NULL),(135,'吉林出版集团股份有限公司','长春',NULL,NULL),(136,'中国纺织出版社','北京',NULL,NULL),(137,'延边大学出版社','延吉',NULL,NULL),(138,'哈尔滨出版社','哈尔滨',NULL,NULL),(139,'江西教育出版社','南昌',NULL,NULL),(140,'江西美术出版社','南昌',NULL,NULL),(141,'北京工艺美术出版社','北京',NULL,NULL),(142,'天地出版社','成都',NULL,NULL),(143,'中国传媒大学出版社','北京',NULL,NULL),(144,'上海交通大学出版社','上海',NULL,NULL),(145,'湖南文艺出版社','长沙',NULL,NULL),(146,'浙江文艺出版社','杭州',NULL,NULL),(147,'上海科技教育出版社','上海',NULL,NULL),(148,'中国友谊出版公司','北京',NULL,NULL),(149,'中国青年出版社','北京',NULL,NULL),(150,'世界图书出版广东有限公司','广州',NULL,NULL),(151,'古吴轩出版社','苏州',NULL,NULL),(152,'吉林文史出版社','长春',NULL,NULL),(153,'中國國際文學出版有限公司','香港',NULL,NULL),(154,'五洲传播出版社','北京',NULL,NULL),(155,'中華書局','北京',NULL,NULL),(156,'中州古籍出版社','郑州',NULL,NULL),(157,'華東師範大學出版社','上海',NULL,NULL),(158,'复旦大学出版社','上海',NULL,NULL),(159,'复旦大学出版社有限公司','上海',NULL,NULL),(160,'西安电子科技大学出版社','西安',NULL,NULL),(161,'宗教文化出版社','北京',NULL,NULL),(162,'国家图书馆出版社','北京',NULL,NULL),(163,'合肥工业大学出版社','合肥',NULL,NULL),(164,'宁夏人民出版社','银川',NULL,NULL),(165,'东方出版中心','上海',NULL,NULL),(166,'福建科学技术出版社','福州',NULL,NULL),(167,'辽宁教育出版社','沈阳',NULL,NULL),(168,'军事谊文出版社','北京',NULL,NULL),(169,'汕头大学出版社','汕头',NULL,NULL),(170,'中国市场出版社','北京',NULL,NULL),(171,'中国国际广播出版社','北京',NULL,NULL),(172,'中国海关出版社','北京',NULL,NULL),(173,'经济科学出版社','北京',NULL,NULL),(174,'湖南美术出版社','长沙',NULL,NULL),(175,'中国建筑工业出版社','北京',NULL,NULL),(176,'中国时代经济出版社','北京',NULL,NULL),(177,'电子科技大学出版社','成都',NULL,NULL),(178,'云南大学出版社','昆明',NULL,NULL),(179,'生活·读书·新知三联书店','北京',NULL,NULL),(180,'上海教育出版社','上海',NULL,NULL),(181,'国防科技大学出版社','长沙',NULL,NULL),(182,'陕西师范大学出版总社','西安',NULL,NULL),(183,'華中師範大學出版社','武漢',NULL,NULL),(184,'海天出版社','深圳',NULL,NULL),(185,'群言出版社','北京',NULL,NULL),(186,'学习出版社','北京',NULL,NULL),(187,'东北财经大学出版社','大连',NULL,NULL),(188,'北京航空航天大学出版社','北京',NULL,NULL),(189,'西南财经大学出版社','成都',NULL,NULL),(190,'首都经济贸易大学','北京',NULL,NULL),(191,'文化发展出版社','北京',NULL,NULL),(192,'武汉出版社','武汉',NULL,NULL),(193,'北京交通大学出版社','北京',NULL,NULL),(194,'北京日报出版社','北京',NULL,NULL),(195,'中信出版社','北京',NULL,NULL),(196,'山东文艺出版社','济南',NULL,NULL),(197,'民主与建设出版社','北京',NULL,NULL),(198,'华东理工大学出版社','上海',NULL,NULL),(199,'长春出版社','吉林',NULL,NULL),(200,'浙江工商大学出版社','杭州',NULL,NULL),(201,'广东经济出版社','广州',NULL,NULL),(202,'百花洲文艺出版社','南昌',NULL,NULL),(203,'北方文艺出版社','哈尔滨',NULL,NULL),(204,'文津出版社','北京',NULL,NULL),(205,'中国长安出版社','北京',NULL,NULL),(206,'四川文艺出版社','成都',NULL,NULL),(207,'党建读物出版社','北京',NULL,NULL),(208,'中国建材工业出版社','北京',NULL,NULL),(209,'中国人民大学出版社','',NULL,NULL),(210,'中国发展出版社','北京',NULL,NULL),(211,'中国物资出版社','北京',NULL,NULL),(212,'北京邮电大学出版社','北京',NULL,NULL),(213,'中国经济出版社','北京',NULL,NULL),(214,'上海远东出版社','上海',NULL,NULL),(215,'中华工商联出版社','北京',NULL,NULL),(216,'南方日报出版社','广州',NULL,NULL),(217,'科学普及出版社','北京',NULL,NULL),(218,'中国劳动社会保障出版社','北京',NULL,NULL),(219,'中国原子能出版社','北京',NULL,NULL),(220,'国家开放大学出版社','北京',NULL,NULL),(221,'海南出版社','海口',NULL,NULL),(222,'合肥工业大学出版','合肥',NULL,NULL),(223,'当代世界出版社','北京',NULL,NULL),(224,'首都经济贸易大学出版社','北京',NULL,NULL),(225,'中国广播电视出版社','北京',NULL,NULL),(226,'河北人民出版社','石家庄',NULL,NULL),(227,'中国财政经济出版社','北京',NULL,NULL),(228,'山西教育出版社','太原',NULL,NULL),(229,'文汇出版社','上海',NULL,NULL),(230,'上海大学出版社','上海',NULL,NULL),(231,'贵州大学出版社','贵阳',NULL,NULL),(232,'上海辞书出版社','上海',NULL,NULL),(233,'中央广播电视大学出版社','北京',NULL,NULL),(234,'湖南科学技术出版社','长沙',NULL,NULL),(235,'当代中国出版社','北京',NULL,NULL),(236,'广东人民出版社','广州',NULL,NULL),(237,'时代文艺出版社','长春',NULL,NULL),(238,'格致出版社','上海',NULL,NULL),(239,'石油工业出版社','北京',NULL,NULL),(240,'同济大学出版社','上海',NULL,NULL),(241,'华南理工大学出版社','广州',NULL,NULL),(242,'法律出版社','北京',NULL,NULL),(243,'中国标准出版社','北京',NULL,NULL),(244,'中国检察出版社','北京',NULL,NULL),(245,'国防工业出版社','北京',NULL,NULL),(246,'国防大学出版社','北京',NULL,NULL),(247,'黄河出版社','济南',NULL,NULL),(248,'西安交通大学出版社','西安',NULL,NULL),(249,'花城出版社','广州',NULL,NULL),(250,'湖南大学出版社','长沙',NULL,NULL),(251,'外文出版社','北京',NULL,NULL),(252,'航空工业出版社','北京',NULL,NULL),(253,'哈尔滨工程大学出版社 [等]','哈尔滨 [等]',NULL,NULL),(254,'长城出版社','北京',NULL,NULL),(255,'贵州人民出版社','贵阳',NULL,NULL),(256,'海洋出版社','北京',NULL,NULL),(257,'蓝天出版社','北京',NULL,NULL),(258,'吉林出版集团有限责任公司','长春',NULL,NULL),(259,'山东友谊出版社','济南',NULL,NULL),(260,'兵器工业出版社','北京',NULL,NULL),(261,'三秦出版社','西安',NULL,NULL),(262,'大连海事大学出版社','大连',NULL,NULL),(263,'中国大百科全书出版社','北京',NULL,NULL),(264,'国家行政学院出版社','北京',NULL,NULL),(265,'花山文艺出版社','石家庄',NULL,NULL),(266,'经济日报出版社','北京',NULL,NULL),(267,'中国农业出版社','北京',NULL,NULL),(268,'福建人民出版社','福州',NULL,NULL),(269,'天津大学出版社','天津',NULL,NULL),(270,'中国民航出版社','北京',NULL,NULL),(271,'中国旅游出版社','北京',NULL,NULL),(272,'旅游教育出版社','北京',NULL,NULL),(273,'江苏文艺出版社','南京',NULL,NULL),(274,'格致出版社 [等]','上海 [等]',NULL,NULL),(275,'南开大学出版社','天津',NULL,NULL),(276,'中国金融出版社','北京',NULL,NULL),(277,'世界图书出版公司','北京',NULL,NULL),(278,'语文出版社','北京',NULL,NULL),(279,'对外经济贸易大学出版社','北京',NULL,NULL),(280,'大连理工大学出版社','大连',NULL,NULL),(281,'现代出版社','北京',NULL,NULL),(282,'华龄出版社','北京',NULL,NULL),(283,'中国商务出版社','北京',NULL,NULL),(284,'西南交通大学出版社','成都',NULL,NULL),(285,'中西书局','上海',NULL,NULL),(286,'中国科学技术出版社','北京',NULL,NULL),(287,'方志出版社','北京',NULL,NULL),(288,'教育科学出版社','北京',NULL,NULL),(289,'山东画报出版社','济南',NULL,NULL),(290,'中国石化出版社','北京',NULL,NULL),(291,'现代教育出版社','北京',NULL,NULL),(292,'广东高等教育出版社','广州',NULL,NULL),(293,'69.00','人民教育出版社',NULL,NULL),(294,'人民教育出版社','北京',NULL,NULL),(295,'开明出版社','北京',NULL,NULL),(296,'生活书店出版有限公司','北京',NULL,NULL),(297,'北京体育大学出版社','北京',NULL,NULL),(298,'广东科技出版社','广州',NULL,NULL),(299,'长春出版社','长春',NULL,NULL),(300,'人民体育出版社','北京',NULL,NULL),(301,'南京出版社','南京',NULL,NULL),(302,'上海古籍出版社','上海',NULL,NULL),(303,'中国科学技术大学出版社','合肥',NULL,NULL),(304,'西北大学出版社','西安',NULL,NULL),(305,'北京语言大学出版社','北京',NULL,NULL),(306,'中央民族大学出版社','北京',NULL,NULL),(307,'흑룡강조선민족출판사','목단강',NULL,NULL),(308,'延边教育出版社','延吉',NULL,NULL),(309,'云南人民出版社','昆明',NULL,NULL),(310,'云南美术出版社','昆明',NULL,NULL),(311,'中国和平音像电子出版社','北京',NULL,NULL),(312,'上海世界图书出版公司','上海',NULL,NULL),(313,'天津社会科学院出版社','天津',NULL,NULL),(314,'上海外语教育出版社','上海',NULL,NULL),(315,'中国宇航出版社','北京',NULL,NULL),(316,'中译出版社','北京',NULL,NULL),(317,'西南师范大学出版社','重庆',NULL,NULL),(318,'东北林业大学出版社','哈尔滨',NULL,NULL),(319,'上海外语教育版社','上海',NULL,NULL),(320,'首都师范大学出版社','北京',NULL,NULL),(321,'湖南师范大学出版社','长沙',NULL,NULL),(322,'鹭江出版社','厦门',NULL,NULL),(323,'大象出版社','郑州',NULL,NULL),(324,'四川科学技术出版社','成都',NULL,NULL),(325,'四川党建期刊集团','成都',NULL,NULL),(326,'河南人民出版社','郑州',NULL,NULL),(327,'北京十月文艺出版社','北京',NULL,NULL),(328,'百花文艺出版社','天津',NULL,NULL),(329,'河南大学出版社','郑州',NULL,NULL),(330,'龙门书局','北京',NULL,NULL),(331,'上海文艺出版社','上海',NULL,NULL),(332,'黑龙江人民出版社','哈尔滨',NULL,NULL),(333,'四川美术出版社','成都',NULL,NULL),(334,'上海人民美术出版社','上海',NULL,NULL),(335,'辽宁美术出版社','沈阳',NULL,NULL),(336,'江苏凤凰美术出版社','南京',NULL,NULL),(337,'人民美术出版社','北京',NULL,NULL),(338,'中国画报出版社','北京',NULL,NULL),(339,'上海人美出版社','上海',NULL,NULL),(340,'中国戏剧出版社','北京',NULL,NULL),(341,'上海书店出版社','上海',NULL,NULL),(342,'漓江出版社','桂林',NULL,NULL),(343,'北京美术摄影出版社','北京',NULL,NULL),(344,'上海书画出版社','上海',NULL,NULL),(345,'天津杨柳青画社','天津',NULL,NULL),(346,'辽宁科学技术出版社','沈阳',NULL,NULL),(347,'江西美术出版社','江西',NULL,NULL),(348,'國家圖書館出版社','北京',NULL,NULL),(349,'西泠印社出版社','杭州',NULL,NULL),(350,'上海遠東出版社','上海',NULL,NULL),(351,'上海科学技术出版社','上海',NULL,NULL),(352,'陕西人民美术出版社','西安',NULL,NULL),(353,'岭南美术出版社','广州',NULL,NULL),(354,'浙江摄影出版社','杭州',NULL,NULL),(355,'黑龙江大学出版社','哈尔滨',NULL,NULL),(356,'中国电力出版社','北京',NULL,NULL),(357,'中国民族摄影艺术出版社','北京',NULL,NULL),(358,'东华大学出版社','上海',NULL,NULL),(359,'上海音乐学院出版社','上海',NULL,NULL),(360,'上海文艺音像出版社','上海',NULL,NULL),(361,'上海音乐出版社','上海',NULL,NULL),(362,'人民音乐出版社','北京',NULL,NULL),(363,'文化艺术出版社','北京',NULL,NULL),(364,'云南科技出版社','昆明',NULL,NULL),(365,'中国电影出版社','北京',NULL,NULL),(366,'学苑出版社','北京',NULL,NULL),(367,'北京燕山出版社','北京',NULL,NULL),(368,'东方中心','上海',NULL,NULL),(369,'黄河水利出版社','郑州',NULL,NULL),(370,'海潮出版社','北京',NULL,NULL),(371,'浙江出版社','杭州',NULL,NULL),(372,'三联书店上海分店','上海',NULL,NULL),(373,'广西人民出版社','南宁',NULL,NULL),(374,'上海世纪出版集团','上海',NULL,NULL),(375,'中信出版社集团股份有限公司','北京',NULL,NULL),(376,'万卷出版公司','沈阳',NULL,NULL),(377,'地震出版社','北京',NULL,NULL),(378,'哈尔滨出版社','黑龙江',NULL,NULL),(379,'河南文艺出版社','郑州',NULL,NULL),(380,'民主与建设出版社有限责任公司','北京',NULL,NULL),(381,'陕西师范大学出版社','西安',NULL,NULL),(382,'文物出版社','北京',NULL,NULL),(383,'济南出版社','济南',NULL,NULL),(384,'齐鲁书社','济南',NULL,NULL),(385,'世界图书出版公司','广州',NULL,NULL),(386,'甘肃人民美术出版社','兰州',NULL,NULL),(387,'紫禁城出版社','北京',NULL,NULL),(388,'天馬出版有限公司','香港',NULL,NULL),(389,'研究出版社','北京',NULL,NULL),(390,'中国地图出版社','北京',NULL,NULL),(391,'广东教育出版社','广州',NULL,NULL),(392,'内蒙古人民出版社','呼和浩特',NULL,NULL),(393,'上海科技文献出版社','上海',NULL,NULL),(394,'中国计量出版社','北京',NULL,NULL),(395,'山东美术出版社','济南',NULL,NULL),(396,'湖北教育出版社','武汉',NULL,NULL),(397,'山东教育出版社','济南',NULL,NULL),(398,'广西科学技术出版社','南宁',NULL,NULL),(399,'湖南科学技术出版社','湖南',NULL,NULL),(400,'武汉理工大学出版社','武汉',NULL,NULL),(401,'冶金工业出版社','北京',NULL,NULL),(402,'中国矿业大学出版社','徐州',NULL,NULL),(403,'西北工业大学出版社','西安',NULL,NULL),(404,'湖北科学技术出版社','武汉',NULL,NULL),(405,'北京科学技术出版社','北京',NULL,NULL),(406,'测绘出版社','北京',NULL,NULL),(407,'中国环境科学出版社','北京',NULL,NULL),(408,'华东大学出版社','上海',NULL,NULL),(409,'长江出版社','武汉',NULL,NULL),(410,'中国大地出版社','北京',NULL,NULL),(411,'大地出版社','北京',NULL,NULL),(412,'中南大学出版社','长沙',NULL,NULL),(413,'中国海洋大学出版社','青岛',NULL,NULL),(414,'甘肃文化出版社','兰州',NULL,NULL),(415,'宁夏少年儿童出版社','银川',NULL,NULL),(416,'江苏科学技术出版社','南京',NULL,NULL),(417,'北京大学医学出版社','北京',NULL,NULL),(418,'中国科技大学出版社','合肥',NULL,NULL),(419,'人民军医出版社','北京',NULL,NULL),(420,'武汉大学出版社','武昌',NULL,NULL),(421,'第四军医大学出版社','西安',NULL,NULL),(422,'上海中医药大学出版社','上海',NULL,NULL),(423,'人民卫生出版社','北京',NULL,NULL),(424,'中国医药科技出版社','北京',NULL,NULL),(425,'化学工业出版社生物·医药出版分社','北京',NULL,NULL),(426,'凤凰出版社','南京',NULL,NULL),(427,'珠海出版','珠海',NULL,NULL),(428,'化学工业出版业','北京',NULL,NULL),(429,'世界图书出版公司','西安 [等]',NULL,NULL),(430,'河南科学技术出版社','郑州',NULL,NULL),(431,'内蒙古大学出版社','呼和浩特',NULL,NULL),(432,'中国对外翻译出版公司','北京',NULL,NULL),(433,'中山大学出版社','北京',NULL,NULL),(434,'安徽文艺出版社','合肥',NULL,NULL),(435,'中国三峡出版社','北京',NULL,NULL),(436,'中国中医药出版社','北京',NULL,NULL),(437,'安徽科学技术出版社','合肥',NULL,NULL),(438,'中国协和医科大学出版社','北京',NULL,NULL),(439,'陕西科学技术出版社','西安',NULL,NULL),(440,'中国环境出版社','北京',NULL,NULL),(441,'中医古籍出版社','北京',NULL,NULL),(442,'黑龙江科学技术出版社','哈尔滨',NULL,NULL),(443,'金盾出版社','北京',NULL,NULL),(444,'吉林科学技术出版社','长春',NULL,NULL),(445,'天津科学技术出版社','天津',NULL,NULL),(446,'山西科学技术出版社','太原',NULL,NULL),(447,'江苏凤凰科学技术出版社','南京',NULL,NULL),(448,'河北科学技术出版社','石家庄',NULL,NULL),(449,'浙江科学技术出版社','杭州',NULL,NULL),(450,'科学技术文献出版社','北京',NULL,NULL),(451,'天津科技翻译出版有限公司','天津',NULL,NULL),(452,'上海文化出版社','上海',NULL,NULL),(453,'福建科学技术出版社','福建',NULL,NULL),(454,'化学工业出版社医学出版分社','北京',NULL,NULL),(455,'山东科学技术出版社','济南',NULL,NULL),(456,'辽海出版社','沈阳',NULL,NULL),(457,'中国财富出版社','北京',NULL,NULL),(458,'广东旅游出版社','广州',NULL,NULL),(459,'第二军医大学出版社','上海',NULL,NULL),(460,'江西科学技术出版社','南昌',NULL,NULL),(461,'河南大学出版社','开封',NULL,NULL),(462,'中国人事出版社','北京',NULL,NULL),(463,'中国林业出版社','北京',NULL,NULL),(464,'气象出版社','北京',NULL,NULL),(465,'地质出版社','北京',NULL,NULL),(466,'中国农业科学技术出版社','北京',NULL,NULL),(467,'吉林大学出版社','长春市',NULL,NULL),(468,'中国环境科学','北京',NULL,NULL),(469,'郑洲大学出版社','郑洲',NULL,NULL),(470,'河北大学出版社','保定',NULL,NULL),(471,'哈尔滨工业大学出版社','哈尔滨',NULL,NULL),(472,'人民交通出版社','北京',NULL,NULL),(473,'哈尔滨大学出版社','哈尔滨',NULL,NULL),(474,'哈尔滨工程大学','哈尔滨',NULL,NULL),(475,'朝华出版社','北京',NULL,NULL),(476,'湖北长江出版社','武汉',NULL,NULL),(477,'知识出版社','北京',NULL,NULL),(478,'珠海出版社','珠海',NULL,NULL),(479,'中国城市出版社','北京',NULL,NULL),(480,'合肥工业大学出版社','安徽',NULL,NULL),(481,'甘肃人民出版社','兰州',NULL,NULL),(482,'湖北人民出版社','武汉',NULL,NULL),(483,'山西科学教育出版社','太原',NULL,NULL),(484,'哈尔滨工业出版社','哈尔滨',NULL,NULL),(485,'商務印書館','北京',NULL,NULL),(486,'安徽师范大学出版社','合肥',NULL,NULL),(487,'同心出版社','北京',NULL,NULL),(488,'暨南大學出版社','廣州',NULL,NULL),(489,'華中師范大學出版社','武汉',NULL,NULL),(490,'北岳文艺出版社','太原',NULL,NULL),(491,'浙江古籍出版社','杭州',NULL,NULL);
/*!40000 ALTER TABLE `press` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-11 23:58:22