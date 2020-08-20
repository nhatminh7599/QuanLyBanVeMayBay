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
-- Table structure for table `lich_bay`
--

DROP TABLE IF EXISTS `lich_bay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lich_bay` (
  `mahang` int NOT NULL,
  `matuyen` int NOT NULL,
  `ngaycohieuluc` date NOT NULL,
  `ngayhethieuluc` date NOT NULL,
  PRIMARY KEY (`mahang`,`matuyen`),
  KEY `matuyen` (`matuyen`),
  CONSTRAINT `lich_bay_ibfk_1` FOREIGN KEY (`mahang`) REFERENCES `hang` (`mahang`),
  CONSTRAINT `lich_bay_ibfk_2` FOREIGN KEY (`matuyen`) REFERENCES `tuyen_bay` (`matuyenbay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lich_bay`
--

LOCK TABLES `lich_bay` WRITE;
/*!40000 ALTER TABLE `lich_bay` DISABLE KEYS */;
INSERT INTO `lich_bay` VALUES (1,1,'2020-08-15','2021-08-15'),(1,2,'2020-08-15','2021-08-15'),(1,3,'2020-08-15','2021-08-15'),(1,6,'2020-08-15','2021-08-15'),(2,1,'2020-08-15','2021-08-15'),(2,3,'2020-08-15','2021-08-15'),(2,4,'2020-08-15','2021-08-15'),(2,5,'2020-08-15','2021-08-15'),(2,6,'2020-08-15','2021-08-15'),(2,7,'2020-08-15','2021-08-15'),(3,1,'2020-08-15','2021-08-15'),(3,5,'2020-08-15','2021-08-15'),(3,7,'2020-08-15','2021-08-15');
/*!40000 ALTER TABLE `lich_bay` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-19  9:24:51
