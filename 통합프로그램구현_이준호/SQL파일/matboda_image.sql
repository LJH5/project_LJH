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
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'Q&A','27','/2021/08/11/bf1c0555-c417-4346-bc53-4176b71ab79a_cat.jfif','cat.jfif'),(9,'Q&A','40','/2021/08/13/2a293242-65b5-41c5-9736-babc74445bfb_자동로그인 순서.txt','자동로그인 순서.txt'),(11,'Q&A','41','/2021/08/13/54ef9a42-2c8d-459a-9fdf-bcb01c73628f_페이지네이션 추가 순서.txt','페이지네이션 추가 순서.txt'),(12,'REQUEST','43','/2021/08/23/5b251657-3c99-483d-bb10-0ffb33a45bbd_음식점 기본 이미지.PNG','음식점 기본 이미지.PNG'),(13,'REQUEST','44','/2021/08/24/a7da9905-4555-491d-964d-98132b83677b_프리드리히 니체.jpg','프리드리히 니체.jpg'),(14,'REQUEST','46','/2021/09/01/7ff8f63d-d5f5-496c-849e-e4b3d46cccf8_프로필사진(기본).png','프로필사진(기본).png'),(149,'REVIEW','151','/2021/09/16/0a649e6d-9d84-4ea3-adc4-834f7e9a3e09_음식점 기본 이미지.PNG','음식점 기본 이미지.PNG'),(164,'Q&A','55','/2021/09/30/82469687-e23a-4511-84b0-2fc6c029231b_프로필사진(기본).png','프로필사진(기본).png'),(166,'REVIEW','172','/2021/10/06/f296287a-83d1-4672-8bc9-7fe940612a9e_치킨1.jpg','치킨1.jpg'),(167,'REVIEW','172','/2021/10/06/18e65470-b82b-4149-974d-6b1f970f11b7_치킨2.jpg','치킨2.jpg'),(168,'REVIEW','172','/2021/10/06/1f516302-9ffd-451e-b251-0137f6b84320_치킨3.jpg','치킨3.jpg'),(177,'REVIEW','158','/2021/10/06/a7856e73-48b4-4b0c-9bdd-2d0200b282ef_분식2.jpg','분식2.jpg'),(178,'REVIEW','157','/2021/10/06/b2c0117d-a699-48ea-919b-732605704af5_분식5.jpg','분식5.jpg'),(180,'REVIEW','157','/2021/10/06/c1d7aa08-d5ab-463b-9e83-65c028b09e97_분식4.jpg','분식4.jpg'),(181,'REVIEW','157','/2021/10/06/7019e33a-b5e5-41f3-9408-b699257e5e3e_분식1.jpg','분식1.jpg'),(182,'REVIEW','178','/2021/10/06/70a7ab1d-1617-4859-b6f5-03cd9cf5534a_한식4.jpg','한식4.jpg'),(183,'REVIEW','181','/2021/10/06/e3c0cc18-3ad7-4b18-a6be-4a9d77fa35c8_일식1.jpg','일식1.jpg'),(184,'REVIEW','181','/2021/10/06/5b8dd1f2-4a8d-46a7-9a1a-cc10068cc858_일식3.jpg','일식3.jpg'),(185,'REVIEW','181','/2021/10/06/2cad48d2-b3b1-4f8c-9949-9f4b969e297d_일식2.jpg','일식2.jpg'),(186,'REVIEW','181','/2021/10/06/a381ae9d-4e41-4b1e-8a6b-adb4c40c250a_일식5.jpg','일식5.jpg'),(187,'REVIEW','182','/2021/10/06/0938f8b5-a665-4db9-9739-e95778c0ac8d_한식1.jpg','한식1.jpg'),(188,'REVIEW','182','/2021/10/06/7a6b0d93-f294-4791-98dd-ab5f43d43f85_한식5.jpg','한식5.jpg'),(189,'REVIEW','153','/2021/10/06/314337c2-2712-4d1c-8d6b-33f5684c5693_한식3.jpg','한식3.jpg'),(195,'REVIEW','185','/2021/10/06/53d9af87-e847-4742-8f33-bf08dcbe1f2d_한식5.jpg','한식5.jpg'),(196,'REVIEW','185','/2021/10/06/11ae24b7-0c03-4221-83b9-22e7ecb543e0_한식4.jpg','한식4.jpg'),(197,'REVIEW','185','/2021/10/06/0275a8fe-dc60-4b09-aac0-b8c37ad38a3b_한식5.jpg','한식5.jpg');
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

-- Dump completed on 2021-10-06 16:04:21
