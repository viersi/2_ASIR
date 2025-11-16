--
-- Base de datos: `MUSICA_ASIR2024`
--
CREATE DATABASE MUSICA_ASIR2024;
USE MUSICA_ASIR2024;
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



INSERT INTO `generos` (`cod_genero`, `genero`) VALUES (51, 'clasico');
insert into discograficas values (56, "patrimonio mundial");

insert into grupos values (10 , "Frederick chopin", "Polaco", "nacido el 1 de marzo de 1810 fue un pianista muy reconocido en su epoca por grandes piezas, fallecio en 1849") ;

insert into albumes values (100,"nocturnos","1930", 10);

insert into canciones values (1000,"nocturno op.9 n.º1", "00:05:00", 1, 100);
insert into canciones values (1001,"nocturno op.9 n.º2", "00:05:00", 2, 100);
insert into canciones values (1002,"nocturno op.9 n.º3", "00:06:00", 3, 100);

insert into albumes_discograficas values(100,56);
insert into albumes_generos values(100,51);



INSERT INTO `generos` (`cod_genero`, `genero`) VALUES
(52, 'alternativa/indi');
INSERT INTO `grupos` (`cod_grupo`, `nombre`,`nacionalidad`, `biografia`) VALUES
(1, 'Fall out boys',"estadounidenses","Fall Out Boy es una banda de rock estadounidense formada en Wilmette, 
Illinois, un suburbio de Chicago, en 2001. La banda está compuesta por el vocalista principal y guitarrista Patrick Stump, 
el bajista Pete Wentz, el baterista Andy Hurley y el guitarrista Joe Trohman." );

INSERT INTO albumes VALUES
(10,'American beauty/American Psycho',"2015",1);

INSERT INTO albumes_generos VALUES
(10,52);
INSERT INTO albumes_discograficas VALUES
(10,29);
INSERT INTO canciones VALUES
(100, 'Irresistible',"00:03:26",1,10),
(101, 'American beauty/American Psycho',"00:03:15",2,10),
(102, 'Centuries',"00:03:48",3,10),
(103, 'The kids aren´t Alright',"00:04:20",4,10),
(104, 'Uma thurman',"00:03:31",5,10),
(105, 'Jet Pack Blues',"00:02:59",6,10),
(106, 'Novocaine',"00:03:46",7,10),
(107, 'Fourth Of July',"00:03:44",8,10),
(108, 'Favorite record',"00:03:23",9,10),
(109, 'Inmortals',"00:03:09",10,10),
(110, 'Twin Skeleton´s(Hotel In NYC)',"00:03:40",11,10);

insert into grupos values
(13, "Kaze", "Español", "Cristian, MC cartagenero de 24 años lleva dándole fuerte al rap desde los 13 años, a base de esfuerzo, constancia y dedicación. Con 16 años empezó a formar parte de carteles acompañando a artistas de nivel internacional como Gordo Master, Duo Kie, Piezas, Xhelazz o Sho-Hai.");

insert into albumes values
(130, "Nombre Dirección", "2023", "13");

insert into canciones values
(1300, "Cuando Despertó", "00:03:47", "21", "130"),
(1301, "Record", "00:05:30", "7", "130"),
(1302, "Relájateee", "00:04:07", "13", "130"),
(1303, "Ta to clin", "00:03:54", "19", "130"),
(1304, "Cris starr", "00:02:59", "20", "130"),
(1305, "4 roses", "00:03:12", "16", "130"),
(1306, "Compostela 12", "00:03:03", "5", "130");

insert into albumes_generos
value ("130", "34");



insert into grupos 
values (11, "RelsB", "Español", "es un cantante y compositor exponente del género del rap y hip hop. Nació el 18 de octubre de 1993 en Palma de Mallorca y actualmente es una de las estrellas más grandes dentro de su estilo musical en España y varios países de Latinoamérica");

insert into albumes
values (110, "AfroLOVA´23", 2023, 11);

insert into canciones
values (1100, "AfroLOVA´", "00:02:37", "1", 110) , 
(1101, "Un rodeoooo", "00:02:54", "2", 110),
(1102, "Sin gato (MIAU!)", "00:03:17", "3", 110),
(1103, "baby BOO", "00:02:11", "4", 110),
(1104, "Solita y sueltAAA", "00:02:36", "5", 110),
(1105, "Un tiempo jajajajja - con Tempoe", "00:02:50", "6", 110),
(1106, "Media pastiii", "00:02:39", "7", 110),
(1107, "No sé si tú no", "00:02:31", "8", 110),
(1108, "SONRÍE", "00:02:22", "9", 110);


insert into albumes_generos 
values (110, 31), (110, 6), (110, 4), (110, 44), (110, 28);

insert into albumes_discograficas 
values (110, 32);

insert into grupos
value (14 , "Daddy Yanke", "Puerto Rico", "amón Luis Ayala Rodríguez, conocido artísticamente como Daddy Yankee, es un cantante, compositor, productor discográfico, filántropo, locutor de radio​ y empresario");

insert into albumes
value (140, "Prestige", "2012" , "14");

insert into canciones
value (14001, "El Amante", "00:03:41", "2", "140"),
(14002, "La Noche De Los Dos", "00:03:43", "3", "140"),
(14003, "Miss Show", "00:02:49", "4", "140"),
(14004, "Pasarela", "00:03:14", "5", "140"),
(14005, "LLegamos A La Disco", "00:07:33", "6", "140"),
(14006, "Pon T Loca", "00:02:59", "7", "140"),
(14007, "Limbo", "00:03:44", "8", "140"),
(14008, "Lovumba", "00:03:39", "9", "140"),
(14009, "Ven Conmigo", "00:03:40", "10", "140");

insert into albumes_generos
value ("140" , "44");

insert into albumes_discograficas
value("140" , "23");



INSERT INTO GRUPOS 
VALUES (7,"Keane","Británica","es una banda inglesa de rock alternativo procedente de Battle, East Sussex, en el sureste de Inglaterra.
Sus primeros 4 álbumes en estudio, Hopes and Fears (2004), Under The Iron Sea (2006), Perfect Symmetry (2008) y Strangeland (2012) 
fueron directos al número 1 de la lista británica de ventas UK Albums Chart" );

INSERT INTO ALBUMES
VALUES (70,"Hopes and Fears","2004",7),
(71,"Under The Iron Sea","2006",7),
(72,"Perfect Symmetry","2008",7);

INSERT INTO CANCIONES
VALUES (700,"Somewhere only we know","00:03:57",1,70),
(712,"Bend and Break","00:03:00",2,70),
(713,"We Might as Well Be Strangers","00:03:25",3,70),
(714,"Your Eyes Open","00:03:40",4,70),
(715,"This is the last time","00:03:29",5,70),
(716,"Everybody's Changing","00:03:35",6,70),
(717,"Bedshaped","00:04:38",7,70),
(701,"Nothing in my way","00:03:55",3,71),
(702,"The lovers are losing","00:05:05",5,72);


INSERT INTO ALBUMES_GENEROS 
VALUES (70,7),
(71,7),
(72,7);

INSERT INTO ALBUMES_DISCOGRAFICAS
VALUES (70,23),
(71,23),
(72,23);

INSERT INTO grupos
VALUES (5, "Mägo de OZ", "Española", "Mägo de Oz es una banda española de Folk Metal fundada en Madrid el 7 de julio de 1988 por Txus di Fellatio. Consagrada como una de las bandas más reconocidas e importantes del Heavy Metal en español, a su vez siendo la más popular e influyente del Metal hispano");

INSERT INTO albumes
VALUES (50, "Finisterra", "2000", 5);

INSERT INTO canciones
VALUES (500, "Satania", "00:08:17", 1, 50), (501, "La Danza del Fuego", "00:05:14",2, 50), (502, "Hasta que el Cuerpo Aguante", "00:04:33", 3, 50), (503, "Fiesta Pagana", "00:04:57", 4, 50), (504, "El que quiera entender que entienda", "00:07:30", 5, 50), (505, "Astaroth", "00:06:32", 6, 50);

INSERT INTO albumes_generos
VALUES (50, 19);

INSERT INTO albumes_discograficas
VALUES (50, 6);

insert into grupos
value (12,"Fito & Fitipaldis","España","Este grupo de rock español surgió en 1998 cuando el cantante de Platero y Tú, Fito Cabrales, decidió separarse y fundar su propio grupo con la intención de publicar temas más novedosos que los de su anterior grupo");

insert into albumes
value (120, "Por la boca vive el pez", "2006", 12);

insert into canciones
value (121, "Por La Boca Vive El Pez","00:04:28", "1", 120),
(122, "Me Equivocaría Otra Vez","00:05:05", "2", 120),
(123, "Como Pollo Sin Cabeza","00:04:10", "3", 120),
(124, "Sobra La Luz","00:03:35", "4", 120),
(125, "Viene Y Va","00:04:34", "5", 120),
(126, "214 Sullivan Street","00:02:14", "6", 120),
(127, "Donde Todo Empieza","00:05:32", "7", 120),
(128, "Deltoya","00:02:25", "8", 120),
(129, "Acabo De Llegar","00:06:15", "9", 120),
(130, "No Soy Bo Diddley","00:03:49", "10", 120),
(131, "Medalla De Cartón","00:05:18", "11", 120),
(132, "Esta Noche","00:04:03", "12", 120),
(133, "Abrazado A La Tristeza","00:03:25", "13", 120);

insert into albumes_generos
value (120,5);

insert into albumes_discograficas
value (120,10),(120,44);





INSERT INTO Grupos 
VALUES ( 9, "Taylor Swift", "estadounidense", "nacida el 13 de diciembre de 1989 en Reading, Pensilvania, es una cantante, compositora y actriz. Comenzó su carrera en la música country y luego se trasladó al pop.");

INSERT INTO Albumes (cod_album, titulo, fecha, cod_grupo)
VALUES ( 90, "Reputation", "2017", 9);

INSERT INTO Canciones
VALUES (900, "Tim McGraw", "00:3:54", 1, 90),
               (901, "Our Song", "00:3:22", 2, 90),
	   (902, "Should've Said No", "00:4:06", 3, 90);

INSERT INTO Albumes_generos
VALUES (90, 6);

INSERT INTO Albumes_discograficas
VALUES (90, 6);



INSERT INTO grupos
VALUES (6, "Corona", "Italiana", "es un grupo italiano de Eurodance liderado por la cantante brasileña Olga de Souza y producida por Francesco Bontempi (también conocido como Lee Marrow), Francesco Alberti, Graziano Fanelli, Theo Spagna, Antonia Bottari, Annerley Gordon, Fred Di Bonaventura, Francesco Conte y Paolo Dughero");

INSERT INTO albumes
VALUES (60, "The Rhythm of the Night", "1993", 6);


INSERT INTO canciones
VALUES (600, "The Rhythm of the Night", "00:04:20", 1, 60);

INSERT INTO albumes_generos
VALUES (60, 25);

INSERT INTO albumes_discograficas
VALUES (60, 28);

insert into grupos
values ("3", "Wu-Tang Clan", "Estados Unidos", "Grupo de rap de los 90");

insert into albumes
values ("30","Enter the Wu-Tang (36 Chambers)", "1993", "3");

insert into canciones
values ("300", "c.r.e.a.m.","4:12", "8","30");

insert into canciones
values ("301", "Bring da ruckus","4:11", "1","30");

insert into canciones
values ("302", "Shame on a N****","2:57", "2","30");

insert into canciones
values ("303", "Method Man","4:47", "3","30");

insert into canciones
values ("304", "Protect ya neck","4:51", "10","30");

insert into canciones
values ("305", "7th chamber","3:12", "4","30");

insert into canciones
values ("306", "Can it be so simple.","6:10", "5","30");

insert into canciones
values ("307", "Da Mystery of Chessboxing","4:47", "6","30");

insert into canciones
values ("308", "WUTANG CLAN AINT NOTHING TO FUCK WITH","2:12", "7","30");

insert into canciones
values ("309", "Clan in da font","5:12", "9","30");

insert into discograficas
values ("57", "LoudRecords");
insert into albumes_discograficas
values ("30", "57"); 
insert into albumes_generos
values ("30", "4");


INSERT INTO GRUPOS 
VALUES (4, "Aventura", "Estados Unidos", "Aventura es una agrupación estadounidense de bachata fundada por Anthony 'Romeo' Santos, Lenny Santos, Max Agende Santos y Henry Santos. Son considerados como uno de los grupos latinos más influyentes de todos los tiempos");


INSERT INTO ALBUMES 
VALUES (40, "We Broke The Rules", 2002, 4),
(41, "Todavía Me Amas: Lo Mejor de Aventura", 2016, 4);


INSERT INTO CANCIONES 
VALUES (400, "Obsesión", "00:04:15", 1, 40), 
(401, "I Belive", "00:04:40", 2, 40), 
(402, "Todavía Me Amas", "00:04:45", 3, 40), 
(403, "Cuando Volverás", "00:03:33", 4, 40), 
(404, "Amor de Madre", "00:05:51", 5, 40), 
(405, "Gone", "00:04:28", 6, 40), 
(406, "Mi Puerto Rico", "00:03:52", 7, 40), 
(407, "Enseñame A Olvidar", "00:05:49", 8, 40), 
(408, "Nueve Quince (9:15)", "00:04:25", 9, 40), 
(409, "Obsesion (English Remix)", "00:04:11", 10, 40);


INSERT INTO CANCIONES VALUES (410, "Obsesion (Recap)", "00:04:15", 1, 41), 
(411, "El Perdedor", "00:03:35", 2, 41), 
(412, "Dile al Amor", "00:03:49", 3, 41), 
(413, "Ella y Yo", "00:04:28", 4, 41), 
(414, "Todavía Me Amas (Recap)", "00:04:44", 5, 41), 
(415, "Su Veneno", "00:04:01", 6, 41), 
(416, "Los Infieles", "00:04:38", 7, 41), 
(417, "El Malo", "00:03:59", 8, 41), 
(418, "Un Beso", "00:04:23", 9, 41), 
(419, "Por Un Segundo", "00:04:15", 10, 41), 
(420, "Enseñame A Olvidar (Recap)", "00:05:48", 11, 41), 
(421, "Amor De Madre (Recap)", "00:04:15", 12, 41), 
(422, "Lágrimas", "00:03:45", 13, 41), 
(423, "Me Voy", "00:04:23", 14, 41);


INSERT INTO GENEROS
VALUES (58, "Bachata");


INSERT INTO ALBUMES_GENEROS
VALUES (40, 58),
(41, 58);


INSERT INTO DISCOGRAFICAS
VALUE (58, "Premium Latin Music");


INSERT INTO ALBUMES_DISCOGRAFICAS
VALUES (40, 58),
(41, 58);


insert into grupos values (15, "Gloosito", "Español", "Gloosito (1996, Collado Villalba) es el aire fresco que necesitaba la escena urbana nacional.
Junto a CTDS (Shynelevell, JayDime) ha liderado un nuevo sonido y estética que ha cautivado al público más exigente. Barras de peso sobre Detroit Beats y una cadencia adictiva han llevado al joven madrileño a presentar su música en Infierno, Costa Social Club, Chachá o Teledeporte (Madrid Urban Sports) y a colaborar con artistas como Kaydy Cain o Yung Beef.");

insert into albumes values (150,"S.U.V","2024","15");

insert into canciones values
(1500, "Nitro", "00:02:19", "1", "150"),
(1501, "Alto Cargo Pt.2", "00:02:21", "2", "150"),
(1502, "As Bestas", "00:01:36", "3", "150"),
(1503, "Ghetto Confetti", "00:02:31", "4", "150"),
(1504, "Dona-Dona", "00:01:32", "5", "150"),
(1505, "4 Diff Typa Wizz", "00:02:38", "6", "150"),
(1506, "Rico para siempre", "00:02:00", "7", "150"),
(1507, "Tripstar", "00:02:26", "8", "150"),
(1508, "12pound Freestyle", "00:02:08", "9", "150"),
(1509, "Lime Life", "00:02:26", "10", "150"),
(1510, "Outro S.U.V", "00:01:40", "11", "150");





insert into grupos
values (2,"linkin Park","EEUU","Linkin Park es una banda estadounidense de rock alternativo procedente de Agoura Hills, California formada en 1996. Integrada por Mike Shinoda, Dave Farrell, Joe Hahn, Brad Delson, Rob Bourdon y Chester Bennington, este último como voz principal. La banda comenzó con sus primeros trabajos musicales de manera independiente, en la que grabaron su primer material, llamado Xero; sin embargo, no tuvieron éxito en la búsqueda de un sello discográfico, ya que nadie mostraba interés por su trabajo. No fue hasta 1999, que con el apoyo de Jeff Blue, quien ejercía como vicepresidente de Warner Records, lograron firmar su primer contrato. El nombre proviene de un juego de palabras que hace referencia al Lincoln Park en Santa Mónica.8​9​");
insert into albumes
values (20,"Hybrid Theory","2000",2);
insert into canciones
values (200,"Papercut","3:04",1,20);
insert into canciones
values (201,"One step Closer","00:2:37",2,20),
(202,"With You","00:3:23",3,20),
(203,"Points of Authority","00:3:20",4,20),
(204,"Crawling","00:3:28",5,20);
insert into canciones
values (205,"Runaway","00:03:03",6,20),
(206,"By Myself","00:03:09",7,20),
(207,"In the end","00:03:36",8,20),
(208,"A place for my head","00:03:04",9,20),
(209,"Forgotten","00:03:14",10,20);
insert into albumes_generos
values (20,5),(20,2),(20,20);
insert into albumes_discograficas
values (20,49);






INSERT INTO grupos
VALUES (8, "Måneskin", "Italiana", 
"Måneskin es una banda de rock alternativo de origen italiano. Se formó en Roma en 2016 y está compuesta por Victoria De Angelis, Damiano David, Thomas Raggi y Ethan Torchio. El nombre de la banda, proveniente del danés, significa Luz de Luna. La banda se dio a conocer en 2017 mientras participaba en el X Factor Italia, al tiempo que debutaba 
con el EP Chosen");

INSERT INTO albumes
VALUES (80, "Teatro d`ira: Vol. I", "2021", 8);

INSERT INTO canciones
VALUES 
(800, "Zitti e buoni", '00:03:14', 1, 80),
(801, "Coraline", '00:05:00', 2, 80),
(802, "Lividi sui gomiti", '00:02:45', 3, 80),
(803, "I Wanna Be Your Slave", '00:02:54', 4, 80),
(804, "In nome del padre", '00:03:39', 5, 80),
(805, "For Your Love", '00:03:50', 6, 80),
(806, "La paura del buio", '00:03:29', 7, 80),
(807, "Vent'anni", '00:04:13', 8, 80);

INSERT INTO albumes_generos
VALUES (80, 7);

INSERT INTO albumes_discograficas
VALUES (80, 28);
