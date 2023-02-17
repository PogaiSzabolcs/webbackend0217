-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 192.168.0.200
-- Létrehozás ideje: 2023. Feb 10. 15:03
-- Kiszolgáló verziója: 10.5.17-MariaDB-log
-- PHP verzió: 8.0.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `s55_db`
--
CREATE DATABASE IF NOT EXISTS `s55_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `s55_db`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `etel`
--

CREATE TABLE `etel` (
  `etel_id` int(11) NOT NULL,
  `etel_nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `etel_tipusid` int(11) NOT NULL,
  `etel_kcal` int(11) NOT NULL,
  `etel_prot` int(11) NOT NULL,
  `etel_kep` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `etel`
--

INSERT INTO `etel` (`etel_id`, `etel_nev`, `etel_tipusid`, `etel_kcal`, `etel_prot`, `etel_kep`) VALUES
(1, 'Bab', 2, 291, 19, '1.jpg'),
(4, 'Csirkemell', 1, 120, 23, '2.jpg'),
(5, 'Rizs', 2, 360, 7, '3.jpg'),
(6, 'Sonka', 1, 147, 22, '4.jpg'),
(7, 'Brokkoli', 2, 34, 3, '5.jpg'),
(8, 'Krumpli', 2, 86, 2, '6.jpg'),
(9, 'Kenyér', 3, 268, 10, '7.jpg'),
(10, 'Sör', 6, 215, 3, '8.jpg'),
(21, 'Proba', 2, 75, 7, '66.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `receptek`
--

CREATE TABLE `receptek` (
  `recept_id` int(11) NOT NULL,
  `recept_neve` varchar(100) NOT NULL,
  `recept_osszetev` varchar(100) NOT NULL,
  `recept_elkesz` text NOT NULL,
  `recept_kcal` int(11) NOT NULL,
  `recept_prot` int(11) NOT NULL,
  `recept_kep` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `receptek`
--

INSERT INTO `receptek` (`recept_id`, `recept_neve`, `recept_osszetev`, `recept_elkesz`, `recept_kcal`, `recept_prot`, `recept_kep`) VALUES
(3, 'Proba2', 'Jejdndnd', 'Ksma smskdkdkdk', 737, 64, '100.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tipus`
--

CREATE TABLE `tipus` (
  `tipus_id` int(11) NOT NULL,
  `tipus_nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tipus`
--

INSERT INTO `tipus` (`tipus_id`, `tipus_nev`) VALUES
(1, 'Hús'),
(2, 'Zöldség'),
(3, 'Pékárú'),
(4, 'Snack'),
(5, 'Tejtermék'),
(6, 'Innivaló'),
(7, 'Gabonafélék');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `etel`
--
ALTER TABLE `etel`
  ADD PRIMARY KEY (`etel_id`),
  ADD KEY `etel_tipusid` (`etel_tipusid`);

--
-- A tábla indexei `receptek`
--
ALTER TABLE `receptek`
  ADD PRIMARY KEY (`recept_id`);

--
-- A tábla indexei `tipus`
--
ALTER TABLE `tipus`
  ADD PRIMARY KEY (`tipus_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `etel`
--
ALTER TABLE `etel`
  MODIFY `etel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT a táblához `receptek`
--
ALTER TABLE `receptek`
  MODIFY `recept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `tipus`
--
ALTER TABLE `tipus`
  MODIFY `tipus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `etel`
--
ALTER TABLE `etel`
  ADD CONSTRAINT `etel_ibfk_1` FOREIGN KEY (`etel_tipusid`) REFERENCES `tipus` (`tipus_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
