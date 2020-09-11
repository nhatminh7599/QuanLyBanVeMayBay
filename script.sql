-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: ql_maybay
-- ------------------------------------------------------
-- Server version	8.0.21
use ql_maybay;
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
  `soghetrong` int NOT NULL,
  `soghedat` int NOT NULL,
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
INSERT INTO `gia_ve` VALUES (1,1,220000.00,20,10),(1,2,300500.00,10,10),(2,1,150000.00,10,15),(2,2,200000.00,10,20);
/*!40000 ALTER TABLE `gia_ve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khach_hang`
--

DROP TABLE IF EXISTS `khach_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khach_hang` (
  `makhachhang` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cmnd` int NOT NULL,
  `sdt` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gioitinh` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`makhachhang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khach_hang`
--

LOCK TABLES `khach_hang` WRITE;
/*!40000 ALTER TABLE `khach_hang` DISABLE KEYS */;
/*!40000 ALTER TABLE `khach_hang` ENABLE KEYS */;
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
  `thoigianbay` int DEFAULT NULL,
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
INSERT INTO `lich_chuyen_bay` VALUES (1,1,2,'2020-11-02 00:00:00',120,30,20),(2,1,3,'2020-12-24 00:00:00',180,25,30);
/*!40000 ALTER TABLE `lich_chuyen_bay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_tai_khoan`
--

DROP TABLE IF EXISTS `loai_tai_khoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loai_tai_khoan` (
  `maloai` int NOT NULL AUTO_INCREMENT,
  `tenloai` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maloai`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_tai_khoan`
--

LOCK TABLES `loai_tai_khoan` WRITE;
/*!40000 ALTER TABLE `loai_tai_khoan` DISABLE KEYS */;
INSERT INTO `loai_tai_khoan` VALUES (1,'ADMIN'),(2,'NHANVIEN');
/*!40000 ALTER TABLE `loai_tai_khoan` ENABLE KEYS */;
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
INSERT INTO `loai_ve` VALUES (1,'Hạng 1'),(2,'Hạng 2');
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
INSERT INTO `nguoi_dung` VALUES (1,'minh',1231,'12300','3123123@gmail.com','124',1),(2,'admin',123,'2133','admin@mail.com','12',0);
/*!40000 ALTER TABLE `nguoi_dung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quy_dinh`
--

DROP TABLE IF EXISTS `quy_dinh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quy_dinh` (
  `maquydinh` int NOT NULL AUTO_INCREMENT,
  `noidung` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `manguoidung` int NOT NULL,
  PRIMARY KEY (`maquydinh`),
  KEY `manguoidung` (`manguoidung`),
  CONSTRAINT `quy_dinh_ibfk_1` FOREIGN KEY (`manguoidung`) REFERENCES `nguoi_dung` (`manguoidung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quy_dinh`
--

LOCK TABLES `quy_dinh` WRITE;
/*!40000 ALTER TABLE `quy_dinh` DISABLE KEYS */;
/*!40000 ALTER TABLE `quy_dinh` ENABLE KEYS */;
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
INSERT INTO `san_bay` VALUES (1,'Tân Sơn Nhất','TP HCM'),(2,'Nội Bài','Hà Nội'),(3,'Quốc tế ĐN','Đà Nẵng');
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
  `thoigiandung` int DEFAULT NULL,
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
INSERT INTO `san_bay_trung_gian` VALUES (2,2,20),(3,1,10);
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
  `maloai` int DEFAULT NULL,
  `manguoidung` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `maloai` (`maloai`),
  KEY `manguoidung` (`manguoidung`),
  CONSTRAINT `tai_khoan_ibfk_1` FOREIGN KEY (`maloai`) REFERENCES `loai_tai_khoan` (`maloai`),
  CONSTRAINT `tai_khoan_ibfk_2` FOREIGN KEY (`manguoidung`) REFERENCES `nguoi_dung` (`manguoidung`),
  CONSTRAINT `tai_khoan_chk_1` CHECK ((`active` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tai_khoan`
--

LOCK TABLES `tai_khoan` WRITE;
/*!40000 ALTER TABLE `tai_khoan` DISABLE KEYS */;
INSERT INTO `tai_khoan` VALUES (1,'admin','202cb962ac59075b964b07152d234b70',1,1,2),(2,'minh','202cb962ac59075b964b07152d234b70',1,2,1);
/*!40000 ALTER TABLE `tai_khoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trang_thai_ve`
--

DROP TABLE IF EXISTS `trang_thai_ve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trang_thai_ve` (
  `matrangthai` int NOT NULL AUTO_INCREMENT,
  `tentrangthao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`matrangthai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trang_thai_ve`
--

LOCK TABLES `trang_thai_ve` WRITE;
/*!40000 ALTER TABLE `trang_thai_ve` DISABLE KEYS */;
/*!40000 ALTER TABLE `trang_thai_ve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ve_may_bay`
--

DROP TABLE IF EXISTS `ve_may_bay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ve_may_bay` (
  `mave` int NOT NULL AUTO_INCREMENT,
  `ngaykhoitao` datetime DEFAULT NULL,
  `trangthai` tinyint(1) NOT NULL,
  `gia` decimal(11,2) NOT NULL,
  `giamgia` float DEFAULT NULL,
  `maloaive` int NOT NULL,
  `machuyenbay` int NOT NULL,
  `makhachhang` int NOT NULL,
  PRIMARY KEY (`mave`),
  KEY `maloaive` (`maloaive`),
  KEY `machuyenbay` (`machuyenbay`),
  KEY `makhachhang` (`makhachhang`),
  CONSTRAINT `ve_may_bay_ibfk_1` FOREIGN KEY (`maloaive`) REFERENCES `loai_ve` (`maloaive`),
  CONSTRAINT `ve_may_bay_ibfk_2` FOREIGN KEY (`machuyenbay`) REFERENCES `lich_chuyen_bay` (`machuyenbay`),
  CONSTRAINT `ve_may_bay_ibfk_3` FOREIGN KEY (`makhachhang`) REFERENCES `khach_hang` (`makhachhang`),
  CONSTRAINT `ve_may_bay_chk_1` CHECK ((`trangthai` in (0,1)))
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

-- Dump completed on 2020-09-10 20:39:23
