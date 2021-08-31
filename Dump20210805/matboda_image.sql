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
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `im_num` int NOT NULL AUTO_INCREMENT,
  `im_type` varchar(10) NOT NULL DEFAULT 'Q&A',
  `im_where` varchar(15) NOT NULL,
  `im_name` varchar(255) NOT NULL,
  `im_thumbnail` varchar(1) DEFAULT NULL,
  `im_oriName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`im_num`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'Q&A','27','/2021/08/11/bf1c0555-c417-4346-bc53-4176b71ab79a_cat.jfif',NULL,'cat.jfif'),(9,'Q&A','40','/2021/08/13/2a293242-65b5-41c5-9736-babc74445bfb_자동로그인 순서.txt',NULL,'자동로그인 순서.txt'),(11,'Q&A','41','/2021/08/13/54ef9a42-2c8d-459a-9fdf-bcb01c73628f_페이지네이션 추가 순서.txt',NULL,'페이지네이션 추가 순서.txt'),(12,'REQUEST','43','/2021/08/23/5b251657-3c99-483d-bb10-0ffb33a45bbd_음식점 기본 이미지.PNG',NULL,'음식점 기본 이미지.PNG'),(13,'REQUEST','44','/2021/08/24/a7da9905-4555-491d-964d-98132b83677b_프리드리히 니체.jpg',NULL,'프리드리히 니체.jpg');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-27 13:07:52
