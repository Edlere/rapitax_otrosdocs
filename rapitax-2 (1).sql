-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-11-2019 a las 06:22:44
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rapitax`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `choferes`
--

CREATE TABLE `choferes` (
  `id` int(11) NOT NULL,
  `brevete` varchar(20) NOT NULL,
  `DNI` varchar(8) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `categoria` varchar(40) NOT NULL,
  `fechanac` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `choferes`
--

INSERT INTO `choferes` (`id`, `brevete`, `DNI`, `nombres`, `apellidos`, `categoria`, `fechanac`) VALUES
(1, 'Q238759', '46582345', 'Juan Jesus', 'Palomares Vega', 'A-II', '1976-11-14'),
(2, 'Q762598', '76283839', 'Miguel Angel', 'Mendoza Castañeda', 'A-III', '1970-02-11'),
(3, 'E537939', '32449732', 'Rodrigo Said', 'Flores Garcías', 'A-II', '1980-01-04'),
(4, 'R432122', '32467784', 'Alexander Agustin', 'Alegre Suarez', 'A-III', '1981-12-12'),
(5, 'E276421', '72544909', 'Aldo Alberto', 'Quispe Lopez', 'A-II', '1983-08-23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `DNI` varchar(8) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `ruc` varchar(11) DEFAULT NULL,
  `fecharegistro` date NOT NULL,
  `categoria` varchar(40) NOT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `razsoc` varchar(200) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `telefono` varchar(9) NOT NULL,
  `estado` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `DNI`, `correo`, `ruc`, `fecharegistro`, `categoria`, `nombres`, `apellidos`, `sexo`, `razsoc`, `direccion`, `descripcion`, `telefono`, `estado`) VALUES
(1, '32875643', 'dnilson_34@gmail.com', NULL, '2019-11-01', 'VIP', 'Denilson Arturo', 'Milla Cadillo', 'M', NULL, NULL, NULL, '987705643', 'Activo'),
(2, '30567843', 'avilacladeron@hotmail.com', NULL, '2019-11-04', 'Premium', 'Sandra Mireya ', 'Avila Calderon', 'F', NULL, NULL, NULL, '977654569', 'Activo'),
(3, '32764532', 'amarilis345@gmail.com', NULL, '2019-10-03', 'Standar', 'Nataly Amarilis', 'García Quispe', 'F', NULL, NULL, NULL, '99067536', 'Activo'),
(4, NULL, 'vitale_dex@gmail.com', '20531876416', '2019-11-01', 'VIP', NULL, NULL, NULL, 'Vitale Dex S.A.C.', 'Prolong. Leoncio Prado Nro. 1459 P.J. Miramar Alto', 'Vta. Min. en Almacenes No Especializ.', '043345730', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `tipo` varchar(40) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `tipo`, `descripcion`) VALUES
(1, 'Administrador', 'Administra sistema'),
(2, 'Empleado', 'Maneja sistema'),
(3, 'Cliente', 'Solicita servicio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `chofere_id` int(11) NOT NULL,
  `vehiculo_id` int(11) NOT NULL,
  `tiposervicio_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `origen` varchar(150) NOT NULL,
  `destinoref` varchar(150) NOT NULL,
  `destinoreal` varchar(150) NOT NULL,
  `precio` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `cliente_id`, `chofere_id`, `vehiculo_id`, `tiposervicio_id`, `fecha`, `origen`, `destinoref`, `destinoreal`, `precio`) VALUES
(1, 1, 1, 3, 1, '2019-11-07 20:04:56', 'Av. Meiggs 400', 'Plaza Mayor', 'Av. Pacífico 370\'', '10'),
(2, 3, 3, 4, 2, '2019-11-06 00:00:00', 'Av. Anchoveta 450', 'Mercado Buenos Aires', 'Av. Pacífico 120\'', '4'),
(3, 2, 2, 5, 2, '2019-11-07 00:00:00', 'Av. Industrial 129', 'Plaza de Armas', 'Av. Pardo 354\'', '4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposervicios`
--

CREATE TABLE `tiposervicios` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposervicios`
--

INSERT INTO `tiposervicios` (`id`, `descripcion`) VALUES
(1, 'TAXI VIP'),
(2, 'TAXI DIRECTO'),
(3, 'TAXI CORPORATIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `cod` char(5) NOT NULL,
  `cliente_id` int(8) DEFAULT NULL,
  `rol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `cod`, `cliente_id`, `rol_id`) VALUES
(1, 'U-001', NULL, 1),
(2, 'U-002', NULL, 2),
(3, 'U-003', NULL, 2),
(4, 'U-004', 1, 3),
(5, 'U-005', 2, 3),
(6, 'U-006', 3, 3),
(7, 'U-007', 4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id` int(11) NOT NULL,
  `placa` varchar(8) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `año` year(4) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id`, `placa`, `modelo`, `marca`, `año`, `estado`) VALUES
(1, 'A1A-455', 'I10 ', 'Hyundai', 2013, 'Activo'),
(2, 'H1A-664', 'I10 ', 'Hyundai', 2013, 'Activo'),
(3, 'H1E-215', 'I10 ', 'Hyundai', 2013, 'Activo'),
(4, 'W1B-845', 'I10 ', 'Hyundai', 2013, 'Activo'),
(5, 'G1A-104', 'I10 ', 'Hyundai', 2013, 'Activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `choferes`
--
ALTER TABLE `choferes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cliente` (`cliente_id`),
  ADD KEY `fk_chofere` (`chofere_id`),
  ADD KEY `fk_vehiculo` (`vehiculo_id`),
  ADD KEY `fk_tiposervicio` (`tiposervicio_id`);

--
-- Indices de la tabla `tiposervicios`
--
ALTER TABLE `tiposervicios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_rol` (`rol_id`),
  ADD KEY `fk_usuario_cliente` (`cliente_id`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `choferes`
--
ALTER TABLE `choferes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `fk_chofere` FOREIGN KEY (`chofere_id`) REFERENCES `choferes` (`id`),
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `fk_tiposervicio` FOREIGN KEY (`tiposervicio_id`) REFERENCES `tiposervicios` (`id`),
  ADD CONSTRAINT `fk_vehiculo` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuario_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
