-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: matboda
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `re_num` int NOT NULL AUTO_INCREMENT,
  `re_me_id` varchar(15) NOT NULL,
  `re_rt_num` int NOT NULL,
  `re_me_nickname` varchar(20) NOT NULL,
  `re_content` longtext NOT NULL,
  `re_regDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `re_upDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `re_report` int NOT NULL DEFAULT '0',
  `re_recommend` int NOT NULL DEFAULT '0',
  `re_totalSc` float NOT NULL DEFAULT '1',
  `re_service` int NOT NULL DEFAULT '1',
  `re_mood` int NOT NULL DEFAULT '1',
  `re_tasty` int NOT NULL DEFAULT '1',
  `re_quantity` int NOT NULL DEFAULT '1',
  `re_clean` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`re_num`),
  KEY `re_rt_num_idx` (`re_rt_num`),
  KEY `re_me_id_idx` (`re_me_id`),
  CONSTRAINT `re_me_id` FOREIGN KEY (`re_me_id`) REFERENCES `member` (`me_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `re_rt_num` FOREIGN KEY (`re_rt_num`) REFERENCES `restaurant` (`rt_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (148,'asdf1234',14,'홍길동','ㅋㅋㅋㅋ','2021-09-13 16:20:15','2021-09-13 16:20:15',0,0,5,5,5,5,5,1),(149,'asdf1234',14,'홍길동','1점','2021-09-13 16:21:56','2021-09-13 16:21:56',0,0,1,1,1,1,1,1),(153,'asd',16,'중2병','ㄴㄴㅇㄴㅇ','2021-09-27 09:49:33','2021-09-27 09:49:33',0,0,3.8,5,4,4,3,3),(157,'asd',14,'중2병','맛보다 못보다','2021-09-28 11:56:22','2021-09-28 11:56:22',0,0,2.8,3,3,3,2,3),(158,'asd',14,'중2병','ㄷㄹㄷㄹㄷㄹㄷㄹㄹ','2021-09-28 11:56:29','2021-09-28 11:56:29',1,0,3.6,3,4,4,4,3),(171,'qwer1234',14,'강낭콩','wdwd','2021-09-30 11:04:10','2021-09-30 11:04:10',0,0,4.4,5,5,4,4,4),(172,'asd',17,'중2병','www','2021-09-30 11:07:58','2021-09-30 11:07:58',0,0,4.4,4,5,5,4,4),(175,'asd',17,'중2병','그닥','2021-10-06 12:51:09','2021-10-06 12:51:09',0,0,2.2,3,1,1,2,4),(178,'asd',19,'중2병','wqewqe','2021-10-06 12:56:22','2021-10-06 12:56:22',0,0,2.6,4,1,2,1,5),(179,'asdf1234',20,'홍길동','맛있어요','2021-10-06 14:04:01','2021-10-06 14:04:01',0,0,3,5,4,2,1,3),(181,'asd',20,'중2병','일식','2021-10-06 14:23:26','2021-10-06 14:23:26',0,0,5,5,5,5,5,5),(182,'asd',18,'중2병','ㅇ','2021-10-06 14:30:25','2021-10-06 14:30:25',0,0,3.2,4,4,3,2,3),(184,'asd',21,'중2병','ㅓㅑㅕ','2021-10-06 14:51:16','2021-10-06 14:51:16',0,0,4,5,5,4,3,3),(185,'asdf1234',14,'홍길동','맛있어요','2021-10-06 15:27:43','2021-10-06 15:27:43',1,1,5,5,5,5,5,5);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-06 16:04:22
