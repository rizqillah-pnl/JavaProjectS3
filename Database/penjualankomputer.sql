-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2020 at 04:47 PM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `penjualankomputer`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `id_barang` varchar(5) NOT NULL DEFAULT '',
  `nama_barang` varchar(40) DEFAULT NULL,
  `jns_barang` enum('PC','Laptop','Sparepart','Software') DEFAULT NULL,
  `jum_stok` int(11) DEFAULT NULL,
  `harga_brg` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `jns_barang`, `jum_stok`, `harga_brg`) VALUES
('001', 'RAM 6GB', 'Sparepart', 25, 600000),
('002', 'ASUS A45LF', 'Laptop', 10, 5500000),
('003', 'NVIDIA RTX 2080', 'Sparepart', 10, 8000000),
('004', 'Intel Core i5 8540', 'Sparepart', 15, 35000000),
('005', 'Windows 10 2016', 'Software', 50, 250000),
('006', 'Matlab', 'Software', 20, 160000),
('007', 'Asus 8GB 3TB', 'PC', 15, 8500000);

-- --------------------------------------------------------

--
-- Table structure for table `gaji_karyawan`
--

CREATE TABLE IF NOT EXISTS `gaji_karyawan` (
  `id_karyawan` varchar(20) NOT NULL DEFAULT '',
  `gaji_pokok` int(11) DEFAULT NULL,
  `Bonus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_karyawan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gaji_karyawan`
--

INSERT INTO `gaji_karyawan` (`id_karyawan`, `gaji_pokok`, `Bonus`) VALUES
('1957301002', 2500000, 324000),
('1957301006', 5600000, 842930),
('1957301010', 3000000, 2500000),
('1957301014', 1000000, 50000),
('1957301015', 4000000, 650000),
('1957301020', 8750000, 243200),
('1957301045', 2500000, 2500000),
('1957301061', 200000, 25000);

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE IF NOT EXISTS `karyawan` (
  `id_karyawan` varchar(20) NOT NULL DEFAULT '',
  `nama` varchar(40) DEFAULT NULL,
  `jkel` enum('L','P') DEFAULT NULL,
  `agama` enum('Islam','Protestan','Katolik','Hindu','Buddha','Konghucu') DEFAULT NULL,
  `alamat` varchar(40) DEFAULT NULL,
  `hp` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_karyawan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama`, `jkel`, `agama`, `alamat`, `hp`) VALUES
('1957301002', 'Annisa Rizka Aulia', 'P', 'Islam', 'Lhokseumawe', '08263738283'),
('1957301006', 'Muhammad Fajar Alfath', 'L', 'Islam', 'Lhokseumawe', '0822363728383'),
('1957301010', 'Rifnatul Hasanah', 'P', 'Islam', 'Lhokseumawe', '082163372838'),
('1957301014', 'Mesti', 'P', 'Islam', 'Lhokseumawe', '082637283892'),
('1957301015', 'Abdurrazaq', 'L', 'Islam', 'Lhokseumawe', '082146754675'),
('1957301017', 'Salma Sheila Maulina Putri', 'P', 'Islam', 'Geudong', '08226372738'),
('1957301020', 'Rizqillah', 'L', 'Islam', 'Geudong', '082165517433'),
('1957301022', 'M. Rifky Adity', 'L', 'Islam', 'Bireun', '0821627327283'),
('1957301024', 'Nursella Indah Armaya', 'P', 'Islam', 'Lhokseumawe', '082253728392'),
('1957301025', 'Isnani', 'P', 'Islam', 'Lhoksukon', '0827372837283'),
('1957301028', 'Awalul Zikri Annur', 'L', 'Islam', 'Lhokseumawe', '082163737483'),
('1957301045', 'Muariful Fattah', 'L', 'Islam', 'Aceh Timur', '082163732738'),
('1957301061', 'Rizky Fahlevi', 'L', 'Islam', 'Lhokseumawe', '0821635463728');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `id_karyawan` varchar(10) DEFAULT NULL,
  KEY `id_karyawan` (`id_karyawan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `id_karyawan`) VALUES
('admin', 'admin', '1957301020');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE IF NOT EXISTS `penjualan` (
  `id_pembeli` varchar(10) DEFAULT NULL,
  `id_barang` varchar(10) DEFAULT NULL,
  `jum_barang` int(11) DEFAULT NULL,
  `tgl_jual` date DEFAULT NULL,
  KEY `id_barang` (`id_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_pembeli`, `id_barang`, `jum_barang`, `tgl_jual`) VALUES
('001', '001', 2, '2020-12-01'),
('002', '002', 4, '2020-12-04'),
('004', '005', 5, '2020-12-04'),
('003', '001', 1, '2020-11-09'),
('005', '003', 3, '2020-12-03'),
('006', '002', 1, '2020-12-01'),
('007', '006', 2, '2020-12-04'),
('008', '005', 2, '2020-12-02'),
('020', '006', 2, '2020-12-10');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gaji_karyawan`
--
ALTER TABLE `gaji_karyawan`
  ADD CONSTRAINT `gaji_karyawan_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
