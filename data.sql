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
-- Table structure for table `gia_ve`
--

DROP TABLE IF EXISTS `gia_ve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gia_ve` (
  `machuyenbay` int NOT NULL,
  `maloaive` int NOT NULL,
  `giave` decimal(11,2) NOT NULL,
  PRIMARY KEY (`machuyenbay`,`maloaive`),
  KEY `maloaive` (`maloaive`),
  CONSTRAINT `gia_ve_ibfk_1` FOREIGN KEY (`machuyenbay`) REFERENCES `lich_chuyen_bay` (`machuyenbay`),
  CONSTRAINT `gia_ve_ibfk_2` FOREIGN KEY (`maloaive`) REFERENCES `loai_ve` (`maloaive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gia_ve`
--

LOCK TABLES `gia_ve` WRITE;
/*!40000 ALTER TABLE `gia_ve` DISABLE KEYS */;
INSERT INTO `gia_ve` VALUES (1,1,200.00),(1,2,120.00);
/*!40000 ALTER TABLE `gia_ve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lich_chuyen_bay`
--

DROP TABLE IF EXISTS `lich_chuyen_bay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lich_chuyen_bay` (
  `machuyenbay` int NOT NULL AUTO_INCREMENT,
  `masanbaycatcanh` int NOT NULL,
  `masanbayhacanh` int NOT NULL,
  `ngaykhoihanh` datetime NOT NULL,
  `thoigianbay` int NOT NULL,
  `soluongghehang1` int NOT NULL,
  `soluongghehang2` int NOT NULL,
  PRIMARY KEY (`machuyenbay`),
  KEY `masanbaycatcanh` (`masanbaycatcanh`),
  KEY `masanbayhacanh` (`masanbayhacanh`),
  CONSTRAINT `lich_chuyen_bay_ibfk_1` FOREIGN KEY (`masanbaycatcanh`) REFERENCES `san_bay` (`masanbay`),
  CONSTRAINT `lich_chuyen_bay_ibfk_2` FOREIGN KEY (`masanbayhacanh`) REFERENCES `san_bay` (`masanbay`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lich_chuyen_bay`
--

LOCK TABLES `lich_chuyen_bay` WRITE;
/*!40000 ALTER TABLE `lich_chuyen_bay` DISABLE KEYS */;
INSERT INTO `lich_chuyen_bay` VALUES (1,1,2,'2021-01-01 00:00:00',120,10,30),(2,2,3,'2021-01-01 00:00:00',100,15,30);
/*!40000 ALTER TABLE `lich_chuyen_bay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_ve`
--

DROP TABLE IF EXISTS `loai_ve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loai_ve` (
  `maloaive` int NOT NULL AUTO_INCREMENT,
  `tenloaive` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maloaive`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_ve`
--

LOCK TABLES `loai_ve` WRITE;
/*!40000 ALTER TABLE `loai_ve` DISABLE KEYS */;
INSERT INTO `loai_ve` VALUES (1,'loại 1'),(2,'loại 2');
/*!40000 ALTER TABLE `loai_ve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoi_dung`
--

DROP TABLE IF EXISTS `nguoi_dung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoi_dung` (
  `manguoidung` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cmnd` int NOT NULL,
  `sdt` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diachi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gioitinh` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`manguoidung`),
  CONSTRAINT `nguoi_dung_chk_1` CHECK ((`gioitinh` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoi_dung`
--

LOCK TABLES `nguoi_dung` WRITE;
/*!40000 ALTER TABLE `nguoi_dung` DISABLE KEYS */;
INSERT INTO `nguoi_dung` VALUES (1,'admin',123123,'123123123','askdnkaj','asdbh',1),(2,'dong',12,'12','asd','sd',0);
/*!40000 ALTER TABLE `nguoi_dung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `san_bay`
--

DROP TABLE IF EXISTS `san_bay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `san_bay` (
  `masanbay` int NOT NULL AUTO_INCREMENT,
  `tensanbay` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diadiem` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`masanbay`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `san_bay`
--

LOCK TABLES `san_bay` WRITE;
/*!40000 ALTER TABLE `san_bay` DISABLE KEYS */;
INSERT INTO `san_bay` VALUES (1,'tân sơn nhất','hcm'),(2,'nội bài','hn'),(3,'sân bay đà nẵng','dn');
/*!40000 ALTER TABLE `san_bay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `san_bay_trung_gian`
--

DROP TABLE IF EXISTS `san_bay_trung_gian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `san_bay_trung_gian` (
  `masanbay` int NOT NULL,
  `machuyenbay` int NOT NULL,
  `thoigiandung` datetime NOT NULL,
  PRIMARY KEY (`masanbay`,`machuyenbay`),
  KEY `machuyenbay` (`machuyenbay`),
  CONSTRAINT `san_bay_trung_gian_ibfk_1` FOREIGN KEY (`masanbay`) REFERENCES `san_bay` (`masanbay`),
  CONSTRAINT `san_bay_trung_gian_ibfk_2` FOREIGN KEY (`machuyenbay`) REFERENCES `lich_chuyen_bay` (`machuyenbay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `san_bay_trung_gian`
--

LOCK TABLES `san_bay_trung_gian` WRITE;
/*!40000 ALTER TABLE `san_bay_trung_gian` DISABLE KEYS */;
/*!40000 ALTER TABLE `san_bay_trung_gian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tai_khoan`
--

DROP TABLE IF EXISTS `tai_khoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tai_khoan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tentaikhoan` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matkhau` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `loaitaikhoan` enum('ADMIN','NHANVIEN') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manguoidung` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manguoidung` (`manguoidung`),
  CONSTRAINT `tai_khoan_ibfk_1` FOREIGN KEY (`manguoidung`) REFERENCES `nguoi_dung` (`manguoidung`),
  CONSTRAINT `tai_khoan_chk_1` CHECK ((`active` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tai_khoan`
--

LOCK TABLES `tai_khoan` WRITE;
/*!40000 ALTER TABLE `tai_khoan` DISABLE KEYS */;
INSERT INTO `tai_khoan` VALUES (1,'admin','202cb962ac59075b964b07152d234b70',1,'ADMIN',1),(2,'dong','202cb962ac59075b964b07152d234b70',1,'NHANVIEN',2);
/*!40000 ALTER TABLE `tai_khoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ve_may_bay`
--

DROP TABLE IF EXISTS `ve_may_bay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ve_may_bay` (
  `mave` int NOT NULL AUTO_INCREMENT,
  `ngaykhoitao` datetime NOT NULL,
  `trangthai` enum('DATHANHTOAN','DADAT') COLLATE utf8mb4_unicode_ci NOT NULL,
  `gia` decimal(11,2) NOT NULL,
  `giamgia` float DEFAULT NULL,
  `maloaive` int NOT NULL,
  `machuyenbay` int NOT NULL,
  `manguoidung` int NOT NULL,
  PRIMARY KEY (`mave`),
  KEY `maloaive` (`maloaive`),
  KEY `machuyenbay` (`machuyenbay`),
  KEY `manguoidung` (`manguoidung`),
  CONSTRAINT `ve_may_bay_ibfk_1` FOREIGN KEY (`maloaive`) REFERENCES `loai_ve` (`maloaive`),
  CONSTRAINT `ve_may_bay_ibfk_2` FOREIGN KEY (`machuyenbay`) REFERENCES `lich_chuyen_bay` (`machuyenbay`),
  CONSTRAINT `ve_may_bay_ibfk_3` FOREIGN KEY (`manguoidung`) REFERENCES `nguoi_dung` (`manguoidung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ve_may_bay`
--

LOCK TABLES `ve_may_bay` WRITE;
/*!40000 ALTER TABLE `ve_may_bay` DISABLE KEYS */;
/*!40000 ALTER TABLE `ve_may_bay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ql_maybay'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-01 11:28:44
