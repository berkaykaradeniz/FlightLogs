-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 10 Eyl 2022, 16:00:55
-- Sunucu sürümü: 10.4.10-MariaDB
-- PHP Sürümü: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `flight_logs`
--
CREATE DATABASE IF NOT EXISTS `flight_logs` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `flight_logs`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `captains`
--

DROP TABLE IF EXISTS `captains`;
CREATE TABLE IF NOT EXISTS `captains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `captains`
--

INSERT INTO `captains` (`id`, `full_name`) VALUES
(1, 'Berkay'),
(2, 'Mert'),
(3, 'Ahmet'),
(4, 'Leyla'),
(5, 'Cihan'),
(6, 'Murat'),
(7, 'Berkcan'),
(8, 'Can'),
(9, 'Kerem'),
(10, 'Abdullah'),
(11, 'Cem'),
(12, 'Elif'),
(13, 'Cemil'),
(14, 'Ayşe'),
(15, 'Sena'),
(16, 'Ali Osman');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `flight_logs`
--

DROP TABLE IF EXISTS `flight_logs`;
CREATE TABLE IF NOT EXISTS `flight_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `schedule_date` datetime NOT NULL,
  `origin` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `destination` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `c_id` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `flight_logs`
--

INSERT INTO `flight_logs` (`id`, `c_id`, `code`, `schedule_date`, `origin`, `destination`, `status`) VALUES
(1, 10, 'THY', '2022-09-16 10:00:00', 'IST', 'AMS', 0),
(2, 3, 'THY', '2021-09-16 10:00:00', 'IST', 'IZM', 1),
(3, 4, 'PGS', '2022-10-16 10:00:00', 'IZM', 'ANK', 0),
(4, 6, 'FHY', '2023-01-16 15:00:00', 'AMS', 'IST', 0),
(5, 7, 'THY', '2022-09-01 00:00:00', 'IST', 'TRZ', 0),
(6, 16, 'PGS', '2023-11-14 15:00:00', 'VAN', 'ANT', 0),
(7, 9, 'THY', '2022-10-12 00:00:00', 'IST', 'FR', 0),
(8, 12, 'THY', '2021-09-16 10:00:00', 'TRB', 'AGR', 1),
(9, 8, 'PGS', '2022-10-16 10:00:00', 'KNY', 'GLB', 0),
(10, 5, 'THY', '2023-02-16 15:00:00', 'TKY', 'IST', 0),
(11, 7, 'THY', '2022-09-01 00:00:00', 'IST', 'TRZ', 0),
(12, 16, 'PGS', '2023-11-14 15:00:00', 'VAN', 'ANT', 0),
(13, 15, 'PGS', '2020-09-16 15:00:00', 'IST', 'SAMS', 1),
(14, 14, 'FHY', '2021-05-05 04:15:00', 'ANK', 'CNK', 0);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `flight_logs`
--
ALTER TABLE `flight_logs`
  ADD CONSTRAINT `flight_logs_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `captains` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
