-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2026 at 07:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_admin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_admin`) VALUES
(1, 'farrel', 'farrel', 'Administrator Perpustakaan');

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(11) NOT NULL,
  `nis` varchar(20) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `kelas` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nis`, `nama_anggota`, `username`, `password`, `kelas`) VALUES
(10, '12121', 'farrel', 'admin', '123', '12'),
(14, '212', 'farrel', 'admin', '121212', '12'),
(15, '23', 'perpustakaan', 'admin123', '4210', '8'),
(16, '1232543', 'llion', 'erwerwr', 'wrwrw', 'ww'),
(17, '21212', 'farrel', 'farrel', '12121212', '12'),
(18, '121212', 'farrel', 'admin', '4210', '12');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul_buku` varchar(100) NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `tahun_terbit` year(4) NOT NULL,
  `status` enum('tersedia','tidak') NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `judul_buku`, `pengarang`, `penerbit`, `tahun_terbit`, `status`, `stok`) VALUES
(11, 'matahari', 'bulan', 'bumi', '2009', 'tersedia', 5),
(12, 'sekolah', 'lion', 'farrel', '2000', 'tersedia', 3),
(13, 'Bintang', 'astronot', 'bulan', '2111', 'tersedia', 6),
(14, 'Musim Bunga', 'toko bunga', 'dunia', '2001', 'tidak', 4);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `tgl_pinjam` datetime NOT NULL DEFAULT current_timestamp(),
  `tgl_kembali` datetime NOT NULL DEFAULT current_timestamp(),
  `status_transaksi` enum('peminjaman','pengembalian') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_anggota`, `id_buku`, `tgl_pinjam`, `tgl_kembali`, `status_transaksi`) VALUES
(1, 2, 3, '2026-12-02 03:11:00', '2026-04-13 14:45:39', 'pengembalian'),
(2, 6, 5, '2026-12-04 13:31:00', '2026-04-13 16:29:18', 'pengembalian'),
(3, 6, 2, '2026-04-13 16:30:14', '2026-04-13 16:39:07', 'pengembalian'),
(4, 6, 4, '2026-04-13 16:33:45', '2026-04-13 16:42:23', 'pengembalian'),
(5, 6, 2, '2026-04-13 16:39:11', '2026-04-13 16:46:59', 'pengembalian'),
(6, 6, 5, '2026-04-13 16:40:05', '2026-04-13 02:40:05', 'peminjaman'),
(7, 6, 2, '2026-04-13 16:42:28', '2026-04-13 17:38:16', 'pengembalian'),
(8, 6, 5, '2026-04-13 16:42:44', '2026-04-13 02:42:44', 'peminjaman'),
(9, 6, 6, '2026-04-13 16:45:25', '2026-04-13 02:45:25', 'peminjaman'),
(10, 6, 8, '2026-04-13 16:53:58', '2026-04-13 17:04:25', 'pengembalian'),
(11, 6, 7, '2026-04-13 17:37:48', '2026-04-13 17:38:11', 'pengembalian'),
(12, 10, 11, '2026-12-04 10:12:00', '2026-04-13 18:46:54', 'peminjaman'),
(13, 10, 12, '4244-12-12 15:42:00', '2026-04-14 08:58:58', 'pengembalian'),
(14, 11, 12, '2026-04-14 08:50:36', '2026-04-14 08:50:53', 'pengembalian'),
(15, 11, 11, '2026-04-14 08:50:41', '2026-04-14 08:51:02', 'pengembalian'),
(16, 11, 12, '2026-04-14 08:51:12', '2026-04-14 08:51:31', 'pengembalian'),
(18, 14, 14, '2026-04-14 09:00:53', '2026-04-13 19:00:53', 'peminjaman'),
(19, 14, 13, '2026-04-14 09:00:57', '2026-04-13 19:00:57', 'peminjaman'),
(20, 12, 14, '2056-02-29 11:11:00', '2026-04-13 19:04:10', 'peminjaman'),
(21, 10, 12, '2026-04-14 09:11:04', '2026-04-14 09:11:08', 'pengembalian');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
