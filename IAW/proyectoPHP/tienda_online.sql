-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 16-02-2026 a las 11:38:29
-- Versión del servidor: 8.4.3
-- Versión de PHP: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_online`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `consola` varchar(20) NOT NULL,
  `precio` float NOT NULL,
  `stock` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `consola`, `precio`, `stock`) VALUES
(1, 'The Legend of Zelda: Tears of the Kingdom', 'Switch', 59.99, 15),
(2, 'Super Mario Odyssey', 'Switch', 49.99, 20),
(3, 'Mario Kart 8 Deluxe', 'Switch', 54.99, 25),
(4, 'Animal Crossing: New Horizons', 'Switch', 49.99, 12),
(5, 'Splatoon 3', 'Switch', 54.99, 18),
(6, 'God of War Ragnarök', 'PS5', 69.99, 8),
(7, 'Spider-Man 2', 'PS5', 69.99, 10),
(8, 'Horizon Forbidden West', 'PS5', 59.99, 14),
(9, 'The Last of Us Part II', 'PS5', 49.99, 22),
(10, 'Gran Turismo 7', 'PS5', 64.99, 9),
(11, 'Halo Infinite', 'Xbox', 59.99, 12),
(12, 'Forza Horizon 5', 'Xbox', 54.99, 16),
(13, 'Gears 5', 'Xbox', 39.99, 20),
(14, 'Starfield', 'Xbox', 69.99, 7),
(15, 'Sea of Thieves', 'Xbox', 44.99, 18),
(16, 'Elden Ring', 'PC', 59.99, 30),
(17, 'Cyberpunk 2077', 'PC', 49.99, 15),
(18, 'Red Dead Redemption 2', 'PC', 54.99, 11),
(19, 'The Witcher 3', 'PC', 39.99, 25),
(20, 'Baldur\'s Gate 3', 'PC', 69.99, 6),
(21, 'test', 'PC', 67.67, 67);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
