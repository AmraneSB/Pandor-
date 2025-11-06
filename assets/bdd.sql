-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 06 nov. 2025 à 11:24
-- Version du serveur : 9.1.0
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `omeka`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_key`
--

DROP TABLE IF EXISTS `api_key`;
CREATE TABLE IF NOT EXISTS `api_key` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `credential_hash` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C912ED9D7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `api_key`
--

INSERT INTO `api_key` (`id`, `owner_id`, `label`, `credential_hash`, `last_ip`, `last_accessed`, `created`) VALUES
('v93tumeJwroU6cKf7hkIDjgVr5FFZHBn', 1, 'apiOmk_test', '$2y$10$RwnDo96bkLoYeEpmZO.SmOwzpwMPfpVgRECJyWkd9klDmKZTeI6/6', 0x00000000000000000000000000000001, '2025-11-06 11:23:43', '2025-10-21 09:22:12');

-- --------------------------------------------------------

--
-- Structure de la table `asset`
--

DROP TABLE IF EXISTS `asset`;
CREATE TABLE IF NOT EXISTS `asset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `csvimport_entity`
--

DROP TABLE IF EXISTS `csvimport_entity`;
CREATE TABLE IF NOT EXISTS `csvimport_entity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL,
  `entity_id` int NOT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_84D382F4BE04EA9` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `csvimport_entity`
--

INSERT INTO `csvimport_entity` (`id`, `job_id`, `entity_id`, `resource_type`) VALUES
(1, 22, 19, 'items'),
(2, 22, 20, 'items'),
(3, 22, 21, 'items'),
(4, 22, 22, 'items'),
(5, 22, 23, 'items'),
(6, 23, 24, 'items'),
(7, 23, 25, 'items'),
(8, 23, 26, 'items'),
(9, 23, 27, 'items'),
(10, 23, 28, 'items'),
(11, 24, 29, 'items'),
(12, 24, 30, 'items'),
(13, 24, 31, 'items'),
(14, 24, 32, 'items'),
(15, 24, 33, 'items'),
(16, 25, 34, 'items'),
(17, 25, 35, 'items'),
(18, 25, 36, 'items'),
(19, 25, 37, 'items'),
(20, 25, 38, 'items'),
(21, 26, 39, 'items'),
(22, 26, 40, 'items'),
(23, 26, 41, 'items'),
(24, 26, 42, 'items'),
(25, 26, 43, 'items'),
(26, 27, 44, 'items'),
(27, 27, 45, 'items'),
(28, 27, 46, 'items');

-- --------------------------------------------------------

--
-- Structure de la table `csvimport_import`
--

DROP TABLE IF EXISTS `csvimport_import`;
CREATE TABLE IF NOT EXISTS `csvimport_import` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL,
  `undo_job_id` int DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_err` tinyint(1) NOT NULL,
  `stats` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_17B50881BE04EA9` (`job_id`),
  UNIQUE KEY `UNIQ_17B508814C276F75` (`undo_job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `csvimport_import`
--

INSERT INTO `csvimport_import` (`id`, `job_id`, `undo_job_id`, `comment`, `resource_type`, `has_err`, `stats`) VALUES
(1, 22, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(2, 23, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(3, 24, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(4, 25, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(5, 26, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(6, 27, NULL, '', 'items', 0, '{\"added\":{\"items\":3}}');

-- --------------------------------------------------------

--
-- Structure de la table `fulltext_search`
--

DROP TABLE IF EXISTS `fulltext_search`;
CREATE TABLE IF NOT EXISTS `fulltext_search` (
  `id` int NOT NULL,
  `resource` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`,`resource`),
  KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(24, 'items', 1, 1, 'John Lennon', 'John Lennon'),
(25, 'items', 1, 1, 'Queen', 'Queen'),
(26, 'items', 1, 1, 'Daft Punk', 'Daft Punk'),
(27, 'items', 1, 1, 'Adele', 'Adele'),
(28, 'items', 1, 1, 'Coldplay', 'Coldplay'),
(29, 'items', 1, 1, NULL, 'Imagine\n2025-10-16 10:00:00\nImagine'),
(30, 'items', 1, 1, NULL, 'Queen\n2025-10-16 10:05:00\nBohemian Rhapsody'),
(31, 'items', 1, 1, NULL, 'Daft Punk\n2025-10-16 10:10:00\nOne More Time'),
(32, 'items', 1, 1, NULL, 'Adele\n2025-10-16 10:15:00\nHello'),
(33, 'items', 1, 1, NULL, 'Coldplay\n2025-10-16 10:20:00\nYellow'),
(34, 'items', 1, 1, NULL, 'Imagine\nacceptée'),
(35, 'items', 1, 1, NULL, 'Bohemian Rhapsody\nignorée'),
(36, 'items', 1, 1, NULL, 'One More Time\nacceptée'),
(37, 'items', 1, 1, NULL, 'Hello\nacceptée'),
(38, 'items', 1, 1, NULL, 'Yellow\nignorée'),
(39, 'items', 1, 1, NULL, 'Imagine\n1971\nimagine.mp3\nJohn Lennon'),
(40, 'items', 1, 1, NULL, 'Bohemian Rhapsody\n1975\nbohemian.mp3\nQueen'),
(41, 'items', 1, 1, NULL, 'One More Time\n2000\nonemoretime.mp3\nDaft Punk'),
(42, 'items', 1, 1, NULL, 'Hello\n2015\nhello.mp3\nAdele'),
(43, 'items', 1, 1, NULL, 'Yellow\n2000\nyellow.mp3\nColdplay'),
(44, 'items', 1, 1, NULL, 'Alice\nalice@example.com\nétudiant'),
(45, 'items', 1, 1, NULL, 'Bob\nbob@example.com\nadmin'),
(46, 'items', 1, 1, NULL, 'Charlie\ncharlie@example.com\nétudiant'),
(52, 'items', 1, 1, NULL, '');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id` int NOT NULL,
  `primary_media_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1F1B251ECBE0B084` (`primary_media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`, `primary_media_id`) VALUES
(24, NULL),
(25, NULL),
(26, NULL),
(27, NULL),
(28, NULL),
(29, NULL),
(30, NULL),
(31, NULL),
(32, NULL),
(33, NULL),
(34, NULL),
(35, NULL),
(36, NULL),
(37, NULL),
(38, NULL),
(39, NULL),
(40, NULL),
(41, NULL),
(42, NULL),
(43, NULL),
(44, NULL),
(45, NULL),
(46, NULL),
(52, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `item_item_set`
--

DROP TABLE IF EXISTS `item_item_set`;
CREATE TABLE IF NOT EXISTS `item_item_set` (
  `item_id` int NOT NULL,
  `item_set_id` int NOT NULL,
  PRIMARY KEY (`item_id`,`item_set_id`),
  KEY `IDX_6D0C9625126F525E` (`item_id`),
  KEY `IDX_6D0C9625960278D7` (`item_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_set`
--

DROP TABLE IF EXISTS `item_set`;
CREATE TABLE IF NOT EXISTS `item_set` (
  `id` int NOT NULL,
  `is_open` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_site`
--

DROP TABLE IF EXISTS `item_site`;
CREATE TABLE IF NOT EXISTS `item_site` (
  `item_id` int NOT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`item_id`,`site_id`),
  KEY `IDX_A1734D1F126F525E` (`item_id`),
  KEY `IDX_A1734D1FF6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `pid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `args` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `log` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `job`
--

INSERT INTO `job` (`id`, `owner_id`, `pid`, `status`, `class`, `args`, `log`, `started`, `ended`) VALUES
(1, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"60\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome7BA5.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"nomArtiste\"],\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-16T16:03:18+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-10-16 16:03:18', '2025-10-16 16:03:18'),
(2, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"60\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome451.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"nomArtiste\"],\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":3},\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-16T16:08:44+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-10-16 16:08:44', '2025-10-16 16:08:44'),
(3, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"60\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome7218.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"nomArtiste\"],\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":3},\"o:resource_class\":{\"o:id\":108},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-16T16:11:43+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-10-16 16:11:43', '2025-10-16 16:11:43'),
(4, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"58\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeFC2E.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"nomArtiste\"],\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":3},\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-16T18:20:59+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-10-16 18:20:59', '2025-10-16 18:20:59'),
(5, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"58\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeC183.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"pandore:nomArtiste\":189}],\"column-item_set\":[\"pandore:nomArtiste\"],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-16T18:23:14+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-10-16 18:23:14', '2025-10-16 18:23:14'),
(6, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"58\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeEED5.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"nomArtiste\"],\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":3},\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-16T18:28:56+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-10-16 18:28:56', '2025-10-16 18:28:56'),
(7, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"58\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome5886.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"nomArtiste\"],\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":3},\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-16T18:34:38+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-10-16 18:34:38', '2025-10-16 18:34:38'),
(8, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"58\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome9FB5.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"nomArtiste\"],\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":3},\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-16T18:39:25+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-10-16 18:39:25', '2025-10-16 18:39:25'),
(9, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"58\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome6899.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"nomArtiste\"],\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":3},\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-16T18:47:30+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-10-16 18:47:30', '2025-10-16 18:47:30'),
(10, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"58\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome1D6E.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"nomArtiste\"],\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":3},\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-16T18:50:24+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-10-16 18:50:24', '2025-10-16 18:50:24'),
(11, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Test_Artiste.csv\",\"filesize\":\"23\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeB273.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"nomArtiste\"],\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":3},\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-16T18:53:18+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-10-16 18:53:18', '2025-10-16 18:53:18'),
(12, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"58\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeDAFF.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"nomArtiste\"],\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":3},\"o:resource_class\":{\"o:id\":108},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-17T15:38:52+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-10-17 15:38:52', '2025-10-17 15:38:52'),
(13, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"58\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome9DF9.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"nomArtiste\"],\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":3},\"o:resource_class\":{\"o:id\":108},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-17T15:41:50+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-10-17 15:41:50', '2025-10-17 15:41:50'),
(14, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"58\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome873A.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"nomArtiste\"],\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":3},\"o:resource_class\":{\"o:id\":108},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-17T15:47:03+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-10-17 15:47:03', '2025-10-17 15:47:03'),
(15, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Test_Artiste.csv\",\"filesize\":\"23\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeD589.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"nomArtiste\"],\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":3},\"o:resource_class\":{\"o:id\":108},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-17T15:55:03+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-10-17 15:55:03', '2025-10-17 15:55:03'),
(16, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"58\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome7E52.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"nomArtiste\"],\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":3},\"o:resource_class\":{\"o:id\":108},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-17T16:01:14+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-10-17 16:01:14', '2025-10-17 16:01:14'),
(17, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"58\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome5D94.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"1\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-28T11:51:34+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-10-28 11:51:34', '2025-10-28 11:51:34'),
(18, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"58\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeECFB.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"nomArtiste\"],\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":3},\"o:resource_class\":{\"o:id\":108},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-28T11:53:07+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-10-28 11:53:07', '2025-10-28 11:53:07'),
(19, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"58\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeD97F.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-28T12:07:01+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-10-28 12:07:01', '2025-10-28 12:07:01'),
(20, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Test_Artiste.csv\",\"filesize\":\"23\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome6929.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-28T12:19:38+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-10-28 12:19:38', '2025-10-28 12:19:38'),
(21, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Test_Artiste.csv\",\"filesize\":\"23\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome6606.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-28T12:25:03+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-10-28 12:25:03', '2025-10-28 12:25:03'),
(22, 1, '28696', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"58\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeE0C3.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-29 17:11:27', '2025-10-29 17:11:28'),
(23, 1, '26656', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"58\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome70D6.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"nomArtiste\"],\"column-property\":[{\"pandore:nomArtiste\":189}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":3},\"o:resource_class\":{\"o:id\":108},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-29 17:14:24', '2025-10-29 17:14:24'),
(24, 1, '21704', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Recherche.csv\",\"filesize\":\"236\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeEC32.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"motCle\",\"dateRecherche\",\"correspondATitre\"],\"column-property\":[{\"pandore:motCle\":194},{\"pandore:dateRecherche\":195},{\"pandore:correspondATitre\":196}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":5},\"o:resource_class\":{\"o:id\":109},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-29 17:14:50', '2025-10-29 17:14:51'),
(25, 1, '18024', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Suggestion.csv\",\"filesize\":\"140\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome47B2.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"nomTitrePropose\",\"statutSuggestion\"],\"column-property\":[{\"pandore:nomTitrePropose\":197},{\"pandore:statutSuggestion\":198}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":6},\"o:resource_class\":{\"o:id\":110},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-29 17:15:21', '2025-10-29 17:15:22'),
(26, 1, '31340', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Titre.csv\",\"filesize\":\"236\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeC6F6.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"nomTitre\",\"anneeSortie\",\"fichierAudio\",\"aPourArtiste\"],\"column-property\":[{\"pandore:nomTitre\":185},{\"pandore:anneeSortie\":186},{\"pandore:fichierAudio\":187},{\"pandore:aPourArtiste\":188}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":2},\"o:resource_class\":{\"o:id\":107},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-29 17:15:54', '2025-10-29 17:15:54'),
(27, 1, '15832', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Utilisateur.csv\",\"filesize\":\"150\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome3998.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"nomUtilisateur\",\"emailUtilisateur\",\"roleUtilisateur\"],\"column-property\":[{\"pandore:nomUtilisateur\":190},{\"pandore:emailUtilisateur\":191},{\"pandore:roleUtilisateur\":192}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":4},\"o:resource_class\":{\"o:id\":106},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-29 17:16:24', '2025-10-29 17:16:24');

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `ingester` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `renderer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `source` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `media_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sha256` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int DEFAULT NULL,
  `lang` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  KEY `IDX_6A2CA10C126F525E` (`item_id`),
  KEY `item_position` (`item_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration`
--

DROP TABLE IF EXISTS `migration`;
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000'),
('20210205101827'),
('20210225095734'),
('20210810083804'),
('20220718090449'),
('20220824103916'),
('20230124033031'),
('20230410074846'),
('20230523085358'),
('20230601060113'),
('20230713101012'),
('20231016000000'),
('20240103030617');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id`, `is_active`, `version`) VALUES
('CSVImport', 1, '2.6.2');

-- --------------------------------------------------------

--
-- Structure de la table `password_creation`
--

DROP TABLE IF EXISTS `password_creation`;
CREATE TABLE IF NOT EXISTS `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_creation`
--

INSERT INTO `password_creation` (`id`, `user_id`, `created`, `activate`) VALUES
('opCPbLFHu6o6FVMJbWltNWbAIjL1yH5s', 2, '2025-10-21 07:15:40', 1);

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `vocabulary_id` int NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.'),
(185, 1, 5, 'nomTitre', 'Nom du titre', 'Nom de la chanson ou de la piste audio.'),
(186, 1, 5, 'anneeSortie', 'Année de sortie', 'Année de parution du titre.'),
(187, 1, 5, 'fichierAudio', 'Fichier audio', 'Lien vers le fichier audio ou l’aperçu du titre.'),
(188, 1, 5, 'aPourArtiste', 'A pour artiste', 'Lien entre un titre et son artiste.'),
(189, 1, 5, 'nomArtiste', 'Nom de l’artiste', 'Nom complet ou nom de scène de l’artiste ou du groupe.'),
(190, 1, 5, 'nomUtilisateur', 'Nom de l’utilisateur', 'Nom ou identifiant de l’utilisateur de Pandoré.'),
(191, 1, 5, 'emailUtilisateur', 'Email de l’utilisateur', 'Adresse email de l’utilisateur.'),
(192, 1, 5, 'roleUtilisateur', 'Rôle de l’utilisateur', 'Rôle ou statut (admin, étudiant, etc.).'),
(193, 1, 5, 'effectueRecherche', 'Effectue la recherche', 'Lien entre un utilisateur et la recherche qu’il a effectuée.'),
(194, 1, 5, 'motCle', 'Mot-clé', 'Mot ou expression saisie ou prononcée par l’utilisateur.'),
(195, 1, 5, 'dateRecherche', 'Date de la recherche', 'Horodatage de la requête de recherche.'),
(196, 1, 5, 'correspondATitre', 'Correspond à un titre', 'Lien entre une recherche et le titre trouvé.'),
(197, 1, 5, 'nomTitrePropose', 'Nom du titre proposé', 'Titre alternatif ou suggestion proposée à l’utilisateur.'),
(198, 1, 5, 'statutSuggestion', 'Statut de la suggestion', 'Indique si la suggestion a été acceptée, ignorée, etc.');

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

DROP TABLE IF EXISTS `resource`;
CREATE TABLE IF NOT EXISTS `resource` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `resource_class_id` int DEFAULT NULL,
  `resource_template_id` int DEFAULT NULL,
  `thumbnail_id` int DEFAULT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`),
  KEY `title` (`title`(190)),
  KEY `is_public` (`is_public`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(24, 1, 108, NULL, NULL, 'John Lennon', 1, '2025-10-29 17:14:24', '2025-10-29 17:14:24', 'Omeka\\Entity\\Item'),
(25, 1, 108, NULL, NULL, 'Queen', 1, '2025-10-29 17:14:24', '2025-10-29 17:14:24', 'Omeka\\Entity\\Item'),
(26, 1, 108, NULL, NULL, 'Daft Punk', 1, '2025-10-29 17:14:24', '2025-10-29 17:14:24', 'Omeka\\Entity\\Item'),
(27, 1, 108, NULL, NULL, 'Adele', 1, '2025-10-29 17:14:24', '2025-10-29 17:14:24', 'Omeka\\Entity\\Item'),
(28, 1, 108, NULL, NULL, 'Coldplay', 1, '2025-10-29 17:14:24', '2025-10-29 17:14:24', 'Omeka\\Entity\\Item'),
(29, 1, 109, 5, NULL, 'Imagine', 1, '2025-10-29 17:14:51', '2025-10-29 17:14:51', 'Omeka\\Entity\\Item'),
(30, 1, 109, 5, NULL, 'Queen', 1, '2025-10-29 17:14:51', '2025-10-29 17:14:51', 'Omeka\\Entity\\Item'),
(31, 1, 109, 5, NULL, 'Daft Punk', 1, '2025-10-29 17:14:51', '2025-10-29 17:14:51', 'Omeka\\Entity\\Item'),
(32, 1, 109, 5, NULL, 'Adele', 1, '2025-10-29 17:14:51', '2025-10-29 17:14:51', 'Omeka\\Entity\\Item'),
(33, 1, 109, 5, NULL, 'Coldplay', 1, '2025-10-29 17:14:51', '2025-10-29 17:14:51', 'Omeka\\Entity\\Item'),
(34, 1, 110, 6, NULL, 'Imagine', 1, '2025-10-29 17:15:22', '2025-10-29 17:15:22', 'Omeka\\Entity\\Item'),
(35, 1, 110, 6, NULL, 'Bohemian Rhapsody', 1, '2025-10-29 17:15:22', '2025-10-29 17:15:22', 'Omeka\\Entity\\Item'),
(36, 1, 110, 6, NULL, 'One More Time', 1, '2025-10-29 17:15:22', '2025-10-29 17:15:22', 'Omeka\\Entity\\Item'),
(37, 1, 110, 6, NULL, 'Hello', 1, '2025-10-29 17:15:22', '2025-10-29 17:15:22', 'Omeka\\Entity\\Item'),
(38, 1, 110, 6, NULL, 'Yellow', 1, '2025-10-29 17:15:22', '2025-10-29 17:15:22', 'Omeka\\Entity\\Item'),
(39, 1, 107, 2, NULL, 'Imagine', 1, '2025-10-29 17:15:54', '2025-10-29 17:15:54', 'Omeka\\Entity\\Item'),
(40, 1, 107, 2, NULL, 'Bohemian Rhapsody', 1, '2025-10-29 17:15:54', '2025-10-29 17:15:54', 'Omeka\\Entity\\Item'),
(41, 1, 107, 2, NULL, 'One More Time', 1, '2025-10-29 17:15:54', '2025-10-29 17:15:54', 'Omeka\\Entity\\Item'),
(42, 1, 107, 2, NULL, 'Hello', 1, '2025-10-29 17:15:54', '2025-10-29 17:15:54', 'Omeka\\Entity\\Item'),
(43, 1, 107, 2, NULL, 'Yellow', 1, '2025-10-29 17:15:54', '2025-10-29 17:15:54', 'Omeka\\Entity\\Item'),
(44, 1, 106, 4, NULL, 'Alice', 1, '2025-10-29 17:16:24', '2025-10-29 17:16:24', 'Omeka\\Entity\\Item'),
(45, 1, 106, 4, NULL, 'Bob', 1, '2025-10-29 17:16:24', '2025-10-29 17:16:24', 'Omeka\\Entity\\Item'),
(46, 1, 106, 4, NULL, 'Charlie', 1, '2025-10-29 17:16:24', '2025-10-29 17:16:24', 'Omeka\\Entity\\Item'),
(52, 1, 108, 7, NULL, NULL, 1, '2025-11-06 11:23:43', '2025-11-06 11:23:43', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Structure de la table `resource_class`
--

DROP TABLE IF EXISTS `resource_class`;
CREATE TABLE IF NOT EXISTS `resource_class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `vocabulary_id` int NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.'),
(106, 1, 5, 'Utilisateur', 'Utilisateur', 'Personne utilisant le système Pandoré pour rechercher ou écouter de la musique.'),
(107, 1, 5, 'Titre', 'Titre', 'Enregistrement musical (chanson, piste, extrait) présent dans la base Pandoré.'),
(108, 1, 5, 'Artiste', 'Artiste', 'Personne ou groupe interprétant ou composant un titre.'),
(109, 1, 5, 'Recherche', 'Recherche', 'Requête effectuée par un utilisateur via texte ou commande vocale.'),
(110, 1, 5, 'Suggestion', 'Suggestion', 'Proposition de titre similaire ou proche retournée après une recherche.');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template`
--

DROP TABLE IF EXISTS `resource_template`;
CREATE TABLE IF NOT EXISTS `resource_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `resource_class_id` int DEFAULT NULL,
  `title_property_id` int DEFAULT NULL,
  `description_property_id` int DEFAULT NULL,
  `label` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(2, 1, 107, 185, NULL, 'Titre'),
(4, 1, 106, 190, NULL, 'Utilisateur'),
(5, 1, 109, 194, NULL, 'Recherche'),
(6, 1, 110, 197, NULL, 'Suggestion'),
(7, 1, 108, 189, NULL, 'Artiste');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template_property`
--

DROP TABLE IF EXISTS `resource_template_property`;
CREATE TABLE IF NOT EXISTS `resource_template_property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resource_template_id` int NOT NULL,
  `property_id` int NOT NULL,
  `alternate_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `position` int DEFAULT NULL,
  `data_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  KEY `IDX_4689E2F1549213EC` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`, `default_lang`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(2, 1, 15, NULL, NULL, 2, NULL, 0, 0, NULL),
(3, 1, 8, NULL, NULL, 3, NULL, 0, 0, NULL),
(4, 1, 2, NULL, NULL, 4, NULL, 0, 0, NULL),
(5, 1, 7, NULL, NULL, 5, NULL, 0, 0, NULL),
(6, 1, 4, NULL, NULL, 6, NULL, 0, 0, NULL),
(7, 1, 9, NULL, NULL, 7, NULL, 0, 0, NULL),
(8, 1, 12, NULL, NULL, 8, NULL, 0, 0, NULL),
(9, 1, 40, 'Place', NULL, 9, NULL, 0, 0, NULL),
(10, 1, 5, NULL, NULL, 10, NULL, 0, 0, NULL),
(11, 1, 17, NULL, NULL, 11, NULL, 0, 0, NULL),
(12, 1, 6, NULL, NULL, 12, NULL, 0, 0, NULL),
(13, 1, 25, NULL, NULL, 13, NULL, 0, 0, NULL),
(14, 1, 10, NULL, NULL, 14, NULL, 0, 0, NULL),
(15, 1, 13, NULL, NULL, 15, NULL, 0, 0, NULL),
(16, 1, 29, NULL, NULL, 16, NULL, 0, 0, NULL),
(17, 1, 30, NULL, NULL, 17, NULL, 0, 0, NULL),
(18, 1, 50, NULL, NULL, 18, NULL, 0, 0, NULL),
(19, 1, 3, NULL, NULL, 19, NULL, 0, 0, NULL),
(20, 1, 41, NULL, NULL, 20, NULL, 0, 0, NULL),
(21, 2, 185, NULL, NULL, 1, NULL, 0, 0, NULL),
(22, 2, 186, NULL, NULL, 2, NULL, 0, 0, NULL),
(23, 2, 187, NULL, NULL, 3, NULL, 0, 0, NULL),
(24, 2, 188, NULL, NULL, 4, NULL, 0, 0, NULL),
(26, 4, 190, NULL, NULL, 1, NULL, 0, 0, NULL),
(27, 4, 191, NULL, NULL, 2, NULL, 0, 0, NULL),
(28, 4, 192, NULL, NULL, 3, NULL, 0, 0, NULL),
(29, 4, 193, NULL, NULL, 4, NULL, 0, 0, NULL),
(30, 5, 194, NULL, NULL, 1, NULL, 0, 0, NULL),
(31, 5, 196, NULL, NULL, 2, NULL, 0, 0, NULL),
(32, 5, 195, NULL, NULL, 3, NULL, 0, 0, NULL),
(33, 6, 198, NULL, NULL, 1, NULL, 0, 0, NULL),
(34, 6, 197, NULL, NULL, 2, NULL, 0, 0, NULL),
(37, 7, 189, NULL, NULL, 1, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longblob NOT NULL,
  `modified` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('0tmvu9fj3u43fngd87q06mvve8', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323235353831322e36373736373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226530376e6f6461686d766834386463656f656574746271637138223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323238393631383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239393031323b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239303433343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736323239333139343b7d7d72656469726563745f75726c7c733a35363a22687474703a2f2f6c6f63616c686f73742f6f6d6b5f544879705f32352d32365f636c6f6e652f6f6d656b612d732f61646d696e2f6974656d223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226264323664306635303861653861616363343232363864306332343638376164223b733a33323a226335396464656435303566346665656136336565313263313766626233373336223b7d733a343a2268617368223b733a36353a2263353964646564353035663466656561363365653132633137666262333733362d6264323664306635303861653861616363343232363864306332343638376164223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a34323a7b733a33323a223564376164656166373062353461636330613862646565626633623465386233223b733a33323a226164623439616630653661643335626639646464396436363164343430646539223b733a33323a223938383261396663653863396130323036303734393966613638646366613165223b733a33323a223165396463363036346433396531326163653262356262333931313536336462223b733a33323a226361353931663534346564623431636165393338386239373737376631353262223b733a33323a223539393631376533666161343238636333366663353432663231313132363235223b733a33323a226330323463623363646233303966336561303832326262663064613064326537223b733a33323a223339393638653633393733373438313966633838623066663162313438326535223b733a33323a223537383864323233356131376165353866396438326138393838373930393534223b733a33323a223235663834333339666636376163383332646232346436313734393832663131223b733a33323a223133353830633862613966623265656237333536376165646236376166306165223b733a33323a223739316666363530363632326336396531666137333565393861366634363532223b733a33323a226336333230306237356136613666633238353534653831373964383338366464223b733a33323a226237663237333538303665333839303463643333623065303136306339336639223b733a33323a226164353831653662646633353736626335633135363334653563306162373439223b733a33323a223562636562363334303362336338336331376666666639396634623061393430223b733a33323a223363623038366539363736396662643465363037373533303639346165633938223b733a33323a223530313234666164656634376661613961343239613866613133396337326638223b733a33323a226164663633643538366633613136646532343932626165613364376438353165223b733a33323a223631326562313230376464333562626232346533643732643139303264636664223b733a33323a223338313066626564633333323035653832363763383939396164343466653139223b733a33323a223138646135313439643563613639376437653837346265336232383962656266223b733a33323a223464636437316664376265326265373139323064643430306662326231636538223b733a33323a223839386235633635333233303739643964343562643164373564653133393662223b733a33323a223564346165633830313362363235636134643235666165396239346637636461223b733a33323a226666646362393262356537646636633936646561653765333635373438313038223b733a33323a226434623961393234646336653365623832316536393663303964666534613738223b733a33323a223730663334376137633063313139663730353761373331313830313830373532223b733a33323a223334336266386366336562633965383465633738353533303266616437323235223b733a33323a223663366666653733656166663962666535393934363032623839383765303766223b733a33323a226332363034326137633564383036343531616561613631356533333339653362223b733a33323a226565306536626266376463623135623761633663303834623638616263646437223b733a33323a226463643666666435303366333333633265336662623863383639333231333332223b733a33323a223162306534626338643562313139663536356463393565363664383230383865223b733a33323a223431393862363835333863636563326436353466333731653765326163333536223b733a33323a223061646533346464383739373363393632363735343565306166623265316138223b733a33323a223864383465346631343539626438663864393766653737326264336337303263223b733a33323a223439386631303463616533333066343962646538633962646461656365646562223b733a33323a223136386563653862376463646361613064393866653630316466643863626262223b733a33323a223331343634633062353230366364306332303635383564386632336564643964223b733a33323a223633316636363363656531666539306265383835333737373164343565636261223b733a33323a226531646338306132623434623661336532616631663338623761373133393139223b733a33323a223936306237346330353364363662373637313065366235326437396631623737223b733a33323a223433316234393731626131373932356435356538353035393137356439333062223b733a33323a226462316638656337396162313166373637346530643538366639663437333636223b733a33323a226230323435303264633539623830396637376334633934323234306561636265223b733a33323a223532373835366631363033316537653934303666653662336231363936353361223b733a33323a226465363636343935333239366633633866616161356162396366616235363964223b733a33323a226361643435326539313031393161396365313630366437376262656537643533223b733a33323a223966383663393532613466373331663264643936646333343337363632396363223b733a33323a223932623932333162366166373461393266653366356235316534376632633235223b733a33323a226533643965653738373066623732616439346161326635386363353437633638223b733a33323a226336353936363535643731333135636664306233326634373766623834643062223b733a33323a223663346533343863356233396264303830626134653264393133396563326636223b733a33323a223037373737326437363233386261383438666333663633386636666138636231223b733a33323a226435383966663566636332623937663764663630396266633138373234373131223b733a33323a226638376362623566346332623835353330343162613263383562646338633130223b733a33323a223531326166636466333661386133376339313266636230333661353862393032223b733a33323a223965396331353037396138636137646131366164303761313032366132383339223b733a33323a223261303735306539393736653930346634346333386265313730383366656666223b733a33323a226561306166346232356331613666343130396566386534323735636563363732223b733a33323a226137313636653265656265633335303661613361653766636165643630313561223b733a33323a226236346262626232303063356536353361383435326462643861366631346435223b733a33323a226633353562653331643061303662623138613133373065396162626336646561223b733a33323a223137646365356234323534623435386263393066353164363362386161316333223b733a33323a226432366266303964386464376364343030303362363634343461393162393831223b733a33323a226165316562323465376564646332343433343062386332623431663262313833223b733a33323a226136666334663663376139643164346439643765363231643862383037343662223b733a33323a223762653334373363656439303734613836623834306530663331656361383661223b733a33323a223933633639376538356365353163393063386563363237643832313436633038223b733a33323a226665363235626439323862353837323564636666313832356564616633373036223b733a33323a226261303732396330326332663930613536633830663133333831653064623239223b733a33323a226661316462616632666538313131336561353237333438363037363163656163223b733a33323a223665303638323734396336653538316639393534313637393864363535313239223b733a33323a223037663265373661366635653066313939366634663061623938363931373763223b733a33323a223838653631303937316637333039363931613363393366633639333136383964223b733a33323a226336623734386630383134393262373065346533633237643163656638663330223b733a33323a223061666535333337653838346432306531633835373833303834346238613736223b733a33323a223837383936343661643337643234363138316136393838373231653137646566223b733a33323a223263653366316531363130663363376336623037613665313035313430636134223b733a33323a226532333165366533333430363862333531333530383436393736616165326264223b733a33323a226165323530383239623636666566316263333332326631383865383064633033223b733a33323a226262363533366463373562326131356161393562363639633339313262653964223b733a33323a223134346430643036663933623433333934323133303839643533613534303939223b7d733a343a2268617368223b733a36353a2231343464306430366639336234333339343231333038396435336135343039392d6262363533366463373562326131356161393562363639633339313262653964223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a223531643861333236343563336535393332303633333437653563643136333531223b733a33323a223266623035323834343036633735313832636439613365333533363538356436223b733a33323a226638366231363562646430333464636662633839383930636663633730643737223b733a33323a223164313538633864303662346134656337376332356439666535303831383265223b733a33323a223561636135383539376237623134313433623765383266363564383665653662223b733a33323a223164656461336230653635343335626432326565343664323931336236393237223b733a33323a226631623864303130323835303237363036666336393236313061656338316366223b733a33323a223662316638333132326563303438356634633738623435383433326334363065223b733a33323a223932313839316335383433613462326633303066643038333638353463613531223b733a33323a226464366266656539396539643135663831306238613839666364363366643761223b7d733a343a2268617368223b733a36353a2264643662666565393965396431356638313062386138396663643633666437612d3932313839316335383433613462326633303066643038333638353463613531223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223864643361323062633435353638313536633664306463346532333539393635223b733a33323a223766313936333266663566653862643330376436653764306332346630393363223b733a33323a223430353934336635353831363732333163653433363462323361626363623738223b733a33323a223239373236366362366233396637343631643564633866663133613639656466223b733a33323a226463653539376238653866366539336635303236366131303232393332393035223b733a33323a226162313638316663353661343337363066633130356638633333336137376238223b733a33323a223837373861643133636434626564346466323931333563383032643337356264223b733a33323a226536393661363032383533373163363332663133326533363233636634653736223b7d733a343a2268617368223b733a36353a2265363936613630323835333731633633326631333265333632336366346537362d3837373861643133636434626564346466323931333563383032643337356264223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762255812),
('3q1aujv10ekandqkhkb3hoo3tb', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736313035303231352e3334373531383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22706531756f61626876737534733436623633376e767333306771223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313037333636393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313039333431353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736313039323535343b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313038373632363b7d7d72656469726563745f75726c7c733a33373a22687474703a2f2f6c6f63616c686f73742f6f6d656b61532f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223063633334303337373538633339636339633932353665373839363465313037223b733a33323a226131616363666165343566643461643664373135323261396365316162623536223b7d733a343a2268617368223b733a36353a2261316163636661653435666434616436643731353232613963653161626235362d3063633334303337373538633339636339633932353665373839363465313037223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a34393a7b733a33323a223566316562306661306361396236396463376531623836393835646532656461223b733a33323a226432616338633632336561623562373633666539383333613761636466636138223b733a33323a226635306632343365386433353437623231326662663238383639613036363262223b733a33323a226230626231326634303234386363663933366634306533356262623933626539223b733a33323a223562623165626662663737346538363962323165373738303838626539663864223b733a33323a223939633033306665366136623038333432373563353866653264653838313834223b733a33323a223832303032313063356234373261626336353233666430303663646631636164223b733a33323a223366353062386665356663323932666161656263303139363030386463343433223b733a33323a223631393463346437393063323461316138393936646564376432346265373437223b733a33323a223331613731626633323961396161336461393538396234383239373935306337223b733a33323a226639383261636130393637663535633837396431643363326330653062626130223b733a33323a223033636531326433633331356134653264306365656335613362636464636437223b733a33323a226536313032636334653263363766626336373162323037316131303330373430223b733a33323a223935393966363639663431633063306138323361336363613335613233633862223b733a33323a226464396637353832616232316535623031383637373538383933326535333163223b733a33323a223164613566363438383462376161356332366537666663303538663466613366223b733a33323a223134383833303437666539386331303934313037373062666265326563336136223b733a33323a223230663437376566336532333737383462366662623734653739653735376663223b733a33323a223965303433316562393463353536636336666337306335623535666365373235223b733a33323a223937313633373131636339326330663564653061306664343762653566313161223b733a33323a226563313062653733363534373363636633663332386336643064616135393063223b733a33323a223863343164383435626430626337333863353632633632653433643337386631223b733a33323a226133336332633466616361313162373966313665306239326164343162303962223b733a33323a223434313363653039313562633266356161313033666638313264323266623133223b733a33323a223363313538343439616665373461663432323830366464663936326362313963223b733a33323a223833363937373433643630626163656462313136336336333736666666656133223b733a33323a223934343233623764636264616135333137656330656439663937613366373365223b733a33323a226436636366383561306334323834616131313763386130343562616136393732223b733a33323a223234646562383263323730326462663366643535323264316636626165396566223b733a33323a223465653633626364343639303937393237326631326162623135343662383362223b733a33323a226363636530663932623766386538623739666632396330613265326135343665223b733a33323a226262636436316163333431653737323565396638383765326665653664373433223b733a33323a223566666435623633373462356234356331623336636431653666376635643336223b733a33323a223735616232336538666234323062626634363361343061643538353561616432223b733a33323a223730313338353536386135386562343461323535303865303432326666643964223b733a33323a226633626432666235353134346234316262623366353435626534646137663439223b733a33323a223232356232303735366265656534626266656562363231383034363139386636223b733a33323a223163366435316463306163653039303262356136623231396662336430323232223b733a33323a226130346263616465663863623532366636393361393561373936646434333731223b733a33323a223237633465346236373563643533336264323664366465326135353537636331223b733a33323a223461643866383536643131653561653965643933613866623835356235656666223b733a33323a223639326163346234326164303865323766663636616663626334666166643738223b733a33323a223765643964316165346432343866313362366230383639366166343163316239223b733a33323a223738383766366531326336616232653934636637636162353965366336623064223b733a33323a223530623161333636323334363637333261313364383834373663663866656135223b733a33323a226636373563323161663061376637376366383833666664626134333739316434223b733a33323a223864656639373135653139366632333031333362646364366364316632316662223b733a33323a223731663563303239336162393763383735313039323834633438626335653361223b733a33323a226666633834633062613438313135656531356330656330633537356137633162223b733a33323a223231353563623065336566636261353763393834633334366637613962343832223b733a33323a223538616538346462346634396264626131373161366638373266666330396663223b733a33323a223335613037336137303064663532316638323131313339316332626362306266223b733a33323a223930323439653737613464306564383036306634653964366631623332646362223b733a33323a226530623565343237623639666363343637663962613538313866366662636539223b733a33323a223235386336313739663635643132666631656639386663333730663736316464223b733a33323a223963393133656333333861356235653966316139643933356439616666643430223b733a33323a226464353739313530366136656165643136343561343933326332373739326561223b733a33323a223139323264616334366435623338316433643431366539373031346664386239223b733a33323a223730333064306163313031616664313533316630653964373334356132373335223b733a33323a223535343265353237616136303161343064636338666234343765313164373633223b733a33323a223963613730366338393032356462343934353838386431613831653436363063223b733a33323a223634643335336539616335633630643031323034616439303135643338643061223b733a33323a223065663330663738363561323261316463383737383032636231323132313038223b733a33323a226431386439326438656234653833646235326266373262313637633430636331223b733a33323a226134633663333737303466393939386261363466623464353235353763643736223b733a33323a223765643231653334366161393933376332396130353565363538646133653336223b733a33323a223639303266303730316436313962326233663838353262613431353435643061223b733a33323a223732623966373865636662316633346264633531376635666663653461643833223b733a33323a226432376636376337316262363830643239663663323431613366656634326662223b733a33323a226134643934333136356434303665306131303932363062326132383932633431223b733a33323a223733633135623737396164383063306562333365336461323463353130323331223b733a33323a226564656534333039613662363737303038333536363332386636313638356663223b733a33323a223963616366316363396530343366623966623663663132623136393066633136223b733a33323a226162336435646661353062653735306434333830383439316161333539613536223b733a33323a223135383630616636626462666535636238306530366662613733353261396464223b733a33323a226435393464336334663466633265393262663237383533636131303731663331223b733a33323a223665366537316136316437653161666234393835626663656634316330623763223b733a33323a223966343732663538653163663035303234633737343832313461613335653136223b733a33323a226366653163366137323564346361396361643233613539346535386534313661223b733a33323a223364626532613636623932313137663034336362616335386434633165383835223b733a33323a226537656537313230366439613337623536386461376339356139306461333236223b733a33323a226231356162613639663036366630313031356538313661333731303133623234223b733a33323a226633616238633537326263363030336665356437306539336263393733396163223b733a33323a226131316163653864373665383632316462393734663430343732643065663433223b733a33323a223361376164616663326463396162666161326264616463646162353035336432223b733a33323a223763386438353362303236663366393636646535333437313561336263383136223b733a33323a226139613331336532366134343461356532353437306363303862666561323763223b733a33323a226130666465306563363533646561386134326361393638343361393362636239223b733a33323a223435343833636563613264656430373631656433636432643866343137613435223b733a33323a226236623737306165393530303635656630373430643937326264656638656361223b733a33323a223066616132316636613435613435633433323365323438303931623262376534223b733a33323a226636666662613338393530633637303637313332343239373430383565666637223b733a33323a223865623931653539386431353632336163396262613065616231343066306235223b733a33323a226564396532643231636330633937393438333135343932303765353735323734223b733a33323a223835356565386333666464623934393566326334303638623537396565386262223b733a33323a223833313330343732303066663039383164633131326134313832646566643233223b733a33323a223964363061623462346261383438613961663135623734366432373861393062223b733a33323a226364373838363538333730613233653738323765636266303064316330616263223b7d733a343a2268617368223b733a36353a2263643738383635383337306132336537383237656362663030643163306162632d3964363061623462346261383438613961663135623734366432373861393062223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31353a7b733a33323a226437663334646465653236376565383466613163633333626265336530363137223b733a33323a226261353837383430363961343138656639376637633532376639653965303663223b733a33323a226130343166356430663765313034613232663961353665643138346365663661223b733a33323a223134663564633538383937663537336161303666393562666239613537356134223b733a33323a226239613063643430326139396137383966383464343938376239633035653437223b733a33323a223238646533656562343961643533643438336366663739646266303264313333223b733a33323a223364663436323632303339353466666135666465346262636464626132363431223b733a33323a226334306162643438396361626534303130323962386330306665373264633062223b733a33323a226438393466663562653738333036656264653630383261363962376230376537223b733a33323a223661356636373563343438373837393039353534363330363961353865373663223b733a33323a223664343865373630343237353131613338363262396534366365313833323133223b733a33323a226666663730626539643233343561626363666561336134393363666132646430223b733a33323a223934393864633965393663636538653265393564636139653039313262383234223b733a33323a226162613236306639333664313436383765366336353637373365313235303539223b733a33323a226162646562313730383439613465376265383632363535303237636561323361223b733a33323a223664396363363931313036386162353766356163383933353737376330383131223b733a33323a223437376463333063663037396365336463343461653431303466656137633134223b733a33323a226233663637613965646336623937646137353662316533393165633032373262223b733a33323a226538396431383532663631393361303839643938663937623238336334306437223b733a33323a223464353764356262633936663639373862373066306562653064646361336263223b733a33323a223637656338633137353865366161653165313939623365636532653363306334223b733a33323a226537633666616430313663366634323839316433333031343161653733306161223b733a33323a223039303763633761613864653037656534366538666633613438643032363263223b733a33323a226539306539613739393662316262376461646537363061363731616637366135223b733a33323a226163643963396266373765326137353731656665316536616334663364623437223b733a33323a223363613763326539393734346532373339323764663531653233343739366465223b733a33323a226462313434383936383939653464653936306235646238646365653633323038223b733a33323a223739613365386133363061383862383531353837316631636362333266336162223b733a33323a226437333862313961636538623561336131323538623034636432313461303136223b733a33323a226266323737666537613532643837623038383938656163376566323531663835223b7d733a343a2268617368223b733a36353a2262663237376665376135326438376230383839386561633765663235316638352d6437333862313961636538623561336131323538623034636432313461303136223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226661613463396630336239643135343364326165393538393235383833653137223b733a33323a223336323630333235643133316366396363666639386530623465363732646262223b733a33323a226130333731616531666365656139316437363830366361383761343436316233223b733a33323a223334653536313732306366303934383961356265616231636435333635656134223b7d733a343a2268617368223b733a36353a2233346535363137323063663039343839613562656162316364353336356561342d6130333731616531666365656139316437363830366361383761343436316233223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1761050215),
('50fb00t35f23vksnc74of9vf4p', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736313033303436312e3138353739333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22353066623030743335663233766b736e6337346f663976663470223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313037333636333b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223930626262393034653164646538653537363966383263306435373834386130223b733a33323a223334336161613236326637383562643466323163386562313561326666613064223b7d733a343a2268617368223b733a36353a2233343361616132363266373835626434663231633865623135613266666130642d3930626262393034653164646538653537363966383263306435373834386130223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1761030464),
('7d6e7924c4uh2sb9psapba2863', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736303731363834372e3637363633383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2270676675763764723068383238626f7038726f35617563386930223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736303735373833363b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736303736303034373b7d7d72656469726563745f75726c7c733a34383a22687474703a2f2f6c6f63616c686f73742f6f6d656b61532f6f6d656b612d732f61646d696e2f6a6f622f31312f6c6f67223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223631373864623235616237623839356139356332666535373165613861396638223b733a33323a226130653362333266343330643639356637316464336331616332393936613434223b733a33323a223632333231393365366338343264316135666164643034313235373835383635223b733a33323a223361336339626330656231326333326132313264396465623333613763336264223b7d733a343a2268617368223b733a36353a2233613363396263306562313263333261323132643964656233336137633362642d3632333231393365366338343264316135666164643034313235373835383635223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31353a7b733a33323a223736613461326466313638393335663834323762363363636333373737613534223b733a33323a223632633737646530323238653237316534343636393837613432333831646431223b733a33323a223839613561383565636431653431636565636664336134376430646233633435223b733a33323a226431336163313938366461366462303664666366633633353561383232376333223b733a33323a223839636436393563613739616239396166393833303533623538383838363735223b733a33323a223961383732663334346265636532646631343030383465326538323535633433223b733a33323a226564323733643632393162366563313231623931643632336261663337386237223b733a33323a226533653765623533623966333134626130613132393133356538343730656561223b733a33323a223436663335303937663361643338373636376634626461396566666266323236223b733a33323a223162396535656439303266623765366566333338626462653030303535346261223b733a33323a223637313363333336666435363861393865363366613335333235633732643163223b733a33323a223535313639383633623731643764316265636530336333636436376238633637223b733a33323a223033666638363434653361623361343364393034616163333766633966636639223b733a33323a226239336637303532663364626334663964623936313338666562306237386234223b733a33323a223735393137343934633232636630346232616634626366383539383932313131223b733a33323a223837623933623238346532363036383763353532623733646237666238646564223b733a33323a226261376330376637346163383761666635313262653233633736633332303863223b733a33323a223432376262303466653037616136396133303434343961336535373132306334223b733a33323a226331633235353761376334363766646364363533663062666663326633303036223b733a33323a223030343031663031366464396466303833303431633633363437353766353366223b733a33323a223664613335643364646230346135663735663062643230646330356536363730223b733a33323a226436636230656338313338326536356162303365633065383233343961316539223b733a33323a223835303434313839623065363934363831626131343834643064653132326163223b733a33323a223138633863343961633131613631376539343562633835623664636135363237223b733a33323a223066313066623335313336386431333764626565643839326462613038643230223b733a33323a226663346164616562383531663432643536343737343863303839363836346336223b733a33323a226337626435333766663739373334636632613764313931626563393464383735223b733a33323a226630616139373361343937306134393133373130393133656533363161333963223b733a33323a223333643563613366313232383538346537373035633332383166353061616562223b733a33323a223638303166326564653435633538623234386538656563636661633430616638223b7d733a343a2268617368223b733a36353a2236383031663265646534356335386232343865386565636366616334306166382d3333643563613366313232383538346537373035633332383166353061616562223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1760716847),
('81qpoq78fmhi883qij7t7sgou3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736313634313134352e3530373632373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22383171706f713738666d686938383371696a37743773676f7533223b7d7d72656469726563745f75726c7c733a34323a22687474703a2f2f6c6f63616c686f73742f6f6d656b61532f6f6d656b612d732f61646d696e2f6974656d223b, 1761641146),
('9tp5klghle3vms9l0k3uv4mifo', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736303936363735332e3435333230313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22397470356b6c67686c6533766d73396c306b337576346d69666f223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313030393935353b7d7d72656469726563745f75726c7c733a34343a22687474703a2f2f6c6f63616c686f73742f6f6d656b61532f6f6d656b612d732f61646d696e2f6a6f622f3136223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223663316231666661646133356165653933633162336430626136386361376639223b733a33323a223333373538323366376632393235613333623132356565656232626539646131223b7d733a343a2268617368223b733a36353a2233333735383233663766323932356133336231323565656562326265396461312d3663316231666661646133356165653933633162336430626136386361376639223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1760966757),
('alvckmlngr3dqsa99jd61jghn6', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736313535343231342e3531313330323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2239746534746168393069676365647233317469643432346c676d223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313539373337353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313539373431353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736313539373431343b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223464326665353133393761346263666338633661613833353939333130663966223b733a33323a223836303565303062366636653032633230333139613134656564643138663836223b733a33323a223762663534643033613331373037373666336632373536386230313261363131223b733a33323a226135356461626631323134623863313066363336353835363730343266363862223b7d733a343a2268617368223b733a36353a2261353564616266313231346238633130663633363538353637303432663638622d3762663534643033613331373037373666336632373536386230313261363131223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c733a34323a22687474703a2f2f6c6f63616c686f73742f6f6d656b61532f6f6d656b612d732f61646d696e2f6974656d223b4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223839393339363030663334616630333266353132353432616662633937343537223b733a33323a223438383832616630613333366633383035656439653665636336353332346136223b733a33323a223566353737376531376335373633636461353032663139616335623064613662223b733a33323a226338623634663361346539613266616530663930326666373636343530616336223b733a33323a226230346364643937643664363765656134643065356339306333643136343638223b733a33323a223637656338663966373935626636613463346434633332653638303563653937223b7d733a343a2268617368223b733a36353a2236376563386639663739356266366134633464346333326536383035636539372d6230346364643937643664363765656134643065356339306333643136343638223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223735393461663765346535306666396132343337326466346266316465373238223b733a33323a223437613330316539376164313639623633613634656339313734636134633732223b7d733a343a2268617368223b733a36353a2234376133303165393761643136396236336136346563393137346361346337322d3735393461663765346535306666396132343337326466346266316465373238223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1761554215),
('apd8om31539p68699f42f7t061', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736313635323135392e3032313431323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22617064386f6d3331353339703638363939663432663774303631223b7d7d72656469726563745f75726c7c733a34393a22687474703a2f2f6c6f63616c686f73742f6f6d656b61532f6f6d656b612d732f61646d696e2f757365722f312f65646974223b, 1761652160);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('f4p079ta574291247hsh56v843', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736303633313130352e3532353530353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226236623532316e387333316d6d6d67636c6d696e64766c686664223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736303636393431343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736303637343236393b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736303637313834343b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736303637313834343b7d7d72656469726563745f75726c7c733a33373a22687474703a2f2f6c6f63616c686f73742f6f6d656b61532f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226635653238363337363763633163356362393963316561373533343434323161223b733a33323a223238666236666165313364373835326332393835323862326537383565623437223b7d733a343a2268617368223b733a36353a2232386662366661653133643738353263323938353238623265373835656234372d6635653238363337363763633163356362393963316561373533343434323161223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32323a7b733a33323a223263656333653430663336636462333964636462303833343232653564616561223b733a33323a223430653362346630326438363935363161353264323330306138333638323535223b733a33323a226331633762626461383031333432333932316439376236373039343135396235223b733a33323a223037383965613535616439366462323737333933663138643637373135643438223b733a33323a223535613064643735643438386662353034356561376436306639376630313065223b733a33323a223130313964636363363265333730313164343063393636396534323539313462223b733a33323a223862646266313238666666336631616365333632313461373431653131313432223b733a33323a226461393239613530333563396538663962653066653733323466333437656162223b733a33323a223236316331656363393132356165386630386463643062626236653633633561223b733a33323a223038343266653935383731313632313666316238393164306234383066636162223b733a33323a223339633765633834663531643536326637326237386231323033313830373230223b733a33323a226134353063666433313835643431323161623864623638343162393536633331223b733a33323a226133343234343031656137376464373261646134636137376364646632653265223b733a33323a223537343365656363373431336634343261373436613537653133363231616236223b733a33323a223531636664636266336635336231326336393964663437363163623938303338223b733a33323a223264313831346439343336393237303637326365386666373039646232306534223b733a33323a226264643163313938396439326439393738343336616566633232393635393833223b733a33323a223839396561383261336530333664363061383664666235326438343936663835223b733a33323a223138333565656435636666616530366339376631623962333039643462306433223b733a33323a223862363030333166393931306265326431646530356166613963353839633235223b733a33323a223963393236363835396539343333393834363862616565616133653835303432223b733a33323a226233306161643737656362316133313633653930626563653030366236376331223b733a33323a223933643461613064333066323561323161306665303363653137366335623165223b733a33323a223431623134363836383638303334623665613333653064393861323735313135223b733a33323a223034613066333034656463363662613966663835366165306333633837653731223b733a33323a223332303066353930303531636663613461313336383933636561626539643335223b733a33323a223566313839616165366564333039653339306630333363316537386565633264223b733a33323a226230623338393432633230303730623439326366656635313035393138323664223b733a33323a223339386665323736333733616439633565613364383466333730306333646533223b733a33323a223964373764383036363432353334363064383139373165666334303138373730223b733a33323a223337306431366134313166613161326438376465363938356130383731643765223b733a33323a223665323766646631663535366338333565386334306638326236663432383066223b733a33323a226334306336633035656332653864663436386338663439663034373866643937223b733a33323a223435373764336335333163623865636365393634643462333839303539313130223b733a33323a223835633339613632623134343332333263396663323565373231323034303831223b733a33323a223630393134666539636264653665336233653936636133353133336234383034223b733a33323a226666323533663761333930393462373338313938316164346336326261343132223b733a33323a223038626363663331396461663538393438653038616132346635633232626264223b733a33323a223231393365333138313066383033346431343132373765303734666262373239223b733a33323a226263613762343037393730653036383834656163616531393635663163376666223b733a33323a226437653831643064333165626137303161363361623937336166636137656231223b733a33323a226563326337653938326531653061316533306439653038303038393239376639223b733a33323a226464373333396461326162376162643135626464393163663633346535386436223b733a33323a223566326563346631636561653739373430626634326365633332363939396264223b7d733a343a2268617368223b733a36353a2235663265633466316365616537393734306266343263656333323639393962642d6464373333396461326162376162643135626464393163663633346535386436223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a373a7b733a33323a223339353632333764353865323232333630336232353665336261633030393835223b733a33323a223762306164656531366434646161616132396563643062666531613737363430223b733a33323a223939653465363831353462383135313563346562333562656435336465666334223b733a33323a226263326137383837333261393935373034633036313833366438323964656665223b733a33323a223732373234326133333761363536616464306563613365333765643162653162223b733a33323a223361333334396165396436613261393739666436356435346431396636653164223b733a33323a223032356164666330396331373263313435613730343931663137373762643530223b733a33323a223831306139323832623965306530306331366637353861326331376336383233223b733a33323a223961373231653732323731313834386537326339656233336139623938373565223b733a33323a223464383933653831633935653139363366613334656361663237306231326264223b733a33323a223263633561633139313462373862333364363231373438666235383261616564223b733a33323a223835616535383534336462636563346633373231313563613032646637323538223b733a33323a223266633261396461393436643836313331643730623564623433326162613462223b733a33323a226466616163306438633364363862356333316661656336353033343664616433223b7d733a343a2268617368223b733a36353a2264666161633064386333643638623563333166616563363530333436646164332d3266633261396461393436643836313331643730623564623433326162613462223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226263363133373634656338383463396534343230326632363633656137663666223b733a33323a223333343638663363336439316663366139333439333461663333623930393765223b733a33323a226364323362623330353230363232613035373661306266346531333035316138223b733a33323a223038353866316239303762656264663363633836646136626635306632623166223b7d733a343a2268617368223b733a36353a2230383538663162393037626562646633636338366461366266353066326231662d6364323362623330353230363232613035373661306266346531333035316138223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1760631105),
('f6ur50dap9cnr0kk1mlt1c1n47', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736303634303832382e3034333336343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2239687273376e686438683965633438726d39396a333866746635223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736303638313837303b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736303638333938353b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736303638323835393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736303638323835393b7d7d72656469726563745f75726c7c733a36303a22687474703a2f2f6c6f63616c686f73742f6f6d656b61532f6f6d656b612d732f61646d696e2f637376696d706f72742f706173742d696d706f727473223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223830643463326234393738316636376631663564333037353563336365333137223b733a33323a226436633239663634643765356635383163303164336566666538633939383836223b733a33323a223537393765393436373231356133386333393161343861623431386663393565223b733a33323a223863366631333238616263373835393337653138313066356233373830626533223b733a33323a226231363233616636373931326465623265643736303430313631313466333465223b733a33323a223932353666343833393733666134653434346661663562366364616331353364223b7d733a343a2268617368223b733a36353a2239323536663438333937336661346534343466616635623663646163313533642d6231363233616636373931326465623265643736303430313631313466333465223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31363a7b733a33323a223932633332666566643833313561623932646161323138303965653662643337223b733a33323a223864373039303661306437313363353634626561646337373630616466616131223b733a33323a223165663063323966303035393331616362303830633339656661663736666139223b733a33323a223565346232343761316437633965393363306338636237643736323738303535223b733a33323a223934346537383263663666393664343531636138623238366461613931373430223b733a33323a223633363762336536313462326463353737323362666666336134396531383438223b733a33323a223636373835313766636539356465353938323738373266383263396131313838223b733a33323a226232336464393332343361663764393230613635313832353539666133303961223b733a33323a223065326164353530353737643365363636346335613735373162613233653439223b733a33323a226530666361336333386437326365336661633664303438396537643136303233223b733a33323a223433323235633732356531633634613665393736363633663234656662666663223b733a33323a223437373461393139373739653033346234306134343532633034613231616465223b733a33323a223964666130336631643836386430333739313164343264313063333334643563223b733a33323a223063313130656130383338363562363566313765316431383561633830333932223b733a33323a226232636261343331343064636232646662653036346430326133316631386665223b733a33323a223861376466353930356538316434323630663238353236613864623564643630223b733a33323a226535656534353134386561666430343663656635333061663037633839383661223b733a33323a223666346131393662366337626164613666303635366236366666306432376136223b733a33323a223732616332373066393336653266623864323061353937373037633565343563223b733a33323a223066333432626462373437303664316631396166613039383333386134313530223b733a33323a223930386536366137316534663562636139646666613135633638383732633866223b733a33323a226364646236616265663533373263643261306564633164663838643831356662223b733a33323a226630663165623661383833383437653634316166626233383332613135386633223b733a33323a223564306430663731353862626266333637356336343463626434626336393336223b733a33323a226638656465396137343937633539653934316266643238393530333062313538223b733a33323a226161356632363263346265393466383436663962376438326433353932643537223b733a33323a223365356236313738613934363932363839343333613264306465663965393932223b733a33323a223234616633316562646463316538346130323063663663653731373039376331223b733a33323a223232326632623132346536373037393535376433343637353038373461333762223b733a33323a223665636531366161373565656262373263346564643031613437326131613264223b733a33323a226436336461663866303437383765383935353765653965613561353166653437223b733a33323a223563346439343434643232346465626265313132393366353064346262623365223b7d733a343a2268617368223b733a36353a2235633464393434346432323464656262653131323933663530643462626233652d6436336461663866303437383765383935353765653965613561353166653437223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223631356261663838393664326239623434343735613732626533363533333163223b733a33323a223935393562323730326632663734376235393964353632373430336337313638223b7d733a343a2268617368223b733a36353a2239353935623237303266326637343762353939643536323734303363373136382d3631356261663838393664326239623434343735613732626533363533333163223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223533616233666632636133353132653861323634653933303036313666366531223b733a33323a223130616235643633356366396433653539303635363937353234656461646636223b7d733a343a2268617368223b733a36353a2231306162356436333563663964336535393036353639373532346564616466362d3533616233666632636133353132653861323634653933303036313666366531223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1760640828),
('i6q7cirtg7h4h997h15rs9ndbp', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323234353530342e3534343938343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2273666967386b306b33306e737575676b3074666562756e733368223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323238373135323b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323238383730353b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323238383537343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736323238383632343b7d7d72656469726563745f75726c7c733a34323a22687474703a2f2f6c6f63616c686f73742f6f6d656b61532f6f6d656b612d732f61646d696e2f75736572223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223963313932656331353330323135333833373632613332386566393139643730223b733a33323a223264643234613063323932386262356439303130343165396635376165383564223b7d733a343a2268617368223b733a36353a2232646432346130633239323862623564393031303431653966353761653835642d3963313932656331353330323135333833373632613332386566393139643730223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33323a7b733a33323a223963663665323036373435363762393332343239326661356339383835633231223b733a33323a226237343063636362623438346234363530303931633331393531396432633538223b733a33323a223938646539656435383637343533353866303463313731396365633636666430223b733a33323a223730633036383330313238653466393862396163356466323534663064383232223b733a33323a226338363562653831643162373366373063363139356463313666306631643736223b733a33323a223566646137633664633335653463323662353233626661656262646636666230223b733a33323a226564363538613836663330303133346335666166393639663732316432323664223b733a33323a226639393261383362336561663034356337313665393764653239346463643136223b733a33323a223336636434653565363537373032363266326561376339373865393365393166223b733a33323a226666376336366438636538366563316334333731353766613337636431386334223b733a33323a223961303861303261636462313164316161633963343765323034346263363333223b733a33323a226362346664616332356361396435306565356337383765613636373766396465223b733a33323a223630363432633639323862313461623562373461376431613861323738373532223b733a33323a226438656533653461373865303837636334666264343036376461373562386464223b733a33323a223839666634643437353761663133613731323264613363306133373934346463223b733a33323a223438336237363436626439633234633265383731653938343639326161336161223b733a33323a226634653734363465356431653233353532306463363963353937623466303835223b733a33323a226362353330393134643533636231353364333461393230323734306231333661223b733a33323a223262653734396138326365376161303138323232363466663161363633303264223b733a33323a226433633437313461643233636237613338643831313261633965303666346165223b733a33323a223735383234386465333932613165623666303731366636626635653664393432223b733a33323a226563356137376564656337313333616234356265636566613032393164346662223b733a33323a223133363439386661623062663663346361373333366430326635383331356334223b733a33323a223464313832613065303634613138303631353233326238306236616261306163223b733a33323a223934383433346531363764316634333666636537346534393563666235313535223b733a33323a223937666632626138663762316264373037326139393634373239373366326530223b733a33323a223936623037323930333665643533343232626232636635633162316632343766223b733a33323a223864336137323064363739663865353863636666633061333236656635333433223b733a33323a226161656432373632396131663635346262363061363033336133643137653132223b733a33323a226232613239623039353466653163333630653233636339663835303464323366223b733a33323a226239326237623563343666396539633163633862303861646230616638646464223b733a33323a223866333039376138393938333039616631643430646365356439303334323239223b733a33323a226461353733623561663136303535626162383039313966666662653232353337223b733a33323a223064636234383234323233633636323466366465396264326336396630353761223b733a33323a223061393365356465656532373335393834323531376333666534366134313031223b733a33323a226535313238656434313863376132353739386634613165393164333761613261223b733a33323a226565663234613739653139373535343563343037323462373530613164336632223b733a33323a223435376235383036633236393066643661343031616633383030353264343163223b733a33323a226233316236646238383735336337386166363666353432643932303731326166223b733a33323a223933343132643730393439633134376430656535626632346333383134353265223b733a33323a223937656462653863653937643161376634316330373930323361626535666562223b733a33323a223937343336636238653465626266306666666162366365303039623264666430223b733a33323a226363653536356462366434626631346361656334663064636430316265303762223b733a33323a223430656634333835316464393536383839336633663132346662636262303631223b733a33323a226632346337353263323737363833343238353438396437346366383538623732223b733a33323a226632343163343934656331316533366330626236663835303030313535323334223b733a33323a223437323933353961316336396235333237396338653963366532333338316333223b733a33323a223265373239643533653565393730666237346465333938633165353566616133223b733a33323a226634336236626262323132653966316665383264346163633631616239353761223b733a33323a223035313337313939366431663830383633666432316537323161616337643138223b733a33323a223035383835363632346438643062313364376161386236353933616338323534223b733a33323a223364313533386533643237653536613663396365646264306166343366343134223b733a33323a226533646130383431613864646362653537663239316133333262373432363536223b733a33323a226631333561323436333663366261323539656436366533343736623330333463223b733a33323a226535373836373235626664383961313065383061373635646561653037356534223b733a33323a223033313236353165353930376566616336656466633733333832333066356230223b733a33323a223766366163626565366566393636336465666332636430376231343930653036223b733a33323a223339633238613534616464626639636230343931613737323762636337333435223b733a33323a226336643564313166653833653862653739646339623964663162336562356230223b733a33323a223832356635363866343437313730343332646561623639306534643966633866223b733a33323a223636663761366635376637633166646334383163636531623235363433633234223b733a33323a226261326662323338653463653036326433333864333336343138653435393834223b733a33323a223638313336616335396163633638353137353334346566373266646135373034223b733a33323a223230373639386538313466326330663331303631346532633636616137653865223b7d733a343a2268617368223b733a36353a2232303736393865383134663263306633313036313465326336366161376538652d3638313336616335396163633638353137353334346566373266646135373034223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223733323935323532306435313430643531373033333030633138343133313133223b733a33323a223365323961623933656431333539326435383533343832623061646333663661223b733a33323a223963646538376333313132356162386262653262383262643932663564363962223b733a33323a223466346631643631316632363533383535366465366462343265653539346262223b733a33323a223263616264363130626534353737656461366337386235333761383465383731223b733a33323a223335636562653930613037313761306531643265623632326664303561613135223b733a33323a223462373731373161633432633430303838633834663838343564633737613731223b733a33323a226263346235633161643639306432653135356232363062353232333334636633223b733a33323a223334643961336639613135323762323339316663613363313530633066343766223b733a33323a226536336335643132636431323638343766346336343464313161393638383937223b733a33323a223538393430373138653261626235666336353734643234326665356239373564223b733a33323a226333656332376239373436653934643765386365373631373162333630353332223b733a33323a223638363932663765343062343761396536333265396661303563313064623131223b733a33323a223261383964393934613265366662396238333832373761616664623263613864223b733a33323a223061393135623962366563653339316132323363616431326330323265333664223b733a33323a226335316163653133393364346633653738306331633031313436656562383039223b733a33323a226634663433373732626363323330376333316433303331363933396639333135223b733a33323a223261653938323733323132636263623864653733613934383933643830346363223b7d733a343a2268617368223b733a36353a2232616539383237333231326362636238646537336139343839336438303463632d6634663433373732626363323330376333316433303331363933396639333135223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a373a7b733a33323a223733336435386430323238633163366461643664303464613430323639646635223b733a33323a226131623964646337323536616462333539656364653366303131333438353364223b733a33323a226266323765626137353963366363336161313731643733656132393664386461223b733a33323a226331373433653334636433303364373536616266313364653331653333316535223b733a33323a223631393562323566653232653364313763336334326131396237623136616462223b733a33323a226532326439303733643434393838613437303231303632626135316562666635223b733a33323a223833386533663261643136363732343433616335333832613334663763383461223b733a33323a223930353430333830646339333033636235343061393566323962626438636261223b733a33323a226137383537666434326430663932613666313630626636656637643233373965223b733a33323a223936666562363965343533653335626365656230333461383464363961666262223b733a33323a223765633233623139353231633932376138326436616636373939396137396434223b733a33323a226165303436653431336533363430396566333430363535643538613561336139223b733a33323a223637616132383462306364623639393730343633373938626431383661346231223b733a33323a223538363635346632643963373738643163393934356536336539643434353635223b7d733a343a2268617368223b733a36353a2235383636353466326439633737386431633939343565363365396434343536352d3637616132383462306364623639393730343633373938626431383661346231223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762245505),
('jsbgf36adln15deigearinr4es', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736303731343633312e3332353538393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a73626766333661646c6e313564656967656172696e72346573223b7d7d72656469726563745f75726c7c733a34343a22687474703a2f2f6c6f63616c686f73742f6f6d656b61532f6f6d656b612d732f61646d696e2f6a6f622f3131223b, 1760714631),
('k8bcegk63tadmbrblb9dk2e0ai', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323030353634392e3033373139313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b38626365676b36337461646d6272626c6239646b3265306169223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323034383835323b7d7d72656469726563745f75726c7c733a34323a22687474703a2f2f6c6f63616c686f73742f6f6d656b61532f6f6d656b612d732f61646d696e2f6974656d223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223864313835383033633130633831333566366633623263343938623935356264223b733a33323a226163323564323764333736323165313165303537636535366137323663336263223b7d733a343a2268617368223b733a36353a2261633235643237643337363231653131653035376365353661373236633362632d3864313835383033633130633831333566366633623263343938623935356264223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762005653);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('kdp3lpjqbnqdpd7djt4tle5mkp', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736313735383138372e3736333836313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a7238653967323336626f68616f6c3662693361313235723961223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313830303932343b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313830313338383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736313830313336333b7d7d72656469726563745f75726c7c733a34323a22687474703a2f2f6c6f63616c686f73742f6f6d656b61532f6f6d656b612d732f61646d696e2f6974656d223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223937393738636435613262303461386339323135633431613036613239383264223b733a33323a223835383937373561376431393633303663323634323766383235373564383861223b7d733a343a2268617368223b733a36353a2238353839373735613764313936333036633236343237663832353735643838612d3937393738636435613262303461386339323135633431613036613239383264223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a37323a7b733a33323a226661396163646132356431353130303565313836383037313364373661396464223b733a33323a226232386338653166663533613535373231643435313038393564316531623466223b733a33323a223433623536636361326232613833373334303835646236313735666239333135223b733a33323a226230383131316231323837393937346265613231663062626131383838613966223b733a33323a223033633966373033646663613830336132396538373934643030353638633539223b733a33323a223336363961633537356430393663616134326238626163613265663631363863223b733a33323a223663386638343633306432313765363234643664616265653639633031633765223b733a33323a226334653362383837613930313865323261353466623061616130373535353165223b733a33323a226663346635623166393462616231623962636561306461306635633532303739223b733a33323a223938363864316538646263333032643335643261356534656662366534643236223b733a33323a223335303431333665383135316461373335316666636663323861613535616535223b733a33323a223036383563663638663839663031656665616233396563646266396633646638223b733a33323a223633333263356566633335376632383931386632346462343434633162356537223b733a33323a226634373130353764646261343337396163393838643762316161396535353730223b733a33323a223032646534616334643033613534363533633233353064626334373433343735223b733a33323a223436363435346263643035626464646263656238613434303134323635633363223b733a33323a223966646235356135366563373439623436303930323738613730333136653361223b733a33323a226265643734356464333565663130396264656539623737653838613162613732223b733a33323a223633393465386464323662323865396432646536326461623861666563343463223b733a33323a223861653166303530303664643832646430656338306563326263643230653764223b733a33323a223861663638333339636465643964313833393466333037303737343965613230223b733a33323a226135333763346465323764643034663531376634306363656635376461393032223b733a33323a223834363635373636323566336330333430663962646539376635346362303432223b733a33323a223965616563353135316133666362356166313437323362326534396636366364223b733a33323a223832653134623161363665393439653834613737333234303634616130636431223b733a33323a223532653135653564336437376635333165353734323363373362663334633539223b733a33323a223333363631323838303161343438643235323764656663373531633264376364223b733a33323a223962346636623536633235313832663736376466623130373433366131313435223b733a33323a223765303063613638643631383133363637376336636135636534626639633038223b733a33323a223633626366323764383361373438656339656464623632376434323936376162223b733a33323a223564393563336662383234363637626439623764396332323235356530346461223b733a33323a223361323763346662636561313866363132353034313230616432666638656531223b733a33323a223637373063386539303736356332343131353234363035303162323736343834223b733a33323a223939316235346664636564353066346534306432393435366334616162663332223b733a33323a223164666539656438353733623366366561633364396563303862343466643138223b733a33323a223032376636323331353038306332626436643938373639626136323335653066223b733a33323a223336303234663065363531306434316266313135336162343266643437313433223b733a33323a223935653537313732633362623663333237313661646138333239386530633664223b733a33323a223434653534666262373436653833326563343030643162316139303962343432223b733a33323a223934353633323262326163386532376134363864343265343533653262626663223b733a33323a226561346232666437383266633738333037353338343139306665666637326634223b733a33323a223666656139313136353661303439613537373964386230663862376632336437223b733a33323a223839616331663766613832393034623561393464616163366564343739663435223b733a33323a226137626433376463636637633633306436343062396335376231316237373066223b733a33323a226433306163336534616531326435376639376362626563636332663630306366223b733a33323a223436353065323230386430366361343564353663636464333164623639326236223b733a33323a226538383964396232323861663763633430616463646365316663353937356661223b733a33323a223230356565623164366538396466393965343264393466336561363836633535223b733a33323a223233656433653938373531663965613963313432393861323639333363333463223b733a33323a223836613036376662633938636530303336663537343961613662653966313661223b733a33323a223734333633613031633431326239393639613235353161323565643634653038223b733a33323a226637663133323833343135363864643964373563616665633731633832336333223b733a33323a223835623062646339646237313939346630396231363064306335346462653639223b733a33323a226262326235353065393033386538623435316531373834333734633035626233223b733a33323a226665336332653332336661623731323035366232343036663135323863643561223b733a33323a223239613437343632386564643439383730653538323031353661643732366133223b733a33323a223862643961316337353932656335646538373939366532333236373063646539223b733a33323a226538633266326139356164326433323136613232366462373236396139366436223b733a33323a226132336362343138636166343735306430306332353536356330373463396465223b733a33323a223533653366356662306232643464336632653339383363306365323731643934223b733a33323a226638656464633938626137333964643732356162363032326462356165633866223b733a33323a223134373639636231373330313130646237616262363865613730303762336263223b733a33323a223035396232323336343036386664393430316335613930353863316536353633223b733a33323a223438666633336633623330303534383433616335316364336538373435346366223b733a33323a223535616134366534356666356235373662623636353839396231616162343966223b733a33323a223264353034633238366136386263663230633563363938326665653834623831223b733a33323a226231666165373536363635346133663031363334373033613534366263336135223b733a33323a226439643465663431316565346534386431356463393333623531313135353862223b733a33323a223338316337326363323362653435386635643234633934663531303465306533223b733a33323a226165653530646566356362326635373063333066346237393337336365643637223b733a33323a226130613865633633343733376566313033313466313765666163653839313937223b733a33323a226265303164363463643634363335393930643161313138616365623862613831223b733a33323a223833346130326330623630333865633537313334663830363832363865303037223b733a33323a223636616465363166643133383533316166356336383863633362643565356137223b733a33323a223061383636613535343839316537303465326666376234393962396131663538223b733a33323a223833643135366432616265656533616339663335316632663434383564383065223b733a33323a223334633133333033653138373532303766656130353538646539633634613131223b733a33323a223166303730633334353262663330313764373564306234363336333035333536223b733a33323a226332356261323433656366336161303131336632306663346233636539623762223b733a33323a226234303839643762623964366435323235383430653537306131383339653866223b733a33323a226136633662626664343663313433623630323162353338383939646661313664223b733a33323a223139326665623230323439666630623334343438363438396364326530353631223b733a33323a223366306137363764303334356138353033383038616162303237353464393161223b733a33323a226533666336346163306539643431313962623339313232353439333331363964223b733a33323a223838643432616465313439346235336364363061393430303335643334616430223b733a33323a223163643864373439306434383563346663316334616537366634376234623435223b733a33323a226333356532356634313364326536623462656331663633653830323464323733223b733a33323a226663633261376635613838656439373532613333363837363735393864666539223b733a33323a223136616430343663376563356661626361323835346236613432343339366337223b733a33323a226536646166353361343437616339356139353164656433646563333638353832223b733a33323a223734623564623532316361373066663837613533393532366334653063663266223b733a33323a223330633738323838633030303937666139653166653535316234386232656339223b733a33323a223662383335326138633433643731623638643761633937623961363333626636223b733a33323a226336666663396332626463366135393462356562373531313033303464333264223b733a33323a223461343437323365393931663539653732336138626465666366646434313834223b733a33323a223231646431346561636531666635633163653038386436623430633732653235223b733a33323a226466353765613431316533646662316166656665343264353761383761376238223b733a33323a226139376530343831313462626630333131386632393438333864663033353637223b733a33323a226139623235613765343762363032626531306530643363396530393564663030223b733a33323a226565613965346534346238336535306232303064373765326230333933353264223b733a33323a226333336263386135373932663930636133333661306432303836346635346133223b733a33323a223531623135383033313733313662653265666234323734633938323635323465223b733a33323a223530616237646164653162333364316334386436396336626239396663383539223b733a33323a223566383337613630633533653864653962376237343431646330323564336438223b733a33323a223061623962313666386434303034633830396133636532653532323138316533223b733a33323a223032323039636566303563323262633962626530393338333763613632323237223b733a33323a223930356132623363313634373635346135613464616561326263656164373633223b733a33323a223439633233626632616232353038326263666632346331386136313264633666223b733a33323a223630363762373839623633646537646530303333313836373735316531383038223b733a33323a226337303762323637356665303634393136623630616638383130656466303639223b733a33323a226139356563663635643166396534363035343337373966366235383565653961223b733a33323a223631303764303435396539613133626565663937386230636136613330326237223b733a33323a226362616464616434663961623765313065376162313266353065363637333464223b733a33323a223364383931656630646235383438376538363633643031373330656533653534223b733a33323a223634643231616537383734303138333264626637366234356363303062326533223b733a33323a223337376266316139356663636566643763333966616135373738343937373534223b733a33323a223035313563623935633833323565313061346635326461646338376662663563223b733a33323a223939646439326539316535306266666366303731643465633162633462323364223b733a33323a223936343662353461393131343430613538326135333334656237383739663931223b733a33323a223537343930623734613938636636653334616630656538316164626439626665223b733a33323a223966363866346161636565363734306434343534363232323561393663346439223b733a33323a226464343736343464323864346138303361353165396433356361396663346433223b733a33323a226237323462633161333434333062323963326662363432343738346566303931223b733a33323a223939653739663764643965333433373061636131653532363839346564386136223b733a33323a223437376139323533306363623730636239303438623032626132653838626330223b733a33323a223434303862653036633136623365616633323438323934666335626165616365223b733a33323a223234346565333937383033303662333333333565373639383236653064633861223b733a33323a223866393130363137626363653064663532313263616565623561383235376264223b733a33323a226564306339333237313438323866386565313539306437363265303761393932223b733a33323a223864656539323934626363393264303638313164343535373134336330376130223b733a33323a226363626231656234623333393835356633623036613432666135663536613834223b733a33323a226463616430376137613833643330653232313539313864376461383834343839223b733a33323a223931343935386431383465306135633839303065353362396231656537383634223b733a33323a223139663134336634643063376431626636323633613036626164353733656332223b733a33323a226330653266323030643932396439633535366433346639333362636230363762223b733a33323a226163633435393864343731333765336437646235646234653332613133323162223b733a33323a223764623965636162633664306535623466663039636332366162613632326134223b733a33323a226333353633623931323463366265346330343766666335346439666263326537223b733a33323a223663366466613839363036316162383066353538626366343862386163366165223b733a33323a223139656161653364336664646130313936316438633534303662663434353164223b733a33323a223432393961656664643737616632633235393464333538613232653133636163223b733a33323a223832336366366563633734616232303730313562316331613062373339313634223b733a33323a226536393038653634636432613430316237396439373933663338316563613633223b733a33323a223561376136383633336164623234363034613964353063393039383962643962223b7d733a343a2268617368223b733a36353a2235613761363836333361646232343630346139643530633930393839626439622d6536393038653634636432613430316237396439373933663338316563613633223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31333a7b733a33323a223833366139616561323434633639326237366466353631633633633133656465223b733a33323a223939376631636464616564343662396432656635356631366537626461343830223b733a33323a223364623639643537336234663566363130666537373866383131383132343538223b733a33323a226635616663343836363938366133636432363732333133343631653839396635223b733a33323a223538316466343639356466623739343938316162646134353763623731643664223b733a33323a223138313561373738623339346234353233653663396533353361393130653263223b733a33323a223338346135326231653034663231383735643263646132373634633261376630223b733a33323a226339343864313231356237303436393963643432343961366462623335646335223b733a33323a223731303933623962393031393238376263336239316333323038633734323966223b733a33323a226431333266363765396130663637623839663730393361393763613437333561223b733a33323a223835366334373539383035616232633231633831303534343362356463616262223b733a33323a223231313939353837626338616438646666333633616438383134373666323566223b733a33323a226533353633663832356464346662353766303562356133653166323662346630223b733a33323a226636333662613137316333646565656439343732303836613262343933316363223b733a33323a226639393738353937663330636330303035336161393866356636303931393134223b733a33323a223533636239633639366137373663623762383933626535623564623536653736223b733a33323a226338633333643732663834393933333232333665313939393134616664613965223b733a33323a226465323539313638316232356138353734656639393164303539323763393936223b733a33323a226530666134613961336631636131616136313938623336646564313563633332223b733a33323a226131343366653238383264373930643732353864336635646539613534386233223b733a33323a223733646236386637643161313962643262353564623938366138306239356337223b733a33323a223730363064353234336664316364633733363562646134386133383231666336223b733a33323a223536326237633663346165383438336135396263666433363566653634633364223b733a33323a223138363161353865643466323463313665616631626266326663393136366634223b733a33323a226566663233613939373532366232356238353738353930666536376533383031223b733a33323a223837663537626565633563663062396261336433366334353165323236323538223b7d733a343a2268617368223b733a36353a2238376635376265656335636630623962613364333663343531653232363235382d6566663233613939373532366232356238353738353930666536376533383031223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1761758188),
('lunlr3ae9sl1o7lsbvrvj7hln9', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736313635333733322e353132323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2264733974347164703968356f646b726a746c65763363646f6c6a223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313639353336383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736313639363432363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313639363336313b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313639363331363b7d7d72656469726563745f75726c7c733a33373a22687474703a2f2f6c6f63616c686f73742f6f6d656b61532f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223461393835653230363839363463323965636332386338373261326166383232223b733a33323a223932386636303565626165383235393831353138636163333731373761623036223b733a33323a226561663230613132336265306532353032613361393339663336333131616466223b733a33323a226566333139616666303933333966386531636235353862653036616261376439223b7d733a343a2268617368223b733a36353a2265663331396166663039333339663865316362353538626530366162613764392d6561663230613132336265306532353032613361393339663336333131616466223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31313a7b733a33323a223435386430366666353065393431633362346237326535613231316533396234223b733a33323a226265346166626236653663373166353333643636326364333062653736333333223b733a33323a226361366431326636353635656237386433656361363733643837663034653961223b733a33323a226264616439383030396335386263323261323634623237323532663930616136223b733a33323a223432343961376233636139303339323866623633336332393834316337656461223b733a33323a223533643438383136643430386530663763383733386539623536303539666238223b733a33323a223432373361383334666465623739336536333438626562633337323537386133223b733a33323a223335383537356337636563623135663638376464643436303034313462373862223b733a33323a223230366364346164353666313239613334343330663736346336303432656563223b733a33323a223366633664613165623139613664656130383062336237363838396561316462223b733a33323a226133366331343934366364386130303735343139386332643631346237333234223b733a33323a223137616564663330666362633736643734363666303739306139613135366137223b733a33323a223166393966326564663964353632323862616436353565643464343661303837223b733a33323a223766666534393138613331373762393634613133653164373166623836653637223b733a33323a223764333431666463383063323863326639636162633531396138333634393238223b733a33323a223439356262343433313939633531313338363461333633336266636139343163223b733a33323a226139333837646237336363356234313665303638313830353835323336646339223b733a33323a226331363965326464383330376465616237386131393139653866613634633037223b733a33323a223939663832663132353162303064303066303562646232333261653931663261223b733a33323a226330323731313763303261663734346431343363363739393832666332623230223b733a33323a223231326466613238363933376234396638633862353363383861663533373561223b733a33323a223538393934373863353034376133636337363437376236333262363139636466223b7d733a343a2268617368223b733a36353a2235383939343738633530343761336363373634373762363332623631396364662d3231326466613238363933376234396638633862353363383861663533373561223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a226539393737393263626434343061353536396632396430396633643435386137223b733a33323a226130623364363233376534366432663439663062343131393464326166326664223b733a33323a223162353663653264643939333231663131386464656463353863373064623632223b733a33323a223230323831643732396663396537356631366465333965623734333064656239223b733a33323a223761643761393432333565623534613237636334336336363331333566336133223b733a33323a226534636230356132646664323733393433633465393264636362333232663735223b733a33323a223637323166656636313731653435363634663061363538333235663639313161223b733a33323a226534323536633634316439303434646231303961623338363833306233663161223b733a33323a226233643037383463626336643230646231363939636465376135633539363138223b733a33323a223437383334663330333238353331326535663761333734623963313861373734223b733a33323a226462376231366363666462656532303734313061303839306332343637623337223b733a33323a223534366432356635306566333632373532626533346635323533313138326431223b733a33323a226137666234366162373734653663636131333263663661623961363538306230223b733a33323a223032326332646462666462373437303464376338396133613866323432633630223b733a33323a226232386236633332303962343530366463303933376339396665613462633137223b733a33323a223265393833383664656539383064643764643665633066333036363839313335223b733a33323a223562313533303866303832306131326233373036646366616539356230363763223b733a33323a223436336361666463616630363761306262363837316133303764343665613236223b7d733a343a2268617368223b733a36353a2234363363616664636166303637613062623638373161333037643436656132362d3562313533303866303832306131326233373036646366616539356230363763223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226534366537316239326239393435303837393630373163323536656133626537223b733a33323a226339303739323962656262633562646264373632373766313635306235646165223b7d733a343a2268617368223b733a36353a2263393037393239626562626335626462643736323737663136353062356461652d6534366537316239326239393435303837393630373163323536656133626537223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1761653732),
('m8j9rvdqpcf1hl9l1bsguupd6c', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736313634333132342e33343735313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2237327465393464656533326e6535646b35326766753337756e6b223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313638343335363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313638363331383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736313638363332323b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223435383237303438363335386532333635366137623737306233633435663364223b733a33323a223434396439373834386230303362373837616165346332646536363861663262223b7d733a343a2268617368223b733a36353a2234343964393738343862303033623738376161653463326465363638616632622d3435383237303438363335386532333635366137623737306233633435663364223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31343a7b733a33323a226331316662393931316165376335323730343431386431366638323265653930223b733a33323a226431636162316132636130346532343838376532653461396561373463343337223b733a33323a223831646263623538353134303033383433663461326366626331323363323336223b733a33323a223239373339383961333930386163626131376164313934616638393466623463223b733a33323a226132663037623363643633336162363630353633353237343162306666613737223b733a33323a223663656233333936396530636130613836353461666435616564316466613032223b733a33323a223930333134623965353231363238666563326634333432303237333665656439223b733a33323a226465376637353532623434313432643234373531373063336235386363353564223b733a33323a226637313363613337323465343733663064656636366361376230386432393861223b733a33323a223334326337346636373836653239623936333663616335393837366332393436223b733a33323a223936343935323663366631303464376465633833613831323765366161616264223b733a33323a223536373235396262353265616235653661396264656434643037656633303634223b733a33323a226630343532356130613564346630366635363266633530616333386562626166223b733a33323a223964383537613834346330393363613730323639386532323365356332616663223b733a33323a223861633438396531386239303733313263313136353765356131623536646632223b733a33323a226563376131616439323635316231643761323763306138343661626136306463223b733a33323a226538303061373535396432353032353936623539386132363536333865353737223b733a33323a223565376334363834616162376138636532343261366336663264616435373635223b733a33323a223562343864616630323839323836656432646538623733616562643333653232223b733a33323a226161303838373863316466636637353565663931346661633265316261333036223b733a33323a226235343662333239333061613738646565646231616437353337646336663561223b733a33323a223935653837633566636662353531323761623333343663396362333135326335223b733a33323a223335623232303330373566386465643530323233666338616666636234363263223b733a33323a226562316636376666643038366262383936356564646261613339346261313639223b733a33323a226433643065653661333732343663663930656234363165366438633464333863223b733a33323a223031366635323165393131323833383239333039653264613130616465333836223b733a33323a226335653832613831646662396662386563363130336162303263373963313738223b733a33323a223563353133313461636166653865613333626165616461633861316563336535223b7d733a343a2268617368223b733a36353a2235633531333134616361666538656133336261656164616338613165633365352d6335653832613831646662396662386563363130336162303263373963313738223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226566663437623261373133323337393434626466316361653833303536323463223b733a33323a223465306133663462633435353334333530656234356439326462363232653137223b7d733a343a2268617368223b733a36353a2234653061336634626334353533343335306562343564393264623632326531372d6566663437623261373133323337393434626466316361653833303536323463223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1761643124),
('odve9o2u5ps06bnh12ebnobbl5', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323033363037392e3834363932363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f647665396f32753570733036626e68313265626e6f62626c35223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323037393238343b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223833313564656661653766326137653030343862373437636533336239636132223b733a33323a223733613061356266663136643839383834653636653535313633353230373036223b7d733a343a2268617368223b733a36353a2237336130613562666631366438393838346536366535353136333532303730362d3833313564656661653766326137653030343862373437636533336239636132223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762036086),
('p9qjvrrf9ciiqo51kqcnrtbrvd', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323136333138312e33393539383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2271336d6a757473613864376772346e74623067696c6138706b71223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323230313631333b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736323230363335393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323230363338323b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223034633133376231323832656230303664333634616366623462666538386261223b733a33323a223666376434313163393961663832623633353439383630353632343231336664223b7d733a343a2268617368223b733a36353a2236663764343131633939616638326236333534393836303536323432313366642d3034633133376231323832656230303664333634616366623462666538386261223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226563303535393262646639393439376564303965633163303437396530613735223b733a33323a226365323265396233663366323835303565653932316538393738653337643166223b733a33323a223936613436313361323236626633383064383135353935326533363362313335223b733a33323a226232333732396431343965613863363262656438623761643864633333633538223b733a33323a223930323562356534383637643164666464633439303963333032343265303462223b733a33323a223735613265396634333164656230613966613936343831393564393866313335223b7d733a343a2268617368223b733a36353a2237356132653966343331646562306139666139363438313935643938663133352d3930323562356534383637643164666464633439303963333032343265303462223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223731306630333733383264313866653464373933633766313031643638313636223b733a33323a226362353265303736663861393766613734383833313234626339396166663363223b733a33323a223338613633346337653030356637663363613461346631666136306362373430223b733a33323a223563663538336533333439306336616637396164653861363136663136316136223b733a33323a223037633930346332386133626135323639333432303537373364623334623639223b733a33323a226632356266633263303465333366646566326537623066643334386137386262223b733a33323a223830356631613038376137666636613266386638313461626434333237343836223b733a33323a223464633333623564343465333035303933303063373836373535616335363332223b733a33323a223461323837383430313239633532626436383732313565313866646136653933223b733a33323a226631363233393264646134303663376131623433616336343631623765623431223b733a33323a226337623937643866316335356534663435383662313436383265343331333337223b733a33323a223033386131633565346239633164623664623436393233633836373733313761223b7d733a343a2268617368223b733a36353a2230333861316335653462396331646236646234363932336338363737333137612d6337623937643866316335356534663435383662313436383265343331333337223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762163182),
('pndj999i92dthcp1d1fdp4bulc', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736313634313135352e3735313734393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2237327465393464656533326e6535646b35326766753337756e6b223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313638343335343b7d7d72656469726563745f75726c7c733a34323a22687474703a2f2f6c6f63616c686f73742f6f6d656b61532f6f6d656b612d732f61646d696e2f6974656d223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223331343566386463663139336637336663636434343664636264363263373331223b733a33323a223364646336326439623665653534393962643064643663656237636466303130223b733a33323a226364376138346332396434666339613765343663303565396332376533653130223b733a33323a223332373936323432613131636539646538313163626339313562616431336136223b7d733a343a2268617368223b733a36353a2233323739363234326131316365396465383131636263393135626164313361362d6364376138346332396434666339613765343663303565396332376533653130223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32323a225375636365737366756c6c79206c6f6767656420696e223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1761641156);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('q31aimv6q5ssjca62htcc3i2dm', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736313636333130342e3734393632363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22696e6a3469303365376a7670656d74323937753134396f357363223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313639373135373b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736313730353632303b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313730363330353b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313730343530393b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226237656135346664386431373733636264666466346637636433623833356561223b733a33323a223632306461633232623266623730316561326638326636366236383863343166223b733a33323a223131383832613033326237663732373133343335346130346265353837623434223b733a33323a226630633636343939613232346330623833643961653739303132306539306136223b7d733a343a2268617368223b733a36353a2266306336363439396132323463306238336439616537393031323065393061362d3131383832613033326237663732373133343335346130346265353837623434223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c733a33373a22687474703a2f2f6c6f63616c686f73742f6f6d656b61532f6f6d656b612d732f61646d696e223b4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a226131653037363236313437633138363237323231643532636663643363653963223b733a33323a223635386634666461393734663935663966396638303532653439646636343166223b733a33323a226336323562393337656538666263343538636637643231383336656661393530223b733a33323a223533393830363533336336323665313931376538663031326334333837313834223b733a33323a223036633633363537653634333465346462656234663464396230613630643331223b733a33323a223863393361353232343964623135613333653530373134363437666334363863223b733a33323a223064323438393066363563306235343237353666383031373639376139383331223b733a33323a226264393538373038316138326430336361333266646230386434636166623762223b733a33323a223338346133343565393661333765333239613133663864356339353265343038223b733a33323a223830383330633263333362356533643533386464653638386262326164653435223b733a33323a223135313233333939356263376562386638656431643535353335323633353230223b733a33323a223838353630386264323065316661613563343534376666663035393935303266223b733a33323a226333373538313332646339656537613166343465623762333064613963333732223b733a33323a223239636634306536656563333430663638333435643632663532353961633032223b733a33323a223633356534323163353731386362366364656564316336396130613038623139223b733a33323a223961663164343164393463393864666366373038356364666230356362636665223b733a33323a226534396264346436323836316666663434613235613330306162666330333235223b733a33323a226330373935663530393530623232373337333963663034383662623732643665223b7d733a343a2268617368223b733a36353a2263303739356635303935306232323733373339636630343836626237326436652d6534396264346436323836316666663434613235613330306162666330333235223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31373a7b733a33323a226562363033313032363633353265616562626365663936303465386130343632223b733a33323a223938366335613561323964323362666164333064383363363037386562303636223b733a33323a226163633762613236303337353334323230303466663537623933363533316263223b733a33323a226561646461373065376462316439393133396138303530343239613239333433223b733a33323a226164623464333136663361623863363633616164363634363265623131383436223b733a33323a223564343530326331313437633638306638633561393831613535616238383935223b733a33323a223664653263623565356530626331316133656236396538613364623934333835223b733a33323a226131633232373763376661346665363761383563383165313764626365316461223b733a33323a223038356162333135336665623736646132303038333861346130353565393538223b733a33323a226165616265393937383332303834303533393265643938646332643061366239223b733a33323a223030306338373732336136316339383330323336663337613230636461303932223b733a33323a226565336238663130366237316561613162376162643466386661633963646166223b733a33323a226430303265666662663637336239316331646462616633383834353562666336223b733a33323a226634363865313661333634376361616537313963363335336633626130383564223b733a33323a223233626262313930636535373261373064323933396333636265326130646237223b733a33323a223638656265636237613537623733323035613562336531383333343637656362223b733a33323a226438306662303636356634346535366334363732663762653031623634623166223b733a33323a223735333766343432623835343838333237366637633235656665323164333334223b733a33323a223562303536633532303736303033303763326130636133623963376330373139223b733a33323a226331613939643236663033643566316433636439666464336134393235303137223b733a33323a223533373662613630623736633737323437656438383764653933343462336532223b733a33323a226636363633636261333963663730656636396435633532643036636237623863223b733a33323a223735313136616466623532626165646437623562343463363331393530663962223b733a33323a223134306638646662343731666339393134383831346439643830646161326632223b733a33323a226563643138393732306637643764336566623630653237643835643038356239223b733a33323a223538333137366431633237386237633038616338626164306335383736656638223b733a33323a223237623736323330626233396163356437326639663632343663626363396532223b733a33323a226139393563653463383832353164323964646265363235666533643531316664223b733a33323a223163373862376332383639323566643163363662363132356630323833623131223b733a33323a223233393430303163353861373262323766383936373837643563666264363762223b733a33323a226535323661313039663631653966363630353430386238346164633738613136223b733a33323a226133373732626365626334333434643932313130353530613139643832646234223b733a33323a226532306538363935653662306137346163643938383666623639376466653636223b733a33323a226635396465666437313965633765666338363237353164393937306438306435223b7d733a343a2268617368223b733a36353a2266353964656664373139656337656663383632373531643939373064383064352d6532306538363935653662306137346163643938383666623639376466653636223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223131376635383134633164636634653265653762643834373061633539316133223b733a33323a223634366265303161336161636363393934616162313565636362643734663964223b7d733a343a2268617368223b733a36353a2236343662653031613361616363633939346161623135656363626437346639642d3131376635383134633164636634653265653762643834373061633539316133223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1761663105),
('siu1va7kahncek6ormgf4fcjc5', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323432383232392e3830363935363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233396f76676d686b76717539743633626761633535316e366474223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323436393732333b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323437313236373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323437313433303b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736323437313432393b7d7d72656469726563745f75726c7c733a35313a22687474703a2f2f6c6f63616c686f73742f6f6d6b5f544879705f32352d32365f636c6f6e652f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226365623030623539666135326564636534366133396538333763656134346266223b733a33323a223061393333613933343631646439323535393763313739613939656630346538223b733a33323a226163376531383262376163353031666530643262303264643063316431383131223b733a33323a223761636663626332336533376630616535643965343663636462643131353236223b7d733a343a2268617368223b733a36353a2237616366636263323365333766306165356439653436636364626431313532362d6163376531383262376163353031666530643262303264643063316431383131223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223639646634393766633531383631636531633665306463333837346333313938223b733a33323a223266653334396239356539303265613032613834393836346339623032323665223b7d733a343a2268617368223b733a36353a2232666533343962393565393032656130326138343938363463396230323236652d3639646634393766633531383631636531633665306463333837346333313938223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31373a7b733a33323a223266633532663766326232343039393935636563353434323961326437336362223b733a33323a226636333166616531333962633536376237323362626264343736346136663263223b733a33323a226637353563643436663236306431376264343335663234666630653137373533223b733a33323a226632663935626433623233636237653836306434346531353163326332303233223b733a33323a226539316366316230313133666636663436353266623762663935643734326631223b733a33323a223931353835633231616334633962666239303966336561373430363966666130223b733a33323a226530363733653838653832366139343533396238356365376533656464303564223b733a33323a223133303237343632383863393333336265316231643236393565326437336539223b733a33323a223634663164636138653666363634373831366264343465383037633662633838223b733a33323a226463616438636430653034373365333632316136333365393936663666343639223b733a33323a223130353034343964663565663034623265326230343766306231633332323461223b733a33323a223030346161333835363266383832636162383036646562626139336262356433223b733a33323a226639373034336137663932333236633135633039373234346565636562666535223b733a33323a223338646232353335313237646131303364666134613966616332656433383065223b733a33323a226535623161336536313861363534616133633561376263333734386333376462223b733a33323a223630393361666461323632333363303266653732633635643334333263306261223b733a33323a223063393930303863643936393639303730616664653064323536366634343234223b733a33323a226238373139316532343233656631613938316464396234323961653731366631223b733a33323a226666383463633861626661366465643666653438343939373963306262663365223b733a33323a223630346431373739643063373337613138363238626265393336636236343835223b733a33323a223763626436313130366337303831613236323038373330353838633065393965223b733a33323a223535646362666163326430633135353332653631366639663038373231303861223b733a33323a226632363961303239363664306530303032336431643666653465336164383134223b733a33323a223538363561636161333735653263346236306137643736353937666430343233223b733a33323a223137336466363732623135356433356339373931613531653635643132353366223b733a33323a223836333838336131313731313831343062363531323261346334393531323066223b733a33323a223339343766303239303932303731653430666362366562383236303562656266223b733a33323a223661326664323231633038373533656235626439306332623561386236356361223b733a33323a223630666534326634386565663730656235386166623436343666623465663538223b733a33323a223061373934326564643831363934326635616563626566363365393839633932223b733a33323a223131323735613466623766316230393231653032663035383433303931346436223b733a33323a226134333163626539383932303437653736393336386265636134333962386639223b733a33323a223861353464646234336235386361386538373462376432343964653130643461223b733a33323a223230313434303035633666383162386239323664356231373061303330373330223b7d733a343a2268617368223b733a36353a2232303134343030356336663831623862393236643562313730613033303733302d3861353464646234336235386361386538373462376432343964653130643461223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223964386461353764653935663638653962303234353736656437316663303336223b733a33323a223166663135663061333363396162396532363737393735363132653736373061223b733a33323a226461666565356134376139313838626162356161346235366132616364343031223b733a33323a226566393732333066333730646635333266646237386564373633633062373435223b733a33323a223137383037666163363836353839363035666334663565303035613665356132223b733a33323a223661383035373732663835356632333533373531323862633063653161613733223b733a33323a223133333232376233623166306663353735646566306461333032353764393935223b733a33323a223432623734393865383164306531393662626263653861313237613333616534223b7d733a343a2268617368223b733a36353a2234326237343938653831643065313936626262636538613132376133336165342d3133333232376233623166306663353735646566306461333032353764393935223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762428230),
('u1op6hnpkj0c9137fhbbbv85k0', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736303731363838352e3339373934363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227338746a3262696a336a613731657231666d626c623371706172223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736303736303034373b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736303736303035393b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223132663932323966396364333964633861643834396132656364306535343832223b733a33323a223163623237396364353665663361306633636333363065353461636564646666223b7d733a343a2268617368223b733a36353a2231636232373963643536656633613066336363333630653534616365646466662d3132663932323966396364333964633861643834396132656364306535343832223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223262356333343932343865313938326166366430333262396137633233303862223b733a33323a226639343130666661396239323835316562373566373336653631386631623434223b733a33323a223365663935363733653733646433346633363862636134623730366666666165223b733a33323a226635633961343061626262623136363131343465636630383235333832333231223b7d733a343a2268617368223b733a36353a2266356339613430616262626231363631313434656366303832353338323332312d3365663935363733653733646433346633363862636134623730366666666165223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1760716885);

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"boudriche.amrane@gmail.com\"'),
('cli.command', 'cmd /C\r\n'),
('cli.path', '\"C:\\\\wamp64\\\\bin\\\\php\\\\php7.4.33\\\\php.exe\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"webp\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"Pandor\\u00e9\"'),
('jobs.dispatcher', '\"Omeka\\\\Job\\\\Dispatcher\\\\PhpCli\"'),
('locale', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/webp\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"UTC\"'),
('use_htmlpurifier', '\"1\"'),
('version', '\"4.1.1\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

DROP TABLE IF EXISTS `site`;
CREATE TABLE IF NOT EXISTS `site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `thumbnail_id` int DEFAULT NULL,
  `homepage_id` int DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `slug` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `navigation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  KEY `IDX_694309E4FDFF2E92` (`thumbnail_id`),
  KEY `IDX_694309E47E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_block_attachment`
--

DROP TABLE IF EXISTS `site_block_attachment`;
CREATE TABLE IF NOT EXISTS `site_block_attachment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `block_id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `media_id` int DEFAULT NULL,
  `caption` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_236473FEE9ED820C` (`block_id`),
  KEY `IDX_236473FE126F525E` (`item_id`),
  KEY `IDX_236473FEEA9FDD75` (`media_id`),
  KEY `block_position` (`block_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_item_set`
--

DROP TABLE IF EXISTS `site_item_set`;
CREATE TABLE IF NOT EXISTS `site_item_set` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `item_set_id` int NOT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  KEY `IDX_D4CE134F6BD1646` (`site_id`),
  KEY `IDX_D4CE134960278D7` (`item_set_id`),
  KEY `position` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page`
--

DROP TABLE IF EXISTS `site_page`;
CREATE TABLE IF NOT EXISTS `site_page` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `slug` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  KEY `is_public` (`is_public`),
  KEY `IDX_2F900BD9F6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page_block`
--

DROP TABLE IF EXISTS `site_page_block`;
CREATE TABLE IF NOT EXISTS `site_page_block` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_id` int NOT NULL,
  `layout` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `layout_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json)',
  `position` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C593E731C4663E4` (`page_id`),
  KEY `page_position` (`page_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_permission`
--

DROP TABLE IF EXISTS `site_permission`;
CREATE TABLE IF NOT EXISTS `site_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `user_id` int NOT NULL,
  `role` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  KEY `IDX_C0401D6FA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_setting`
--

DROP TABLE IF EXISTS `site_setting`;
CREATE TABLE IF NOT EXISTS `site_setting` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`,`site_id`),
  KEY `IDX_64D05A53F6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'boudriche.amrane@gmail.com', 'omeka', '2025-10-05 14:58:54', '2025-10-05 14:58:55', '$2y$10$JfecX0tJalmns6jxHepnvuEulN/D.T0hYiwNuKnaWQcwBF2Bzs4j.', 'global_admin', 1),
(2, 'samuel.szoniecky@univ-paris8.fr', 'Samuel Szoniecky', '2025-10-21 07:15:40', '2025-10-21 07:16:40', '$2y$10$eaylOHLMeLEnDHu1YFeAsuKmZ1wszlJAd9n3gqSFm4adCGZ6.a0/G', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_setting`
--

DROP TABLE IF EXISTS `user_setting`;
CREATE TABLE IF NOT EXISTS `user_setting` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`,`user_id`),
  KEY `IDX_C779A692A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('browse_defaults_admin_item_sets', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_item_sets', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_sites', 1, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('browse_defaults_admin_sites', 2, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('columns_admin_item_sets', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_item_sets', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 1, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 2, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('csv_import_automap_check_names_alone', 1, 'true'),
('csv_import_delimiter', 1, '\";\"'),
('csv_import_enclosure', 1, '\"\\\"\"'),
('csv_import_global_language', 1, '\"\"'),
('csv_import_identifier_property', 1, '\"\"'),
('csv_import_multivalue_separator', 1, '\";\"'),
('csv_import_rows_by_batch', 1, '20'),
('default_resource_template', 1, '\"\"'),
('default_resource_template', 2, '\"\"'),
('locale', 1, '\"\"'),
('locale', 2, '\"\"');

-- --------------------------------------------------------

--
-- Structure de la table `value`
--

DROP TABLE IF EXISTS `value`;
CREATE TABLE IF NOT EXISTS `value` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resource_id` int NOT NULL,
  `property_id` int NOT NULL,
  `value_resource_id` int DEFAULT NULL,
  `value_annotation_id` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `uri` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1D7758349B66727E` (`value_annotation_id`),
  KEY `IDX_1D77583489329D25` (`resource_id`),
  KEY `IDX_1D775834549213EC` (`property_id`),
  KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  KEY `value` (`value`(190)),
  KEY `uri` (`uri`(190)),
  KEY `is_public` (`is_public`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `value_annotation_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(7, 24, 189, NULL, NULL, 'literal', NULL, 'John Lennon', NULL, 1),
(8, 25, 189, NULL, NULL, 'literal', NULL, 'Queen', NULL, 1),
(9, 26, 189, NULL, NULL, 'literal', NULL, 'Daft Punk', NULL, 1),
(10, 27, 189, NULL, NULL, 'literal', NULL, 'Adele', NULL, 1),
(11, 28, 189, NULL, NULL, 'literal', NULL, 'Coldplay', NULL, 1),
(12, 29, 194, NULL, NULL, 'literal', NULL, 'Imagine', NULL, 1),
(13, 29, 195, NULL, NULL, 'literal', NULL, '2025-10-16 10:00:00', NULL, 1),
(14, 29, 196, NULL, NULL, 'literal', NULL, 'Imagine', NULL, 1),
(15, 30, 194, NULL, NULL, 'literal', NULL, 'Queen', NULL, 1),
(16, 30, 195, NULL, NULL, 'literal', NULL, '2025-10-16 10:05:00', NULL, 1),
(17, 30, 196, NULL, NULL, 'literal', NULL, 'Bohemian Rhapsody', NULL, 1),
(18, 31, 194, NULL, NULL, 'literal', NULL, 'Daft Punk', NULL, 1),
(19, 31, 195, NULL, NULL, 'literal', NULL, '2025-10-16 10:10:00', NULL, 1),
(20, 31, 196, NULL, NULL, 'literal', NULL, 'One More Time', NULL, 1),
(21, 32, 194, NULL, NULL, 'literal', NULL, 'Adele', NULL, 1),
(22, 32, 195, NULL, NULL, 'literal', NULL, '2025-10-16 10:15:00', NULL, 1),
(23, 32, 196, NULL, NULL, 'literal', NULL, 'Hello', NULL, 1),
(24, 33, 194, NULL, NULL, 'literal', NULL, 'Coldplay', NULL, 1),
(25, 33, 195, NULL, NULL, 'literal', NULL, '2025-10-16 10:20:00', NULL, 1),
(26, 33, 196, NULL, NULL, 'literal', NULL, 'Yellow', NULL, 1),
(27, 34, 197, NULL, NULL, 'literal', NULL, 'Imagine', NULL, 1),
(28, 34, 198, NULL, NULL, 'literal', NULL, 'acceptée', NULL, 1),
(29, 35, 197, NULL, NULL, 'literal', NULL, 'Bohemian Rhapsody', NULL, 1),
(30, 35, 198, NULL, NULL, 'literal', NULL, 'ignorée', NULL, 1),
(31, 36, 197, NULL, NULL, 'literal', NULL, 'One More Time', NULL, 1),
(32, 36, 198, NULL, NULL, 'literal', NULL, 'acceptée', NULL, 1),
(33, 37, 197, NULL, NULL, 'literal', NULL, 'Hello', NULL, 1),
(34, 37, 198, NULL, NULL, 'literal', NULL, 'acceptée', NULL, 1),
(35, 38, 197, NULL, NULL, 'literal', NULL, 'Yellow', NULL, 1),
(36, 38, 198, NULL, NULL, 'literal', NULL, 'ignorée', NULL, 1),
(37, 39, 185, NULL, NULL, 'literal', NULL, 'Imagine', NULL, 1),
(38, 39, 186, NULL, NULL, 'literal', NULL, '1971', NULL, 1),
(39, 39, 187, NULL, NULL, 'literal', NULL, 'imagine.mp3', NULL, 1),
(40, 39, 188, NULL, NULL, 'literal', NULL, 'John Lennon', NULL, 1),
(41, 40, 185, NULL, NULL, 'literal', NULL, 'Bohemian Rhapsody', NULL, 1),
(42, 40, 186, NULL, NULL, 'literal', NULL, '1975', NULL, 1),
(43, 40, 187, NULL, NULL, 'literal', NULL, 'bohemian.mp3', NULL, 1),
(44, 40, 188, NULL, NULL, 'literal', NULL, 'Queen', NULL, 1),
(45, 41, 185, NULL, NULL, 'literal', NULL, 'One More Time', NULL, 1),
(46, 41, 186, NULL, NULL, 'literal', NULL, '2000', NULL, 1),
(47, 41, 187, NULL, NULL, 'literal', NULL, 'onemoretime.mp3', NULL, 1),
(48, 41, 188, NULL, NULL, 'literal', NULL, 'Daft Punk', NULL, 1),
(49, 42, 185, NULL, NULL, 'literal', NULL, 'Hello', NULL, 1),
(50, 42, 186, NULL, NULL, 'literal', NULL, '2015', NULL, 1),
(51, 42, 187, NULL, NULL, 'literal', NULL, 'hello.mp3', NULL, 1),
(52, 42, 188, NULL, NULL, 'literal', NULL, 'Adele', NULL, 1),
(53, 43, 185, NULL, NULL, 'literal', NULL, 'Yellow', NULL, 1),
(54, 43, 186, NULL, NULL, 'literal', NULL, '2000', NULL, 1),
(55, 43, 187, NULL, NULL, 'literal', NULL, 'yellow.mp3', NULL, 1),
(56, 43, 188, NULL, NULL, 'literal', NULL, 'Coldplay', NULL, 1),
(57, 44, 190, NULL, NULL, 'literal', NULL, 'Alice', NULL, 1),
(58, 44, 191, NULL, NULL, 'literal', NULL, 'alice@example.com', NULL, 1),
(59, 44, 192, NULL, NULL, 'literal', NULL, 'étudiant', NULL, 1),
(60, 45, 190, NULL, NULL, 'literal', NULL, 'Bob', NULL, 1),
(61, 45, 191, NULL, NULL, 'literal', NULL, 'bob@example.com', NULL, 1),
(62, 45, 192, NULL, NULL, 'literal', NULL, 'admin', NULL, 1),
(63, 46, 190, NULL, NULL, 'literal', NULL, 'Charlie', NULL, 1),
(64, 46, 191, NULL, NULL, 'literal', NULL, 'charlie@example.com', NULL, 1),
(65, 46, 192, NULL, NULL, 'literal', NULL, 'étudiant', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `value_annotation`
--

DROP TABLE IF EXISTS `value_annotation`;
CREATE TABLE IF NOT EXISTS `value_annotation` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary`
--

DROP TABLE IF EXISTS `vocabulary`;
CREATE TABLE IF NOT EXISTS `vocabulary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `namespace_uri` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  KEY `IDX_9099C97B7E3C61F9` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(5, 1, 'https://raw.githubusercontent.com/AmraneSB/Pandor-/main/assets/vocab#', 'pandore', 'Vocabulaire Pandoré', 'Vocabulaire RDF/Turtle du projet Pandoré — banque de musique en ligne avec recherche vocale et textuelle.');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  ADD CONSTRAINT `FK_84D382F4BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Contraintes pour la table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  ADD CONSTRAINT `FK_17B508814C276F75` FOREIGN KEY (`undo_job_id`) REFERENCES `job` (`id`),
  ADD CONSTRAINT `FK_17B50881BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Contraintes pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1F1B251ECBE0B084` FOREIGN KEY (`primary_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E4FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Contraintes pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Contraintes pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  ADD CONSTRAINT `FK_1D7758349B66727E` FOREIGN KEY (`value_annotation_id`) REFERENCES `value_annotation` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD CONSTRAINT `FK_C03BA4EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
