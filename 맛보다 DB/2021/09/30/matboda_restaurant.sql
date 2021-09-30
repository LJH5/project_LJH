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
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `rt_num` int NOT NULL AUTO_INCREMENT,
  `rt_name` varchar(45) NOT NULL,
  `rt_address` varchar(255) NOT NULL,
  `rt_phoneNum` varchar(255) NOT NULL,
  `rt_type` varchar(255) NOT NULL,
  `rt_openTime` varchar(50) NOT NULL,
  `rt_me_id` varchar(15) DEFAULT NULL,
  `rt_regDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rt_upDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rt_score` float DEFAULT '0',
  `rt_reNum` int NOT NULL DEFAULT '0',
  `rt_view` int NOT NULL DEFAULT '0',
  `rt_faNum` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`rt_num`),
  KEY `rt_me_id_idx` (`rt_me_id`),
  CONSTRAINT `rt_me_id` FOREIGN KEY (`rt_me_id`) REFERENCES `member` (`me_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (14,'음식점 1','서울 강남구 압구정로 102  (신사동)','02-232-2323','분식','00:00 ~ 00:00','asd','2021-09-09 17:14:51','2021-09-27 00:00:00',3.3,7,1012,2),(16,'한식','서울 강남구 자곡로 16 (세곡동)','02-555-5555','한식','06:30 ~ 06:30','asd','2021-09-27 09:46:47','2021-09-27 00:00:00',3.8,1,69,1),(17,'치킨','서울 강서구 강서로 251 (내발산동)','02-111-1111','치킨','00:00 ~ 24:00','asd','2021-09-27 09:50:18','2021-09-27 09:50:18',4,15,179,2),(18,'한식2','경기 평택시 포승읍 2함대길 40','02-333-3333','한식','00:00 ~ 24:00','asd','2021-09-27 11:25:08','2021-09-27 11:25:08',0,0,2,0),(19,'토담순대','충북 청주시 서원구 원흥로100번길 27-22 (산남동)','043-295-9635','한식','11:00 ~ 22:00','asd','2021-09-28 12:46:47','2021-09-28 12:46:47',5,1,33,1);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
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
