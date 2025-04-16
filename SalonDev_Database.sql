CREATE DATABASE  IF NOT EXISTS `salon_dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `salon_dev`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: salon_dev
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `AppointmentID` int unsigned NOT NULL,
  `AppointmentDateTime` datetime NOT NULL,
  `AppointmentStatusID` int unsigned NOT NULL,
  `CustomerID` int unsigned NOT NULL,
  PRIMARY KEY (`AppointmentID`),
  UNIQUE KEY `AppointmentStatusID_UNIQUE` (`AppointmentStatusID`),
  UNIQUE KEY `CustomerID_UNIQUE` (`CustomerID`),
  CONSTRAINT `AppointmentStatus` FOREIGN KEY (`AppointmentStatusID`) REFERENCES `appointmentstatuslookup` (`AppointmentStatusID`),
  CONSTRAINT `Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentstatuslookup`
--

DROP TABLE IF EXISTS `appointmentstatuslookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointmentstatuslookup` (
  `AppointmentStatusID` int unsigned NOT NULL,
  `AppointmentStatus` varchar(50) NOT NULL,
  PRIMARY KEY (`AppointmentStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentstatuslookup`
--

LOCK TABLES `appointmentstatuslookup` WRITE;
/*!40000 ALTER TABLE `appointmentstatuslookup` DISABLE KEYS */;
INSERT INTO `appointmentstatuslookup` VALUES (1,'Scheduled'),(2,'In Progress'),(3,'Completed'),(4,'Canceled');
/*!40000 ALTER TABLE `appointmentstatuslookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int unsigned NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(25) NOT NULL,
  `LastName` varchar(25) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `PhoneNumber(25)` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Deklan','Boettcher','deklanboettcher@gmail.com','4441115735');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salonservices`
--

DROP TABLE IF EXISTS `salonservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salonservices` (
  `ServiceID` int unsigned NOT NULL AUTO_INCREMENT,
  `ServiceType` varchar(50) NOT NULL,
  `ServiceName` varchar(50) NOT NULL,
  `EstimatedServiceDuration` time NOT NULL,
  `ServicePrice` decimal(5,2) NOT NULL,
  PRIMARY KEY (`ServiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salonservices`
--

LOCK TABLES `salonservices` WRITE;
/*!40000 ALTER TABLE `salonservices` DISABLE KEYS */;
INSERT INTO `salonservices` VALUES (1,'Haircuts','Haircut, Shampoo & Blow Dry','01:30:00',7.00),(2,'Haircuts','Haircut, Shampoo & Thermal Dry','02:00:00',10.00),(3,'Haircuts','Bang, Beard, or Mustache Trim','00:30:00',3.00),(4,'Hands & Feet','Toenail Soak/Clip','00:30:00',5.00),(5,'Hands & Feet','Manicure','01:00:00',10.00),(6,'Hands & Feet','Spa Manicure','01:30:00',12.00),(7,'Hands & Feet','Pedicure','01:30:00',15.00),(8,'Hands & Feet','Spa Pedicure','02:00:00',18.00),(9,'Hands & Feet','Paraffin Dip','00:30:00',5.00),(10,'Hands & Feet','Gel Polish Only','01:30:00',10.00),(11,'Hands & Feet','Manicure (Gel Polish)','02:00:00',18.00),(12,'Hands & Feet','Pedicure (Gel Polish)','02:30:00',23.00),(13,'Hands & Feet','Spa Manicure (Gel Polish)','02:30:00',20.00),(14,'Hands & Feet','Spa Pedicure (Gel Polish)','03:00:00',26.00),(15,'Hands & Feet','Gel Polish Removal','01:00:00',5.00),(16,'Hands & Feet','Nail Art','00:30:00',5.00),(17,'Hands & Feet','Polish Change','00:30:00',0.00),(18,'Color','Ombre/Balayage (Includes Toner)','04:00:00',40.00),(19,'Color','Additional Color or Toner','00:30:00',8.00),(20,'Color','All Over Color (Short)','04:00:00',25.00),(21,'Color','All Over Color (Long)','04:00:00',30.00),(22,'Color','Double Process Color (Short)','04:00:00',35.00),(23,'Color','Double Process Color (Long)','04:00:00',45.00),(24,'Color','Retouch','04:00:00',20.00),(25,'Color','Highlight/Lowlight (Short)','04:00:00',35.00),(26,'Color','Highlight/Lowlight (Long)','04:00:00',40.00),(27,'Color','Partial Foil (Half-Head)','03:00:00',30.00),(28,'Color','Individual Foils','02:00:00',2.00),(29,'Color','Color Correction (Starting Price)','04:00:00',45.00),(30,'Styling','Shampoo & Thermal Style (Short)','01:00:00',8.00),(31,'Styling','Shampoo & Thermal Style (Long)','01:30:00',10.00),(32,'Styling','Shampoo Only','00:30:00',2.00),(33,'Styling','Wig Service','01:00:00',0.00),(34,'Styling','Braid','00:30:00',8.00),(35,'Styling','Corn Rows (Half-Head)','02:00:00',15.00),(36,'Styling','Birthday Party Package','01:30:00',10.00),(37,'Styling','Special Occasion Style','01:30:00',20.00),(38,'Styling','Conditioning Service & Blow-Day','02:00:00',8.00),(39,'Styling','Clarifying Treatment','01:00:00',8.00),(40,'Styling','Thermal Style (Dry Hair)','01:00:00',0.00);
/*!40000 ALTER TABLE `salonservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicesrendered`
--

DROP TABLE IF EXISTS `servicesrendered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicesrendered` (
  `ServiceID` int unsigned NOT NULL,
  `AppointmentID` int unsigned NOT NULL,
  PRIMARY KEY (`ServiceID`,`AppointmentID`),
  KEY `Appointment_idx` (`AppointmentID`),
  CONSTRAINT `Appointment` FOREIGN KEY (`AppointmentID`) REFERENCES `appointments` (`AppointmentID`),
  CONSTRAINT `Service` FOREIGN KEY (`ServiceID`) REFERENCES `salonservices` (`ServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicesrendered`
--

LOCK TABLES `servicesrendered` WRITE;
/*!40000 ALTER TABLE `servicesrendered` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicesrendered` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-16 13:10:22
