-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Gegenereerd op: 26 jun 2020 om 09:28
-- Serverversie: 5.7.22
-- PHP-versie: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ixat_taxi`
--
CREATE DATABASE IF NOT EXISTS `ixat_taxi` DEFAULT CHARACTER SET latin2 COLLATE latin2_general_ci;
USE `ixat_taxi`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `gebruikersnaam` varchar(45) NOT NULL,
  `wachtwoord` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Gegevens worden geëxporteerd voor tabel `admin`
--

INSERT INTO `admin` (`gebruikersnaam`, `wachtwoord`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `auto`
--

DROP TABLE IF EXISTS `auto`;
CREATE TABLE IF NOT EXISTS `auto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merk` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `kenteken` varchar(45) NOT NULL,
  `aantal_passagiers` int(11) NOT NULL,
  `laadruimte` int(11) NOT NULL,
  `gebruikersnaam` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kenteken_UNIQUE` (`kenteken`),
  UNIQUE KEY `gebruikersnaam_UNIQUE` (`gebruikersnaam`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin2;

--
-- Gegevens worden geëxporteerd voor tabel `auto`
--

INSERT INTO `auto` (`id`, `merk`, `type`, `kenteken`, `aantal_passagiers`, `laadruimte`, `gebruikersnaam`) VALUES
(1, 'SEAT LEON', 'Hatchback', '28-PK-9P', 3, 120, 'leon123'),
(2, 'SEAT LEON', 'Hatchback', '99-PP-28O', 3, 120, 'pietertje'),
(3, 'SEAT LEON', 'Hatchback', '12-22-PP', 3, 120, 'jannie'),
(4, 'Volkswagen', 'KEVER', 'XY-80-IUD', 3, 20, 'evert'),
(5, 'LAND ROVER', 'DEFENDER', '99-XH-OP', 3, 120, 'robje'),
(6, 'TEST WAGEN', 'TESTER', '12-TT-34', 3, 120, 'testKlant'),
(7, 'LAND ROVER', 'DEFENDER', '99-11-KL', 3, 120, 'Frankie'),
(8, 'SEAT LEON', 'Hatchback', '29-OK-PL2', 3, 120, 'jantje'),
(9, 'TEST WAGEN', 'DEFENDER', '99-LO-9K', 3, 120, 'kareltje'),
(10, 'SEAT LEON', 'Sedan', '77-77-PP', 3, 120, 'rootie'),
(11, 'KIA', 'Auto', '26-YU-LO', 3, 120, 'pimp');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `chauffeur`
--

DROP TABLE IF EXISTS `chauffeur`;
CREATE TABLE IF NOT EXISTS `chauffeur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auto_id` int(11) NOT NULL,
  `schadevrije_jaren` int(11) NOT NULL,
  `latitude` decimal(10,0) NOT NULL,
  `longitude` decimal(10,0) NOT NULL,
  `vrij` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chauffeur_auto1_idx` (`auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin2;

--
-- Gegevens worden geëxporteerd voor tabel `chauffeur`
--

INSERT INTO `chauffeur` (`id`, `auto_id`, `schadevrije_jaren`, `latitude`, `longitude`, `vrij`) VALUES
(4, 1, 14, '51', '6', 0),
(5, 2, 8, '52', '5', 1),
(6, 3, 7, '51', '5', 1),
(7, 4, 1, '52', '6', 1),
(8, 5, 8, '51', '4', 1),
(10, 6, 1, '52', '5', 1),
(13, 7, 6, '51', '5', 1),
(14, 8, 3, '52', '4', 1),
(18, 9, 8, '52', '5', 1),
(19, 10, 13, '51', '6', 1),
(20, 11, 5, '52', '6', 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `chauffeur_aanvraag`
--

DROP TABLE IF EXISTS `chauffeur_aanvraag`;
CREATE TABLE IF NOT EXISTS `chauffeur_aanvraag` (
  `gebruikersnaam` varchar(45) NOT NULL,
  `auto_id` int(11) NOT NULL,
  PRIMARY KEY (`gebruikersnaam`,`auto_id`),
  KEY `fk_chauffeur_aanvraag_klant_idx` (`gebruikersnaam`),
  KEY `fk_chauffeur_aanvraag_auto1_idx` (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `chauffeur_rijbewijs`
--

DROP TABLE IF EXISTS `chauffeur_rijbewijs`;
CREATE TABLE IF NOT EXISTS `chauffeur_rijbewijs` (
  `gebruikersnaam` varchar(45) NOT NULL,
  `rijbewijs_id` int(11) NOT NULL,
  PRIMARY KEY (`gebruikersnaam`,`rijbewijs_id`),
  KEY `fk_chauffeur_rijbewijs_rijbewijs1_idx` (`rijbewijs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Gegevens worden geëxporteerd voor tabel `chauffeur_rijbewijs`
--

INSERT INTO `chauffeur_rijbewijs` (`gebruikersnaam`, `rijbewijs_id`) VALUES
('evert', 4),
('Frankie', 4),
('jannie', 4),
('jantje', 4),
('kareltje', 4),
('leon123', 4),
('pietertje', 4),
('pimp', 4),
('robje', 4),
('rootie', 4),
('testKlant', 4);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klant`
--

DROP TABLE IF EXISTS `klant`;
CREATE TABLE IF NOT EXISTS `klant` (
  `gebruikersnaam` varchar(45) NOT NULL,
  `wachtwoord` varchar(7) NOT NULL,
  `naam` varchar(45) NOT NULL,
  `mobiel` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `chauffeur_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`gebruikersnaam`),
  UNIQUE KEY `gebruikersnaam_UNIQUE` (`gebruikersnaam`),
  KEY `fk_klant_chauffeur1_idx` (`chauffeur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Gegevens worden geëxporteerd voor tabel `klant`
--

INSERT INTO `klant` (`gebruikersnaam`, `wachtwoord`, `naam`, `mobiel`, `email`, `chauffeur_id`) VALUES
('evert', 'evy', 'Evy', '0612345678', 'evy@evy.nl', 7),
('Frankie', 'frank', 'frank', '0612345678', 'frank@live.nl', 13),
('jannie', 'jan', 'jan', '0612345678', 'jan@jan.nl', 6),
('jantje', 'jan', 'jan', '0612345678', 'jan@live.nl', 14),
('kareltje', 'karel', 'karel', '0612345678', 'karel@live.nl', 18),
('leon123', 'leon', 'Leon Schoonhoven', '0612345678', 'leon@live.nl', 4),
('Nicky', 'nick', 'Nick', '0612345678', 'nick@live.nl', NULL),
('pietertje', 'piet', 'piet', '0612345678', 'piet@piet.nl', 5),
('pimp', 'pim', 'Pim', '0612345678', 'pim@live.nl', 20),
('robje', 'rob', 'rob', '0612345678', 'rob@rob.nl', 8),
('rootie', 'root', 'root', '0612345678', 'root@live.nl', 19),
('testKlant', 'test', 'test', '0612345678', 'test@live.nl', NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `rijbewijs`
--

DROP TABLE IF EXISTS `rijbewijs`;
CREATE TABLE IF NOT EXISTS `rijbewijs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin2;

--
-- Gegevens worden geëxporteerd voor tabel `rijbewijs`
--

INSERT INTO `rijbewijs` (`id`, `naam`) VALUES
(1, 'Rijbewijs A1'),
(2, 'Rijbewijs A2'),
(3, 'Rijbewijs A'),
(4, 'Rijbewijs B');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `taxi_aanvraag`
--

DROP TABLE IF EXISTS `taxi_aanvraag`;
CREATE TABLE IF NOT EXISTS `taxi_aanvraag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gebruikersnaam` varchar(45) NOT NULL,
  `datum_tijd` datetime(6) NOT NULL,
  `minimale_laadruimte` int(11) NOT NULL,
  `passagiers` int(11) NOT NULL,
  `latitude` decimal(10,0) NOT NULL,
  `longitude` decimal(10,0) NOT NULL,
  `chauffeur_id` int(11) DEFAULT NULL,
  `goedgekeurd` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gebruikersnaam_UNIQUE` (`gebruikersnaam`),
  KEY `fk_taxi_aanvraag_chauffeur1_idx` (`chauffeur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin2;

--
-- Gegevens worden geëxporteerd voor tabel `taxi_aanvraag`
--

INSERT INTO `taxi_aanvraag` (`id`, `gebruikersnaam`, `datum_tijd`, `minimale_laadruimte`, `passagiers`, `latitude`, `longitude`, `chauffeur_id`, `goedgekeurd`) VALUES
(6, 'leon123', '2020-09-24 00:00:00.000000', 0, 1, '2831', '1907', 20, 1);

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `auto`
--
ALTER TABLE `auto`
  ADD CONSTRAINT `fk_auto_klant1` FOREIGN KEY (`gebruikersnaam`) REFERENCES `klant` (`gebruikersnaam`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `chauffeur`
--
ALTER TABLE `chauffeur`
  ADD CONSTRAINT `fk_chauffeur_auto1` FOREIGN KEY (`auto_id`) REFERENCES `auto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `chauffeur_aanvraag`
--
ALTER TABLE `chauffeur_aanvraag`
  ADD CONSTRAINT `fk_chauffeur_aanvraag_auto1` FOREIGN KEY (`auto_id`) REFERENCES `auto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chauffeur_aanvraag_klant` FOREIGN KEY (`gebruikersnaam`) REFERENCES `klant` (`gebruikersnaam`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `chauffeur_rijbewijs`
--
ALTER TABLE `chauffeur_rijbewijs`
  ADD CONSTRAINT `fk_chauffeur_rijbewijs_klant1` FOREIGN KEY (`gebruikersnaam`) REFERENCES `klant` (`gebruikersnaam`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chauffeur_rijbewijs_rijbewijs1` FOREIGN KEY (`rijbewijs_id`) REFERENCES `rijbewijs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `klant`
--
ALTER TABLE `klant`
  ADD CONSTRAINT `fk_klant_chauffeur1` FOREIGN KEY (`chauffeur_id`) REFERENCES `chauffeur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `taxi_aanvraag`
--
ALTER TABLE `taxi_aanvraag`
  ADD CONSTRAINT `fk_taxi_aanvraag_chauffeur1` FOREIGN KEY (`chauffeur_id`) REFERENCES `chauffeur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_taxi_aanvraag_klant1` FOREIGN KEY (`gebruikersnaam`) REFERENCES `klant` (`gebruikersnaam`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
