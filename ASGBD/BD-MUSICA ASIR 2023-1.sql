--
-- Base de datos: `MUSICA_2023`
--
CREATE DATABASE MUSICA_2023;
USE MUSICA_2023;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `albumes`
--

CREATE TABLE IF NOT EXISTS `albumes` (
  `cod_album` smallint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL UNIQUE,
  `fecha` year NOT NULL,
  `cod_grupo` smallint NOT NULL,
  PRIMARY KEY (`cod_album`),
  KEY `cod_grupo` (`cod_grupo`)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `albumes_discograficas`
--

CREATE TABLE IF NOT EXISTS `albumes_discograficas` (
  `cod_album` smallint NOT NULL DEFAULT '0',
  `cod_discografica` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_album`,`cod_discografica`),
  KEY `cod_discografica` (`cod_discografica`)
);


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `albumes_generos`
--

CREATE TABLE IF NOT EXISTS `albumes_generos` (
  `cod_album` smallint NOT NULL DEFAULT '0',
  `cod_genero` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_album`,`cod_genero`),
  KEY `cod_genero` (`cod_genero`)
);

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `canciones`
--

CREATE TABLE IF NOT EXISTS `canciones` (
  `cod_cancion` mediumint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL UNIQUE,
  `duracion` time NOT NULL,
  `num_pista` tinyint NOT NULL,
  `cod_album` smallint NOT NULL,
  PRIMARY KEY (`cod_cancion`),
  KEY `cod_album` (`cod_album`)
);

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `discograficas`
--

CREATE TABLE IF NOT EXISTS `discograficas` (
  `cod_discografica` smallint NOT NULL DEFAULT '0',
  `discografica` varchar(40) NOT NULL UNIQUE,
  PRIMARY KEY (`cod_discografica`)
);

--
-- Volcado de datos para la tabla `discograficas`
--

INSERT INTO `discograficas` (`cod_discografica`, `discografica`) VALUES
(46, 'Albert Epic'),
(37, 'Alvinrisk'),
(31, 'American Recordings'),
(24, 'Ardent Records'),
(47, 'ATCO Records'),
(34, 'Atlantic Records'),
(11, 'AZ Records'),
(5, 'BGM Ariola España'),
(6, 'BGM España'),
(33, 'Big Beat Records'),
(39, 'CBE Entertainment'),
(17, 'CNR Records'),
(27, 'Columbia Records'),
(40, 'DBTrap Records'),
(30, 'DCD2'),
(21, 'DRO East West'),
(44, 'DRO Spain'),
(9, 'Elektra Records'),
(8, 'EMI Records'),
(52, 'Epic Records'),
(41, 'Flugschau'),
(45, 'Fundación El Canserbero'),
(12, 'Grabaciones Interferencias'),
(14, 'Hispavox'),
(19, 'Independiente'),
(2, 'Inmortal Records'),
(48, 'Interdisc'),
(1, 'Interscope Records'),
(29, 'Island Records'),
(50, 'Joytime Collective'),
(42, 'Kidinakorner'),
(35, 'Kill The Noise'),
(36, 'Killagraham'),
(16, 'Kontor Records'),
(3, 'LAM Records'),
(25, 'Lava Records'),
(55, 'Megaforce Records'),
(51, 'Motown'),
(32, 'Owsla'),
(13, 'Parlophone'),
(4, 'Propaganda Pel Fet!'),
(28, 'RCA Records'),
(18, 'SFDK Records'),
(7, 'Sony'),
(53, 'Sony Music Latin'),
(38, 'The Social Experiment'),
(23, 'Universal Music'),
(54, 'Vertigo Records'),
(43, 'VinilH Records'),
(49, 'Warner Bros Records'),
(20, 'Warner Music'),
(22, 'Warner Music Latina'),
(10, 'Warner Music Spain'),
(15, 'What A Music LTD'),
(26, 'Word Atlantic');

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE IF NOT EXISTS `generos` (
  `cod_genero` smallint NOT NULL DEFAULT '0',
  `genero` varchar(40) NOT NULL UNIQUE,
  PRIMARY KEY (`cod_genero`)
);

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`cod_genero`, `genero`) VALUES
(36, 'Arena Rock'),
(46, 'Baladas'),
(24, 'Brostep'),
(10, 'Dance'),
(50, 'Doom Metal'),
(27, 'Drumstep'),
(23, 'Dubstep'),
(26, 'EDM'),
(25, 'Electrohouse'),
(11, 'Electrónica'),
(8, 'Fiestas y Tradiciones'),
(39, 'Future Bass'),
(29, 'Future Garage'),
(38, 'Future House'),
(49, 'Hard Rock Proto-Punk'),
(18, 'Hard-Rock'),
(35, 'Heavy Metal'),
(3, 'Hip-Hop'),
(12, 'Hip-House'),
(13, 'House'),
(37, 'House Progresivo'),
(33, 'Jazz-Rap'),
(45, 'Merengue'),
(19, 'Metal Alternativo'),
(17, 'Metal Cristiano'),
(32, 'Metal Industrial'),
(9, 'Música Infantil'),
(2, 'Nu Metal'),
(6, 'Pop'),
(16, 'Pop Latino'),
(40, 'Pop Soul'),
(14, 'Pop-Punk'),
(7, 'Pop-Rock'),
(42, 'Post-Disco'),
(15, 'Power-Pop'),
(43, 'R&B'),
(4, 'Rap'),
(34, 'Rap Underground'),
(21, 'Rapcore'),
(44, 'Reggaeton'),
(30, 'RNB'),
(5, 'Rock'),
(20, 'Rock Alternativo'),
(22, 'Rock Cristiano'),
(41, 'Soul'),
(48, 'Speed Metal'),
(1, 'Stoner Rock'),
(28, 'Trap'),
(47, 'Trash Metal'),
(31, 'Urban');

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE IF NOT EXISTS `grupos` (
    `cod_grupo` SMALLINT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(100) NOT NULL UNIQUE,
    `nacionalidad` VARCHAR(30) NOT NULL,
    `biografia` TEXT NOT NULL,
    PRIMARY KEY (`cod_grupo`)
);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `albumes`
--
ALTER TABLE `albumes`
  ADD CONSTRAINT `albumes_ibfk_1` FOREIGN KEY (`cod_grupo`) REFERENCES `grupos` (`cod_grupo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `albumes_discograficas`
--
ALTER TABLE `albumes_discograficas`
  ADD CONSTRAINT `albumes_discograficas_ibfk_1` FOREIGN KEY (`cod_album`) REFERENCES `albumes` (`cod_album`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `albumes_discograficas_ibfk_2` FOREIGN KEY (`cod_discografica`) REFERENCES `discograficas` (`cod_discografica`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `albumes_generos`
--
ALTER TABLE `albumes_generos`
  ADD CONSTRAINT `albumes_generos_ibfk_1` FOREIGN KEY (`cod_album`) REFERENCES `albumes` (`cod_album`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `albumes_generos_ibfk_2` FOREIGN KEY (`cod_genero`) REFERENCES `generos` (`cod_genero`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `canciones`
--
ALTER TABLE `canciones`
  ADD CONSTRAINT `canciones_ibfk_1` FOREIGN KEY (`cod_album`) REFERENCES `albumes` (`cod_album`) ON DELETE CASCADE ON UPDATE CASCADE;
  
INSERT INTO DISCOGRAFICAS VALUES
(67,"La Septima"),
(68,"Dale Play"),
(69,"Young Money Entertainment"),
(70,"Rimas Entertainment"),
(71,"Sur Capital Records"),
(72,"Discografica LODVG");

insert into grupos values
(4,'Imagine Dragons','Estados Unidos','Imagine Dragons es una banda estadounidense de pop rock originaria de Las Vegas, Nevada. Está compuesta por Dan Reynolds, Wayne Sermon, Ben McKee y Daniel Platzman. Ganó el reconocimiento mundial con el lanzamiento de su álbum de estudio debut Night Visions');

insert into albumes values
(40,'"Origins"','2018',4);

insert into canciones values
(400,'"Natural"','00:03:09',1,40),
(401,'"Boomerang"','00:03:08',2,40),
(402,'"Machine"','00:03:02',3,40),
(403,'"Cool Out"','00:03:38',4,40),
(404,'"Bad Liar"','00:04:21',5,40),
(405,'"West Coast"','00:03:37',6,40),
(406,'"Zero"','00:03:31',7,40),
(407,'"Bullet In a Gun"','00:03:25',8,40),
(408,'"Digital"','00:03:21',9,40),
(409,'"Only"','00:03:01',10,40),
(410,'"Stuck"','00:03:11',11,40),
(411,'"Love"','00:02:46',12,40),
(412,'"Birds"','00:03:39',13,40),
(413,'"Burn Out"','00:04:34',14,40),
(414,'"Real Life"','00:04:08',15,40);

insert into albumes_generos values
(40,7);

insert into albumes_discograficas values
(40,23);


insert into grupos values
(5,'AC/DC','Australia','"AC/DC es una banda de hard rock británica-australiana, formada en 1973 en Australia por los hermanos escoceses Malcolm Young y Angus Young."');

insert into albumes values
(50,'"Back in Black"','1980',5);

insert into albumes_generos values
(50,18);

insert into albumes_discograficas values
(50,34);

insert into canciones values
(501,'"Hells Bells"','00:05:10',1,50),
(502,'"Shoot to Thrill"','00:05:33',2,50),
(503,'"What Do You Do For Money Honey"','00:03:34',3,50),
(504,'"Giving the Dog a Bone"','00:03:34',4,50),
(505,'"Let Me Put My Love Into You"','00:04:12',5,50),
(506,'"Back In Black"','00:04:14',6,50),
(507,'"You Shook Me All Night Long"','00:03:29',7,50),
(508,'"Have a Drink on Me"','00:04:01',8,50),
(509,'"Shake a Leg"','00:04:06',9,50),
(510,'"Rock And Roll Ain´t Noise Pollution"','00:04:12',10,50);

insert into albumes values
(51,'Highway to Hell','1979',5);

insert into albumes_generos values
(51,18);

insert into albumes_discograficas values
(51,34);

insert into canciones values
(511,'"Highway to Hell"','00:03:28',1,51),
(512,'"Girls got Rythm"','00:03:26',2,51),
(513,'"Walk over You"','00:05:11',3,51),
(514,'"Touch too Much"','00:04:27',4,51),
(515,'"Beating Around the Bush"','00:03:58',5,51),
(516,'"Shot Down In Flames"','00:03:26',6,51),
(517,'"Get It Hot"','00:02:37',7,51),
(518,'"If You Want Blood"','00:04:40',8,51),
(519,'"Love Hungry Man"','00:04:19',9,51),
(520,'"Night Prowler"','00:06:30',10,51);


INSERT INTO Grupos
VALUES (18, "Maluma", "Colombia", "Juan Luis Londoño Arias, conocido por su nombre artístico Maluma, es un cantante y compositor colombiano. Saltó a la fama en su país natal en 2011, gracias a los sencillos «Farandulera», «Obsesión», y «La temperatura»; y con «Carnaval», en el resto de América Latina.");
INSERT INTO albumes
VALUES (180, "Papi Juancho", "2020", 18);
INSERT INTO canciones
VALUES (1801, "Me Acuerdo de Ti", "00:03:44", 1, 180);
INSERT INTO canciones
VALUES (1802, "Vete Vete", "00:04:04", 2, 180);
INSERT INTO canciones
VALUES (1803, "Mai Mai", "00:03:58", 3, 180);
INSERT INTO canciones
VALUES (1804, "Parce", "00:04:08", 4, 180);
INSERT INTO canciones
VALUES (1805, "La Cura", "00:02:57", 5, 180);
INSERT INTO canciones
VALUES (1806, "Copas de Vino", "00:03:12", 6, 180);
INSERT INTO canciones
VALUES (1807, "Perdon", "00:03:01", 7, 180);
INSERT INTO canciones
VALUES (1808, "Bella-K", "00:03:44", 8, 180);
INSERT INTO canciones
VALUES (1809, "Madrid", "00:03:19", 9, 180);
INSERT INTO canciones
VALUES (1810, "Cuidau", "00:03:34", 10, 180);
INSERT INTO canciones
VALUES (1811, "Medallo City", "00:03:53", 11, 180);
INSERT INTO canciones
VALUES (1812, "Cielo a un Diablo", "00:03:26", 12, 180);
INSERT INTO canciones
VALUES (1813, "Booty", "00:02:37", 13, 180);
INSERT INTO canciones
VALUES (1814, "Ansiedad", "00:03:41", 14, 180);
INSERT INTO canciones
VALUES (1815, "ADMV (Versión Urbana)", "00:03:05", 15, 180);
INSERT INTO canciones
VALUES (1816, "Hawai", "00:03:19", 16, 180);
INSERT INTO canciones
 VALUES (1817, "Boy Toy", "00:03:16", 17, 180);
INSERT INTO canciones
 VALUES (1818, "Luz Verde", "00:03:04", 18, 180);
INSERT INTO canciones
 VALUES (1819, "Quality", "00:02:41", 19, 180);
INSERT INTO canciones
 VALUES (1820, "Salida de Escape", "00:03:04", 20, 180);
INSERT INTO canciones
 VALUES (1821, "ADMV", "00:03:14", 21, 180);
INSERT INTO canciones
VALUES (1822, "Viento (Interlude)", "00:02:43", 22, 180);
INSERT INTO albumes_generos
VALUES (180, 44);
INSERT INTO albumes_discograficas
VALUES (180, 53);

insert into grupos
values(6, "Mecano", "España", "Mecano fue un grupo español de pop, conocidos por su innovador estilo de tecno-pop, new wave y wave en España. Estuvieron activos principalmente entre 1981 y 1992, con una breve reaparición en 1998. La banda estaba compuesta por Ana Torroja como cantante y los hermanos Nacho y José María Cano.");

insert into albumes
values(60, "Mecano Grandes Exitos", "2005", 6);

insert into canciones
values(600, "Hoy no me puedo levantar", "00:03:18", 1, 60);

insert into canciones
values(601, "Me cole en una fiesta", "00:04:16", 2, 60);

insert into canciones
values(602, "Maquillaje", "00:02:31", 3, 60);

insert into canciones
values(603, "Hijo de la Luna", "00:04:20", 4, 60);

insert into canciones
values(604, "Mujer contra Mujer", "00:04:07", 5, 60);

insert into canciones
values(605, "La Fuerza del Destino", "00:05:12", 6, 60);

insert into albumes_discograficas
values(60,7);

insert into albumes_generos
values(60,6);

insert into grupos
values (7,'la oreja de van gogh','España','La Oreja de Van Gogh (abreviado en ocasiones como LOVG o LODVG) es un grupo musical de género pop-rock originario de San Sebastián, País Vasco, España. Su trayectoria en el mundo de la música comenzó formalmente en 1996. La banda está formada por Pablo Benegas, Álvaro Fuentes, Xabi San Martín, Haritz Garde y Leire Martínez,1​ aunque la vocalista durante los primeros once años fue Amaia Montero, quien en 2007 dejó la formación para iniciar su carrera como solista.2​ Son una banda con éxito en España, Latinoamérica y Estados Unidos con lanzamientos y conciertos puntuales en países que no son de habla hispana, como Francia,[cita requerida] Reino Unido, Japón o Israel.  ');

insert into albumes
values (70,'Dile al Sol ',' 1998',7);

insert into albumes_generos
values (70,7);

insert into albumes_discograficas
values (70,72);

insert into canciones
values (700,'el 28','00:02:49',1,70);

insert into canciones
values (704,'Viejo cuento','00:05:05',5,70);

insert into canciones
values   (701,'cuéntame al oído','00:03:12',2,70);

insert into canciones
values (702,'Pesadilla','00:04:20',3,70);

insert into canciones
values (703,'La estrella y la luna','00:03:48',4,70);

insert into canciones
values (705,'Dos cristales','00:04:24',6,70);

insert into canciones
values(706,'Lloran piedras','00:04:04',7,70),(707,'Qué puedo pedir','00:03:03',8,70);


insert into grupos values
(1,'Melanie Martinez','Estados Unidos','Melanie Martinez es una cantante, compositora, actriz, directora y productora estadounidense. Fue participante del concurso de talentos televisivo The Voice');
insert into albumes values
(10,'K-12','2019',1);
insert into albumes_discograficas values
(10,43);
insert into albumes_generos values
(10,6);
insert into canciones values
(100,'Wheels on the bus ','00:03:40',1,10),
(101,'Class fight ','00:02:41',2,10),
(102,'The principal','00:02:56',3,10),
(103,'Show and tell','00:03:35',4,10),
(104,'Nurse`s office','00:03:22',5,10),
(105,'Drama club','00:03:45',6,10),
(106,'Strawberry shortcake','00:03:04',7,10),
(107,'Lunchbox friends','00:02:49',8,10),
(108,'Orange juice','00:03:37',9,10),
(109,'Detention','00:03:56',10,10),
(110,'Teacher`s pet','00:04:01',11,10),
(111,'High school sweethearts','00:05:11',12,10),
(112,'Recess','00:03:50',13,10),
(113,'Fire Drill','00:04:17',14,10);


insert into grupos values
(16,'Mike Krack','Luxemburgo','Nacido en el 1972 comenzó su carrera a finales de 2022, bajo el nombre de Aston Martin, sus compañeros de banda son el Nano (guitarrista) y Matt Watson (bateria), actualmente solo tienen 3 canciones, pero se esperan muchas más a lo largo de este año.');

Insert into albumes values
(160,'A por la 33','2023',16);

insert into albumes_generos values
(160,8);

insert into canciones values 
(1600,'Camino a la 33','00:04:15',1,160);
insert into canciones values 
(1601,'Test de Barhein','16:52:23',2,160);
insert into canciones values 
(1602,'El dia esperado','00:01:30',3,160);
insert into canciones values 
(1603,'Arabia Saudi GP','00:05:04',4,160);
insert into canciones values 
(1604,'Party in the Australian GP','23:59:59',5,160);
insert into canciones values 
(1605,'Ganara en Barcelona','00:00:34',6,160);
insert into canciones values 
(1606,'También en Monaco','00:00:35',7,160);
insert into canciones values 
(1607,'Lawrence dando volteretas','15:23:56',8,160);
insert into canciones values 
(1608,'Stroll con invidia','00:03:45',9,160);
insert into canciones values 
(1609,'Lo mejor para Alonso','23:59:59',10,160);


insert into grupos
values (11,'Hard GZ','España','Pedro Ruibal, rapero gallego de 27 años fundo su discografica La Utopia del Norte  sus temas siempre tienen un toque de critica social');

insert into albumes
 values (110,'Siempre','2020',11);
 
 insert into albumes_generos
 values (110,4);
 
 insert into albumes_discograficas
 values (110,67);
 
 insert into canciones
 values (1100,'Cambios','00:04:31',1,110);

insert into canciones
values (1101,'El camino','00:04:49',2,110);

insert into canciones
values (1102,'Entre las Luces','00:03:52',3,110);

insert into canciones
values (1103,'La Llave','00:02:53',4,110);

insert into canciones
values (1104,'Chin Chin','00:02:35',5,110);

insert into canciones
values (1105,'Nautilus','00:03:08',6,110);

insert into canciones
values (1106,'Mas Alto','00:03:37',7,110);

insert into canciones
values (1107,'Pelapavas','00:03:47',8,110);

insert into canciones
values (1108,'El Vaso de Olvidar','00:02:45',9,110);

insert into canciones
values (1109,'Barras en la Cantera','00:02:43',10,110);

insert into canciones
values (1110,'Mortales','00:02:56',11,110);

insert into canciones
values (1111,'Flores','00:02:34',12,110);

insert into canciones
values (1112,'Dime Cuanto','00:04:28',13,110);

insert into canciones
values (1113,'Como Messi','00:03:38',14,110);

insert into canciones
values (1114,'Flame Skit','00:01:28',15,110);

insert into canciones
values (1115,'Castillo de Arena','00:02:58',16,110);

insert into grupos values
(8,'Raimon','España','Pequeño equipo de colegio que finalmente crea un grupo de música');
insert into albumes values
(80,'FF1','2004',8),(81,'De Ruta','2007',8);
insert into albumes_generos values
(80,46),(81,46);
insert into albumes_discograficas values
(80,10),(81,10);
insert into canciones values 
(801,'Fantasmikos','00:04:14',1,80),
(802,'Jordi el salvaje','00:02:15',2,80),
(803,'Stop inventing','00:03:46',3,80),
(804,'Una ducha al año no hace daño','00:02:17',4,80),
(805,'Derrocando al derrocador','00:04:33',5,80),
(806,'Ninjago','00:03:29',6,80),
(807,'Granjeros muralleros','00:04:20',7,80),
(808,'Trifecta imperfecta','00:03:51',8,80),
(809,'Los dioses con los dioses','00:04:22',9,80),
(810,'Bonus track Viejales','00:01:30',10,80),
(811,'Tormenta de horóscopos','00:04:22',11,81),
(812,'Baños públicos','00:02:17',12,81),
(813,'Alpes Suizos','00:03:29',13,81),
(814,'Grecia salvaje','00:04:33',14,81),
(815,'Colegio ninja 2.0','00:02:17',15,81),
(816,'Derrocando al derrocador v2','00:04:33',16,81),
(817,'Amusement girls','00:04:22',17,81),
(818,'La María del Tiempo','00:03:29',18,81),
(819,'Generosamente sistemático','00:04:33',19,81),
(820,'La traición','00:04:22',20,81);

insert INTO grupos
values(9,'Chris Brown ','Estados Unidos','Christopher Maurice Brown, ​conocido artísticamente como Chris Brown, es un cantante, compositor, bailarín y actor estadounidense.');
insert INTO albumes
values (90,'Breezy','2022',9);
insert INTO albumes_generos
values (90,43);
insert INTO albumes_discograficas
values (90,20);
insert INTO canciones
VALUES (900,'Sex memories ','00:03:32',1,90),
(901,'Closure ','00:03:04',2,90),
(902,'Call me Every day','00:02:27',3,90),
(903,'Show it','00:03:11',4,90),
(904,'Dream','00:02:54',5,90),
(905,'Iffy','00:03:11',6,90),
(906,'Slide','00:03:39',7,90),
(907,'Forbidden','00:03:08',8,90),
(908,'Survive the night','00:04:08',9,90),
(909,'Sleep at night','00:02:21',10,90),
(910,'Harder','00:03.35',11,90),
(911,'Passing Time','00:03:40',12,90),
(912,'Bad then a beach','00:04:12',13,90),
(913,'We','00:05:10',14,90),
(914,'Pitch Black','00:02:23',15,90),
(915,'Need you right Here ','00:03:45',16,90),
(916,'Addicted','00:04:29',17,90),
(917,'Psychic','00:05:10',18,90),
(918,'Possessive','00:02:12',19,90),
(919,'Luckiest man ','00:03:19',20,90),
(920,'Hmhmm','00:05:23',21,90);


insert into grupos
values (15,"Michael Jackson","Estados Unidos","Michael Joseph Jackson ​ fue un cantante, compositor, productor y bailarín estadounidense");
insert into albumes
values(150,"Thriller",1982,15);
insert into albumes_generos
values(150,6);
insert into albumes_discograficas
values(150,52);


insert into canciones
values (1510,"Billie Jean","00:04:54",7,150);
insert into canciones
values (1511,"Beat it","00:04:59",2,150);
insert into canciones
values (1512,"Thriller","00:04:01",6,150);
insert into canciones
values (1513,"P.Y.T","00:03:59",4,150);
insert into canciones
values (1514,"Wanna be startin somethin","00:06:03",3,150);
insert into canciones
values (1515,"Baby be mine","00:04:20",5,150);
insert into canciones
values (1516,"the girl is mine","00:03:42",1,150);
insert into canciones
values (1517,"human nature","00:04:05",8,150);
insert into canciones
values (1518,"The lady in my life","00:04:59",9,150);

insert into albumes
values(151,"Bad",1987,15);
insert into albumes_generos
values(151,6);
insert into albumes_discograficas
values(151,52);
insert into canciones
values (1519,"Leave me alone","00:04:40",1,151);
insert into canciones
values (1520,"Smooth Criminal","00:04:18",2,151);
insert into canciones
values (1521,"Dirty Diana","00:04:41",3,151);
insert into canciones
values (1522,"The way you make me feel","00:04:58",4,151);
insert into canciones
values (1523,"Another part of me","00:03:55",5,151);
insert into canciones
values (1524,"Speed demon","00:03:46",6,151);
insert into canciones
values (1525,"Liberian girl","00:03:53",7,151);
insert into canciones
values (1527,"Bad","00:04:07",9,151);
insert into canciones       
values (1529,"I just cant stop loving you","00:04:12",11,151);


insert into grupos 
values (12,'Eladio Carrión','Estados Unidos','Rapero y cantante de reguetón y trap latino. Su carrera musical profesional comenzó en 2015 pero tiempo antes ya era influencer en Puerto Rico.');

insert into albumes
values (120,'Sauce Boyz','2020',12);

insert into albumes_generos
values (120,28);

insert into albumes_discograficas
values (120,70);

insert into canciones
values (1200,'Vida buena','00:02:53',1,120),
(1201,'Hielo','00:03:11',2,120),
(1202,'3AM','00:03:28',3,120),
(1203,'Mala mia','00:03:34',4,120),
(1204,'Mi error','00:03:35',5,120),
(1205,'Hennessy','00:03:25',6,120),
(1206,'Ponte linda','00:04:01',7,120),
(1207,'Corone','00:03:04',8,120),
(1208,'Kemba Walker','0:02:33',9,120),
(1209,'Lluvia (Remix)','0:05:20',10,120);


insert into grupos
values (2,'Citizen Soldier','Estados Unidos','El nombre de la banda, Citizen Soldier, es el intento de la banda de personificar las luchas que se libran internamente, y el objetivo de la banda de arrojar luz sobre las luchas cotidianas de aquellos que se sienten ignorados y despreciados.');

insert into albumes
values (20,"Relentless","2019",2);

insert into albumes_generos
values (20,5);

insert into albumes_discograficas
values (20,35);

insert into canciones
values (200,'Better Place','00:05:15',1,20),(201,'If These Scars Could Speak','00:03:54',2,20), (202,'Death of Me','00:03:24',3,20), (203,'In Peaces','00:03:21',4,20), (204,'Devil Inside','00:03:55',5,20), (205,'Cannibal','00:03:59',6,20), (206,'Never Good Enough','00:03:07',7,20), (207,'Kill My Memory','00:03:55',8,20), (208,'Unbreakable','00:03:58',9,20), (209,'Weight of the World','00:03:59',10,20), (210,'Say Goodbye','00:03:57',11,20);


insert into grupos
values (13,'Duki','Argentina','Mauro Ezequiel Lombardo Quiroga, conocido artísticamente como Duki, es un rapero, ex-freestyler y compositor argentino.');
 
insert into albumes
values (130,'Desde el fin del mundo','2021',13);

insert into albumes_generos
values (130,28);

insert into albumes_discograficas
values (130,68);


insert into canciones
values (1300,'Sudor y trabajo','00:03:16',1,130), (1301,'Pintao','00:02:48',2,130), (1302,'Chico estrella','00:02:51',3,130), (1303,'Volando bajito','00:02:18',4,130), (1304,'Cuanto ','00:03:11',5,130), (1305,'Rapido','00:02:19',6,130),(1306,'I don´t know','00:03:39',7,130),(1307,'Sol','00:04:06',8,130),(1308,'Luna','00:03:21',9,130),(1309,'Malbec','00:02:57',10,130),(1310,'Mi diablo','00:03:13',11,130),(1311,'Fifty Fifty','00:04:41',12,130),(1312,'Valentino','00:02:38',13,130),(1313,'Cascada','00:03:13',14,130),(1314,'Ticket','00:03:10',15,130),(1315,'Muriendome','00:02:44',16,130),(1316,'Ella es mi bitch','00:04:08',17,130),(1317,'Muero de fiesta este finde','00:04:09',18,130);


Insert into grupos
values (3,"Trueno","Argentina","Es un rapero, cantante y freestyler argentino.1​2​3​ Es conocido principalmente por su sesión de freestyle «Trueno: Bzrp Freestyle Sessions, Vol. 6», en colaboración con Bizarrap,4​5​ y por la canción «Mamichula» en colaboración con Bizarrap y Nicki Nicole que superó, en poco menos de seis meses, las 220 millones de reproducciones en YouTube");
 insert into albumes
values (30,"bien o mal","2022","3");
insert into albumes_generos
values (30,4);
insert into albumes_discograficas
values (30,71);
insert into canciones
values ("300","tierra zanta","00:03:58","1","30"),
("301","argentina","00:03:54","2","30"),
("302","panama","00:02:52","3","30"),
("303","buenos aires en llamas","00:02:37","4","30"),
("304","hood","00:02:33","5","30"),
("305","solo por vos","00:03:20","6","30"),
("306","fuck el police","00:02:38","7","30"),
("307","jungle","00:02:44","8","30");


insert into grupos
values (14,'Drake','Canada','Aubrey Drake Graham, conocido simplemente como Drake, es un rapero, cantante, compositor, productor discográfico y actor canadiense. Una figura influyente en la música popular contemporánea, Drake ha sido acreditado por popularizar el canto y la sensibilidad del R&B en el hip hop.');
insert into albumes
values (140,'Certified Lover Boy','2021',14);
insert into albumes_generos
values (140,3);
insert into albumes_discograficas
values (140,69);
insert into canciones
values (1400,'Papis home','00:02:58',1,140),
(1401,'Champagne Poetry','00:05:36',2,140),
(1402,'Fountains','00:03:12',3,140),
(1403,'Yebbas heartbreak','00:02:34',4,140),
(1404,'Girls want girls','00:03:05',5,140),
(1405,'Get along better','0:02:46',6,140),
(1406,'Knife talk','00:04:13',7,140),
(1407,'TSU','00:05:08',8,140),
(1408,'Way 2 sexy','00:04:17',9,140),
(1409,'Fair trade','00:04:51',10,140),
(1410,'Pipe down','00:03:25',11,140);


insert into grupos
values ("17","Kid Cudi","Cleveland, Ohio, EE. UU.","rapero, cantante y actor estadounidense de padre mexicano y madre afroestadounidense. Debutó en la música con su mixtape A Kid Named Cudi en el año 2009");

insert into albumes
values ("170","Entergalactic","2022","17");
 
 insert into albumes_generos
 values ("170","4");

insert into albumes_discograficas
value ("170","51");

insert into canciones value ("1700","willing to trust","00:04:34","1","170");
insert into canciones value("1701","cant believe it","00:02:53","2","170");
insert into canciones value("1702","entergalactic theme","00:01:31","3","170");
insert into canciones value ("1704","burrow bonus track","00:03:32","3","170");
insert into canciones value ("1705","can't shake her","00:02:57","4","170");
insert into canciones value ("1706","do what i want","00:02:53","5","170");
insert into canciones value ("1707","somewhere to fly","00:02:57","6","170");
insert into canciones value ("1708","new mode","00:03:57","7","170");
insert into canciones value ("1709","in love","00:03:39","8","170");
insert into canciones value ("1703","maybe so","00:03:39","9","170");


