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

-- Volcando estructura para tabla tolteca.tltc_assets
DROP TABLE IF EXISTS `tltc_assets`;
CREATE TABLE IF NOT EXISTS `tltc_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_assets: ~67 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_assets` DISABLE KEYS */;
INSERT INTO `tltc_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
	(1, 0, 0, 133, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
	(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
	(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
	(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
	(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
	(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
	(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
	(8, 1, 17, 26, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
	(9, 1, 27, 28, 1, 'com_cpanel', 'com_cpanel', '{}'),
	(10, 1, 29, 30, 1, 'com_installer', 'com_installer', '{"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
	(11, 1, 31, 32, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1}}'),
	(12, 1, 33, 34, 1, 'com_login', 'com_login', '{}'),
	(13, 1, 35, 36, 1, 'com_mailto', 'com_mailto', '{}'),
	(14, 1, 37, 38, 1, 'com_massmail', 'com_massmail', '{}'),
	(15, 1, 39, 40, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
	(16, 1, 41, 44, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1}}'),
	(17, 1, 45, 46, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
	(18, 1, 47, 96, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1}}'),
	(19, 1, 97, 100, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
	(20, 1, 101, 102, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1}}'),
	(21, 1, 103, 104, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1}}'),
	(22, 1, 105, 106, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
	(23, 1, 107, 108, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1}}'),
	(24, 1, 109, 112, 1, 'com_users', 'com_users', '{"core.admin":{"7":1}}'),
	(26, 1, 113, 114, 1, 'com_wrapper', 'com_wrapper', '{}'),
	(27, 8, 18, 25, 2, 'com_content.category.2', 'Uncategorised', '{}'),
	(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{}'),
	(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{}'),
	(30, 19, 98, 99, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{}'),
	(32, 24, 110, 111, 2, 'com_users.category.7', 'Uncategorised', '{}'),
	(33, 1, 115, 116, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
	(34, 1, 117, 118, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{}'),
	(35, 1, 119, 120, 1, 'com_tags', 'com_tags', '{}'),
	(36, 1, 121, 122, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
	(37, 1, 123, 124, 1, 'com_ajax', 'com_ajax', '{}'),
	(38, 1, 125, 126, 1, 'com_postinstall', 'com_postinstall', '{}'),
	(39, 18, 48, 49, 2, 'com_modules.module.1', 'Menu Principal', '{}'),
	(40, 18, 50, 51, 2, 'com_modules.module.2', 'Login', '{}'),
	(41, 18, 52, 53, 2, 'com_modules.module.3', 'Popular Articles', '{}'),
	(42, 18, 54, 55, 2, 'com_modules.module.4', 'Recently Added Articles', '{}'),
	(43, 18, 56, 57, 2, 'com_modules.module.8', 'Toolbar', '{}'),
	(44, 18, 58, 59, 2, 'com_modules.module.9', 'Quick Icons', '{}'),
	(45, 18, 60, 61, 2, 'com_modules.module.10', 'Logged-in Users', '{}'),
	(46, 18, 62, 63, 2, 'com_modules.module.12', 'Admin Menu', '{}'),
	(47, 18, 64, 65, 2, 'com_modules.module.13', 'Admin Submenu', '{}'),
	(48, 18, 66, 67, 2, 'com_modules.module.14', 'User Status', '{}'),
	(49, 18, 68, 69, 2, 'com_modules.module.15', 'Title', '{}'),
	(50, 18, 70, 71, 2, 'com_modules.module.16', 'Login', '{}'),
	(51, 18, 72, 73, 2, 'com_modules.module.17', 'Breadcrumbs', '{}'),
	(52, 18, 74, 75, 2, 'com_modules.module.79', 'Multilanguage status', '{}'),
	(53, 18, 76, 77, 2, 'com_modules.module.86', 'Joomla Version', '{}'),
	(54, 16, 42, 43, 2, 'com_menus.menu.1', 'Main Menu', '{}'),
	(55, 1, 127, 128, 1, '#__languages.2', '#__languages.2', '{}'),
	(56, 27, 19, 20, 3, 'com_content.article.1', 'Portada', '{}'),
	(57, 18, 78, 79, 2, 'com_modules.module.87', 'Fabrik Form Module', '{}'),
	(58, 18, 80, 81, 2, 'com_modules.module.88', 'Fabrik List Module', '{}'),
	(59, 1, 129, 130, 1, 'com_fabrik', 'com_fabrik', '{}'),
	(60, 1, 131, 132, 1, 'com_jce', 'COM_JCE', '{}'),
	(61, 27, 21, 22, 3, 'com_content.article.2', 'Panel de opciones', '{}'),
	(62, 27, 23, 24, 3, 'com_content.article.3', 'Administrar', '{}'),
	(63, 18, 82, 83, 2, 'com_modules.module.89', 'PO_Mi_Cuenta', '{}'),
	(64, 18, 84, 85, 2, 'com_modules.module.90', 'PO_Mis_Cursos', '{}'),
	(65, 18, 86, 87, 2, 'com_modules.module.91', 'PO_Mis_Cursos (copia)', '{}'),
	(66, 18, 88, 89, 2, 'com_modules.module.92', 'PO_Salir', '{}'),
	(67, 18, 90, 91, 2, 'com_modules.module.93', 'PO_Usuarios', '{}'),
	(68, 18, 92, 93, 2, 'com_modules.module.94', 'PO_Solicitudes_Cursos', '{}'),
	(69, 18, 94, 95, 2, 'com_modules.module.95', 'PO_Cursos_Administrar', '{}');
/*!40000 ALTER TABLE `tltc_assets` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_associations
DROP TABLE IF EXISTS `tltc_associations`;
CREATE TABLE IF NOT EXISTS `tltc_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_associations: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_associations` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_banners
DROP TABLE IF EXISTS `tltc_banners`;
CREATE TABLE IF NOT EXISTS `tltc_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100)),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_banners: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_banners` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_banner_clients
DROP TABLE IF EXISTS `tltc_banner_clients`;
CREATE TABLE IF NOT EXISTS `tltc_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_banner_clients: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_banner_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_banner_clients` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_banner_tracks
DROP TABLE IF EXISTS `tltc_banner_tracks`;
CREATE TABLE IF NOT EXISTS `tltc_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_banner_tracks: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_banner_tracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_banner_tracks` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_categories
DROP TABLE IF EXISTS `tltc_categories`;
CREATE TABLE IF NOT EXISTS `tltc_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_categories: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_categories` DISABLE KEYS */;
INSERT INTO `tltc_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
	(1, 0, 0, 0, 11, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '{}', 678, '2017-09-12 09:07:43', 0, '0000-00-00 00:00:00', 0, '*', 1),
	(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 678, '2017-09-12 09:07:43', 0, '0000-00-00 00:00:00', 0, '*', 1),
	(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 678, '2017-09-12 09:07:43', 0, '0000-00-00 00:00:00', 0, '*', 1),
	(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 678, '2017-09-12 09:07:43', 0, '0000-00-00 00:00:00', 0, '*', 1),
	(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 678, '2017-09-12 09:07:43', 0, '0000-00-00 00:00:00', 0, '*', 1),
	(7, 32, 1, 9, 10, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 678, '2017-09-12 09:07:43', 0, '0000-00-00 00:00:00', 0, '*', 1);
/*!40000 ALTER TABLE `tltc_categories` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_contact_details
DROP TABLE IF EXISTS `tltc_contact_details`;
CREATE TABLE IF NOT EXISTS `tltc_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `con_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `suburb` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if contact is featured.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_contact_details: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_contact_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_contact_details` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_content
DROP TABLE IF EXISTS `tltc_content`;
CREATE TABLE IF NOT EXISTS `tltc_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_content: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_content` DISABLE KEYS */;
INSERT INTO `tltc_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
	(1, 56, 'Portada', 'portada', '<p>Bienvenido a Tolteca, aplicación web para la gestión de procesos de la Escuela Internacional de Doctorado.</p>\r\n<p>Para la inscripción cursos por favor, haz clic en el siguiente botón</p>\r\n<p><a href="index.php?option=com_fabrik&amp;view=list&amp;listid=1&amp;Itemid=114" class="btn btn-primary">Ver cursos</a></p>', '', 1, 2, '2017-09-12 09:38:18', 1, '', '2017-09-18 08:25:20', 1, 0, '0000-00-00 00:00:00', '2017-09-12 09:38:18', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 2, '', '', 1, 157, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
	(2, 61, 'Panel de opciones', 'panel-de-opciones', '<p>{loadmodule mod_custom,PO_Mi_Cuenta}{loadmodule mod_custom,PO_Mis_Cursos}{loadmodule mod_custom,PO_Usuarios}{loadmodule mod_custom,PO_Solicitudes_Cursos}{loadmodule mod_custom,PO_Cursos_Administrar}{loadmodule mod_custom,PO_Salir}</p>', '', 1, 2, '2017-09-14 08:56:32', 1, '', '2017-09-15 10:06:44', 1, 0, '0000-00-00 00:00:00', '2017-09-14 08:56:32', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 4, 1, '', '', 2, 85, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
	(3, 62, 'Administrar', 'administrar', '<p>Administrar{loadmodule mod_custom,PO_Usuarios}{loadmodule mod_custom,PO_Solicitudes_Cursos}{loadmodule mod_custom,PO_Cursos_Administrar}</p>', '', 1, 2, '2017-09-14 09:06:43', 1, '', '2017-09-15 10:11:33', 1, 0, '0000-00-00 00:00:00', '2017-09-14 09:06:43', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, '', '', 3, 8, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');
/*!40000 ALTER TABLE `tltc_content` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_contentitem_tag_map
DROP TABLE IF EXISTS `tltc_contentitem_tag_map`;
CREATE TABLE IF NOT EXISTS `tltc_contentitem_tag_map` (
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';

-- Volcando datos para la tabla tolteca.tltc_contentitem_tag_map: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_contentitem_tag_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_contentitem_tag_map` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_content_frontpage
DROP TABLE IF EXISTS `tltc_content_frontpage`;
CREATE TABLE IF NOT EXISTS `tltc_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_content_frontpage: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_content_frontpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_content_frontpage` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_content_rating
DROP TABLE IF EXISTS `tltc_content_rating`;
CREATE TABLE IF NOT EXISTS `tltc_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_content_rating: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_content_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_content_rating` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_content_types
DROP TABLE IF EXISTS `tltc_content_types`;
CREATE TABLE IF NOT EXISTS `tltc_content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_content_types: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_content_types` DISABLE KEYS */;
INSERT INTO `tltc_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
	(1, 'Article', 'com_content.article', '{"special":{"dbtable":"#__content","key":"id","type":"Content","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"state","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"introtext", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"attribs", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"asset_id"}, "special":{"fulltext":"fulltext"}}', 'ContentHelperRoute::getArticleRoute', '{"formFile":"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml", "hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
	(2, 'Contact', 'com_contact.contact', '{"special":{"dbtable":"#__contact_details","key":"id","type":"Contact","prefix":"ContactTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"address", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"image", "core_urls":"webpage", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"con_position":"con_position","suburb":"suburb","state":"state","country":"country","postcode":"postcode","telephone":"telephone","fax":"fax","misc":"misc","email_to":"email_to","default_con":"default_con","user_id":"user_id","mobile":"mobile","sortname1":"sortname1","sortname2":"sortname2","sortname3":"sortname3"}}', 'ContactHelperRoute::getContactRoute', '{"formFile":"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml","hideFields":["default_con","checked_out","checked_out_time","version","xreference"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"], "displayLookup":[ {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ] }'),
	(3, 'Newsfeed', 'com_newsfeeds.newsfeed', '{"special":{"dbtable":"#__newsfeeds","key":"id","type":"Newsfeed","prefix":"NewsfeedsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"numarticles":"numarticles","cache_time":"cache_time","rtl":"rtl"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{"formFile":"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml","hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
	(4, 'User', 'com_users.user', '{"special":{"dbtable":"#__users","key":"id","type":"User","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"null","core_alias":"username","core_created_time":"registerdate","core_modified_time":"lastvisitDate","core_body":"null", "core_hits":"null","core_publish_up":"null","core_publish_down":"null","access":"null", "core_params":"params", "core_featured":"null", "core_metadata":"null", "core_language":"null", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"null", "core_metakey":"null", "core_metadesc":"null", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{}}', 'UsersHelperRoute::getUserRoute', ''),
	(5, 'Article Category', 'com_content.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContentHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
	(6, 'Contact Category', 'com_contact.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContactHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
	(7, 'Newsfeeds Category', 'com_newsfeeds.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
	(8, 'Tag', 'com_tags.tag', '{"special":{"dbtable":"#__tags","key":"tag_id","type":"Tag","prefix":"TagsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path"}}', 'TagsHelperRoute::getTagRoute', '{"formFile":"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml", "hideFields":["checked_out","checked_out_time","version", "lft", "rgt", "level", "path", "urls", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
	(9, 'Banner', 'com_banners.banner', '{"special":{"dbtable":"#__banners","key":"id","type":"Banner","prefix":"BannersTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"null","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"null", "asset_id":"null"}, "special":{"imptotal":"imptotal", "impmade":"impmade", "clicks":"clicks", "clickurl":"clickurl", "custombannercode":"custombannercode", "cid":"cid", "purchase_type":"purchase_type", "track_impressions":"track_impressions", "track_clicks":"track_clicks"}}', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml", "hideFields":["checked_out","checked_out_time","version", "reset"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "imptotal", "impmade", "reset"], "convertToInt":["publish_up", "publish_down", "ordering"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"cid","targetTable":"#__banner_clients","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
	(10, 'Banners Category', 'com_banners.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
	(11, 'Banner Client', 'com_banners.client', '{"special":{"dbtable":"#__banner_clients","key":"id","type":"Client","prefix":"BannersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml", "hideFields":["checked_out","checked_out_time"], "ignoreChanges":["checked_out", "checked_out_time"], "convertToInt":[], "displayLookup":[]}'),
	(12, 'User Notes', 'com_users.note', '{"special":{"dbtable":"#__user_notes","key":"id","type":"Note","prefix":"UsersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml", "hideFields":["checked_out","checked_out_time", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
	(13, 'User Notes Category', 'com_users.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}');
/*!40000 ALTER TABLE `tltc_content_types` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_core_log_searches
DROP TABLE IF EXISTS `tltc_core_log_searches`;
CREATE TABLE IF NOT EXISTS `tltc_core_log_searches` (
  `search_term` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_core_log_searches: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_core_log_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_core_log_searches` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_extensions
DROP TABLE IF EXISTS `tltc_extensions`;
CREATE TABLE IF NOT EXISTS `tltc_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Parent package ID for extensions installed as a package.',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10058 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_extensions: ~219 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_extensions` DISABLE KEYS */;
INSERT INTO `tltc_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
	(1, 0, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MAILTO_XML_DESCRIPTION","group":"","filename":"mailto"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(2, 0, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":"","filename":"wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(3, 0, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(4, 0, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_BANNERS_XML_DESCRIPTION","group":"","filename":"banners"}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":"","save_history":"1","history_limit":10}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(5, 0, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(6, 0, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(7, 0, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"name":"com_checkin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(8, 0, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '{"contact_layout":"_:default","show_contact_category":"hide","save_history":"1","history_limit":10,"show_contact_list":"0","presentation_style":"sliders","show_tags":"1","show_info":"1","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_image":"1","show_misc":"1","image":"","allow_vcard":"0","show_articles":"0","articles_display_num":"10","show_profile":"0","show_user_custom_fields":["-1"],"show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"0","maxLevel":"-1","show_subcat_desc":"1","show_empty_categories":"0","show_cat_items":"1","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_subcat_desc_cat":"1","show_empty_categories_cat":"0","show_cat_items_cat":"1","filter_field":"0","show_pagination_limit":"0","show_headings":"1","show_image_heading":"0","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_pagination":"2","show_pagination_results":"1","initial_sort":"ordering","captcha":"","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_feed_link":"1","sef_advanced":0,"sef_ids":0,"custom_fields_enable":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(9, 0, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10, 0, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '{"show_jed_info":"1","cachetimeout":"6","minimum_stability":"4"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(11, 0, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"name":"com_languages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"es-ES","site":"es-ES"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(12, 0, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(13, 0, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MEDIA_XML_DESCRIPTION","group":"","filename":"media"}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(14, 0, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '{"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(15, 0, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(16, 0, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(17, 0, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"newsfeed_layout":"_:default","save_history":"1","history_limit":5,"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_character_count":"0","feed_display_order":"des","float_first":"right","float_second":"right","show_tags":"1","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"1","maxLevel":"-1","show_empty_categories":"0","show_subcat_desc":"1","show_cat_items":"1","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_items_cat":"1","filter_field":"1","show_pagination_limit":"1","show_headings":"1","show_articles":"0","show_link":"1","show_pagination":"1","show_pagination_results":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(18, 0, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(19, 0, 'com_search', 'component', 'com_search', '', 1, 1, 1, 0, '{"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_SEARCH_XML_DESCRIPTION","group":"","filename":"search"}', '{"enabled":"0","search_phrases":"1","search_areas":"1","show_date":"1","opensearch_name":"","opensearch_description":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(20, 0, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{"template_positions_display":"0","upload_limit":"10","image_formats":"gif,bmp,jpg,jpeg,png","source_formats":"txt,less,ini,xml,js,php,css,scss,sass","font_formats":"woff,ttf,otf","compressed_formats":"zip"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(22, 0, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"article_layout":"_:default","show_title":"0","link_titles":"1","show_intro":"0","info_block_position":"0","info_block_show_title":"0","show_category":"0","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_associations":"0","flags":"1","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_readmore":"0","show_readmore_title":"1","readmore_limit":"100","show_tags":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"0","captcha":"","show_publishing_options":"1","show_article_options":"1","save_history":"1","history_limit":10,"show_urls_images_frontend":"0","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_heading_title_text":"1","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","list_show_votes":"0","list_show_ratings":"0","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_featured":"show","show_feed_link":"1","feed_summary":"0","feed_show_readmore":"0","custom_fields_enable":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(23, 0, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"11":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"12":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"13":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"10":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(24, 0, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(25, 0, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_USERS_XML_DESCRIPTION","group":"","filename":"users"}', '{"allowUserRegistration":"0","new_usertype":"2","guest_usergroup":"1","sendpassword":"1","useractivation":"0","mail_to_admin":"1","captcha":"","frontend_userparams":"1","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","minimum_length":"4","minimum_integers":"0","minimum_symbols":"0","minimum_uppercase":"0","save_history":"1","history_limit":5,"mailSubjectPrefix":"","mailBodySuffix":"","debugUsers":"1","debugGroups":"1","custom_fields_enable":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(27, 0, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{"name":"com_finder","type":"component","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '{"enabled":"0","show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_autosuggest":"1","show_suggested_query":"1","show_explained_query":"1","show_advanced":"1","show_advanced_tips":"1","expand_advanced":"0","show_date_filters":"0","sort_order":"relevance","sort_direction":"desc","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stem":"1","stemmer":"snowball","enable_logging":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(28, 0, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.2","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{"updatesource":"default","customurl":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(29, 0, 'com_tags', 'component', 'com_tags', '', 1, 1, 1, 1, '{"name":"com_tags","type":"component","creationDate":"December 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"COM_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"tag_layout":"_:default","save_history":"1","history_limit":5,"show_tag_title":"0","tag_list_show_tag_image":"0","tag_list_show_tag_description":"0","tag_list_image":"","tag_list_orderby":"title","tag_list_orderby_direction":"ASC","show_headings":"0","tag_list_show_date":"0","tag_list_show_item_image":"0","tag_list_show_item_description":"0","tag_list_item_maximum_characters":0,"return_any_or_all":"1","include_children":"0","maximum":200,"tag_list_language_filter":"all","tags_layout":"_:default","all_tags_orderby":"title","all_tags_orderby_direction":"ASC","all_tags_show_tag_image":"0","all_tags_show_tag_descripion":"0","all_tags_tag_maximum_characters":20,"all_tags_show_tag_hits":"0","filter_field":"1","show_pagination_limit":"1","show_pagination":"2","show_pagination_results":"1","tag_field_ajax_mode":"1","show_feed_link":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(30, 0, 'com_contenthistory', 'component', 'com_contenthistory', '', 1, 1, 1, 0, '{"name":"com_contenthistory","type":"component","creationDate":"May 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_CONTENTHISTORY_XML_DESCRIPTION","group":"","filename":"contenthistory"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(31, 0, 'com_ajax', 'component', 'com_ajax', '', 1, 1, 1, 1, '{"name":"com_ajax","type":"component","creationDate":"August 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_AJAX_XML_DESCRIPTION","group":"","filename":"ajax"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(32, 0, 'com_postinstall', 'component', 'com_postinstall', '', 1, 1, 1, 1, '{"name":"com_postinstall","type":"component","creationDate":"September 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_POSTINSTALL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(33, 0, 'com_fields', 'component', 'com_fields', '', 1, 1, 1, 0, '{"name":"com_fields","type":"component","creationDate":"March 2016","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"COM_FIELDS_XML_DESCRIPTION","group":"","filename":"fields"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(34, 0, 'com_associations', 'component', 'com_associations', '', 1, 1, 1, 0, '{"name":"com_associations","type":"component","creationDate":"Januar 2017","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"COM_ASSOCIATIONS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(102, 0, 'LIB_PHPUTF8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"name":"LIB_PHPUTF8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":"","filename":"phputf8"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(103, 0, 'LIB_JOOMLA', 'library', 'joomla', '', 0, 1, 1, 1, '{"name":"LIB_JOOMLA","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"https:\\/\\/www.joomla.org","version":"13.1","description":"LIB_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"mediaversion":"a62aced1e8b3886e3dfe7c0e8a292789"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(104, 0, 'LIB_IDNA', 'library', 'idna_convert', '', 0, 1, 1, 1, '{"name":"LIB_IDNA","type":"library","creationDate":"2004","author":"phlyLabs","copyright":"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de","authorEmail":"phlymail@phlylabs.de","authorUrl":"http:\\/\\/phlylabs.de","version":"0.8.0","description":"LIB_IDNA_XML_DESCRIPTION","group":"","filename":"idna_convert"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(105, 0, 'FOF', 'library', 'fof', '', 0, 1, 1, 1, '{"name":"FOF","type":"library","creationDate":"2015-04-22 13:15:32","author":"Nicholas K. Dionysopoulos \\/ Akeeba Ltd","copyright":"(C)2011-2015 Nicholas K. Dionysopoulos","authorEmail":"nicholas@akeebabackup.com","authorUrl":"https:\\/\\/www.akeebabackup.com","version":"2.4.3","description":"LIB_FOF_XML_DESCRIPTION","group":"","filename":"fof"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(106, 0, 'LIB_PHPASS', 'library', 'phpass', '', 0, 1, 1, 1, '{"name":"LIB_PHPASS","type":"library","creationDate":"2004-2006","author":"Solar Designer","copyright":"","authorEmail":"solar@openwall.com","authorUrl":"http:\\/\\/www.openwall.com\\/phpass\\/","version":"0.3","description":"LIB_PHPASS_XML_DESCRIPTION","group":"","filename":"phpass"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(200, 0, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 0, '{"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":"","filename":"mod_articles_archive"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(201, 0, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 0, '{"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(202, 0, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_articles_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(203, 0, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '{"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":"","filename":"mod_banners"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(204, 0, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":"","filename":"mod_breadcrumbs"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(205, 0, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(206, 0, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(207, 0, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 0, '{"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":"","filename":"mod_footer"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(208, 0, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(209, 0, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(210, 0, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_news"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(211, 0, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":"","filename":"mod_random_image"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(212, 0, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RELATED_XML_DESCRIPTION","group":"","filename":"mod_related_items"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(213, 0, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":"","filename":"mod_search"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(214, 0, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(215, 0, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":"","filename":"mod_syndicate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(216, 0, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 0, '{"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":"","filename":"mod_users_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(218, 0, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":"","filename":"mod_whosonline"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(219, 0, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":"","filename":"mod_wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(220, 0, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 0, '{"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":"","filename":"mod_articles_category"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(221, 0, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 0, '{"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":"","filename":"mod_articles_categories"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(222, 0, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":"","filename":"mod_languages"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(223, 0, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{"name":"mod_finder","type":"module","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FINDER_XML_DESCRIPTION","group":"","filename":"mod_finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(300, 0, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(301, 0, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(302, 0, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_XML_DESCRIPTION","group":"","filename":"mod_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(303, 0, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":"","filename":"mod_logged"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(304, 0, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(305, 0, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(307, 0, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(308, 0, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":"","filename":"mod_quickicon"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(309, 0, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATUS_XML_DESCRIPTION","group":"","filename":"mod_status"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(310, 0, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":"","filename":"mod_submenu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(311, 0, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TITLE_XML_DESCRIPTION","group":"","filename":"mod_title"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(312, 0, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":"","filename":"mod_toolbar"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(313, 0, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":"","filename":"mod_multilangstatus"}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(314, 0, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_VERSION_XML_DESCRIPTION","group":"","filename":"mod_version"}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(315, 0, 'mod_stats_admin', 'module', 'mod_stats_admin', '', 1, 1, 1, 0, '{"name":"mod_stats_admin","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats_admin"}', '{"serverinfo":"0","siteinfo":"0","counter":"0","increase":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(316, 0, 'mod_tags_popular', 'module', 'mod_tags_popular', '', 0, 1, 1, 0, '{"name":"mod_tags_popular","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_tags_popular"}', '{"maximum":"5","timeframe":"alltime","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(317, 0, 'mod_tags_similar', 'module', 'mod_tags_similar', '', 0, 1, 1, 0, '{"name":"mod_tags_similar","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_SIMILAR_XML_DESCRIPTION","group":"","filename":"mod_tags_similar"}', '{"maximum":"5","matchtype":"any","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(400, 0, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":"","filename":"gmail"}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
	(401, 0, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(402, 0, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LDAP_XML_DESCRIPTION","group":"","filename":"ldap"}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
	(403, 0, 'plg_content_contact', 'plugin', 'contact', 'content', 0, 1, 1, 0, '{"name":"plg_content_contact","type":"plugin","creationDate":"January 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.2","description":"PLG_CONTENT_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
	(404, 0, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":"","filename":"emailcloak"}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
	(406, 0, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":"","filename":"loadmodule"}', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
	(407, 0, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
	(408, 0, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":"","filename":"pagenavigation"}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
	(409, 0, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 0, '{"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_VOTE_XML_DESCRIPTION","group":"","filename":"vote"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
	(410, 0, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"Copyright (C) 2014 - 2017 by Marijn Haverbeke <marijnh@gmail.com> and others","authorEmail":"marijnh@gmail.com","authorUrl":"http:\\/\\/codemirror.net\\/","version":"5.25.2","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":"","filename":"codemirror"}', '{"lineNumbers":"1","lineWrapping":"1","matchTags":"1","matchBrackets":"1","marker-gutter":"1","autoCloseTags":"1","autoCloseBrackets":"1","autoFocus":"1","theme":"default","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
	(411, 0, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_none","type":"plugin","creationDate":"September 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_NONE_XML_DESCRIPTION","group":"","filename":"none"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
	(412, 0, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 0, '{"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2017","author":"Ephox Corporation","copyright":"Ephox Corporation","authorEmail":"N\\/A","authorUrl":"http:\\/\\/www.tinymce.com","version":"4.5.7","description":"PLG_TINY_XML_DESCRIPTION","group":"","filename":"tinymce"}', '{"configuration":{"toolbars":{"2":{"toolbar1":["bold","underline","strikethrough","|","undo","redo","|","bullist","numlist","|","pastetext"]},"1":{"menu":["edit","insert","view","format","table","tools"],"toolbar1":["bold","italic","underline","strikethrough","|","alignleft","aligncenter","alignright","alignjustify","|","formatselect","|","bullist","numlist","|","outdent","indent","|","undo","redo","|","link","unlink","anchor","code","|","hr","table","|","subscript","superscript","|","charmap","pastetext","preview"]},"0":{"menu":["edit","insert","view","format","table","tools"],"toolbar1":["bold","italic","underline","strikethrough","|","alignleft","aligncenter","alignright","alignjustify","|","styleselect","|","formatselect","fontselect","fontsizeselect","|","searchreplace","|","bullist","numlist","|","outdent","indent","|","undo","redo","|","link","unlink","anchor","image","|","code","|","forecolor","backcolor","|","fullscreen","|","table","|","subscript","superscript","|","charmap","emoticons","media","hr","ltr","rtl","|","cut","copy","paste","pastetext","|","visualchars","visualblocks","nonbreaking","blockquote","template","|","print","preview","codesample","insertdatetime","removeformat"]}},"setoptions":{"2":{"access":["1"],"skin":"0","skin_admin":"0","mobile":"0","drag_drop":"1","path":"","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","use_config_textfilters":"0","invalid_elements":"script,applet,iframe","valid_elements":"","extended_elements":"","resizing":"1","resize_horizontal":"1","element_path":"1","wordcount":"1","image_advtab":"0","advlist":"1","autosave":"1","contextmenu":"1","custom_plugin":"","custom_button":""},"1":{"access":["6","2"],"skin":"0","skin_admin":"0","mobile":"0","drag_drop":"1","path":"","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","use_config_textfilters":"0","invalid_elements":"script,applet,iframe","valid_elements":"","extended_elements":"","resizing":"1","resize_horizontal":"1","element_path":"1","wordcount":"1","image_advtab":"0","advlist":"1","autosave":"1","contextmenu":"1","custom_plugin":"","custom_button":""},"0":{"access":["7","4","8"],"skin":"0","skin_admin":"0","mobile":"0","drag_drop":"1","path":"","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","use_config_textfilters":"0","invalid_elements":"script,applet,iframe","valid_elements":"","extended_elements":"","resizing":"1","resize_horizontal":"1","element_path":"1","wordcount":"1","image_advtab":"1","advlist":"1","autosave":"1","contextmenu":"1","custom_plugin":"","custom_button":""}}},"sets_amount":3,"html_height":"550","html_width":"750"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
	(413, 0, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":"","filename":"article"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
	(414, 0, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":"","filename":"image"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
	(415, 0, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
	(416, 0, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_READMORE_XML_DESCRIPTION","group":"","filename":"readmore"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
	(417, 0, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(418, 0, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(419, 0, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(420, 0, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(422, 0, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":"","filename":"languagefilter"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
	(423, 0, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 0, 1, 0, '{"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_P3P_XML_DESCRIPTION","group":"","filename":"p3p"}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
	(424, 0, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CACHE_XML_DESCRIPTION","group":"","filename":"cache"}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
	(425, 0, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":"","filename":"debug"}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
	(426, 0, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOG_XML_DESCRIPTION","group":"","filename":"log"}', '', '', '', 0, '0000-00-00 00:00:00', 5, 0),
	(427, 0, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 0, 1, 1, '{"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION","group":"","filename":"redirect"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
	(428, 0, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":"","filename":"remember"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
	(429, 0, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEF_XML_DESCRIPTION","group":"","filename":"sef"}', '', '', '', 0, '0000-00-00 00:00:00', 8, 0),
	(430, 0, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":"","filename":"logout"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
	(431, 0, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 0, '{"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":"","filename":"contactcreator"}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
	(432, 0, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"autoregister":"1","mail_to_user":"1","forceLogout":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
	(433, 0, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 0, '{"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":"","filename":"profile"}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(434, 0, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
	(435, 0, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(436, 0, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":"","filename":"languagecode"}', '', '', '', 0, '0000-00-00 00:00:00', 10, 0),
	(437, 0, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":"","filename":"joomlaupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(438, 0, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":"","filename":"extensionupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(439, 0, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 0, 1, 0, '{"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":"","filename":"recaptcha"}', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(440, 0, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{"name":"plg_system_highlight","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":"","filename":"highlight"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
	(441, 0, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(442, 0, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
	(443, 0, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
	(444, 0, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
	(445, 0, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
	(447, 0, 'plg_finder_tags', 'plugin', 'tags', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_tags","type":"plugin","creationDate":"February 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(448, 0, 'plg_twofactorauth_totp', 'plugin', 'totp', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_totp","type":"plugin","creationDate":"August 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION","group":"","filename":"totp"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(449, 0, 'plg_authentication_cookie', 'plugin', 'cookie', 'authentication', 0, 1, 1, 0, '{"name":"plg_authentication_cookie","type":"plugin","creationDate":"July 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_COOKIE_XML_DESCRIPTION","group":"","filename":"cookie"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(450, 0, 'plg_twofactorauth_yubikey', 'plugin', 'yubikey', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_yubikey","type":"plugin","creationDate":"September 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION","group":"","filename":"yubikey"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(451, 0, 'plg_search_tags', 'plugin', 'tags', 'search', 0, 1, 1, 0, '{"name":"plg_search_tags","type":"plugin","creationDate":"March 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"search_limit":"50","show_tagged_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(452, 0, 'plg_system_updatenotification', 'plugin', 'updatenotification', 'system', 0, 1, 1, 0, '{"name":"plg_system_updatenotification","type":"plugin","creationDate":"May 2015","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_SYSTEM_UPDATENOTIFICATION_XML_DESCRIPTION","group":"","filename":"updatenotification"}', '{"lastrun":1507015260}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(453, 0, 'plg_editors-xtd_module', 'plugin', 'module', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_module","type":"plugin","creationDate":"October 2015","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_MODULE_XML_DESCRIPTION","group":"","filename":"module"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(454, 0, 'plg_system_stats', 'plugin', 'stats', 'system', 0, 1, 1, 0, '{"name":"plg_system_stats","type":"plugin","creationDate":"November 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_SYSTEM_STATS_XML_DESCRIPTION","group":"","filename":"stats"}', '{"mode":1,"lastrun":1507015274,"unique_id":"dea65140bb91c3dd4423d067fe5c31a2642dd739","interval":12}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(455, 0, 'plg_installer_packageinstaller', 'plugin', 'packageinstaller', 'installer', 0, 1, 1, 1, '{"name":"plg_installer_packageinstaller","type":"plugin","creationDate":"May 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","filename":"packageinstaller"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
	(456, 0, 'PLG_INSTALLER_FOLDERINSTALLER', 'plugin', 'folderinstaller', 'installer', 0, 1, 1, 1, '{"name":"PLG_INSTALLER_FOLDERINSTALLER","type":"plugin","creationDate":"May 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","filename":"folderinstaller"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
	(457, 0, 'PLG_INSTALLER_URLINSTALLER', 'plugin', 'urlinstaller', 'installer', 0, 1, 1, 1, '{"name":"PLG_INSTALLER_URLINSTALLER","type":"plugin","creationDate":"May 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","filename":"urlinstaller"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
	(458, 0, 'plg_quickicon_phpversioncheck', 'plugin', 'phpversioncheck', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_phpversioncheck","type":"plugin","creationDate":"August 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_QUICKICON_PHPVERSIONCHECK_XML_DESCRIPTION","group":"","filename":"phpversioncheck"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(459, 0, 'plg_editors-xtd_menu', 'plugin', 'menu', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_menu","type":"plugin","creationDate":"August 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_EDITORS-XTD_MENU_XML_DESCRIPTION","group":"","filename":"menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(460, 0, 'plg_editors-xtd_contact', 'plugin', 'contact', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_contact","type":"plugin","creationDate":"October 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_EDITORS-XTD_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(461, 0, 'plg_system_fields', 'plugin', 'fields', 'system', 0, 1, 1, 0, '{"name":"plg_system_fields","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_SYSTEM_FIELDS_XML_DESCRIPTION","group":"","filename":"fields"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(462, 0, 'plg_fields_calendar', 'plugin', 'calendar', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_calendar","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_CALENDAR_XML_DESCRIPTION","group":"","filename":"calendar"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(463, 0, 'plg_fields_checkboxes', 'plugin', 'checkboxes', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_checkboxes","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_CHECKBOXES_XML_DESCRIPTION","group":"","filename":"checkboxes"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(464, 0, 'plg_fields_color', 'plugin', 'color', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_color","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_COLOR_XML_DESCRIPTION","group":"","filename":"color"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(465, 0, 'plg_fields_editor', 'plugin', 'editor', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_editor","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_EDITOR_XML_DESCRIPTION","group":"","filename":"editor"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(466, 0, 'plg_fields_imagelist', 'plugin', 'imagelist', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_imagelist","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_IMAGELIST_XML_DESCRIPTION","group":"","filename":"imagelist"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(467, 0, 'plg_fields_integer', 'plugin', 'integer', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_integer","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_INTEGER_XML_DESCRIPTION","group":"","filename":"integer"}', '{"multiple":"0","first":"1","last":"100","step":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(468, 0, 'plg_fields_list', 'plugin', 'list', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_list","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_LIST_XML_DESCRIPTION","group":"","filename":"list"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(469, 0, 'plg_fields_media', 'plugin', 'media', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_media","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_MEDIA_XML_DESCRIPTION","group":"","filename":"media"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(470, 0, 'plg_fields_radio', 'plugin', 'radio', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_radio","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_RADIO_XML_DESCRIPTION","group":"","filename":"radio"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(471, 0, 'plg_fields_sql', 'plugin', 'sql', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_sql","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_SQL_XML_DESCRIPTION","group":"","filename":"sql"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(472, 0, 'plg_fields_text', 'plugin', 'text', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_text","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_TEXT_XML_DESCRIPTION","group":"","filename":"text"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(473, 0, 'plg_fields_textarea', 'plugin', 'textarea', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_textarea","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_TEXTAREA_XML_DESCRIPTION","group":"","filename":"textarea"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(474, 0, 'plg_fields_url', 'plugin', 'url', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_url","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_URL_XML_DESCRIPTION","group":"","filename":"url"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(475, 0, 'plg_fields_user', 'plugin', 'user', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_user","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_USER_XML_DESCRIPTION","group":"","filename":"user"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(476, 0, 'plg_fields_usergrouplist', 'plugin', 'usergrouplist', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_usergrouplist","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_USERGROUPLIST_XML_DESCRIPTION","group":"","filename":"usergrouplist"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(477, 0, 'plg_content_fields', 'plugin', 'fields', 'content', 0, 1, 1, 0, '{"name":"plg_content_fields","type":"plugin","creationDate":"February 2017","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_CONTENT_FIELDS_XML_DESCRIPTION","group":"","filename":"fields"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(478, 0, 'plg_editors-xtd_fields', 'plugin', 'fields', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_fields","type":"plugin","creationDate":"February 2017","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_EDITORS-XTD_FIELDS_XML_DESCRIPTION","group":"","filename":"fields"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(503, 0, 'beez3', 'template', 'beez3', '', 0, 1, 1, 0, '{"name":"beez3","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2017 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"3.1.0","description":"TPL_BEEZ3_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(504, 0, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2017 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"3.0.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(506, 0, 'protostar', 'template', 'protostar', '', 0, 1, 1, 0, '{"name":"protostar","type":"template","creationDate":"4\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2017 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_PROTOSTAR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(507, 0, 'isis', 'template', 'isis', '', 1, 1, 1, 0, '{"name":"isis","type":"template","creationDate":"3\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2017 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_ISIS_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(600, 802, 'English (en-GB)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"August 2017","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.5","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(601, 802, 'English (en-GB)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"August 2017","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.5","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(700, 0, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"name":"files_joomla","type":"file","creationDate":"August 2017","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.5","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(802, 0, 'English (en-GB) Language Pack', 'package', 'pkg_en-GB', '', 0, 1, 1, 1, '{"name":"English (en-GB) Language Pack","type":"package","creationDate":"August 2017","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.5.1","description":"en-GB language pack","group":"","filename":"pkg_en-GB"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10000, 10002, 'Spanishespaol', 'language', 'es-ES', '', 0, 1, 0, 0, '{"name":"Spanish (espa\\u00f1ol)","type":"language","creationDate":"25\\/05\\/2017","author":"ComunidadJoomla","copyright":"Copyright (C) 2005 - 2017 Comunidadjoomla.org. All rights reserved.","authorEmail":"jcomunidad@gmail.com","authorUrl":"","version":"3.7.2.1","description":"es-ES - Site language","group":"","filename":"install"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10001, 10002, 'Spanishespaol', 'language', 'es-ES', '', 1, 1, 0, 0, '{"name":"Spanish (espa\\u00f1ol)","type":"language","creationDate":"25\\/05\\/2017","author":"ComunidadJoomla","copyright":"Copyright (C) 2005 - 2017 Comunidadjoomla.org. All rights reserved.","authorEmail":"jcomunidad@gmail.com","authorUrl":"","version":"3.7.2.1","description":"es-ES - Administration language","group":"","filename":"install"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10002, 0, 'joomla_lang_full', 'package', 'pkg_es-ES', '', 0, 1, 1, 0, '{"name":"joomla_lang_full","type":"package","creationDate":"25\\/05\\/2017","author":"ComunidadJoomla","copyright":"Copyright (C) 2005 - 2017 Comunidadjoomla.org. All rights reserved.","authorEmail":"jcomunidad@gmail.com","authorUrl":"","version":"3.7.2.1","description":"<div style=\\"text-align:left;\\"><h2>Successfully installed the spanish language pack for Joomla! 3.7.2.<\\/h2><p><\\/p><p>Please report any bugs or issues at the Comunidad Joomla! <a href=\\"http:\\/\\/foro.comunidadjoomla.org\\/traduccion-ext\\/\\" target=\\"_blank\\">Translation forum<\\/a><\\/p><p><\\/p><p>Translated by: <a href=\\"http:\\/\\/www.comunidadjoomla.org\\" target=\\"_blank\\" title=\\"\\">The spanish translation team of Comunidad Joomla!<\\/a><\\/p><h2>El paquete en espa\\u00f1ol para Joomla! 3.7.2 se ha instalado correctamente.<\\/h2><p><\\/p><p>Por favor, reporte cualquier bug o asunto relacionado a nuestro <a href=\\"http:\\/\\/foro.comunidadjoomla.org\\/traduccion-ext\\/\\" target=\\"_blank\\">Foro de traducciones<\\/a><\\/p><p><\\/p><p>Traducci\\u00f3n: <a href=\\"http:\\/\\/www.comunidadjoomla.org\\" target=\\"_blank\\" title=\\"\\">El equipo de traducci\\u00f3n de Comunidad Joomla!<\\/a><\\/p><\\/div>","group":"","filename":"pkg_es-ES"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10003, 0, 'Tolteca', 'template', 'tolteca', '', 0, 1, 1, 0, '{"name":"Tolteca","type":"template","creationDate":"09\\/12\\/2017","author":"Ezequiel Ardila","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"ezequiel@us.es","authorUrl":"","version":"1.0","description":"Plantilla para la aplicacion de Tolteca. Basada en Protostar","group":"","filename":"templateDetails"}', '{"templateColor":"#08C","templateBackgroundColor":"#F4F6F7","logoFile":"","sitetitle":"","sitedescription":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10004, 0, 'plg_installer_webinstaller', 'plugin', 'webinstaller', 'installer', 0, 1, 1, 0, '{"name":"plg_installer_webinstaller","type":"plugin","creationDate":"28 April 2017","author":"Joomla! Project","copyright":"Copyright (C) 2013-2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.1.1","description":"PLG_INSTALLER_WEBINSTALLER_XML_DESCRIPTION","group":"","filename":"webinstaller"}', '{"tab_position":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10005, 10045, 'mod_fabrik_form', 'module', 'mod_fabrik_form', '', 0, 1, 0, 0, '{"name":"mod_fabrik_form","type":"module","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"MOD_FABRIK_FORM_XML_DESCRIPTION","group":"","filename":"mod_fabrik_form"}', '{"formid":"0","row_id":"0","usekey":"","template":"","formmodule_useajax":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10006, 10045, 'mod_fabrik_list', 'module', 'mod_fabrik_list', '', 0, 1, 0, 0, '{"name":"mod_fabrik_list","type":"module","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"MOD_FABRIK_LIST_XML_DESCRIPTION","group":"","filename":"mod_fabrik_list"}', '{"useajax":"0","ajax_links":"","radomizerecords":"0","limit":"0","show_nav":"","fabriklayout":"","show-title":"","show_intro":"1","show_outro":"1","show_filters":"1","resetfilters":"0","clearfilters":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10007, 10045, 'plg_fabrik_system', 'plugin', 'fabrik', 'system', 0, 1, 1, 0, '{"name":"plg_fabrik_system","type":"plugin","creationDate":"July 2017","author":"Fabrikar.com","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.pollen-8.co.uk","version":"3.7","description":"PLG_FABRIK_SYSTEM_DESCRIPTION","group":"","filename":"fabrik"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10008, 10045, 'System - Fabrik Scheduled Tasks', 'plugin', 'fabrikcron', 'system', 0, 0, 1, 0, '{"name":"System - Fabrik Scheduled Tasks","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.pollen-8.co.uk","version":"3.7","description":"Runs Fabrik scheduled tasks","group":"","filename":"fabrikcron"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10009, 10045, 'plg_fabrik', 'plugin', 'fabrik', 'content', 0, 1, 1, 0, '{"name":"plg_fabrik","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_FABRIK_DESCRIPTION","group":"","filename":"fabrik"}', '{"botRegex":"fabrik"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10010, 10045, 'plg_fabrik_cron_email', 'plugin', 'email', 'fabrik_cron', 0, 1, 1, 0, '{"name":"plg_fabrik_cron_email","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_FABRIK_CRON_EMAIL_DESCRIPTION","group":"","filename":"email"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10011, 10045, 'plg_fabrik_cron_php', 'plugin', 'php', 'fabrik_cron', 0, 1, 1, 0, '{"name":"plg_fabrik_cron_php","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_FABRIK_CRON_PHP_DESCRIPTION","group":"","filename":"php"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10012, 10045, 'plg_fabrik_element_button', 'plugin', 'button', 'fabrik_element', 0, 1, 1, 0, '{"name":"plg_fabrik_element_button","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_ELEMENT_BUTTON_DESCRIPTION","group":"","filename":"button"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10013, 10045, 'plg_fabrik_element_checkbox', 'plugin', 'checkbox', 'fabrik_element', 0, 1, 1, 0, '{"name":"plg_fabrik_element_checkbox","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_ELEMENT_CHECKBOX_DESCRIPTION","group":"","filename":"checkbox"}', '{"defaultFieldType":"TEXT"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10014, 10045, 'plg_fabrik_element_databasejoin', 'plugin', 'databasejoin', 'fabrik_element', 0, 1, 1, 0, '{"name":"plg_fabrik_element_databasejoin","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_ELEMENT_DATABASEJOIN_DESCRIPTION","group":"","filename":"databasejoin"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10015, 10045, 'plg_fabrik_element_date', 'plugin', 'date', 'fabrik_element', 0, 1, 1, 0, '{"name":"plg_fabrik_element_date","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_ELEMENT_DATE_DESCRIPTION","group":"","filename":"date"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10016, 10045, 'plg_fabrik_element_display', 'plugin', 'display', 'fabrik_element', 0, 1, 1, 0, '{"name":"plg_fabrik_element_display","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_ELEMENT_DISPLAY_DESCRIPTION","group":"","filename":"display"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10017, 10045, 'plg_fabrik_element_dropdown', 'plugin', 'dropdown', 'fabrik_element', 0, 1, 1, 0, '{"name":"plg_fabrik_element_dropdown","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_ELEMENT_DROPDOWN_DESCRIPTION","group":"","filename":"dropdown"}', '{"defaultFieldType":"TEXT"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10018, 10045, 'plg_fabrik_element_field', 'plugin', 'field', 'fabrik_element', 0, 1, 1, 0, '{"name":"plg_fabrik_element_field","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_ELEMENT_FIELD_DESCRIPTION","group":"","filename":"field"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10019, 10045, 'plg_fabrik_element_fileupload', 'plugin', 'fileupload', 'fabrik_element', 0, 1, 1, 0, '{"name":"plg_fabrik_element_fileupload","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_ELEMENT_FILEUPLOAD_DESCRIPTION","group":"","filename":"fileupload"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10020, 10045, 'plg_fabrik_element_googlemap', 'plugin', 'googlemap', 'fabrik_element', 0, 1, 1, 0, '{"name":"plg_fabrik_element_googlemap","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_ELEMENT_GOOGLEMAP_DESCRIPTION","group":"","filename":"googlemap"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10021, 10045, 'plg_fabrik_element_image', 'plugin', 'image', 'fabrik_element', 0, 1, 1, 0, '{"name":"plg_fabrik_element_image","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_ELEMENT_IMAGE_DESCRIPTION","group":"","filename":"image"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10022, 10045, 'plg_fabrik_element_internalid', 'plugin', 'internalid', 'fabrik_element', 0, 1, 1, 0, '{"name":"plg_fabrik_element_internalid","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_ELEMENT_INTERNALID_DESCRIPTION","group":"","filename":"internalid"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10023, 10045, 'plg_fabrik_element_link', 'plugin', 'link', 'fabrik_element', 0, 1, 1, 0, '{"name":"plg_fabrik_element_link","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_ELEMENT_LINK_DESCRIPTION","group":"","filename":"link"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10024, 10045, 'plg_fabrik_element_radiobutton', 'plugin', 'radiobutton', 'fabrik_element', 0, 1, 1, 0, '{"name":"plg_fabrik_element_radiobutton","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_ELEMENT_RADIOBUTTON_DESCRIPTION","group":"","filename":"radiobutton"}', '{"defaultFieldType":"TEXT"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10025, 10045, 'plg_fabrik_element_textarea', 'plugin', 'textarea', 'fabrik_element', 0, 1, 1, 0, '{"name":"plg_fabrik_element_textarea","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_ELEMENT_TEXTAREA_DESCRIPTION","group":"","filename":"textarea"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10026, 10045, 'plg_fabrik_element_user', 'plugin', 'user', 'fabrik_element', 0, 1, 1, 0, '{"name":"plg_fabrik_element_user","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_ELEMENT_USER_DESCRIPTION","group":"","filename":"user"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10027, 10045, 'plg_fabrik_form_email', 'plugin', 'email', 'fabrik_form', 0, 1, 1, 0, '{"name":"plg_fabrik_form_email","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_FORM_EMAIL_DESCRIPTION","group":"","filename":"email"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10028, 10045, 'plg_fabrik_form_php', 'plugin', 'php', 'fabrik_form', 0, 1, 1, 0, '{"name":"plg_fabrik_form_php","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_FORM_PHP_DESCRIPTION","group":"","filename":"php"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10029, 10045, 'plg_fabrik_form_receipt', 'plugin', 'receipt', 'fabrik_form', 0, 1, 1, 0, '{"name":"plg_fabrik_form_receipt","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_FORM_RECEIPT_DESCRIPTION","group":"","filename":"receipt"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10030, 10045, 'plg_fabrik_form_redirect', 'plugin', 'redirect', 'fabrik_form', 0, 1, 1, 0, '{"name":"plg_fabrik_form_redirect","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_FORM_REDIRECT_DESCRIPTION","group":"","filename":"redirect"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10031, 10045, 'plg_fabrik_list_copy', 'plugin', 'copy', 'fabrik_list', 0, 1, 1, 0, '{"name":"plg_fabrik_list_copy","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_LIST_COPY_DESCRIPTION","group":"","filename":"copy"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10032, 10045, 'plg_fabrik_list_php', 'plugin', 'php', 'fabrik_list', 0, 1, 1, 0, '{"name":"plg_fabrik_list_php","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_LIST_PHP_DESCRIPTION","group":"","filename":"php"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10033, 10045, 'plg_fabrik_validationrule_isgreaterorlessthan', 'plugin', 'isgreaterorlessthan', 'fabrik_validationrule', 0, 1, 1, 0, '{"name":"plg_fabrik_validationrule_isgreaterorlessthan","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_VALIDATIONRULE_ISGREATERORLESSTHAN_DESCRIPTION","group":"","filename":"isgreaterorlessthan"}', '{"icon":"star"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10034, 10045, 'plg_fabrik_validationrule_notempty', 'plugin', 'notempty', 'fabrik_validationrule', 0, 1, 1, 0, '{"name":"plg_fabrik_validationrule_notempty","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_VALIDATIONRULE_NOTEMPTY_DESCRIPTION","group":"","filename":"notempty"}', '{"icon":"eye-open"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10035, 10045, 'plg_fabrik_validationrule_php', 'plugin', 'php', 'fabrik_validationrule', 0, 1, 1, 0, '{"name":"plg_fabrik_validationrule_php","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"hugh.messenger@gmail.com","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_VALIDATIONRULE_PHP_DESCRIPTION","group":"","filename":"php"}', '{"icon":"star"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10036, 10045, 'plg_fabrik_validationrule_regex', 'plugin', 'regex', 'fabrik_validationrule', 0, 1, 1, 0, '{"name":"plg_fabrik_validationrule_regex","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_VALIDATIONRULE_REGEX_DESCRIPTION","group":"","filename":"regex"}', '{"icon":"star"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10037, 10045, 'plg_fabrik_validationrule_isemail', 'plugin', 'isemail', 'fabrik_validationrule', 0, 1, 1, 0, '{"name":"plg_fabrik_validationrule_isemail","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_VALIDATIONRULE_ISEMAIL_DESCRIPTION","group":"","filename":"isemail"}', '{"icon":"envelope"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10038, 10045, 'plg_fabrik_visualization_calendar', 'plugin', 'calendar', 'fabrik_visualization', 0, 1, 1, 0, '{"name":"plg_fabrik_visualization_calendar","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_VISUALIZATION_CALENDAR_DESCRIPTION","group":"","filename":"calendar"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10039, 10045, 'plg_fabrik_visualization_chart', 'plugin', 'chart', 'fabrik_visualization', 0, 1, 1, 0, '{"name":"plg_fabrik_visualization_chart","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_VISUALIZATION_CHART_DESCRIPTION","group":"","filename":"chart"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10040, 10045, 'plg_fabrik_visualization_googlemap', 'plugin', 'googlemap', 'fabrik_visualization', 0, 1, 1, 0, '{"name":"plg_fabrik_visualization_googlemap","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_VISUALIZATION_GOOGLEMAP_DESCRIPTION","group":"","filename":"googlemap"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10041, 10045, 'PLG_FABRIK_VISUALIZATION_FULLCALENDAR', 'plugin', 'fullcalendar', 'fabrik_visualization', 0, 1, 1, 0, '{"name":"PLG_FABRIK_VISUALIZATION_FULLCALENDAR","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"hugh.messenger@gmail.com","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_VISUALIZATION_FULLCALENDAR_DESCRIPTION","group":"","filename":"fullcalendar"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10042, 10045, 'plg_fabrik_visualization_media', 'plugin', 'media', 'fabrik_visualization', 0, 1, 1, 0, '{"name":"plg_fabrik_visualization_media","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"hugh.messenger@gmail.com","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_VISUALIZATION_MEDIA_DESCRIPTION","group":"","filename":"media"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10043, 10045, 'plg_fabrik_visualization_slideshow', 'plugin', 'slideshow', 'fabrik_visualization', 0, 1, 1, 0, '{"name":"plg_fabrik_visualization_slideshow","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"hugh.messenger@gmail.com","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_VISUALIZATION_SLIDESHOW_DESCRIPTION","group":"","filename":"slideshow"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10044, 10045, 'com_fabrik', 'component', 'com_fabrik', '', 1, 1, 0, 0, '{"name":"com_fabrik","type":"component","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.pollen-8.co.uk","version":"3.7","description":"COM_FABRIK_XML_DESCRIPTION","group":"","filename":"fabrik"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10045, 0, 'Fabrik Package', 'package', 'pkg_fabrik', '', 0, 1, 1, 0, '{"name":"Fabrik Package","type":"package","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"","authorUrl":"","version":"3.7","description":"Fabrik Package","group":"","filename":"pkg_fabrik"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10046, 10053, 'COM_JCE', 'component', 'com_jce', '', 1, 1, 0, 0, '{"name":"COM_JCE","type":"component","creationDate":"10-08-2017","author":"Ryan Demmer","copyright":"Copyright (C) 2006 - 2017 Ryan Demmer. All rights reserved","authorEmail":"info@joomlacontenteditor.net","authorUrl":"www.joomlacontenteditor.net","version":"2.6.19","description":"COM_JCE_XML_DESCRIPTION","group":"","filename":"jce"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10047, 10053, 'plg_editors_jce', 'plugin', 'jce', 'editors', 0, 1, 1, 0, '{"name":"plg_editors_jce","type":"plugin","creationDate":"10-08-2017","author":"Ryan Demmer","copyright":"Copyright (C) 2006 - 2017 Ryan Demmer. All rights reserved","authorEmail":"info@joomlacontenteditor.net","authorUrl":"http:\\/\\/www.joomlacontenteditor.net","version":"2.6.19","description":"WF_EDITOR_PLUGIN_DESC","group":"","filename":"jce"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10048, 10053, 'plg_content_jce', 'plugin', 'jce', 'content', 0, 1, 1, 0, '{"name":"plg_content_jce","type":"plugin","creationDate":"10-08-2017","author":"Ryan Demmer","copyright":"Copyright (C) 2006 - 2017 Ryan Demmer. All rights reserved","authorEmail":"info@joomlacontenteditor.net","authorUrl":"http:\\/\\/www.joomlacontenteditor.net","version":"2.6.19","description":"PLG_CONTENT_JCE_XML_DESCRIPTION","group":"","filename":"jce"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10049, 10053, 'plg_extension_jce', 'plugin', 'jce', 'extension', 0, 1, 1, 0, '{"name":"plg_extension_jce","type":"plugin","creationDate":"10-08-2017","author":"Ryan Demmer","copyright":"Copyright (C) 2006 - 2017 Ryan Demmer. All rights reserved","authorEmail":"info@joomlacontenteditor.net","authorUrl":"http:\\/\\/www.joomlacontenteditor.net","version":"2.6.19","description":"PLG_EXTENSION_JCE_XML_DESCRIPTION","group":"","filename":"jce"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10050, 10053, 'plg_installer_jce', 'plugin', 'jce', 'installer', 0, 1, 1, 0, '{"name":"plg_installer_jce","type":"plugin","creationDate":"10-08-2017","author":"Ryan Demmer","copyright":"Copyright (C) 2006 - 2017 Ryan Demmer. All rights reserved","authorEmail":"info@joomlacontenteditor.net","authorUrl":"http:\\/\\/www.joomlacontenteditor.net","version":"2.6.19","description":"PLG_INSTALLER_JCE_XML_DESCRIPTION","group":"","filename":"jce"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10051, 10053, 'plg_quickicon_jce', 'plugin', 'jce', 'quickicon', 0, 1, 1, 0, '{"name":"plg_quickicon_jce","type":"plugin","creationDate":"31-08-2016","author":"Ryan Demmer","copyright":"Copyright (C) 2006 - 2016 Ryan Demmer. All rights reserved","authorEmail":"info@joomlacontenteditor.net","authorUrl":"www.joomalcontenteditor.net","version":"2.6.0-pro-beta3","description":"PLG_QUICKICON_JCE_XML_DESCRIPTION","group":"","filename":"jce"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10052, 10053, 'plg_system_jce', 'plugin', 'jce', 'system', 0, 1, 1, 0, '{"name":"plg_system_jce","type":"plugin","creationDate":"10-08-2017","author":"Ryan Demmer","copyright":"Copyright (C) 2006 - 2017 Ryan Demmer. All rights reserved","authorEmail":"info@joomlacontenteditor.net","authorUrl":"http:\\/\\/www.joomlacontenteditor.net","version":"2.6.19","description":"PLG_SYSTEM_JCE_XML_DESCRIPTION","group":"","filename":"jce"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10053, 0, 'PKG_JCE', 'package', 'pkg_jce', '', 0, 1, 1, 0, '{"name":"PKG_JCE","type":"package","creationDate":"10-08-2017","author":"Ryan Demmer","copyright":"","authorEmail":"","authorUrl":"","version":"2.6.19","description":"PKG_JCE_XML_DESCRIPTION","group":"","filename":"pkg_jce"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10054, 0, 'JCE - Spanish', 'file', 'jce-es-ES', '', 0, 1, 0, 0, '{"name":"JCE - Spanish","type":"file","creationDate":"2017-09-12","author":"JCE Transifex Spanish Team","copyright":"\\u00a9 2017 Widget Factory Limited","authorEmail":"info@joomlacontenteditor.net","authorUrl":"https:\\/\\/www.transifex.com\\/projects\\/p\\/jce\\/language\\/es-ES\\/","version":"2.6.19","description":"Spanish Language Pack for JCE 2.6.19","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10055, 0, 'plg_fabrik_element_usergroup', 'plugin', 'usergroup', 'fabrik_element', 0, 1, 1, 0, '{"name":"plg_fabrik_element_usergroup","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_ELEMENT_USERGROUP_DESCRIPTION","group":"","filename":"usergroup"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10056, 0, 'plg_fabrik_element_yesno', 'plugin', 'yesno', 'fabrik_element', 0, 1, 1, 0, '{"name":"plg_fabrik_element_yesno","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_ELEMENT_YESNO_DESCRIPTION","group":"","filename":"yesno"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
	(10057, 0, 'plg_fabrik_form_juser', 'plugin', 'juser', 'fabrik_form', 0, 1, 1, 0, '{"name":"plg_fabrik_form_juser","type":"plugin","creationDate":"July 2017","author":"Media A-Team, Inc.","copyright":"Copyright (C) 2005-2017 Media A-Team, Inc. - All rights reserved.","authorEmail":"rob@pollen-8.co.uk","authorUrl":"www.fabrikar.com","version":"3.7","description":"PLG_FORM_JUSER_DESCRIPTION","group":"","filename":"juser"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0);
/*!40000 ALTER TABLE `tltc_extensions` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_fabrik_connections
DROP TABLE IF EXISTS `tltc_fabrik_connections`;
CREATE TABLE IF NOT EXISTS `tltc_fabrik_connections` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `database` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  `checked_out` int(4) NOT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `default` int(1) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca.tltc_fabrik_connections: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_fabrik_connections` DISABLE KEYS */;
INSERT INTO `tltc_fabrik_connections` (`id`, `host`, `user`, `password`, `database`, `description`, `published`, `checked_out`, `checked_out_time`, `default`, `params`) VALUES
	(1, 'localhost', 'root', '21 25E17', 'tolteca', 'Joomla', 1, 0, '0000-00-00 00:00:00', 1, '{"encryptedPw":true}'),
	(2, 'localhost', 'root', '21 25E17', 'tolteca-fabrik', 'Fabrik', 1, 0, '0000-00-00 00:00:00', 0, '{"encryptedPw":true}');
/*!40000 ALTER TABLE `tltc_fabrik_connections` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_fabrik_cron
DROP TABLE IF EXISTS `tltc_fabrik_cron`;
CREATE TABLE IF NOT EXISTS `tltc_fabrik_cron` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `frequency` smallint(6) NOT NULL,
  `unit` varchar(15) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(6) NOT NULL,
  `created_by_alias` varchar(30) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` varchar(30) NOT NULL,
  `checked_out` int(6) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `published` tinyint(1) NOT NULL,
  `plugin` varchar(50) NOT NULL,
  `lastrun` datetime NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca.tltc_fabrik_cron: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_fabrik_cron` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_fabrik_cron` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_fabrik_elements
DROP TABLE IF EXISTS `tltc_fabrik_elements`;
CREATE TABLE IF NOT EXISTS `tltc_fabrik_elements` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `group_id` int(4) NOT NULL,
  `plugin` varchar(100) NOT NULL,
  `label` text,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_by_alias` varchar(100) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `width` int(4) NOT NULL,
  `height` int(4) NOT NULL DEFAULT '0',
  `default` text NOT NULL,
  `hidden` int(1) NOT NULL,
  `eval` int(1) NOT NULL,
  `ordering` int(4) NOT NULL,
  `show_in_list_summary` int(1) DEFAULT NULL,
  `filter_type` varchar(20) DEFAULT NULL,
  `filter_exact_match` int(1) DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  `link_to_detail` int(1) NOT NULL DEFAULT '0',
  `primary_key` int(1) NOT NULL DEFAULT '0',
  `auto_increment` int(1) NOT NULL DEFAULT '0',
  `access` int(1) NOT NULL DEFAULT '0',
  `use_in_page_title` int(1) NOT NULL DEFAULT '0',
  `parent_id` mediumint(6) NOT NULL,
  `params` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca.tltc_fabrik_elements: ~47 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_fabrik_elements` DISABLE KEYS */;
INSERT INTO `tltc_fabrik_elements` (`id`, `name`, `group_id`, `plugin`, `label`, `checked_out`, `checked_out_time`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `width`, `height`, `default`, `hidden`, `eval`, `ordering`, `show_in_list_summary`, `filter_type`, `filter_exact_match`, `published`, `link_to_detail`, `primary_key`, `auto_increment`, `access`, `use_in_page_title`, `parent_id`, `params`) VALUES
	(1, 'id', 1, 'internalid', 'id', 0, '0000-00-00 00:00:00', '2016-01-10 08:53:39', 678, 'ezequiel', '0000-00-00 00:00:00', 0, 3, 0, '', 1, 0, 2, 1, '', 0, 1, 1, 1, 1, 1, 0, 0, '{"edit_access":"1","view_access":"1","list_view_access":"1","filter_access":"1","sum_access":"1","avg_access":"1","median_access":"1","count_access":"1","custom_calc_access":"1"}'),
	(2, 'date_time', 1, 'date', 'date_time', 0, '0000-00-00 00:00:00', '2016-01-10 08:53:39', 678, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 1, 0, 1, 0, '', 1, 1, 1, 0, 0, 1, 0, 0, '{"bootstrap_class":"input-medium","date_showtime":"0","date_time_format":"H:i","bootstrap_time_class":"input-medium","placeholder":"","date_store_as_local":"0","date_table_format":"Y-m-d H:i:s","date_form_format":"Y-m-d H:i:s","date_defaulttotoday":"1","date_alwaystoday":"0","date_firstday":"0","date_allow_typing_in_field":"1","date_csv_offset_tz":"0","date_advanced":"0","date_allow_func":"","date_allow_php_func":"","date_observe":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(3, 'titulo', 1, 'field', 'Titulo', 0, '0000-00-00 00:00:00', '2017-09-12 10:35:21', 678, 'ezequiel', '2017-09-13 09:37:11', 678, 0, 0, '', 0, 0, 3, 1, '', 1, 1, 1, 0, 0, 1, 0, 0, '{"placeholder":"","password":"0","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-xxlarge","text_format":"text","integer_length":"11","decimal_length":"2","field_use_number_format":"0","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(4, 'descripcion', 1, 'textarea', 'Descripcion', 0, '0000-00-00 00:00:00', '2017-09-12 10:35:45', 678, 'ezequiel', '2017-09-14 09:43:41', 1, 0, 0, '', 0, 0, 11, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"bootstrap_class":"input-block-level","width":"40","height":"6","textarea_showlabel":"1","textarea_placeholder":"","use_wysiwyg":"1","wysiwyg_extra_buttons":"1","textarea_field_type":"TEXT","textarea-showmax":"0","textarea-maxlength":"255","textarea_limit_type":"char","textarea-tagify":"0","textarea_tagifyurl":"","textarea-truncate-where":"1","textarea-truncate-html":"0","textarea-truncate":"15","textarea-hover":"1","textarea_hover_location":"top","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(5, 'fecha_ini', 1, 'date', 'Fecha Inicio', 0, '0000-00-00 00:00:00', '2017-09-12 10:38:17', 678, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 6, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"bootstrap_class":"input-medium","date_showtime":"0","date_time_format":"H:i","bootstrap_time_class":"input-medium","placeholder":"","date_store_as_local":"0","date_table_format":"d-m-Y","date_form_format":"d-m-Y","date_defaulttotoday":"0","date_alwaystoday":"0","date_firstday":"1","date_allow_typing_in_field":"1","date_csv_offset_tz":"0","date_advanced":"0","date_allow_func":"","date_allow_php_func":"","date_observe":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(6, 'fecha_fin', 1, 'date', 'Fecha Fin', 0, '0000-00-00 00:00:00', '2017-09-12 10:39:02', 678, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 7, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"bootstrap_class":"input-medium","date_showtime":"0","date_time_format":"H:i","bootstrap_time_class":"input-medium","placeholder":"","date_store_as_local":"0","date_table_format":"d-m-Y","date_form_format":"d-m-Y","date_defaulttotoday":"0","date_alwaystoday":"0","date_firstday":"1","date_allow_typing_in_field":"1","date_csv_offset_tz":"0","date_advanced":"0","date_allow_func":"","date_allow_php_func":"","date_observe":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(7, 'horas', 1, 'field', 'Horas', 0, '0000-00-00 00:00:00', '2017-09-12 10:39:30', 678, 'ezequiel', '2017-10-02 11:29:30', 1, 0, 0, '', 0, 0, 9, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"placeholder":"","password":"0","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-medium","text_format":"decimal","integer_length":"3","decimal_length":"2","field_use_number_format":"1","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(8, 'documentacion', 1, 'fileupload', 'Documentación', 0, '0000-00-00 00:00:00', '2017-09-12 10:41:44', 678, 'ezequiel', '2017-09-15 10:25:24', 1, 0, 0, '', 0, 0, 12, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"ul_max_file_size":"51200","ul_device_capture":"0","ul_file_types":"","ul_directory":"\\/images\\/files\\/","ul_email_file":"0","random_filename":"0","length_random_filename":"","ul_file_increment":"1","upload_allow_folderselect":"0","upload_delete_image":"1","upload_use_wip":"0","allow_unsafe":"0","default_image":"","make_link":"1","fu_show_image_in_table":"1","fu_show_image":"0","fu_show_image_in_email":"1","image_library":"gd2","fu_main_max_width":"","fu_main_max_height":"","image_quality":"90","fu_title_element":"","fu_map_element":"","restrict_lightbox":"1","make_thumbnail":"0","fu_make_pdf_thumb":"0","thumb_dir":"images\\/stories\\/thumbs","thumb_prefix":"","thumb_suffix":"","thumb_max_width":"200","thumb_max_height":"100","fileupload_crop":"0","fileupload_crop_dir":"images\\/stories\\/crop","fileupload_crop_width":"200","fileupload_crop_height":"100","win_width":"400","win_height":"400","fileupload_storage_type":"filesystemstorage","fileupload_aws_accesskey":"","fileupload_aws_secretkey":"","fileupload_aws_location":"","fileupload_ssl":"0","fileupload_aws_encrypt":"0","fileupload_aws_bucketname":"","fileupload_s3_serverpath":"1","fileupload_amazon_acl":"2","fileupload_skip_check":"0","fileupload_amazon_auth_url":"60","ajax_upload":"1","ajax_runtime":"html5,html4","ajax_max":"4","ajax_dropbox_width":"400","ajax_dropbox_height":"200","ajax_chunk_size":"0","fu_use_download_script":"0","fu_download_acl":"","fu_download_noaccess_image":"","fu_download_noaccess_url":"","fu_download_access_image":"","fu_download_hit_counter":"","fu_download_log":"0","ul_export_encode_csv":"relative","ul_export_encode_json":"relative","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(9, 'organizador', 1, 'databasejoin', 'Organizador', 0, '0000-00-00 00:00:00', '2017-09-12 10:45:38', 678, 'ezequiel', '2017-09-19 06:24:52', 1, 0, 0, '', 0, 0, 4, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"database_join_display_type":"dropdown","join_conn_id":"2","join_db_name":"usuarios","join_key_column":"id","join_val_column":"nombre","join_val_column_concat":"","database_join_where_sql":"","database_join_where_access":"1","database_join_where_when":"3","databasejoin_where_ajax":"0","database_join_filter_where_sql":"","database_join_show_please_select":"1","database_join_noselectionvalue":"","database_join_noselectionlabel":"","placeholder":"","databasejoin_popupform":"4","fabrikdatabasejoin_frontend_add":"0","join_popupwidth":"","databasejoin_readonly_link":"0","fabrikdatabasejoin_frontend_select":"0","advanced_behavior":"1","dbjoin_options_per_row":"4","dbjoin_multilist_size":"6","dbjoin_autocomplete_size":"20","bootstrap_class":"input-xxlarge","dabase_join_label_eval":"","join_desc_column":"","dbjoin_autocomplete_how":"contains","clean_concat":"0","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(10, 'id', 2, 'internalid', 'id', 0, '0000-00-00 00:00:00', '2016-01-10 08:53:39', 678, 'ezequiel', '0000-00-00 00:00:00', 0, 3, 0, '', 1, 0, 3, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, '{"edit_access":"1","view_access":"1","list_view_access":"1","filter_access":"1","sum_access":"1","avg_access":"1","median_access":"1","count_access":"1","custom_calc_access":"1"}'),
	(11, 'date_time', 2, 'date', 'date_time', 0, '0000-00-00 00:00:00', '2016-01-10 08:53:39', 678, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 1, 0, 2, 0, '', 1, 1, 1, 0, 0, 1, 0, 0, '{"bootstrap_class":"input-medium","date_showtime":"0","date_time_format":"H:i","bootstrap_time_class":"input-medium","placeholder":"","date_store_as_local":"0","date_table_format":"Y-m-d H:i:s","date_form_format":"Y-m-d H:i:s","date_defaulttotoday":"1","date_alwaystoday":"0","date_firstday":"0","date_allow_typing_in_field":"1","date_csv_offset_tz":"0","date_advanced":"0","date_allow_func":"","date_allow_php_func":"","date_observe":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(12, 'nombre', 2, 'field', 'Nombre / First Name', 0, '0000-00-00 00:00:00', '2017-09-12 10:48:06', 678, 'ezequiel', '2017-09-13 09:54:46', 678, 0, 0, '', 0, 0, 4, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"placeholder":"","password":"0","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-xlarge","text_format":"text","integer_length":"11","decimal_length":"2","field_use_number_format":"0","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","notempty-message":["Por favor, introduzca el nombre."],"notempty-validation_condition":[""],"tip_text":[""],"icon":[""],"validations":{"plugin":["notempty"],"plugin_published":["1"],"validate_in":["both"],"validation_on":["both"],"must_validate":["0"],"show_icon":["1"]}}'),
	(13, 'apellidos', 2, 'field', 'Apellidos / Surname', 0, '0000-00-00 00:00:00', '2017-09-12 10:48:21', 678, 'ezequiel', '2017-09-13 11:35:07', 678, 0, 0, '', 0, 0, 5, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"placeholder":"","password":"0","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-xxlarge","text_format":"text","integer_length":"11","decimal_length":"2","field_use_number_format":"0","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","notempty-message":["Por favor, introduzca apellidos"],"notempty-validation_condition":[""],"tip_text":[""],"icon":[""],"validations":{"plugin":["notempty"],"plugin_published":["1"],"validate_in":["both"],"validation_on":["both"],"must_validate":["0"],"show_icon":["1"]}}'),
	(14, 'perfil', 2, 'checkbox', 'Perfil / Type of Job', 0, '0000-00-00 00:00:00', '2017-09-12 10:51:06', 678, 'ezequiel', '2017-09-13 09:54:13', 678, 0, 0, '', 0, 0, 6, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"sub_options":{"sub_values":["PhD student","Postdoc","PI"],"sub_labels":["Doctorando \\/ PhD student","Postdoctorado \\/ Postdoc","Personal Investigaci\\u00f3n \\/ PI"],"sub_initial_selection":["PhD student"]},"ck_options_per_row":"3","sub_default_value":"","sub_default_label":"","allow_frontend_addtocheckbox":"0","chk-allowadd-onlylabel":"0","chk-savenewadditions":"0","options_split_str":"","dropdown_populate":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(15, 'email', 2, 'field', 'Email', 0, '0000-00-00 00:00:00', '2017-09-12 10:51:31', 678, 'ezequiel', '2017-09-13 09:52:28', 678, 0, 0, '', 0, 0, 7, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"placeholder":"","password":"3","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-xlarge","text_format":"text","integer_length":"11","decimal_length":"2","field_use_number_format":"0","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","isemail-message":["Por favor, introduzca un email v\\u00e1lido"],"isemail-validation_condition":[""],"isemail-allow_empty":["0"],"isemail-check_mx":["0"],"tip_text":[""],"icon":[""],"validations":{"plugin":["isemail"],"plugin_published":["1"],"validate_in":["both"],"validation_on":["both"],"must_validate":["0"],"show_icon":["1"]}}'),
	(16, 'centro', 2, 'field', 'Centro / Center', 0, '0000-00-00 00:00:00', '2017-09-12 10:51:54', 678, 'ezequiel', '2017-10-02 10:36:53', 1, 0, 0, '', 0, 0, 10, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"placeholder":"","password":"0","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-xxlarge","text_format":"text","integer_length":"11","decimal_length":"2","field_use_number_format":"0","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","notempty-message":["Por favor, introduzca Centro"],"notempty-validation_condition":[""],"tip_text":[""],"icon":[""],"validations":{"plugin":["notempty"],"plugin_published":["0"],"validate_in":["both"],"validation_on":["both"],"must_validate":["0"],"show_icon":["1"]}}'),
	(17, 'departamento', 2, 'field', 'Departamento / Department', 0, '0000-00-00 00:00:00', '2017-09-12 10:52:11', 678, 'ezequiel', '2017-09-13 10:44:44', 678, 0, 0, '', 0, 0, 8, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"placeholder":"","password":"0","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-xxlarge","text_format":"text","integer_length":"11","decimal_length":"2","field_use_number_format":"0","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","notempty-message":["Por favor, introduzca Departamento"],"notempty-validation_condition":[""],"tip_text":[""],"icon":[""],"validations":{"plugin":["notempty"],"plugin_published":["1"],"validate_in":["both"],"validation_on":["both"],"must_validate":["0"],"show_icon":["1"]}}'),
	(18, 'grupo', 2, 'field', 'Grupo / Group (PI Name)', 0, '0000-00-00 00:00:00', '2017-09-12 10:54:09', 678, 'ezequiel', '2017-10-02 10:36:48', 1, 0, 0, '', 0, 0, 9, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"placeholder":"","password":"0","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-xxlarge","text_format":"text","integer_length":"11","decimal_length":"2","field_use_number_format":"0","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","notempty-message":["Por favor, introduzca Grupo"],"notempty-validation_condition":[""],"tip_text":[""],"icon":[""],"validations":{"plugin":["notempty"],"plugin_published":["0"],"validate_in":["both"],"validation_on":["both"],"must_validate":["0"],"show_icon":["1"]}}'),
	(19, 'motivacion', 2, 'textarea', 'Motivación / Motivation', 1, '2017-10-02 10:36:36', '2017-09-12 10:56:37', 678, 'ezequiel', '2017-09-13 11:31:38', 678, 0, 0, '', 0, 0, 11, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"bootstrap_class":"input-block-level","width":"40","height":"6","textarea_showlabel":"1","textarea_placeholder":"","use_wysiwyg":"0","wysiwyg_extra_buttons":"1","textarea_field_type":"TEXT","textarea-showmax":"0","textarea-maxlength":"255","textarea_limit_type":"char","textarea-tagify":"0","textarea_tagifyurl":"","textarea-truncate-where":"0","textarea-truncate-html":"0","textarea-truncate":"0","textarea-hover":"1","textarea_hover_location":"left","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"Please tell us briefly about your motivation to attend this workshop","tipseval":"0","tiplocation":"bottom","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(20, 'organismos', 2, 'textarea', 'Organismos / Organisms', 0, '0000-00-00 00:00:00', '2017-09-12 10:57:20', 678, 'ezequiel', '2017-10-02 10:37:01', 1, 0, 0, '', 0, 0, 12, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"bootstrap_class":"input-block-level","width":"40","height":"6","textarea_showlabel":"1","textarea_placeholder":"","use_wysiwyg":"0","wysiwyg_extra_buttons":"1","textarea_field_type":"TEXT","textarea-showmax":"0","textarea-maxlength":"255","textarea_limit_type":"char","textarea-tagify":"0","textarea_tagifyurl":"","textarea-truncate-where":"0","textarea-truncate-html":"0","textarea-truncate":"0","textarea-hover":"1","textarea_hover_location":"top","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"Which type of organisms do you use in your research?","tipseval":"0","tiplocation":"right","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","notempty-message":["Por favor, especifique organismos"],"notempty-validation_condition":[""],"tip_text":[""],"icon":[""],"validations":{"plugin":["notempty"],"plugin_published":["0"],"validate_in":["both"],"validation_on":["both"],"must_validate":["0"],"show_icon":["1"]}}'),
	(21, 'curso', 2, 'databasejoin', 'Curso', 1, '2017-09-29 11:47:25', '2017-09-12 10:59:58', 678, 'ezequiel', '2017-09-29 11:47:25', 1, 0, 0, '', 0, 0, 1, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"database_join_display_type":"dropdown","join_conn_id":"2","join_db_name":"cursos","join_key_column":"id","join_val_column":"titulo","join_val_column_concat":"","database_join_where_sql":"where cursos.plazo_inscripcion = \\"abierto\\"","database_join_where_access":"1","database_join_where_when":"3","databasejoin_where_ajax":"0","database_join_filter_where_sql":"","database_join_show_please_select":"1","database_join_noselectionvalue":"","database_join_noselectionlabel":"","placeholder":"","databasejoin_popupform":"1","fabrikdatabasejoin_frontend_add":"0","join_popupwidth":"","databasejoin_readonly_link":"0","fabrikdatabasejoin_frontend_select":"0","advanced_behavior":"1","dbjoin_options_per_row":"4","dbjoin_multilist_size":"6","dbjoin_autocomplete_size":"20","bootstrap_class":"input-xxlarge","dabase_join_label_eval":"","join_desc_column":"","dbjoin_autocomplete_how":"contains","clean_concat":"0","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","notempty-message":["Por favor, seleccione el curso."],"notempty-validation_condition":[""],"tip_text":[""],"icon":[""],"validations":{"plugin":["notempty"],"plugin_published":["1"],"validate_in":["both"],"validation_on":["both"],"must_validate":["0"],"show_icon":["1"]}}'),
	(23, 'horario', 1, 'field', 'Horario', 0, '0000-00-00 00:00:00', '2017-09-13 10:39:36', 678, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 8, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"placeholder":"","password":"0","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-medium","text_format":"text","integer_length":"11","decimal_length":"2","field_use_number_format":"0","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(40, 'id', 4, 'internalid', 'id', 0, '0000-00-00 00:00:00', '2016-01-10 08:53:39', 678, 'ezequiel', '0000-00-00 00:00:00', 0, 3, 0, '', 1, 0, 2, 1, '', 0, 1, 1, 1, 1, 1, 0, 0, '{"edit_access":"1","view_access":"1","list_view_access":"1","filter_access":"1","sum_access":"1","avg_access":"1","median_access":"1","count_access":"1","custom_calc_access":"1"}'),
	(41, 'date_time', 4, 'date', 'date_time', 0, '0000-00-00 00:00:00', '2016-01-10 08:53:39', 678, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 1, 0, 1, 0, '', 1, 1, 1, 0, 0, 1, 0, 0, '{"bootstrap_class":"input-medium","date_showtime":"0","date_time_format":"H:i","bootstrap_time_class":"input-medium","placeholder":"","date_store_as_local":"0","date_table_format":"Y-m-d H:i:s","date_form_format":"Y-m-d H:i:s","date_defaulttotoday":"1","date_alwaystoday":"0","date_firstday":"0","date_allow_typing_in_field":"1","date_csv_offset_tz":"0","date_advanced":"0","date_allow_func":"","date_allow_php_func":"","date_observe":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(42, 'nombre', 4, 'field', 'Nombre y Apellidos', 0, '0000-00-00 00:00:00', '2017-09-14 08:25:37', 678, 'ezequiel', '2017-09-14 08:42:40', 678, 0, 0, '', 0, 0, 3, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"placeholder":"","password":"0","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-xlarge","text_format":"text","integer_length":"11","decimal_length":"2","field_use_number_format":"0","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(44, 'usuario', 4, 'field', 'Usuario', 0, '0000-00-00 00:00:00', '2017-09-14 08:27:08', 678, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 4, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"placeholder":"","password":"0","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-medium","text_format":"text","integer_length":"11","decimal_length":"2","field_use_number_format":"0","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","notempty-message":["Por favor, introduzca usuario"],"notempty-validation_condition":[""],"tip_text":[""],"icon":[""],"validations":{"plugin":["notempty"],"plugin_published":["1"],"validate_in":["both"],"validation_on":["both"],"must_validate":["0"],"show_icon":["1"]}}'),
	(45, 'password', 4, 'field', 'Contraseña', 0, '0000-00-00 00:00:00', '2017-09-14 08:27:41', 678, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 5, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"placeholder":"","password":"1","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-large","text_format":"text","integer_length":"11","decimal_length":"2","field_use_number_format":"0","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(46, 'email', 4, 'field', 'Email', 0, '0000-00-00 00:00:00', '2017-09-14 08:28:19', 678, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 6, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"placeholder":"","password":"3","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-large","text_format":"text","integer_length":"11","decimal_length":"2","field_use_number_format":"0","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","isemail-message":["Por favor, introduzca un email v\\u00e1lido"],"isemail-validation_condition":[""],"isemail-allow_empty":["0"],"isemail-check_mx":["0"],"tip_text":[""],"icon":[""],"validations":{"plugin":["isemail"],"plugin_published":["1"],"validate_in":["both"],"validation_on":["both"],"must_validate":["0"],"show_icon":["1"]}}'),
	(47, 'grupos', 4, 'usergroup', 'Grupos', 0, '0000-00-00 00:00:00', '2017-09-14 08:33:37', 678, 'ezequiel', '2017-09-14 09:33:12', 1, 0, 0, '', 0, 0, 7, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"user_element":"40","default_to_current_user_group":"1","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"3","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(48, 'userid', 4, 'field', 'userid', 0, '0000-00-00 00:00:00', '2017-09-14 08:35:20', 678, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 1, 0, 8, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"placeholder":"","password":"0","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-medium","text_format":"text","integer_length":"11","decimal_length":"2","field_use_number_format":"0","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(49, 'creador', 4, 'user', 'creador', 0, '0000-00-00 00:00:00', '2017-09-14 08:36:08', 678, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 1, 0, 9, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"my_table_data":"name","update_on_edit":"0","update_on_copy":"0","user_use_social_plugin_profile":"0","user_noselectionlabel":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(50, 'bloqueado', 4, 'yesno', 'Bloqueado', 0, '0000-00-00 00:00:00', '2017-09-14 08:38:16', 678, 'ezequiel', '2017-09-14 11:57:47', 1, 0, 0, '', 0, 0, 10, 0, '', 1, 1, 0, 0, 0, 3, 0, 0, '{"yesno_default":"0","options_per_row":"4","toggle_others":"0","toggle_where":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"3","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(51, 'lugar', 1, 'field', 'Lugar', 0, '0000-00-00 00:00:00', '2017-09-14 08:50:00', 678, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 5, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"placeholder":"","password":"0","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-xxlarge","text_format":"text","integer_length":"11","decimal_length":"2","field_use_number_format":"0","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(52, 'inscripcion', 1, 'button', 'Solicitar inscripción', 0, '0000-00-00 00:00:00', '2017-09-14 09:54:19', 1, 'ezequiel', '2017-09-14 11:56:16', 1, 0, 0, '', 0, 0, 14, 0, '', 1, 1, 0, 0, 0, 6, 0, 0, '{"show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"6","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(53, 'plazas', 1, 'field', 'Plazas', 0, '0000-00-00 00:00:00', '2017-09-14 11:18:18', 1, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 10, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"placeholder":"","password":"0","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-medium","text_format":"integer","integer_length":"11","decimal_length":"2","field_use_number_format":"0","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(54, 'respuesta', 5, 'textarea', 'Respuesta', 0, '0000-00-00 00:00:00', '2017-09-15 10:29:15', 1, 'ezequiel', '2017-09-15 10:30:51', 1, 0, 0, '', 0, 0, 1, 0, '', 1, 1, 0, 0, 0, 9, 0, 0, '{"bootstrap_class":"input-block-level","width":"40","height":"6","textarea_showlabel":"1","textarea_placeholder":"","use_wysiwyg":"0","wysiwyg_extra_buttons":"1","textarea_field_type":"TEXT","textarea-showmax":"0","textarea-maxlength":"255","textarea_limit_type":"char","textarea-tagify":"0","textarea_tagifyurl":"","textarea-truncate-where":"0","textarea-truncate-html":"0","textarea-truncate":"0","textarea-hover":"1","textarea_hover_location":"top","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"9","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","notempty-message":["Por favor, introduzca la respuesta."],"notempty-validation_condition":[""],"tip_text":[""],"icon":[""],"validations":{"plugin":["notempty"],"plugin_published":["1"],"validate_in":["both"],"validation_on":["both"],"must_validate":["0"],"show_icon":["1"]}}'),
	(55, 'admision', 5, 'yesno', 'Admisión', 0, '0000-00-00 00:00:00', '2017-09-15 10:30:03', 1, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 2, 0, '', 1, 1, 0, 0, 0, 9, 0, 0, '{"yesno_default":"0","options_per_row":"4","toggle_others":"0","toggle_where":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"9","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(56, 'plazo_inscripcion', 1, 'radiobutton', 'Plazo inscripción', 0, '0000-00-00 00:00:00', '2017-09-29 11:26:32', 1, 'ezequiel', '2017-09-29 11:39:20', 1, 0, 0, '', 0, 0, 13, 0, '', 1, 1, 0, 0, 0, 3, 0, 0, '{"sub_options":{"sub_values":["abierto","cerrado"],"sub_labels":["Abierto","Cerrado"],"sub_initial_selection":["abierto"]},"options_per_row":"4","btnGroup":"1","allow_frontend_addtoradio":"0","rad-allowadd-onlylabel":"0","rad-savenewadditions":"0","dropdown_populate":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"3","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"3","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(57, 'id', 6, 'internalid', 'id', 0, '0000-00-00 00:00:00', '2016-01-10 08:53:39', 1, 'ezequiel', '0000-00-00 00:00:00', 0, 3, 0, '', 1, 0, 2, 1, '', 0, 1, 1, 1, 1, 1, 0, 0, '{"edit_access":"1","view_access":"1","list_view_access":"1","filter_access":"1","sum_access":"1","avg_access":"1","median_access":"1","count_access":"1","custom_calc_access":"1"}'),
	(58, 'date_time', 6, 'date', 'date_time', 0, '0000-00-00 00:00:00', '2016-01-10 08:53:39', 1, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 1, 0, 1, 0, '', 1, 1, 1, 0, 0, 1, 0, 0, '{"bootstrap_class":"input-medium","date_showtime":"0","date_time_format":"H:i","bootstrap_time_class":"input-medium","placeholder":"","date_store_as_local":"0","date_table_format":"Y-m-d H:i:s","date_form_format":"Y-m-d H:i:s","date_defaulttotoday":"1","date_alwaystoday":"0","date_firstday":"0","date_allow_typing_in_field":"1","date_csv_offset_tz":"0","date_advanced":"0","date_allow_func":"","date_allow_php_func":"","date_observe":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(59, 'denominacion', 6, 'field', 'Denominación', 0, '0000-00-00 00:00:00', '2017-10-03 08:11:14', 1, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 3, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"placeholder":"","password":"0","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-xxlarge","text_format":"text","integer_length":"11","decimal_length":"2","field_use_number_format":"0","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","notempty-message":"Por favor introduzca denominaci\\u00f3n","notempty-validation_condition":"","tip_text":"","icon":"","validations":{"plugin":"notempty","plugin_published":"1","validate_in":"both","validation_on":"both","must_validate":"0","show_icon":"1"}}'),
	(60, 'email', 6, 'field', 'Email', 0, '0000-00-00 00:00:00', '2017-10-03 08:11:59', 1, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 4, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"placeholder":"","password":"3","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-large","text_format":"text","integer_length":"11","decimal_length":"2","field_use_number_format":"0","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","isemail-message":"Por favor, introuzca un email v\\u00e1lido","isemail-validation_condition":"","isemail-allow_empty":"0","isemail-check_mx":"0","tip_text":"","icon":"","validations":{"plugin":"isemail","plugin_published":"1","validate_in":"both","validation_on":"both","must_validate":"0","show_icon":"1"}}'),
	(61, 'isced1', 6, 'field', 'ISCED1', 0, '0000-00-00 00:00:00', '2017-10-03 08:12:18', 1, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 5, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"placeholder":"","password":"0","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-small","text_format":"text","integer_length":"11","decimal_length":"2","field_use_number_format":"0","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(62, 'isced2', 6, 'field', 'ISCED2', 0, '0000-00-00 00:00:00', '2017-10-03 08:12:31', 1, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 6, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"placeholder":"","password":"0","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-medium","text_format":"text","integer_length":"11","decimal_length":"2","field_use_number_format":"0","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(63, 'web', 6, 'field', 'Web', 0, '0000-00-00 00:00:00', '2017-10-03 08:12:58', 1, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 7, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"placeholder":"","password":"5","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-xxlarge","text_format":"text","integer_length":"11","decimal_length":"2","field_use_number_format":"0","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(64, 'plan', 6, 'dropdown', 'Plan', 0, '0000-00-00 00:00:00', '2017-10-03 08:13:51', 1, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 8, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"sub_options":{"sub_values":["plan2011","plan2007"],"sub_labels":["Plan 2011","Plan 2007"],"sub_initial_selection":["plan2011"]},"multiple":"0","dropdown_multisize":"3","allow_frontend_addtodropdown":"0","dd-allowadd-onlylabel":"0","dd-savenewadditions":"0","options_split_str":"","dropdown_populate":"","advanced_behavior":"1","bootstrap_class":"input-medium","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}'),
	(65, 'centro_administrativo', 6, 'field', 'Centro Administrativo', 0, '0000-00-00 00:00:00', '2017-10-03 08:20:51', 1, 'ezequiel', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 9, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{"placeholder":"","password":"0","maxlength":"255","disable":"0","readonly":"0","autocomplete":"1","speech":"0","advanced_behavior":"0","bootstrap_class":"input-block-level","text_format":"text","integer_length":"11","decimal_length":"2","field_use_number_format":"0","field_thousand_sep":",","field_decimal_sep":".","text_format_string":"","field_format_string_blank":"1","text_input_mask":"","text_input_mask_autoclear":"0","text_input_mask_definitions":"","render_as_qrcode":"0","guess_linktype":"0","link_target_options":"default","rel":"","link_title":"","show_in_rss_feed":"0","show_label_in_rss_feed":"0","use_as_rss_enclosure":"0","rollover":"","tipseval":"0","tiplocation":"top-left","labelindetails":"0","labelinlist":"0","comment":"","edit_access":"1","edit_access_user":"","view_access":"1","view_access_user":"","list_view_access":"1","encrypt":"0","store_in_db":"1","can_order":"0","alt_list_heading":"","custom_link":"","custom_link_target":"","custom_link_indetails":"1","use_as_row_class":"0","include_in_list_query":"1","always_render":"0","icon_folder":"0","icon_hovertext":"1","icon_file":"","icon_subdir":"","filter_length":"20","filter_access":"1","full_words_only":"0","filter_required":"0","filter_build_method":"0","filter_groupby":"text","inc_in_adv_search":"1","filter_class":"input-medium","filter_responsive_class":"","tablecss_header_class":"","tablecss_header":"","tablecss_cell_class":"","tablecss_cell":"","sum_on":"0","sum_label":"Sum","sum_access":"1","sum_split":"","avg_on":"0","avg_label":"Average","avg_access":"1","avg_round":"0","avg_split":"","median_on":"0","median_label":"Median","median_access":"1","median_split":"","count_on":"0","count_label":"Count","count_condition":"","count_access":"1","count_split":"","custom_calc_on":"0","custom_calc_label":"Custom","custom_calc_query":"","custom_calc_access":"1","custom_calc_split":"","custom_calc_php":"","validations":[]}');
/*!40000 ALTER TABLE `tltc_fabrik_elements` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_fabrik_formgroup
DROP TABLE IF EXISTS `tltc_fabrik_formgroup`;
CREATE TABLE IF NOT EXISTS `tltc_fabrik_formgroup` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `form_id` int(4) NOT NULL,
  `group_id` int(4) NOT NULL,
  `ordering` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca.tltc_fabrik_formgroup: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_fabrik_formgroup` DISABLE KEYS */;
INSERT INTO `tltc_fabrik_formgroup` (`id`, `form_id`, `group_id`, `ordering`) VALUES
	(1, 1, 1, 1),
	(2, 2, 2, 1),
	(4, 4, 4, 1),
	(6, 5, 6, 1);
/*!40000 ALTER TABLE `tltc_fabrik_formgroup` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_fabrik_forms
DROP TABLE IF EXISTS `tltc_fabrik_forms`;
CREATE TABLE IF NOT EXISTS `tltc_fabrik_forms` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `record_in_database` int(4) NOT NULL,
  `error` varchar(150) NOT NULL,
  `intro` text NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_by_alias` varchar(100) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `reset_button_label` varchar(100) NOT NULL,
  `submit_button_label` varchar(100) NOT NULL,
  `form_template` varchar(255) DEFAULT NULL,
  `view_only_template` varchar(255) DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca.tltc_fabrik_forms: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_fabrik_forms` DISABLE KEYS */;
INSERT INTO `tltc_fabrik_forms` (`id`, `label`, `record_in_database`, `error`, `intro`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `reset_button_label`, `submit_button_label`, `form_template`, `view_only_template`, `published`, `private`, `params`) VALUES
	(1, 'Cursos', 1, 'Algunas partes de su formulario no se han llenado de manera correcta.', '', '2017-09-12 00:00:00', 1, 'ezequiel', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Restablecer', 'Guardar', 'bootstrap', 'bootstrap', 1, 0, '{"outro":"","copy_button":"0","copy_button_label":"Save as copy","copy_icon":"","copy_icon_location":"before","reset_button":"0","reset_button_label":"Restablecer","reset_icon":"","reset_icon_location":"before","apply_button":"0","apply_button_label":"Aplicar","apply_icon":"","apply_icon_location":"before","goback_button":"0","goback_button_label":"Ir atr\\u00e1s","goback_icon":"","goback_icon_location":"before","submit_button":"1","submit_button_label":"Guardar","save_icon":"","save_icon_location":"before","submit_on_enter":"0","delete_button":"0","delete_button_label":"Eliminar","delete_icon":"","delete_icon_location":"before","ajax_validations":"0","ajax_validations_toggle_submit":"0","submit-success-msg":"","suppress_msgs":"0","show_loader_on_submit":"0","spoof_check":"1","multipage_save":"0","note":"","labels_above":"0","labels_above_details":"0","pdf_template":"","pdf_orientation":"portrait","pdf_size":"letter","admin_form_template":"","admin_details_template":"","show-title":"1","print":"","email":"","pdf":"","show-referring-table-releated-data":"0","tiplocation":"side","process-jplugins":"2","plugins":[],"plugin_locations":[],"plugin_events":[],"plugin_description":[]}'),
	(2, 'Solicitudes a Cursos', 1, 'Algunas partes de su formulario no se han llenado de manera correcta.', '', '2017-09-12 00:00:00', 1, 'ezequiel', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Restablecer', 'Enviar inscripción', 'bootstrap', 'bootstrap', 1, 0, '{"outro":"","copy_button":"0","copy_button_label":"Save as copy","copy_icon":"","copy_icon_location":"before","reset_button":"0","reset_button_label":"Restablecer","reset_icon":"","reset_icon_location":"before","apply_button":"0","apply_button_label":"Aplicar","apply_icon":"","apply_icon_location":"before","goback_button":"0","goback_button_label":"Ir atr\\u00e1s","goback_icon":"","goback_icon_location":"before","submit_button":"1","submit_button_label":"Enviar inscripci\\u00f3n","save_icon":"","save_icon_location":"before","submit_on_enter":"0","delete_button":"0","delete_button_label":"Eliminar","delete_icon":"","delete_icon_location":"before","ajax_validations":"0","ajax_validations_toggle_submit":"0","submit-success-msg":"Su solicitud de inscripci\\u00f3n ha sido registrada satisfactoriamente <br>Request sent successfully","suppress_msgs":"0","show_loader_on_submit":"0","spoof_check":"1","multipage_save":"0","note":"","labels_above":"0","labels_above_details":"0","pdf_template":"","pdf_orientation":"portrait","pdf_size":"letter","admin_form_template":"","admin_details_template":"","show-title":"1","print":"","email":"","pdf":"","show-referring-table-releated-data":"0","tiplocation":"below","process-jplugins":"2","plugin_state":["1"],"email_to":["{solicitudes_cursos___email} "],"email_to_eval":[""],"email_from":["admisiondoctorado@us.es"],"return_path":[""],"email_subject":["Solicitud de inscripci\\u00f3n a curso enviada"],"email_template":["-1"],"email_template_content":[""],"email_run_content_plugins":["0"],"email_message_text":["<html>\\r\\n  <head>\\r\\n    <style>\\r\\n     body {font-family: Arial, Verdana; font-size:13px;}\\r\\n     h1 {font-size:22px; color:#333; font-weight:normal;margin-left:20px; }\\r\\n     h2 {font-size:16px; color:#B60C25; font-weight:normal;margin-left:20px;}\\r\\n     div.marco {margin:15px; padding:9px; border:1px solid #ddd; border-radius:5px; width:700px;}\\r\\n    <\\/style>\\r\\n  <\\/head>\\r\\n  <body>\\r\\n    <div class=\\"marco\\">\\r\\n        <div class=\\"logo-us\\"><img src=\'http:\\/\\/www.doctorado.us.es\\/tolteca\\/images\\/logo-eidus.png\'\\/><\\/div>\\r\\n  \\t    <div>\\r\\n\\t\\t\\t\\t\\t<h3>Solicitud de inscripci&oacute;n enviada<\\/h3>\\r\\n\\t\\t\\t\\t<p>Hola  {solicitudes_cursos___nombre},<br\\/> Su solicitud de inscripci\\u00f3n al curso de <b>{solicitudes_cursos___curso}<\\/b> ha sido registrada satisfactoriamente.<\\/p>\\r\\n\\t\\t\\t<p>Recibir&aacute; respuesta a la mayor brevedad posible.<\\/p>\\r\\n\\t\\t<\\/div>\\r\\n    <\\/div>\\r\\n<\\/body>\\r\\n<\\/html>"],"email_conditon":[""],"email_update_field":[""],"email_headers_eval":[""],"email_attach_type":[""],"email_attach_eval":[""],"attach_pdf":["0"],"plugins":["email"],"plugin_locations":["both"],"plugin_events":["both"],"plugin_description":["Inscripci\\u00f3n realizada satisfactoriamente"]}'),
	(4, 'Usuarios', 1, 'Algunas partes de su formulario no se han llenado de manera correcta.', '', '2017-09-14 00:00:00', 1, 'ezequiel', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Restablecer', 'Guardar', 'bootstrap', 'bootstrap', 1, 0, '{"outro":"","copy_button":"0","copy_button_label":"Save as copy","copy_icon":"","copy_icon_location":"before","reset_button":"0","reset_button_label":"Restablecer","reset_icon":"","reset_icon_location":"before","apply_button":"0","apply_button_label":"Aplicar","apply_icon":"","apply_icon_location":"before","goback_button":"0","goback_button_label":"Ir atr\\u00e1s","goback_icon":"","goback_icon_location":"before","submit_button":"1","submit_button_label":"Guardar","save_icon":"","save_icon_location":"before","submit_on_enter":"0","delete_button":"0","delete_button_label":"Eliminar","delete_icon":"","delete_icon_location":"before","ajax_validations":"0","ajax_validations_toggle_submit":"0","submit-success-msg":"","suppress_msgs":"0","show_loader_on_submit":"0","spoof_check":"1","multipage_save":"0","note":"","labels_above":"0","labels_above_details":"0","pdf_template":"","pdf_orientation":"portrait","pdf_size":"letter","admin_form_template":"","admin_details_template":"","show-title":"1","print":"","email":"","pdf":"","show-referring-table-releated-data":"0","tiplocation":"side","process-jplugins":"2","plugin_state":["1"],"juser_field_name":["42"],"juser_field_username":["44"],"juser_field_password":["45"],"juser_field_email":["46"],"juser_field_block":["50"],"juser_field_userid":["48"],"juser_field_usertype":["47"],"juser_field_requirereset":[""],"juser_bypass_activation":["0"],"juser_bypass_registration":["1"],"juser_bypass_accountdetails":["0"],"juser_use_email_plugin":["0"],"juser_require_reset":["0"],"juser_field_default_group":["2"],"juser_group_whitelist":[["1","2","11","12","13","10"]],"juser_conditon":[""],"juser_delete_user":["0"],"juser_auto_login":["0"],"synchro_users":["1"],"juser_sync_on_edit":["1"],"juser_sync_load_current_user":["0"],"plugins":["juser"],"plugin_locations":["both"],"plugin_events":["both"],"plugin_description":[""]}'),
	(5, 'Programa', 1, 'Algunas partes de su formulario no se han llenado de manera correcta.', '', '2017-10-03 08:06:57', 1, 'ezequiel', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'Grabar', 'bootstrap', 'bootstrap', 1, 0, '{"outro":"","reset_button":"0","reset_button_label":"Restablecer","reset_icon":"","reset_icon_location":"before","copy_button":"0","copy_button_label":"Save as copy","copy_icon":"","copy_icon_location":"before","goback_button":"0","goback_button_label":"Ir atr\\u00e1s","goback_icon":"","goback_icon_location":"before","apply_button":"0","apply_button_label":"Aplicar","apply_icon":"","apply_icon_location":"before","delete_button":"0","delete_button_label":"Eliminar","delete_icon":"","delete_icon_location":"before","submit_button":"1","submit_button_label":"Guardar","save_icon":"","save_icon_location":"before","submit_on_enter":"0","labels_above":"0","labels_above_details":"0","pdf_template":"admin","pdf_orientation":"portrait","pdf_size":"letter","show_title":"1","print":"","email":"","pdf":"","admin_form_template":"","admin_details_template":"","note":"","show_referring_table_releated_data":"0","tiplocation":"tip","process_jplugins":"2","ajax_validations":"0","ajax_validations_toggle_submit":"0","submit_success_msg":"","suppress_msgs":"0","show_loader_on_submit":"0","spoof_check":"1","multipage_save":"0"}');
/*!40000 ALTER TABLE `tltc_fabrik_forms` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_fabrik_form_sessions
DROP TABLE IF EXISTS `tltc_fabrik_form_sessions`;
CREATE TABLE IF NOT EXISTS `tltc_fabrik_form_sessions` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `hash` varchar(255) NOT NULL,
  `user_id` int(6) NOT NULL,
  `form_id` int(6) NOT NULL,
  `row_id` int(10) NOT NULL,
  `last_page` int(4) NOT NULL,
  `referring_url` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `time_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca.tltc_fabrik_form_sessions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_fabrik_form_sessions` DISABLE KEYS */;
INSERT INTO `tltc_fabrik_form_sessions` (`id`, `hash`, `user_id`, `form_id`, `row_id`, `last_page`, `referring_url`, `data`, `time_date`) VALUES
	(8, '59ca970ee7402:2:0', 0, 2, 0, 0, 'http://doctorado.us.es/tolteca/cursos/form/2?solicitudes_cursos___curso_raw=1', 'a:43:{s:26:"solicitudes_cursos___curso";a:1:{i:0;s:1:"1";}s:30:"solicitudes_cursos___date_time";s:19:"2017-09-26 18:04:30";s:23:"solicitudes_cursos___id";s:0:"";s:27:"solicitudes_cursos___nombre";s:3:"Tao";s:30:"solicitudes_cursos___apellidos";s:4:"Yang";s:27:"solicitudes_cursos___perfil";a:1:{i:0;s:11:"PhD student";}s:26:"solicitudes_cursos___email";s:18:"ytdomingo@sina.com";s:33:"solicitudes_cursos___departamento";s:7:"Cirugia";s:26:"solicitudes_cursos___grupo";s:0:"";s:27:"solicitudes_cursos___centro";s:0:"";s:31:"solicitudes_cursos___motivacion";s:0:"";s:31:"solicitudes_cursos___organismos";s:0:"";s:6:"listid";s:1:"2";s:7:"listref";s:1:"2";s:5:"rowid";s:0:"";s:6:"Itemid";s:3:"114";s:6:"option";s:10:"com_fabrik";s:4:"task";s:12:"form.process";s:8:"isMambot";s:0:"";s:6:"formid";s:1:"2";s:12:"returntoform";s:1:"0";s:15:"fabrik_referrer";s:49:"http://doctorado.us.es/tolteca/cursos/details/1/1";s:11:"fabrik_ajax";s:1:"0";s:7:"package";s:6:"fabrik";s:9:"packageId";s:0:"";s:32:"e4ddffa05ddfa8bdfd0a0ce18701c41a";s:1:"1";s:6:"format";s:4:"html";s:19:"fabrik_repeat_group";a:1:{i:2;s:1:"1";}s:6:"Submit";s:0:"";s:30:"solicitudes_cursos___curso_raw";a:1:{i:0;s:1:"1";}s:34:"solicitudes_cursos___date_time_raw";s:19:"2017-09-26 18:04:30";s:27:"solicitudes_cursos___id_raw";s:0:"";s:31:"solicitudes_cursos___nombre_raw";s:3:"Tao";s:34:"solicitudes_cursos___apellidos_raw";s:4:"Yang";s:31:"solicitudes_cursos___perfil_raw";a:1:{i:0;s:11:"PhD student";}s:30:"solicitudes_cursos___email_raw";s:18:"ytdomingo@sina.com";s:37:"solicitudes_cursos___departamento_raw";s:7:"Cirugia";s:30:"solicitudes_cursos___grupo_raw";s:0:"";s:31:"solicitudes_cursos___centro_raw";s:0:"";s:35:"solicitudes_cursos___motivacion_raw";s:0:"";s:35:"solicitudes_cursos___organismos_raw";s:0:"";s:8:"__pk_val";s:0:"";s:4:"view";s:4:"form";}', '2017-09-25 07:37:49');
/*!40000 ALTER TABLE `tltc_fabrik_form_sessions` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_fabrik_groups
DROP TABLE IF EXISTS `tltc_fabrik_groups`;
CREATE TABLE IF NOT EXISTS `tltc_fabrik_groups` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `css` text NOT NULL,
  `label` varchar(100) NOT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_by_alias` varchar(100) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `is_join` int(1) NOT NULL DEFAULT '0',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca.tltc_fabrik_groups: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_fabrik_groups` DISABLE KEYS */;
INSERT INTO `tltc_fabrik_groups` (`id`, `name`, `css`, `label`, `published`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `is_join`, `private`, `params`) VALUES
	(1, 'Cursos', '', 'Cursos', 1, '2017-09-12 10:34:21', 678, 'ezequiel', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{"repeat_group_button":0,"repeat_group_show_first":1}'),
	(2, 'Solicitudes a Cursos', '', 'Solicitudes a Cursos', 1, '2017-09-12 10:46:48', 678, 'ezequiel', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{"repeat_group_button":0,"repeat_group_show_first":1}'),
	(4, 'Usuarios', '', 'Usuarios', 1, '2017-09-14 08:23:56', 678, 'ezequiel', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{"repeat_group_button":0,"repeat_group_show_first":1}'),
	(6, 'Programa', '', 'Programa', 1, '2017-10-03 08:06:57', 1, 'ezequiel', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{"repeat_group_button":0,"repeat_group_show_first":1}');
/*!40000 ALTER TABLE `tltc_fabrik_groups` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_fabrik_joins
DROP TABLE IF EXISTS `tltc_fabrik_joins`;
CREATE TABLE IF NOT EXISTS `tltc_fabrik_joins` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `list_id` int(6) NOT NULL,
  `element_id` int(6) NOT NULL,
  `join_from_table` varchar(255) NOT NULL,
  `table_join` varchar(255) NOT NULL,
  `table_key` varchar(255) NOT NULL,
  `table_join_key` varchar(255) NOT NULL,
  `join_type` varchar(255) NOT NULL,
  `group_id` int(10) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca.tltc_fabrik_joins: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_fabrik_joins` DISABLE KEYS */;
INSERT INTO `tltc_fabrik_joins` (`id`, `list_id`, `element_id`, `join_from_table`, `table_join`, `table_key`, `table_join_key`, `join_type`, `group_id`, `params`) VALUES
	(2, 0, 9, '', 'usuarios', 'organizador', 'id', 'left', 1, '{"join-label":"nombre","type":"element","pk":"`usuarios`.`id`"}'),
	(3, 0, 21, '', 'cursos', 'curso', 'id', 'left', 2, '{"join-label":"titulo","type":"element","pk":"`cursos`.`id`"}'),
	(4, 0, 49, '', '#__users', 'creador', 'id', 'left', 4, '{"join-label":"name","type":"element","pk":"`#__users`.``"}'),
	(8, 1, 8, 'cursos', 'cursos_repeat_documentacion', 'documentacion', 'parent_id', 'left', 0, '{"type":"repeatElement","pk":"`cursos_repeat_documentacion`.`id`"}');
/*!40000 ALTER TABLE `tltc_fabrik_joins` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_fabrik_jsactions
DROP TABLE IF EXISTS `tltc_fabrik_jsactions`;
CREATE TABLE IF NOT EXISTS `tltc_fabrik_jsactions` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `element_id` int(10) NOT NULL,
  `action` varchar(255) NOT NULL,
  `code` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca.tltc_fabrik_jsactions: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_fabrik_jsactions` DISABLE KEYS */;
INSERT INTO `tltc_fabrik_jsactions` (`id`, `element_id`, `action`, `code`, `params`) VALUES
	(58, 52, 'click', 'var id=document.getElementById(&quot;cursos___id_ro&quot;).innerHTML;\r\nvar loc = window.location.toString();\r\nvar url = loc.substr(0,loc.indexOf(&quot;cursos&quot;)) + &quot;cursos/form/2?solicitudes_cursos___curso_raw=&quot; + id.substring(5,id.indexOf(&quot;--&gt;&quot;)-1);\r\nwindow.location.replace(url);', '{"js_e_event":"","js_e_trigger":"fabrik_trigger_group_group1","js_e_condition":"","js_e_value":"","js_published":"1"}'),
	(65, 56, 'load', '', '{"js_e_event":"hide","js_e_trigger":"fabrik_trigger_element_cursos___inscripcion","js_e_condition":"==","js_e_value":"cerrado","js_published":"1"}');
/*!40000 ALTER TABLE `tltc_fabrik_jsactions` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_fabrik_lists
DROP TABLE IF EXISTS `tltc_fabrik_lists`;
CREATE TABLE IF NOT EXISTS `tltc_fabrik_lists` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `introduction` text NOT NULL,
  `form_id` int(4) NOT NULL,
  `db_table_name` varchar(255) NOT NULL,
  `db_primary_key` varchar(255) NOT NULL,
  `auto_inc` int(1) NOT NULL,
  `connection_id` int(6) NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(4) NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` int(4) NOT NULL,
  `checked_out` int(4) NOT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `access` int(4) NOT NULL,
  `hits` int(4) NOT NULL,
  `rows_per_page` int(5) NOT NULL,
  `template` varchar(255) NOT NULL,
  `order_by` varchar(255) NOT NULL,
  `order_dir` varchar(255) NOT NULL DEFAULT 'ASC',
  `filter_action` varchar(30) NOT NULL,
  `group_by` varchar(255) NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca.tltc_fabrik_lists: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_fabrik_lists` DISABLE KEYS */;
INSERT INTO `tltc_fabrik_lists` (`id`, `label`, `introduction`, `form_id`, `db_table_name`, `db_primary_key`, `auto_inc`, `connection_id`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `published`, `publish_up`, `publish_down`, `access`, `hits`, `rows_per_page`, `template`, `order_by`, `order_dir`, `filter_action`, `group_by`, `private`, `params`) VALUES
	(1, 'Cursos', '<p>Cursos de la EIDUS</p>', 1, 'cursos', 'cursos.id', 1, 2, '2017-09-12 00:00:00', 0, '', '2017-09-18 08:21:21', 1, 0, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 278, 10, 'bootstrap', '[""]', '["ASC"]', 'onchange', '', 0, '{"show-table-filters":"1","advanced-filter":"0","advanced-filter-default-statement":"=","search-mode":"0","search-mode-advanced":"0","search-mode-advanced-default":"all","search_elements":"","list_search_elements":"null","search-all-label":"All","require-filter":"0","filter-dropdown-method":"0","toggle_cols":"0","list_filter_cols":"1","empty_data_msg":"","outro":"","list_ajax":"0","show-table-add":"1","show-table-nav":"1","show_displaynum":"1","showall-records":"0","show-total":"0","sef-slug":"","show-table-picker":"1","admin_template":"","show-title":"1","pdf":"","pdf_template":"","pdf_orientation":"portrait","pdf_size":"a4","bootstrap_stripped_class":"1","bootstrap_bordered_class":"0","bootstrap_condensed_class":"0","bootstrap_hover_class":"1","responsive_elements":"","responsive_class":"","list_responsive_elements":"null","tabs_field":"","tabs_max":"10","tabs_all":"1","list_ajax_links":"0","actionMethod":"default","detailurl":"","detaillabel":"","list_detail_link_icon":"search","list_detail_link_target":"_self","editurl":"","editlabel":"","list_edit_link_icon":"edit","checkboxLocation":"beginning","addurl":"","addlabel":"","list_add_icon":"plus","list_delete_icon":"delete","popup_width":"","popup_height":"","popup_offset_x":"","popup_offset_y":"","note":"","alter_existing_db_cols":"default","process-jplugins":"1","cloak_emails":"0","enable_single_sorting":"default","collation":"utf8_general_ci","force_collate":"","list_disable_caching":"0","distinct":"1","group_by_raw":"1","group_by_access":"3","group_by_order":"","group_by_template":"","group_by_order_dir":"ASC","group_by_start_collapsed":"0","group_by_collapse_others":"0","group_by_show_count":"1","menu_module_prefilters_override":"1","prefilter_query":"","join-display":"default","delete-joined-rows":"0","show_related_add":"0","show_related_info":"2","facetedlinks":{"linkedlist":{"2-2-21":"2-2-21"},"linkedlistheader":{"2-2-21":"Solicitudes"},"linkedlisttext":{"2-2-21":"Solicitudes"},"linkedlist_linktype":{"2-2-21":"0"},"linkedform":{"2-2-21":"0"},"linkedformheader":{"2-2-21":"Inscribirme"},"linkedformtext":{"2-2-21":"Inscribirme"},"linkedform_linktype":{"2-2-21":"0"}},"faceted_form_order":"","faceted_list_order":"","rss":"0","feed_title":"","feed_date":"","feed_image_src":"","rsslimit":"150","rsslimitmax":"2500","csv_import_frontend":"3","csv_export_frontend":"2","csvfullname":"0","csv_export_step":"100","newline_csv_export":"nl2br","csv_clean_html":"leave","csv_custom_qs":"","csv_frontend_selection":"0","incfilters":"0","csv_format":"0","csv_which_elements":"selected","show_in_csv":"","csv_elements":"null","csv_include_data":"1","csv_include_raw_data":"1","csv_include_calculations":"0","csv_filename":"","csv_encoding":"","csv_double_quote":"1","csv_local_delimiter":"","csv_end_of_line":"n","open_archive_active":"0","open_archive_set_spec":"","open_archive_timestamp":"","open_archive_license":"http:\\/\\/creativecommons.org\\/licenses\\/by-nd\\/2.0\\/rdf","dublin_core_element":"","dublin_core_type":"dc:description.abstract","raw":"0","open_archive_elements":"null","search_use":"0","search_title":"","search_description":"","search_date":"","search_link_type":"details","dashboard":"0","dashboard_icon":"","allow_view_details":"1","allow_edit_details":"3","allow_edit_details2":"","allow_add":"3","allow_delete":"3","allow_delete2":"","allow_drop":"6","isView":"0"}'),
	(2, 'Solicitudes a Cursos', '<p>Solicitudes de inscripción a cursos</p>', 2, 'solicitudes_cursos', 'solicitudes_cursos.id', 1, 2, '2017-09-12 00:00:00', 0, '', '2017-09-29 08:55:12', 1, 0, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 64, 10, 'bootstrap', '[""]', '["ASC"]', 'onchange', '21', 0, '{"show-table-filters":"1","advanced-filter":"0","advanced-filter-default-statement":"=","search-mode":"0","search-mode-advanced":"0","search-mode-advanced-default":"all","search_elements":"","list_search_elements":"null","search-all-label":"All","require-filter":"0","filter-dropdown-method":"0","toggle_cols":"0","list_filter_cols":"1","empty_data_msg":"","outro":"","list_ajax":"0","show-table-add":"1","show-table-nav":"1","show_displaynum":"1","showall-records":"0","show-total":"0","sef-slug":"","show-table-picker":"1","admin_template":"","show-title":"1","pdf":"","pdf_template":"","pdf_orientation":"portrait","pdf_size":"a4","bootstrap_stripped_class":"1","bootstrap_bordered_class":"0","bootstrap_condensed_class":"0","bootstrap_hover_class":"1","responsive_elements":"","responsive_class":"","list_responsive_elements":"null","tabs_field":"","tabs_max":"10","tabs_all":"1","list_ajax_links":"0","actionMethod":"default","detailurl":"","detaillabel":"","list_detail_link_icon":"search","list_detail_link_target":"_self","editurl":"","editlabel":"","list_edit_link_icon":"edit","checkboxLocation":"beginning","addurl":"","addlabel":"","list_add_icon":"plus","list_delete_icon":"delete","popup_width":"","popup_height":"","popup_offset_x":"","popup_offset_y":"","note":"","alter_existing_db_cols":"default","process-jplugins":"1","cloak_emails":"0","enable_single_sorting":"default","collation":"utf8_general_ci","force_collate":"","list_disable_caching":"0","distinct":"1","group_by_raw":"1","group_by_access":"1","group_by_order":"","group_by_template":"","group_by_order_dir":"ASC","group_by_start_collapsed":"0","group_by_collapse_others":"0","group_by_show_count":"1","menu_module_prefilters_override":"1","prefilter_query":"","join-display":"default","delete-joined-rows":"0","show_related_add":"0","show_related_info":"0","rss":"0","feed_title":"","feed_date":"","feed_image_src":"","rsslimit":"150","rsslimitmax":"2500","csv_import_frontend":"3","csv_export_frontend":"2","csvfullname":"2","csv_export_step":"100","newline_csv_export":"nl2br","csv_clean_html":"leave","csv_custom_qs":"","csv_frontend_selection":"0","incfilters":"0","csv_format":"1","csv_which_elements":"selected","show_in_csv":"","csv_elements":"null","csv_include_data":"1","csv_include_raw_data":"1","csv_include_calculations":"0","csv_filename":"","csv_encoding":"UTF-8","csv_double_quote":"1","csv_local_delimiter":"","csv_end_of_line":"n","open_archive_active":"0","open_archive_set_spec":"","open_archive_timestamp":"","open_archive_license":"http:\\/\\/creativecommons.org\\/licenses\\/by-nd\\/2.0\\/rdf","dublin_core_element":"","dublin_core_type":"dc:description.abstract","raw":"0","open_archive_elements":"null","search_use":"0","search_title":"","search_description":"","search_date":"","search_link_type":"details","dashboard":"0","dashboard_icon":"","allow_view_details":"9","allow_edit_details":"3","allow_edit_details2":"","allow_add":"1","allow_delete":"3","allow_delete2":"","allow_drop":"3","isView":"0"}'),
	(4, 'Usuarios', '', 4, 'usuarios', 'usuarios.id', 1, 2, '2017-09-14 00:00:00', 0, '', '2017-09-14 09:24:40', 1, 0, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 23, 10, 'bootstrap', '[""]', '["ASC"]', 'onchange', '', 0, '{"show-table-filters":"1","advanced-filter":"0","advanced-filter-default-statement":"=","search-mode":"0","search-mode-advanced":"0","search-mode-advanced-default":"all","search_elements":"","list_search_elements":"null","search-all-label":"All","require-filter":"0","filter-dropdown-method":"0","toggle_cols":"0","list_filter_cols":"1","empty_data_msg":"","outro":"","list_ajax":"0","show-table-add":"1","show-table-nav":"1","show_displaynum":"1","showall-records":"0","show-total":"0","sef-slug":"","show-table-picker":"1","admin_template":"","show-title":"1","pdf":"","pdf_template":"","pdf_orientation":"portrait","pdf_size":"a4","bootstrap_stripped_class":"1","bootstrap_bordered_class":"0","bootstrap_condensed_class":"0","bootstrap_hover_class":"1","responsive_elements":"","responsive_class":"","list_responsive_elements":"null","tabs_field":"","tabs_max":"10","tabs_all":"1","list_ajax_links":"0","actionMethod":"default","detailurl":"","detaillabel":"","list_detail_link_icon":"search","list_detail_link_target":"_self","editurl":"","editlabel":"","list_edit_link_icon":"edit","checkboxLocation":"beginning","addurl":"","addlabel":"","list_add_icon":"plus","list_delete_icon":"delete","popup_width":"","popup_height":"","popup_offset_x":"","popup_offset_y":"","note":"","alter_existing_db_cols":"default","process-jplugins":"1","cloak_emails":"0","enable_single_sorting":"default","collation":"utf8_general_ci","force_collate":"","list_disable_caching":"0","distinct":"1","group_by_raw":"1","group_by_access":"1","group_by_order":"","group_by_template":"","group_by_order_dir":"ASC","group_by_start_collapsed":"0","group_by_collapse_others":"0","group_by_show_count":"1","menu_module_prefilters_override":"1","prefilter_query":"","join-display":"default","delete-joined-rows":"0","show_related_add":"0","show_related_info":"0","facetedlinks":{"linkedlist":{"1-1-9":"0"},"linkedlistheader":{"1-1-9":""},"linkedlisttext":{"1-1-9":""},"linkedlist_linktype":{"1-1-9":"0"},"linkedform":{"1-1-9":"0"},"linkedformheader":{"1-1-9":""},"linkedformtext":{"1-1-9":""},"linkedform_linktype":{"1-1-9":"0"}},"faceted_form_order":"","faceted_list_order":"","rss":"0","feed_title":"","feed_date":"","feed_image_src":"","rsslimit":"150","rsslimitmax":"2500","csv_import_frontend":"3","csv_export_frontend":"2","csvfullname":"0","csv_export_step":"100","newline_csv_export":"nl2br","csv_clean_html":"leave","csv_custom_qs":"","csv_frontend_selection":"0","incfilters":"0","csv_format":"0","csv_which_elements":"selected","show_in_csv":"","csv_elements":"null","csv_include_data":"1","csv_include_raw_data":"1","csv_include_calculations":"0","csv_filename":"","csv_encoding":"","csv_double_quote":"1","csv_local_delimiter":"","csv_end_of_line":"n","open_archive_active":"0","open_archive_set_spec":"","open_archive_timestamp":"","open_archive_license":"http:\\/\\/creativecommons.org\\/licenses\\/by-nd\\/2.0\\/rdf","dublin_core_element":"","dublin_core_type":"dc:description.abstract","raw":"0","open_archive_elements":"null","search_use":"0","search_title":"","search_description":"","search_date":"","search_link_type":"details","dashboard":"0","dashboard_icon":"","allow_view_details":"1","allow_edit_details":"1","allow_edit_details2":"","allow_add":"1","allow_delete":"2","allow_delete2":"","allow_drop":"3","isView":"0"}'),
	(5, 'Programas', '', 5, 'programas', 'programas.id', 1, 2, '2017-10-03 00:00:00', 0, '', '2017-10-03 08:07:08', 1, 0, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 10, 'bootstrap', '[""]', '["ASC"]', 'onchange', '', 0, '{"show-table-filters":"1","advanced-filter":"0","advanced-filter-default-statement":"=","search-mode":"0","search-mode-advanced":"0","search-mode-advanced-default":"all","search_elements":"","list_search_elements":"null","search-all-label":"All","require-filter":"0","filter-dropdown-method":"0","toggle_cols":"0","list_filter_cols":"1","empty_data_msg":"","outro":"","list_ajax":"0","show-table-add":"1","show-table-nav":"1","show_displaynum":"1","showall-records":"0","show-total":"0","sef-slug":"","show-table-picker":"1","admin_template":"","show-title":"1","pdf":"","pdf_template":"","pdf_orientation":"portrait","pdf_size":"a4","bootstrap_stripped_class":"1","bootstrap_bordered_class":"0","bootstrap_condensed_class":"0","bootstrap_hover_class":"1","responsive_elements":"","responsive_class":"","list_responsive_elements":"null","tabs_field":"","tabs_max":"10","tabs_all":"1","list_ajax_links":"0","actionMethod":"default","detailurl":"","detaillabel":"","list_detail_link_icon":"search","list_detail_link_target":"_self","editurl":"","editlabel":"","list_edit_link_icon":"edit","checkboxLocation":"beginning","addurl":"","addlabel":"","list_add_icon":"plus","list_delete_icon":"delete","popup_width":"","popup_height":"","popup_offset_x":"","popup_offset_y":"","note":"","alter_existing_db_cols":"default","process-jplugins":"1","cloak_emails":"0","enable_single_sorting":"default","collation":"utf8_general_ci","force_collate":"","list_disable_caching":"0","distinct":"1","group_by_raw":"1","group_by_access":"1","group_by_order":"","group_by_template":"","group_by_order_dir":"ASC","group_by_start_collapsed":"0","group_by_collapse_others":"0","group_by_show_count":"1","menu_module_prefilters_override":"1","prefilter_query":"","join-display":"default","delete-joined-rows":"0","show_related_add":"0","show_related_info":"0","rss":"0","feed_title":"","feed_date":"","feed_image_src":"","rsslimit":"150","rsslimitmax":"2500","csv_import_frontend":"3","csv_export_frontend":"2","csvfullname":"0","csv_export_step":"100","newline_csv_export":"nl2br","csv_clean_html":"leave","csv_custom_qs":"","csv_frontend_selection":"0","incfilters":"0","csv_format":"0","csv_which_elements":"selected","show_in_csv":"","csv_elements":"null","csv_include_data":"1","csv_include_raw_data":"1","csv_include_calculations":"0","csv_filename":"","csv_encoding":"","csv_double_quote":"1","csv_local_delimiter":"","csv_end_of_line":"n","open_archive_active":"0","open_archive_set_spec":"","open_archive_timestamp":"","open_archive_license":"http:\\/\\/creativecommons.org\\/licenses\\/by-nd\\/2.0\\/rdf","dublin_core_element":"","dublin_core_type":"dc:description.abstract","raw":"0","open_archive_elements":"null","search_use":"0","search_title":"","search_description":"","search_date":"","search_link_type":"details","dashboard":"0","dashboard_icon":"","allow_view_details":"1","allow_edit_details":"3","allow_edit_details2":"","allow_add":"3","allow_delete":"6","allow_delete2":"","allow_drop":"6","isView":"0"}');
/*!40000 ALTER TABLE `tltc_fabrik_lists` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_fabrik_log
DROP TABLE IF EXISTS `tltc_fabrik_log`;
CREATE TABLE IF NOT EXISTS `tltc_fabrik_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `timedate_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `flag` smallint(3) NOT NULL,
  `referring_url` varchar(255) NOT NULL,
  `message_source` varchar(255) NOT NULL,
  `message_type` char(60) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca.tltc_fabrik_log: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_fabrik_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_fabrik_log` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_fabrik_packages
DROP TABLE IF EXISTS `tltc_fabrik_packages`;
CREATE TABLE IF NOT EXISTS `tltc_fabrik_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `external_ref` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `component_name` varchar(100) NOT NULL,
  `version` varchar(10) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `checked_out` int(4) NOT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(6) NOT NULL,
  `template` varchar(255) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca.tltc_fabrik_packages: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_fabrik_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_fabrik_packages` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_fabrik_validations
DROP TABLE IF EXISTS `tltc_fabrik_validations`;
CREATE TABLE IF NOT EXISTS `tltc_fabrik_validations` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `element_id` int(4) NOT NULL,
  `validation_plugin` varchar(100) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `client_side_validation` int(1) NOT NULL DEFAULT '0',
  `checked_out` int(4) NOT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca.tltc_fabrik_validations: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_fabrik_validations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_fabrik_validations` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_fabrik_visualizations
DROP TABLE IF EXISTS `tltc_fabrik_visualizations`;
CREATE TABLE IF NOT EXISTS `tltc_fabrik_visualizations` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) NOT NULL,
  `label` varchar(255) NOT NULL,
  `intro_text` text NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_by_alias` varchar(100) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `publish_up` datetime NOT NULL,
  `publish_down` datetime NOT NULL,
  `published` int(1) NOT NULL,
  `access` int(6) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca.tltc_fabrik_visualizations: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_fabrik_visualizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_fabrik_visualizations` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_fields
DROP TABLE IF EXISTS `tltc_fields`;
CREATE TABLE IF NOT EXISTS `tltc_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `default_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldparams` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_user_id` (`created_user_id`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_fields: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_fields` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_fields_categories
DROP TABLE IF EXISTS `tltc_fields_categories`;
CREATE TABLE IF NOT EXISTS `tltc_fields_categories` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_fields_categories: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_fields_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_fields_categories` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_fields_groups
DROP TABLE IF EXISTS `tltc_fields_groups`;
CREATE TABLE IF NOT EXISTS `tltc_fields_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_fields_groups: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_fields_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_fields_groups` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_fields_values
DROP TABLE IF EXISTS `tltc_fields_values`;
CREATE TABLE IF NOT EXISTS `tltc_fields_values` (
  `field_id` int(10) unsigned NOT NULL,
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Allow references to items which have strings as ids, eg. none db systems.',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `idx_field_id` (`field_id`),
  KEY `idx_item_id` (`item_id`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_fields_values: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_fields_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_fields_values` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_filters
DROP TABLE IF EXISTS `tltc_finder_filters`;
CREATE TABLE IF NOT EXISTS `tltc_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_filters: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_filters` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_links
DROP TABLE IF EXISTS `tltc_finder_links`;
CREATE TABLE IF NOT EXISTS `tltc_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(400) DEFAULT NULL,
  `description` text,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`(100)),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_links: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_links` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_links_terms0
DROP TABLE IF EXISTS `tltc_finder_links_terms0`;
CREATE TABLE IF NOT EXISTS `tltc_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_links_terms0: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_links_terms0` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_links_terms0` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_links_terms1
DROP TABLE IF EXISTS `tltc_finder_links_terms1`;
CREATE TABLE IF NOT EXISTS `tltc_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_links_terms1: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_links_terms1` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_links_terms1` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_links_terms2
DROP TABLE IF EXISTS `tltc_finder_links_terms2`;
CREATE TABLE IF NOT EXISTS `tltc_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_links_terms2: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_links_terms2` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_links_terms2` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_links_terms3
DROP TABLE IF EXISTS `tltc_finder_links_terms3`;
CREATE TABLE IF NOT EXISTS `tltc_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_links_terms3: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_links_terms3` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_links_terms3` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_links_terms4
DROP TABLE IF EXISTS `tltc_finder_links_terms4`;
CREATE TABLE IF NOT EXISTS `tltc_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_links_terms4: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_links_terms4` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_links_terms4` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_links_terms5
DROP TABLE IF EXISTS `tltc_finder_links_terms5`;
CREATE TABLE IF NOT EXISTS `tltc_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_links_terms5: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_links_terms5` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_links_terms5` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_links_terms6
DROP TABLE IF EXISTS `tltc_finder_links_terms6`;
CREATE TABLE IF NOT EXISTS `tltc_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_links_terms6: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_links_terms6` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_links_terms6` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_links_terms7
DROP TABLE IF EXISTS `tltc_finder_links_terms7`;
CREATE TABLE IF NOT EXISTS `tltc_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_links_terms7: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_links_terms7` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_links_terms7` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_links_terms8
DROP TABLE IF EXISTS `tltc_finder_links_terms8`;
CREATE TABLE IF NOT EXISTS `tltc_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_links_terms8: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_links_terms8` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_links_terms8` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_links_terms9
DROP TABLE IF EXISTS `tltc_finder_links_terms9`;
CREATE TABLE IF NOT EXISTS `tltc_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_links_terms9: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_links_terms9` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_links_terms9` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_links_termsa
DROP TABLE IF EXISTS `tltc_finder_links_termsa`;
CREATE TABLE IF NOT EXISTS `tltc_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_links_termsa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_links_termsa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_links_termsa` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_links_termsb
DROP TABLE IF EXISTS `tltc_finder_links_termsb`;
CREATE TABLE IF NOT EXISTS `tltc_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_links_termsb: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_links_termsb` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_links_termsb` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_links_termsc
DROP TABLE IF EXISTS `tltc_finder_links_termsc`;
CREATE TABLE IF NOT EXISTS `tltc_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_links_termsc: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_links_termsc` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_links_termsc` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_links_termsd
DROP TABLE IF EXISTS `tltc_finder_links_termsd`;
CREATE TABLE IF NOT EXISTS `tltc_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_links_termsd: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_links_termsd` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_links_termsd` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_links_termse
DROP TABLE IF EXISTS `tltc_finder_links_termse`;
CREATE TABLE IF NOT EXISTS `tltc_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_links_termse: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_links_termse` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_links_termse` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_links_termsf
DROP TABLE IF EXISTS `tltc_finder_links_termsf`;
CREATE TABLE IF NOT EXISTS `tltc_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_links_termsf: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_links_termsf` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_links_termsf` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_taxonomy
DROP TABLE IF EXISTS `tltc_finder_taxonomy`;
CREATE TABLE IF NOT EXISTS `tltc_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_taxonomy: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_taxonomy` DISABLE KEYS */;
INSERT INTO `tltc_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
	(1, 0, 'ROOT', 0, 0, 0);
/*!40000 ALTER TABLE `tltc_finder_taxonomy` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_taxonomy_map
DROP TABLE IF EXISTS `tltc_finder_taxonomy_map`;
CREATE TABLE IF NOT EXISTS `tltc_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_taxonomy_map: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_taxonomy_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_taxonomy_map` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_terms
DROP TABLE IF EXISTS `tltc_finder_terms`;
CREATE TABLE IF NOT EXISTS `tltc_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_terms: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_terms` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_terms_common
DROP TABLE IF EXISTS `tltc_finder_terms_common`;
CREATE TABLE IF NOT EXISTS `tltc_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_terms_common: ~110 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_terms_common` DISABLE KEYS */;
INSERT INTO `tltc_finder_terms_common` (`term`, `language`) VALUES
	('a', 'en'),
	('about', 'en'),
	('after', 'en'),
	('ago', 'en'),
	('all', 'en'),
	('am', 'en'),
	('an', 'en'),
	('and', 'en'),
	('any', 'en'),
	('are', 'en'),
	('aren\'t', 'en'),
	('as', 'en'),
	('at', 'en'),
	('be', 'en'),
	('but', 'en'),
	('by', 'en'),
	('for', 'en'),
	('from', 'en'),
	('get', 'en'),
	('go', 'en'),
	('how', 'en'),
	('if', 'en'),
	('in', 'en'),
	('into', 'en'),
	('is', 'en'),
	('isn\'t', 'en'),
	('it', 'en'),
	('its', 'en'),
	('me', 'en'),
	('more', 'en'),
	('most', 'en'),
	('must', 'en'),
	('my', 'en'),
	('new', 'en'),
	('no', 'en'),
	('none', 'en'),
	('not', 'en'),
	('nothing', 'en'),
	('of', 'en'),
	('off', 'en'),
	('often', 'en'),
	('old', 'en'),
	('on', 'en'),
	('onc', 'en'),
	('once', 'en'),
	('only', 'en'),
	('or', 'en'),
	('other', 'en'),
	('our', 'en'),
	('ours', 'en'),
	('out', 'en'),
	('over', 'en'),
	('page', 'en'),
	('she', 'en'),
	('should', 'en'),
	('small', 'en'),
	('so', 'en'),
	('some', 'en'),
	('than', 'en'),
	('thank', 'en'),
	('that', 'en'),
	('the', 'en'),
	('their', 'en'),
	('theirs', 'en'),
	('them', 'en'),
	('then', 'en'),
	('there', 'en'),
	('these', 'en'),
	('they', 'en'),
	('this', 'en'),
	('those', 'en'),
	('thus', 'en'),
	('time', 'en'),
	('times', 'en'),
	('to', 'en'),
	('too', 'en'),
	('true', 'en'),
	('under', 'en'),
	('until', 'en'),
	('up', 'en'),
	('upon', 'en'),
	('use', 'en'),
	('user', 'en'),
	('users', 'en'),
	('version', 'en'),
	('very', 'en'),
	('via', 'en'),
	('want', 'en'),
	('was', 'en'),
	('way', 'en'),
	('were', 'en'),
	('what', 'en'),
	('when', 'en'),
	('where', 'en'),
	('which', 'en'),
	('who', 'en'),
	('whom', 'en'),
	('whose', 'en'),
	('why', 'en'),
	('wide', 'en'),
	('will', 'en'),
	('with', 'en'),
	('within', 'en'),
	('without', 'en'),
	('would', 'en'),
	('yes', 'en'),
	('yet', 'en'),
	('you', 'en'),
	('your', 'en'),
	('yours', 'en');
/*!40000 ALTER TABLE `tltc_finder_terms_common` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_tokens
DROP TABLE IF EXISTS `tltc_finder_tokens`;
CREATE TABLE IF NOT EXISTS `tltc_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_tokens: 0 rows
/*!40000 ALTER TABLE `tltc_finder_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_tokens` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_tokens_aggregate
DROP TABLE IF EXISTS `tltc_finder_tokens_aggregate`;
CREATE TABLE IF NOT EXISTS `tltc_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_tokens_aggregate: 0 rows
/*!40000 ALTER TABLE `tltc_finder_tokens_aggregate` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_tokens_aggregate` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_finder_types
DROP TABLE IF EXISTS `tltc_finder_types`;
CREATE TABLE IF NOT EXISTS `tltc_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tolteca.tltc_finder_types: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_finder_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_finder_types` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_languages
DROP TABLE IF EXISTS `tltc_languages`;
CREATE TABLE IF NOT EXISTS `tltc_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_languages: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_languages` DISABLE KEYS */;
INSERT INTO `tltc_languages` (`lang_id`, `asset_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
	(1, 0, 'en-GB', 'English (en-GB)', 'English (United Kingdom)', 'en', 'en_gb', '', '', '', '', 1, 1, 2),
	(2, 55, 'es-ES', 'Spanish (español)', 'Español (España)', 'es', 'es_es', '', '', '', '', 1, 1, 1);
/*!40000 ALTER TABLE `tltc_languages` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_menu
DROP TABLE IF EXISTS `tltc_menu`;
CREATE TABLE IF NOT EXISTS `tltc_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_path` (`path`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_menu: ~43 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_menu` DISABLE KEYS */;
INSERT INTO `tltc_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
	(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 85, 0, '*', 0),
	(2, 'main', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 1, 1, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
	(3, 'main', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 1, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
	(4, 'main', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 1, 2, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
	(5, 'main', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 1, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
	(6, 'main', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 1, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
	(7, 'main', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 1, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 31, 36, 0, '*', 1),
	(8, 'main', 'com_contact_contacts', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 1, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 32, 33, 0, '*', 1),
	(9, 'main', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 1, 7, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 34, 35, 0, '*', 1),
	(10, 'main', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 1, 1, 1, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 37, 40, 0, '*', 1),
	(11, 'main', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 1, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 38, 39, 0, '*', 1),
	(13, 'main', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 1, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 41, 46, 0, '*', 1),
	(14, 'main', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 1, 13, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 42, 43, 0, '*', 1),
	(15, 'main', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 1, 13, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 44, 45, 0, '*', 1),
	(16, 'main', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 1, 1, 1, 24, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 47, 48, 0, '*', 1),
	(17, 'main', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 1, 1, 1, 19, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 49, 50, 0, '*', 1),
	(18, 'main', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 1, 1, 1, 27, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 51, 52, 0, '*', 1),
	(19, 'main', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 1, 1, 1, 28, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 53, 54, 0, '*', 1),
	(20, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags', 'component', 1, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, 'class:tags', 0, '', 55, 56, 0, '', 1),
	(21, 'main', 'com_postinstall', 'Post-installation messages', '', 'Post-installation messages', 'index.php?option=com_postinstall', 'component', 1, 1, 1, 32, 0, '0000-00-00 00:00:00', 0, 1, 'class:postinstall', 0, '', 57, 58, 0, '*', 1),
	(22, 'main', 'com_associations', 'Multilingual Associations', '', 'Multilingual Associations', 'index.php?option=com_associations', 'component', 1, 1, 1, 34, 0, '0000-00-00 00:00:00', 0, 0, 'class:associations', 0, '', 59, 60, 0, '*', 1),
	(101, 'mainmenu', 'Inicio', 'home', '', 'home', 'index.php?option=com_content&view=article&id=1', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"1","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 11, 12, 1, '*', 0),
	(102, 'main', 'com_fabrik', 'com-fabrik', '', 'com-fabrik', 'index.php?option=com_fabrik', 'component', 1, 1, 1, 10044, 0, '0000-00-00 00:00:00', 0, 1, '../administrator/components/com_fabrik/images/fabrik.png', 0, '{}', 61, 76, 0, '', 1),
	(103, 'main', 'com_fabrik_lists', 'com-fabrik-lists', '', 'com-fabrik/com-fabrik-lists', 'index.php?option=com_fabrik&view=lists', 'component', 1, 102, 2, 10044, 0, '0000-00-00 00:00:00', 0, 1, '../administrator/components/com_fabrik/images/lists.png', 0, '{}', 62, 63, 0, '', 1),
	(104, 'main', 'com_fabrik_forms', 'com-fabrik-forms', '', 'com-fabrik/com-fabrik-forms', 'index.php?option=com_fabrik&view=forms', 'component', 1, 102, 2, 10044, 0, '0000-00-00 00:00:00', 0, 1, '../administrator/components/com_fabrik/images/forms.png', 0, '{}', 64, 65, 0, '', 1),
	(105, 'main', 'com_fabrik_groups', 'com-fabrik-groups', '', 'com-fabrik/com-fabrik-groups', 'index.php?option=com_fabrik&view=groups', 'component', 1, 102, 2, 10044, 0, '0000-00-00 00:00:00', 0, 1, '../administrator/components/com_fabrik/images/groups.png', 0, '{}', 66, 67, 0, '', 1),
	(106, 'main', 'com_fabrik_elements', 'com-fabrik-elements', '', 'com-fabrik/com-fabrik-elements', 'index.php?option=com_fabrik&view=elements', 'component', 1, 102, 2, 10044, 0, '0000-00-00 00:00:00', 0, 1, '../administrator/components/com_fabrik/images/elements.png', 0, '{}', 68, 69, 0, '', 1),
	(107, 'main', 'com_fabrik_visualizations', 'com-fabrik-visualizations', '', 'com-fabrik/com-fabrik-visualizations', 'index.php?option=com_fabrik&view=visualizations', 'component', 1, 102, 2, 10044, 0, '0000-00-00 00:00:00', 0, 1, '../administrator/components/com_fabrik/images/visualizations.png', 0, '{}', 70, 71, 0, '', 1),
	(108, 'main', 'com_fabrik_connections', 'com-fabrik-connections', '', 'com-fabrik/com-fabrik-connections', 'index.php?option=com_fabrik&view=connections', 'component', 1, 102, 2, 10044, 0, '0000-00-00 00:00:00', 0, 1, '../administrator/components/com_fabrik/images/connections.png', 0, '{}', 72, 73, 0, '', 1),
	(109, 'main', 'com_fabrik_schedule', 'com-fabrik-schedule', '', 'com-fabrik/com-fabrik-schedule', 'index.php?option=com_fabrik&view=crons', 'component', 1, 102, 2, 10044, 0, '0000-00-00 00:00:00', 0, 1, '../administrator/components/com_fabrik/images/schedules.png', 0, '{}', 74, 75, 0, '', 1),
	(110, 'main', 'COM_JCE', 'com-jce', '', 'com-jce', 'index.php?option=com_jce', 'component', 1, 1, 1, 10046, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_jce/media/img/menu/logo.png', 0, '{}', 77, 84, 0, '', 1),
	(111, 'main', 'COM_JCE_MENU_CPANEL', 'com-jce-menu-cpanel', '', 'com-jce/com-jce-menu-cpanel', 'index.php?option=com_jce', 'component', 1, 110, 2, 10046, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 78, 79, 0, '', 1),
	(112, 'main', 'COM_JCE_MENU_CONFIG', 'com-jce-menu-config', '', 'com-jce/com-jce-menu-config', 'index.php?option=com_jce&view=config', 'component', 1, 110, 2, 10046, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 80, 81, 0, '', 1),
	(113, 'main', 'COM_JCE_MENU_PROFILES', 'com-jce-menu-profiles', '', 'com-jce/com-jce-menu-profiles', 'index.php?option=com_jce&view=profiles', 'component', 1, 110, 2, 10046, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 82, 83, 0, '', 1),
	(114, 'mainmenu', 'Cursos', 'cursos', '', 'cursos', 'index.php?option=com_fabrik&view=list&listid=1', 'component', 1, 1, 1, 10044, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"addurl":"","show-title":"1","calculations":"0","listlayout":"Alumnos_cursos","fabriklayout":"","resetfilters":"0","list_elements":"null","prefilters":"null","rows_per_page":"10","popup_width":"340","popup_opts_width":"200","csv_import_extensions":"txt,csv,tsv","csv_import_sil_only":"0","csv_import_dropdata":"0","csv_import_overwrite":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 13, 14, 0, '*', 0),
	(117, 'mainmenu', 'Panel de opciones', 'panel-de-opciones', '', 'panel-de-opciones', 'index.php?option=com_content&view=article&id=2', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 2, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 15, 16, 0, '*', 0),
	(118, 'mainmenu', 'Mi cuenta', 'mi-cuenta', '', 'mi-cuenta', 'index.php?option=com_fabrik&view=form&formid=4', 'component', 1, 1, 1, 10044, 0, '0000-00-00 00:00:00', 0, 2, ' ', 0, '{"rowid":"-1","usekey":"","random":"0","fabriklayout":"","extra_query_string":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 17, 18, 0, '*', 0),
	(119, 'mainmenu', 'Mis cursos', 'mis-cursos', '', 'mis-cursos', 'index.php?option=com_fabrik&view=list&listid=1', 'component', 1, 1, 1, 10044, 0, '0000-00-00 00:00:00', 0, 7, ' ', 0, '{"addurl":"","show-title":"0","calculations":"0","listlayout":"","fabriklayout":"","resetfilters":"0","list_elements":"null","prefilters":"{\\"filter-join\\":[\\"OR\\"],\\"filter-fields\\":[\\"cursos.organizador_raw\\"],\\"filter-conditions\\":[\\"equals\\"],\\"filter-value\\":[\\"{$my->id}\\"],\\"filter-eval\\":[\\"0\\"],\\"filter-access\\":[\\"7\\"]}","rows_per_page":"10","popup_width":"340","popup_opts_width":"200","csv_import_extensions":"txt,csv,tsv","csv_import_sil_only":"0","csv_import_dropdata":"1","csv_import_overwrite":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"1","page_heading":"Mis cursos","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 19, 20, 0, '*', 0),
	(120, 'mainmenu', 'Administrar', 'administrar', '', 'administrar', 'index.php?option=com_content&view=article&id=3', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 3, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 21, 28, 0, '*', 0),
	(121, 'mainmenu', 'Usuarios', 'usuarios', '', 'administrar/usuarios', 'index.php?option=com_fabrik&view=list&listid=4', 'component', 1, 120, 2, 10044, 0, '0000-00-00 00:00:00', 0, 3, ' ', 0, '{"addurl":"","show-title":"1","calculations":"0","listlayout":"","fabriklayout":"","resetfilters":"0","list_elements":"null","prefilters":"null","rows_per_page":"10","popup_width":"340","popup_opts_width":"200","csv_import_extensions":"txt,csv,tsv","csv_import_sil_only":"0","csv_import_dropdata":"0","csv_import_overwrite":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 22, 23, 0, '*', 0),
	(122, 'mainmenu', 'Solicitudes a cursos', 'solicitudes-a-cursos', '', 'administrar/solicitudes-a-cursos', 'index.php?option=com_fabrik&view=list&listid=2', 'component', 1, 120, 2, 10044, 0, '0000-00-00 00:00:00', 0, 3, ' ', 0, '{"addurl":"","show-title":"1","calculations":"0","listlayout":"","fabriklayout":"","resetfilters":"0","list_elements":"null","prefilters":"null","rows_per_page":"10","popup_width":"340","popup_opts_width":"200","csv_import_extensions":"txt,csv,tsv","csv_import_sil_only":"0","csv_import_dropdata":"1","csv_import_overwrite":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 24, 25, 0, '*', 0),
	(123, 'mainmenu', 'Cursos', 'cursos', '', 'administrar/cursos', 'index.php?option=com_fabrik&view=list&listid=1', 'component', 1, 120, 2, 10044, 0, '0000-00-00 00:00:00', 0, 3, ' ', 0, '{"addurl":"","show-title":"1","calculations":"0","listlayout":"","fabriklayout":"","resetfilters":"0","list_elements":"null","prefilters":"null","rows_per_page":"10","popup_width":"340","popup_opts_width":"200","csv_import_extensions":"txt,csv,tsv","csv_import_sil_only":"0","csv_import_dropdata":"0","csv_import_overwrite":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 26, 27, 0, '*', 0),
	(124, 'mainmenu', 'Salir', 'salir', '', 'salir', 'index.php?option=com_users&view=login&layout=logout&task=user.menulogout', 'component', 1, 1, 1, 25, 0, '0000-00-00 00:00:00', 0, 2, ' ', 0, '{"logout":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 29, 30, 0, '*', 0);
/*!40000 ALTER TABLE `tltc_menu` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_menu_types
DROP TABLE IF EXISTS `tltc_menu_types`;
CREATE TABLE IF NOT EXISTS `tltc_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_menu_types: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_menu_types` DISABLE KEYS */;
INSERT INTO `tltc_menu_types` (`id`, `asset_id`, `menutype`, `title`, `description`, `client_id`) VALUES
	(1, 0, 'mainmenu', 'Main Menu', 'The main menu for the site', 0);
/*!40000 ALTER TABLE `tltc_menu_types` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_messages
DROP TABLE IF EXISTS `tltc_messages`;
CREATE TABLE IF NOT EXISTS `tltc_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_messages: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_messages` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_messages_cfg
DROP TABLE IF EXISTS `tltc_messages_cfg`;
CREATE TABLE IF NOT EXISTS `tltc_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_messages_cfg: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_messages_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_messages_cfg` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_modules
DROP TABLE IF EXISTS `tltc_modules`;
CREATE TABLE IF NOT EXISTS `tltc_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_modules: ~24 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_modules` DISABLE KEYS */;
INSERT INTO `tltc_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
	(1, 39, 'Menu Principal', '', '', 1, 'position-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"mainmenu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":" nav-pills","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
	(2, 40, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
	(3, 41, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
	(4, 42, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
	(8, 43, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
	(9, 44, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
	(10, 45, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
	(12, 46, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
	(13, 47, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
	(14, 48, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
	(15, 49, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
	(16, 50, 'Login', '', '', 1, 'position-0', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 0, '{"pretext":"","posttext":"","login":"117","logout":"101","greeting":"1","profilelink":"1","name":"0","usesecure":"0","usetext":"0","layout":"_:horizontal","moduleclass_sfx":"","cache":"0","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
	(17, 51, 'Breadcrumbs', '', '', 1, 'position-3', 1, '2017-09-29 08:49:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 1, 0, '{"showHere":"1","showHome":"1","homeText":"","showLast":"1","separator":"","layout":"_:default","moduleclass_sfx":"","cache":"0","cache_time":"0","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
	(79, 52, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
	(86, 53, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
	(87, 57, 'Fabrik Form Module', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_fabrik_form', 1, 1, '', 0, '*'),
	(88, 58, 'Fabrik List Module', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_fabrik_list', 1, 1, '', 0, '*'),
	(89, 63, 'PO_Mi_Cuenta', '', '<div class="span4 col-icono row-fluid"><a href="mi-cuenta"> <i class="fa fa-user fa-4x"></i>\r\n<h3>Mi cuenta</h3>\r\n<p>Modifica los datos de tu cuenta: correo, contraseña.</p>\r\n</a></div>', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 2, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
	(90, 64, 'PO_Mis_Cursos', '', '<div class="span4 col-icono row-fluid"><a href="mis-cursos"> <i class="fa fa-book fa-4x"></i>\r\n<h3>Mis Cursos</h3>\r\n<p>Cursos de los que soy formador</p>\r\n</a></div>', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 7, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
	(91, 65, 'PO_Mis_Cursos (copia)', '', '<div class="span4 col-icono row-fluid"><a href="mis-cursos"> <i class="fa fa-book fa-4x"></i>\r\n<h3>Mis Cursos</h3>\r\n<p>Cursos de los que soy formador</p>\r\n</a></div>', 1, '', 0, '0000-00-00 00:00:00', '2017-09-15 10:00:39', '0000-00-00 00:00:00', -2, 'mod_custom', 2, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
	(92, 66, 'PO_Salir', '', '<div class="span4 col-icono row-fluid"><a href="salir"> <i class="fa fa-sign-out fa-4x"></i>\r\n<h3>Salir</h3>\r\n<p>Salir de la aplicación</p>\r\n</a></div>', 1, '', 0, '0000-00-00 00:00:00', '2017-09-15 10:01:09', '0000-00-00 00:00:00', 1, 'mod_custom', 2, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
	(93, 67, 'PO_Usuarios', '', '<div class="span4 col-icono row-fluid"><a href="administrar/usuarios"> <i class="fa fa-users fa-4x"></i>\r\n<h3>Usuarios</h3>\r\n<p>Listado de usuarios de la aplicacion</p>\r\n</a></div>', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 3, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
	(94, 68, 'PO_Solicitudes_Cursos', '', '<div class="span4 col-icono row-fluid"><a href="administrar/solicitudes-a-cursos"> <i class="fa fa-file-o fa-4x"></i>\r\n<h3>Solicitudes a cursos</h3>\r\n<p>Administrar solicitudes a cursos</p>\r\n</a></div>', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 3, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
	(95, 69, 'PO_Cursos_Administrar', '', '<div class="span4 col-icono row-fluid"><a href="administrar/cursos"> <i class="fa fa-book fa-4x"></i>\r\n<h3>Cursos</h3>\r\n<p>Administrar cursos</p>\r\n</a></div>', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 3, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*');
/*!40000 ALTER TABLE `tltc_modules` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_modules_menu
DROP TABLE IF EXISTS `tltc_modules_menu`;
CREATE TABLE IF NOT EXISTS `tltc_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_modules_menu: ~31 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_modules_menu` DISABLE KEYS */;
INSERT INTO `tltc_modules_menu` (`moduleid`, `menuid`) VALUES
	(1, 0),
	(2, 0),
	(3, 0),
	(4, 0),
	(6, 0),
	(7, 0),
	(8, 0),
	(9, 0),
	(10, 0),
	(12, 0),
	(13, 0),
	(14, 0),
	(15, 0),
	(16, 0),
	(17, 0),
	(79, 0),
	(86, 0),
	(89, 117),
	(89, 120),
	(90, 117),
	(90, 120),
	(91, 117),
	(91, 120),
	(92, 117),
	(92, 120),
	(93, 117),
	(93, 120),
	(94, 117),
	(94, 120),
	(95, 117),
	(95, 120);
/*!40000 ALTER TABLE `tltc_modules_menu` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_newsfeeds
DROP TABLE IF EXISTS `tltc_newsfeeds`;
CREATE TABLE IF NOT EXISTS `tltc_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_newsfeeds: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_newsfeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_newsfeeds` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_overrider
DROP TABLE IF EXISTS `tltc_overrider`;
CREATE TABLE IF NOT EXISTS `tltc_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_overrider: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_overrider` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_overrider` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_postinstall_messages
DROP TABLE IF EXISTS `tltc_postinstall_messages`;
CREATE TABLE IF NOT EXISTS `tltc_postinstall_messages` (
  `postinstall_message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_postinstall_messages: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_postinstall_messages` DISABLE KEYS */;
INSERT INTO `tltc_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
	(1, 700, 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION', 'plg_twofactorauth_totp', 1, 'action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_condition', '3.2.0', 1),
	(2, 700, 'COM_CPANEL_WELCOME_BEGINNERS_TITLE', 'COM_CPANEL_WELCOME_BEGINNERS_MESSAGE', '', 'com_cpanel', 1, 'message', '', '', '', '', '3.2.0', 1),
	(3, 700, 'COM_CPANEL_MSG_STATS_COLLECTION_TITLE', 'COM_CPANEL_MSG_STATS_COLLECTION_BODY', '', 'com_cpanel', 1, 'message', '', '', 'admin://components/com_admin/postinstall/statscollection.php', 'admin_postinstall_statscollection_condition', '3.5.0', 1),
	(4, 700, 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME', 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_BODY', 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_ACTION', 'plg_system_updatenotification', 1, 'action', 'site://plugins/system/updatenotification/postinstall/updatecachetime.php', 'updatecachetime_postinstall_action', 'site://plugins/system/updatenotification/postinstall/updatecachetime.php', 'updatecachetime_postinstall_condition', '3.6.3', 1),
	(5, 700, 'COM_CPANEL_MSG_JOOMLA40_PRE_CHECKS_TITLE', 'COM_CPANEL_MSG_JOOMLA40_PRE_CHECKS_BODY', '', 'com_cpanel', 1, 'message', '', '', 'admin://components/com_admin/postinstall/joomla40checks.php', 'admin_postinstall_joomla40checks_condition', '3.7.0', 1),
	(6, 700, 'TPL_HATHOR_MESSAGE_POSTINSTALL_TITLE', 'TPL_HATHOR_MESSAGE_POSTINSTALL_BODY', 'TPL_HATHOR_MESSAGE_POSTINSTALL_ACTION', 'tpl_hathor', 1, 'action', 'admin://templates/hathor/postinstall/hathormessage.php', 'hathormessage_postinstall_action', 'admin://templates/hathor/postinstall/hathormessage.php', 'hathormessage_postinstall_condition', '3.7.0', 1);
/*!40000 ALTER TABLE `tltc_postinstall_messages` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_redirect_links
DROP TABLE IF EXISTS `tltc_redirect_links`;
CREATE TABLE IF NOT EXISTS `tltc_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  KEY `idx_old_url` (`old_url`(100)),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_redirect_links: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_redirect_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_redirect_links` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_schemas
DROP TABLE IF EXISTS `tltc_schemas`;
CREATE TABLE IF NOT EXISTS `tltc_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_schemas: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_schemas` DISABLE KEYS */;
INSERT INTO `tltc_schemas` (`extension_id`, `version_id`) VALUES
	(700, '3.7.4-2017-07-05'),
	(10044, '3.6.1');
/*!40000 ALTER TABLE `tltc_schemas` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_session
DROP TABLE IF EXISTS `tltc_session`;
CREATE TABLE IF NOT EXISTS `tltc_session` (
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned DEFAULT NULL,
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_session: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_session` DISABLE KEYS */;
INSERT INTO `tltc_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
	('dhkb36updf85n6ubplfrpcom81', 1, 0, '1507018942', 'joomla|s:31448:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjo1OntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aTo1NztzOjU6InRpbWVyIjtPOjg6InN0ZENsYXNzIjozOntzOjU6InN0YXJ0IjtpOjE1MDcwMTc2MTM7czo0OiJsYXN0IjtpOjE1MDcwMTg5Mzk7czozOiJub3ciO2k6MTUwNzAxODk0Mjt9czo1OiJ0b2tlbiI7czozMjoiVW9tcW41SVltZ0syZlZINFI5c0VYMGFFdng5cTRSUEwiO31zOjg6InJlZ2lzdHJ5IjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjM6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6NDp7czoxMzoiY29tX2luc3RhbGxlciI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo3OiJtZXNzYWdlIjtzOjA6IiI7czoxNzoiZXh0ZW5zaW9uX21lc3NhZ2UiO3M6MDoiIjt9czoxMDoiY29tX2ZhYnJpayI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJlZGl0IjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Imxpc3QiO086ODoic3RkQ2xhc3MiOjI6e3M6NDoiZGF0YSI7TjtzOjI6ImlkIjthOjA6e319czo3OiJlbGVtZW50IjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6ImRhdGEiO047fX1zOjEzOiJjb25maXJtVXBkYXRlIjtpOjA7fXM6MTU6ImNvbV9mYWJyaWthZG1pbiI7Tzo4OiJzdGRDbGFzcyI6MTp7czo4OiJlbGVtZW50cyI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJvcmRlcmNvbCI7TjtzOjY6ImZpbHRlciI7Tzo4OiJzdGRDbGFzcyI6Njp7czo5OiJwdWJsaXNoZWQiO3M6MDoiIjtzOjY6InNlYXJjaCI7czowOiIiO3M6NDoiZm9ybSI7czoxOiI1IjtzOjU6Imdyb3VwIjtzOjA6IiI7czoxMDoic2hvd2lubGlzdCI7czowOiIiO3M6NjoicGx1Z2luIjtzOjA6IiI7fXM6OToib3JkZXJkaXJuIjtzOjA6IiI7czoxMDoibGltaXRzdGFydCI7aTowO319czo2OiJnbG9iYWwiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoibGlzdCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJsaW1pdCI7aToyMDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtzOjE6IjEiO31zOjY6ImZhYnJpayI7Tzo4OiJzdGRDbGFzcyI6MTp7czoyOiJqcyI7Tzo4OiJzdGRDbGFzcyI6NTp7czo3OiJzY3JpcHRzIjtOO3M6NDoiaGVhZCI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo3OiJzY3JpcHRzIjtOO3M6NToiY2FjaGUiO086ODoic3RkQ2xhc3MiOjg6e3M6MzI6ImI3NmFiYmI5MTUxYmNiMjcwY2JiY2RhYTVhMjU3N2NlIjtzOjE3OTQ6InsiXC90b2x0ZWNhXC9tZWRpYVwvc3lzdGVtXC9qc1wvY29yZS5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9zeXN0ZW1cL2pzXC9wb2x5ZmlsbC5ldmVudC5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiY29uZGl0aW9uYWwiOiJsdCBJRSA5IiwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9zeXN0ZW1cL2pzXC9rZWVwYWxpdmUuanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZSwiZGV0ZWN0RGVidWciOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvanVpXC9qc1wvanF1ZXJ5Lm1pbi5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZGV0ZWN0RGVidWciOmZhbHNlLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvanVpXC9qc1wvanF1ZXJ5LW5vY29uZmxpY3QuanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZSwiZGV0ZWN0RGVidWciOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvanVpXC9qc1wvanF1ZXJ5LW1pZ3JhdGUubWluLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJkZXRlY3REZWJ1ZyI6ZmFsc2UsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9qdWlcL2pzXC9ib290c3RyYXAubWluLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJkZXRlY3REZWJ1ZyI6IjAiLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvanVpXC9qc1wvY2hvc2VuLmpxdWVyeS5taW4uanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImRldGVjdERlYnVnIjoiMCIsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9qdWlcL2pzXC9odG1sNS5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiY29uZGl0aW9uYWwiOiJsdCBJRSA5IiwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19fSI7czozMjoiZDRmOTg3NDdhMTE5YjFlNmRkMjIyNGMwMWQ2MDgyODkiO3M6MTk1MToieyJcL3RvbHRlY2FcL21lZGlhXC9qdWlcL2pzXC9qcXVlcnkubWluLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJkZXRlY3REZWJ1ZyI6ZmFsc2UsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9qdWlcL2pzXC9qcXVlcnktbm9jb25mbGljdC5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9qdWlcL2pzXC9qcXVlcnktbWlncmF0ZS5taW4uanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImRldGVjdERlYnVnIjpmYWxzZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL2p1aVwvanNcL2Jvb3RzdHJhcC5taW4uanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImRldGVjdERlYnVnIjoiMCIsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9zeXN0ZW1cL2pzXC9odG1sNWZhbGxiYWNrLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWUsImRldGVjdERlYnVnIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL3N5c3RlbVwvanNcL21vb3Rvb2xzLWNvcmUuanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImRldGVjdERlYnVnIjoiMCIsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9zeXN0ZW1cL2pzXC9jb3JlLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWUsImRldGVjdERlYnVnIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL3N5c3RlbVwvanNcL21vb3Rvb2xzLW1vcmUuanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImRldGVjdERlYnVnIjoiMCIsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9zeXN0ZW1cL2pzXC9jYWxlbmRhci5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9zeXN0ZW1cL2pzXC9jYWxlbmRhci1zZXR1cC5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19fSI7czozMjoiZTcyYWY0ZmRkNzA1ZWMzMmQwNmVjMjYzNDgwYWU4ZjIiO3M6MjM5NzoieyJcL3RvbHRlY2FcL21lZGlhXC9zeXN0ZW1cL2pzXC9tb290b29scy1jb3JlLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJkZXRlY3REZWJ1ZyI6IjAiLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvc3lzdGVtXC9qc1wvY29yZS5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9zeXN0ZW1cL2pzXC9tb290b29scy1tb3JlLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJkZXRlY3REZWJ1ZyI6IjAiLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvanVpXC9qc1wvanF1ZXJ5Lm1pbi5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZGV0ZWN0RGVidWciOmZhbHNlLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvanVpXC9qc1wvanF1ZXJ5LW5vY29uZmxpY3QuanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZSwiZGV0ZWN0RGVidWciOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvanVpXC9qc1wvanF1ZXJ5LW1pZ3JhdGUubWluLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJkZXRlY3REZWJ1ZyI6ZmFsc2UsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9qdWlcL2pzXC9ib290c3RyYXAubWluLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJkZXRlY3REZWJ1ZyI6IjAiLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvc3lzdGVtXC9qc1wvY2FsZW5kYXIuanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZSwiZGV0ZWN0RGVidWciOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvc3lzdGVtXC9qc1wvY2FsZW5kYXItc2V0dXAuanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZSwiZGV0ZWN0RGVidWciOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvc3lzdGVtXC9qc1wvcG9seWZpbGwuZmlsdGVyLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJjb25kaXRpb25hbCI6Imx0ZSBJRSA5IiwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL2FkbWluaXN0cmF0b3JcL3RlbXBsYXRlc1wvaXNpc1wvanNcL3RlbXBsYXRlLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWUsImRldGVjdERlYnVnIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL2p1aVwvanNcL2h0bWw1LmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJjb25kaXRpb25hbCI6Imx0IElFIDkiLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWUsImRldGVjdERlYnVnIjp0cnVlfX19IjtzOjMyOiIwNzJiYWIxNjIxZjE1ZWNiMzJjMjU2NmY5MDAxOWE1YSI7czoyNTc1OiJ7IlwvdG9sdGVjYVwvbWVkaWFcL2p1aVwvanNcL2pxdWVyeS5taW4uanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImRldGVjdERlYnVnIjpmYWxzZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL2p1aVwvanNcL2pxdWVyeS1ub2NvbmZsaWN0LmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWUsImRldGVjdERlYnVnIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL2p1aVwvanNcL2pxdWVyeS1taWdyYXRlLm1pbi5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZGV0ZWN0RGVidWciOmZhbHNlLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvc3lzdGVtXC9qc1wvY29yZS5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9zeXN0ZW1cL2pzXC9tb290b29scy1jb3JlLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJkZXRlY3REZWJ1ZyI6IjAiLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvc3lzdGVtXC9qc1wvbW9vdG9vbHMtbW9yZS5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZGV0ZWN0RGVidWciOiIwIiwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL3N5c3RlbVwvanNcL211bHRpc2VsZWN0LmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJmcmFtZXdvcmsiOmZhbHNlLCJyZWxhdGl2ZSI6dHJ1ZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9qdWlcL2pzXC9ib290c3RyYXAubWluLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJkZXRlY3REZWJ1ZyI6IjAiLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvc3lzdGVtXC9qc1wvY2FsZW5kYXIuanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZSwiZGV0ZWN0RGVidWciOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvc3lzdGVtXC9qc1wvY2FsZW5kYXItc2V0dXAuanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZSwiZGV0ZWN0RGVidWciOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvc3lzdGVtXC9qc1wvcG9seWZpbGwuZmlsdGVyLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJjb25kaXRpb25hbCI6Imx0ZSBJRSA5IiwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL2FkbWluaXN0cmF0b3JcL3RlbXBsYXRlc1wvaXNpc1wvanNcL3RlbXBsYXRlLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWUsImRldGVjdERlYnVnIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL2p1aVwvanNcL2h0bWw1LmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJjb25kaXRpb25hbCI6Imx0IElFIDkiLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWUsImRldGVjdERlYnVnIjp0cnVlfX19IjtzOjMyOiI2ZWFiOGRhYmM0YjhhM2ZjMzc1YjY5NTFlODNiYWNmNyI7czoyMzk3OiJ7IlwvdG9sdGVjYVwvbWVkaWFcL3N5c3RlbVwvanNcL21vb3Rvb2xzLWNvcmUuanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImRldGVjdERlYnVnIjoiMCIsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9zeXN0ZW1cL2pzXC9jb3JlLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWUsImRldGVjdERlYnVnIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL3N5c3RlbVwvanNcL21vb3Rvb2xzLW1vcmUuanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImRldGVjdERlYnVnIjoiMCIsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9qdWlcL2pzXC9qcXVlcnkubWluLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJkZXRlY3REZWJ1ZyI6ZmFsc2UsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9qdWlcL2pzXC9qcXVlcnktbm9jb25mbGljdC5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9qdWlcL2pzXC9qcXVlcnktbWlncmF0ZS5taW4uanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImRldGVjdERlYnVnIjpmYWxzZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL2p1aVwvanNcL2Jvb3RzdHJhcC5taW4uanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImRldGVjdERlYnVnIjoiMCIsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9zeXN0ZW1cL2pzXC9jYWxlbmRhci5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9zeXN0ZW1cL2pzXC9jYWxlbmRhci1zZXR1cC5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9zeXN0ZW1cL2pzXC9wb2x5ZmlsbC5maWx0ZXIuanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImNvbmRpdGlvbmFsIjoibHRlIElFIDkiLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWUsImRldGVjdERlYnVnIjp0cnVlfX0sIlwvdG9sdGVjYVwvYWRtaW5pc3RyYXRvclwvdGVtcGxhdGVzXC9pc2lzXC9qc1wvdGVtcGxhdGUuanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZSwiZGV0ZWN0RGVidWciOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvanVpXC9qc1wvaHRtbDUuanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImNvbmRpdGlvbmFsIjoibHQgSUUgOSIsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZSwiZGV0ZWN0RGVidWciOnRydWV9fX0iO3M6MzI6IjdhYWM1ZTZhNmI2YWIwODc0NjlmMzJjMTVjODlmNDI1IjtzOjQ4Mzk6InsiXC90b2x0ZWNhXC9tZWRpYVwvc3lzdGVtXC9qc1wvY29yZS5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9zeXN0ZW1cL2pzXC9tb290b29scy1jb3JlLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJkZXRlY3REZWJ1ZyI6IjAiLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvc3lzdGVtXC9qc1wvbW9vdG9vbHMtbW9yZS5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZGV0ZWN0RGVidWciOiIwIiwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL2p1aVwvanNcL2pxdWVyeS5taW4uanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImRldGVjdERlYnVnIjpmYWxzZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL2p1aVwvanNcL2pxdWVyeS1ub2NvbmZsaWN0LmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWUsImRldGVjdERlYnVnIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL2p1aVwvanNcL2pxdWVyeS1taWdyYXRlLm1pbi5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZGV0ZWN0RGVidWciOmZhbHNlLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvanVpXC9qc1wvYm9vdHN0cmFwLm1pbi5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZGV0ZWN0RGVidWciOiIwIiwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL3N5c3RlbVwvanNcL2NhbGVuZGFyLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWUsImRldGVjdERlYnVnIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL3N5c3RlbVwvanNcL2NhbGVuZGFyLXNldHVwLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWUsImRldGVjdERlYnVnIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL3N5c3RlbVwvanNcL3ZhbGlkYXRlLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJmcmFtZXdvcmsiOmZhbHNlLCJyZWxhdGl2ZSI6dHJ1ZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9zeXN0ZW1cL2pzXC9wb2x5ZmlsbC5ldmVudC5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiY29uZGl0aW9uYWwiOiJsdGUgSUUgMTEiLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWUsImRldGVjdERlYnVnIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL3N5c3RlbVwvanNcL2tlZXBhbGl2ZS5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9zeXN0ZW1cL2pzXC9odG1sNWZhbGxiYWNrLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWUsImRldGVjdERlYnVnIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL3N5c3RlbVwvanNcL21vZGFsLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJmcmFtZXdvcmsiOnRydWUsInZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZSwiZGV0ZWN0RGVidWciOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvanVpXC9qc1wvZmllbGR1c2VyLm1pbi5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9qdWlcL2pzXC9ib290c3RyYXAtdG9vbHRpcC1leHRlbmRlZC5taW4uanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZSwiZGV0ZWN0RGVidWciOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvc3lzdGVtXC9qc1wvcG9seWZpbGwuY2xhc3NsaXN0LmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJjb25kaXRpb25hbCI6Imx0ZSBJRSAxMSIsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZSwiZGV0ZWN0RGVidWciOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvc3lzdGVtXC9qc1wvcG9seWZpbGwubWFwLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJjb25kaXRpb25hbCI6Imx0ZSBJRSAxMSIsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZSwiZGV0ZWN0RGVidWciOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvc3lzdGVtXC9qc1wvZmllbGRzXC9jYWxlbmRhci1sb2NhbGVzXC9lcy5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsiZnJhbWV3b3JrIjpmYWxzZSwicmVsYXRpdmUiOnRydWUsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6ZmFsc2UsImRldGVjdERlYnVnIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL3N5c3RlbVwvanNcL2ZpZWxkc1wvY2FsZW5kYXItbG9jYWxlc1wvZGF0ZVwvZ3JlZ29yaWFuXC9kYXRlLWhlbHBlci5taW4uanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7ImZyYW1ld29yayI6ZmFsc2UsInJlbGF0aXZlIjp0cnVlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOmZhbHNlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9zeXN0ZW1cL2pzXC9maWVsZHNcL2NhbGVuZGFyLm1pbi5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsiZnJhbWV3b3JrIjpmYWxzZSwicmVsYXRpdmUiOnRydWUsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6ZmFsc2UsImRldGVjdERlYnVnIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL3N5c3RlbVwvanNcL3BvbHlmaWxsLmZpbHRlci5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiY29uZGl0aW9uYWwiOiJsdGUgSUUgOSIsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZSwiZGV0ZWN0RGVidWciOnRydWV9fSwiXC90b2x0ZWNhXC9hZG1pbmlzdHJhdG9yXC90ZW1wbGF0ZXNcL2lzaXNcL2pzXC90ZW1wbGF0ZS5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9qdWlcL2pzXC9odG1sNS5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiY29uZGl0aW9uYWwiOiJsdCBJRSA5IiwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19fSI7czozMjoiODMwZDU5NmQ5YzY2MTA2MWRlOWNkMGQxMjY5YTNlYzIiO3M6MjU3NToieyJcL3RvbHRlY2FcL21lZGlhXC9qdWlcL2pzXC9qcXVlcnkubWluLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJkZXRlY3REZWJ1ZyI6ZmFsc2UsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9qdWlcL2pzXC9qcXVlcnktbm9jb25mbGljdC5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9qdWlcL2pzXC9qcXVlcnktbWlncmF0ZS5taW4uanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImRldGVjdERlYnVnIjpmYWxzZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL3N5c3RlbVwvanNcL2NvcmUuanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZSwiZGV0ZWN0RGVidWciOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvanVpXC9qc1wvYm9vdHN0cmFwLm1pbi5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZGV0ZWN0RGVidWciOiIwIiwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL3N5c3RlbVwvanNcL211bHRpc2VsZWN0LmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJmcmFtZXdvcmsiOmZhbHNlLCJyZWxhdGl2ZSI6dHJ1ZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9zeXN0ZW1cL2pzXC9tb290b29scy1jb3JlLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJkZXRlY3REZWJ1ZyI6IjAiLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvc3lzdGVtXC9qc1wvbW9vdG9vbHMtbW9yZS5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZGV0ZWN0RGVidWciOiIwIiwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL3N5c3RlbVwvanNcL2NhbGVuZGFyLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWUsImRldGVjdERlYnVnIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL3N5c3RlbVwvanNcL2NhbGVuZGFyLXNldHVwLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWUsImRldGVjdERlYnVnIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL3N5c3RlbVwvanNcL3BvbHlmaWxsLmZpbHRlci5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiY29uZGl0aW9uYWwiOiJsdGUgSUUgOSIsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZSwiZGV0ZWN0RGVidWciOnRydWV9fSwiXC90b2x0ZWNhXC9hZG1pbmlzdHJhdG9yXC90ZW1wbGF0ZXNcL2lzaXNcL2pzXC90ZW1wbGF0ZS5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9qdWlcL2pzXC9odG1sNS5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiY29uZGl0aW9uYWwiOiJsdCBJRSA5IiwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19fSI7czozMjoiOTVkYjUxMmE1ZjI1MWM2ZDAwYmZkZTJmNTA4YWU5MGIiO3M6MzE4NDoieyJcL3RvbHRlY2FcL21lZGlhXC9zeXN0ZW1cL2pzXC9jb3JlLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWUsImRldGVjdERlYnVnIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL3N5c3RlbVwvanNcL21vb3Rvb2xzLWNvcmUuanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImRldGVjdERlYnVnIjoiMCIsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9zeXN0ZW1cL2pzXC9tb290b29scy1tb3JlLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJkZXRlY3REZWJ1ZyI6IjAiLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvanVpXC9qc1wvanF1ZXJ5Lm1pbi5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZGV0ZWN0RGVidWciOmZhbHNlLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvanVpXC9qc1wvanF1ZXJ5LW5vY29uZmxpY3QuanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZSwiZGV0ZWN0RGVidWciOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvanVpXC9qc1wvanF1ZXJ5LW1pZ3JhdGUubWluLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJkZXRlY3REZWJ1ZyI6ZmFsc2UsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9qdWlcL2pzXC9ib290c3RyYXAubWluLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJkZXRlY3REZWJ1ZyI6IjAiLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvc3lzdGVtXC9qc1wvY2FsZW5kYXIuanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZSwiZGV0ZWN0RGVidWciOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvc3lzdGVtXC9qc1wvY2FsZW5kYXItc2V0dXAuanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7InZlcnNpb24iOiJhdXRvIiwicmVsYXRpdmUiOnRydWUsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZSwiZGV0ZWN0RGVidWciOnRydWV9fSwiXC90b2x0ZWNhXC9tZWRpYVwvc3lzdGVtXC9qc1wvdmFsaWRhdGUuanMiOnsidHlwZSI6InRleHRcL2phdmFzY3JpcHQiLCJvcHRpb25zIjp7ImZyYW1ld29yayI6ZmFsc2UsInJlbGF0aXZlIjp0cnVlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWUsImRldGVjdERlYnVnIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL3N5c3RlbVwvanNcL3BvbHlmaWxsLmV2ZW50LmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJjb25kaXRpb25hbCI6Imx0IElFIDkiLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWUsImRldGVjdERlYnVnIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL3N5c3RlbVwvanNcL2tlZXBhbGl2ZS5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9zeXN0ZW1cL2pzXC9odG1sNWZhbGxiYWNrLmpzIjp7InR5cGUiOiJ0ZXh0XC9qYXZhc2NyaXB0Iiwib3B0aW9ucyI6eyJ2ZXJzaW9uIjoiYXV0byIsInJlbGF0aXZlIjp0cnVlLCJmcmFtZXdvcmsiOmZhbHNlLCJwYXRoT25seSI6ZmFsc2UsImRldGVjdEJyb3dzZXIiOnRydWUsImRldGVjdERlYnVnIjp0cnVlfX0sIlwvdG9sdGVjYVwvbWVkaWFcL3N5c3RlbVwvanNcL3BvbHlmaWxsLmZpbHRlci5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiY29uZGl0aW9uYWwiOiJsdGUgSUUgOSIsImZyYW1ld29yayI6ZmFsc2UsInBhdGhPbmx5IjpmYWxzZSwiZGV0ZWN0QnJvd3NlciI6dHJ1ZSwiZGV0ZWN0RGVidWciOnRydWV9fSwiXC90b2x0ZWNhXC9hZG1pbmlzdHJhdG9yXC90ZW1wbGF0ZXNcL2lzaXNcL2pzXC90ZW1wbGF0ZS5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19LCJcL3RvbHRlY2FcL21lZGlhXC9qdWlcL2pzXC9odG1sNS5qcyI6eyJ0eXBlIjoidGV4dFwvamF2YXNjcmlwdCIsIm9wdGlvbnMiOnsidmVyc2lvbiI6ImF1dG8iLCJyZWxhdGl2ZSI6dHJ1ZSwiY29uZGl0aW9uYWwiOiJsdCBJRSA5IiwiZnJhbWV3b3JrIjpmYWxzZSwicGF0aE9ubHkiOmZhbHNlLCJkZXRlY3RCcm93c2VyIjp0cnVlLCJkZXRlY3REZWJ1ZyI6dHJ1ZX19fSI7fX1zOjY6ImNvbmZpZyI7TjtzOjQ6InNoaW0iO047czo4OiJqbGF5b3V0cyI7Tjt9fXM6MTE6ImFwcGxpY2F0aW9uIjtPOjg6InN0ZENsYXNzIjoxOntzOjU6InF1ZXVlIjthOjA6e319fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=";', 1, 'ezequiel');
/*!40000 ALTER TABLE `tltc_session` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_tags
DROP TABLE IF EXISTS `tltc_tags`;
CREATE TABLE IF NOT EXISTS `tltc_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_tags: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_tags` DISABLE KEYS */;
INSERT INTO `tltc_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
	(1, 0, 0, 1, 0, '', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 678, '2017-09-12 09:07:43', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tltc_tags` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_template_styles
DROP TABLE IF EXISTS `tltc_template_styles`;
CREATE TABLE IF NOT EXISTS `tltc_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_template_styles: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_template_styles` DISABLE KEYS */;
INSERT INTO `tltc_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
	(4, 'beez3', 0, '0', 'Beez3 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.png","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
	(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
	(7, 'protostar', 0, '0', 'protostar - Default', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}'),
	(8, 'isis', 1, '1', 'isis - Default', '{"templateColor":"","logoFile":""}'),
	(9, 'tolteca', 0, '1', 'Tolteca - Predeterminado', '{"templateColor":"#a71026","templateBackgroundColor":"#f4f6f7","logoFile":"images\\/logo-eidus.png","sitetitle":"","sitedescription":"Aplicaciones web de la EIDUS","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"1"}');
/*!40000 ALTER TABLE `tltc_template_styles` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_ucm_base
DROP TABLE IF EXISTS `tltc_ucm_base`;
CREATE TABLE IF NOT EXISTS `tltc_ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_ucm_base: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_ucm_base` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_ucm_base` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_ucm_content
DROP TABLE IF EXISTS `tltc_ucm_content`;
CREATE TABLE IF NOT EXISTS `tltc_ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_access` int(10) unsigned NOT NULL DEFAULT '0',
  `core_params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_content_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `core_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `core_version` int(10) unsigned NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`(100)),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`(100)),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`(100)),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields';

-- Volcando datos para la tabla tolteca.tltc_ucm_content: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_ucm_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_ucm_content` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_ucm_history
DROP TABLE IF EXISTS `tltc_ucm_history`;
CREATE TABLE IF NOT EXISTS `tltc_ucm_history` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int(10) unsigned NOT NULL,
  `ucm_type_id` int(10) unsigned NOT NULL,
  `version_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `character_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_ucm_history: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_ucm_history` DISABLE KEYS */;
INSERT INTO `tltc_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
	(1, 1, 1, '', '2017-09-12 09:38:18', 678, 1765, 'fc29a27f0230ead7bb30ed1fb049757179994534', '{"id":1,"asset_id":56,"title":"Portada","alias":"portada","introtext":"<p>Portada de inicio<\\/p>","fulltext":"","state":1,"catid":"2","created":"2017-09-12 09:38:18","created_by":"678","created_by_alias":"","modified":"2017-09-12 09:38:18","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2017-09-12 09:38:18","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
	(2, 2, 1, '', '2017-09-14 08:56:32', 678, 1785, '5e610d658f6fcc58072e6488934454e139e6c6d8', '{"id":2,"asset_id":61,"title":"Panel de opciones","alias":"panel-de-opciones","introtext":"<p>Panel de opciones<\\/p>","fulltext":"","state":1,"catid":"2","created":"2017-09-14 08:56:32","created_by":"678","created_by_alias":"","modified":"2017-09-14 08:56:32","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2017-09-14 08:56:32","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"7","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
	(3, 2, 1, '', '2017-09-14 08:58:09', 678, 1804, 'af4a4a32989d3243cd86458e9ed507bc3cb8ae96', '{"id":2,"asset_id":"61","title":"Panel de opciones","alias":"panel-de-opciones","introtext":"<p>Panel de opciones<\\/p>","fulltext":"","state":1,"catid":"2","created":"2017-09-14 08:56:32","created_by":"678","created_by_alias":"","modified":"2017-09-14 08:58:09","modified_by":"678","checked_out":"678","checked_out_time":"2017-09-14 08:58:04","publish_up":"2017-09-14 08:56:32","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"2","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
	(4, 3, 1, '', '2017-09-14 09:06:43', 678, 1767, '5a870f86afd518c5439f0b6c98e4ee8e8ca1fb13', '{"id":3,"asset_id":62,"title":"Administrar","alias":"administrar","introtext":"<p>Administrar<\\/p>","fulltext":"","state":1,"catid":"2","created":"2017-09-14 09:06:43","created_by":"678","created_by_alias":"","modified":"2017-09-14 09:06:43","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2017-09-14 09:06:43","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"3","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
	(5, 2, 1, '', '2017-09-14 09:16:36', 678, 1823, 'eee633e43cf24e086416e8144fe1841ca7a51174', '{"id":2,"asset_id":"61","title":"Panel de opciones","alias":"panel-de-opciones","introtext":"<p>{loadmodule mod_custom,PO_Mi_Cuenta}<\\/p>","fulltext":"","state":1,"catid":"2","created":"2017-09-14 08:56:32","created_by":"678","created_by_alias":"","modified":"2017-09-14 09:16:36","modified_by":"678","checked_out":"678","checked_out_time":"2017-09-14 09:16:12","publish_up":"2017-09-14 08:56:32","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":3,"ordering":"1","metakey":"","metadesc":"","access":"2","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
	(6, 2, 1, '', '2017-09-15 10:06:44', 1, 2014, '77a1f614259dfe9f6f566709e5f14b547644286e', '{"id":2,"asset_id":"61","title":"Panel de opciones","alias":"panel-de-opciones","introtext":"<p>{loadmodule mod_custom,PO_Mi_Cuenta}{loadmodule mod_custom,PO_Mis_Cursos}{loadmodule mod_custom,PO_Usuarios}{loadmodule mod_custom,PO_Solicitudes_Cursos}{loadmodule mod_custom,PO_Cursos_Administrar}{loadmodule mod_custom,PO_Salir}<\\/p>","fulltext":"","state":1,"catid":"2","created":"2017-09-14 08:56:32","created_by":"678","created_by_alias":"","modified":"2017-09-15 10:06:44","modified_by":"1","checked_out":"1","checked_out_time":"2017-09-15 10:03:31","publish_up":"2017-09-14 08:56:32","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":4,"ordering":"1","metakey":"","metadesc":"","access":"2","hits":"39","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
	(7, 3, 1, '', '2017-09-15 10:11:33', 1, 1905, '30875653680352b44274010b0fcf1fa117a728f3', '{"id":3,"asset_id":"62","title":"Administrar","alias":"administrar","introtext":"<p>Administrar{loadmodule mod_custom,PO_Usuarios}{loadmodule mod_custom,PO_Solicitudes_Cursos}{loadmodule mod_custom,PO_Cursos_Administrar}<\\/p>","fulltext":"","state":1,"catid":"2","created":"2017-09-14 09:06:43","created_by":"1","created_by_alias":"","modified":"2017-09-15 10:11:33","modified_by":"1","checked_out":"1","checked_out_time":"2017-09-15 10:10:52","publish_up":"2017-09-14 09:06:43","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"3","hits":"5","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
	(8, 1, 1, '', '2017-09-18 08:25:20', 1, 2103, '3c1f5a6b189b4864f37826d5eecc8ca265a96003', '{"id":1,"asset_id":"56","title":"Portada","alias":"portada","introtext":"<p>Bienvenido a Tolteca, aplicaci\\u00f3n web para la gesti\\u00f3n de procesos de la Escuela Internacional de Doctorado.<\\/p>\\r\\n<p>Para la inscripci\\u00f3n cursos por favor, haz clic en el siguiente bot\\u00f3n<\\/p>\\r\\n<p><a href=\\"index.php?option=com_fabrik&amp;view=list&amp;listid=1&amp;Itemid=114\\" class=\\"btn btn-primary\\">Ver cursos<\\/a><\\/p>","fulltext":"","state":1,"catid":"2","created":"2017-09-12 09:38:18","created_by":"1","created_by_alias":"","modified":"2017-09-18 08:25:20","modified_by":"1","checked_out":"1","checked_out_time":"2017-09-18 08:22:07","publish_up":"2017-09-12 09:38:18","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"2","metakey":"","metadesc":"","access":"1","hits":"66","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0);
/*!40000 ALTER TABLE `tltc_ucm_history` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_updates
DROP TABLE IF EXISTS `tltc_updates`;
CREATE TABLE IF NOT EXISTS `tltc_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates';

-- Volcando datos para la tabla tolteca.tltc_updates: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_updates` DISABLE KEYS */;
INSERT INTO `tltc_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`, `extra_query`) VALUES
	(1, 1, 700, 'Joomla', '', 'joomla', 'file', '', 0, '3.8.0', '', 'https://update.joomla.org/core/sts/extension_sts.xml', '', '');
/*!40000 ALTER TABLE `tltc_updates` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_update_sites
DROP TABLE IF EXISTS `tltc_update_sites`;
CREATE TABLE IF NOT EXISTS `tltc_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites';

-- Volcando datos para la tabla tolteca.tltc_update_sites: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_update_sites` DISABLE KEYS */;
INSERT INTO `tltc_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`) VALUES
	(1, 'Joomla! Core', 'collection', 'https://update.joomla.org/core/list.xml', 1, 1507017696, ''),
	(2, 'Accredited Joomla! Translations', 'collection', 'https://update.joomla.org/language/translationlist_3.xml', 0, 0, ''),
	(3, 'Joomla! Update Component Update Site', 'extension', 'https://update.joomla.org/core/extensions/com_joomlaupdate.xml', 0, 0, ''),
	(4, 'WebInstaller Update Site', 'extension', 'https://appscdn.joomla.org/webapps/jedapps/webinstaller.xml', 0, 0, ''),
	(5, 'Fabrik31', 'collection', 'http://fabrikar.com/update/fabrik31/package_list.xml', 0, 0, ''),
	(6, 'JCE Editor Package', 'collection', 'https://cdn.joomlacontenteditor.net/updates/xml/pkg_jce.xml', 0, 0, '');
/*!40000 ALTER TABLE `tltc_update_sites` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_update_sites_extensions
DROP TABLE IF EXISTS `tltc_update_sites_extensions`;
CREATE TABLE IF NOT EXISTS `tltc_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';

-- Volcando datos para la tabla tolteca.tltc_update_sites_extensions: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_update_sites_extensions` DISABLE KEYS */;
INSERT INTO `tltc_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
	(1, 700),
	(2, 802),
	(2, 10002),
	(3, 28),
	(4, 10004),
	(5, 10044),
	(5, 10045),
	(6, 10053);
/*!40000 ALTER TABLE `tltc_update_sites_extensions` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_usergroups
DROP TABLE IF EXISTS `tltc_usergroups`;
CREATE TABLE IF NOT EXISTS `tltc_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_usergroups: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_usergroups` DISABLE KEYS */;
INSERT INTO `tltc_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
	(1, 0, 1, 16, 'Public'),
	(2, 1, 2, 13, 'Registered'),
	(8, 1, 14, 15, 'Super Users'),
	(10, 2, 9, 10, 'Estudiantes'),
	(11, 2, 3, 4, 'Administradores'),
	(12, 2, 5, 6, 'Comisión Académica'),
	(13, 2, 7, 8, 'Comisión de Doctorado'),
	(14, 2, 11, 12, 'Formadores');
/*!40000 ALTER TABLE `tltc_usergroups` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_users
DROP TABLE IF EXISTS `tltc_users`;
CREATE TABLE IF NOT EXISTS `tltc_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`(100)),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_users: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_users` DISABLE KEYS */;
INSERT INTO `tltc_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`) VALUES
	(1, 'Ezequiel', 'ezequiel', 'ezequiel@us.es', '$2y$10$Z2eg00j0iHUMCNT1vwXtnOTaC8PTQr0LiFqIh3SvjR/N2ax6eLgNm', 0, 1, '2017-09-12 09:07:43', '2017-10-03 08:01:32', '0', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, '', '', 0),
	(2, 'Pablo Dominguez', 'jdominguez10', 'jdominguez10@us.es', '$2y$10$CfZLDEqui3Tb65JjeozhHOXhhUEvXZCkL17Za0KAnynU1fBjQPvfy', 0, 0, '2017-09-14 09:25:18', '2017-09-14 09:29:12', '', '{}', '0000-00-00 00:00:00', 0, '', '', 0),
	(3, 'Rubén Tavero', 'rtavero', 'rtavero@us.es', '$2y$10$PAsPI5psh8FV3o4f/4z5s.QDX8/XuE5IT9BGQlGKqvsVzzQHTFBd.', 0, 0, '2017-09-14 09:29:07', '2017-09-14 09:31:29', '', '{}', '0000-00-00 00:00:00', 0, '', '', 0),
	(4, 'David Cánovas', 'davidc', 'davidc@us.es', '$2y$10$DBx7J7ZayjzqmXoQknuT8O5F84txveTUgFqnz6HZQH/eFUeX2betW', 0, 0, '2017-09-14 09:31:23', '2017-09-29 09:00:31', '', '{}', '0000-00-00 00:00:00', 0, '', '', 0),
	(5, 'Rosa Castaño Ortiz', 'mcastano1', 'mcastano1@us.es', '$2y$10$gh3ar1dP7pk7KeU8zdVrB.g8l/5SbFPhWC2OMlNcAusy1MtQKut6C', 0, 0, '2017-10-02 10:32:31', '2017-10-02 10:32:53', '', '{}', '0000-00-00 00:00:00', 0, '', '', 0),
	(6, 'Escuela Internacional de Doctorado de la Universidad de Sevilla', 'direccioneipd', 'direccioneipd@us.es', '$2y$10$zesSIOjlkHTbWKOXfY6LOuk3xvO77QaeNiD5KqYLtK7BzdJ1K8i02', 0, 0, '2017-10-02 11:26:55', '2017-10-02 11:45:58', '', '{}', '0000-00-00 00:00:00', 0, '', '', 0);
/*!40000 ALTER TABLE `tltc_users` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_user_keys
DROP TABLE IF EXISTS `tltc_user_keys`;
CREATE TABLE IF NOT EXISTS `tltc_user_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  UNIQUE KEY `series_2` (`series`),
  UNIQUE KEY `series_3` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_user_keys: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_user_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_user_keys` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_user_notes
DROP TABLE IF EXISTS `tltc_user_notes`;
CREATE TABLE IF NOT EXISTS `tltc_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_user_notes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_user_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_user_notes` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_user_profiles
DROP TABLE IF EXISTS `tltc_user_profiles`;
CREATE TABLE IF NOT EXISTS `tltc_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';

-- Volcando datos para la tabla tolteca.tltc_user_profiles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_user_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tltc_user_profiles` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_user_usergroup_map
DROP TABLE IF EXISTS `tltc_user_usergroup_map`;
CREATE TABLE IF NOT EXISTS `tltc_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_user_usergroup_map: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_user_usergroup_map` DISABLE KEYS */;
INSERT INTO `tltc_user_usergroup_map` (`user_id`, `group_id`) VALUES
	(1, 8),
	(1, 11),
	(2, 8),
	(2, 11),
	(3, 8),
	(3, 11),
	(4, 14),
	(5, 11),
	(6, 11);
/*!40000 ALTER TABLE `tltc_user_usergroup_map` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_utf8_conversion
DROP TABLE IF EXISTS `tltc_utf8_conversion`;
CREATE TABLE IF NOT EXISTS `tltc_utf8_conversion` (
  `converted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_utf8_conversion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_utf8_conversion` DISABLE KEYS */;
INSERT INTO `tltc_utf8_conversion` (`converted`) VALUES
	(2);
/*!40000 ALTER TABLE `tltc_utf8_conversion` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_viewlevels
DROP TABLE IF EXISTS `tltc_viewlevels`;
CREATE TABLE IF NOT EXISTS `tltc_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tolteca.tltc_viewlevels: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_viewlevels` DISABLE KEYS */;
INSERT INTO `tltc_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
	(1, 'Public', 0, '[1]'),
	(2, 'Registrado', 2, '[2,11,12,13,10,14,8]'),
	(3, 'Administrador', 3, '[8,11]'),
	(6, 'Super Users', 4, '[8]'),
	(7, 'Formador', 0, '[14]'),
	(9, 'Formadores y Administradores', 0, '[11,14]');
/*!40000 ALTER TABLE `tltc_viewlevels` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca.tltc_wf_profiles
DROP TABLE IF EXISTS `tltc_wf_profiles`;
CREATE TABLE IF NOT EXISTS `tltc_wf_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `users` text NOT NULL,
  `types` text NOT NULL,
  `components` text NOT NULL,
  `area` tinyint(3) NOT NULL,
  `device` varchar(255) NOT NULL,
  `rows` text NOT NULL,
  `plugins` text NOT NULL,
  `published` tinyint(3) NOT NULL,
  `ordering` int(11) NOT NULL,
  `checked_out` tinyint(3) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca.tltc_wf_profiles: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `tltc_wf_profiles` DISABLE KEYS */;
INSERT INTO `tltc_wf_profiles` (`id`, `name`, `description`, `users`, `types`, `components`, `area`, `device`, `rows`, `plugins`, `published`, `ordering`, `checked_out`, `checked_out_time`, `params`) VALUES
	(1, 'Default', 'Default Profile for all users', '', '1,2,11,12,13,10,14,8', '', 0, 'desktop,tablet,phone', 'help,newdocument,undo,redo,spacer,bold,italic,underline,strikethrough,justifyfull,justifycenter,justifyleft,justifyright,spacer,blockquote,formatselect,styleselect,removeformat,cleanup;fontselect,fontsizeselect,fontcolor,spacer,clipboard,indent,outdent,lists,sub,sup,textcase,charmap,hr;directionality,fullscreen,print,searchreplace,spacer,table,style,xhtmlxtras;visualaid,visualchars,visualblocks,nonbreaking,anchor,unlink,link,imgmanager,spellchecker,article', 'formatselect,styleselect,cleanup,fontselect,fontsizeselect,fontcolor,clipboard,lists,textcase,charmap,hr,directionality,fullscreen,print,searchreplace,table,style,xhtmlxtras,visualchars,visualblocks,nonbreaking,anchor,link,imgmanager,spellchecker,article,spellchecker,article,browser,contextmenu,inlinepopups,media,preview,source', 1, 1, 0, '0000-00-00 00:00:00', ''),
	(2, 'Front End', 'Sample Front-end Profile', '', '3,4,5', '', 1, 'desktop,tablet,phone', 'help,newdocument,undo,redo,spacer,bold,italic,underline,strikethrough,justifyfull,justifycenter,justifyleft,justifyright,spacer,formatselect,styleselect;clipboard,searchreplace,indent,outdent,lists,cleanup,charmap,removeformat,hr,sub,sup,textcase,nonbreaking,visualchars,visualblocks;fullscreen,print,visualaid,style,xhtmlxtras,anchor,unlink,link,imgmanager,spellchecker,article', 'charmap,contextmenu,inlinepopups,help,clipboard,searchreplace,fullscreen,preview,print,style,textcase,nonbreaking,visualchars,visualblocks,xhtmlxtras,imgmanager,anchor,link,spellchecker,article,lists,formatselect,styleselect,hr', 0, 2, 0, '0000-00-00 00:00:00', ''),
	(3, 'Blogger', 'Simple Blogging Profile', '', '3,4,5,6,8,7', '', 0, 'desktop,tablet,phone', 'bold,italic,strikethrough,lists,blockquote,spacer,justifyleft,justifycenter,justifyright,spacer,link,unlink,imgmanager,article,spellchecker,fullscreen,kitchensink;formatselect,styleselect,underline,justifyfull,clipboard,removeformat,charmap,indent,outdent,undo,redo,help', 'link,imgmanager,article,spellchecker,fullscreen,kitchensink,clipboard,contextmenu,inlinepopups,lists,formatselect,styleselect,textpattern', 0, 3, 0, '0000-00-00 00:00:00', '{"editor":{"toggle":"0"}}'),
	(4, 'Mobile', 'Sample Mobile Profile', '', '3,4,5,6,8,7', '', 0, 'tablet,phone', 'undo,redo,spacer,bold,italic,underline,formatselect,spacer,justifyleft,justifycenter,justifyfull,justifyright,spacer,fullscreen,kitchensink;styleselect,lists,spellchecker,article,link,unlink', 'fullscreen,kitchensink,spellchecker,article,link,inlinepopups,lists,formatselect,styleselect,textpattern', 0, 4, 0, '0000-00-00 00:00:00', '{"editor":{"toolbar_theme":"mobile","resizing":"0","resize_horizontal":"0","resizing_use_cookie":"0","toggle":"0","links":{"popups":{"default":"","jcemediabox":{"enable":"0"},"window":{"enable":"0"}}}}}'),
	(5, 'Markdown', 'Sample Markdown Profile', '', '6,7,3,4,5,8', '', 0, 'desktop,tablet,phone', 'fullscreen,justifyleft,justifycenter,justifyfull,justifyright,link,unlink,imgmanager,styleselect', 'fullscreen,link,imgmanager,styleselect,inlinepopups,media,textpattern', 0, 5, 0, '0000-00-00 00:00:00', '{"editor":{"toolbar_theme":"mobile"}}');
/*!40000 ALTER TABLE `tltc_wf_profiles` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca-fabrik.cursos
DROP TABLE IF EXISTS `cursos`;
CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `fecha_ini` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `horas` decimal(5,2) DEFAULT NULL,
  `documentacion` text,
  `organizador` int(11) DEFAULT NULL,
  `horario` varchar(255) DEFAULT NULL,
  `lugar` varchar(255) DEFAULT NULL,
  `inscripcion` varchar(255) DEFAULT NULL,
  `plazas` int(11) DEFAULT NULL,
  `plazo_inscripcion` text,
  PRIMARY KEY (`id`),
  KEY `fb_groupby_titulo_INDEX` (`titulo`(10))
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca-fabrik.cursos: 2 rows
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` (`id`, `date_time`, `titulo`, `descripcion`, `fecha_ini`, `fecha_fin`, `horas`, `documentacion`, `organizador`, `horario`, `lugar`, `inscripcion`, `plazas`, `plazo_inscripcion`) VALUES
	(1, '2017-09-12 11:05:06', 'EMBO Workshop in Research Integrity', '<p>In the last few years the European Molecular Biology Organization (EMBO) has been increasingly involved in providing scientists with the parameters of the responsible conduct of research. We have organized a one-day workshop, in which EMBO will discuss with the participants issues such as research integrity in the writing and publication of research results, the roles of scientists in society, data management, the responsibilities of supervisors, conflicts of interests and research involving animals. The workshop will include practical scenarios and examples and it is open to PhD students, postdocs and principal investigators, who are active in research.</p>\r\n<p>Participation is free of charge, but registration is required.</p>\r\n<p>The EMBO officers also offer to meet senior staff members (senior PIs, heads of depts. and/or of institutes) in informal small meetings to discuss issues related to research integrity. These meetings will be held on Friday 27th October in the morning and can be arranged in advance by e-mailing David Cánovas at <a href="mailto:davidc@us.es">davidc@us.es</a>.</p>\r\n<p>Maximum number of participants: 30</p>\r\n<div class="alert-error alert">Registration closed. Maximum number of participants exceeded. Selection of participants will be undertaken</div>', '2017-10-26 00:00:00', '2017-10-26 00:00:00', 8.00, NULL, 4, '9.00 a 17.00 h', 'Salón de Actos del Pabellón de México', '', 30, 'cerrado'),
	(3, '2017-10-02 10:33:21', 'Jornada informativa sobre Doctorado Industrial', '<p>El día <strong>18 de octubre a las 17h</strong> en el Salón de Actos del Pabellón de México, la EIDUS organizará una jornada sobre&nbsp;<strong>Doctorado Industrial.&nbsp; </strong>No se trata sólo de la colaboración con empresas, sino también con administraciones públicas, por lo que también pueden participar los alumnos de humanidades.</p>\r\n<p>En el acto, impartirá una conferencia sobre Doctorado Industrial la Dra Olga Martín Directora de la Escuela de Doctorado de Lérida, experta en la materia y Presidenta de la Conferencia de Directores de Escuelas de Doctorado de España. Posteriormente habrá una mesa redonda a la que han confirmado su asistencia los vicerrectores de Investigación y de Internacionalización de la US, así como el Director General de Transferencia del Conocimiento de la US, la Directora General de Universidades, y el Director General de Investigación y Transferencia del Conocimiento de la Junta de Andalucía, la Presidenta del Consejo Social de la US, y el Director General de Corporación Tecnológica de Andalucía (CTA)</p>\r\n<p>Creemos que es una gran oportunidad para conocer y potenciar esta mención del doctorado que acerca la universidad a la empresa e instituciones públicas, y en definitiva a la sociedad.</p>\r\n<p>En la Jornada se explicarán los procedimientos para obtenerlo y las becas y ayudas ofertadas por los distintos organismos estatales y locales a las que podemos optar.</p>\r\n<p>A los alumnos asistentes se les emitirá, si así lo desean, un certificado de participación que podrá servirles como parte de la formación transversal. Habrá para ello una hoja de firmas en el salón de actos.<br /><br /></p>\r\n<p>Anexo:</p>\r\n<p>Artículo 15 del Real Decreto 195/2016 (<a>https://www.boe.es/buscar/</a><wbr /><a>doc.php?id=BOE-A-2016-5339</a>) en el que se establecen los requisitos para la expedición del Suplemento Europeo al Título Universitario de Doctor:</p>\r\n<p><em>«Artículo 15 bis. Mención Industrial en el título de Doctor.</em><br /><em>1. Se otorgará la mención “Doctorado Industrial” siempre que concurran las siguientes circunstancias:</em><br /><em>a) La existencia de un contrato laboral o mercantil con el doctorando. El contrato se podrá celebrar por una&nbsp;<strong>empresa del sector privado o del sector público, así como por una Administración Pública.</strong></em><br /><em>b) El doctorando deberá participar en un proyecto de investigación industrial o de desarrollo experimental que se desarrolle en la empresa o Administración Pública en la que se preste el servicio, que no podrá ser una Universidad. El proyecto de investigación industrial o de desarrollo experimental en el que participe el doctorando tiene que tener relación directa con la tesis que realiza. Esta relación directa se acreditará mediante una memoria que tendrá que ser visada por la Universidad.</em><br /><em>2. En el caso de que el proyecto de investigación industrial o de desarrollo experimental se ejecute en colaboración entre la Universidad y la empresa o Administración Pública en la que preste servicio el doctorando, se suscribirá un convenio de colaboración marco con entre las partes. En este convenio se indicarán las obligaciones de la Universidad y las obligaciones de la empresa o Administración Pública, así como el procedimiento de selección de los doctorandos.</em><br /><em>El doctorando tendrá un tutor de tesis designado por la Universidad y un responsable designado por la empresa o Administración Pública, que podrá ser, en su caso, Director de la tesis de acuerdo con la normativa propia de Doctorado.»</em></p>', '2017-10-18 00:00:00', '2017-10-18 00:00:00', 2.50, NULL, 6, '17:00 - 19:30', 'Salón de Actos del Pabellón de México', '', 120, 'abierto');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca-fabrik.cursos_repeat_documentacion
DROP TABLE IF EXISTS `cursos_repeat_documentacion`;
CREATE TABLE IF NOT EXISTS `cursos_repeat_documentacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `documentacion` text,
  `params` text,
  PRIMARY KEY (`id`),
  KEY `fb_parent_fk_parent_id_INDEX` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca-fabrik.cursos_repeat_documentacion: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `cursos_repeat_documentacion` DISABLE KEYS */;
INSERT INTO `cursos_repeat_documentacion` (`id`, `parent_id`, `documentacion`, `params`) VALUES
	(7, 1, '\\images\\files\\announcement_EMBO-Integrity_session.pdf', NULL),
	(8, 1, '\\images\\files\\Illustrator_EMBO-integrity_2017_Sevilla_1.pdf', NULL);
/*!40000 ALTER TABLE `cursos_repeat_documentacion` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca-fabrik.programas
DROP TABLE IF EXISTS `programas`;
CREATE TABLE IF NOT EXISTS `programas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `denominacion` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `isced1` varchar(255) DEFAULT NULL,
  `isced2` varchar(255) DEFAULT NULL,
  `web` varchar(255) DEFAULT NULL,
  `plan` text,
  `centro_administrativo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca-fabrik.programas: 0 rows
/*!40000 ALTER TABLE `programas` DISABLE KEYS */;
/*!40000 ALTER TABLE `programas` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca-fabrik.solicitudes_cursos
DROP TABLE IF EXISTS `solicitudes_cursos`;
CREATE TABLE IF NOT EXISTS `solicitudes_cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `perfil` text,
  `email` varchar(255) DEFAULT NULL,
  `centro` varchar(255) DEFAULT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `grupo` varchar(255) DEFAULT NULL,
  `motivacion` text,
  `organismos` text,
  `curso` int(11) DEFAULT NULL,
  `respuesta` text,
  `admision` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_join_fk_curso_INDEX` (`curso`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca-fabrik.solicitudes_cursos: 65 rows
/*!40000 ALTER TABLE `solicitudes_cursos` DISABLE KEYS */;
INSERT INTO `solicitudes_cursos` (`id`, `date_time`, `nombre`, `apellidos`, `perfil`, `email`, `centro`, `departamento`, `grupo`, `motivacion`, `organismos`, `curso`, `respuesta`, `admision`) VALUES
	(6, '2017-09-20 13:45:57', 'Juan José ', 'Toledo Aral', '["PhD student","PI"]', 'juanjo@us.es', 'Facultad de Medicina/IBiS', 'Fisiología Médica y Biofísica', 'CTS-517', 'Director de Departamento, Coordinador de Área en IBiS y miembro de la Comisión de Investigación. Trata con temas de ética científica.', 'Humanos y roedores.', 1, NULL, NULL),
	(5, '2017-09-20 13:16:46', 'Alberto', 'Pascual Bravo', '["PI"]', 'apascual-ibis@us.es', 'Hospital Universitario Virgen del Rocío/CSIC/Universidad de Sevilla', 'Instituto de Biomedicina de Sevilla (IBiS)', 'Mechanisms of neuronal maintenance', 'To learn about the responsibilities that we have as PIs regarding ethics in Science and how to establish good practices in the lab.', 'Drosophila and Mouse', 1, NULL, NULL),
	(7, '2017-09-21 10:07:04', 'Yolanda María', 'Pacheco López', '["PI"]', 'ypacheco-ibi@us.es', 'Hospital Universitario Virgen del Rocío', 'Instituto de Biomedicina de Sevilla', 'Laboratorio de Inmunovirología', 'El tema me parece de gran interés', 'Muestras de sangre y de tejido humanos \r\nCultivos celulares primarios (humanos)', 1, NULL, NULL),
	(8, '2017-09-21 13:58:38', 'Sonia ', 'Pinela da Silva', '["Postdoc"]', 'sonia.pinela@cabimer.es', 'CABIMER', 'Genome Biology', 'Andres Aguilera', 'As a postdoc researcher, it is essential to be active and updated in the field of Research Integrity. The discussion of the major challenges and conduct in the field of scientific research nowadays are central to our work and to be able to produce significant and reliable data and publications, stimulate meaningful and positive scientific and social discussion. Theses are, in my view, imperative if we want to produce knowledge and be able to sustain research as an essential tool of progress in all fields being it environment, health, finance, socio-cultural. etc. ', 'Human tumoral cell lines, yeast, bacteria', 1, NULL, NULL),
	(9, '2017-09-21 16:46:59', 'LUCIA', 'ROMERO AZOGIL', '["PhD student"]', 'lrazogil@us.es', 'FACULTAD DE FARMACIA', 'QUIMICA ORGANICA Y FARMACEUTICA', 'CARBOHIDRATOS Y POLIMEROS', '', 'UNIVERSIDAD DE SEVILLA', 1, NULL, NULL),
	(10, '2017-09-21 16:54:25', 'Anabell ', 'Urbina Salazar ', '["PhD student"]', 'gata-any@hotmail.com', 'Facultad de Farmacia ', 'Bioquímica y Biología Molecular ', 'AGR-0258', 'Aprender todo lo relacionado con la investigación. ', 'Bacillus licheniformis', 1, NULL, NULL),
	(11, '2017-09-21 16:59:56', 'Alberto Renato ', 'Inca Torres ', '["PhD student"]', 'creny_11@hotmail.com', 'Facultad de Farmacia ', 'Bioquimica y Biología Molecular ', 'AGR - 0258', 'Incrementar mis conocimientos en todo el área investigativa ', 'Bacillus licheniformis ', 1, NULL, NULL),
	(12, '2017-09-22 07:54:12', 'XI', 'DANG', '["PhD student"]', 'dancer0906@gmail.com', 'Universo de Sevilla (Hospital Virgen del Rocío, IBIS)', 'Cirugía ', 'Análisis observacional para evaluar la eficacia y seguridad de los mTORi en la esfera oncológica en el paciente trasplantado hepaático', '', 'Research involving animals.', 1, NULL, NULL),
	(13, '2017-09-22 08:02:42', 'Emilia', 'Naranjo Fernández', '["PhD student"]', 'eminaranjo@us.es', 'Facultad de Farmacia', 'Microbiología y Parasitología', 'BIO320 Biostabilizadores de Origen Microbiano. Joaquín J. Nieto', 'Este curso me completa mis estudios de doctorado', 'Bacterias', 1, NULL, NULL),
	(14, '2017-09-22 08:02:05', 'Rosa María', 'García Valero', '["PhD student"]', 'rgarcia5@us.es', 'Universidad de Sevilla', 'Microbiología y Parasitología', 'Grupo PAIDI: BIO320 (Joaquín Nieto)', 'Creo que este curso encaja por completo en mi formación como doctoranda.', 'Bacterias, cultivos celulares y roedores.', 1, NULL, NULL),
	(15, '2017-09-22 08:02:25', 'Lourdes', 'Martinez', '["PhD student"]', 'loumarmar91@gmail.com', 'Facultad de Farmacia. Universidad de Sevilla', 'Microbiología y Parasitología', 'BIO320 (Joaquín J. Nieto Gutiérrez)', 'Este curso me dotará nuevos conocimientos para la realización de mi doctorado y competencias para el ámbito investigador.', 'Bacteria.', 1, NULL, NULL),
	(16, '2017-09-22 08:09:38', 'Cristina', 'Sanchez-Porro', '["PhD student","PI"]', 'sanpor@us.es', 'Facultad de Farmacia', 'Microbiología y Parasitología', 'Microorganismos halófilos (BIO213)', '', 'Environmental microorganisms', 1, NULL, NULL),
	(17, '2017-09-22 08:18:24', 'Christian', 'Rosales Barrios', '["PhD student"]', 'christianrosalesbarrios@gmail.com', 'Instituto de Investigaciones Químicas (cicCartuja)', 'Química Orgánica y Biológica', 'Síntesis asimétrica y nanosistemas funcionales', '', 'CSIC, CABIMER, IBIS', 1, NULL, NULL),
	(18, '2017-09-22 08:17:27', 'Elena', 'Romero Ben', '["PhD student"]', 'eleromben@gmail.com', 'Instituto de Investigaciones Química Isla de la Cartuja. CSIC', 'Química Orgánica y Biológica', 'Síntesis asimétrica y Nanosistemas Funcionales', '', 'Consejo Superior de Investigaciones Científicas', 1, NULL, NULL),
	(19, '2017-09-22 08:30:20', 'Rocío', 'Martínez de Pablos', '["PhD student","PI"]', 'depablos@us.es', 'Facultad de Farmacia', 'Bioquímica y Biología Molecular', 'Bio113 (José Luis Venero y Rocío Martínez)', 'Me gustaría trasladar al resto del grupo la información recibida en el workshop, ya que trabajamos con muchos animales con procedimientos a veces moderados/severos', 'Mice and rats', 1, NULL, NULL),
	(20, '2017-09-22 08:33:53', 'DIEGO', 'RUANO CABALLERO', '["PI"]', 'ruano@us.es', 'Instituto de Biomedicina de Sevilla', 'Bioquímica y Biología Molecular', 'Diego Ruano', '', 'Rat', 1, NULL, NULL),
	(21, '2017-09-22 09:14:54', 'María', 'Ortego Domínguez', '["PhD student"]', 'modguez_92@hotmail.com', 'Facultad de Medicina', 'Fisiología Médica y Biofísica', 'Biofísica Celular', 'Interés por conocer más acerca de los límites éticos de la investigación (ya sea en humanos como en animales), así como la metodología y organismos encargados de dicha ética. ', 'Rata (cepa Wistar, Rattus norvergicus)', 1, NULL, NULL),
	(22, '2017-09-22 09:27:33', 'Clara', 'Muñoz Castro', '["PhD student"]', 'claramc19@gmail.com', ' Facultad de Farmacia.', 'Departamento de Bioquímica y Biología Molecular.', 'Javier Vitorica', 'Considero la Ética un aspecto esencial en nuestras vidas, y por lo tanto, debe considerarse en toda investigación científica. Teniendo en cuenta la existencia de diversos dilemas éticos en el ámbito de las ciencias, asistir a un workshop sobre este tema puede ser de gran utilidad en el día a día de cualquier investigador y contribuir, en consecuencia, a una adecuada formación de los doctorandos.\r\n', 'Universidad de Sevilla. \r\nInsituto de Biomedicina de Sevilla (IBiS).', 1, NULL, NULL),
	(23, '2017-09-22 08:37:34', 'María Pilar', 'Puerto Camacho', '["PhD student"]', 'mpilarpuertocamacho@gmail.com', 'Instituto de Biomedicina de Sevilla (IBiS)', 'Oncohematology and Genetic Area', 'Molecular Pathology of Sarcoma and other ', 'Currently, scientific misconduct is appearing more freqquently than expected in the news. This scary situation must be struggled by ethical education to the scientific community. As a second-year PhD student, attending this workshop would be of great value.for my oersonal scientific career ', 'Human tumour cell lines and mice', 1, NULL, NULL),
	(24, '2017-09-22 09:27:03', 'MARIA VIRTUDES', 'SANCHEZ MICO', '["PhD student"]', 'marsanmic@gmail.com', 'Facultad de Farmacia', 'Departamento de Bioquímica y Biología Molecular', 'Javier Vitorica', 'La asistencia a este workshop sería muy útil en mi carrera investigadora, debido a la carencia de este tipo de cursos y enseñanzas, en general. Hoy en día, es muy importante que los investigadores tengan buenas conductas en la investigación, y conozcan los límites éticos y las buenas prácticas necesarias a la hora de trabajar en un laboratorio de investigación, y esta enseñanza no se nos ha transmitido a los doctorandos en ningún momento en nuestra educación hasta ahora, con lo que considero que esta es la mejor oportunidad, pudiendo aprender de investigadores y especialistas con gran experiencia en este aspecto. ', 'Universidad de Sevilla\r\nInstituto de Biomedicina de Sevilla (IBiS)', 1, NULL, NULL),
	(25, '2017-09-22 09:16:02', 'MARÍA DEL CARMEN', 'NARANJO GUTIÉRREZ', '["PhD student"]', 'cnaranjo@us.es', 'Facultad de Medicina / Instituto de Biomedicina de Sevilla-IBIS', 'Bioquímica Médica y Biología Molecular e Inmunología', 'Neuroendocrinología Molecular (PAI-CTS 0160) ', 'Los temas que se tratarán en esta jornada redundan directamente en mi formación como investigadora, ampliando y actualizando mis conocimientos sobre la ética y las buenas prácticas en la investigación.', 'Ratas, ratones y humanos', 1, NULL, NULL),
	(26, '2017-09-22 09:35:02', 'Helena', 'Domínguez Martín', '["PhD student"]', 'hdominguez-ibis@us.es', 'Facultad de Farmacia', 'Bioquímica y Biología Molecular', 'Javier Vitorica', 'Al estar trabajando en investigación científica aplicada a la biomedicina, con modelos animales en rata y ratón, creo que es de suma importancia tener claros los límites y valores éticos y morales en los cuales debemos basarnos a la hora de tomar ciertas decisiones.\r\nEs algo que, si se trata durante la formación universitaria, suele ser someramente, y es de esperar que el estudiante tenga ya una integridad moral de base; pero al enfrentarte al día a día de la investigación con animales se echan en falta ciertas pautas y consejos que deben continuar recordándose a lo largo de la carrera investigadora.\r\nEs por ello que me resulta de sumo interés este curso, el cual considero necesario e indispensable para todo aquel que trabaje en este tipo de campos.', 'Cultivos celulares, rata (Rattus norvergicus) y ratón (Mus musculus).', 1, NULL, NULL),
	(27, '2017-09-22 09:56:57', 'Helena', 'García Moreno', '["PhD student"]', 'helgarmor@alum.us.es', 'Facultad de Medicina ', 'Bioquimica Médica y Biología Molecular e Inmunología ', 'Neuroendocrinología Molecular (PAI-CTS 0160)', 'Creo que la ética en todos los ámbitos de la vida es importante y mucho más si hablamos de investigación. Puesto que los trabajos de investigación suelen estar cercanos a los límites de la ética así como estar más adelantados a las corrientes de pensamientos de la sociedad, es por ello interesante conocer esta materia con toda la profundidad posible. ', 'Cultivos celulares de mastocitos RBL-2H3.', 1, NULL, NULL),
	(28, '2017-09-22 10:12:04', 'Ana', 'Durán Viseras', '["PhD student"]', 'anaduran@us.es', 'Facultad de Farmacia', 'Microbiología y Parasitología', 'Microorganismos Halófilos', '', 'Microorganismos', 1, NULL, NULL),
	(29, '2017-09-22 10:20:40', 'OLGA', 'RODRÍGUEZ-GALÁN ', '["PhD student","Postdoc"]', 'olgarg@us.es', 'INSTITUTO DE BIOMEDICINA DE SEVILLA', 'GENETICA', 'JESÚS DE LA CRUZ DÍAZ', 'ENCUENTRO ESTAS JORNADAS SOBRE ÉTICA EN INVESTIGACIÓN MUY INTERESANTES Y ÚTILES. CONSIDERO QUE LA COMUNIDAD CIENTÍFICA TENEMOS UNA RESPONSABILIDAD CON LA SOCIEDAD EN CUANTO A LA VERACIDAD, TRANSPARENCIA Y DIVULGACIÓN DE LOS RESULTADOS QUE OBTENEMOS EN NUESTRA INVESTIGACIÓN, ASÍ COMO DEL USO QUE HACEMOS DE LOS RECURSOS QUE DICHA SOCIEDAD NOS FACILITA.\r\nPOR TANTO, LA FORMACIÓN DE LOS INVESTIGADORES EN ÉTICA ES ESENCIAL.', 'LEVADURAS', 1, NULL, NULL),
	(30, '2017-09-22 08:57:37', 'Pablo', 'del Cerro Sánchez', '["PhD student"]', 'pdelcerro@us.es', 'Facultad de Biología - Universidad de Sevilla', 'Microbiología', 'Francisco Javier Ollero Márquez (Biotecnologia de la Interacción Planta-Microorganismo Beneficiosos)', 'Me parece interesante la temática del curso. En la investigación se presiona mucho a los grupos por publicar y en algunos casos, se consigue que estas personas no cumplan con los requerimientos éticos y experimentales que conlleva la investigación.', 'Sinorhizobium/Rhizobium (Bacteria)\r\nEscherichia coli (Bacteria)\r\nPhaseolus vulgaris (Leguminous plant)\r\nLotus (Leguminous plant)', 1, NULL, NULL),
	(31, '2017-09-22 10:44:57', 'Pilar', 'Navarro Gómez', '["PhD student"]', 'pnavarro2@us.es', 'Facultad de biología, Universidad de Sevilla', 'Microbiología', 'AGR162: Unidad de producción y evaluación de inoculantes para leguminosas de grano.', 'Conocer y profundizar más en el mundo de la ciencia. Saber cual es la manera correcta de hacer las cosas para alcanzar los objetivos perseguidos .', 'Rizobios (S.fredii HH103)\r\nE.coli ', 1, NULL, NULL),
	(32, '2017-09-22 10:50:24', 'LORENZO GABRIEL', 'BORREGO SANCHEZ DE LA CUESTA', '["PhD student"]', 'gabrielbsc@us.es', 'FACULTAD DE FARMACIA', 'QUIMICA ORGANICA Y FARMACEUTICA', 'INMACULADA FERNANDEZ FERNANDEZ', '', 'CHEMISTRY', 1, NULL, NULL),
	(33, '2017-09-22 10:38:53', 'Sara', 'Martín Villanueva', '["PhD student"]', 'saramarvi@msn.com', 'Instituto de Biomedicina de Sevilla', 'Departamento de Genética', 'Jesús de la Cruz Díaz', 'Como estudiante de doctorado, creo que es esencial adoptar buenas conductas en el laboratorio desde el inicio de la carrera investigadora por lo que es necesario participar en cursos como este para tener conocimiento de los aspectos éticos en investigación. ', 'Levadura (Saccharomyces cerevisiae)', 1, NULL, NULL),
	(34, '2017-09-22 12:08:06', 'NABILA', 'NAITLHO', '["PhD student"]', 'poichicha86@hotmail.fr', 'Facultad de farmacia', 'Farmacia y tecnología farmacéutica', 'CTS-214', '', 'laboratorio de farmacia y tecnología farmacéutica, laboratorio de química, CITIUS', 1, NULL, NULL),
	(35, '2017-09-22 12:46:49', 'Emanuela', 'Tumini', '["PhD student","Postdoc"]', 'emanuela.tumini@cabimer.es', 'CABIMER', 'Genome biology', 'Andrés Aguilera', 'I am really interested in the topic, indeed I think that the importance of ethical issues is growing bigger and bigger nowdays for the scientific community', 'Tumoral human cell lines', 1, NULL, NULL),
	(36, '2017-09-22 10:21:40', 'Victoria', 'Begley', '["PhD student"]', 'vbegley@us.es', 'Instituto de Biomedicina de Sevilla', 'Genética', 'Sebastián Chávez de Diego', 'I would like to attend this workshop because I am interested in the subject and I think that the proposed talks will give me a better understanding on how the scientific world works. ', 'Budding yeast and bacteria.', 1, NULL, NULL),
	(37, '2017-09-22 14:31:19', 'Alejandro', 'Herrera Delgado', '["PI"]', 'alejandrohd92@hotmail.com', 'Facultad de Biología, Universidad de Sevilla', 'Fisiología', 'Laboratorio de Fisiología y Plasticidad Neuronal (BIO-297)', 'As a researcher working with animals, I am extremely motivated in giving the highest respect to every animal. Ethics in research is a topic as important as controversial, and that\'s why i am specially interested in this seminar.', 'Rat', 1, NULL, NULL),
	(38, '2017-09-22 15:59:32', 'ESTEFANIA', 'CABALLANO INFANTES', '["Postdoc"]', 'estcabinf@gmail.com', 'CABIMER', 'REGENERACIÓN DE LA CÉLULA BETA', 'FRANCISCO BEDOYA', 'FORMACIÓN Y DIVULGACIÓN', 'PÚBLICOS', 1, NULL, NULL),
	(39, '2017-09-22 22:12:37', 'Claudia', 'Reyes Goya', '["PhD student"]', 'claudia.crg.93@hotmail.com', 'Facultad de Farmacia. Universidad de Sevilla.', 'Fisiología', 'CTS584 Fisiopatología Cardiovascular', 'I am a PhD student, I am working in Pathophysiology and Biochemistry of some cardiovascular diseases, using an animal model (wistar rats). For this reason, I am interested in attending to this workshop so I can learn more about ethics in research.', 'Male Wistar rats ', 1, NULL, NULL),
	(40, '2017-09-23 11:12:30', 'CARLOS', 'JIMÉNEZ CORTEGANA', '["PhD student"]', 'carlosjcortegana@hotmail.com', 'FACULTAD DE MEDICINA, UNIVERSIDAD DE SEVILLA', 'BIOQUÍMICA MÉDICA Y BIOLOGÍA MOLECULAR E INMUNOLOGÍA', 'VÍCTOR SÁNCHEZ MARGALET', 'La ética en la investigación a nivel de ciencias de la salud es un tema bastante importante y que se debe tratar en cursos como este.', 'Células mononucleares de sangre periférica extraídas de la sangre de pacientes con cáncer.', 1, NULL, NULL),
	(41, '2017-09-24 18:14:02', 'Amanda', 'Páez Tudela', '["PhD student"]', 'podoamanda@gmail.com', 'Facultad de Enfermería, Fisioterapia y Podología', 'Podología', 'Podología', 'Ampliar los conocimientos sobre la ética en la investigación para mejorar mi proyecto de tesis doctoral.', 'Trabajo tanto con la Universidad de Sevilla, así como con el Centro Andaluz de Medicina del Deporte (CAMD)', 1, NULL, NULL),
	(42, '2017-09-25 14:39:39', 'Xenia', 'Peñate Salas', '["PhD student","Postdoc"]', 'xenia@us.es', 'IBIS', 'Dpto. de Oncohematología y Genética', 'Sebastián Chávez', 'We all have the general idea of what it takes to be ethic, but I would like to learn more in detail what should I do to be a better scientist.', 'Saccharomyces cerevisiae, human cells', 1, NULL, NULL),
	(43, '2017-09-25 21:57:27', 'Concepción', 'Medrano Padial', '["PhD student"]', 'conchimedrano@gmail.com', 'Facultad de Farmacia', 'Nutrición y Bromatología, Toxicología y Medicina Legal.', 'Área de Toxicología.', '', 'Universidad de Sevilla.', 1, NULL, NULL),
	(44, '2017-09-26 06:37:55', 'Beatriz', 'Castejón Vega', '["PhD student"]', 'beacastej92@outlook.es', 'Facultad de Odontología Universidad de Sevilla', 'Estomatología', 'Pedro Bullón, Mario Cordero', 'Soy alumna de doctorado en Ciencias de la Salud estudiando Enfermedades Raras para la búsqueda de un remedio, para ello trabajo con ratones y me es muy importante conocer la ética en la investigación.', 'Ratones, C.elegans y células humanas.', 1, NULL, NULL),
	(45, '2017-09-26 08:35:32', 'khadija', 'Tayara', '["PhD student"]', 'kh.tayara@yahoo.com', 'Facultad de Farmacia', 'bioquimica y biologia molecular', 'Jose Luis Venero', 'I would love to attend such workshop in order to widen my knowledge .\r\nIt will be beneficial for me to get useful tips about research, publications and how to convert the raw data that we get from our experiments into useful data that have a meaning.  ', 'cell lines and mice', 1, NULL, NULL),
	(46, '2017-09-26 08:56:30', 'Changhai', 'Liu', '["PhD student"]', 'dr.changhai.liu@qq.com', 'University sevilla, hospital Virgen del Rocio, Instituto biomedicina de sevilla ', 'Medicina', 'Manuel Romero-Gomez', '', 'liver ', 1, NULL, NULL),
	(47, '2017-09-26 09:25:05', 'Mercedes', 'Cano Rodríguez', '["PhD student","PI"]', 'mmcano@us.es', 'Facultad de Farmacia', 'Fisiología', 'Bioquímica del envejecimiento', 'I am interested in the responsibility of the researcher in the management of experimental animals, as well as to know the possible errors that are mentioned in this work', 'rats', 1, NULL, NULL),
	(48, '2017-09-26 12:48:54', 'Julio Luis', 'Madrid Rondón', '["PhD student","PI"]', 'julumaro@hotmail.com', 'Pabellón DE Mejico', 'BmBim', 'Biología Molecular e Investigación Clinica', '', 'EMBO', 1, NULL, NULL),
	(49, '2017-09-26 12:51:31', 'ALMUDENA', 'LORENZO MUÑOZ', '["PhD student"]', 'almfisioterapeuta@gmail.com', 'CENTRO DOCENTE DE FISIOTERAPIA Y PODOLOGÍA', 'DEPARTAMENTO DE FISIOTERAPIA', 'FISIOTERAPIA. UNIVERSIDAD DE SEVILLA', '', 'ASOCIACIÓN DE PACIENTES CON ACCIDENTE CEREBROVASCULAR. \r\nILUSTRE COLEGIO PROFESIONAL DE FISIOTERAPEUTAS DE ANDALUCÍA.\r\nUNIVERSIDAD DE SEVILLA. ', 1, NULL, NULL),
	(50, '2017-09-26 13:14:59', 'Julio Luis', 'Madrid Rondón', '["PhD student"]', 'julumaro@hotmail.com', 'Hospital Maternal. Virgen del Rocío', 'Investigación clínica', 'Biología Molecular e investigación clínica', 'Para completar el PI.', 'Universidad Sevilla', 1, NULL, NULL),
	(51, '2017-09-26 13:18:16', 'Julio Luis', 'Madrid Rondón', '["PhD student"]', 'julumaro@hotmail.com', 'Hospital Maternal. Virgen del Rocío', 'Investigación clínica', 'Biología Molecular e investigación clínica', 'Para completar el PI.', 'Universidad Sevilla', 1, NULL, NULL),
	(52, '2017-09-26 13:28:21', 'Hayat', 'Heluani Gahete', '["PhD student"]', 'hayatheluani@gmail.com', 'CABIMER', 'Biología del Genoma', 'Plasticidad mitocondrial y replicación', 'Complementar mi formación como estudiante predoctoral y como investigadora', 'Saccharomyces cerevisiae', 1, NULL, NULL),
	(53, '2017-09-26 15:38:38', 'Leticia', 'Diez-Quijada Jiménez', '["PhD student"]', 'ldiezquijada@us.es', 'Facultad de Farmacia', 'Nutrición y Bromatología, Toxicología y Medicina Legal', 'Toxicología', '', 'Cell lines ', 1, NULL, NULL),
	(54, '2017-09-26 15:47:02', 'Paula', 'Sánchez-Moreno', '["PhD student"]', 'paula.s.m.1987@gmail.com', 'Hospital Virgen del Rocío/IBIS', 'IBIS/Inmunología pediátrica', 'Dr Olaf NEth', '', 'Microbiota intestinal', 1, NULL, NULL),
	(55, '2017-09-26 18:35:27', 'AZAHARA', 'RODRIGUEZ LUNA', '["PhD student"]', 'azahara_rl_13@hotmail.com', 'Facultad de Farmacia', 'Farmacología', 'Farmacología Molecular y Aplicada FARMOLAP CTS-658', 'Seguir formándome en el ámbito.', 'Modelos in vitro, ex vivo e in vivo de piel', 1, NULL, NULL),
	(56, '2017-09-26 18:39:59', 'Eugenia', 'Soler Oliva', '["PhD student"]', 'marsololi@alum.us.es', 'CABIMER', 'Genética', 'Andrés Aguilera', 'Voy a iniciar en octubre mi tesis doctoral y me interesa informarme para desarrollar una buena praxis desde el principio.', 'Levaduras y células humanas', 1, NULL, NULL),
	(57, '2017-09-26 18:56:32', 'Álvaro', 'Santana Garrido', '["PhD student","PI"]', 'alvsangar2@alum.us.es', 'Facultad de Farmacia', 'Fisiología', 'Fisiopatología Cardiovascular', 'Aumentar los conocimientos en este ámbito, tras comenzar este año el máster en fisiología y neurociencia y el doctorado en Biología molecular, biomedicina e investigación clínica. Además, acabo de cursar el curso de formación continua de animales de experimentación categoría A,B y C. ', 'Universidad de Sevilla', 1, NULL, NULL),
	(58, '2017-09-26 19:30:44', 'Carmen', 'Fernández de Bobadilla Carrasco', '["PI"]', 'cfernandezdebobadilla@us.es', 'Facultad de Farmacia', 'Fisiología', 'Fisiopatología Cardiovascular', 'Soy farmacéutica, y actualmente trabajo como técnica de laboratorio por el programa de empleo joven en el grupo de Fisiopatología Cardiovascular de la US. Además, comienzo ahora el Máster en Fisiología y Neurociencia, por lo que me parece interesante asistir a este tipo de charlas. Gracias', 'Universidad de Sevilla', 1, NULL, NULL),
	(59, '2017-09-26 19:55:30', 'Mª Luisa', 'Castejón Martínez', '["PhD student"]', 'mcastejon1@us.es', 'Facultad de Farmacia', 'Departamento de Farmacología', 'Dra. Catalina Alarcón de la Lastra Romero', 'Necesidad de ampliar los conocimientos éticos imprescindibles para llevar a cabo mis labores de investigación', 'Universidad de Sevilla', 1, NULL, NULL),
	(60, '2017-09-26 19:59:28', 'Tatiana', 'Montoya Garcia', '["PhD student"]', 'tatiana.mg17@hotmail.com', 'Facultad de Farmacia', 'Farmacología', 'CTS-259', '', 'Universidad de Sevilla', 1, NULL, NULL),
	(61, '2017-09-27 06:58:03', 'REGINA SANDRA', 'BENAVENTE CANTALEJO', '["PhD student"]', 'sandrabc1@hotmail.com', 'UNIVERSIDAD DE SEVILLA', 'FARMACOLOGÍA', 'FARMACOLOGÍA, FARMACOGNOSIA Y PROCESOS AMBIENTALES DE PLANTAS Y HONGOS', '', 'UNIVERSIDAD DE SEVILLA', 1, NULL, NULL),
	(62, '2017-09-27 07:12:03', 'María Antonia', 'Alvarez Fernandez', '["PhD student"]', 'malvarez2@us.es', 'Facultad de Farmacia', 'Nutrición, Bromatología, Toxicología y Medicina Legal', 'AGR 167', 'I want to know more about ethics in investigation because it\'s possible in a future I could work with humans samples', 'actually I work with yeast', 1, NULL, NULL),
	(63, '2017-09-27 07:09:05', 'María Gracia', 'Hinojosa Hidalgo', '["PhD student"]', 'mg.hinojosa94@gmail.com', 'Facultad de Farmacia', 'Nutrición, Bromatología, Toxicología y Medicina Legal', 'Área de toxicología', 'Estoy empezando el doctorado', 'Ratas y cultivos in vitro', 1, NULL, NULL),
	(64, '2017-09-28 10:12:36', 'María Isabel ', 'Vázquez Tavero', '["PI"]', 'maribelvaztav94@gmail.com', 'Facultad de Farmacia', 'Farmacia y Tecnología Farmacéutica', 'CTS480', 'Conocer más sobre la buena práctica y conflictos de intereses actuales en la ciencia.', 'Ratones transgénicos', 1, NULL, NULL),
	(65, '2017-09-28 10:19:42', 'Carmen María ', 'Gordillo Vázquez', '["PI"]', 'cmgv1992@hotmail.com', 'Facultad de Farmacia', 'Farmacia y Tecnología Farmacéutica', 'CTS480', 'Obtener información sobre la buena práctica y la ética actual en la ciencia', 'Ratones transgénicos', 1, NULL, NULL),
	(66, '2017-09-28 10:37:14', 'Isabel', 'Lóepz Calderón', '["PI"]', 'ilcalderon@us.es', 'Departamento de Genética, Facultad de Biología USE', 'Genética', 'Isabel L. Calderón', 'I am involved in teaching this topic in several courses of graduate and undergraduate studies. I think that it is very important that our students are aware of the consequences of their behaviour as researchers and in their practice.', 'yeast, bacteria', 1, NULL, NULL),
	(67, '2017-09-28 10:50:46', 'María', 'Olmedo López', '["PI"]', 'mariaolmedo@us.es', 'Facultad de Biología', 'Genética', 'María Olmedo', '', 'C. elegans\r\nE. coli\r\nNeurospora crassa', 1, NULL, NULL),
	(68, '2017-09-28 10:53:47', 'Alejandro', 'Mata Cabana', '["Postdoc"]', 'amata@us.es', 'Facultad de Biología', 'Genética', 'María Olmedo López', 'Research Integrity is essential for the proper development of science. Lately, we have seen some fraud committed that goes against the credibility of researchers. Now I am in a key period of my career in which I  have to apply the pertinent integrity actions to make my research fully credible  and to be an example for the students I supervise.  ', 'C. elegans', 1, NULL, NULL),
	(69, '2017-09-28 19:17:45', 'Fernando', 'Piña Pozo', '["PhD student"]', 'ferppozo@hotmail.com', 'Area Gestion Sanitaria de Osuna / ', 'FISIOTERAPIA', 'Effectivity of dry needling in chronic neck pain', 'We are in the designing phase of a randomized controlled Trial, and it could be of interest to attend this whorshop in order to manage the etthical issues in better way.', 'Humans', 1, NULL, NULL);
/*!40000 ALTER TABLE `solicitudes_cursos` ENABLE KEYS */;

-- Volcando estructura para tabla tolteca-fabrik.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `grupos` text,
  `userid` varchar(255) DEFAULT NULL,
  `creador` int(11) DEFAULT NULL,
  `bloqueado` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tolteca-fabrik.usuarios: 6 rows
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `date_time`, `nombre`, `usuario`, `password`, `email`, `grupos`, `userid`, `creador`, `bloqueado`) VALUES
	(1, '2017-09-14 11:21:39', 'Ezequiel', 'ezequiel', 'noviembre10', 'ezequiel@us.es', '["11","8"]', '1', 1, 0),
	(3, '2017-09-14 09:28:47', 'Rubén Tavero', 'rtavero', 'rtavero', 'rtavero@us.es', '["11","8"]', '3', 2, 0),
	(2, '2017-09-14 09:24:45', 'Pablo Dominguez', 'jdominguez10', 'jdominguez10', 'jdominguez10@us.es', '["11","8"]', '2', 1, 0),
	(4, '2017-09-14 09:30:54', 'David Cánovas', 'davidc', '', 'davidc@us.es', '14', '4', 3, 0),
	(5, '2017-10-02 10:32:06', 'Rosa Castaño Ortiz', 'mcastano1', 'mcastano1', 'mcastano1@us.es', '11', '5', 1, 0),
	(6, '2017-10-02 11:25:34', 'Escuela Internacional de Doctorado de la Universidad de Sevilla', 'direccioneipd', 'direccioneipd2017', 'direccioneipd@us.es', '11', '6', 1, 0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
