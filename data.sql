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
-- Dumping data for table `gia_ve`
--

LOCK TABLES `gia_ve` WRITE;
/*!40000 ALTER TABLE `gia_ve` DISABLE KEYS */;
INSERT INTO `gia_ve` VALUES (1,1,200.00,10,0),(1,2,120.00,30,0);
/*!40000 ALTER TABLE `gia_ve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `khach_hang`
--

LOCK TABLES `khach_hang` WRITE;
/*!40000 ALTER TABLE `khach_hang` DISABLE KEYS */;
INSERT INTO `khach_hang` VALUES (1,'dong',123123123,'098757261','daasdasd','Nam');
/*!40000 ALTER TABLE `khach_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lich_chuyen_bay`
--

LOCK TABLES `lich_chuyen_bay` WRITE;
/*!40000 ALTER TABLE `lich_chuyen_bay` DISABLE KEYS */;
INSERT INTO `lich_chuyen_bay` VALUES (1,1,2,'2021-01-01 00:00:00',120,10,30),(2,2,3,'2021-01-01 00:00:00',100,15,30);
/*!40000 ALTER TABLE `lich_chuyen_bay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `loai_ve`
--

LOCK TABLES `loai_ve` WRITE;
/*!40000 ALTER TABLE `loai_ve` DISABLE KEYS */;
INSERT INTO `loai_ve` VALUES (1,'loại 1'),(2,'loại 2');
/*!40000 ALTER TABLE `loai_ve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `nguoi_dung`
--

LOCK TABLES `nguoi_dung` WRITE;
/*!40000 ALTER TABLE `nguoi_dung` DISABLE KEYS */;
INSERT INTO `nguoi_dung` VALUES (1,'admin',123123,'123123123','askdnkaj','asdbh',1),(2,'dong',12,'12','asd','sd',0);
/*!40000 ALTER TABLE `nguoi_dung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `san_bay`
--

LOCK TABLES `san_bay` WRITE;
/*!40000 ALTER TABLE `san_bay` DISABLE KEYS */;
INSERT INTO `san_bay` VALUES (1,'tân sơn nhất','hcm'),(2,'nội bài','hn'),(3,'sân bay đà nẵng','dn');
/*!40000 ALTER TABLE `san_bay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `san_bay_trung_gian`
--

LOCK TABLES `san_bay_trung_gian` WRITE;
/*!40000 ALTER TABLE `san_bay_trung_gian` DISABLE KEYS */;
INSERT INTO `san_bay_trung_gian` VALUES (1,1,10),(2,1,10);
/*!40000 ALTER TABLE `san_bay_trung_gian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tai_khoan`
--

LOCK TABLES `tai_khoan` WRITE;
/*!40000 ALTER TABLE `tai_khoan` DISABLE KEYS */;
INSERT INTO `tai_khoan` VALUES (1,'admin','202cb962ac59075b964b07152d234b70',1,'ADMIN',1),(2,'dong','202cb962ac59075b964b07152d234b70',1,'NHANVIEN',2);
/*!40000 ALTER TABLE `tai_khoan` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2020-09-02 13:39:17
