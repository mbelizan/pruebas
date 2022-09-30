-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 30-09-2022 a las 23:20:47
-- Versión del servidor: 10.5.16-MariaDB
-- Versión de PHP: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `id19649866_sicdb`
--
CREATE DATABASE IF NOT EXISTS `id19649866_sicdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `id19649866_sicdb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Abogado`
--

CREATE TABLE `Abogado` (
  `DNIA` int(10) NOT NULL,
  `Nombre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Contrasena` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `FechaR` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `HoraR` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Caso`
--

CREATE TABLE `Caso` (
  `IDCaso` int(11) NOT NULL,
  `Tipo` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaFin` date DEFAULT NULL,
  `Motivo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IDCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CasoEtapa`
--

CREATE TABLE `CasoEtapa` (
  `IDCasoEtapa` int(11) NOT NULL,
  `IDCaso` int(11) NOT NULL,
  `IDEtapa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cliente`
--

CREATE TABLE `Cliente` (
  `IDCliente` int(11) NOT NULL,
  `Nombre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Apellido` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `DNI` int(10) NOT NULL,
  `Direccion` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Telefono` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `DNIA` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Etapa`
--

CREATE TABLE `Etapa` (
  `IDEtapa` int(11) NOT NULL,
  `Firma` blob DEFAULT NULL,
  `FechaFirma` date DEFAULT NULL,
  `LugarFirma` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FechainicioE3` date DEFAULT NULL,
  `FechaComisionMedica` date DEFAULT NULL,
  `FechaCierreE3` date DEFAULT NULL,
  `PresentaProntoDespacho` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FechaDictamen` date DEFAULT NULL,
  `FechaConciliacion` date DEFAULT NULL,
  `EtapaInicio` bit(1) DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `EtapaIntermedia` bit(1) DEFAULT NULL,
  `FechaIntermedia` date DEFAULT NULL,
  `EtapaFinal` bit(1) DEFAULT NULL,
  `FechaFinal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Abogado`
--
ALTER TABLE `Abogado`
  ADD PRIMARY KEY (`DNIA`);

--
-- Indices de la tabla `Caso`
--
ALTER TABLE `Caso`
  ADD PRIMARY KEY (`IDCaso`),
  ADD KEY `IDCliente` (`IDCliente`);

--
-- Indices de la tabla `CasoEtapa`
--
ALTER TABLE `CasoEtapa`
  ADD PRIMARY KEY (`IDCasoEtapa`),
  ADD KEY `IDCaso` (`IDCaso`),
  ADD KEY `IDEtapa` (`IDEtapa`);

--
-- Indices de la tabla `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`IDCliente`),
  ADD KEY `DNIA` (`DNIA`);

--
-- Indices de la tabla `Etapa`
--
ALTER TABLE `Etapa`
  ADD PRIMARY KEY (`IDEtapa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Caso`
--
ALTER TABLE `Caso`
  MODIFY `IDCaso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CasoEtapa`
--
ALTER TABLE `CasoEtapa`
  MODIFY `IDCasoEtapa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Cliente`
--
ALTER TABLE `Cliente`
  MODIFY `IDCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Etapa`
--
ALTER TABLE `Etapa`
  MODIFY `IDEtapa` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Caso`
--
ALTER TABLE `Caso`
  ADD CONSTRAINT `Caso_ibfk_1` FOREIGN KEY (`IDCliente`) REFERENCES `Cliente` (`IDCliente`);

--
-- Filtros para la tabla `CasoEtapa`
--
ALTER TABLE `CasoEtapa`
  ADD CONSTRAINT `CasoEtapa_ibfk_1` FOREIGN KEY (`IDCaso`) REFERENCES `Caso` (`IDCaso`),
  ADD CONSTRAINT `CasoEtapa_ibfk_2` FOREIGN KEY (`IDEtapa`) REFERENCES `Etapa` (`IDEtapa`);

--
-- Filtros para la tabla `Cliente`
--
ALTER TABLE `Cliente`
  ADD CONSTRAINT `Cliente_ibfk_1` FOREIGN KEY (`DNIA`) REFERENCES `Abogado` (`DNIA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
