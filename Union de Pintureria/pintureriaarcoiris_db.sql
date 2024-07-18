-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-06-2024 a las 03:09:12
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
-- Base de datos: `pintureriaarcoiris_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesorios`
--

CREATE TABLE `accesorios` (
  `id_producto` int(11) NOT NULL,
  `medidas` varchar(50) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `accesorios`
--

INSERT INTO `accesorios` (`id_producto`, `medidas`, `tipo`) VALUES
(111, '10 cm', 'Brocha de Pintura'),
(112, '2 pulgadas', 'Cinta de Pintor'),
(113, 'Grano medio', 'Lija de Grano Medio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `dirección` varchar(255) DEFAULT NULL,
  `datos_contacto` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_actualización` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mini_ferreteria`
--

CREATE TABLE `mini_ferreteria` (
  `id_producto` int(11) NOT NULL,
  `garantia` varchar(50) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mini_ferreteria`
--

INSERT INTO `mini_ferreteria` (`id_producto`, `garantia`, `tipo`) VALUES
(114, '1 año', 'Destornillador Phillips'),
(115, '2 años', 'Cinta Métrica 5m'),
(116, '2 años', 'Taladro Percutor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paleta_de_color`
--

CREATE TABLE `paleta_de_color` (
  `id_paleta` int(11) NOT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `codigo_de_color` varchar(50) DEFAULT NULL,
  `nombre_color` varchar(100) DEFAULT NULL,
  `tintes_utilizados` text DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `fecha_pedido` date DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pinturas`
--

CREATE TABLE `pinturas` (
  `id_producto` int(11) NOT NULL,
  `litros` decimal(5,2) DEFAULT NULL,
  `funcion_aplicacion` enum('exterior','interior','metal','madera','sintética','membrana') NOT NULL,
  `codigo_de_color` varchar(50) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `terminacion` enum('mate','brillante','semimate','satinada') NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_actualización` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pinturas`
--

INSERT INTO `pinturas` (`id_producto`, `litros`, `funcion_aplicacion`, `codigo_de_color`, `fecha_vencimiento`, `terminacion`, `fecha_creacion`, `fecha_actualización`, `tipo`) VALUES
(117, 10.50, 'interior', '#FFFFFF', '2025-06-01', 'mate', '2024-06-23', '2024-06-23 12:52:58', NULL),
(118, 5.00, 'exterior', '#000000', '2025-06-01', 'brillante', '2024-06-23', '2024-06-23 12:52:58', NULL),
(119, 2.50, 'metal', '#FF0000', '2025-06-01', 'satinada', '2024-06-23', '2024-06-23 12:52:58', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock_cantidad` int(11) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `descripción` text DEFAULT NULL,
  `tipo_productos` enum('Pinturas','Accesorios','Mini-ferretería') NOT NULL,
  `fecha_ultima_actualización` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `precio`, `stock_cantidad`, `marca`, `imagen`, `descripción`, `tipo_productos`, `fecha_ultima_actualización`, `id_proveedor`) VALUES
(111, 19.99, 45, 'Brocha de Pintura', 'brocha.jpg', 'Brocha para pintura de alta calidad', 'Accesorios', '2024-06-23 14:46:23', 16),
(112, 29.99, 22, 'Destornillador Phillips', 'Destornillador.jpg', 'Destornillador con punta Phillips', 'Mini-ferretería', '2024-06-23 17:33:42', 17),
(113, 49.99, 19, 'Pintura Látex Blanca', 'latex.jpg', 'Pintura látex blanca para interiores', 'Pinturas', '2024-06-23 17:31:53', 18),
(114, 9.99, 100, 'Lija de Grano Fino', 'lija.jpg', 'Lija de grano fino para acabados finos', 'Accesorios', '2024-06-23 12:48:59', 16),
(115, 39.99, 15, 'Cinta Métrica 5m', 'cinta.jpg', 'Cinta métrica de 5 metros', 'Mini-ferretería', '2024-06-23 12:48:59', 17),
(116, 79.99, 10, 'Pintura Sintética Negra', 'sintetica.jpg', 'Pintura sintética negra para exterior', 'Pinturas', '2024-06-23 12:48:59', 18),
(117, 14.99, 80, 'Rodillo de Pintura', 'rodillo.jpg', 'Rodillo para pintura con mango ergonómico', 'Accesorios', '2024-06-23 12:48:59', 16),
(118, 59.99, 25, 'Taladro Percutor', 'taladro.jpg', 'Taladro percutor con función de martillo', 'Mini-ferretería', '2024-06-23 12:48:59', 17),
(119, 89.99, 8, 'Pintura Satinada Gris', 'satinada.jpg', 'Pintura satinada gris para metal', 'Pinturas', '2024-06-23 12:48:59', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `teléfono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `dirección` varchar(255) DEFAULT NULL,
  `fecha_actualización` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre`, `teléfono`, `correo`, `dirección`, `fecha_actualización`) VALUES
(16, 'Ferretería Alfa', '1122334455', 'info@ferreteriaalfa.com', 'Av. Principal 123, Ciudad A', '2024-06-23 12:45:42'),
(17, 'Pinturas Beta', '9988776655', 'contacto@pinturasbeta.com', 'Calle Secundaria 456, Ciudad B', '2024-06-23 12:45:42'),
(18, 'Accesorios Gamma', '5544332211', 'ventas@accesoriosgamma.com', 'Plaza Comercial 789, Ciudad C', '2024-06-23 12:45:42'),
(19, 'Materiales Delta', '6677889900', 'info@materialesdelta.com', 'Carretera Federal 101, Ciudad D', '2024-06-23 12:45:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pv`
--

CREATE TABLE `pv` (
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `precio_del_momento` decimal(10,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `clasificación` enum('Cliente','Administrador') NOT NULL,
  `fecha_ingreso` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualización` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `forma_de_pago` enum('efectivo','tarjeta') NOT NULL,
  `fecha_de_venta` date DEFAULT NULL,
  `productos_vendidos` text DEFAULT NULL,
  `valor_de_venta` decimal(10,2) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vv`
--

CREATE TABLE `vv` (
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `precio_del_momento` decimal(10,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `mini_ferreteria`
--
ALTER TABLE `mini_ferreteria`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `paleta_de_color`
--
ALTER TABLE `paleta_de_color`
  ADD PRIMARY KEY (`id_paleta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `pinturas`
--
ALTER TABLE `pinturas`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `pv`
--
ALTER TABLE `pv`
  ADD PRIMARY KEY (`id_venta`,`id_producto`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `vv`
--
ALTER TABLE `vv`
  ADD PRIMARY KEY (`id_pedido`,`id_producto`),
  ADD KEY `id_producto` (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paleta_de_color`
--
ALTER TABLE `paleta_de_color`
  MODIFY `id_paleta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accesorios`
--
ALTER TABLE `accesorios`
  ADD CONSTRAINT `accesorios_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `mini_ferreteria`
--
ALTER TABLE `mini_ferreteria`
  ADD CONSTRAINT `mini_ferreteria_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `paleta_de_color`
--
ALTER TABLE `paleta_de_color`
  ADD CONSTRAINT `paleta_de_color_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `pinturas` (`id_producto`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

--
-- Filtros para la tabla `pinturas`
--
ALTER TABLE `pinturas`
  ADD CONSTRAINT `pinturas_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);

--
-- Filtros para la tabla `pv`
--
ALTER TABLE `pv`
  ADD CONSTRAINT `pv_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  ADD CONSTRAINT `pv_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `vv`
--
ALTER TABLE `vv`
  ADD CONSTRAINT `vv_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `vv_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
