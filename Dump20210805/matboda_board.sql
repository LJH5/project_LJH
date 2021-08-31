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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `bo_num` int NOT NULL AUTO_INCREMENT,
  `bo_title` varchar(255) NOT NULL,
  `bo_me_id` varchar(15) NOT NULL,
  `bo_content` longtext NOT NULL,
  `bo_regDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bo_views` int NOT NULL DEFAULT '0',
  `bo_type` varchar(45) NOT NULL DEFAULT 'Q&A',
  PRIMARY KEY (`bo_num`),
  KEY `bo_me_id_idx` (`bo_me_id`),
  CONSTRAINT `bo_me_id` FOREIGN KEY (`bo_me_id`) REFERENCES `member` (`me_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'ㅋㅋㅋㅋ','asdf1234','12341234','2021-08-10 15:34:28',0,'Q&A'),(2,'등록','asd','zzz','2021-08-10 15:34:28',0,'Q&A'),(3,'등록2','asd','문의','2021-08-11 09:31:52',0,'Q&A'),(4,'문의','asd','문의','2021-08-11 09:31:58',0,'Q&A'),(5,'문의사항','asd','문의','2021-08-11 09:32:03',0,'Q&A'),(6,'문의입니다','asd','문의','2021-08-11 09:32:10',0,'Q&A'),(7,'궁금','asd','문의','2021-08-11 09:32:17',0,'Q&A'),(8,'[문의]','asd','문의','2021-08-11 09:32:32',0,'Q&A'),(9,'궁금해요','asd','ㅋㅋㅋ','2021-08-11 09:37:27',0,'Q&A'),(10,'저기요','asd','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ','2021-08-11 09:37:36',0,'Q&A'),(11,'궁금한 게 있어용','asd','','2021-08-11 09:37:54',0,'Q&A'),(12,'궁금함 수정','asd','<p>수정입니다</p><p><img src=\"data:image/jpeg;base64,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\" style=\"width: 50%; float: left;\" data-filename=\"cat.jfif\" class=\"note-float-left\"></p>','2021-08-11 10:11:57',0,'Q&A'),(13,'문의  (수정)','asd','문의','2021-08-11 10:17:04',0,'Q&A'),(14,'등록','asd','ㅋㅋㅋ','2021-08-11 10:17:30',0,'Q&A'),(15,'수정함','asd','ㅋㅋㅋ','2021-08-11 11:38:29',0,'Q&A'),(16,'123231123','asd','<p>ㅈㄷㄹㄷㄹㄷoiopiop</p>','2021-08-11 11:40:13',0,'Q&A'),(18,'weqeq','asd','1221e','2021-08-11 15:48:37',0,'Q&A'),(19,'wqeqwe','asd','21r21e','2021-08-11 15:48:42',3,'Q&A'),(20,'12212f','asd','efwef','2021-08-11 15:50:05',0,'Q&A'),(21,'12312r1','asd','wefwefwef','2021-08-11 15:50:26',1,'Q&A'),(25,'안녕','asd','<p>ㅋㅋㅋㅋ</p>','2021-08-11 16:30:49',0,'Q&A'),(26,'ㅈㄷㅈㄷㅈㅈㄷ','asd','<p>ㅇㅈㅇㅈㅇㅈㅂ</p>','2021-08-11 16:32:17',0,'Q&A'),(27,'문의입니다','asd','<p>ㅈㅇㅈㅂㅇㅂㅇㅂ</p>','2021-08-11 16:36:25',10,'Q&A'),(29,'공지사항입니다','asd','<p>ㄹㄹ</p>','2021-08-13 10:00:09',3,'NOTICE'),(30,'공지사항입니다','asd','<p>ㄹㄹ</p>','2021-08-13 10:00:48',0,'NOTICE'),(31,'공지사항입니다','asd','<p>ㄹㄹ</p>','2021-08-13 10:01:15',1,'NOTICE'),(32,'공지사항입니다','asd','<p>ㄹㄹ</p>','2021-08-13 10:01:18',0,'NOTICE'),(35,'[공지]','asd','<p>공지</p>','2021-08-13 10:23:55',0,'NOTICE'),(36,'등록2','asd','<p>wew</p>','2021-08-13 10:48:20',1,'NOTICE'),(37,'문의입니다','asd','<p>12343r3r2</p>','2021-08-13 10:49:44',8,'Q&A'),(38,'문의','asd','<p>21ㄷ21</p>','2021-08-13 11:21:41',4,'Q&A'),(40,'첨부파일 수정','asd','<p>qwew</p>','2021-08-13 11:54:17',15,'Q&A'),(41,'공지 첨부파일','asd','<p><b>ㅋㅋㅋ</b></p>','2021-08-13 12:06:05',5,'NOTICE'),(42,'문의입니다','asd','<p>z</p>','2021-08-23 10:39:31',8,'REQUEST'),(43,'문의입니다','asd','<p>z</p>','2021-08-23 10:40:07',3,'REQUEST'),(44,'신은 죽었다','asd','나를 죽이지 못하는 고통은 날 더 강하게 만들 뿐이다','2021-08-24 11:35:13',14,'REQUEST');
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

-- Dump completed on 2021-08-27 13:07:51
