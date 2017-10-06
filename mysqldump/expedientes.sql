-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.16-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla tolteca.expedientes
DROP TABLE IF EXISTS `expedientes`;
CREATE TABLE IF NOT EXISTS `expedientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `numsec` varchar(255) DEFAULT NULL,
  `estudiante` int(11) DEFAULT NULL,
  `programa` int(11) DEFAULT NULL,
  `estado` text,
  `curso_apertura` varchar(255) DEFAULT NULL,
  `fec_incidencia` datetime DEFAULT NULL,
  `incidencia` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca.expedientes: 0 rows
/*!40000 ALTER TABLE `expedientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `expedientes` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.expedientes_19_repeat
DROP TABLE IF EXISTS `expedientes_19_repeat`;
CREATE TABLE IF NOT EXISTS `expedientes_19_repeat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `fec_incidencia` datetime DEFAULT NULL,
  `incidencia` text,
  PRIMARY KEY (`id`),
  KEY `fb_parent_fk_parent_id_INDEX` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca.expedientes_19_repeat: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `expedientes_19_repeat` DISABLE KEYS */;
/*!40000 ALTER TABLE `expedientes_19_repeat` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.incidencias_exp
DROP TABLE IF EXISTS `incidencias_exp`;
CREATE TABLE IF NOT EXISTS `incidencias_exp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca.incidencias_exp: 0 rows
/*!40000 ALTER TABLE `incidencias_exp` DISABLE KEYS */;
/*!40000 ALTER TABLE `incidencias_exp` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
