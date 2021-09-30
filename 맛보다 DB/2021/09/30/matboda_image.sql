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
  `im_oriName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`im_num`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'Q&A','27','/2021/08/11/bf1c0555-c417-4346-bc53-4176b71ab79a_cat.jfif','cat.jfif'),(9,'Q&A','40','/2021/08/13/2a293242-65b5-41c5-9736-babc74445bfb_자동로그인 순서.txt','자동로그인 순서.txt'),(11,'Q&A','41','/2021/08/13/54ef9a42-2c8d-459a-9fdf-bcb01c73628f_페이지네이션 추가 순서.txt','페이지네이션 추가 순서.txt'),(12,'REQUEST','43','/2021/08/23/5b251657-3c99-483d-bb10-0ffb33a45bbd_음식점 기본 이미지.PNG','음식점 기본 이미지.PNG'),(13,'REQUEST','44','/2021/08/24/a7da9905-4555-491d-964d-98132b83677b_프리드리히 니체.jpg','프리드리히 니체.jpg'),(14,'REQUEST','46','/2021/09/01/7ff8f63d-d5f5-496c-849e-e4b3d46cccf8_프로필사진(기본).png','프로필사진(기본).png'),(144,'REVIEW','144','/2021/09/13/7d99f54a-b3ad-4ce5-afbe-7d75fcbdb7e5_프로필사진(기본).png','프로필사진(기본).png'),(145,'REVIEW','144','/2021/09/13/50b74c99-d5ff-496c-9302-5b4af1bdd832_프리드리히 니체.jpg','프리드리히 니체.jpg'),(146,'REVIEW','144','/2021/09/13/363f9c04-c82a-4b52-a0a8-b7334cbe20eb_음식점 기본 이미지.PNG','음식점 기본 이미지.PNG'),(149,'REVIEW','151','/2021/09/16/0a649e6d-9d84-4ea3-adc4-834f7e9a3e09_음식점 기본 이미지.PNG','음식점 기본 이미지.PNG'),(153,'REVIEW','153','/2021/09/27/e9a81c9a-41fe-4d90-bd80-7bd2507722df_프로필사진(기본).png','프로필사진(기본).png'),(154,'REVIEW','154','/2021/09/27/029707f4-54da-46db-82e6-96349798e671_프리드리히 니체.jpg','프리드리히 니체.jpg'),(155,'REVIEW','153','/2021/09/27/1dd1a501-1813-42cb-a157-45f673e8b960_음식점 기본 이미지.PNG','음식점 기본 이미지.PNG'),(156,'REVIEW','153','/2021/09/27/ed937ea3-2665-436c-9cb9-c7b2c88ac9c8_프리드리히 니체.jpg','프리드리히 니체.jpg'),(157,'REVIEW','153','/2021/09/27/16c4335b-c247-4cd7-bb3c-118b7a04de4f_프로필사진(기본).png','프로필사진(기본).png'),(158,'REVIEW','155','/2021/09/27/e3161b3c-2f19-42e1-bd3e-fc8da06133a2_음식점 기본 이미지.PNG','음식점 기본 이미지.PNG'),(159,'REVIEW','156','/2021/09/28/690e88fd-5ba8-4302-bc2e-11307b28047e_프로필사진(기본).png','프로필사진(기본).png'),(160,'REVIEW','156','/2021/09/28/3a1430bb-551c-41a1-a1a8-2f0fba81e20e_프리드리히 니체.jpg','프리드리히 니체.jpg'),(161,'REVIEW','159','/2021/09/28/b0236cae-c284-42e1-a17d-171cfef74cb4_프리드리히 니체.jpg','프리드리히 니체.jpg'),(164,'Q&A','55','/2021/09/30/82469687-e23a-4511-84b0-2fc6c029231b_프로필사진(기본).png','프로필사진(기본).png'),(165,'REVIEW','174','/2021/09/30/1252352d-995e-4508-ae3a-b8e6ebd8b20e_프로필사진(기본).png','프로필사진(기본).png');
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

-- Dump completed on 2021-09-30 17:48:56
