-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 04-08-2020 a las 15:24:19
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `botesparabasura`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `idCategoria` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nombreCategoria` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imagenCategoria` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `idCategoria`, `nombreCategoria`, `imagenCategoria`) VALUES
(1, '10001', 'Botes para basura de plástico', 'thumbnail1'),
(2, '20001', 'Botes para basura de metal', 'thumbnail2'),
(3, '30001', 'Botes de fibra de vidrio', 'thumbnail3'),
(4, '40001', 'Otros productos', 'thumbnail4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descripcion_producto`
--

CREATE TABLE `descripcion_producto` (
  `id` int(11) NOT NULL,
  `id_descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fk_idProducto` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `acabado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `material` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calibre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capacidad` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `colores` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anclaje` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vaciado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medidas` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contenedor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `letrero` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adicional` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `descripcion_producto`
--

INSERT INTO `descripcion_producto` (`id`, `id_descripcion`, `fk_idProducto`, `descripcion`, `acabado`, `material`, `calibre`, `capacidad`, `colores`, `anclaje`, `vaciado`, `medidas`, `contenedor`, `letrero`, `adicional`, `imagen`) VALUES
(1, 'D00001', 'URBANIECO1M', 'Los tablones de madera y polietileno reciclados le dan una apariencia natural, así como una dureza muy similar a la madera, pero con mayor duración y cero mantenimientos.', 'Acero: pintura electrostática con pretratamiento de fosfato de zinc. Madera y polietileno: apariencia madera natural.', 'Estructura y tapa en acero. Cuerpo en mezcla de madera y polietileno.', '', '140 LT', 'Acero: amplia variedad. Madera y polietileno: madera natural.', 'Atornillar o anclar en cemento.', 'Tapa retirable y trampa para bolsas de plástico o colocar bote interior.', 'Largo: 68,5 cm. Alto: 87,0 cm.', '', '', '', 'URBANIECO1M_full'),
(3, 'D00002', 'URBANIECO2M', 'Los tablones de madera y polietileno reciclados le dan una apariencia natural, así como una dureza muy similar a la madera, pero con mayor duración y cero mantenimientos', 'Acero: pintura electrostática con pretratamiento de fosfato de zinc. Madera y polietileno: apariencia madera natural', 'Estructura y tapa en acero. Cuerpo en mezcla de madera y polietileno.', '', '70 LT', 'Acero: amplia variedad. Madera y polietileno: madera natural.', 'Atornillar o anclar en cemento.', 'Cuenta con trampa para colocar bolsa de plástico.', 'Largo: 47,0 cm. Ancho: 25,6 cm. Alto: 100,0 cm.', 'Largo: 41,5 cm. Alto: 60,0 cm.', '', '', 'URBANIECO2M_full'),
(4, 'D00003', 'SILICIADOBTAPAECOM', 'Los tablones de madera y polietileno reciclados le dan una apariencia natural, así como una dureza muy similar a la madera, pero con mayor duración y cero mantenimientos', 'Acero: pintura electrostática con pretratamiento de fosfato de zinc. Madera y polietileno: apariencia madera natural', 'Estructura y tapa en acero. Cuerpo en mezcla de madera y polietileno.', '', '260 LT (130 LT por bote)', 'Acero: amplia variedad. Madera y polietileno: madera natural.', 'Atornillar o anclar en cemento.', 'Cada bote viene con trampa para bolsa de plástico.', 'Alto: 120,0 cm. Largo: 160,0 cm.', 'Diámetro: 49,0 cm. Alto: 65,0 cm.', '', '', 'SILICIADOBTAPAECOM_full'),
(5, 'D00004', 'URBANIECO3M', 'Los tablones de madera y polietileno reciclados le dan una apariencia natural, así como una dureza muy similar a la madera, pero con mayor duración y cero mantenimientos', 'Acero: pintura electrostática con pretratamiento de fosfato de zinc. Madera y polietileno: apariencia madera natural', 'Estructura y tapa en acero. Cuerpo en mezcla de madera y polietileno.', '', '80 LT', 'Acero: amplia variedad. Madera y polietileno: madera natural.', 'Atornillar o anclar en cemento.', '', 'Alto: 86,0 cm. Diámetro: 49,0 cm.', '', '', '', 'URBANIECO3M_full'),
(6, 'D00005', 'MEDIALUNE2CH1', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '31 LT', 'Amplia variedad', 'Atornillar o ahogar en cemento.', '', 'Alto: 84,0 cm. Largo: 38,5 cm. Ancho: 24,5 cm.', '', '', '', 'MEDIALUNE2CH1_full'),
(7, 'D00006', 'MEDIALUNE2CH2', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '62 LT (31 LT por bote)', 'Amplia variedad', 'Atornillar o ahogar en cemento.', '', 'Alto: 84,0 cm. Largo: 38,5 cm. Ancho: 44,0 cm.', '', '', '', 'MEDIALUNE2CH2_full'),
(8, 'D00007', 'MEDIALUNE2CH3', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '93 LT (31 LT por bote)', 'Amplia variedad', 'Atornillar o ahogar en cemento', '', 'Alto bote: 60,0 cm. Ancho bote: 24,5 cm. Alto total: 100,0 cm.', '', '', '', 'MEDIALUNE2CH3_full'),
(9, 'D00008', 'MEDIALUNE2GD1', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '65 LT', 'Amplia variedad', 'Atornillar o ahogar en cemento', '', 'Alto: 92,5 cm. Largo: 49,0 cm. Ancho: 30,5 cm.', '', '', '', 'MEDIALUNE2GD1_full'),
(10, 'D00009', 'MEDIALUNE2GD2', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '130 LT (65 LT por bote)', 'Amplia variedad', 'Atornillar o ahogar en cemento', '', 'Alto: 92,5 cm. Largo: 49,0 cm. Ancho: 54,5 cm.', '', '', '', 'MEDIALUNE2GD2_full'),
(11, 'D00010', 'MEDIALUNE2GD3', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '195 LT (65 LT por bote)', 'Amplia variedad', 'Atornillar o ahogar en cemento', '', 'Alto total: 100,0 cm. Ancho total: 79,0 cm. Alto bote: 60,0 cm. Ancho bote: 30,5 cm.', '', '', '', 'MEDIALUNE2GD3_full'),
(12, 'D00011', 'URBANI15', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '94 LT', 'Amplia variedad', 'Atornillar o ahogar en cemento', '', 'Alto total: 100,0 cm. Largo: 55,0 cm. Alto bote: 70,0 cm.', '', '', '', 'URBANI15_full'),
(13, 'D00012', 'URBANI14', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '60 LT', 'Amplia variedad', 'Atornillar o ahogar en cemento', '', 'Alto total: 135,0 cm. Largo: 42,0 cm. Alto bote: 60,0 cm.', '', '', '', 'URBANI14_full'),
(14, 'D00013', 'URBANI13', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '192 LT (96 LT por bote)', 'Amplia variedad', 'Atornillar o ahogar en cemento', '', 'Alto total: 85,0 cm. Largo total: 82,5 cm. Alto bote: 60,0 cm. Largo bote: 40,0 cm.', '', '', '', 'URBANI13_full'),
(15, 'D00014', 'AMALFIDOBLE', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero al carbón y tubo', '', '164 LT (82 por bote)', 'Amplia variedad', 'Atornillar o ahogar en cemento', '', 'Alto total: 97,0 cm. Ancho: 92,5 cm. Diámetro: 43,0 cm. Alto bote: 60,0 cm.', '', '', '', 'AMALFIDOBLE_full'),
(16, 'D00015', 'AMALFI', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero al carbon y tubo', '', '82 LT', 'Amplia variedad', 'Atornillar o ahogar en cemento', '', 'Alto total: 97,0 cm. Diámetro: 43,0 cm. Alto bote: 60,0 cm.', '', '', '', 'AMALFI_full'),
(17, 'D00016', 'MEDIALUNEGD3', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '195 LT (65 LT por bote)', 'Amplia variedad', 'Atornillar o ahogar en cemento', '', 'Alto: 100,0 cm. Alto bote: 60,0 cm.', '', '', '', 'MEDIALUNEGD3_full'),
(18, 'D00017', 'MEDIALUNECH3', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '93 LT (31 LT por bote)', 'Amplia variedad', 'Atornillar o ahogar en cemento', '', 'Alto: 100,0 cm. Alto bote: 60,0 cm.', '', '', '', 'MEDIALUNECH3_full'),
(19, 'D00018', 'MILANTRIPLE', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '183 LT (61 LT por bote)', 'Amplia variedad', 'Atornillar o ahogar en cemento.', '', '', 'Alto: 59,0 cm. Diámetro: 36,0 cm.', '', '', 'MILANTRIPLE_full'),
(20, 'D00019', 'NAPOLITRIPLE', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '390 LT (130 LT por bote)', 'Amplia variedad', 'Atornillar o ahogar en cemento.', '', 'Alto: 95,0 cm. Largo: 177,0 cm.', '', '', '', 'NAPOLITRIPLE_full'),
(21, 'D00020', 'SQUADRA', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '130 LT', 'Amplia variedad', 'Atornillar, anclar en cemento o movible.', 'Trampa para colocar bolsa plástica o colocar interno.', 'Largo: 42,0 cm. Ancho: 42,0 cm. Alto: 81,0 cm.', '', '', '', 'SQUADRA_full'),
(22, 'D00021', 'GRILLO', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '40 LT', 'Amplia variedad', 'Atornillar, anclar en cemento.', 'Tapa superior abatible, con trampa para bolsa.', 'Largo: 34,0 cm. Ancho: 47,0 cm. Alto: 106,0 cm.', '', '', '', 'GRILLO_full'),
(23, 'D00022', 'LINEA', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '80 LT', 'Amplia variedad', 'Atornillar, ahogar en cemento o movible.', 'Tapa superior abatible, con trampa para bolsa.', '', 'Diámetro: 36,0 cm. Alto: 80,5 cm.', '', '', 'LINEA_full'),
(24, 'D00023', 'SORRENTO', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '110 LT', 'Amplia variedad', 'Atornillar o ahogar en cemento.', 'El bote cuenta con puerta con jaladera para sacar la basura (dentro del bote se puede colocar un bote de plástico o bolsa para contener residuos).', 'Alto: 100,0 cm. Largo: 47,0 cm. Ancho: 51,0 cm.', '', '', '', 'SORRENTO_full'),
(25, 'D00024', 'RAVELLO', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '140 LT', 'Amplia variedad', 'Atornillar o ahogar en cemento.', '', '', 'Diámetro superior: 84,0 cm. Diámetro inferior: 51,0 cm. Alto: 90,0 cm.', '', '', 'RAVELLO_full'),
(26, 'D00025', 'BURANO', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '61 LT', 'Amplia variedad', 'Atornillar o ahogar en cemento.', '', 'Alto: 98,0 cm. Largo: 51,0 cm.', 'Diámetro: 36,0 cm. Alto: 59,0 cm.', '', '', 'BURANO_full'),
(27, 'D00026', 'BURANODOBLE', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '122 LT (61 LT por bote)', 'Amplia variedad', 'Atornillar o ahogar en cemento.', '', 'Alto: 98,0 cm. Largo: 97,0 cm.', 'Diámetro: 36,0 cm. Alto: 59,0 cm.', '', '', 'BURANODOBLE_full'),
(28, 'D00027', 'LIMA30', 'Papelera metálica con doble protección contra oxido y corrosión empotrable en pared, con llave de acceso.', '', 'Acero', '', '30 LT', 'Amplia variedad', 'Atornillar o ahogar en cemento.', '', '', 'Diámetro: 29,5 cm. Alto: 47,5 cm.', '', '', 'LIMA30_full'),
(29, 'D00028', 'LIMA30DOBLE', 'Papelera metálica con doble protección contra oxido y corrosión empotrable en pared o poste con llave de acceso.', '', 'Acero', '', '60 LT (30 LT por bote)', 'Amplia variedad', 'Atornillar o ahogar en cemento.', '', '', 'Diámetro: 29,5 cm. Alto: 47,5 cm.', '', '', 'LIMA30DOBLE_full'),
(30, 'D00029', 'CAPRI', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '61 LT', 'Amplia variedad', 'Atornillar o ahogar en cemento.', 'Tapa fija con bote abatible o tapa abatible con bote fijo.', 'Alto: 111,2 cm. Largo: 51,0 cm', 'Diámetro: 36,0 cm. Alto: 59,0 cm.', '', '', 'CAPRI_full'),
(31, 'D00030', 'CAPRIDOBLE', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '122 LT (61 LT por bote)', 'Amplia variedad', 'Atornillar o ahogar en cemento.', 'Tapa fija con bote abatible o tapa abatible con bote fijo.', 'Alto: 111,2 cm. Largo: 100,0 cm.', 'Diámetro: 36,0 cm. Alto: 59,0 cm.', '', '', 'CAPRIDOBLE_full'),
(32, 'D00031', 'MURANO', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '61 LT', 'Amplia variedad', 'Atornillar o ahogar en cemento.', '', 'Alto: 160,0 cm. Largo: 50,0 cm.', 'Diámetro: 36,0 cm. Alto: 59,0 cm.', 'Alto: 22,0 cm. Largo: 42,0 cm.', '', 'MURANO'),
(33, 'D00031', 'MURANODISCO', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '61 LT', 'Amplia variedad', 'Atornillar o ahogar en cemento.', '', 'Alto: 210,0 cm. Largo: 50,0 cm.', 'Diámetro: 36,0 cm. Alto: 59,0 cm.', 'Alto: 22,0 cm. Largo: 42,0 cm. Diámetro: 38,0 cm.', '', 'MURANODISCO_full'),
(34, 'D00032', 'MURANODOBLE', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '122 LT (61 LT por bote)', 'Amplia variedad', 'Atornillar o ahogar en cemento.', '', 'Alto: 160,0 cm. Largo: 97,0 cm.', 'Diámetro: 36,0 cm. Alto: 59,0 cm.', 'Alto: 22,0 cm. Largo: 42,0 cm. (Por letrero)', '', 'MURANODOBLE_full'),
(35, 'D00033', 'MILAN', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '61 LT', 'Amplia variedad', 'Atornillar o ahogar en cemento.', '', '', 'Diámetro: 36,0 cm. Alto: 59,0 cm.', '', 'No incluye tubo', 'MILAN_full'),
(36, 'D00034', 'SIENA', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '61 LT', 'Amplia variedad', 'Atornillar o ahogar en cemento.', 'Se recomienda abatible.', 'Alto: 160,0 cm. Largo: 45,0 cm.', 'Diámetro: 36,0 cm. Alto: 59,0 cm.', 'Alto: 24,5 cm. Largo: 42,0 cm.', '', 'SIENA_full'),
(37, 'D00035', 'SIENADOBLE', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '122 LT (61 LT por bote)', 'Amplia variedad', 'Atornillar o ahogar en cemento.', 'Se recomienda abatible.', 'Alto: 160,0 cm. Largo: 97,0 cm.', 'Diámetro: 36,0 cm. Alto: 59,0 cm.', 'Alto: 24,5 cm. Largo: 42,0 cm. (Por letrero)', '', 'SIENADOBLE_full'),
(38, 'D00036', 'NAPOLI', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '130 LT', 'Amplia variedad', 'Atornillar o ahogar en cemento.', '', 'Alto: 132,0 cm. Largo: 64,0 cm.', 'Diámetro: 51,0 cm. Alto: 65,0 cm.', '', '', 'NAPOLI_full'),
(39, 'D00037', 'NAPOLIDOBLE', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '260 LT (130 LT por bote)', 'Amplia variedad', 'Atornillar o ahogar en cemento.', '', 'Alto: 95,0 cm. Largo: 123,0 cm.', 'Diámetro: 51,0 cm. Alto: 65,0 cm.', '', '', 'NAPOLIDOBLE_full'),
(40, 'D00038', 'RIMINI', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '61 LT', 'Amplia variedad', 'Atornillar o ahogar en cemento.', '', 'Alto: 135,0 cm. Largo: 53,0 cm.', 'Diámetro: 36,0 cm. Alto: 59,0 cm.', '', '', 'RIMINI_full'),
(41, 'D00039', 'PARMA', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '61 LT', 'Amplia variedad', 'Atornillar o ahogar en cemento.', '', 'Alto: 98,0 cm. Largo: 51,0 cm.', 'Diámetro: 36,0 cm. Alto: 59,0 cm.', '', '', 'PARMA_full'),
(42, 'D00040', 'PALERMO', '', 'Pintura electrostática con pretratamiento de fosfato de zinc.', 'Acero', '', '130 LT', 'Amplia variedad', 'Atornillar o ahogar en cemento.', '', 'Alto: 92,0 cm. Largo: 60,0 cm.', 'Diámetro: 51,0 cm. Alto: 65,0 cm.', '', '', 'PALERMO_full');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `idProducto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fk_idSubcategoria` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nombreProducto` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imagenProducto` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `idProducto`, `fk_idSubcategoria`, `nombreProducto`, `imagenProducto`) VALUES
(1, 'URBANIECO1M', '205', 'BOTE DE BASURA CON MADERA URBANI ECO 1M', 'URBANIECO1M'),
(2, 'URBANIECO2M', '205', 'BOTE PARA BASURA CON PLASTIMADERA URBANI ECO 2M', 'URBANIECO2M'),
(3, 'SILICIADOBTAPAECOM', '205', 'BOTE PARA BASURA CON MADERA SILICIA DOBLE CON TAPA ECO M', 'SILICIADOBTAPAECOM'),
(4, 'URBANIECO3M', '205', 'BOTE PARA BASURA CON PLASTIMADERA URBANI ECO 3M', 'URBANIECO3M'),
(5, 'MEDIALUNE2CH1', '205', 'BOTE PARA BASURA METALICO MEDIA LUNE 2 CHICO SENCILLO', 'MEDIALUNE2CH1'),
(6, 'MEDIALUNE2CH2', '205', 'BOTE PARA BASURA METALICO MEDIA LUNE 2 CHICO DOBLE', 'MEDIALUNE2CH2'),
(7, 'MEDIALUNE2CH3', '205', 'BOTE PARA BASURA METALICO MEDIA LUNE 2 CHICO TRIPLE', 'MEDIALUNE2CH3'),
(8, 'MEDIALUNE2GD1', '205', 'BOTE PARA BASURA METALICO MEDIA LUNE 2 GRANDE SENCILLO', 'MEDIALUNE2GD1'),
(9, 'MEDIALUNE2GD2', '205', 'BOTE PARA BASURA METALICO MEDIA LUNE 2 GRANDE DOBLE', 'MEDIALUNE2GD2'),
(10, 'MEDIALUNE2GD3', '205', 'BOTE PARA BASURA METALICO MEDIA LUNE 2 GRANDE TRIPLE', 'MEDIALUNE2GD3'),
(11, 'URBANI15', '205', 'BOTE PARA BASURA METALICO URBANI 15', 'URBANI15'),
(12, 'URBANI14', '205', 'BOTE PARA BASURA METALICO URBANI 14', 'URBANI14'),
(13, 'URBANI13', '205', 'BOTE PARA BASURA METALICO URBANI 13', 'URBANI13'),
(14, 'AMALFIDOBLE', '205', 'CONTENEDOR PARA BASURA ORGANICO E INORGANICO AMALFI DOBLE', 'AMALFIDOBLE'),
(15, 'AMALFI', '205', 'CONTENEDOR PARA BASURA PARA EXTERIOR AMALFI', 'AMALFI'),
(16, 'MEDIALUNEGD3', '205', 'CONTENEDOR PARA EXTERIOR METALICO MEDIA LUNE TRIPLE GRANDE', 'MEDIALUNEGD3'),
(17, 'MEDIALUNECH3', '205', 'CONTENEDOR PARA EXTERIOR METALICO MEDIA LUNE TRIPLE CHICO', 'MEDIALUNECH3'),
(18, 'MILANTRIPLE', '205', 'CONTENEDOR PARA EXTERIOR METALICO MILAN TRIPLE', 'MILANTRIPLE'),
(19, 'NAPOLITRIPLE', '205', 'CONTENEDOR PARA EXTERIOR METALICO NAPOLI TRIPLE', 'NAPOLITRIPLE'),
(20, 'SQUADRA', '205', 'CONTENEDOR PARA EXTERIOR METALICO SQUADRA', 'SQUADRA'),
(21, 'GRILLO', '205', 'CONTENEDOR DE BASURA METALICO GRILLO', 'GRILLO'),
(22, 'LINEA', '205', 'CONTENEDOR PARA DESECHOS METALICO LINEA', 'LINEA'),
(23, 'SORRENTO', '205', 'BOTE DE BASURA METALICO SORRETO', 'SORRENTO'),
(24, 'RAVELLO', '205', 'BOTE DE BASURA METALICO RAVELLO', 'RAVELLO'),
(25, 'BURANO', '205', 'BOTE DE BASURA EN ACERO BURANO', 'BURANO'),
(26, 'BURANODOBLE', '205', 'BOTES PARA EXTERIOR METALICO BURANO DOBLE', 'BURANODOBLE'),
(27, 'LIMA30', '205', 'BOTE PARA EXTERIOR METALICO LIMA-30', 'LIMA30'),
(28, 'LIMA30DOBLE', '205', 'BOTE PARA BASURA DE ACERO LIMA-30 DOBLE', 'LIMA30DOBLE'),
(29, 'CAPRI', '205', 'BOTE PARA EXTERIOR METALICO CAPRI', 'CAPRI'),
(30, 'CAPRIDOBLE', '205', 'BOTES PARA EXTERIOR METALICO CAPRI DOBLE', 'CAPRIDOBLE'),
(31, 'MURANO', '205', 'BOTE DE BASURA PARA PARQUE MURANO', 'MURANO'),
(32, 'MURANODISCO', '205', 'BOTE DE BASURA METALICO MURANO CON DISCO', 'MURANODISCO'),
(33, 'MURANODOBLE', '205', 'BOTE PARA PARQUE METALICO MURANO DOBLE', 'MURANODOBLE'),
(34, 'MILAN', '205', 'BOTE PARA BASURA DE ACERO MILAN', 'MILAN'),
(35, 'SIENA', '205', 'BOTE PARA BASURA DE ACERO SIENA', 'SIENA'),
(36, 'SIENADOBLE', '205', 'BOTES DE BASURA PARA PARQUES SIENA DOBLE', 'SIENADOBLE'),
(37, 'NAPOLI', '205', 'BOTE DE BASURA PARA JARDIN NAPOLI', 'NAPOLI'),
(38, 'NAPOLIDOBLE', '205', 'BOTES PARA BASURA DE ACERO NAPOLI DOBLE', 'NAPOLIDOBLE'),
(39, 'RIMINI', '205', 'BOTE PARA BASURA DE METAL RIMINI', 'RIMINI'),
(40, 'PARMA', '205', 'CONTENEDOR DE BASURA DE METAL PARMA', 'PARMA'),
(41, 'PALERMO', '205', 'CONTENEDOR DE BASURA DE ACERO PALERMO', 'PALERMO'),
(42, 'SALERNO', '205', 'CONTENEDOR DE BAURA PARA PARQUE SALERNO', 'SALERNO'),
(43, 'SILICIA', '205', 'CONTENEDOR PARA BASURA DE PARQUES SILICIA', 'SILICIA'),
(44, 'SILICIADOBLE', '205', 'CONTENEDORES PARA BASURA SILICIA DOBLE', 'SILICIADOBLE'),
(45, 'SILICIATAPA', '205', 'CONTENEDOR PARA BASURA DE METAL SILICIA CON TAPA', 'SILICIATAPA'),
(46, 'SILICIADOBLETAPA', '205', 'CONTENEDORES DE ACERO SILICIA DOBLE CON TAPA', 'SILICIADOBLETAPA'),
(47, 'MEDIALUNEGD1', '205', 'CONTENEDOR PARA BASURA MEDIA LUNE GRANDE', 'MEDIALUNEGD1'),
(48, 'MEDIALUNECH1', '205', 'CONTENEDOR PARA BASURA MEDIA LUNE CHICO', 'MEDIALUNECH1'),
(49, 'MEDIALUNEGD2', '205', 'CONTENEDORES DE METAL PARA BASURA MEDIA LUNE DOBLE GRANDE', 'MEDIALUNEGD2'),
(50, 'MEDIALUNECH2', '205', 'CONTENEDORES PARA BASURA PARA JARDIN MEDIA LUNE DOBLE CHICO', 'MEDIALUNECH2'),
(51, 'URBANI12', '205', 'CONTENEDOR DE BASURA PARA PARQUE URBANI 12', 'URBANI12'),
(52, 'URBANI3', '205', 'CONTENEDOR CON CENICERO PARA PARQUE URBANI 3', 'URBANI3'),
(53, 'URBANI1', '205', 'CONTENEDOR METALICO PARA EXTERIOR URBANI 1', 'URBANI1'),
(54, 'URBANI2', '205', 'CONTENEDOR DE ACERO PARA BASURA URBANI 2', 'URBANI2'),
(55, 'LISBOA', '205', 'CONTENEDOR PARA BASURA DE PARQUES LISBOA', 'LISBOA'),
(56, 'PISA1', '205', 'CONTENEDOR DE BASURA DE ACERO PISA', 'PISA1'),
(57, 'PISADOBLE', '205', 'CONTENEDORES PARA EXTERIOR PISA DOBLE', 'PISADOBLE'),
(58, 'URBANI5', '205', 'CONTENEDOR PARA EXTERIOR URBANI 5', 'URBANI5'),
(59, 'URBANI6', '205', 'BOTE PARA BASURA DE ACERO URBANI 6', 'URBANI6'),
(60, 'INON1', '205', 'BOTE DE METAL PARA BASURA IN-ON 1', 'INON1'),
(61, 'INON2', '205', 'BOTE PARA BASURA DE MUNICIPIOS IN-ON 2', 'INON2'),
(62, 'URBANI7', '205', 'CONTENEDOR PARA BASURA DE ACERO URBANI 7', 'URBANI7'),
(63, 'URBANI8', '205', 'CONTENEDOR DE BASURA URBANI 8', 'URBANI8'),
(64, 'URBANI9', '205', 'CONTENEDOR DE BASURA METALICO URBANI 9', 'URBANI9'),
(65, 'URBANI10', '205', 'CONTENEDOR DE ACERO PARA BASURA URBANI 10', 'URBANI10'),
(66, 'URBANI11', '205', 'CONTENEDORES DE BASURA DE ACERO URBANI 11', 'URBANI11'),
(67, 'RAVELLO2', '205', 'BOTE PARA BASURA DE METAL RAVELLO 2', 'RAVELLO2'),
(68, 'VIA1', '205', 'CONTENEDOR METALICO PARA EXTERIOR VIA ', 'VIA1'),
(69, 'PARQUEDB3660', '205', 'CONTENEDORES PARA EXTERIOR PARQUE DOBLE', 'PARQUEDB3660'),
(70, 'PARQUES3660', '205', 'CONTENEDOR DE ACERO PARQUE SENCILLO', 'PARQUES3660'),
(71, 'PACHUCADOBLE', '205', 'CONTENEDOR PARA EXTERIOR PACHUCA DOBLE', 'PACHUCADOBLE'),
(72, 'PACHUCASENCILLO', '205', 'CONTENEDOR METALICO PACHUCA SENCILLO', 'PACHUCASENCILLO'),
(73, 'BARCELOARCO', '205', 'BOTE PARA BASURA DE METAL BARCELONA SENCILLO CON ARCO', 'BARCELOARCO'),
(74, 'BARCELORECICLA', '205', 'BOTE PARA BASURA DE METAL BARCELONA DOBLE ORGANICO E INORGANICO', 'BARCELORECICLA'),
(75, 'BARCELONA80CL', '205', 'BOTE PARA BASURA DE METAL BARCELONA 80 LT CON SEÑALIZACIÓN', 'BARCELONA80CL'),
(76, 'BARCELONA80', '205', 'BOTE PARA BASURA DE METAL BARCELONA 80 LT', 'BARCELONA80'),
(77, '6510-1-3-11B', '203', 'BASURERO ECOLOGICO BALANCIN CILINDRICO', '6510-1-3-11B'),
(78, '651211', '203', 'BASURERO ECOLOGICO BALANCIN CILINDRICO JUMBO', '651211'),
(79, '6510-1-3-11A', '203', 'BASURERO ECOLOGICO CILINDRICO ARO', '6510-1-3-11A'),
(80, '652211', '203', 'BASURERO ECOLOGICO CILINDRICO ARO JUMBO', '652211'),
(81, '654011', '203', 'BOTE PARA BASURA ECOLOGICO CUBO', '654011'),
(82, '655011', '203', 'BOTE PARA BASURA ECOLOGICO CUBO BALANCIN', '655011'),
(83, '660011', '203', 'CONTENEDOR DE BASURA ECOLOGICO CUBO GRANDE', '660011'),
(84, '661011', '203', 'CONTENEDOR DE BASURA ECOLOGICO CUBO GRANDE BALANCIN', '661011'),
(85, '6530-1-11', '203', 'BASURERO ECOLOGICO MEDIO PUNTO', '6530-1-11'),
(86, '6560-1-11', '203', 'BASURERO ECOLOGICO MEDIO PUNTO BALANCIN', '6560-1-11'),
(87, '655211', '203', 'CONTENEDOR ECOLOGICO JUMBO RECICLABLE', '655211'),
(88, '656211', '203', 'CONTENEDOR ECOLOGICO DOBLE BALANCIN', '656211'),
(89, '657211', '203', 'CONTENEDOR ECOLOGICO JUMBO DOBLE', '657211'),
(90, '630311', '203', 'CONTENEDOR ECOLOGICO DUPLEX', '630311'),
(91, '658011', '203', 'CONTENEDOR ECOLOGICO CUBO DOBLE', '658011'),
(92, '662024', '203', 'CONTENEDOR ECOLOGICO BOX', '658011'),
(93, '680041', '203', 'CONTENEDOR ECOLOGICO OFFICE 2 SEPARACIONES', '680041'),
(94, '680042', '203', 'CONTENEDOR ECOLOGICO OFFICE 3 SEPARACIONES', '680042'),
(95, 'BACI31-33', '203', 'BASURERO ECOLOGICO DE ACERO BACI 31-33', 'BACI31-33'),
(96, 'BACI34', '203', 'CONTENEDOR DE BASURA ECOLOGICO BACI 34', 'BACI34'),
(97, 'BACI35', '203', 'BOTE ECOLOGICO DE BASURA BACI 35', 'BACI35'),
(98, 'BACI36', '203', 'CONTENEDOR DE BASURA ECOLÓGICO BACI 36', 'BACI36'),
(99, 'BACI37', '203', 'CONTENEDOR DE BASURA ECOLÓGICO BACI 37', 'BACI37'),
(100, 'BACI38', '203', 'CONTENEDOR DE BASURA ECOLÓGICO BACI 38', 'BACI38'),
(101, 'BACI40', '203', 'CONTENEDOR DE BASURA ECOLÓGICO BACI 40', 'BACI40'),
(102, 'BACI61', '203', 'BASURERO ECOLÓGICO DUPLEX BACI 61', 'BACI61'),
(103, 'BACI62', '203', 'BASURERO ECOLÓGICO TRIPLE BACI 62', 'BACI62'),
(104, 'BACR35', '203', 'BASURERO ECOLOGICO RECTANGULAR DUPLEX BACR 35', 'BACR35'),
(105, 'BACR36', '203', 'BASURERO ECOLOGICO RECTANGULAR TRIPLE BACR 36', 'BACR36'),
(106, 'BACR37', '203', 'BASURERO ECOLOGICO RECTANGULAR DUPLEX BACR 37', 'BACR37'),
(107, 'BACR81', '203', 'BASURERO ECOLOGICO RECTANGULAR DUPLEX BACR 81', 'BACR81'),
(108, 'BACR83', '203', 'BASURERO ECOLOGICO RECTANGULAR DUPLEX BACR 83', 'BACR83'),
(109, 'BACR84', '203', 'BASURERO ECOLOGICO RECTANGULAR TRIPLE BACR 84', 'BACR84'),
(110, '605011', '203', 'BASURERO ECOLOGICO TIPO CUBO BACR 86-92', '605011'),
(111, 'BATR01-08', '203', 'BASURERO ECOLOGICO TRIANGULAR BATR 01-08', 'BATR01-08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategoria`
--

CREATE TABLE `subcategoria` (
  `id` int(11) NOT NULL,
  `idSubcategoria` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `fk_idCategoria` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nombreSubcategoria` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imagenSubcategoria` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `subcategoria`
--

INSERT INTO `subcategoria` (`id`, `idSubcategoria`, `fk_idCategoria`, `nombreSubcategoria`, `imagenSubcategoria`) VALUES
(1, '101', '10001', 'Contenedores de plástico grandes', '10001101'),
(2, '102', '10001', 'Botes de plástico chicos', '10001102'),
(3, '103', '10001', 'Botes ecológicos', '10001103'),
(4, '104', '10001', 'Botes para residuos biológicos', '10001104'),
(5, '105', '10001', 'Botes para basura con pedal', '10001105'),
(6, '106', '10001', 'Carros barrenderos', '10001106'),
(7, '107', '10001', 'Contenedores para pilas', '10001107'),
(8, '108', '10001', 'Estaciones de reciclaje', '10001108'),
(9, '109', '10001', 'Contenedores para desechos caninos', '10001109'),
(10, '201', '20001', 'Cestos chicos de acero inoxidable', '20001201'),
(11, '202', '20001', 'Botes de acero inoxidable', '20001202'),
(12, '203', '20001', 'Botes ecológicos en acero inoxidable', '20001203'),
(13, '204', '20001', 'Botes con pedal en acero inoxidable', '20001204'),
(14, '205', '20001', 'Contenedores metálicos para exterior', '20001205'),
(15, '206', '20001', 'Contenedore metálicos grandes', '20001206'),
(16, '207', '20001', 'Contenedores para Fast Food', '20001207'),
(17, '208', '20001', 'Ceniceros y portaextintores', '20001208'),
(18, '401', '40001', 'Mobiliario urbano', '40001401'),
(19, '402', '40001', 'Señalamiento vial', '40001402'),
(20, '403', '40001', 'Productos de contingencia', '40001403'),
(21, '404', '40001', 'Pallets y tarimas', '40001404'),
(22, '301', '30001', 'Botes de fibra de vidrio', '30001301');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`,`idCategoria`),
  ADD UNIQUE KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `descripcion_producto`
--
ALTER TABLE `descripcion_producto`
  ADD PRIMARY KEY (`id`,`id_descripcion`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`,`idProducto`),
  ADD UNIQUE KEY `idProducto` (`idProducto`),
  ADD KEY `fk_subcategoria` (`fk_idSubcategoria`);

--
-- Indices de la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD PRIMARY KEY (`id`,`idSubcategoria`),
  ADD UNIQUE KEY `idSubcategoria` (`idSubcategoria`),
  ADD KEY `fk_categoria` (`fk_idCategoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `descripcion_producto`
--
ALTER TABLE `descripcion_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT de la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_subcategoria` FOREIGN KEY (`fk_idSubcategoria`) REFERENCES `subcategoria` (`idSubcategoria`);

--
-- Filtros para la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`fk_idCategoria`) REFERENCES `categoria` (`idCategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
