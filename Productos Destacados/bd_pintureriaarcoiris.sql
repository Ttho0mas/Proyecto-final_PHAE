-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-05-2024 a las 04:13:37
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_pintureriaarcoiris`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesorios`
--

CREATE TABLE `accesorios` (
  `id_producto` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `medidas` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `IDC` varchar(100) NOT NULL,
  `nombrec` varchar(200) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `datos_conta` varchar(200) NOT NULL,
  `fecha_naci` date NOT NULL,
  `fecha_ulactua` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mini_ferreteria`
--

CREATE TABLE `mini_ferreteria` (
  `id_producto` int(11) NOT NULL,
  `garantia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paleta_de_color`
--

CREATE TABLE `paleta_de_color` (
  `Marca` varchar(255) DEFAULT NULL,
  `Codigo_de_color` int(11) NOT NULL,
  `nombre_color` varchar(255) DEFAULT NULL,
  `tintes_utilizados` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pinturas`
--

CREATE TABLE `pinturas` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `litros` decimal(5,2) DEFAULT NULL,
  `funcion_aplicacion` enum('exterior','interior','metal','madera','sintetica','membrena') DEFAULT NULL,
  `Codigo_de_color` int(11) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `tono` varchar(255) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock_cantidad` int(11) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `imagen` blob DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `tipo_productos` enum('Pinturas','Accesorios','Miniferreteria') DEFAULT NULL,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_`
--

CREATE TABLE `productos_` (
  `id_producto` int(11) NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock_cantidad` int(11) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `imagen` blob DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `tipo_productos` enum('Pinturas','Accesorios','Miniferreteria') DEFAULT NULL,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos_`
--

INSERT INTO `productos_` (`id_producto`, `precio`, `stock_cantidad`, `marca`, `imagen`, `descripcion`, `tipo_productos`, `fecha_actualizacion`) VALUES
(1, 25.99, 50, 'Sherwin Williams', NULL, 'Pintura acrílica para exteriores', 'Pinturas', '2024-05-30 01:48:47'),
(2, 5.99, 100, 'Rodapin', NULL, 'Brocha plana de 2 pulgadas', 'Accesorios', '2024-05-30 01:48:47'),
(3, 15.50, 30, 'Titanlux', NULL, 'Pintura para madera color roble', 'Pinturas', '2024-05-30 01:48:47'),
(4, 8.75, 80, 'Bosch', NULL, 'Rodillo de pintura de 9 pulgadas', 'Accesorios', '2024-05-30 01:48:47'),
(5, 12.99, 120, 'Arteza', NULL, 'Set de 10 pinceles de diferentes tamaños', 'Accesorios', '2024-05-30 01:48:47'),
(6, 3.25, 200, 'Perfex', NULL, 'Paletina triple amarilla de 1.5 pulgadas', 'Accesorios', '2024-05-30 01:48:47'),
(7, 20.00, 40, 'Rust-Oleum', NULL, 'Pintura para metal color gris metálico', 'Pinturas', '2024-05-30 01:48:47'),
(8, 6.50, 60, 'Stanley', NULL, 'Espátula de acero inoxidable de 4 pulgadas', 'Accesorios', '2024-05-30 01:48:47'),
(9, 30.99, 25, 'Picasso', NULL, 'Set de herramientas de pintura', 'Accesorios', '2024-05-30 01:48:47'),
(10, 25.99, 50, 'Sherwin Williams', NULL, 'Pintura acrílica para exteriores', 'Pinturas', '2024-05-30 01:57:03'),
(16, 3.25, 200, 'Perfex', NULL, 'Paletina triple amarilla de 1.5 pulgadas', 'Accesorios', '2024-05-30 01:57:03'),
(17, 20.00, 40, 'Rust-Oleum', NULL, 'Pintura para metal color gris metálico', 'Pinturas', '2024-05-30 01:57:03'),
(18, 6.50, 60, 'Stanley', NULL, 'Espátula de acero inoxidable de 4 pulgadas', 'Accesorios', '2024-05-30 01:57:03'),
(19, 30.99, 25, 'Picasso', NULL, 'Set de herramientas de pintura', 'Accesorios', '2024-05-30 01:57:03'),
(20, 5.99, 100, 'Rodapin', NULL, 'Brocha plana de 2 pulgadas', 'Accesorios', '2024-05-30 01:57:03'),
(30, 15.50, 30, 'Titanlux', NULL, 'Pintura para madera color roble', 'Pinturas', '2024-05-30 01:57:03'),
(40, 8.75, 80, 'Bosch', NULL, 'Rodillo de pintura de 9 pulgadas', 'Accesorios', '2024-05-30 01:57:03'),
(50, 12.99, 120, 'Arteza', NULL, 'Set de 10 pinceles de diferentes tamaños', 'Accesorios', '2024-05-30 01:57:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `IDU` bigint(20) UNSIGNED NOT NULL,
  `correo` varchar(100) NOT NULL,
  `password` varchar(256) NOT NULL,
  `nombreu` varchar(200) NOT NULL,
  `fecha_ulactua` date NOT NULL,
  `fecha_ing` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IDU`, `correo`, `password`, `nombreu`, `fecha_ulactua`, `fecha_ing`) VALUES
(1, '1234gtoto@gmail.com', '1223', 'ThomasCoimbra', '0000-00-00', '2024-05-23 23:43:11'),

;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accesorios`
--
ALTER TABLE `accesorios`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`IDC`);

--
-- Indices de la tabla `mini_ferreteria`
--
ALTER TABLE `mini_ferreteria`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `paleta_de_color`
--
ALTER TABLE `paleta_de_color`
  ADD PRIMARY KEY (`Codigo_de_color`);

--
-- Indices de la tabla `pinturas`
--
ALTER TABLE `pinturas`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `productos_`
--
ALTER TABLE `productos_`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IDU`),
  ADD UNIQUE KEY `IDU` (`IDU`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IDU` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accesorios`
--
ALTER TABLE `accesorios`
  ADD CONSTRAINT `accesorios_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `mini_ferreteria`
--
ALTER TABLE `mini_ferreteria`
  ADD CONSTRAINT `mini_ferreteria_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `pinturas`
--
ALTER TABLE `pinturas`
  ADD CONSTRAINT `pinturas_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
