-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 08, 2026 at 02:25 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siakad`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id` bigint UNSIGNED NOT NULL,
  `nidn` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `jabatan_fungsional` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id`, `nidn`, `nama`, `email`, `telepon`, `alamat`, `created_at`, `updated_at`, `jabatan_fungsional`) VALUES
(1, '0082211590', 'Hendra Wulandari, S.Kom., M.Eng.', 'rahayu.zamira@example.org', '082105728151', 'Kpg. Bak Mandi No. 381, Sabang 13914, Sulut', '2026-11-05 20:45:19', '2026-11-05 20:45:19', NULL),
(2, '0092896491', 'Maryanto Mangunsong, S.Kom., M.Eng.', 'lamar.mulyani@example.com', '087938104777', 'Psr. Sadang Serang No. 941, Balikpapan 88987, Jatim', '2026-11-05 20:45:19', '2026-11-05 20:45:19', NULL),
(3, '0041148556', 'Hafshah Nainggolan, S.Si., M.Cs.', 'widya91@example.org', '087665135904', 'Ki. B.Agam Dlm No. 483, Banda Aceh 36201, Banten', '2026-11-05 20:45:19', '2026-11-05 20:45:19', NULL),
(4, '0022230576', 'Galih Hidayanto, S.Si., M.Cs.', 'suwarno.gamanto@example.org', '084861954726', 'Jr. Basoka Raya No. 968, Tangerang 56995, Jabar', '2026-11-05 20:45:19', '2026-11-05 20:45:19', NULL),
(5, '0002490333', 'Aurora Zulaika, S.T., M.T.', 'laksana82@example.net', '082006553339', 'Jr. Wahid No. 761, Palu 31587, Kalteng', '2026-11-05 20:45:19', '2026-11-05 20:45:19', NULL),
(6, '0059112083', 'Nadine Zulaika, S.T., M.T.', 'gatra60@example.org', '082249530465', 'Ki. Cikapayang No. 226, Padangsidempuan 45839, Riau', '2026-11-05 20:45:19', '2026-11-05 20:45:19', NULL),
(7, '0043805508', 'Kezia Susanti, S.T., M.T.', 'unjani75@example.net', '089495520891', 'Jln. Madrasah No. 275, Tangerang Selatan 87203, Malut', '2026-11-05 20:45:19', '2026-11-05 20:45:19', NULL),
(8, '0005769403', 'Caraka Hidayanto, S.Si., M.Cs.', 'tfirmansyah@example.com', '081619914461', 'Gg. Hang No. 691, Madiun 37209, Jateng', '2026-11-05 20:45:19', '2026-11-05 20:45:19', NULL),
(9, '0013034195', 'Lega Prasasta, S.Kom., M.Kom.', 'cawisono25@example.net', '082288532667', 'Ki. Balikpapan No. 309, Administrasi Jakarta Pusat 94663, DIY', '2026-11-05 20:45:19', '2026-11-05 20:45:19', NULL),
(10, '0024780674', 'Vicky Halimah, S.Si., M.Cs.', 'ohutasoit@example.net', '080260445831', 'Jln. Suniaraja No. 616, Blitar 15130, Malut', '2026-11-05 20:45:19', '2026-11-05 20:45:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `krs`
--

CREATE TABLE `krs` (
  `id` bigint UNSIGNED NOT NULL,
  `mahasiswa_id` bigint UNSIGNED NOT NULL,
  `tahun_akademik` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` enum('Ganjil','Genap') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('draft','diajukan','disetujui','ditolak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `krs`
--

INSERT INTO `krs` (`id`, `mahasiswa_id`, `tahun_akademik`, `semester`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2026/2027', 'Ganjil', 'draft', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(2, 2, '2026/2027', 'Ganjil', 'draft', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(3, 3, '2026/2027', 'Ganjil', 'draft', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(4, 4, '2026/2027', 'Ganjil', 'draft', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(5, 5, '2026/2027', 'Ganjil', 'draft', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(6, 6, '2026/2027', 'Ganjil', 'draft', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(7, 7, '2026/2027', 'Ganjil', 'draft', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(8, 8, '2026/2027', 'Ganjil', 'draft', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(9, 9, '2026/2027', 'Ganjil', 'draft', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(10, 10, '2026/2027', 'Ganjil', 'draft', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(12, 21, '2026/2027', 'Genap', 'draft', '2026-11-08 06:30:04', '2026-11-08 06:30:04');

-- --------------------------------------------------------

--
-- Table structure for table `krs_detail`
--

CREATE TABLE `krs_detail` (
  `id` bigint UNSIGNED NOT NULL,
  `krs_id` bigint UNSIGNED NOT NULL,
  `mata_kuliah_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `krs_detail`
--

INSERT INTO `krs_detail` (`id`, `krs_id`, `mata_kuliah_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(2, 1, 3, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(3, 1, 1, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(4, 1, 6, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(5, 1, 10, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(6, 2, 6, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(7, 2, 2, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(8, 2, 8, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(9, 2, 4, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(10, 2, 9, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(11, 3, 8, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(12, 3, 4, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(13, 3, 6, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(14, 3, 1, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(15, 3, 2, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(16, 4, 6, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(17, 4, 9, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(18, 4, 1, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(19, 4, 10, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(20, 4, 8, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(21, 5, 7, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(22, 5, 10, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(23, 5, 4, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(24, 5, 2, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(25, 5, 3, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(26, 6, 10, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(27, 6, 5, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(28, 6, 9, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(29, 6, 1, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(30, 6, 6, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(31, 7, 5, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(32, 7, 4, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(33, 7, 1, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(34, 7, 9, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(35, 7, 3, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(36, 8, 8, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(37, 8, 6, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(38, 8, 10, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(39, 8, 4, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(40, 8, 3, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(41, 9, 4, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(42, 9, 2, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(43, 9, 9, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(44, 9, 3, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(45, 9, 6, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(46, 10, 8, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(47, 10, 3, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(48, 10, 1, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(49, 10, 2, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(50, 10, 6, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(58, 12, 1, '2026-11-08 06:30:04', '2026-11-08 06:30:04'),
(59, 12, 2, '2026-11-08 06:30:04', '2026-11-08 06:30:04'),
(60, 12, 3, '2026-11-08 06:30:04', '2026-11-08 06:30:04'),
(61, 12, 4, '2026-11-08 06:30:04', '2026-11-08 06:30:04');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` bigint UNSIGNED NOT NULL,
  `nim` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `angkatan` smallint UNSIGNED NOT NULL,
  `program_studi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'D3 Teknik Informatika',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nim`, `nama`, `jenis_kelamin`, `email`, `angkatan`, `program_studi`, `created_at`, `updated_at`) VALUES
(1, '2403037051', 'Tirta Wasita', 'L', '2403037051@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(2, '2503038388', 'Paris Dabukke', 'P', '2503038388@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(3, '2503031880', 'Dewi Wibowo', 'P', '2503031880@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(4, '2303039243', 'Sarah Setiawan', 'P', '2303039243@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(5, '2203030505', 'Kartika Rahayu', 'P', '2203030505@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(6, '2303035508', 'Zizi Nasyiah', 'P', '2303035508@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(7, '2203036169', 'Dacin Agustina', 'L', '2203036169@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(8, '2203035304', 'Farah Halimah', 'P', '2203035304@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(9, '2303034671', 'Jane Oktaviani', 'P', '2303034671@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(10, '2303032596', 'Darmanto Permadi', 'L', '2303032596@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(11, '2303034318', 'Baktianto Hidayanto', 'L', '2303034318@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(12, '2403038233', 'Nardi Yuliarti', 'L', '2403038233@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(13, '2303035265', 'Kawaya Nurdiyanti', 'L', '2303035265@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(15, '2503039097', 'Elisa Purwanti', 'P', '2503039097@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(16, '2503037850', 'Uchita Hartati', 'P', '2503037850@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(17, '2303031401', 'Dian Megantara', 'P', '2303031401@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(18, '2303030770', 'Laila Hassanah', 'P', '2303030770@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(19, '2303030856', 'Rina Lazuardi', 'P', '2303030856@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(20, '2203033449', 'Nadine Wahyuni', 'P', '2203033449@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(21, '2403035503', 'Alika Wasita', 'P', '2403035503@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(22, '2403035213', 'Ulya Nurdiyanti', 'P', '2403035213@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(23, '2503035274', 'Hani Mulyani', 'P', '2503035274@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(24, '2303036116', 'Bakijan Rajata', 'L', '2303036116@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(25, '2503036158', 'Kawaca Hutagalung', 'L', '2503036158@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(26, '2503036088', 'Febi Budiyanto', 'P', '2503036088@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(27, '2203035212', 'Yuliana Maryadi', 'P', '2203035212@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(28, '2203034188', 'Lili Samosir', 'P', '2203034188@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(29, '2203037524', 'Jaswadi Andriani', 'L', '2203037524@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(30, '2403033639', 'Banawa Nurdiyanti', 'L', '2403033639@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(31, '2203033232', 'Niyaga Prastuti', 'L', '2203033232@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(32, '2203033385', 'Jessica Sitompul', 'P', '2203033385@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(33, '2203037845', 'Yani Kusmawati', 'P', '2203037845@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(34, '2503032864', 'Danang Anggraini', 'L', '2503032864@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(35, '2403038251', 'Asmianto Mahendra', 'L', '2403038251@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(36, '2503039565', 'Irwan Laksita', 'L', '2503039565@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(37, '2203036010', 'Ibrani Simanjuntak', 'L', '2203036010@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(38, '2303038929', 'Caket Hassanah', 'L', '2303038929@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(39, '2303036020', 'Tina Maheswara', 'P', '2303036020@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(40, '2303036855', 'Olivia Saragih', 'P', '2303036855@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(41, '2303035106', 'Salsabila Siregar', 'P', '2303035106@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(42, '2503039605', 'Hadi Mandasari', 'L', '2503039605@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(43, '2503031876', 'Paulin Winarno', 'P', '2503031876@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(44, '2303033719', 'Viman Halimah', 'L', '2303033719@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(45, '2503034489', 'Saiful Najmudin', 'L', '2503034489@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(46, '2303037984', 'Prabu Fujiati', 'L', '2303037984@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(47, '2403031867', 'Irma Simanjuntak', 'P', '2403031867@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(48, '2503032545', 'Aurora Salahudin', 'P', '2503032545@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(49, '2303036086', 'Hani Safitri', 'P', '2303036086@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(50, '2503035684', 'Margana Maheswara', 'L', '2503035684@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(51, '3202416088', 'Khaidir Umam', 'L', 'khaidirvanaza@gmail.com', 2024, 'D3 Teknik Informatika', '2026-11-08 03:48:52', '2026-11-08 03:48:52');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `id` bigint UNSIGNED NOT NULL,
  `kode_mk` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_mk` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sks` tinyint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`id`, `kode_mk`, `nama_mk`, `sks`, `created_at`, `updated_at`) VALUES
(1, 'TI101', 'Pengantar Teknologi Informasi', 2, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(2, 'TI102', 'Algoritma dan Pemrograman', 3, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(3, 'TI103', 'Matematika Diskrit', 3, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(4, 'TI201', 'Basis Data', 3, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(5, 'TI202', 'Desain Web', 3, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(6, 'TI203', 'Pemrograman Web', 3, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(7, 'TI204', 'Jaringan Komputer', 3, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(8, 'TI301', 'Rekayasa Perangkat Lunak', 3, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(9, 'TI302', 'Pemrograman Berorientasi Objek', 3, '2026-11-05 20:45:19', '2026-11-05 20:45:19'),
(10, 'TI303', 'Sistem Operasi', 2, '2026-11-05 20:45:19', '2026-11-05 20:45:19');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_10_26_141308_create_dosen_table', 1),
(5, '2026_10_26_141317_create_mahasiswa_table', 1),
(6, '2026_10_26_141327_create_mata_kuliah_table', 1),
(7, '2026_10_26_141937_create_krs_table', 1),
(8, '2026_10_26_141945_create_krs_detail_table', 1),
(9, '2026_10_29_093557_add_jabatan_fungsional_to_dosen_table', 1),
(10, '2026_10_29_145152_add_last_login_at_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('4lAPYS7eNf8P93S76M0eYstslDkcAnSkCzP6GqKg', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36 Edg/156.0.0.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoia3d5dHZCemJuTUZXWTRIdndmekc5U3A1S1hveHhJS0FlTnNLWHRkaiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjMyOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAva3JzL2NyZWF0ZSI7czo1OiJyb3V0ZSI7czoxMDoia3JzLmNyZWF0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6IjJlMTBmNzUzYTMyYzE0MWI5N2RkY2EzZDIzODZiY2NjYjAyZjMwMmYyYjEyYTkxZTEyNjIxOWEwMTkwZDUxN2IiO30=', 1794144679);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','dosen','mahasiswa') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'mahasiswa',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `last_login_at`, `created_at`, `updated_at`) VALUES
(1, 'Administrator SIAKAD', 'admin@siakad.test', NULL, '$2y$12$JxAFjnO3NNadEypb1NcHZOz00k9YsybDxtOx5gVuVdbak44aVO5XC', 'admin', NULL, '2026-11-08 00:20:27', '2026-11-05 20:45:17', '2026-11-08 00:20:27'),
(2, 'Dosen Uji', 'dosen@siakad.test', NULL, '$2y$12$VUciip7l96mqJf8ulAPVrO6Cv.wkfYucy1MzEzD9tGpF7NXMnrFoK', 'dosen', NULL, NULL, '2026-11-05 20:45:17', '2026-11-05 20:45:17'),
(3, 'Mahasiswa Uji', 'mahasiswa@siakad.test', NULL, '$2y$12$TWxdvAwrKwHU12afVyBcmeSWEoPk2lth6wFYQcf0YCl0vlCJcy6uC', 'mahasiswa', NULL, NULL, '2026-11-05 20:45:18', '2026-11-05 20:45:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dosen_nidn_unique` (`nidn`),
  ADD UNIQUE KEY `dosen_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `krs_mahasiswa_id_tahun_akademik_semester_unique` (`mahasiswa_id`,`tahun_akademik`,`semester`);

--
-- Indexes for table `krs_detail`
--
ALTER TABLE `krs_detail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `krs_detail_krs_id_mata_kuliah_id_unique` (`krs_id`,`mata_kuliah_id`),
  ADD KEY `krs_detail_mata_kuliah_id_foreign` (`mata_kuliah_id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mahasiswa_nim_unique` (`nim`),
  ADD UNIQUE KEY `mahasiswa_email_unique` (`email`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mata_kuliah_kode_mk_unique` (`kode_mk`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `krs`
--
ALTER TABLE `krs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `krs_detail`
--
ALTER TABLE `krs_detail`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `krs`
--
ALTER TABLE `krs`
  ADD CONSTRAINT `krs_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `krs_detail`
--
ALTER TABLE `krs_detail`
  ADD CONSTRAINT `krs_detail_krs_id_foreign` FOREIGN KEY (`krs_id`) REFERENCES `krs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `krs_detail_mata_kuliah_id_foreign` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `mata_kuliah` (`id`) ON DELETE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
