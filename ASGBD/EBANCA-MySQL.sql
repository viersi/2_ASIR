CREATE DATABASE /*!32312 IF NOT EXISTS*/ `banca` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `banca`;

--
-- Table structure for table `apuesta`
--

DROP TABLE IF EXISTS `apuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apuesta` (
  `codigo_carrera` varchar(5) NOT NULL DEFAULT '',
  `nombre_caballo` varchar(100) NOT NULL DEFAULT '',
  `dorsal` decimal(10,0) NOT NULL,
  `cantidad` decimal(10,0) NOT NULL DEFAULT '0',
  `apostante` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo_carrera`,`nombre_caballo`,`apostante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apuesta`
--

LOCK TABLES `apuesta` WRITE;
/*!40000 ALTER TABLE `apuesta` DISABLE KEYS */;
INSERT INTO `apuesta` VALUES ('c2930','baul','4','9','a1'),('c2930','celeste','5','22','a4'),('c2930','culebra','6','18','a6'),('c2930','dulcinea','1','23','a2'),('c2930','matahari','7','24','a12'),('c2930','obenque','3','7','a43'),('c2930','pincho','2','17','a13'),('c2931','arturo','6','90','a1'),('c2931','azul','1','44','a5'),('c2931','carpanta','2','93','a7'),('c2931','dorotea','4','56','a8'),('c2931','hermes','3','79','a16'),('c2931','roldan','7','71','a42'),('c2931','ulises','5','16','a33'),('c2932','apolo','6','39','a30'),('c2932','aventao','7','3','a4'),('c2932','carpanta','2','60','a39'),('c2932','celeste','1','7','a25'),('c2932','pluton','3','83','a18'),('c2932','venus','5','87','a17'),('c2933','baul','4','17','a19'),('c2933','celeste','3','99','a18'),('c2933','culebra','2','18','a32'),('c2933','dulcinea','7','25','a22'),('c2933','matahari','1','38','a24'),('c2933','obenque','5','11','a22'),('c2933','pincho','6','85','a20'),('c2934','arturo','6','88','a31'),('c2934','azul','1','1','a40'),('c2934','carpanta','2','96','a29'),('c2934','dorotea','4','85','a34'),('c2934','hermes','3','8','a4'),('c2934','roldan','7','97','a5'),('c2934','ulises','5','23','a5'),('c2935','apolo','2','12','a1'),('c2935','aventao','1','46','a17'),('c2935','carpanta','6','69','a23'),('c2935','pluton','5','58','a41'),('c2935','venus','3','41','a41'),('c2936','baul','4','47','a54'),('c2936','celeste','3','23','a37'),('c2936','culebra','2','70','a56'),('c2936','dulcinea','7','65','a47'),('c2936','matahari','1','16','a58'),('c2936','obenque','5','14','a60'),('c2936','pincho','6','57','a43'),('c2937','arturo','2','91','a41'),('c2937','azul','7','3','a31'),('c2937','carpanta','6','21','a24'),('c2937','dorotea','4','35','a26'),('c2937','hermes','5','90','a26'),('c2937','roldan','1','13','a28'),('c2937','ulises','3','17','a5'),('c2938','apolo','2','26','a6'),('c2938','aventao','1','41','a1'),('c2938','carpanta','6','62','a60'),('c2938','pluton','5','27','a58'),('c2938','venus','3','88','a5'),('c2939','baul','4','45','a20'),('c2939','celeste','5','8','a23'),('c2939','culebra','6','52','a22'),('c2939','dulcinea','1','23','a22'),('c2939','matahari','7','25','a41'),('c2939','obenque','3','2','a40'),('c2939','pincho','2','80','a52'),('c2940','arturo','2','22','a7'),('c2940','azul','7','30','a9'),('c2940','carpanta','6','49','a11'),('c2940','dorotea','4','25','a17'),('c2940','hermes','5','44','a19'),('c2940','roldan','1','89','a32'),('c2940','ulises','3','7','a23');
/*!40000 ALTER TABLE `apuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caballo`
--

DROP TABLE IF EXISTS `caballo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caballo` (
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `edad` decimal(10,0) DEFAULT NULL,
  `carreras_ganadas` int(11) DEFAULT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caballo`
--

LOCK TABLES `caballo` WRITE;
/*!40000 ALTER TABLE `caballo` DISABLE KEYS */;
INSERT INTO `caballo` VALUES ('apolo','4',10),('arturo','5',7),('aventao','4',10),('azul','5',7),('baul','5',7),('carpanta','3',NULL),('celeste','4',10),('culebra','8',NULL),('dorotea','4',10),('dulcinea','5',7),('hermes','8',NULL),('matahari','5',7),('obenque','4',10),('pincho','5',7),('pluton','5',7),('roldan','7',NULL),('ulises','6',8),('venus','7',NULL);
/*!40000 ALTER TABLE `caballo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera` (
  `codigo` varchar(5) NOT NULL,
  `dia` date NOT NULL,
  `dorsal_ganador` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES ('c2929','2005-12-15',2),('c2930','2005-12-12',1),('c2931','2005-12-12',3),('c2932','2005-12-12',4),('c2933','2005-12-13',5),('c2934','2005-12-13',7),('c2935','2005-12-13',7),('c2936','2005-12-14',2),('c2937','2005-12-14',5),('c2938','2005-12-14',7),('c2939','2005-12-15',3),('c2940','2005-12-15',1),('c2941','2005-12-15',2);
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `codigo_cliente` decimal(20,0) NOT NULL,
  `dni` decimal(8,0) NOT NULL,
  `nombre` char(20) NOT NULL,
  `apellido1` char(20) NOT NULL,
  `apellido2` char(20) NOT NULL,
  `direccion` char(50) NOT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `SID_cliente_ID` (`codigo_cliente`),
  UNIQUE KEY `SID_cliente_1` (`codigo_cliente`),
  UNIQUE KEY `ID_cliente_IND` (`dni`),
  UNIQUE KEY `SID_cliente_IND` (`codigo_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `codigo_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `dni` int(7) NOT NULL,
  `nombre` char(20) NOT NULL,
  `apellido1` char(20) NOT NULL,
  `apellido2` char(20) DEFAULT NULL,
  `direccion` char(50) NOT NULL,
  `region` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,11111111,'jcarlos','baldo',NULL,'d1','aragon'),(2,22222222,'pilar','rodri',NULL,'d2','aragon'),(3,33333333,'pablo','babes',NULL,'d3','pais vasco'),(4,44444444,'javi','sonas',NULL,'d4','pais vasco'),(5,55555555,'angel','alva',NULL,'d5','pais vasco'),(6,66666666,'pilar','bueso','perez','d6','aragon'),(7,77777777,'alberto','perez','dominguez','d7','aragon'),(8,88888888,'antonio','martinez','barea','d8','extremadura'),(9,99999999,'maria jesus','longares','hernandez','d9','extremadura'),(10,10101010,'ana','guillen','lopera','d10','aragon'),(11,12121212,'fernando','montero','iglesias','d11','aragon'),(12,13131313,'silvia','lopez','escartin','d12','aragon'),(13,14141414,'raquel','beltran','acebes','d13','aragon'),(14,15151515,'mario','cabaña','encinas','d14','aragon'),(15,16161616,'manuel','falceto','carrera','d15','aragon'),(16,17171717,'jordi','eulalia','perales','d16','aragon'),(17,18181818,'marc','garriga','higuera','d17','aragon'),(18,19191919,'rafael','hueso','ibañez','d18','aragon'),(19,20202020,'fran','granada','mariategui','d19','aragon'),(20,20202020,'porfirio','gambo','perez','d20','aragon');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuenta` (
  `tipo` char(1) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `saldo` char(1) NOT NULL,
  `cod_cuenta` decimal(20,0) NOT NULL,
  PRIMARY KEY (`cod_cuenta`),
  UNIQUE KEY `ID_cuenta_IND` (`cod_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corriente`
--

DROP TABLE IF EXISTS `corriente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corriente` (
  `cod_cuenta` decimal(20,0) NOT NULL,
  `comision` decimal(1,0) NOT NULL,
  PRIMARY KEY (`cod_cuenta`),
  UNIQUE KEY `ID_corri_cuent_IND` (`cod_cuenta`),
  CONSTRAINT `ID_corri_cuent_FK` FOREIGN KEY (`cod_cuenta`) REFERENCES `cuenta` (`cod_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corriente`
--

LOCK TABLES `corriente` WRITE;
/*!40000 ALTER TABLE `corriente` DISABLE KEYS */;
/*!40000 ALTER TABLE `corriente` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuentas` (
  `fecha_creacion` date NOT NULL,
  `saldo` int(11) NOT NULL DEFAULT '0',
  `cod_cuenta` int(11) NOT NULL,
  `cod_cliente` int(11) NOT NULL,
  PRIMARY KEY (`cod_cuenta`),
  KEY `ccl` (`cod_cliente`),
  KEY `fc` (`fecha_creacion`,`cod_cliente`),
  KEY `cfc` (`fecha_creacion`,`cod_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` VALUES ('2012-01-01',30000,0,6),('2010-01-01',100,1,1),('2010-02-01',100,2,2),('2009-02-13',4400,3,3),('2011-12-13',-40,4,4),('2011-06-23',20040,5,5),('2012-01-01',30000,6,6),('2012-02-01',3300,7,7),('2012-02-03',0,8,8),('2012-02-03',41990,9,9),('2012-12-13',4718,10,10),('2012-12-23',47622,11,10),('2012-12-23',45452,12,9),('2012-11-03',36414,13,3),('2008-05-03',32799,14,15),('2008-05-03',45464,15,4),('2010-09-12',18632,16,4),('2012-02-02',44837,17,17),('2009-02-02',34210,18,15),('2009-04-10',46461,19,5),('2009-07-13',24873,20,14),('2010-01-23',4435,21,5),('2010-03-29',10415,22,3),('2011-02-24',7971,23,6),('2011-02-25',7726,24,15),('2012-02-25',-25061,25,2),('2012-12-15',-6621,26,5),('2012-11-09',-255,27,3),('2011-11-09',-4525,28,19),('2011-04-11',-3777,29,4),('2011-06-05',-4890,30,2),('2011-06-17',-3917,31,9),('2010-06-17',-423,32,19),('2010-08-17',-4263,33,10),('2009-08-17',-873,34,4),('2009-12-01',-3339,35,15);
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hipoteca`
--

DROP TABLE IF EXISTS `hipoteca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hipoteca` (
  `cuota` decimal(1,0) NOT NULL,
  `interes` decimal(1,0) NOT NULL,
  `id_hipoteca` decimal(1,0) NOT NULL,
  `cod_cuenta` decimal(20,0) NOT NULL,
  PRIMARY KEY (`id_hipoteca`),
  UNIQUE KEY `ID_hipoteca_IND` (`id_hipoteca`),
  KEY `REF_hipot_cuent_IND` (`cod_cuenta`),
  CONSTRAINT `REF_hipot_cuent_FK` FOREIGN KEY (`cod_cuenta`) REFERENCES `cuenta` (`cod_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hipoteca`
--

LOCK TABLES `hipoteca` WRITE;
/*!40000 ALTER TABLE `hipoteca` DISABLE KEYS */;
/*!40000 ALTER TABLE `hipoteca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inversion`
--

DROP TABLE IF EXISTS `inversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inversion` (
  `cod_cuenta` decimal(20,0) NOT NULL,
  `variable` decimal(1,0) NOT NULL,
  `domiciliacion` decimal(1,0) NOT NULL,
  `interes` decimal(1,0) NOT NULL,
  PRIMARY KEY (`cod_cuenta`),
  UNIQUE KEY `ID_inver_cuent_IND` (`cod_cuenta`),
  CONSTRAINT `ID_inver_cuent_FK` FOREIGN KEY (`cod_cuenta`) REFERENCES `cuenta` (`cod_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inversion`
--

LOCK TABLES `inversion` WRITE;
/*!40000 ALTER TABLE `inversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `inversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento`
--

DROP TABLE IF EXISTS `movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimiento` (
  `fecha` date NOT NULL,
  `cantidad` decimal(4,0) NOT NULL,
  `dni` decimal(8,0) NOT NULL,
  `cod_cuenta` decimal(20,0) NOT NULL,
  PRIMARY KEY (`fecha`,`dni`,`cod_cuenta`),
  UNIQUE KEY `ID_movimiento_IND` (`fecha`,`dni`,`cod_cuenta`),
  KEY `REF_movim_cuent_IND` (`cod_cuenta`),
  KEY `REF_movim_clien_IND` (`dni`),
  CONSTRAINT `REF_movim_clien_FK` FOREIGN KEY (`dni`) REFERENCES `cliente` (`dni`),
  CONSTRAINT `REF_movim_cuent_FK` FOREIGN KEY (`cod_cuenta`) REFERENCES `cuenta` (`cod_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento`
--

LOCK TABLES `movimiento` WRITE;
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos` (
  `dni` decimal(8,0) NOT NULL,
  `fechahora` date NOT NULL,
  `cantidad` double NOT NULL,
  `idmov` int(11) NOT NULL AUTO_INCREMENT,
  `cod_cuenta` int(11) NOT NULL,
  PRIMARY KEY (`idmov`),
  KEY `ccuenta` (`cod_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` VALUES ('11111111','2011-04-18',64028,37,1),('44444444','2011-04-18',60528,38,4),('44444444','2011-04-18',13979,39,4),('44444444','2011-04-18',26467,40,4),('22222222','2011-04-18',6906,41,2),('44444444','2011-04-18',47477,42,4),('33333333','2011-04-18',15490,43,3),('22222222','2011-04-18',57323,44,2),('33333333','2011-04-18',67620,45,3),('33333333','2011-04-18',61864,46,3),('11111111','2011-04-18',35142,47,1),('11111111','2011-04-18',87009,48,1),('22222222','2011-04-18',11884,49,2),('11111111','2011-04-18',1480,50,1),('22222222','2011-04-18',75530,51,2),('44444444','2011-04-18',32424,52,4),('44444444','2011-04-18',86077,53,4),('33333333','2011-04-18',96523,54,3),('22222222','2011-04-18',35796,55,2),('33333333','2011-04-18',99784,56,3),('55555555','2010-05-04',-583,57,14),('55555555','2009-03-25',-3327,78,33),('55555555','2009-03-21',471,79,3),('66666666','2010-12-05',2881,80,13),('66666666','2011-01-09',2784,81,13),('66666666','2010-10-11',4939,82,9),('77777777','2010-06-01',4972,83,31),('77777777','2009-12-22',4450,84,31),('88888888','2009-03-07',1763,85,11),('88888888','2009-08-22',902,86,34),('88888888','2010-05-15',4605,87,16),('88888888','2009-08-09',4066,88,3),('99999999','2011-02-08',994,89,23),('10101010','2009-03-19',4733,90,12),('10101010','2008-12-26',1827,91,6),('10101010','2009-01-25',-3397,92,29),('10101010','2010-10-29',-2440,93,28),('11111111','2009-08-31',-3496,94,21),('11111111','2008-11-20',-3826,95,2),('12121212','2011-01-26',-1699,96,12),('12121212','2009-06-07',-2685,97,18),('13131313','2011-03-03',-3959,98,25),('13131313','2010-11-06',-4243,99,22),('14141414','2009-07-01',-2586,100,17),('15151515','2011-05-24',-2351,101,12),('15151515','2010-06-16',-3289,102,9),('16161616','2010-06-13',-4672,103,22),('16161616','2010-05-07',-4996,104,29),('17171717','2010-09-14',-3550,105,27),('21212121','2009-08-07',-1928,107,33),('15151515','2013-03-08',-1922,108,33),('15151515','2013-03-01',-1773,109,29),('15151515','2011-09-01',-4997,110,24),('14141414','2012-10-01',-1906,111,14),('13131313','2014-01-02',-2566,112,24),('13131313','2014-01-23',-3821,113,31),('13131313','2011-12-07',-1447,114,30),('99999999','2012-07-17',-2631,115,13),('99999999','2012-02-29',-1446,116,21),('99999999','2011-10-21',-4691,117,8),('77777777','2012-06-23',-1273,118,2),('77777777','2013-03-14',-217,119,8),('33333333','2011-07-25',-2981,120,27),('11111111','2011-11-23',-2669,121,4),('11111111','2014-02-12',-3086,122,3);
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppensiones`
--

DROP TABLE IF EXISTS `ppensiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppensiones` (
  `dni` decimal(8,0) NOT NULL,
  `f_alta` date NOT NULL,
  `ingreso_ultimo_anio` char(1) NOT NULL,
  `saldo_pp` decimal(1,0) NOT NULL,
  `cod_plan` char(1) NOT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `SID_ppensiones_ID` (`cod_plan`),
  UNIQUE KEY `ID_ppens_clien_IND` (`dni`),
  UNIQUE KEY `SID_ppensiones_IND` (`cod_plan`),
  CONSTRAINT `ID_ppens_clien_FK` FOREIGN KEY (`dni`) REFERENCES `cliente` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppensiones`
--

LOCK TABLES `ppensiones` WRITE;
/*!40000 ALTER TABLE `ppensiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppensiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiene`
--

DROP TABLE IF EXISTS `tiene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiene` (
  `dni` decimal(8,0) NOT NULL,
  `cod_cuenta` decimal(20,0) NOT NULL,
  PRIMARY KEY (`dni`,`cod_cuenta`),
  UNIQUE KEY `ID_tiene_IND` (`dni`,`cod_cuenta`),
  KEY `EQU_tiene_cuent_IND` (`cod_cuenta`),
  CONSTRAINT `EQU_tiene_clien` FOREIGN KEY (`dni`) REFERENCES `cliente` (`dni`),
  CONSTRAINT `EQU_tiene_cuent_FK` FOREIGN KEY (`cod_cuenta`) REFERENCES `cuenta` (`cod_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiene`
--

LOCK TABLES `tiene` WRITE;
/*!40000 ALTER TABLE `tiene` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiene` ENABLE KEYS */;
UNLOCK TABLES;

