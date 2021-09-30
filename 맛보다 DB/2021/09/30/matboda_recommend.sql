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
-- Table structure for table `recommend`
--

DROP TABLE IF EXISTS `recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommend` (
  `rc_num` int NOT NULL AUTO_INCREMENT,
  `rc_re_num` int NOT NULL,
  `rc_me_id` varchar(15) NOT NULL,
  `rc_state` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`rc_num`),
  KEY `rc_me_id_idx` (`rc_me_id`),
  KEY `rc_re_num_idx` (`rc_re_num`),
  CONSTRAINT `rc_me_id` FOREIGN KEY (`rc_me_id`) REFERENCES `member` (`me_id`) ON DELETE CASCADE,
  CONSTRAINT `rc_re_num` FOREIGN KEY (`rc_re_num`) REFERENCES `review` (`re_num`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommend`
--

LOCK TABLES `recommend` WRITE;
/*!40000 ALTER TABLE `recommend` DISABLE KEYS */;
INSERT INTO `recommend` VALUES (1,149,'asd',1),(2,148,'asd',1),(3,149,'qwer1234',1),(4,148,'qwer1234',1),(5,144,'qwer1234',-1),(12,144,'asdf1234',1),(13,158,'qwer1234',-1),(14,157,'qwer1234',1),(15,156,'qwer1234',1),(16,154,'asd',1),(17,171,'asd',1),(18,171,'asdf1234',1),(19,173,'asdf1234',1),(20,172,'asdf1234',0),(21,170,'asdf1234',1),(22,168,'asdf1234',1),(23,159,'asdf1234',1),(24,156,'asdf1234',1),(25,157,'asdf1234',1);
/*!40000 ALTER TABLE `recommend` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-30 17:48:55
