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
-- Table structure for table `tuyen_bay`
--

DROP TABLE IF EXISTS `tuyen_bay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tuyen_bay` (
  `matuyenbay` int NOT NULL AUTO_INCREMENT,
  `malotrinh` int NOT NULL,
  `giocatcanh` time NOT NULL,
  `giohacanh` time NOT NULL,
  `masanbaycatcanh` int NOT NULL,
  `masanbayhacanh` int NOT NULL,
  PRIMARY KEY (`matuyenbay`,`malotrinh`),
  KEY `malotrinh` (`malotrinh`),
  KEY `masanbaycatcanh` (`masanbaycatcanh`),
  KEY `masanbayhacanh` (`masanbayhacanh`),
  CONSTRAINT `tuyen_bay_ibfk_1` FOREIGN KEY (`malotrinh`) REFERENCES `lo_trinh` (`malotrinh`),
  CONSTRAINT `tuyen_bay_ibfk_2` FOREIGN KEY (`masanbaycatcanh`) REFERENCES `san_bay` (`masanbay`),
  CONSTRAINT `tuyen_bay_ibfk_3` FOREIGN KEY (`masanbayhacanh`) REFERENCES `san_bay` (`masanbay`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuyen_bay`
--

LOCK TABLES `tuyen_bay` WRITE;
/*!40000 ALTER TABLE `tuyen_bay` DISABLE KEYS */;
INSERT INTO `tuyen_bay` VALUES (1,1,'07:00:00','08:00:00',1,3),(2,1,'08:00:00','09:00:00',3,2),(3,2,'10:00:00','11:00:00',1,3),(4,4,'14:00:00','15:00:00',2,3),(5,4,'15:00:00','16:00:00',3,1),(6,3,'07:00:00','08:00:00',3,1),(7,5,'17:00:00','18:00:00',3,1);
/*!40000 ALTER TABLE `tuyen_bay` ENABLE KEYS */;
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
