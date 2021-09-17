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
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `me_id` varchar(15) NOT NULL,
  `me_pw` varchar(255) NOT NULL,
  `me_nickname` varchar(20) NOT NULL,
  `me_picture` varchar(255) DEFAULT NULL,
  `me_name` varchar(45) NOT NULL,
  `me_email` varchar(45) NOT NULL,
  `me_phoneNum` varchar(13) NOT NULL,
  `me_gender` varchar(1) NOT NULL DEFAULT 'N',
  `me_authority` varchar(45) NOT NULL DEFAULT 'USER',
  `me_sessionId` varchar(255) DEFAULT NULL,
  `me_sessionLimit` varchar(45) DEFAULT NULL,
  `me_signupDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`me_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('asd','$2a$10$QOuPG9.Xp21te2q04LAWde75HHmGwNr9lq7mi.o.BmvBtQacLBDpK','중2병','/2021/09/03/a1aa2aaf-5e87-4473-85bb-196e8065cd34_프리드리히 니체.jpg','asd','asd@asd','01012345678','M','SUPER ADMIN','none','2021-09-07 15:04:49.868','2021-08-09 10:28:27'),('asdf1234','$2a$10$tHqBc9aIt09/5S2ERQYi/utPUh/M4LOXtzMMCwAsvJFDqXZuWN0cK','홍길동','/2021/09/03/9db68e1e-35b8-4a3e-aca6-4226f1ae3610_프로필사진(기본).png','홍길동','asdf@asdf.com','01012345679','M','USER','none','2021-09-03 16:20:24.915','2021-08-09 15:21:17'),('qwef123','$2a$10$U13FcBuXiQYgSY.NeaPQG.3iZzxH3mIb8dAbtnHoMlZAotx2ygmiq','장비',NULL,'장비','rhksdn@rhkeresdn.com','01022223333','M','ADMIN','','','2021-08-10 11:40:45'),('qwer1234','$2a$10$NnDyBgxoue3LCZ50eVLabuUAtBInMT3WsnDYuPvQkqVRdeIr4gg1u','강낭콩','/2021/09/03/c1ed39ab-ea08-4429-98e7-8cdf6a2d3af3_starrate.png','제갈량','qwer1234@qwer.com','01022222222','M','USER','none','2021-08-24 16:44:42.59','2021-08-09 15:21:17');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-07 17:49:27
