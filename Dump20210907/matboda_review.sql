-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: matboda
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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (56,'asdf1234',8,'홍길동','aaa','2021-09-03 12:21:46','2021-09-03 12:21:46',0,0,3.8,4,3,5,3,4),(57,'asdf1234',8,'홍길동','aa','2021-09-03 12:39:45','2021-09-03 12:39:45',0,0,2.8,4,3,2,3,2),(58,'asdf1234',8,'홍길동','wwwww','2021-09-03 12:58:06','2021-09-03 12:58:06',0,0,3.2,5,4,2,3,2),(59,'asdf1234',8,'홍길동','그닥','2021-09-03 14:19:24','2021-09-03 14:19:24',0,0,2.8,4,4,2,1,3),(60,'asd',9,'중2병','ㄴㄴㄴ','2021-09-03 14:27:14','2021-09-03 14:27:14',0,0,3.8,5,5,3,4,2),(61,'qwer1234',8,'강낭콩','너무 맛있습니다','2021-09-03 16:28:32','2021-09-03 16:28:32',0,0,4.2,5,4,5,3,4),(100,'asd',8,'중2병','ㅈㄷㄱㄷㅈㄱㄷㅈㄱ','2021-09-06 15:24:06','2021-09-06 15:24:06',0,0,5,5,5,5,5,5),(102,'asd',8,'중2병','ㅈㅇㅈㅈㅇ','2021-09-06 15:37:31','2021-09-06 15:37:31',0,0,4,4,5,5,3,3),(103,'asd',8,'중2병','2323','2021-09-06 15:47:42','2021-09-06 15:47:42',0,0,3.8,4,3,4,4,4),(104,'asd',8,'중2병','ssddwdw','2021-09-06 16:03:55','2021-09-06 16:03:55',0,0,3.6,4,4,4,3,3),(105,'asd',9,'중2병','ㅈㅇㅈㅇ','2021-09-07 11:22:12','2021-09-07 11:22:12',0,0,4,3,5,5,2,5),(106,'asd',8,'중2병','ㄴㅇㅈㅇㅈㅇ','2021-09-07 11:24:00','2021-09-07 11:24:00',0,0,3.4,4,3,4,2,4),(107,'asd',9,'중2병','ㅇㅈㅇㅈㅇ','2021-09-07 11:24:16','2021-09-07 11:24:16',0,0,3.8,4,3,4,5,3),(108,'asd',9,'중2병','2323','2021-09-07 11:39:01','2021-09-07 11:39:01',0,0,4.2,5,5,3,3,5);
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

-- Dump completed on 2021-09-07 17:49:27
