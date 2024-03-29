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
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (144,'asd',14,'중2병','sdwdwdwdw','2021-09-13 12:00:32','2021-09-13 12:00:32',0,0,3,4,3,2,3,3),(147,'asd',14,'중2병','ㅋ\r\nㅋ\r\nㅋ\r\nㅋ\r\nㅋ\r\n\r\nㅋ\r\nㅋ\r\nㅋ\r\nㅋ\r\nㅋ\r\nㅋ\r\n','2021-09-13 16:13:04','2021-09-13 16:13:04',0,0,4.8,5,5,4,5,5),(148,'asdf1234',14,'홍길동','ㅋㅋㅋㅋ','2021-09-13 16:20:15','2021-09-13 16:20:15',0,0,5,5,5,5,5,1),(149,'asdf1234',14,'홍길동','1점','2021-09-13 16:21:56','2021-09-13 16:21:56',0,0,1,1,1,1,1,1);
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

-- Dump completed on 2021-09-17 17:35:20
