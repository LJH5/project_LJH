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
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `num` int NOT NULL AUTO_INCREMENT,
  `board` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `state` varchar(1) NOT NULL DEFAULT 'I',
  `ori_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `board_idx` (`board`),
  CONSTRAINT `board` FOREIGN KEY (`board`) REFERENCES `board` (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (1,7,'/2021/07/19/f5c387d5-97d5-4920-a7e6-49cfe538e823_요구사항 명세서3.xlsx','I','요구사항 명세서3.xlsx'),(2,8,'/2021/07/19/b002ee19-424f-4d12-b7ab-d494c21dd3d8_KakaoTalk_20210719_121611273.jpg','D','KakaoTalk_20210719_121611273.jpg'),(3,8,'/2021/07/19/a97ae46d-f227-4af4-a99e-9c45ac07973e_KakaoTalk_20210719_121611273_01.jpg','D','KakaoTalk_20210719_121611273_01.jpg'),(4,8,'/2021/07/19/eab69c3c-d1dd-4d7c-a5a3-95f335da96f9_sketch_nov15a.ino','D','sketch_nov15a.ino'),(5,7,'/2021/07/19/59934b1c-55e8-49fc-9864-058b11159d56_sketch_nov15a.ino','D','sketch_nov15a.ino'),(6,8,'/2021/07/19/1f4d4499-9cdd-402b-8960-a88c70b034be_sketch_nov15a.ino','D','sketch_nov15a.ino'),(7,8,'/2021/07/19/3d0552a5-ec3b-4ea4-9280-30bc918f0cc1_KakaoTalk_20210719_121611273.jpg','I','KakaoTalk_20210719_121611273.jpg');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-02  9:30:17
