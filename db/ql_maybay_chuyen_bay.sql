-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: ql_maybay
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `chuyen_bay`
--

DROP TABLE IF EXISTS `chuyen_bay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chuyen_bay` (
  `machuyenbay` int NOT NULL AUTO_INCREMENT,
  `trangthai` tinyint(1) DEFAULT '0',
  `mamaybay` int NOT NULL,
  `matuyen` int NOT NULL,
  PRIMARY KEY (`machuyenbay`),
  KEY `mamaybay` (`mamaybay`),
  KEY `matuyen` (`matuyen`),
  CONSTRAINT `chuyen_bay_ibfk_1` FOREIGN KEY (`mamaybay`) REFERENCES `may_bay` (`mamaybay`),
  CONSTRAINT `chuyen_bay_ibfk_2` FOREIGN KEY (`matuyen`) REFERENCES `tuyen_bay` (`matuyenbay`),
  CONSTRAINT `chuyen_bay_chk_1` CHECK ((`trangthai` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuyen_bay`
--

LOCK TABLES `chuyen_bay` WRITE;
/*!40000 ALTER TABLE `chuyen_bay` DISABLE KEYS */;
INSERT INTO `chuyen_bay` VALUES (1,0,1,2),(2,0,1,3),(3,0,1,6),(4,0,1,1),(5,0,2,1),(6,0,2,3),(7,0,2,4),(8,0,2,5),(9,0,2,6),(10,0,2,7),(11,0,3,1),(12,0,3,5),(13,0,3,7);
/*!40000 ALTER TABLE `chuyen_bay` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-21 21:17:35
