-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 08, 2019 at 12:34 AM
-- Server version: 5.7.26
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rapitax`
--

-- --------------------------------------------------------

--
-- Table structure for table `choferes`
--

DROP TABLE IF EXISTS `choferes`;
CREATE TABLE IF NOT EXISTS `choferes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brevete` varchar(20) NOT NULL,
  `DNI` varchar(8) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `categoria` varchar(20) NOT NULL,
  `fechanac` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `choferes_vehiculos`
--

DROP TABLE IF EXISTS `choferes_vehiculos`;
CREATE TABLE IF NOT EXISTS `choferes_vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chofer_id` int(11) NOT NULL,
  `vehiculo_id` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chof` (`chofer_id`),
  KEY `fk_vehi` (`vehiculo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `choferes_vehiculos_clientes`
--

DROP TABLE IF EXISTS `choferes_vehiculos_clientes`;
CREATE TABLE IF NOT EXISTS `choferes_vehiculos_clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `chofer_vehiculo_id` int(11) NOT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chofer_vehi` (`chofer_vehiculo_id`),
  KEY `fk_cliente` (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecharegistro` datetime NOT NULL,
  `estado` char(1) NOT NULL,
  `categoria` varchar(15) NOT NULL,
  `juridica_id` int(11) NOT NULL,
  `natural_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_natural` (`natural_id`),
  KEY `fk_cliente_juridica` (`juridica_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `juridicas`
--

DROP TABLE IF EXISTS `juridicas`;
CREATE TABLE IF NOT EXISTS `juridicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(11) NOT NULL,
  `razsoc` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `correo` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `naturales`
--

DROP TABLE IF EXISTS `naturales`;
CREATE TABLE IF NOT EXISTS `naturales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNI` varchar(8) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `sexo` char(1) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `correo` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rutas`
--

DROP TABLE IF EXISTS `rutas`;
CREATE TABLE IF NOT EXISTS `rutas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origen` varchar(20) NOT NULL,
  `destinoref` varchar(20) NOT NULL,
  `destinoreal` varchar(20) NOT NULL,
  `chofer_vehiculo_cliente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ruta_cliente` (`chofer_vehiculo_cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL,
  `cod` char(5) NOT NULL,
  `cliente_id` int(8) NOT NULL,
  `rol_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_rol` (`rol_id`),
  KEY `fk_usuario_cliente` (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
CREATE TABLE IF NOT EXISTS `vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placa` varchar(8) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `año` year(4) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `choferes_vehiculos`
--
ALTER TABLE `choferes_vehiculos`
  ADD CONSTRAINT `fk_chof` FOREIGN KEY (`chofer_id`) REFERENCES `choferes` (`id`),
  ADD CONSTRAINT `fk_vehi` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`id`);

--
-- Constraints for table `choferes_vehiculos_clientes`
--
ALTER TABLE `choferes_vehiculos_clientes`
  ADD CONSTRAINT `fk_chofer_vehi` FOREIGN KEY (`chofer_vehiculo_id`) REFERENCES `choferes_vehiculos` (`id`),
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Constraints for table `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_cliente_juridica` FOREIGN KEY (`juridica_id`) REFERENCES `juridicas` (`id`),
  ADD CONSTRAINT `fk_cliente_natural` FOREIGN KEY (`natural_id`) REFERENCES `naturales` (`id`);

--
-- Constraints for table `rutas`
--
ALTER TABLE `rutas`
  ADD CONSTRAINT `fk_ruta_cliente` FOREIGN KEY (`chofer_vehiculo_cliente_id`) REFERENCES `choferes_vehiculos_clientes` (`id`);

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuario_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
