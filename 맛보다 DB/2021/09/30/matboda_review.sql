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
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (144,'asd',14,'중2병','sdwdwdwdw','2021-09-13 12:00:32','2021-09-13 12:00:32',0,1,3,4,3,2,3,3),(148,'asdf1234',14,'홍길동','ㅋㅋㅋㅋ','2021-09-13 16:20:15','2021-09-13 16:20:15',0,2,5,5,5,5,5,1),(149,'asdf1234',14,'홍길동','1점','2021-09-13 16:21:56','2021-09-13 16:21:56',0,2,1,1,1,1,1,1),(153,'asd',16,'중2병','ㄴㄴㅇㄴㅇ','2021-09-27 09:49:33','2021-09-27 09:49:33',0,0,3.8,5,4,4,3,3),(154,'qwer1234',17,'강낭콩','ㄷㄷ','2021-09-27 10:13:39','2021-09-27 10:13:39',0,1,3,4,3,3,2,3),(155,'asd',17,'중2병','ㅁㅁㅁ','2021-09-27 12:34:41','2021-09-27 12:34:41',0,0,3.4,5,4,3,1,4),(156,'asd',14,'중2병','그럭저럭 맛있네요','2021-09-28 11:56:07','2021-09-28 11:56:07',0,2,3.6,4,3,4,2,5),(157,'asd',14,'중2병','맛보다 못보다','2021-09-28 11:56:22','2021-09-28 11:56:22',0,2,2.8,3,3,3,2,3),(158,'asd',14,'중2병','ㄷㄹㄷㄹㄷㄹㄷㄹㄹ','2021-09-28 11:56:29','2021-09-28 11:56:29',1,0,3.6,3,4,4,4,3),(159,'asd',19,'중2병','니체를 좋아하는 이네씨가 맛있데요','2021-09-28 12:47:36','2021-09-28 12:47:36',0,1,5,5,5,5,5,5),(160,'asd',17,'중2병','22','2021-09-30 09:56:02','2021-09-30 09:56:02',0,0,5,5,5,5,5,5),(161,'asd',17,'중2병','ss','2021-09-30 09:59:56','2021-09-30 09:59:56',0,0,5,5,5,5,5,5),(162,'asd',17,'중2병','w','2021-09-30 10:01:46','2021-09-30 10:01:46',0,0,4.4,5,5,4,3,5),(163,'asd',17,'중2병','w','2021-09-30 10:05:47','2021-09-30 10:05:47',0,0,4.4,5,5,4,3,5),(164,'asd',17,'중2병','ww','2021-09-30 10:05:58','2021-09-30 10:05:58',0,0,4,5,5,3,3,4),(165,'asd',17,'중2병','ww','2021-09-30 10:06:23','2021-09-30 10:06:23',0,0,4,5,5,3,3,4),(166,'asd',17,'중2병','dwdw','2021-09-30 10:07:09','2021-09-30 10:07:09',0,0,3.4,5,4,2,3,3),(167,'asd',17,'중2병','44','2021-09-30 10:07:53','2021-09-30 10:07:53',0,0,3.4,4,3,3,4,3),(168,'asd',17,'중2병','44','2021-09-30 10:08:24','2021-09-30 10:08:24',-1,1,3.4,4,3,3,4,3),(170,'asd',17,'중2병','233242','2021-09-30 10:25:11','2021-09-30 10:25:11',-1,1,5,5,5,5,5,5),(171,'qwer1234',14,'강낭콩','wdwd','2021-09-30 11:04:10','2021-09-30 11:04:10',-1,2,4.4,5,5,4,4,4),(172,'asd',17,'중2병','www','2021-09-30 11:07:58','2021-09-30 11:07:58',0,0,4.4,4,5,5,4,4),(173,'asd',17,'중2병','--','2021-09-30 11:15:24','2021-09-30 11:15:24',0,1,4,4,4,5,4,3),(174,'asdf1234',17,'홍길동','ㅈㅇㅈㅇ','2021-09-30 14:42:17','2021-09-30 14:42:17',0,0,3,4,3,2,3,3);
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

-- Dump completed on 2021-09-30 17:48:56
