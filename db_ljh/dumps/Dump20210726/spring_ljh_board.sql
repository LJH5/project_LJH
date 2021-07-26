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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `num` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `contents` longtext NOT NULL,
  `writer` varchar(15) NOT NULL,
  `registered` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `views` int NOT NULL DEFAULT '0',
  `valid` varchar(1) NOT NULL DEFAULT 'I',
  PRIMARY KEY (`num`),
  KEY `writer_idx` (`writer`),
  CONSTRAINT `writer` FOREIGN KEY (`writer`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'asd','asd','qwe','2021-07-19 09:36:02',1,'I'),(2,'qwe','eqweqwe','qwe','2021-07-19 09:36:11',6,'I'),(3,'asd','asd','asd','2021-07-19 11:20:38',5,'I'),(4,'asd','asasdasdd','asd','2021-07-19 11:24:05',5,'I'),(5,'asdasd','asdasdasdsd','asd','2021-07-19 11:32:59',7,'I'),(6,'qweqweqwe','qweqweqwe','qwe','2021-07-19 11:35:19',3,'I'),(7,'asdasd','asdasd','asd','2021-07-19 12:07:00',18,'I'),(8,'asddaw','qwdqwqwe','asd','2021-07-19 12:51:44',11,'I'),(9,'서머노트 테스트','<h1><font color=\"#000000\" style=\"background-color: rgb(255, 156, 0);\">안녕하삼삼</font></h1>','qwe','2021-07-19 16:19:11',5,'I'),(10,'서머노트 테스트2','<ul><li>1번</li><li>2번</li><li>3번</li><li><a href=\"http://www.naver.com\" target=\"_blank\">네이버</a><a href=\"http://www.naver.com\" target=\"_blank\"></a></li><li>qkdhqk<br><br></li></ul>','qwe','2021-07-19 16:22:58',83,'I'),(11,'연습','<p>ㅁㄴㅇㅁㄴㅇㅁㅇㅈㄷㅂㄷ</p>','qwe','2021-07-19 17:31:48',3,'D'),(12,'ㅈㄷㅈㅂㄷㅈㅂㄷ','<p>ㅂㅈㅇㄹㅈㄷㅁㄴㅇㄻㄴㄷㄹ</p>','qwe','2021-07-19 17:33:00',1,'D'),(13,'asasdsa','<p>dsdas</p>','asd','2021-07-21 11:27:02',127,'I'),(14,'연습','<ul><li><u><b><font color=\"#000000\" style=\"background-color: rgb(255, 255, 0);\">서머노트</font></b></u></li></ul>','asd','2021-07-22 10:40:44',17,'I'),(15,'연습 게시글 등록','<p><b>서머노트 적용 완료</b></p><ul><li><b>적용</b></li><li><b>완료</b></li><li><b>aa</b></li></ul>','asd','2021-07-22 10:48:26',354,'I');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-26 22:13:19
