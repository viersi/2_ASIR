-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: laboratorio
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `familias`
--

DROP TABLE IF EXISTS `familias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `familias` (
  `ID_FAM` double NOT NULL,
  `NOMBRE_FAM` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_FAM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `laboratorios`
--

DROP TABLE IF EXISTS `laboratorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratorios` (
  `ID_LAB` double NOT NULL,
  `NOMBRE_LAB` varchar(50) DEFAULT NULL,
  `DIRECCION` varchar(60) DEFAULT NULL,
  `POBLACION` varchar(50) DEFAULT NULL,
  `PROVINCIA` varchar(30) DEFAULT NULL,
  `TELEFONO` double DEFAULT NULL,
  `FAX` double DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_LAB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicamentos`
--

DROP TABLE IF EXISTS `medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamentos` (
  `ID_MED` double NOT NULL,
  `NOMBRE_MED` varchar(50) DEFAULT NULL,
  `STOCK` double DEFAULT NULL,
  `PRECIO_UNIT` double DEFAULT NULL,
  `CONRECETA` char(1) DEFAULT NULL,
  `COPAGO` char(1) DEFAULT NULL,
  `ID_FAM` double DEFAULT NULL,
  `ID_PRES` double DEFAULT NULL,
  `ID_LAB` double DEFAULT NULL,
  PRIMARY KEY (`ID_MED`),
  KEY `ID_FAM` (`ID_FAM`),
  KEY `ID_PRES` (`ID_PRES`),
  KEY `medicamentos_ibfk_3_idx` (`ID_LAB`),
  CONSTRAINT `medicamentos_ibfk_1` FOREIGN KEY (`ID_FAM`) REFERENCES `familias` (`ID_FAM`),
  CONSTRAINT `medicamentos_ibfk_2` FOREIGN KEY (`ID_PRES`) REFERENCES `presentaciones` (`ID_PRES`),
  CONSTRAINT `medicamentos_ibfk_3` FOREIGN KEY (`ID_LAB`) REFERENCES `laboratorios` (`ID_LAB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicos`
--

DROP TABLE IF EXISTS `medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicos` (
  `DNIM` varchar(9) NOT NULL,
  `APELLIDOS` varchar(80) DEFAULT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `CENTRO_SALUD` varchar(60) DEFAULT NULL,
  `POBLACION` varchar(50) DEFAULT NULL,
  `PROVINCIA` varchar(30) DEFAULT NULL,
  `TELEFONO` char(9) DEFAULT NULL,
  `MOVIL` char(9) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `COLEGIADO` double DEFAULT NULL,
  PRIMARY KEY (`DNIM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `DNIP` varchar(9) NOT NULL,
  `NRO_SEG_SOC` double DEFAULT NULL,
  `APELLIDOS` varchar(80) DEFAULT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `SEXO` char(1) DEFAULT NULL,
  `CENTRO_SALUD` varchar(60) DEFAULT NULL,
  `DIRECCION` varchar(60) DEFAULT NULL,
  `POBLACION` varchar(50) DEFAULT NULL,
  `PROVINCIA` varchar(30) DEFAULT NULL,
  `TELEFONO` double DEFAULT NULL,
  `MOVIL` double DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DNIP`),
  UNIQUE KEY `UK_M_PAC_NSS` (`NRO_SEG_SOC`),
  CONSTRAINT `CK_MPACIENTES_SEXO` CHECK ((upper(`SEXO`) in (_utf8mb4'H',_utf8mb4'M')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `presentaciones`
--

DROP TABLE IF EXISTS `presentaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presentaciones` (
  `ID_PRES` double NOT NULL,
  `NOMBRE_PRES` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID_PRES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ventas_med`
--

DROP TABLE IF EXISTS `ventas_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_med` (
  `ID_VENTA` double(6,0) NOT NULL,
  `ID_MED` double DEFAULT NULL,
  `FECHA_VENTA` date DEFAULT NULL,
  `UNIDADES` double DEFAULT NULL,
  PRIMARY KEY (`ID_VENTA`),
  KEY `FK_VEN_MED` (`ID_MED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ventas_recetas`
--

DROP TABLE IF EXISTS `ventas_recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_recetas` (
  `ID_VENTA` double NOT NULL,
  `DNIM` varchar(9) DEFAULT NULL,
  `DNIP` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`ID_VENTA`),
  KEY `FK_REC_MED` (`DNIM`),
  KEY `FK_REC_PAC` (`DNIP`),
  CONSTRAINT `FK_REC_MED` FOREIGN KEY (`DNIM`) REFERENCES `m_medicos` (`DNIM`),
  CONSTRAINT `FK_REC_PAC` FOREIGN KEY (`DNIP`) REFERENCES `pacientes` (`DNIP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-28 11:32:33
