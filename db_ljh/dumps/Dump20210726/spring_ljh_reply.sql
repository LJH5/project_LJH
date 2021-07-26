-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: spring_ljh
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
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `rp_num` int NOT NULL AUTO_INCREMENT,
  `rp_bd_num` int NOT NULL,
  `rp_me_id` varchar(15) NOT NULL,
  `rp_content` longtext NOT NULL,
  `rp_valid` varchar(1) NOT NULL DEFAULT 'I',
  `rp_regDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rp_upDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rp_num`),
  KEY `rp_me_id_idx` (`rp_me_id`),
  KEY `rp_bd_num_idx` (`rp_bd_num`),
  CONSTRAINT `rp_bd_num` FOREIGN KEY (`rp_bd_num`) REFERENCES `board` (`num`),
  CONSTRAINT `rp_me_id` FOREIGN KEY (`rp_me_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (1,10,'asd','aswqfqsqfqw','I','2021-07-21 12:10:36','2021-07-21 12:10:36'),(2,13,'asd','asd','I','2021-07-21 15:30:08','2021-07-21 15:30:08'),(3,13,'asd','asd','I','2021-07-21 15:31:59','2021-07-21 15:31:59'),(4,13,'asd','고작 _ 를 -로 써서 에러 난겨?\n','I','2021-07-21 15:33:12','2021-07-21 15:33:12'),(5,13,'asd','wddad','I','2021-07-21 15:53:27','2021-07-21 15:53:27'),(6,13,'asd','adsfsdfawe','I','2021-07-21 16:02:11','2021-07-21 16:02:11'),(7,13,'asd','adsfsdfawe','I','2021-07-21 16:02:15','2021-07-21 16:02:15'),(8,13,'asd','adsfewf','I','2021-07-21 16:02:23','2021-07-21 16:02:23'),(9,13,'asd','asdadaw','I','2021-07-21 16:02:34','2021-07-21 16:02:34'),(10,13,'asd','asdasd','I','2021-07-21 16:04:53','2021-07-21 16:04:53'),(11,13,'asd','안녕하세요','I','2021-07-21 16:05:04','2021-07-21 16:05:04'),(12,15,'asd','등록됨?\n','I','2021-07-22 13:22:08','2021-07-22 13:22:08'),(13,15,'asd','ㅋㅋㅋ 아니 언제 컨트롤 z 눌렀나?','I','2021-07-23 12:21:49','2021-07-23 12:21:49'),(14,15,'asd','','I','2021-07-23 16:12:00','2021-07-23 16:12:00'),(15,15,'asd','asdasd','I','2021-07-23 16:12:04','2021-07-23 16:12:04'),(16,15,'asd','아니 페이지 네이션 서버비\n','I','2021-07-23 16:12:15','2021-07-23 16:12:15'),(17,15,'asd','아니 왜 안되냐고\n','I','2021-07-23 16:13:16','2021-07-23 16:13:16'),(18,15,'asd','안녕','I','2021-07-23 16:46:20','2021-07-23 16:46:20'),(19,15,'asd','ㅂㅈㄷ','I','2021-07-23 16:47:46','2021-07-23 16:47:46'),(20,15,'qwe','등록은 되나?','I','2021-07-25 23:20:52','2021-07-25 23:20:52');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-26 22:13:20
