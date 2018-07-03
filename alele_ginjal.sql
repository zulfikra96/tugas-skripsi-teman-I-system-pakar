-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 30, 2018 at 06:22 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alele_ginjal`
--

-- --------------------------------------------------------

--
-- Table structure for table `detailkonsul`
--

CREATE TABLE `detailkonsul` (
  `idkonsul` varchar(5) NOT NULL,
  `idgejala` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detailkonsul`
--

INSERT INTO `detailkonsul` (`idkonsul`, `idgejala`) VALUES
('1', 'G01'),
('1', 'G02'),
('2', 'G08'),
('2', 'G10'),
('3', 'G01'),
('3', 'G03'),
('3', 'G06'),
('3', 'G07'),
('3', 'G08'),
('3', 'G09'),
('4', 'G01'),
('4', 'G03'),
('4', 'G05'),
('7', 'G01'),
('7', 'G02'),
('7', 'G03'),
('9', 'G01');

-- --------------------------------------------------------

--
-- Table structure for table `tblgangguan`
--

CREATE TABLE `tblgangguan` (
  `idgangguan` varchar(5) NOT NULL,
  `namagangguan` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblgangguan`
--

INSERT INTO `tblgangguan` (`idgangguan`, `namagangguan`) VALUES
('P1', 'Ginjal');

-- --------------------------------------------------------

--
-- Table structure for table `tblgangguanterapi`
--

CREATE TABLE `tblgangguanterapi` (
  `id` int(3) NOT NULL,
  `idgangguan` varchar(5) NOT NULL,
  `idterapi` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblgangguanterapi`
--

INSERT INTO `tblgangguanterapi` (`id`, `idgangguan`, `idterapi`) VALUES
(1, 'P1', 'S1'),
(2, 'P1', 'S2'),
(3, 'P1', 'S3'),
(4, 'P1', 'S4'),
(5, 'P1', 'S5');

-- --------------------------------------------------------

--
-- Table structure for table `tblgejala`
--

CREATE TABLE `tblgejala` (
  `idgejala` varchar(5) NOT NULL,
  `namagejala` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblgejala`
--

INSERT INTO `tblgejala` (`idgejala`, `namagejala`) VALUES
('G01', ' Kulit disekitar benjolan memerah, bengkak dan terasa hangat disentuh'),
('G02', 'Tanda - tanda seperti pilek misalkan radang tenggorokan, hidung beringus, hidung tersumbat'),
('G03', 'Serpihan kulit mati berwarna putih atau ke abu - abuan, kulit berminyak rasa gatal yang muncul dikulit kepala'),
('G04', 'Rasa gatal ketika berkeringat, warna sebagian kulit berubah menjadi putih, coklat dan bahkan merah tergantung pigmen si penderita'),
('G05', 'Beberapa luka yang muncul didalam mulut atau tepatnya pada gusi, lidah, pipi, bibir dan langit-langit mulut'),
('G06', 'Bentuk kuthil menonjol ke atas seperti bulatan yang memiliki bulatan permukaan yang kasar'),
('G07', 'Bentuknya berupa gelembung - gelembung kecil berisi air atau luka - luka dan rasanya sangat nyeri'),
('G08', 'Ditandai dengan kulit melepuh yang berisi cairan dan biasanya disertai dengan demam pembengkakan kelenjar getah bening '),
('G09', 'panas dari derajat yang rendah sampai dengan menggigil'),
('G10', 'Berwarna cerah, merah mudah, atau merah menonjol atau bennjolan atau berkerut disertai gatal'),
('G11', 'Rasa lelah yang ekstrim, ruam pada kulit, nyeri pada persedian'),
('G12', 'Muncul berupa tanda warna merah pada kulit yang bisa tumbuh atau berkembang dengan cepat sehingga kemudian terlihat menonjol dari permukaan kulit'),
('G13', 'Pembuluh darah dibawah kulit yang terlihat jelas, kulit terasa gatal , perih, nyeri, dan muncul sensasi seperti terbakar dan membentuk Plak');

-- --------------------------------------------------------

--
-- Table structure for table `tblgejalagangguan`
--

CREATE TABLE `tblgejalagangguan` (
  `id` int(3) NOT NULL,
  `idgejala` varchar(5) NOT NULL,
  `idgangguan` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblgejalagangguan`
--

INSERT INTO `tblgejalagangguan` (`id`, `idgejala`, `idgangguan`) VALUES
(2, 'G02', 'P1'),
(3, 'G03', 'P1'),
(4, 'G04', 'P1'),
(5, 'G05', 'P1'),
(6, 'G06', 'P1'),
(7, 'G07', 'P1'),
(8, 'G08', 'P1'),
(9, 'G09', 'P1'),
(10, 'G10', 'P1'),
(11, 'G11', 'P1');

-- --------------------------------------------------------

--
-- Table structure for table `tblkonsultasi`
--

CREATE TABLE `tblkonsultasi` (
  `id` int(5) NOT NULL,
  `id_pasien` varchar(9) NOT NULL,
  `id_gangguan` varchar(9) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblkonsultasi`
--

INSERT INTO `tblkonsultasi` (`id`, `id_pasien`, `id_gangguan`, `created_at`) VALUES
(18, '1', '4', '2018-06-30 16:10:03'),
(17, '1', '1', '2018-06-30 16:03:19'),
(21, '2', '2', '2018-06-30 16:17:14'),
(20, '1', '10', '2018-06-30 16:14:11'),
(19, '1', '6', '2018-06-30 16:12:22'),
(22, '2', '4', '2018-06-30 16:18:51'),
(23, '2', '13', '2018-06-30 16:19:56');

-- --------------------------------------------------------

--
-- Table structure for table `tblpenyakit`
--

CREATE TABLE `tblpenyakit` (
  `idkon` int(50) NOT NULL,
  `namapenyakit` varchar(200) NOT NULL,
  `kodepenyakit` int(5) DEFAULT NULL,
  `gejala_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpenyakit`
--

INSERT INTO `tblpenyakit` (`idkon`, `namapenyakit`, `kodepenyakit`, `gejala_id`) VALUES
(1, 'jerawat', NULL, 'G01'),
(2, 'bisul', NULL, 'G02'),
(3, 'campak', NULL, 'G03'),
(4, 'ketombe', NULL, 'G04'),
(5, 'sariawan', NULL, 'G05'),
(6, 'herpes', NULL, 'G06'),
(7, 'kudis', NULL, 'G07'),
(8, 'impetigo', NULL, 'G08'),
(9, 'lepra', NULL, 'G09'),
(10, 'keloid', NULL, 'G10'),
(11, 'hemangioma', NULL, 'G11'),
(12, 'vintiligo', NULL, 'G12'),
(13, 'hypohidrosis', NULL, 'G13');

-- --------------------------------------------------------

--
-- Table structure for table `tblterapi`
--

CREATE TABLE `tblterapi` (
  `idterapi` varchar(5) NOT NULL,
  `keteranganterapi` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblterapi`
--

INSERT INTO `tblterapi` (`idterapi`, `keteranganterapi`) VALUES
('S1', 'Penderita yang mengalami gagal ginjal harus menjalani cuci darah atau dialisis dengan mesin yang menggantikan fungsi ginjal.'),
('S2', 'Mengurangi makanan yang mengandung garam. garam adalah salah satu jenis makanan dengan kandungan natrium yang tinggi. Natrium yang tinggi bukan hanya bisa menyebabkan tekanan darah, namun juga akan memicu terjadinya proses pembentukan batu ginjal.'),
('S3', 'Operasi merupakan salah satu metode pengobatan yang efektif untuk penderita ginjal.'),
('S4', 'Menggunakan obat berbahan kimia, memang dapat membunuh sel kanker, dapat menghambat pertumbuhan sel tumor dan reproduksi, akan tetapi, penggunaan obat yang berbahan kimia juga dapat menurunkan kekebalan tubuh pasien, sel-sel jaringan yang normal menjadi rusak, sehingga banyak pasien kanker yang menjadi resisten terhadap pengobatan kemoterapi.'),
('S5', 'Alternatif Alami:<br><br>\r\n1.	Daun keji beling ditumbuk halus dan daun kumis kucing serta daun meniran dicabut dengan akarnya<br>\r\n    Caranya: Rebuslah semua bahan dengan air sebanyak 1 liter. Biarkan hingga air tinggal separuhnya. Kemudian saring, minumlah setiap hari secara teratur selamalima hari berturut turut.<br>\r\n2. Daun alpukat segar dan Air panas<br>\r\n   Caranya: Daun alpukat yang sudah dicuci bersih dimasukan ke dalam gelas, kemudian seduh dengan air panas. Minumlah ramuan tersebut 2 kali sehari dan ingat ramuan ini cuma sekali minum.<br>\r\n3.	Daun meniran, Daun ungu, Daun arbei,Daun duduk, Daun kumis kucing, Daun sendokan,Daun ngikilo.<br>\r\n    Caranya: Cuci bersih semua bahan, kemudian rebus sampai benar benar mendidih. Saring dan biarkan sampai airnya hangat. Minumlah ramuan ini secara teratur.<br>\r\n4.	Pucuk daun keji beling, Rambut jagung muda, Temulawak diiris tipis, Daun kumis kucing, Gula merah, Garam dapur<br>\r\n    Caranya: Rebus pucuk daun keji beling, temulawak,rambut jagung,  kumis kucing. Biarkan sampai mendidih. Kemudian tambahkan gula merah dan garam secukupnya. Setelah dingin minumlah 3 kali sehari secara rutin.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL,
  `username` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `password`, `nama_lengkap`, `level`, `username`) VALUES
(1, 'U2FsdGVkX19PwYaQrlDhQJeBC8SsvGtxu8Y1qLp+isA=', 'zulfikra', 'pasien', 'zulfikra'),
(2, 'U2FsdGVkX19maQbjuMLplu2Dl0rmODBPrwaa9HANCyE=', 'ryan eka', 'pasien', 'ryan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblgangguan`
--
ALTER TABLE `tblgangguan`
  ADD PRIMARY KEY (`idgangguan`);

--
-- Indexes for table `tblgangguanterapi`
--
ALTER TABLE `tblgangguanterapi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblgejala`
--
ALTER TABLE `tblgejala`
  ADD PRIMARY KEY (`idgejala`);

--
-- Indexes for table `tblgejalagangguan`
--
ALTER TABLE `tblgejalagangguan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblkonsultasi`
--
ALTER TABLE `tblkonsultasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpenyakit`
--
ALTER TABLE `tblpenyakit`
  ADD PRIMARY KEY (`idkon`);

--
-- Indexes for table `tblterapi`
--
ALTER TABLE `tblterapi`
  ADD PRIMARY KEY (`idterapi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblgangguanterapi`
--
ALTER TABLE `tblgangguanterapi`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tblgejalagangguan`
--
ALTER TABLE `tblgejalagangguan`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tblkonsultasi`
--
ALTER TABLE `tblkonsultasi`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tblpenyakit`
--
ALTER TABLE `tblpenyakit`
  MODIFY `idkon` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
