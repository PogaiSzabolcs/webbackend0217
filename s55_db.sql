-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Már 31. 10:34
-- Kiszolgáló verziója: 10.4.24-MariaDB
-- PHP verzió: 7.4.28

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
(23, 'Chips', 4, 536, 7, 'chips.jpg'),
(24, 'Almalé', 6, 46, 0, 'almale.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `receptek`
--

CREATE TABLE `receptek` (
  `recept_id` int(11) NOT NULL,
  `recept_neve` varchar(100) NOT NULL,
  `recept_osszetev` text NOT NULL,
  `recept_elkesz` text NOT NULL,
  `recept_kcal` int(11) NOT NULL,
  `recept_prot` int(11) NOT NULL,
  `recept_kep` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `receptek`
--

INSERT INTO `receptek` (`recept_id`, `recept_neve`, `recept_osszetev`, `recept_elkesz`, `recept_kcal`, `recept_prot`, `recept_kep`) VALUES
(6, 'Kínai rizses csirke ', '\r\n\r\n    60 dkg csirkemellfilé\r\n    3 ek szójaszósz\r\n    25 dkg rizs\r\n    8 dl víz\r\n    4 ek olívaolaj\r\n    0.5 db piros kaliforniai paprika\r\n    1 közepes fej vöröshagyma\r\n    2 db tojás\r\n    1 hüvelykujjnyi gyömbér (elhagyható)\r\n    só ízlés szerint\r\n\r\n', '\r\n\r\n    Mossuk meg a fehér rizst legalább háromszor, majd főzzük meg dupla mennyiségű vízben, amelyhez 2 ek olajat is adunk és egy kávéskanál sót.\r\n    Egy mély serpenyőben (wok-ban) megpirítjuk a csirkemellet nagy lángon, hogy szép színt kapjon.\r\n    Hozzáadunk 2-3 ek szójaszószt, összekeverjük, szükség szerint sózzuk. (A szójaszószt érdemes előzetesen megkóstolni, hogy mennyire sós.) A megsült csirkét félretesszük egy tányérra.\r\n    A serpenyőben 2 ek olívaolajon a tojásokból rántottát sütünk, jól összekeverjük, ezt is kiszedjük, félretesszük.\r\n    Pici olajon pirítjuk kis ideig a félkarikára vágott hagymát, vékonyra szeletelt gyömbért és a felcsíkozott paprikát úgy, hogy ress maradjon.\r\n    Rádobjuk a rizst, belekeverjük a tojást és a leszűrt, lecsöpögtetett kukoricát. Még rövid ideig együtt pirítjuk az egészet.\r\n    Végül hozzákeverjük a szójaszószos sült húskockákat is, tálaljuk.\r\n\r\n', 531, 38, 'kinai.jpg'),
(7, 'Bolognai ragu penne tésztával', '\r\n    1 fej vöröshagyma\r\n    kevés olívaolaj\r\n    1 gerezd fokhagyma\r\n    6 szelet pancetta\r\n    2 ág rozmaring\r\n    1 szál szárzeller\r\n    1 darab sárgarépa\r\n    só és bors ízlés szerint\r\n    40 dkg darált marhahús\r\n    2 levél bazsalikom\r\n    1 ág kakukkfű\r\n    1,8 dl vörösbor\r\n    2 ek sűrített paradicsom\r\n    2,5 dl zöldségalaplé\r\n    40 dkg penne tészta\r\n  \r\n', 'A tésztát főzzük ki a csomagoláson írtak szerint.\r\n\r\nA hagymát, sárgarépát és a zellert vágjuk finomra.\r\n\r\nA szalonnát vágjuk kis kockákra.\r\n\r\nA hagymát kevés olajon kezdjük el dinsztelni, majd 2-3 perc után a zúzott fokhagymát, a szalonnát és a rozmaring leveleit is keverjük hozzá, utána pedig a sárgarépa és a zeller is mehet a fazékba.\r\n\r\nMiuttán a zöldségek összeestek (10-15 perc), dobjuk rá a húst, pirítsuk, majd ha kifehéredett, öntsük rá az alaplevet, a paradicsomot és a bort.\r\n\r\nA ragut fűszerezzük sóval, borssal, bazsalikommal és kakukkfűvel, majd lassú láng felett főzzük 2 órát.', 525, 25, 'bolognai.jpg'),
(8, 'Chilis bab', '2 fejvöröshagyma\r\nolaj\r\n4 gerezdfokhagyma\r\n1 teás kanál pirospaprika\r\n50 dkg darált hús\r\n10 dkg paradicsompüré\r\nsó\r\nbors\r\nőrölt csilipaprika\r\n2 doboz vörösbabkonzerv\r\n1 doboz kukoricakonzerv', '\r\n    A chilis bab elkészítéséhez a karikára vágott vöröshagymát olajon megpirítjuk, majd a zúzott fokhagymát is hozzápirítjuk 10 másodpercig. Rászórjuk a pirospaprikát, és felengedjük 1/2 dl vízzel.\r\n    Hozzáadjuk a darált húst és fehéredésig pirítjuk. A paradicsompürét vízzel hígítjuk, ráöntjük a darált húsra, megsózzuk, megborsozzuk, és csilipaprikával ízesítjük.\r\n    Amikor a hús megpuhult, hozzákeverjük a leszűrt babot és a kukoricát, és 5-10 perc alatt összeforraljuk. A csilis babot forrón kínáljuk.\r\n', 425, 25, 'chili.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `roles`
--

INSERT INTO `roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'user', '2020-08-02 14:57:31', '2020-08-02 14:57:31'),
(2, 'moderator', '2020-08-02 14:57:31', '2020-08-02 14:57:31'),
(3, 'admin', '2020-08-02 14:57:31', '2020-08-02 14:57:31');

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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'user', 'user', '$2a$08$gXM4pyuhZFlC72PeAwxrUOR0uA31/d2PdgnHP35JGV.0bQNiZBatS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'mod', 'mod', '$2a$08$gXM4pyuhZFlC72PeAwxrUOR0uA31/d2PdgnHP35JGV.0bQNiZBatS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'admin', 'admin', '$2a$08$97Ze1/hXfOX44WdC62Rq8uRkog9HYC1HukRX8eld2ZEKPyenM5v.G', '2020-08-02 15:03:59', '2020-08-02 15:03:59');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_roles`
--

CREATE TABLE `user_roles` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `user_roles`
--

INSERT INTO `user_roles` (`createdAt`, `updatedAt`, `roleId`, `userId`) VALUES
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1),
('2020-08-02 15:04:00', '2020-08-02 15:04:00', 1, 3),
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 2),
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3),
('2020-08-02 15:04:00', '2020-08-02 15:04:00', 3, 3);

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
-- A tábla indexei `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `tipus`
--
ALTER TABLE `tipus`
  ADD PRIMARY KEY (`tipus_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`roleId`,`userId`),
  ADD KEY `userId` (`userId`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `etel`
--
ALTER TABLE `etel`
  MODIFY `etel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT a táblához `receptek`
--
ALTER TABLE `receptek`
  MODIFY `recept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `tipus`
--
ALTER TABLE `tipus`
  MODIFY `tipus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `etel`
--
ALTER TABLE `etel`
  ADD CONSTRAINT `etel_ibfk_1` FOREIGN KEY (`etel_tipusid`) REFERENCES `tipus` (`tipus_id`);

--
-- Megkötések a táblához `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
