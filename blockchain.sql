-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 11 May 2023, 12:41:52
-- Sunucu sürümü: 10.4.27-MariaDB
-- PHP Sürümü: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `blockchain`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `adres`
--

CREATE TABLE `adres` (
  `adresid` int(11) NOT NULL,
  `islemsayisi` int(11) NOT NULL,
  `sonislemtarihi` date NOT NULL,
  `toplambakiye` int(11) NOT NULL,
  `adreskimligi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `baslikboyut`
--

CREATE TABLE `baslikboyut` (
  `blokbasligiid` int(11) NOT NULL,
  `boyutkimligiid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `blok`
--

CREATE TABLE `blok` (
  `blokid` int(11) NOT NULL,
  `bloknumarasi` int(11) NOT NULL,
  `islemsayisi` int(32) NOT NULL,
  `islemhacmi` int(32) NOT NULL,
  `tarih/zaman` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `blokbaslik`
--

CREATE TABLE `blokbaslik` (
  `blokbasligiid` int(11) NOT NULL,
  `zamandamgasi` date NOT NULL,
  `oncekiblockkimligi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `blokboyutu`
--

CREATE TABLE `blokboyutu` (
  `boyutkimligiid` int(11) NOT NULL,
  `minblokboyutu` int(11) NOT NULL,
  `maxblokboyutu` int(11) NOT NULL,
  `ortblokboyutu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bloknumarası`
--

CREATE TABLE `bloknumarası` (
  `bloknumarasiid` int(11) NOT NULL,
  `blokid` int(11) NOT NULL,
  `islemsayisi` int(32) NOT NULL,
  `blokhash` int(32) NOT NULL,
  `zamandamgası` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cuzdan`
--

CREATE TABLE `cuzdan` (
  `cuzdanid` int(11) NOT NULL,
  `gecerlicuzdansayisi` int(11) NOT NULL,
  `cuzdanadresi` varchar(50) NOT NULL,
  `ozelanahtar` varchar(50) NOT NULL,
  `toplambakiye` int(11) NOT NULL,
  `islemsayisi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dugum`
--

CREATE TABLE `dugum` (
  `dugumid` int(11) NOT NULL,
  `madencilikid` int(11) NOT NULL,
  `dugumadresi` varchar(50) NOT NULL,
  `dugumdurumu` varchar(50) NOT NULL,
  `dugumkaynagı` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gecerlicüzdansayisi`
--

CREATE TABLE `gecerlicüzdansayisi` (
  `gecerlicuzdansayisiid` int(11) NOT NULL,
  `adresid` int(11) NOT NULL,
  `toplamcuzdansayisi` int(11) NOT NULL,
  `yenicuzdansayisi` int(11) NOT NULL,
  `aktifcuzdansayisi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hacimdügüm`
--

CREATE TABLE `hacimdügüm` (
  `hacimid` int(9) NOT NULL,
  `dügümid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hashorani`
--

CREATE TABLE `hashorani` (
  `hashid` int(11) NOT NULL,
  `adresid` int(11) NOT NULL,
  `toplamhashorani` int(11) NOT NULL,
  `aghashorani` int(11) NOT NULL,
  `havuzhashorani` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `islem`
--

CREATE TABLE `islem` (
  `hacimid` int(11) NOT NULL,
  `islemtipi` varchar(50) NOT NULL,
  `islemmiktari` int(11) NOT NULL,
  `islemid` int(11) NOT NULL,
  `islemkimligi` varchar(21) NOT NULL,
  `tarih/zaman` date NOT NULL,
  `gonderenadresi` varchar(50) NOT NULL,
  `aliciadresi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `islemhacmi`
--

CREATE TABLE `islemhacmi` (
  `hacimid` int(9) NOT NULL,
  `maxislemhacmi` int(9) NOT NULL,
  `minislemhacmi` int(9) NOT NULL,
  `ortislemhacmi` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `islemsayisi`
--

CREATE TABLE `islemsayisi` (
  `islemid` int(11) NOT NULL,
  `boyutkimligiid` int(11) NOT NULL,
  `islemsayisiid` int(11) NOT NULL,
  `minblokboyutu` int(11) NOT NULL,
  `maxblokboyutu` int(11) NOT NULL,
  `ortblokboyutu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `madencilik`
--

CREATE TABLE `madencilik` (
  `madencilikid` int(11) NOT NULL,
  `madencilikislemsurumu` int(11) NOT NULL,
  `bloknumarasi` int(11) NOT NULL,
  `hashorani` int(18) NOT NULL,
  `zamandamgasi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `madencilikhash`
--

CREATE TABLE `madencilikhash` (
  `madencilikid` int(11) NOT NULL,
  `hashid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `numarabaslık`
--

CREATE TABLE `numarabaslık` (
  `bloknumarasiid` int(11) NOT NULL,
  `blokbasligiid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `adres`
--
ALTER TABLE `adres`
  ADD PRIMARY KEY (`adresid`);

--
-- Tablo için indeksler `baslikboyut`
--
ALTER TABLE `baslikboyut`
  ADD KEY `blokbasligiid` (`blokbasligiid`),
  ADD KEY `boyutkimligiid` (`boyutkimligiid`);

--
-- Tablo için indeksler `blok`
--
ALTER TABLE `blok`
  ADD PRIMARY KEY (`blokid`);

--
-- Tablo için indeksler `blokbaslik`
--
ALTER TABLE `blokbaslik`
  ADD PRIMARY KEY (`blokbasligiid`);

--
-- Tablo için indeksler `blokboyutu`
--
ALTER TABLE `blokboyutu`
  ADD PRIMARY KEY (`boyutkimligiid`);

--
-- Tablo için indeksler `bloknumarası`
--
ALTER TABLE `bloknumarası`
  ADD PRIMARY KEY (`bloknumarasiid`),
  ADD KEY `blokid` (`blokid`);

--
-- Tablo için indeksler `cuzdan`
--
ALTER TABLE `cuzdan`
  ADD PRIMARY KEY (`cuzdanid`),
  ADD KEY `gecerlicuzdansayisi` (`gecerlicuzdansayisi`);

--
-- Tablo için indeksler `dugum`
--
ALTER TABLE `dugum`
  ADD PRIMARY KEY (`dugumid`),
  ADD KEY `madencilikid` (`madencilikid`);

--
-- Tablo için indeksler `gecerlicüzdansayisi`
--
ALTER TABLE `gecerlicüzdansayisi`
  ADD PRIMARY KEY (`gecerlicuzdansayisiid`),
  ADD KEY `adresid` (`adresid`);

--
-- Tablo için indeksler `hacimdügüm`
--
ALTER TABLE `hacimdügüm`
  ADD KEY `dügümid` (`dügümid`),
  ADD KEY `hacimid` (`hacimid`);

--
-- Tablo için indeksler `hashorani`
--
ALTER TABLE `hashorani`
  ADD PRIMARY KEY (`hashid`),
  ADD KEY `adresid` (`adresid`);

--
-- Tablo için indeksler `islem`
--
ALTER TABLE `islem`
  ADD PRIMARY KEY (`islemid`);

--
-- Tablo için indeksler `islemhacmi`
--
ALTER TABLE `islemhacmi`
  ADD PRIMARY KEY (`hacimid`);

--
-- Tablo için indeksler `islemsayisi`
--
ALTER TABLE `islemsayisi`
  ADD PRIMARY KEY (`islemsayisiid`),
  ADD KEY `boyutkimligiid` (`boyutkimligiid`),
  ADD KEY `islemid` (`islemid`);

--
-- Tablo için indeksler `madencilik`
--
ALTER TABLE `madencilik`
  ADD PRIMARY KEY (`madencilikid`);

--
-- Tablo için indeksler `madencilikhash`
--
ALTER TABLE `madencilikhash`
  ADD KEY `hashid` (`hashid`),
  ADD KEY `madencilikid` (`madencilikid`);

--
-- Tablo için indeksler `numarabaslık`
--
ALTER TABLE `numarabaslık`
  ADD KEY `blokbasligiid` (`blokbasligiid`),
  ADD KEY `bloknumarasiid` (`bloknumarasiid`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `adres`
--
ALTER TABLE `adres`
  MODIFY `adresid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `blok`
--
ALTER TABLE `blok`
  MODIFY `blokid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `blokbaslik`
--
ALTER TABLE `blokbaslik`
  MODIFY `blokbasligiid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `blokboyutu`
--
ALTER TABLE `blokboyutu`
  MODIFY `boyutkimligiid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `cuzdan`
--
ALTER TABLE `cuzdan`
  MODIFY `cuzdanid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `dugum`
--
ALTER TABLE `dugum`
  MODIFY `dugumid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `gecerlicüzdansayisi`
--
ALTER TABLE `gecerlicüzdansayisi`
  MODIFY `gecerlicuzdansayisiid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `hashorani`
--
ALTER TABLE `hashorani`
  MODIFY `hashid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `islemhacmi`
--
ALTER TABLE `islemhacmi`
  MODIFY `hacimid` int(9) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `madencilik`
--
ALTER TABLE `madencilik`
  MODIFY `madencilikid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `baslikboyut`
--
ALTER TABLE `baslikboyut`
  ADD CONSTRAINT `baslikboyut_ibfk_1` FOREIGN KEY (`blokbasligiid`) REFERENCES `blokbaslik` (`blokbasligiid`),
  ADD CONSTRAINT `baslikboyut_ibfk_2` FOREIGN KEY (`boyutkimligiid`) REFERENCES `blokboyutu` (`boyutkimligiid`);

--
-- Tablo kısıtlamaları `bloknumarası`
--
ALTER TABLE `bloknumarası`
  ADD CONSTRAINT `bloknumarası_ibfk_1` FOREIGN KEY (`blokid`) REFERENCES `blok` (`blokid`);

--
-- Tablo kısıtlamaları `cuzdan`
--
ALTER TABLE `cuzdan`
  ADD CONSTRAINT `cuzdan_ibfk_1` FOREIGN KEY (`gecerlicuzdansayisi`) REFERENCES `gecerlicüzdansayisi` (`gecerlicuzdansayisiid`);

--
-- Tablo kısıtlamaları `dugum`
--
ALTER TABLE `dugum`
  ADD CONSTRAINT `dugum_ibfk_1` FOREIGN KEY (`madencilikid`) REFERENCES `madencilik` (`madencilikid`);

--
-- Tablo kısıtlamaları `gecerlicüzdansayisi`
--
ALTER TABLE `gecerlicüzdansayisi`
  ADD CONSTRAINT `gecerlicüzdansayisi_ibfk_1` FOREIGN KEY (`adresid`) REFERENCES `adres` (`adresid`);

--
-- Tablo kısıtlamaları `hacimdügüm`
--
ALTER TABLE `hacimdügüm`
  ADD CONSTRAINT `hacimdügüm_ibfk_1` FOREIGN KEY (`dügümid`) REFERENCES `dugum` (`dugumid`),
  ADD CONSTRAINT `hacimdügüm_ibfk_2` FOREIGN KEY (`hacimid`) REFERENCES `islemhacmi` (`hacimid`);

--
-- Tablo kısıtlamaları `hashorani`
--
ALTER TABLE `hashorani`
  ADD CONSTRAINT `hashorani_ibfk_1` FOREIGN KEY (`adresid`) REFERENCES `adres` (`adresid`);

--
-- Tablo kısıtlamaları `islem`
--
ALTER TABLE `islem`
  ADD CONSTRAINT `islem_ibfk_1` FOREIGN KEY (`hacimid`) REFERENCES `islemhacmi` (`hacimid`);

--
-- Tablo kısıtlamaları `islemsayisi`
--
ALTER TABLE `islemsayisi`
  ADD CONSTRAINT `islemsayisi_ibfk_1` FOREIGN KEY (`boyutkimligiid`) REFERENCES `blokboyutu` (`boyutkimligiid`),
  ADD CONSTRAINT `islemsayisi_ibfk_2` FOREIGN KEY (`islemid`) REFERENCES `islem` (`islemid`);

--
-- Tablo kısıtlamaları `madencilikhash`
--
ALTER TABLE `madencilikhash`
  ADD CONSTRAINT `madencilikhash_ibfk_1` FOREIGN KEY (`hashid`) REFERENCES `hashorani` (`hashid`),
  ADD CONSTRAINT `madencilikhash_ibfk_2` FOREIGN KEY (`madencilikid`) REFERENCES `madencilik` (`madencilikid`);

--
-- Tablo kısıtlamaları `numarabaslık`
--
ALTER TABLE `numarabaslık`
  ADD CONSTRAINT `numarabaslık_ibfk_1` FOREIGN KEY (`blokbasligiid`) REFERENCES `blokbaslik` (`blokbasligiid`),
  ADD CONSTRAINT `numarabaslık_ibfk_2` FOREIGN KEY (`bloknumarasiid`) REFERENCES `bloknumarası` (`bloknumarasiid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
