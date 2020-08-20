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
-- Table structure for table `so_cho_ngoi`
--

DROP TABLE IF EXISTS `so_cho_ngoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_cho_ngoi` (
  `machuyenbay` int NOT NULL,
  `maloaive` int NOT NULL,
  `soluong` int NOT NULL,
  `giave` decimal(11,2) NOT NULL,
  PRIMARY KEY (`machuyenbay`,`maloaive`),
  KEY `maloaive` (`maloaive`),
  CONSTRAINT `so_cho_ngoi_ibfk_1` FOREIGN KEY (`machuyenbay`) REFERENCES `chuyen_bay` (`machuyenbay`),
  CONSTRAINT `so_cho_ngoi_ibfk_2` FOREIGN KEY (`maloaive`) REFERENCES `loai_ve` (`maloaive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `so_cho_ngoi`
--

LOCK TABLES `so_cho_ngoi` WRITE;
/*!40000 ALTER TABLE `so_cho_ngoi` DISABLE KEYS */;
INSERT INTO `so_cho_ngoi` VALUES (1,1,30,100.00),(1,2,20,80.00),(2,1,50,70.00),(2,2,40,110.00),(3,1,32,213.00),(3,2,12,47.00),(4,1,52,53.00),(4,2,15,78.00),(5,1,75,200.00),(5,2,23,111.00),(6,1,43,242.00),(6,2,25,454.00),(7,1,12,442.00),(7,2,46,532.00),(8,1,75,246.00),(8,2,18,378.00),(9,1,37,352.00),(9,2,20,473.00),(10,1,30,567.00),(10,2,60,435.00),(11,1,30,245.00),(11,2,13,268.00),(12,1,21,279.00),(12,2,34,133.00),(13,1,14,467.00),(13,2,65,573.00);
/*!40000 ALTER TABLE `so_cho_ngoi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-19  9:24:50
