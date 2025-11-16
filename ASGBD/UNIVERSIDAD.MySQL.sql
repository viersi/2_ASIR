CREATE DATABASE  IF NOT EXISTS `universidad` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `universidad`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: universidad
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `alumno_asignatura`
--

DROP TABLE IF EXISTS `alumno_asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno_asignatura` (
  `IdAlumno` varchar(10) NOT NULL,
  `IdAsignatura` int(11) NOT NULL,
  `NumeroMatricula` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdAlumno`,`IdAsignatura`),
  KEY `FK2_idx` (`IdAsignatura`),
  CONSTRAINT `ALUMNO_ASIGNATURA_FK1` FOREIGN KEY (`IdAlumno`) REFERENCES `alumnos` (`IdAlumno`),
  CONSTRAINT `ALUMNO_ASIGNATURA_FK2` FOREIGN KEY (`IdAsignatura`) REFERENCES `asignaturas` (`IdAsignatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno_asignatura`
--

LOCK TABLES `alumno_asignatura` WRITE;
/*!40000 ALTER TABLE `alumno_asignatura` DISABLE KEYS */;
INSERT INTO `alumno_asignatura` VALUES ('A010101',150212,1),('A020202',150212,2),('A020202',150214,1),('A030303',130113,3),('A030303',130122,2),('A030303',130133,1),('A040404',130122,1),('A121212',115,1),('A131313',160002,1),('A252525',130119,1),('A252525',130124,2),('A252525',130125,5),('A252525',130126,3),('A252525',130130,4),('A262626',150212,1),('A262626',150215,2),('A262626',150216,3),('A262626',150226,4),('A262626',150227,5),('A262626',150228,6),('A272727',130119,1),('A272727',130127,2),('A272727',130131,3),('A272727',130133,4),('A343434',150225,1),('A343434',150226,2),('A343434',150228,3),('A343434',150229,4),('A343434',150237,5),('A343434',150240,6),('A363636',160002,1),('A363636',160008,2),('A363636',160010,3),('A363636',160018,4),('A363636',160021,5),('A363636',160023,6),('A363636',160025,7),('A414141',130130,1),('A414141',130131,2),('A414141',130133,3),('A414141',130137,4),('A424242',150229,1),('A424242',150235,2),('A424242',150236,3),('A424242',150237,4),('A424242',150238,5),('A424242',150239,6),('A424242',150240,7),('A515151',160002,1),('A515151',160008,2),('A515151',160009,3);
/*!40000 ALTER TABLE `alumno_asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `IdAlumno` varchar(10) NOT NULL,
  `DNI` char(9) DEFAULT NULL,
  PRIMARY KEY (`IdAlumno`),
  KEY `FK1_idx` (`DNI`),
  CONSTRAINT `ALUMNOS_FK1` FOREIGN KEY (`DNI`) REFERENCES `personas` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES ('A121212','16161616A'),('A131313','17171717A'),('A020202','18181818A'),('A030303','20202020A'),('A010101','21212121A'),('A040404','26262626A'),('A252525','32323232A'),('A262626','35353535A'),('A272727','37373737A'),('A515151','46464646A'),('A343434','53535353A'),('A363636','54545454A'),('A414141','61616161A'),('A424242','62626262A');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignaturas`
--

DROP TABLE IF EXISTS `asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignaturas` (
  `IdAsignatura` int(11) NOT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  `Creditos` double DEFAULT NULL,
  `Cuatrimestre` int(1) DEFAULT NULL,
  `CosteBasico` double DEFAULT NULL,
  `IdProfesor` varchar(10) DEFAULT NULL,
  `IdTitulacion` varchar(10) DEFAULT NULL,
  `Curso` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`IdAsignatura`),
  KEY `ASIGNATURAS_FK1_idx` (`IdProfesor`),
  KEY `ASIGNATURAS_FK2_idx` (`IdTitulacion`),
  CONSTRAINT `ASIGNATURAS_FK1` FOREIGN KEY (`IdProfesor`) REFERENCES `profesores` (`IdProfesor`),
  CONSTRAINT `ASIGNATURAS_FK2` FOREIGN KEY (`IdTitulacion`) REFERENCES `titulaciones` (`IdTitulacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaturas`
--

LOCK TABLES `asignaturas` WRITE;
/*!40000 ALTER TABLE `asignaturas` DISABLE KEYS */;
INSERT INTO `asignaturas` VALUES (115,'Seguridad Vial',4.5,1,30,'P204',NULL,NULL),(130113,'Programación I',9,1,60,'P101','230110','1'),(130118,'Matemática Discreta',6,1,80,'P700','230110','1'),(130119,'Geometría Lineal',4.5,1,70,'P509','230110','1'),(130122,'Análisis II',9,2,60,'P203','230110','2'),(130123,'Cálculo Infinitesimal',12,2,90,'P806','230110','1'),(130124,'Algebra',9,1,80,'P805','230110','2'),(130125,'Topología',9,1,60,'P805','230110','2'),(130126,'Métodos Numéricos I',6,1,60,'P700','230110','2'),(130127,'Integración',12,2,80,'P405','230110','2'),(130130,'Análisis Vectorial',6,1,70,'P609','230110','3'),(130131,'Inferencia Estadística',4.5,1,90,'P407','230110','3'),(130133,'Modelización Matemática',9,2,90,'P901','230110','3'),(130137,'Geometría Diferencial',12,2,70,'P601','230110','3'),(150212,'Química general',4.5,2,70,'P304','250210','1'),(150214,'Biología',4.5,1,60,'P807','250210','1'),(150215,'Geología',9,1,60,'P407','250210','1'),(150216,'Operaciones básicas de laboratorio',6,2,70,'P405','250210','1'),(150217,'Física General',4.5,2,80,'P701','250210','1'),(150225,'Ciencia de materiales',4.5,1,60,'P902','250210','2'),(150226,'Químita analítica I',9,1,70,'P704','250210','2'),(150227,'Química inorgánica I',9,1,70,'P807','250210','2'),(150228,'Química orgánica I',12,2,80,'P901','250210','2'),(150229,'Ingeniería química',4.5,2,90,'P601','250210','2'),(150235,'Bioquímica',6,1,90,'P508','250210','3'),(150236,'Química analítica II',4.5,1,60,'P901','250210','3'),(150237,'Química orgánica II',12,1,70,'P407','250210','3'),(150238,'Química inorgánica II',9,2,80,'P605','250210','3'),(150239,'Cálculo computacional en química',9,2,80,'P405','250210','3'),(150240,'Análisis aplicado y calidad',6,2,90,'P509','250210','3'),(160002,'Contabilidad',6,1,70,'P117','260000','1'),(160008,'Macroeconomía',6,2,70,'P701','260000','1'),(160009,'Estadística',4.5,2,70,'P609','260000','1'),(160010,'Microeconomía',4.5,1,60,'P508','260000','1'),(160016,'Derecho de la empresa',6,1,80,'P902','260000','2'),(160017,'Matemáticas empresariales',12,2,70,'P405','260000','1'),(160018,'Gestión de recursos humanos',6,2,90,'P703','260000','2'),(160021,'Planificación financiera',9,1,90,'P407','260000','3'),(160023,'Fiscalidad comparada',12,1,60,'P703','260000','3'),(160025,'Business intelligence',4.5,2,90,'P704','260000','3');
/*!40000 ALTER TABLE `asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `DNI` char(9) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Ciudad` varchar(20) DEFAULT NULL,
  `DireccionCalle` varchar(20) DEFAULT NULL,
  `DireccionNum` int(4) DEFAULT NULL,
  `Telefono` int(11) DEFAULT NULL,
  `FechaNacimiento` datetime DEFAULT NULL,
  `Varon` int(1) DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES ('16161616A','Luis','Ramirez','Haro','Pez',34,941111111,'1969-01-01 21:30:00',1),('17171717A','Laura','Beltran','Madrid','Gran Via',23,912121212,'1974-08-08 08:15:00',0),('18181818A','Pepe','Perez','Madrid','Percebe',13,913131313,'1980-02-02 22:40:00',1),('19191919A','Juan','Sanchez','Bilbao','Melancolia',7,944141414,'1966-03-03 13:20:00',1),('20202020A','Luis','Jimenez','Najera','Cigüeña',15,941151515,'1979-03-03 03:05:00',1),('21212121A','Rosa','Garcia','Haro','Alegria',16,941161616,'1978-04-04 13:30:00',0),('23232323A','Jorge','Saenz','Logroño','Luis Ulloa',17,941171717,'1978-09-09 00:55:00',1),('24242424A','María','Gutierrez','Logroño','Avda. de la Paz',18,941181818,'1964-10-10 19:45:00',0),('25252525A','Rosario','Diaz','Logroño','Percebe',19,941191919,'1971-11-11 06:00:00',0),('26262626A','Elena','Gonzalez','Logroño','Percebe',20,941202020,'1975-05-05 16:50:00',0),('31313131A','Rocio','Martinez','Madrid','Estrella Polar',13,914141414,'1967-03-21 22:40:35',0),('32323232A','Pedro','Perez','Barcelona','Casiopea',10,937878787,'1974-12-12 23:59:59',1),('34343434A','Ana','Benito','Barcelona','Almendros',20,931313131,'1981-06-16 13:21:00',0),('35353535A','Luis','Gomez','Bilbao','Avda. de Daroca',8,944412121,'1972-10-11 12:35:55',1),('36363636A','Jaime','Alvarez','Madrid','Jaime Pazos',35,916161616,'1978-02-14 07:00:15',1),('37373737A','Blanca','Rincón','Madrid','Ramón y Cajal',18,913535353,'1982-05-15 15:15:15',0),('41414141A','José','Sanz','Najera','Doctor Fleming',9,941121212,'1966-01-25 12:59:10',1),('42424242A','Francisco','Rodríguez','Madrid','Alcalde Juan Vergara',1,911616161,'1965-12-14 01:08:06',1),('43434343A','David','Fernández','Logroño','Barcos',22,941131313,'1967-02-19 16:12:00',1),('46464646A','Pilar','López','Madrid','Monte Real',31,NULL,'1968-10-06 03:13:08',0),('47474747A','Isabel','Martín','Barcelona','Casiopea',14,931212121,'1970-11-02 08:15:12',0),('51515151A','Carmen','Hernández','Madrid','Luis Ulloa',18,911818181,'1968-01-15 19:17:59',0),('52525252A','María','Moreno','Najera','Barranquillas',23,941212121,'1965-09-30 21:27:54',0),('53535353A','Daniel','Muñoz','Logroño','Tórtola',11,941222222,'1976-03-28 04:22:08',1),('54545454A','José Luis','Romero','Bilbao','Vega Umbría',37,944413131,'1976-03-03 06:29:18',1),('61616161A','Ana','Alvarez','Madrid','Limonero',42,911919191,'1973-08-05 11:46:03',0),('62626262A','María','Diaz','Bilbao','Doctor Arce',19,944414141,'1973-05-31 13:07:00',0),('63636363A','Pedro','Alonso','Najera','Infanta Mercedes',5,941333333,'1965-05-01 14:10:00',1),('71717171A','Javier','Navarro','Logroño','Pinilla del Valle',16,NULL,'1965-04-18 08:44:42',1),('81818181A','Manuel','Torres','Madrid','Berruguete',4,911717171,'1966-03-12 00:35:53',1),('82828282A','Martina','Domínguez','Logroño','Méndez Álvaro',2,941444444,'1969-09-27 01:39:15',0),('91919191A','Silvia','Vázquez','Najera','Lirios',18,941555555,'1970-12-29 17:21:24',0),('92929292A','José María','Ramos','Haro','Lucero',12,641666666,'1970-12-15 16:24:27',1);
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores` (
  `IdProfesor` varchar(10) NOT NULL,
  `DNI` char(9) DEFAULT NULL,
  PRIMARY KEY (`IdProfesor`),
  KEY `PROFESORES_FK1_idx` (`DNI`),
  CONSTRAINT `PROFESORES_FK1` FOREIGN KEY (`DNI`) REFERENCES `personas` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES ('P101','19191919A'),('P203','23232323A'),('P304','24242424A'),('P117','25252525A'),('P204','26262626A'),('P405','31313131A'),('P407','34343434A'),('P508','36363636A'),('P509','41414141A'),('P601','42424242A'),('P605','43434343A'),('P609','46464646A'),('P700','47474747A'),('P701','51515151A'),('P703','52525252A'),('P704','63636363A'),('P805','71717171A'),('P806','81818181A'),('P807','82828282A'),('P901','91919191A'),('P902','92929292A');
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulaciones`
--

DROP TABLE IF EXISTS `titulaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titulaciones` (
  `IdTitulacion` varchar(10) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdTitulacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulaciones`
--

LOCK TABLES `titulaciones` WRITE;
/*!40000 ALTER TABLE `titulaciones` DISABLE KEYS */;
INSERT INTO `titulaciones` VALUES ('230110','Matemáticas'),('250210','Químicas'),('260000','Empresariales');
/*!40000 ALTER TABLE `titulaciones` ENABLE KEYS */;
UNLOCK TABLES;


