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
-- Table structure for table `region_select`
--

DROP TABLE IF EXISTS `region_select`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `region_select` (
  `regionID` varchar(45) NOT NULL,
  `ParentID` varchar(45) NOT NULL,
  `regionName` varchar(45) DEFAULT NULL,
  `regionSum` int(11) DEFAULT NULL,
  PRIMARY KEY (`regionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_select`
--

LOCK TABLES `region_select` WRITE;
/*!40000 ALTER TABLE `region_select` DISABLE KEYS */;
INSERT INTO `region_select` VALUES ('A1','A','马克思、恩格斯著作',NULL),('A2','A','列宁著作',NULL),('A3','A','斯大林著作',NULL),('A4','A','毛泽东著作',NULL),('A49','A','邓小平著作',NULL),('A5','A','马克思、恩格斯、列宁、斯大林、毛泽东、邓小平著作汇编',NULL),('A7','A','马克思、恩格斯、列宁、斯大林、毛泽东、邓小平生平和传记',NULL),('A8','A','马克思主义、列宁主义、毛泽东思想、邓小平理论的学习和研究',NULL),('B0','B','哲学理论',NULL),('B1','B','世界哲学',NULL),('B2','B','中国哲学',NULL),('B3','B','亚洲哲学',NULL),('B4','B','非洲哲学',NULL),('B5','B','欧洲哲学',NULL),('B7','B','美洲哲学',NULL),('B80','B','思维科学',NULL),('B81','B','逻辑学(论理学)',NULL),('B82','B','伦理学(道德哲学)',NULL),('B83','B','美学',NULL),('B84','B','心理学',NULL),('B9','B','宗教',NULL),('C0','C','社会科学理论与方法论',NULL),('C1','C','社会科学现状及发展',NULL),('C2','C','团体、会议、社会科学机构',NULL),('C3','C','社会科学研究方法',NULL),('C4','C','社会科学教育与普及',NULL),('C5','C','社会科学丛书、文集、连续性出版物',NULL),('C6','C','社会科学参考工具书',NULL),('C8','C','统计学',NULL),('C91','C','社会学',NULL),('C92','C','人口学',NULL),('C93','C','管理学',NULL),('C95','C','民族学',NULL),('C96','C','人才学',NULL),('C97','C','劳动科学',NULL),('D0','D','政治理论',NULL),('D1','D','国际共产主义运动',NULL),('D2','D','中国共产党',NULL),('D3','D','各国共产党',NULL),('D4','D','工人、农民、青年、妇女运动与组织',NULL),('D5','D','世界政治',NULL),('D6','D','中国政治',NULL),('D7','D','各国政治',NULL),('D8','D','外交、国际关系',NULL),('D9','D','法律',NULL),('DF','D','法律',NULL),('E0','E','军事理论',NULL),('E1','E','世界军事',NULL),('E2','E','中国军事',NULL),('E8','E','战略学、战役学、战术学',NULL),('E9','E','军事技术',NULL),('E99','E','军事地形学、军事地理学',NULL),('F0','F','经济学',NULL),('F1','F','世界各国经济概况、经济史、经济地理',NULL),('F2','F','经济计划与管理',NULL),('F3','F','农业经济',NULL),('F4','F','工业经济',NULL),('F5','F','交通运输经济',NULL),('F59','F','旅游经济',NULL),('F6','F','邮电经济',NULL),('F7','F','贸易经济',NULL),('F8','F','财政、金融',NULL),('G0','G','文化理论',NULL),('G1','G','世界各国文化与文化事业',NULL),('G2','G','信息与知识传播',NULL),('G3','G','科学、科学研究',NULL),('G4','G','教育',NULL),('G5','G','世界各国教育事业',NULL),('G6','G','各级教育',NULL),('G7','G','各类教育',NULL),('G8','G','体育',NULL),('H0','H','语言学',NULL),('H1','H','汉语',NULL),('H2','H','中国少数民族语言',NULL),('H3','H','常用外国语',NULL),('H4','H','汉藏语系',NULL),('H5','H','阿尔泰语系（突厥-蒙古-通古斯语系）',NULL),('H61','H','南亚语系（渊斯特罗-亚细亚语系）',NULL),('H62','H','南印语系（达罗毗荼语系、德拉维达语系）',NULL),('H63','H','南岛语系（马来亚-玻里尼西亚语系）',NULL),('H65','H','高加索语系（伊比利亚、高加索语系）',NULL),('H66','H','乌拉尔语系(芬兰-乌戈尔语系）',NULL),('H67','H','闪-含语系（阿非罗-亚细亚语系）',NULL),('H7','H','印欧语系',NULL),('H81','H','非洲诸语言',NULL),('H83','H','美洲诸语言',NULL),('H9','H','国际辅助语',NULL),('I0','I','文学理论',NULL),('I1','I','世界文学',NULL),('I2','I','中国文学',NULL),('I3','I','亚洲各国文学',NULL),('I5','I','欧洲各国文学',NULL),('I6','I','大洋洲及太平洋岛屿各国文学',NULL),('I7','I','美洲各国文学',NULL),('J0','J','艺术理论',NULL),('J1','J','世界各国艺术概况',NULL),('J2','J','绘画',NULL),('J29','J','书法、篆刻',NULL),('J3','J','雕塑',NULL),('J4','J','摄影艺术',NULL),('J5','J','工艺美术',NULL),('J6','J','音乐',NULL),('J7','J','舞蹈',NULL),('J8','J','戏剧艺术',NULL),('J9','J','电影、电视艺术',NULL),('K0','K','史学理论',NULL),('K1','K','世界史',NULL),('K2','K','中国史',NULL),('K3','K','亚洲史',NULL),('K4','K','非洲史',NULL),('K5','K','欧洲史',NULL),('K6','K','大洋洲史',NULL),('K7','K','美洲史',NULL),('K81','K','传记',NULL),('K82','K','中国人物传记',NULL),('K83','K','各国人物传记',NULL),('K85','K','文物考古',NULL),('K87','K','中国文物考古',NULL),('K88','K','各国文物考古',NULL),('K89','K','风俗习惯',NULL),('K9','K','地理',NULL),('N0','N','自然科学理论与方法论',NULL),('N1','N','自然科学现状及发展',NULL),('N2','N','自然科学机构、团体、会议',NULL),('N3','N','自然科学研究方法',NULL),('N4','N','自然科学教育与普及',NULL),('N5','N','自然科学丛书、文集、连续性出版物',NULL),('N6','N','自然科学参考工具书',NULL),('N94','N','系统科学',NULL),('O1','O','数学',NULL),('O2','O','数学',NULL),('O3','O','力学',NULL),('O4','O','物理学',NULL),('O5','O','物理学',NULL),('O6','O','化学',NULL),('O7','O','晶体学',NULL),('P1','P','天文学',NULL),('P2','P','测绘学',NULL),('P3','P','地球物理学',NULL),('P4','P','大气科学(气象学)',NULL),('P5','P','地质学',NULL),('P6','P','地质学',NULL),('P7','P','海洋学',NULL),('P9','P','自然地理学',NULL),('Q-0','Q','生物科学的理论与方法',NULL),('Q-3','Q','生物科学的研究方法与技术',NULL),('Q1','Q','普通生物学',NULL),('Q2','Q','细胞学',NULL),('Q3','Q','遗传学',NULL),('Q4','Q','生理学',NULL),('Q5','Q','生物化学',NULL),('Q6','Q','生物物理学',NULL),('Q7','Q','分子生物学',NULL),('Q81','Q','生物工程学(生物技术)',NULL),('Q91','Q','古生物学',NULL),('Q93','Q','微生物学',NULL),('Q94','Q','植物学',NULL),('Q95','Q','动物学',NULL),('Q96','Q','昆虫学',NULL),('Q98','Q','人类学',NULL),('R-0','R','一般理论',NULL),('R1','R','预防医学,卫生学',NULL),('R2','R','中国医学',NULL),('R3','R','基础医学',NULL),('R4','R','临床医学',NULL),('R5','R','内科学',NULL),('R6','R','外科学',NULL),('R71','R','妇产科学',NULL),('R72','R','儿科学',NULL),('R73','R','肿瘤学',NULL),('R74','R','神经病学与精神病学',NULL),('R75','R','皮肤病学与性病学',NULL),('R76','R','耳鼻咽喉科学',NULL),('R77','R','眼科学',NULL),('R78','R','口腔科学',NULL),('R8','R','特种医学',NULL),('R9','R','药学',NULL),('S-0','S','一般性理论',NULL),('S1','S','农业基础科学',NULL),('S2','S','农业工程',NULL),('S3','S','农学(农艺学)',NULL),('S4','S','植物保护',NULL),('S5','S','农作物',NULL),('S6','S','园艺',NULL),('S7','S','林业',NULL),('S8','S','畜牧、动物医学、狩猎、蚕、蜂',NULL),('S9','S','水产、渔业',NULL),('T-0','T','工业技术理论',NULL),('T-1','T','工业技术现状与发展',NULL),('T-2','T','机构、团体、会议',NULL),('T-6','T','参考工具书',NULL),('TB','T','一般工业技术',NULL),('TD','T','矿业工程',NULL),('TE','T','石油、天然气工业',NULL),('TF','T','冶金工业',NULL),('TG','T','金属学与金属工艺',NULL),('TH','T','机械、仪表工业',NULL),('TJ','T','武器工业',NULL),('TK','T','能源与动力工程',NULL),('TL','T','原子能技术',NULL),('TM','T','电子技术',NULL),('TN','T','无线电电子学、电信技术',NULL),('TP','T','自动化技术、计算机技术',NULL),('TQ','T','化学工业',NULL),('TS','T','轻工业、手工业',NULL),('TU','T','建筑科学',NULL),('TV','T','水利工程',NULL),('U1','U','综合运输',NULL),('U2','U','铁路运输',NULL),('U4','U','公路运输',NULL),('U6','U','水路运输',NULL),('V1','V','航空,航天技术的研究与探索',NULL),('V2','V','航空',NULL),('V3','V','航空',NULL),('V4','V','航天(宇宙航行)',NULL),('V5','V','航天(宇宙飞行)',NULL),('X-6','X','环境保护保护参考工具书',NULL),('X1','X','环境科学基础理论',NULL),('X2','X','社会与环境',NULL),('X3','X','环境保护管理',NULL),('X4','X','灾害及其防治',NULL),('X5','X','环境污染及其防治',NULL),('X7','X','废物处理与综合利用',NULL),('X8','X','环境质量评价与环境监测',NULL),('X9','X','安全科学',NULL),('Z1','Z','丛书',NULL),('Z2','Z','百科全书、类书',NULL),('Z3','Z','辞典',NULL),('Z4','Z','论文集、全集、选集、杂著',NULL),('Z5','Z','年鉴,年刊',NULL),('Z8','Z','图书目录、文摘、索引',NULL);
/*!40000 ALTER TABLE `region_select` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-11 23:58:20
