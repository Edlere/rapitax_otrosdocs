-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-11-2019 a las 07:15:00
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
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `categoria` varchar(20) NOT NULL,
  `fechanac` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `choferes`
--

INSERT INTO `choferes` (`id`, `brevete`, `DNI`, `nombres`, `apellidos`, `categoria`, `fechanac`) VALUES
(1, 'Q238759', '46582345', 'Juan Jesus', 'Palomares Vega', 'A-II', '1976-11-14'),
(2, 'E875432', '56789436', 'Luis Alejandro', 'Benites Rios', 'A-II', '1980-08-23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `choferes_vehiculos`
--

CREATE TABLE `choferes_vehiculos` (
  `id` int(11) NOT NULL,
  `chofer_id` int(11) NOT NULL,
  `vehiculo_id` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `choferes_vehiculos`
--

INSERT INTO `choferes_vehiculos` (`id`, `chofer_id`, `vehiculo_id`, `descripcion`) VALUES
(1, 1, 1, 'Taxi VIP'),
(2, 2, 2, 'Taxi Urbano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `choferes_vehiculos_clientes`
--

CREATE TABLE `choferes_vehiculos_clientes` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `chofer_vehiculo_id` int(11) NOT NULL,
  `precio` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `choferes_vehiculos_clientes`
--

INSERT INTO `choferes_vehiculos_clientes` (`id`, `cliente_id`, `fecha`, `chofer_vehiculo_id`, `precio`) VALUES
(1, 1, '2019-10-09 06:20:23', 1, '12'),
(2, 2, '2019-10-23 10:26:19', 2, '6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `fecharegistro` datetime NOT NULL,
  `estado` char(1) NOT NULL,
  `categoria` varchar(15) NOT NULL,
  `juridica_id` int(11) DEFAULT NULL,
  `natural_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `fecharegistro`, `estado`, `categoria`, `juridica_id`, `natural_id`) VALUES
(1, '2019-11-05 00:00:00', '1', 'VIP', NULL, 2),
(2, '2019-11-01 09:22:33', '1', 'General', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juridicas`
--

CREATE TABLE `juridicas` (
  `id` int(11) NOT NULL,
  `ruc` varchar(11) NOT NULL,
  `razsoc` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `correo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `juridicas`
--

INSERT INTO `juridicas` (`id`, `ruc`, `razsoc`, `direccion`, `descripcion`, `telefono`, `correo`) VALUES
(1, '20343555345', 'Negocios D & J E.I.R.L. ', 'Mz J Lt 7 Ah El Porvenir', 'Distribuidora', '043625674', 'nego_dj@gmail.com'),
(2, '20445761553', 'Importaciones Rodson Music S.A.C. ', 'Jr Alfonso Ugarte Nro 760', 'Importaciones de instrumentos musicales', '043314252', 'rodson_7@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `naturales`
--

CREATE TABLE `naturales` (
  `id` int(11) NOT NULL,
  `DNI` varchar(8) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `sexo` char(1) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `correo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `naturales`
--

INSERT INTO `naturales` (`id`, `DNI`, `nombres`, `apellidos`, `sexo`, `telefono`, `correo`) VALUES
(1, '65437898', 'Maria Elizabeth', 'Lopez Luján', 'F', '946986556', 'maria_e23@gmail.com'),
(2, '41527834', 'Jhonatan Abelino', 'Suarez García', 'M', '923487654', 'suarezjhon@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `descripcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `tipo`, `descripcion`) VALUES
(1, 'Administrador', 'Administra sistema'),
(2, 'Empleado', 'Maneja sistema'),
(3, 'Cliente', 'Interactúa con el si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutas`
--

CREATE TABLE `rutas` (
  `id` int(11) NOT NULL,
  `origen` varchar(20) NOT NULL,
  `destinoref` varchar(20) NOT NULL,
  `destinoreal` varchar(20) NOT NULL,
  `chofer_vehiculo_cliente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rutas`
--

INSERT INTO `rutas` (`id`, `origen`, `destinoref`, `destinoreal`, `chofer_vehiculo_cliente_id`) VALUES
(1, 'Av. Meiggs 400, 2804', 'Plaza Mayor', 'Av. Pacífico 370', 1),
(2, 'Av. Pacífico 50, 129', 'Universidad Nacional', 'Av. Universitaria', 2);

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
(3, 'U-003', 1, 3),
(4, 'U-004', 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id` int(11) NOT NULL,
  `placa` varchar(8) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `año` year(4) NOT NULL,
  `estado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id`, `placa`, `modelo`, `marca`, `año`, `estado`) VALUES
(1, 'A1A-675', 'I10 ', 'Hyundai', 2013, '1'),
(2, 'H1A-634', 'I10 ', 'Hyundai', 2013, '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `choferes`
--
ALTER TABLE `choferes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `choferes_vehiculos`
--
ALTER TABLE `choferes_vehiculos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_chof` (`chofer_id`),
  ADD KEY `fk_vehi` (`vehiculo_id`);

--
-- Indices de la tabla `choferes_vehiculos_clientes`
--
ALTER TABLE `choferes_vehiculos_clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_chofer_vehi` (`chofer_vehiculo_id`),
  ADD KEY `fk_cliente` (`cliente_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cliente_natural` (`natural_id`),
  ADD KEY `fk_cliente_juridica` (`juridica_id`);

--
-- Indices de la tabla `juridicas`
--
ALTER TABLE `juridicas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `naturales`
--
ALTER TABLE `naturales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rutas`
--
ALTER TABLE `rutas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ruta_cliente` (`chofer_vehiculo_cliente_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `choferes_vehiculos`
--
ALTER TABLE `choferes_vehiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `choferes_vehiculos_clientes`
--
ALTER TABLE `choferes_vehiculos_clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `juridicas`
--
ALTER TABLE `juridicas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `naturales`
--
ALTER TABLE `naturales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rutas`
--
ALTER TABLE `rutas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `choferes_vehiculos`
--
ALTER TABLE `choferes_vehiculos`
  ADD CONSTRAINT `fk_chof` FOREIGN KEY (`chofer_id`) REFERENCES `choferes` (`id`),
  ADD CONSTRAINT `fk_vehi` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`id`);

--
-- Filtros para la tabla `choferes_vehiculos_clientes`
--
ALTER TABLE `choferes_vehiculos_clientes`
  ADD CONSTRAINT `fk_chofer_vehi` FOREIGN KEY (`chofer_vehiculo_id`) REFERENCES `choferes_vehiculos` (`id`),
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_cliente_juridica` FOREIGN KEY (`juridica_id`) REFERENCES `juridicas` (`id`),
  ADD CONSTRAINT `fk_cliente_natural` FOREIGN KEY (`natural_id`) REFERENCES `naturales` (`id`);

--
-- Filtros para la tabla `rutas`
--
ALTER TABLE `rutas`
  ADD CONSTRAINT `fk_ruta_cliente` FOREIGN KEY (`chofer_vehiculo_cliente_id`) REFERENCES `choferes_vehiculos_clientes` (`id`);

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
