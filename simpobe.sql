-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2026 at 04:54 AM
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
-- Database: `simpobe`
--

-- --------------------------------------------------------

--
-- Table structure for table `bahan_kajian`
--

CREATE TABLE `bahan_kajian` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_bk` varchar(255) NOT NULL,
  `bahan_kajian` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `referensi` text DEFAULT NULL,
  `knowledge_area` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prodi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bahan_kajian`
--

INSERT INTO `bahan_kajian` (`id`, `kode_bk`, `bahan_kajian`, `deskripsi`, `referensi`, `knowledge_area`, `created_at`, `updated_at`, `prodi`) VALUES
(1, 'BK01', 'Social Issues and Professional Practice', 'Isu sosial dan praktik profesional dalam komputasi', 'CC2020', 'Landscape of Computing Knowledge', '2026-01-19 04:54:46', '2026-01-19 21:47:07', 'S1 Informatika'),
(2, 'BK02', 'Security Policy and Management', 'Kebijakan dan manajemen keamanan informasi', 'CC2020', 'Landscape of Computing Knowledge', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(3, 'BK03', 'Project Management', 'Manajemen proyek perangkat lunak dan TI', 'CC2020', 'Landscape of Computing Knowledge', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(4, 'BK04', 'User Experience Design', 'Desain pengalaman pengguna dan antarmuka', 'CC2020', 'Landscape of Computing Knowledge', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(5, 'BK05', 'Security Issues and Principles', 'Prinsip dan isu-isu keamanan dasar', 'CC2020', 'Landscape of Computing Knowledge', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(6, 'BK06', 'Data and Information Management', 'Pengelolaan data dan informasi organisasi', 'CC2020', 'Landscape of Computing Knowledge', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(7, 'BK07', 'Parallel and Distributed Computing', 'Komputasi paralel dan sistem terdistribusi', 'CC2020', 'Landscape of Computing Knowledge', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(8, 'BK08', 'Computer Network', 'Jaringan komputer dan komunikasi data', 'CC2020', 'Landscape of Computing Knowledge', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(9, 'BK09', 'Security Technology and Implementation', 'Teknologi dan implementasi keamanan sistem', 'CC2020', 'Landscape of Computing Knowledge', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(10, 'BK10', 'Software Design', 'Perancangan struktur dan arsitektur perangkat lunak', 'CC2020', 'Landscape of Computing Knowledge', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(11, 'BK11', 'Operating Systems', 'Konsep dan mekanisme sistem operasi', 'CC2020', 'Landscape of Computing Knowledge', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(12, 'BK12', 'Data Structures, Algorithms and Complexity', 'Struktur data, algoritma, dan analisis kompleksitas', 'CC2020', 'Landscape of Computing Knowledge', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(13, 'BK13', 'Programming Languages', 'Paradigma dan konsep bahasa pemrograman', 'CC2020', 'Landscape of Computing Knowledge', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(14, 'BK14', 'Programming Fundamentals', 'Dasar-dasar logika dan teknik pemrograman', 'CC2020', 'Landscape of Computing Knowledge', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(15, 'BK15', 'Computing Systems Fundamentals', 'Dasar-dasar sistem komputasi', 'CC2020', 'Landscape of Computing Knowledge', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(16, 'BK16', 'Architecture and Organization', 'Arsitektur dan organisasi komputer', 'CC2020', 'Landscape of Computing Knowledge', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(17, 'BK17', 'Graphics and Visualization', 'Grafika komputer dan visualisasi data', 'CC2020', 'Landscape of Computing Knowledge', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(18, 'BK18', 'Intelligent Systems', 'Sistem cerdas dan kecerdasan buatan', 'CC2020', 'Landscape of Computing Knowledge', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(19, 'BK19', 'Platform-Based Development', 'Pengembangan aplikasi berbasis platform (Web/Mobile)', 'CC2020', 'Landscape of Computing Knowledge', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(20, 'BK20', 'Computational Science', 'Sains komputasi dan pemodelan matematis', 'CC2020', 'Computer Science Draft Competencies', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(21, 'BK21', 'Discrete Structures', 'Struktur diskrit dan matematika untuk komputer', 'CC2020', 'Computer Science Draft Competencies', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(22, 'BK22', 'Human - Computer Interaction', 'Interaksi manusia dan komputer', 'CC2020', 'Computer Science Draft Competencies', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(23, 'BK23', 'Information Assurance and Security', 'Jaminan informasi dan keamanan siber', 'CC2020', 'Computer Science Draft Competencies', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(24, 'BK24', 'Software Development Fundamentals', 'Dasar-dasar pengembangan perangkat lunak', 'CC2020', 'Computer Science Draft Competencies', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(25, 'BK25', 'Software Process', 'Metodologi dan proses pengembangan perangkat lunak', 'CC2020', 'Computer Science Draft Competencies', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(26, 'BK26', 'Systems Analysis & Design', 'Analisis dan perancangan sistem informasi', 'CC2020', 'Computer Science Draft Competencies', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(27, 'BK27', 'Virtual System and Services', 'Sistem virtual dan layanan berbasis cloud', 'CC2020', 'Computer Science Draft Competencies', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(28, 'BK28', 'Software Quality, Verification and Validation', 'Kualitas, verifikasi, dan validasi perangkat lunak', 'CC2020', 'Computer Science Draft Competencies', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(29, 'BK29', 'Software Modeling and Analysis', 'Pemodelan dan analisis perangkat lunak', 'CC2020', 'Computer Science Draft Competencies', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(30, 'BK30', 'Pengembangan Diri', 'Karakter, etika, dan pengembangan potensi diri', 'SNDikti', 'SNDikti', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(31, 'BK31', 'Metodologi Penelitian', 'Teknik penelitian dan penulisan karya ilmiah', 'SNDikti', 'SNDikti', '2026-01-19 04:54:46', '2026-01-19 04:54:46', 'S1 Informatika'),
(68, 'BK01', 'Foundation of Information Systems', '', '', '', '2026-02-23 23:07:55', '2026-02-23 23:07:55', 'S1 Sistem Informasi'),
(69, 'BK02', 'Data / information Management', '', '', '', '2026-02-23 23:07:55', '2026-02-23 23:07:55', 'S1 Sistem Informasi'),
(70, 'BK03', 'IT Infrastructure', '', '', '', '2026-02-23 23:07:55', '2026-02-23 23:07:55', 'S1 Sistem Informasi'),
(71, 'BK04', 'IS Project Management', '', '', '', '2026-02-23 23:07:55', '2026-02-23 23:07:55', 'S1 Sistem Informasi'),
(72, 'BK05', 'Systems Analysis & Design', '', '', '', '2026-02-23 23:07:55', '2026-02-23 23:07:55', 'S1 Sistem Informasi'),
(73, 'BK06', 'IS Management and Strategy', '', '', '', '2026-02-23 23:07:55', '2026-02-23 23:07:55', 'S1 Sistem Informasi'),
(74, 'BK07', 'Application Development / Programming', '', '', '', '2026-02-23 23:07:55', '2026-02-23 23:07:55', 'S1 Sistem Informasi'),
(75, 'BK08', 'Secure Computing', '', '', '', '2026-02-23 23:07:55', '2026-02-23 23:07:55', 'S1 Sistem Informasi'),
(76, 'BK09', 'Ethics, use and implications for society', '', '', '', '2026-02-23 23:07:55', '2026-02-23 23:07:55', 'S1 Sistem Informasi'),
(77, 'BK10', 'Practicum', '', '', '', '2026-02-23 23:07:55', '2026-02-23 23:07:55', 'S1 Sistem Informasi'),
(78, 'BK11', 'Mathematics and statistics', '', '', '', '2026-02-23 23:07:55', '2026-02-23 23:07:55', 'S1 Sistem Informasi'),
(79, 'BK12', 'Data / Business Analytics', '', '', '', '2026-02-23 23:07:55', '2026-02-23 23:07:55', 'S1 Sistem Informasi'),
(80, 'BK13', 'Personality Development', '', '', '', '2026-02-23 23:07:55', '2026-02-23 23:07:55', 'S1 Sistem Informasi'),
(81, 'BK14', 'Business Process Management', '', '', '', '2026-02-23 23:07:55', '2026-02-23 23:07:55', 'S1 Sistem Informasi'),
(82, 'BK15', 'Enterprise Architecture', '', '', '', '2026-02-23 23:07:55', '2026-02-23 23:07:55', 'S1 Sistem Informasi'),
(83, 'BK16', 'User Interface Design', '', '', '', '2026-02-23 23:07:55', '2026-02-23 23:07:55', 'S1 Sistem Informasi'),
(84, 'BK17', 'Emerging Technologies', '', '', '', '2026-02-23 23:07:55', '2026-02-23 23:07:55', 'S1 Sistem Informasi'),
(85, 'BK18', 'Digital Innovation', '', '', '', '2026-02-23 23:07:55', '2026-02-23 23:07:55', 'S1 Sistem Informasi');

-- --------------------------------------------------------

--
-- Table structure for table `bk_mk`
--

CREATE TABLE `bk_mk` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_mk` varchar(255) NOT NULL,
  `kode_bk` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prodi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bk_mk`
--

INSERT INTO `bk_mk` (`id`, `kode_mk`, `kode_bk`, `created_at`, `updated_at`, `prodi`) VALUES
(215, 'MKDUIK1101', 'BK30', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(216, 'MKDUIK1102', 'BK30', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(217, 'MKDUIK1103', 'BK30', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(218, 'MKFSIK1101', 'BK13', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(219, 'MKFSIK1101', 'BK14', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(220, 'MKFSIK1101', 'BK15', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(221, 'MKFSIK1101', 'BK24', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(222, 'MKFSIK1102', 'BK10', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(223, 'MKFSIK1102', 'BK25', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(224, 'MKFSIK1102', 'BK29', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(225, 'IK1101', 'BK04', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(226, 'IK1101', 'BK22', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(227, 'IK1101', 'BK26', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(228, 'IK1102', 'BK20', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(229, 'IK1102', 'BK21', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(230, 'MKWUIK1204', 'BK30', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(231, 'MKDUIK1204', 'BK30', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(232, 'MKFSIK1203', 'BK12', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(233, 'MKFSIK1203', 'BK24', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(234, 'MKFSIK1204', 'BK06', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(235, 'MKFSIK1204', 'BK26', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(236, 'MKFSIK1204', 'BK29', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(237, 'MKFSIK1205', 'BK11', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(238, 'MKFSIK1205', 'BK07', '2026-01-19 06:35:33', '2026-02-21 17:46:59', 'S1 Informatika'),
(240, 'IK1201', 'BK15', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(241, 'IK1201', 'BK16', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(242, 'IK1202', 'BK20', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(243, 'IK1202', 'BK21', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(244, 'MKFSIK2106', 'BK08', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(245, 'MKFSIK2106', 'BK15', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(246, 'IK2101', 'BK13', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(247, 'IK2101', 'BK24', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(248, 'IK2102', 'BK20', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(249, 'IK2102', 'BK21', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(250, 'IK2103', 'BK06', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(251, 'IK2103', 'BK26', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(252, 'IK2104', 'BK20', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(253, 'IK2104', 'BK21', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(254, 'IK2105', 'BK12', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(255, 'IK2105', 'BK24', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(256, 'IK2106', 'BK21', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(257, 'IK2106', 'BK24', '2026-01-19 06:35:33', '2026-01-19 06:35:33', 'S1 Informatika'),
(316, 'MKWUIK2203', 'BK30', '2026-01-19 06:36:39', '2026-01-19 06:36:39', 'S1 Informatika'),
(317, 'IK2201', 'BK14', '2026-01-19 06:36:39', '2026-01-19 06:36:39', 'S1 Informatika'),
(318, 'IK2201', 'BK19', '2026-01-19 06:36:39', '2026-01-19 06:36:39', 'S1 Informatika'),
(319, 'IK2202', 'BK06', '2026-01-19 06:36:39', '2026-01-19 06:36:39', 'S1 Informatika'),
(320, 'IK2202', 'BK18', '2026-01-19 06:36:39', '2026-01-19 06:36:39', 'S1 Informatika'),
(321, 'IK2203', 'BK01', '2026-01-19 06:36:39', '2026-01-19 06:36:39', 'S1 Informatika'),
(322, 'IK2203', 'BK02', '2026-01-19 06:36:39', '2026-01-19 06:36:39', 'S1 Informatika'),
(323, 'IK2204', 'BK27', '2026-01-19 06:36:39', '2026-01-19 06:36:39', 'S1 Informatika'),
(324, 'IK2205', 'BK18', '2026-01-19 06:36:39', '2026-01-19 06:36:39', 'S1 Informatika'),
(325, 'IK2206', 'BK10', '2026-01-19 06:36:39', '2026-01-19 06:36:39', 'S1 Informatika'),
(326, 'IK2206', 'BK25', '2026-01-19 06:36:39', '2026-01-19 06:36:39', 'S1 Informatika'),
(327, 'IK2206', 'BK26', '2026-01-19 06:36:39', '2026-01-19 06:36:39', 'S1 Informatika'),
(328, 'IK2206', 'BK29', '2026-01-19 06:36:39', '2026-01-19 06:36:39', 'S1 Informatika'),
(329, 'IK2207', 'BK17', '2026-01-19 06:36:39', '2026-01-19 06:36:39', 'S1 Informatika'),
(350, 'MKWUIK3101', 'BK30', '2026-01-19 06:43:18', '2026-01-19 06:43:18', 'S1 Informatika'),
(351, 'MKFSIK3107', 'BK01', '2026-01-19 06:43:18', '2026-01-19 06:43:18', 'S1 Informatika'),
(352, 'MKFSIK3107', 'BK03', '2026-01-19 06:43:18', '2026-01-19 06:43:18', 'S1 Informatika'),
(353, 'MKFSIK3107', 'BK25', '2026-01-19 06:43:18', '2026-01-19 06:43:18', 'S1 Informatika'),
(354, 'MKFSIK3107', 'BK31', '2026-01-19 06:43:18', '2026-01-19 06:43:18', 'S1 Informatika'),
(355, 'IK3101', 'BK19', '2026-01-19 06:43:18', '2026-01-19 06:43:18', 'S1 Informatika'),
(356, 'IK3102', 'BK03', '2026-01-19 06:43:18', '2026-01-19 06:43:18', 'S1 Informatika'),
(357, 'IK3102', 'BK25', '2026-01-19 06:43:18', '2026-01-19 06:43:18', 'S1 Informatika'),
(358, 'IK3103', 'BK25', '2026-01-19 06:43:18', '2026-01-19 06:43:18', 'S1 Informatika'),
(359, 'IK3104', 'BK07', '2026-01-19 06:43:18', '2026-01-19 06:43:18', 'S1 Informatika'),
(360, 'IK3104', 'BK12', '2026-01-19 06:43:18', '2026-01-19 06:43:18', 'S1 Informatika'),
(361, 'IK3104', 'BK16', '2026-01-19 06:43:18', '2026-01-19 06:43:18', 'S1 Informatika'),
(362, 'IK3105', 'BK18', '2026-01-19 06:43:18', '2026-01-19 06:43:18', 'S1 Informatika'),
(363, 'IK3107', 'BK04', '2026-01-19 06:43:18', '2026-01-19 06:43:18', 'S1 Informatika'),
(364, 'IK3107', 'BK22', '2026-01-19 06:43:18', '2026-01-19 06:43:18', 'S1 Informatika'),
(365, 'IK3108', 'BK17', '2026-01-19 06:43:18', '2026-01-19 06:43:18', 'S1 Informatika'),
(366, 'IK3108', 'BK18', '2026-01-19 06:43:18', '2026-01-19 06:43:18', 'S1 Informatika'),
(367, 'IK3109', 'BK06', '2026-01-19 06:43:18', '2026-01-19 06:43:18', 'S1 Informatika'),
(368, 'IK3110', 'BK18', '2026-01-19 06:43:18', '2026-01-19 06:43:18', 'S1 Informatika'),
(369, 'IK3110', 'BK20', '2026-01-19 06:43:18', '2026-01-19 06:43:18', 'S1 Informatika'),
(424, 'IK3201', 'BK19', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(425, 'IK3201', 'BK27', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(426, 'IK3202', 'BK02', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(427, 'IK3202', 'BK05', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(428, 'IK3202', 'BK09', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(429, 'IK3203', 'BK08', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(430, 'IK3203', 'BK15', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(431, 'IK3203', 'BK27', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(432, 'IK3204', 'BK19', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(433, 'IK3205', 'BK06', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(434, 'IK3205', 'BK07', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(435, 'IK3205', 'BK27', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(436, 'IK3208', 'BK25', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(437, 'IK3208', 'BK28', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(438, 'IK3209', 'BK10', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(439, 'IK3209', 'BK27', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(440, 'IK3210', 'BK18', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(441, 'IK3210', 'BK20', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(442, 'IK3211', 'BK18', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(443, 'IK3211', 'BK20', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(444, 'IK3212', 'BK18', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(445, 'IK3212', 'BK20', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(446, 'IK3213', 'BK06', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(447, 'IK3213', 'BK18', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(448, 'MKWUIK4102', 'BK30', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(449, 'IK4190', 'BK30', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(450, 'IK4291', 'BK01', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(451, 'IK4291', 'BK03', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(452, 'IK4291', 'BK07', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(453, 'IK4291', 'BK31', '2026-01-19 06:47:09', '2026-01-19 06:47:09', 'S1 Informatika'),
(520, 'SI1103', 'BK01', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(521, 'SI1201', 'BK01', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(522, 'MKFSSI1204', 'BK02', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(523, 'SI2103', 'BK02', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(524, 'MKFSSI1205', 'BK03', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(525, 'MKFSSI2106', 'BK03', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(526, 'SI1104', 'BK03', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(527, 'SI3102', 'BK04', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(528, 'SI3103', 'BK04', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(529, 'SI2202', 'BK05', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(530, 'SI3201', 'BK05', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(531, 'SI2202', 'BK06', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(532, 'SI2203', 'BK06', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(533, 'SI3202', 'BK06', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(534, 'SI1102', 'BK07', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(535, 'SI2104', 'BK06', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(536, 'SI2101', 'BK07', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(537, 'SI2201', 'BK07', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(538, 'SI2205', 'BK08', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(539, 'SI3204', 'BK08', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(540, 'SI2105', 'BK09', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(541, 'SI3104', 'BK09', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(542, 'MKFSSI3107', 'BK10', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(543, 'SI4291', 'BK10', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(544, 'SI4190', 'BK10', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(545, 'SI2102', 'BK11', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(546, 'SI3207', 'BK07', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(547, 'SI3101', 'BK07', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(548, 'MKFSSI1203', 'BK07', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(549, 'SI1202', 'BK14', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(550, 'MKFSSI2202', 'BK05', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(551, 'SI2204', 'BK01', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(552, 'SI1101', 'BK16', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(553, 'SI2206', 'BK16', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(554, 'SI3208', 'BK16', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(555, 'MKWUSI2203', 'BK18', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(556, 'SI3105', 'BK07', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(557, 'SI3218', 'BK13', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(558, 'SI3203', 'BK13', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(559, 'SI3106', 'BK12', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(560, 'SI3107', 'BK12', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(561, 'SI3205', 'BK12', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(562, 'SI3206', 'BK12', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(563, 'SI3108', 'BK06', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(564, 'SI3108', 'BK09', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(565, 'SI3109', 'BK08', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(566, 'SI3109', 'BK09', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(567, 'SI3219', 'BK14', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(568, 'SI3209', 'BK14', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(569, 'SI3210', 'BK04', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(570, 'SI3211', 'BK14', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(571, 'SI3212', 'BK03', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(572, 'SI3212', 'BK17', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(573, 'SI3213', 'BK12', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(574, 'SI3214', 'BK06', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(575, 'SI3215', 'BK03', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(576, 'SI3215', 'BK14', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(577, 'SI3216', 'BK01', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(578, 'SI3217', 'BK15', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(579, 'SI3217', 'BK18', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(580, 'MKDUSI1204', 'BK13', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(581, 'MKWUSI1201', 'BK13', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(582, 'MKWUSI4102', 'BK13', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(583, 'MKDUSI1101', 'BK13', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(584, 'MKDUSI1103', 'BK13', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi'),
(585, 'MKDUSI1102', 'BK13', '2026-02-23 23:44:57', '2026-02-23 23:44:57', 'S1 Sistem Informasi');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_080f5bf4e2e481b8d125679ee8f3ed7c', 'i:2;', 1771314723),
('laravel_cache_080f5bf4e2e481b8d125679ee8f3ed7c:timer', 'i:1771314723;', 1771314723),
('laravel_cache_356a192b7913b04c54574d18c28d46e6395428ab', 'i:1;', 1771301378),
('laravel_cache_356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1771301378;', 1771301378),
('laravel_cache_7120af001dc88488f1a79e59add4ca0f', 'i:1;', 1772421096),
('laravel_cache_7120af001dc88488f1a79e59add4ca0f:timer', 'i:1772421096;', 1772421096),
('laravel_cache_77de68daecd823babbb58edb1c8e14d7106e83bb', 'i:1;', 1772418286),
('laravel_cache_77de68daecd823babbb58edb1c8e14d7106e83bb:timer', 'i:1772418286;', 1772418286),
('laravel_cache_agus@univ.ac.id|127.0.0.1', 'i:2;', 1771314723),
('laravel_cache_agus@univ.ac.id|127.0.0.1:timer', 'i:1771314723;', 1771314723),
('simpobe_cache_7120af001dc88488f1a79e59add4ca0f', 'i:1;', 1772423376),
('simpobe_cache_7120af001dc88488f1a79e59add4ca0f:timer', 'i:1772423376;', 1772423376);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cpl_bk`
--

CREATE TABLE `cpl_bk` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_bk` varchar(255) NOT NULL,
  `kode_cpl` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prodi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cpl_bk`
--

INSERT INTO `cpl_bk` (`id`, `kode_bk`, `kode_cpl`, `created_at`, `updated_at`, `prodi`) VALUES
(1, 'BK01', 'CPL01', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(2, 'BK01', 'CPL02', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(3, 'BK01', 'CPL06', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(4, 'BK01', 'CPL07', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(5, 'BK01', 'CPL13', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(6, 'BK02', 'CPL02', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(7, 'BK02', 'CPL12', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(8, 'BK03', 'CPL02', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(9, 'BK03', 'CPL04', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(10, 'BK03', 'CPL06', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(11, 'BK03', 'CPL07', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(12, 'BK03', 'CPL13', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(13, 'BK04', 'CPL09', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(14, 'BK04', 'CPL10', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(15, 'BK05', 'CPL02', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(16, 'BK05', 'CPL12', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(17, 'BK06', 'CPL03', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(18, 'BK06', 'CPL12', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(19, 'BK07', 'CPL03', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(20, 'BK07', 'CPL05', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(21, 'BK07', 'CPL08', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(22, 'BK07', 'CPL10', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(23, 'BK07', 'CPL11', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(24, 'BK08', 'CPL03', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(25, 'BK08', 'CPL05', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(26, 'BK08', 'CPL10', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(27, 'BK08', 'CPL12', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(28, 'BK09', 'CPL02', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(29, 'BK09', 'CPL05', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(30, 'BK09', 'CPL12', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(31, 'BK10', 'CPL04', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(32, 'BK10', 'CPL05', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(33, 'BK10', 'CPL09', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(34, 'BK10', 'CPL10', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(35, 'BK11', 'CPL03', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(36, 'BK11', 'CPL05', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(37, 'BK12', 'CPL03', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(38, 'BK12', 'CPL05', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(39, 'BK12', 'CPL08', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(40, 'BK12', 'CPL11', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(41, 'BK13', 'CPL05', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(42, 'BK14', 'CPL05', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(43, 'BK14', 'CPL08', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(44, 'BK15', 'CPL03', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(45, 'BK16', 'CPL03', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(46, 'BK16', 'CPL05', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(47, 'BK17', 'CPL05', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(48, 'BK17', 'CPL09', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(49, 'BK18', 'CPL05', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(50, 'BK18', 'CPL08', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(51, 'BK18', 'CPL11', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(52, 'BK18', 'CPL12', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(53, 'BK19', 'CPL05', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(54, 'BK19', 'CPL09', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(55, 'BK19', 'CPL10', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(56, 'BK30', 'CPL01', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(57, 'BK30', 'CPL02', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(58, 'BK30', 'CPL06', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(59, 'BK30', 'CPL13', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(60, 'BK31', 'CPL07', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(61, 'BK20', 'CPL03', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(62, 'BK20', 'CPL05', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(63, 'BK20', 'CPL08', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(64, 'BK20', 'CPL09', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(65, 'BK20', 'CPL11', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(66, 'BK20', 'CPL12', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(67, 'BK21', 'CPL03', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(68, 'BK21', 'CPL05', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(69, 'BK21', 'CPL08', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(70, 'BK21', 'CPL11', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(71, 'BK22', 'CPL09', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(72, 'BK22', 'CPL10', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(73, 'BK23', 'CPL02', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(74, 'BK23', 'CPL05', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(75, 'BK23', 'CPL10', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(76, 'BK23', 'CPL12', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(77, 'BK24', 'CPL03', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(78, 'BK24', 'CPL05', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(79, 'BK24', 'CPL08', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(80, 'BK24', 'CPL09', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(81, 'BK24', 'CPL10', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(82, 'BK24', 'CPL11', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(83, 'BK25', 'CPL02', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(84, 'BK25', 'CPL04', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(85, 'BK25', 'CPL06', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(86, 'BK25', 'CPL10', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(87, 'BK26', 'CPL04', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(88, 'BK26', 'CPL05', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(89, 'BK26', 'CPL09', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(90, 'BK26', 'CPL10', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(91, 'BK26', 'CPL12', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(92, 'BK27', 'CPL03', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(93, 'BK27', 'CPL05', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(94, 'BK27', 'CPL10', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(95, 'BK27', 'CPL11', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(96, 'BK27', 'CPL12', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(97, 'BK28', 'CPL02', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(98, 'BK28', 'CPL04', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(99, 'BK28', 'CPL05', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(100, 'BK28', 'CPL10', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(101, 'BK29', 'CPL04', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(102, 'BK29', 'CPL05', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(103, 'BK29', 'CPL10', '2026-01-19 04:56:17', '2026-01-19 04:56:17', 'S1 Informatika'),
(164, 'BK01', 'CPL01', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(165, 'BK15', 'CPL01', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(166, 'BK02', 'CPL02', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(167, 'BK11', 'CPL02', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(168, 'BK05', 'CPL03', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(169, 'BK07', 'CPL03', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(170, 'BK03', 'CPL04', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(171, 'BK08', 'CPL04', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(172, 'BK09', 'CPL05', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(173, 'BK05', 'CPL06', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(174, 'BK06', 'CPL06', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(175, 'BK04', 'CPL07', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(176, 'BK10', 'CPL07', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(177, 'BK02', 'CPL08', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(178, 'BK12', 'CPL08', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(179, 'BK06', 'CPL09', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(180, 'BK17', 'CPL09', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(181, 'BK14', 'CPL10', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(182, 'BK17', 'CPL10', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(183, 'BK18', 'CPL10', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(184, 'BK07', 'CPL11', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(185, 'BK16', 'CPL11', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(186, 'BK13', 'CPL12', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(187, 'BK18', 'CPL12', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(188, 'BK09', 'CPL13', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi'),
(189, 'BK13', 'CPL13', '2026-02-23 23:19:26', '2026-02-23 23:19:26', 'S1 Sistem Informasi');

-- --------------------------------------------------------

--
-- Table structure for table `cpl_bk_mk`
--

CREATE TABLE `cpl_bk_mk` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_bk` varchar(255) DEFAULT NULL,
  `kode_cpl` varchar(255) DEFAULT NULL,
  `kode_mk` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prodi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cpl_bk_mk`
--

INSERT INTO `cpl_bk_mk` (`id`, `kode_bk`, `kode_cpl`, `kode_mk`, `created_at`, `updated_at`, `prodi`) VALUES
(4943, 'BK30', 'CPL01', 'MKDUIK1101', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4944, 'BK30', 'CPL01', 'MKDUIK1102', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4945, 'BK30', 'CPL01', 'MKDUIK1103', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4946, 'BK13', 'CPL04', 'MKFSIK1101', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4947, 'BK14', 'CPL04', 'MKFSIK1101', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4948, 'BK15', 'CPL04', 'MKFSIK1101', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4949, 'BK24', 'CPL04', 'MKFSIK1101', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4950, 'BK10', 'CPL04', 'MKFSIK1102', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4951, 'BK25', 'CPL04', 'MKFSIK1102', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4952, 'BK29', 'CPL04', 'MKFSIK1102', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4953, 'BK10', 'CPL08', 'MKFSIK1102', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4954, 'BK25', 'CPL08', 'MKFSIK1102', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4955, 'BK29', 'CPL08', 'MKFSIK1102', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4956, 'BK10', 'CPL09', 'MKFSIK1102', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4957, 'BK25', 'CPL09', 'MKFSIK1102', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4958, 'BK29', 'CPL09', 'MKFSIK1102', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4959, 'BK04', 'CPL05', 'IK1101', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4960, 'BK22', 'CPL05', 'IK1101', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4961, 'BK26', 'CPL05', 'IK1101', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4962, 'BK04', 'CPL09', 'IK1101', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4963, 'BK22', 'CPL09', 'IK1101', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4964, 'BK26', 'CPL09', 'IK1101', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4965, 'BK04', 'CPL05', 'IK1101', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4966, 'BK22', 'CPL05', 'IK1101', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4967, 'BK26', 'CPL05', 'IK1101', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4968, 'BK30', 'CPL01', 'MKWUIK1204', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4969, 'BK30', 'CPL02', 'MKWUIK1204', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4970, 'BK14', 'CPL10', 'IK2201', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4971, 'BK19', 'CPL10', 'IK2201', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4972, 'BK14', 'CPL04', 'IK2201', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4973, 'BK19', 'CPL04', 'IK2201', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4974, 'BK14', 'CPL09', 'IK2201', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4975, 'BK19', 'CPL09', 'IK2201', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4976, 'BK14', 'CPL08', 'IK2201', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4977, 'BK19', 'CPL08', 'IK2201', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4978, 'BK06', 'CPL11', 'IK2103', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4979, 'BK26', 'CPL11', 'IK2103', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4980, 'BK06', 'CPL03', 'IK2103', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4981, 'BK26', 'CPL03', 'IK2103', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4982, 'BK06', 'CPL04', 'IK2103', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4983, 'BK26', 'CPL04', 'IK2103', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4984, 'BK06', 'CPL05', 'IK2103', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4985, 'BK26', 'CPL05', 'IK2103', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4986, 'BK06', 'CPL12', 'IK2103', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4987, 'BK26', 'CPL12', 'IK2103', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4988, 'BK12', 'CPL03', 'MKFSIK1203', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4989, 'BK24', 'CPL03', 'MKFSIK1203', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4990, 'BK12', 'CPL08', 'MKFSIK1203', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4991, 'BK24', 'CPL08', 'MKFSIK1203', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4992, 'BK06', 'CPL04', 'MKFSIK1204', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4993, 'BK26', 'CPL04', 'MKFSIK1204', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4994, 'BK29', 'CPL04', 'MKFSIK1204', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4995, 'BK11', 'CPL05', 'MKFSIK1205', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4996, 'BK07', 'CPL05', 'MKFSIK1205', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4997, 'BK11', 'CPL03', 'MKFSIK1205', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4998, 'BK07', 'CPL03', 'MKFSIK1205', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(4999, 'BK15', 'CPL05', 'IK1201', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5000, 'BK16', 'CPL05', 'IK1201', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5001, 'BK15', 'CPL03', 'IK1201', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5002, 'BK16', 'CPL03', 'IK1201', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5003, 'BK20', 'CPL03', 'IK2102', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5004, 'BK21', 'CPL03', 'IK2102', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5005, 'BK20', 'CPL05', 'IK2102', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5006, 'BK21', 'CPL05', 'IK2102', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5007, 'BK12', 'CPL04', 'IK2105', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5008, 'BK24', 'CPL04', 'IK2105', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5009, 'BK01', 'CPL07', 'MKFSIK3107', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5010, 'BK03', 'CPL07', 'MKFSIK3107', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5011, 'BK25', 'CPL07', 'MKFSIK3107', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5012, 'BK31', 'CPL07', 'MKFSIK3107', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5013, 'BK01', 'CPL07', 'IK4291', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5014, 'BK03', 'CPL07', 'IK4291', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5015, 'BK07', 'CPL07', 'IK4291', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5016, 'BK31', 'CPL07', 'IK4291', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5017, 'BK01', 'CPL01', 'IK2203', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5018, 'BK02', 'CPL01', 'IK2203', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5019, 'BK01', 'CPL13', 'IK2203', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5020, 'BK02', 'CPL13', 'IK2203', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5021, 'BK01', 'CPL02', 'IK2203', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5022, 'BK02', 'CPL02', 'IK2203', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5023, 'BK01', 'CPL06', 'IK2203', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5024, 'BK02', 'CPL06', 'IK2203', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5025, 'BK18', 'CPL03', 'IK2205', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5026, 'BK18', 'CPL11', 'IK2205', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5027, 'BK18', 'CPL08', 'IK2205', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5028, 'BK10', 'CPL04', 'IK2206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5029, 'BK25', 'CPL04', 'IK2206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5030, 'BK26', 'CPL04', 'IK2206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5031, 'BK29', 'CPL04', 'IK2206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5032, 'BK10', 'CPL05', 'IK2206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5033, 'BK25', 'CPL05', 'IK2206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5034, 'BK26', 'CPL05', 'IK2206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5035, 'BK29', 'CPL05', 'IK2206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5036, 'BK10', 'CPL08', 'IK2206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5037, 'BK25', 'CPL08', 'IK2206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5038, 'BK26', 'CPL08', 'IK2206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5039, 'BK29', 'CPL08', 'IK2206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5040, 'BK10', 'CPL09', 'IK2206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5041, 'BK25', 'CPL09', 'IK2206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5042, 'BK26', 'CPL09', 'IK2206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5043, 'BK29', 'CPL09', 'IK2206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5044, 'BK10', 'CPL10', 'IK2206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5045, 'BK25', 'CPL10', 'IK2206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5046, 'BK26', 'CPL10', 'IK2206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5047, 'BK29', 'CPL10', 'IK2206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5048, 'BK17', 'CPL04', 'IK2207', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5049, 'BK17', 'CPL08', 'IK2207', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5050, 'BK17', 'CPL11', 'IK2207', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5051, 'BK19', 'CPL04', 'IK3101', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5052, 'BK19', 'CPL05', 'IK3101', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5053, 'BK19', 'CPL10', 'IK3101', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5054, 'BK25', 'CPL08', 'IK3103', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5055, 'BK25', 'CPL06', 'IK3103', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5056, 'BK07', 'CPL04', 'IK3104', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5057, 'BK12', 'CPL04', 'IK3104', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5058, 'BK16', 'CPL04', 'IK3104', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5059, 'BK18', 'CPL03', 'IK3105', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5060, 'BK18', 'CPL08', 'IK3105', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5061, 'BK18', 'CPL11', 'IK3105', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5062, NULL, 'CPL03', 'IK3106', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5063, NULL, 'CPL13', 'IK3106', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5064, 'BK18', 'CPL04', 'IK3110', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5065, 'BK20', 'CPL04', 'IK3110', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5066, 'BK18', 'CPL08', 'IK3110', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5067, 'BK20', 'CPL08', 'IK3110', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5068, 'BK18', 'CPL11', 'IK3110', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5069, 'BK20', 'CPL11', 'IK3110', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5070, 'BK19', 'CPL05', 'IK3201', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5071, 'BK27', 'CPL05', 'IK3201', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5072, 'BK19', 'CPL10', 'IK3201', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5073, 'BK27', 'CPL10', 'IK3201', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5074, 'BK30', 'CPL13', 'MKWUIK2203', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5075, 'BK30', 'CPL02', 'MKWUIK2203', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5076, 'BK30', 'CPL06', 'MKWUIK2203', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5077, 'BK19', 'CPL04', 'IK3204', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5078, 'BK19', 'CPL05', 'IK3204', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5079, 'BK19', 'CPL10', 'IK3204', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5080, 'BK06', 'CPL04', 'IK3205', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5081, 'BK07', 'CPL04', 'IK3205', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5082, 'BK27', 'CPL04', 'IK3205', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5083, 'BK06', 'CPL08', 'IK3205', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5084, 'BK07', 'CPL08', 'IK3205', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5085, 'BK27', 'CPL08', 'IK3205', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5086, 'BK06', 'CPL11', 'IK3205', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5087, 'BK07', 'CPL11', 'IK3205', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5088, 'BK27', 'CPL11', 'IK3205', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5089, 'BK25', 'CPL08', 'IK3208', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5090, 'BK28', 'CPL08', 'IK3208', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5091, 'BK25', 'CPL09', 'IK3208', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5092, 'BK28', 'CPL09', 'IK3208', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5093, 'BK25', 'CPL12', 'IK3208', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5094, 'BK28', 'CPL12', 'IK3208', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5095, 'BK10', 'CPL04', 'IK3209', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5096, 'BK27', 'CPL04', 'IK3209', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5097, 'BK10', 'CPL10', 'IK3209', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5098, 'BK27', 'CPL10', 'IK3209', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5099, 'BK10', 'CPL11', 'IK3209', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5100, 'BK27', 'CPL11', 'IK3209', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5101, 'BK10', 'CPL12', 'IK3209', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5102, 'BK27', 'CPL12', 'IK3209', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5103, 'BK18', 'CPL03', 'IK3210', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5104, 'BK20', 'CPL03', 'IK3210', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5105, 'BK18', 'CPL04', 'IK3210', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5106, 'BK20', 'CPL04', 'IK3210', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5107, 'BK18', 'CPL08', 'IK3210', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5108, 'BK20', 'CPL08', 'IK3210', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5109, 'BK18', 'CPL11', 'IK3210', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5110, 'BK20', 'CPL11', 'IK3210', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5111, 'BK18', 'CPL03', 'IK3211', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5112, 'BK20', 'CPL03', 'IK3211', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5113, 'BK18', 'CPL04', 'IK3211', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5114, 'BK20', 'CPL04', 'IK3211', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5115, 'BK18', 'CPL08', 'IK3211', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5116, 'BK20', 'CPL08', 'IK3211', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5117, 'BK18', 'CPL11', 'IK3211', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5118, 'BK20', 'CPL11', 'IK3211', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5119, 'BK18', 'CPL04', 'IK3212', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5120, 'BK20', 'CPL04', 'IK3212', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5121, 'BK18', 'CPL08', 'IK3212', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5122, 'BK20', 'CPL08', 'IK3212', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5123, 'BK18', 'CPL11', 'IK3212', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5124, 'BK20', 'CPL11', 'IK3212', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5125, 'BK30', 'CPL01', 'MKWUIK4102', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5126, 'BK30', 'CPL06', 'MKWUIK4102', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5127, 'BK08', 'CPL09', 'MKFSIK2106', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5128, 'BK15', 'CPL09', 'MKFSIK2106', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5129, 'BK27', 'CPL04', 'IK2204', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5130, 'BK06', 'CPL05', 'IK3213', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5131, 'BK18', 'CPL05', 'IK3213', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5132, 'BK06', 'CPL12', 'IK3213', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5133, 'BK18', 'CPL12', 'IK3213', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5134, 'BK20', 'CPL05', 'IK1102', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5135, 'BK21', 'CPL05', 'IK1102', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5136, 'BK20', 'CPL05', 'IK1202', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5137, 'BK21', 'CPL05', 'IK1202', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5138, 'BK20', 'CPL05', 'IK2104', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5139, 'BK21', 'CPL05', 'IK2104', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5140, 'BK21', 'CPL05', 'IK2106', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5141, 'BK24', 'CPL05', 'IK2106', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5142, 'BK30', 'CPL06', 'MKDUIK1204', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5143, 'BK30', 'CPL06', 'MKWUIK3101', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5144, 'BK03', 'CPL06', 'IK3102', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5145, 'BK25', 'CPL06', 'IK3102', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5146, 'BK30', 'CPL06', 'IK4190', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5147, 'BK06', 'CPL08', 'IK2202', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5148, 'BK18', 'CPL08', 'IK2202', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5149, 'BK06', 'CPL12', 'IK2202', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5150, 'BK18', 'CPL12', 'IK2202', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5151, 'BK04', 'CPL08', 'IK3107', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5152, 'BK22', 'CPL08', 'IK3107', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5153, 'BK04', 'CPL09', 'IK3107', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5154, 'BK22', 'CPL09', 'IK3107', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5155, 'BK06', 'CPL08', 'IK3109', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5156, 'BK06', 'CPL12', 'IK3109', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5157, 'BK08', 'CPL08', 'IK3203', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5158, 'BK15', 'CPL08', 'IK3203', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5159, 'BK27', 'CPL08', 'IK3203', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5160, NULL, 'CPL08', 'IK3206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5161, NULL, 'CPL10', 'IK3206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5162, NULL, 'CPL12', 'IK3206', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5163, NULL, 'CPL09', 'IK3207', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5164, NULL, 'CPL12', 'IK3207', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5165, 'BK17', 'CPL11', 'IK3108', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5166, 'BK18', 'CPL11', 'IK3108', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5167, 'BK02', 'CPL12', 'IK3202', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5168, 'BK05', 'CPL12', 'IK3202', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5169, 'BK09', 'CPL12', 'IK3202', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5170, 'BK13', NULL, 'IK2101', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika'),
(5171, 'BK24', NULL, 'IK2101', '2026-03-01 18:42:28', '2026-03-01 18:42:28', 'S1 Informatika');

-- --------------------------------------------------------

--
-- Table structure for table `cpl_cpmk`
--

CREATE TABLE `cpl_cpmk` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_cpl` varchar(255) NOT NULL,
  `kode_cpmk` varchar(255) NOT NULL,
  `kode_mk` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prodi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cpl_cpmk`
--

INSERT INTO `cpl_cpmk` (`id`, `kode_cpl`, `kode_cpmk`, `kode_mk`, `created_at`, `updated_at`, `prodi`) VALUES
(1, 'CPL01', 'CPMK011', 'MKDUIK1101', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(2, 'CPL01', 'CPMK012', 'MKDUIK1102', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(3, 'CPL01', 'CPMK012', 'MKDUIK1103', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(4, 'CPL01', 'CPMK013', 'MKDUIK1102', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(5, 'CPL01', 'CPMK013', 'MKDUIK1103', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(6, 'CPL01', 'CPMK013', 'MKWUIK1204', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(7, 'CPL02', 'CPMK021', 'IK2203', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(8, 'CPL02', 'CPMK022', 'IK3103', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(9, 'CPL02', 'CPMK023', 'IK2203', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(10, 'CPL02', 'CPMK023', 'MKWUIK2203', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(11, 'CPL02', 'CPMK024', 'MKWUIK2203', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(12, 'CPL02', 'CPMK024', 'IK3103', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(13, 'CPL02', 'CPMK024', 'IK2203', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(14, 'CPL03', 'CPMK031', 'MKFSIK1205', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(15, 'CPL03', 'CPMK031', 'IK1201', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(16, 'CPL03', 'CPMK031', 'MKFSIK2106', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(17, 'CPL03', 'CPMK032', 'IK2205', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(18, 'CPL03', 'CPMK032', 'IK3105', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(19, 'CPL03', 'CPMK032', 'IK3203', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(20, 'CPL03', 'CPMK032', 'IK3212', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(21, 'CPL03', 'CPMK032', 'IK3213', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(22, 'CPL04', 'CPMK041', 'IK1102', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(23, 'CPL04', 'CPMK041', 'IK1202', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(24, 'CPL04', 'CPMK041', 'IK2102', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(25, 'CPL04', 'CPMK041', 'IK2104', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(26, 'CPL04', 'CPMK041', 'IK2106', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(27, 'CPL04', 'CPMK042', 'MKFSIK1101', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(28, 'CPL04', 'CPMK042', 'IK2105', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(29, 'CPL04', 'CPMK042', 'IK3101', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(30, 'CPL04', 'CPMK042', 'IK3204', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(31, 'CPL04', 'CPMK043', 'IK2204', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(32, 'CPL04', 'CPMK043', 'IK3205', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(33, 'CPL04', 'CPMK043', 'MKFSIK1204', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(34, 'CPL04', 'CPMK044', 'IK2207', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(35, 'CPL04', 'CPMK044', 'IK3104', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(36, 'CPL04', 'CPMK044', 'IK3212', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(37, 'CPL04', 'CPMK044', 'IK3213', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(38, 'CPL04', 'CPMK044', 'IK3202', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(39, 'CPL05', 'CPMK051', 'MKFSIK1102', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(40, 'CPL05', 'CPMK051', 'MKFSIK1204', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(41, 'CPL05', 'CPMK051', 'IK2103', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(42, 'CPL05', 'CPMK051', 'IK2206', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(43, 'CPL05', 'CPMK051', 'IK3101', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(44, 'CPL05', 'CPMK051', 'IK3102', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(45, 'CPL05', 'CPMK051', 'IK3201', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(46, 'CPL05', 'CPMK052', 'MKFSIK1205', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(47, 'CPL05', 'CPMK052', 'IK1201', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(48, 'CPL05', 'CPMK052', 'IK1202', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(49, 'CPL05', 'CPMK052', 'IK2102', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(50, 'CPL05', 'CPMK052', 'IK2104', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(51, 'CPL05', 'CPMK052', 'MKWUIK4102', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(52, 'CPL05', 'CPMK052', 'IK4190', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(53, 'CPL06', 'CPMK061', 'IK3102', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(54, 'CPL06', 'CPMK061', 'MKWUIK4102', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(55, 'CPL06', 'CPMK061', 'IK4190', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(56, 'CPL06', 'CPMK062', 'IK3102', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(57, 'CPL06', 'CPMK062', 'IK4190', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(58, 'CPL06', 'CPMK063', 'MKDUIK1204', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(59, 'CPL06', 'CPMK063', 'MKWUIK3101', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(60, 'CPL06', 'CPMK063', 'IK3102', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(61, 'CPL06', 'CPMK063', 'IK3103', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(62, 'CPL06', 'CPMK063', 'IK4291', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(63, 'CPL07', 'CPMK071', 'IK4291', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(64, 'CPL07', 'CPMK072', 'MKFSIK3107', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(65, 'CPL07', 'CPMK072', 'IK4291', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(66, 'CPL08', 'CPMK081', 'IK2206', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(67, 'CPL08', 'CPMK081', 'IK2101', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(68, 'CPL08', 'CPMK081', 'IK2105', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(69, 'CPL08', 'CPMK081', 'IK3103', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(70, 'CPL08', 'CPMK081', 'IK3213', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(71, 'CPL08', 'CPMK082', 'IK2205', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(72, 'CPL08', 'CPMK082', 'IK3205', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(73, 'CPL08', 'CPMK082', 'IK3109', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(74, 'CPL08', 'CPMK083', 'IK3203', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(75, 'CPL08', 'CPMK083', 'IK3213', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(76, 'CPL08', 'CPMK083', 'IK3212', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(77, 'CPL08', 'CPMK084', 'IK2201', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(78, 'CPL08', 'CPMK084', 'MKFSIK1203', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(79, 'CPL08', 'CPMK084', 'IK2101', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(80, 'CPL08', 'CPMK084', 'IK3206', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(81, 'CPL08', 'CPMK084', 'IK3213', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(82, 'CPL08', 'CPMK084', 'IK2202', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(83, 'CPL09', 'CPMK091', 'IK1101', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(84, 'CPL09', 'CPMK091', 'IK2206', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(85, 'CPL09', 'CPMK091', 'IK3107', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(86, 'CPL09', 'CPMK091', 'IK3207', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(87, 'CPL09', 'CPMK091', 'MKFSIK1102', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(88, 'CPL09', 'CPMK092', 'IK2201', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(89, 'CPL09', 'CPMK092', 'IK3107', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(90, 'CPL09', 'CPMK092', 'IK2206', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(91, 'CPL09', 'CPMK092', 'IK1101', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(92, 'CPL09', 'CPMK093', 'IK3107', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(93, 'CPL09', 'CPMK093', 'IK3208', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(94, 'CPL09', 'CPMK093', 'IK2206', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(95, 'CPL09', 'CPMK093', 'IK1101', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(96, 'CPL10', 'CPMK101', 'IK2206', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(97, 'CPL10', 'CPMK101', 'IK3206', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(98, 'CPL10', 'CPMK102', 'IK2201', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(99, 'CPL10', 'CPMK102', 'IK3101', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(100, 'CPL10', 'CPMK102', 'IK3201', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(101, 'CPL10', 'CPMK102', 'IK3204', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(102, 'CPL10', 'CPMK103', 'IK3209', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(103, 'CPL10', 'CPMK103', 'IK3204', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(104, 'CPL11', 'CPMK111', 'IK2205', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(105, 'CPL11', 'CPMK111', 'IK3205', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(106, 'CPL11', 'CPMK111', 'IK3212', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(107, 'CPL11', 'CPMK112', 'IK2207', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(108, 'CPL11', 'CPMK112', 'IK3105', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(109, 'CPL11', 'CPMK112', 'IK3213', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(110, 'CPL11', 'CPMK112', 'IK3108', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(111, 'CPL11', 'CPMK113', 'IK3107', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(112, 'CPL11', 'CPMK113', 'IK3209', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(113, 'CPL11', 'CPMK113', 'IK3213', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(114, 'CPL11', 'CPMK113', 'IK3108', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(115, 'CPL12', 'CPMK121', 'IK2103', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(116, 'CPL12', 'CPMK121', 'IK2202', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(117, 'CPL12', 'CPMK121', 'IK3109', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(118, 'CPL12', 'CPMK121', 'IK3206', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(119, 'CPL12', 'CPMK121', 'IK3207', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(120, 'CPL12', 'CPMK122', 'IK3202', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(121, 'CPL12', 'CPMK122', 'IK3208', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(122, 'CPL12', 'CPMK122', 'IK3209', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(123, 'CPL12', 'CPMK123', 'IK3202', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(124, 'CPL12', 'CPMK123', 'IK3209', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(125, 'CPL13', 'CPMK131', 'MKWUIK1204', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(126, 'CPL13', 'CPMK132', 'MKWUIK1204', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(127, 'CPL13', 'CPMK134', 'MKWUIK2203', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(128, 'CPL13', 'CPMK135', 'MKWUIK2203', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(129, 'CPL13', 'CPMK137', 'IK3106', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika'),
(130, 'CPL13', 'CPMK138', 'IK3106', '2026-01-19 07:37:54', '2026-01-19 07:37:54', 'S1 Informatika');

-- --------------------------------------------------------

--
-- Table structure for table `cpl_mk`
--

CREATE TABLE `cpl_mk` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_cpl` varchar(255) NOT NULL,
  `kode_mk` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prodi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cpl_mk`
--

INSERT INTO `cpl_mk` (`id`, `kode_cpl`, `kode_mk`, `created_at`, `updated_at`, `prodi`) VALUES
(128, 'CPL01', 'MKDUIK1101', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(129, 'CPL01', 'MKDUIK1102', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(130, 'CPL01', 'MKDUIK1103', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(131, 'CPL04', 'MKFSIK1101', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(133, 'CPL04', 'MKFSIK1102', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(135, 'CPL05', 'IK1101', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(139, 'CPL01', 'MKWUIK1204', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(140, 'CPL02', 'MKWUIK1204', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(142, 'CPL10', 'IK2201', '2026-01-20 02:03:54', '2026-02-15 23:21:39', 'S1 Informatika'),
(143, 'CPL11', 'IK2103', '2026-01-20 02:03:54', '2026-02-15 23:31:12', 'S1 Informatika'),
(144, 'CPL03', 'MKFSIK1203', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(147, 'CPL04', 'MKFSIK1204', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(149, 'CPL05', 'MKFSIK1205', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(151, 'CPL05', 'IK1201', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(158, 'CPL03', 'IK2102', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(159, 'CPL03', 'IK2103', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(160, 'CPL04', 'IK2103', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(161, 'CPL05', 'IK2103', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(165, 'CPL04', 'IK2105', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(168, 'CPL07', 'MKFSIK3107', '2026-01-20 02:03:54', '2026-02-15 21:11:15', 'S1 Informatika'),
(169, 'CPL08', 'MKFSIK1102', '2026-01-20 02:03:54', '2026-02-15 23:10:45', 'S1 Informatika'),
(170, 'CPL09', 'MKFSIK1102', '2026-01-20 02:03:54', '2026-02-15 23:17:10', 'S1 Informatika'),
(171, 'CPL04', 'IK2201', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(174, 'CPL07', 'IK4291', '2026-01-20 02:03:54', '2026-02-15 21:11:25', 'S1 Informatika'),
(177, 'CPL01', 'IK2203', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(178, 'CPL12', 'IK2103', '2026-01-20 02:03:54', '2026-02-15 23:34:08', 'S1 Informatika'),
(179, 'CPL13', 'IK2203', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(181, 'CPL03', 'IK2205', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(185, 'CPL04', 'IK2206', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(186, 'CPL05', 'IK2206', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(190, 'CPL04', 'IK2207', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(192, 'CPL11', 'IK2205', '2026-01-20 02:03:54', '2026-02-15 23:31:30', 'S1 Informatika'),
(193, 'CPL09', 'IK1101', '2026-01-20 02:03:54', '2026-02-15 23:17:24', 'S1 Informatika'),
(194, 'CPL04', 'IK3101', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(195, 'CPL05', 'IK3101', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(197, 'CPL08', 'MKFSIK1203', '2026-01-20 02:03:54', '2026-02-15 23:11:07', 'S1 Informatika'),
(199, 'CPL08', 'IK3103', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(200, 'CPL04', 'IK3104', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(201, 'CPL03', 'IK3105', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(205, 'CPL03', 'IK3106', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(212, 'CPL04', 'IK3110', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(215, 'CPL05', 'IK3201', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(216, 'CPL13', 'MKWUIK2203', '2026-01-20 02:03:54', '2026-02-15 23:36:27', 'S1 Informatika'),
(219, 'CPL04', 'IK3204', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(220, 'CPL05', 'IK3204', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(223, 'CPL04', 'IK3205', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(231, 'CPL08', 'IK3208', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(232, 'CPL04', 'IK3209', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(235, 'CPL03', 'IK3210', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(236, 'CPL04', 'IK3210', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(239, 'CPL03', 'IK3211', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(240, 'CPL04', 'IK3211', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(244, 'CPL04', 'IK3212', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(248, 'CPL01', 'MKWUIK4102', '2026-01-20 02:03:54', '2026-01-20 02:03:54', 'S1 Informatika'),
(251, 'CPL09', 'IK2201', '2026-01-20 02:03:54', '2026-02-15 23:17:39', 'S1 Informatika'),
(252, 'CPL09', 'MKFSIK2106', '2026-01-20 02:03:54', '2026-02-15 23:17:59', 'S1 Informatika'),
(253, 'CPL02', 'MKWUIK2203', '2026-02-15 20:00:17', '2026-02-15 20:00:17', 'S1 Informatika'),
(254, 'CPL02', 'IK2203', '2026-02-15 20:04:36', '2026-02-15 20:04:36', 'S1 Informatika'),
(255, 'CPL03', 'MKFSIK1205', '2026-02-15 20:15:21', '2026-02-15 20:15:21', 'S1 Informatika'),
(256, 'CPL03', 'IK1201', '2026-02-15 20:15:36', '2026-02-15 20:15:36', 'S1 Informatika'),
(257, 'CPL04', 'IK2204', '2026-02-15 20:34:27', '2026-02-15 20:34:27', 'S1 Informatika'),
(258, 'CPL05', 'IK1101', '2026-02-15 20:59:50', '2026-02-15 20:59:50', 'S1 Informatika'),
(259, 'CPL05', 'IK2102', '2026-02-15 21:00:06', '2026-02-15 21:00:06', 'S1 Informatika'),
(260, 'CPL05', 'IK3213', '2026-02-15 21:00:19', '2026-02-15 21:00:19', 'S1 Informatika'),
(261, 'CPL05', 'IK1102', '2026-02-15 21:01:58', '2026-02-15 21:01:58', 'S1 Informatika'),
(262, 'CPL05', 'IK1202', '2026-02-15 21:02:16', '2026-02-15 21:02:16', 'S1 Informatika'),
(263, 'CPL05', 'IK2104', '2026-02-15 21:02:30', '2026-02-15 21:02:30', 'S1 Informatika'),
(264, 'CPL05', 'IK2106', '2026-02-15 21:02:44', '2026-02-15 21:02:44', 'S1 Informatika'),
(265, 'CPL06', 'MKDUIK1204', '2026-02-15 21:09:04', '2026-02-15 21:09:04', 'S1 Informatika'),
(266, 'CPL06', 'MKWUIK2203', '2026-02-15 21:09:21', '2026-02-15 21:09:21', 'S1 Informatika'),
(267, 'CPL06', 'IK2203', '2026-02-15 21:09:33', '2026-02-15 21:09:33', 'S1 Informatika'),
(268, 'CPL06', 'MKWUIK3101', '2026-02-15 21:09:45', '2026-02-15 21:09:45', 'S1 Informatika'),
(269, 'CPL06', 'IK3102', '2026-02-15 21:09:57', '2026-02-15 21:09:57', 'S1 Informatika'),
(270, 'CPL06', 'IK3103', '2026-02-15 21:10:11', '2026-02-15 21:10:11', 'S1 Informatika'),
(271, 'CPL06', 'MKWUIK4102', '2026-02-15 21:10:22', '2026-02-15 21:10:22', 'S1 Informatika'),
(272, 'CPL06', 'IK4190', '2026-02-15 21:10:31', '2026-02-15 21:10:31', 'S1 Informatika'),
(273, 'CPL08', 'IK2201', '2026-02-15 23:12:08', '2026-02-15 23:12:08', 'S1 Informatika'),
(274, 'CPL08', 'IK2202', '2026-02-15 23:12:22', '2026-02-15 23:12:22', 'S1 Informatika'),
(275, 'CPL08', 'IK2205', '2026-02-15 23:12:37', '2026-02-15 23:12:37', 'S1 Informatika'),
(276, 'CPL08', 'IK2206', '2026-02-15 23:12:50', '2026-02-15 23:12:50', 'S1 Informatika'),
(277, 'CPL08', 'IK2207', '2026-02-15 23:13:03', '2026-02-15 23:13:03', 'S1 Informatika'),
(278, 'CPL08', 'IK3105', '2026-02-15 23:13:36', '2026-02-15 23:13:36', 'S1 Informatika'),
(279, 'CPL08', 'IK3107', '2026-02-15 23:14:04', '2026-02-15 23:14:04', 'S1 Informatika'),
(280, 'CPL08', 'IK3109', '2026-02-15 23:14:22', '2026-02-15 23:14:22', 'S1 Informatika'),
(281, 'CPL08', 'IK3110', '2026-02-15 23:14:36', '2026-02-15 23:14:36', 'S1 Informatika'),
(282, 'CPL08', 'IK3203', '2026-02-15 23:14:50', '2026-02-15 23:14:50', 'S1 Informatika'),
(283, 'CPL08', 'IK3205', '2026-02-15 23:15:08', '2026-02-15 23:15:08', 'S1 Informatika'),
(284, 'CPL08', 'IK3206', '2026-02-15 23:15:17', '2026-02-15 23:15:17', 'S1 Informatika'),
(285, 'CPL08', 'IK3210', '2026-02-15 23:15:32', '2026-02-15 23:15:32', 'S1 Informatika'),
(286, 'CPL08', 'IK3211', '2026-02-15 23:15:43', '2026-02-15 23:15:43', 'S1 Informatika'),
(287, 'CPL08', 'IK3212', '2026-02-15 23:15:58', '2026-02-15 23:15:58', 'S1 Informatika'),
(288, 'CPL09', 'IK2206', '2026-02-15 23:18:15', '2026-02-15 23:18:15', 'S1 Informatika'),
(289, 'CPL09', 'IK3107', '2026-02-15 23:18:36', '2026-02-15 23:18:36', 'S1 Informatika'),
(290, 'CPL09', 'IK3207', '2026-02-15 23:18:53', '2026-02-15 23:18:53', 'S1 Informatika'),
(291, 'CPL09', 'IK3208', '2026-02-15 23:19:06', '2026-02-15 23:19:06', 'S1 Informatika'),
(293, 'CPL10', 'IK2206', '2026-02-15 23:22:00', '2026-02-15 23:22:00', 'S1 Informatika'),
(294, 'CPL10', 'IK3101', '2026-02-15 23:22:16', '2026-02-15 23:22:16', 'S1 Informatika'),
(295, 'CPL10', 'IK3201', '2026-02-15 23:25:28', '2026-02-15 23:25:28', 'S1 Informatika'),
(296, 'CPL10', 'IK3204', '2026-02-15 23:27:33', '2026-02-15 23:27:33', 'S1 Informatika'),
(297, 'CPL10', 'IK3206', '2026-02-15 23:30:05', '2026-02-15 23:30:05', 'S1 Informatika'),
(298, 'CPL10', 'IK3209', '2026-02-15 23:30:35', '2026-02-15 23:30:35', 'S1 Informatika'),
(299, 'CPL11', 'IK2207', '2026-02-15 23:31:55', '2026-02-15 23:31:55', 'S1 Informatika'),
(300, 'CPL11', 'IK3105', '2026-02-15 23:32:09', '2026-02-15 23:32:09', 'S1 Informatika'),
(301, 'CPL11', 'IK3108', '2026-02-15 23:32:22', '2026-02-15 23:32:22', 'S1 Informatika'),
(302, 'CPL11', 'IK3110', '2026-02-15 23:32:35', '2026-02-15 23:32:35', 'S1 Informatika'),
(303, 'CPL11', 'IK3205', '2026-02-15 23:32:49', '2026-02-15 23:32:49', 'S1 Informatika'),
(304, 'CPL11', 'IK3209', '2026-02-15 23:33:00', '2026-02-15 23:33:00', 'S1 Informatika'),
(305, 'CPL11', 'IK3210', '2026-02-15 23:33:08', '2026-02-15 23:33:08', 'S1 Informatika'),
(306, 'CPL11', 'IK3211', '2026-02-15 23:33:21', '2026-02-15 23:33:21', 'S1 Informatika'),
(307, 'CPL11', 'IK3212', '2026-02-15 23:33:30', '2026-02-15 23:33:30', 'S1 Informatika'),
(308, 'CPL12', 'IK2202', '2026-02-15 23:34:21', '2026-02-15 23:34:21', 'S1 Informatika'),
(309, 'CPL12', 'IK3109', '2026-02-15 23:34:40', '2026-02-15 23:34:40', 'S1 Informatika'),
(310, 'CPL12', 'IK3202', '2026-02-15 23:34:50', '2026-02-15 23:34:50', 'S1 Informatika'),
(311, 'CPL12', 'IK3206', '2026-02-15 23:35:01', '2026-02-15 23:35:01', 'S1 Informatika'),
(312, 'CPL12', 'IK3207', '2026-02-15 23:35:11', '2026-02-15 23:35:11', 'S1 Informatika'),
(313, 'CPL12', 'IK3208', '2026-02-15 23:35:21', '2026-02-15 23:35:21', 'S1 Informatika'),
(314, 'CPL12', 'IK3209', '2026-02-15 23:35:31', '2026-02-15 23:35:31', 'S1 Informatika'),
(315, 'CPL12', 'IK3213', '2026-02-15 23:35:49', '2026-02-15 23:35:49', 'S1 Informatika'),
(316, 'CPL13', 'IK3106', '2026-02-15 23:36:45', '2026-02-15 23:36:45', 'S1 Informatika'),
(412, 'CPL01', 'SI1103', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(413, 'CPL01', 'SI1201', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(414, 'CPL02', 'MKFSSI1204', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(415, 'CPL02', 'SI2103', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(416, 'CPL04', 'MKFSSI1205', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(417, 'CPL04', 'MKFSSI2106', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(418, 'CPL04', 'SI1104', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(419, 'CPL07', 'SI3102', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(420, 'CPL07', 'SI3103', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(421, 'CPL04', 'SI2202', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(422, 'CPL06', 'SI2202', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(423, 'CPL09', 'SI2202', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(424, 'CPL04', 'SI3201', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(425, 'CPL06', 'SI3201', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(426, 'CPL06', 'SI2203', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(427, 'CPL09', 'SI2203', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(428, 'CPL05', 'SI3202', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(429, 'CPL06', 'SI3202', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(430, 'CPL09', 'SI3202', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(431, 'CPL04', 'SI1102', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(432, 'CPL06', 'SI2104', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(433, 'CPL09', 'SI2104', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(434, 'CPL04', 'SI2101', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(435, 'CPL11', 'SI2101', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(436, 'CPL04', 'SI2201', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(437, 'CPL11', 'SI2201', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(438, 'CPL04', 'SI2205', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(439, 'CPL04', 'SI3204', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(440, 'CPL05', 'SI2105', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(441, 'CPL13', 'SI2105', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(442, 'CPL05', 'SI3104', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(443, 'CPL13', 'SI3104', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(444, 'CPL07', 'MKFSSI3107', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(445, 'CPL03', 'SI2102', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(446, 'CPL07', 'SI2102', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(447, 'CPL08', 'SI2102', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(448, 'CPL07', 'SI4291', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(449, 'CPL04', 'SI4190', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(450, 'CPL07', 'SI4190', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(451, 'CPL04', 'SI3207', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(452, 'CPL11', 'SI3207', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(453, 'CPL04', 'SI3101', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(454, 'CPL11', 'SI3101', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(455, 'CPL03', 'MKFSSI1203', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(456, 'CPL10', 'SI1202', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(457, 'CPL06', 'MKFSSI2202', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(458, 'CPL01', 'SI2204', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(459, 'CPL11', 'SI1101', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(460, 'CPL11', 'SI2206', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(461, 'CPL11', 'SI3208', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(462, 'CPL10', 'MKWUSI2203', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(463, 'CPL12', 'MKWUSI2203', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(464, 'CPL03', 'SI3105', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(465, 'CPL12', 'SI3218', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(466, 'CPL13', 'SI3218', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(467, 'CPL12', 'SI3203', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(468, 'CPL13', 'SI3203', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(469, 'CPL08', 'SI3106', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(470, 'CPL02', 'SI3107', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(471, 'CPL08', 'SI3107', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(472, 'CPL02', 'SI3205', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(473, 'CPL08', 'SI3205', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(474, 'CPL08', 'SI3206', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(475, 'CPL05', 'SI3108', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(476, 'CPL06', 'SI3108', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(477, 'CPL09', 'SI3108', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(478, 'CPL04', 'SI3109', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(479, 'CPL05', 'SI3109', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(480, 'CPL10', 'SI3219', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(481, 'CPL10', 'SI3209', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(482, 'CPL04', 'SI3210', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(483, 'CPL10', 'SI3211', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(484, 'CPL09', 'SI3212', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(485, 'CPL10', 'SI3212', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(486, 'CPL08', 'SI3213', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(487, 'CPL06', 'SI3214', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(488, 'CPL09', 'SI3214', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(489, 'CPL04', 'SI3215', '2026-02-23 23:53:08', '2026-02-23 23:53:08', 'S1 Sistem Informasi'),
(490, 'CPL10', 'SI3215', '2026-02-23 23:53:09', '2026-02-23 23:53:09', 'S1 Sistem Informasi'),
(491, 'CPL01', 'SI3216', '2026-02-23 23:53:09', '2026-02-23 23:53:09', 'S1 Sistem Informasi'),
(492, 'CPL01', 'SI3217', '2026-02-23 23:53:09', '2026-02-23 23:53:09', 'S1 Sistem Informasi'),
(493, 'CPL10', 'SI3217', '2026-02-23 23:53:09', '2026-02-23 23:53:09', 'S1 Sistem Informasi'),
(494, 'CPL12', 'SI3217', '2026-02-23 23:53:09', '2026-02-23 23:53:09', 'S1 Sistem Informasi'),
(495, 'CPL12', 'MKDUSI1204', '2026-02-23 23:53:09', '2026-02-23 23:53:09', 'S1 Sistem Informasi'),
(496, 'CPL13', 'MKDUSI1204', '2026-02-23 23:53:09', '2026-02-23 23:53:09', 'S1 Sistem Informasi'),
(497, 'CPL12', 'MKWUSI1201', '2026-02-23 23:53:09', '2026-02-23 23:53:09', 'S1 Sistem Informasi'),
(498, 'CPL13', 'MKWUSI1201', '2026-02-23 23:53:09', '2026-02-23 23:53:09', 'S1 Sistem Informasi'),
(499, 'CPL12', 'MKWUSI4102', '2026-02-23 23:53:09', '2026-02-23 23:53:09', 'S1 Sistem Informasi'),
(500, 'CPL13', 'MKWUSI4102', '2026-02-23 23:53:09', '2026-02-23 23:53:09', 'S1 Sistem Informasi'),
(501, 'CPL12', 'MKDUSI1101', '2026-02-23 23:53:09', '2026-02-23 23:53:09', 'S1 Sistem Informasi'),
(502, 'CPL13', 'MKDUSI1101', '2026-02-23 23:53:09', '2026-02-23 23:53:09', 'S1 Sistem Informasi'),
(503, 'CPL12', 'MKDUSI1103', '2026-02-23 23:53:09', '2026-02-23 23:53:09', 'S1 Sistem Informasi'),
(504, 'CPL13', 'MKDUSI1103', '2026-02-23 23:53:09', '2026-02-23 23:53:09', 'S1 Sistem Informasi'),
(505, 'CPL12', 'MKDUSI1102', '2026-02-23 23:53:09', '2026-02-23 23:53:09', 'S1 Sistem Informasi'),
(506, 'CPL13', 'MKDUSI1102', '2026-02-23 23:53:09', '2026-02-23 23:53:09', 'S1 Sistem Informasi');

-- --------------------------------------------------------

--
-- Table structure for table `cpl_pl`
--

CREATE TABLE `cpl_pl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_cpl` varchar(255) NOT NULL,
  `kode_pl` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prodi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cpl_pl`
--

INSERT INTO `cpl_pl` (`id`, `kode_cpl`, `kode_pl`, `created_at`, `updated_at`, `prodi`) VALUES
(1, 'CPL01', 'PL03', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(2, 'CPL01', 'PL04', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(3, 'CPL02', 'PL04', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(4, 'CPL03', 'PL01', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(5, 'CPL03', 'PL02', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(6, 'CPL04', 'PL01', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(7, 'CPL05', 'PL01', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(8, 'CPL05', 'PL02', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(9, 'CPL05', 'PL05', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(10, 'CPL06', 'PL04', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(11, 'CPL07', 'PL01', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(12, 'CPL07', 'PL02', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(13, 'CPL07', 'PL05', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(14, 'CPL08', 'PL01', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(15, 'CPL08', 'PL02', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(16, 'CPL08', 'PL05', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(17, 'CPL09', 'PL01', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(18, 'CPL09', 'PL02', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(19, 'CPL09', 'PL05', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(20, 'CPL10', 'PL01', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(21, 'CPL10', 'PL02', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(22, 'CPL10', 'PL05', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(23, 'CPL11', 'PL05', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(24, 'CPL12', 'PL05', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(25, 'CPL13', 'PL03', '2026-01-19 04:52:04', '2026-01-19 04:52:04', 'S1 Informatika'),
(100, 'CPL01', 'PL01', '2026-02-22 01:04:03', '2026-02-22 01:04:03', 'S1 Sistem Informasi'),
(101, 'CPL02', 'PL01', '2026-02-22 01:04:03', '2026-02-22 01:04:03', 'S1 Sistem Informasi'),
(102, 'CPL02', 'PL03', '2026-02-22 01:04:03', '2026-02-22 01:04:03', 'S1 Sistem Informasi'),
(103, 'CPL03', 'PL01', '2026-02-22 01:04:03', '2026-02-22 01:04:03', 'S1 Sistem Informasi'),
(104, 'CPL04', 'PL01', '2026-02-22 01:04:03', '2026-02-22 01:04:03', 'S1 Sistem Informasi'),
(105, 'CPL05', 'PL02', '2026-02-22 01:04:03', '2026-02-22 01:04:03', 'S1 Sistem Informasi'),
(106, 'CPL06', 'PL02', '2026-02-22 01:04:03', '2026-02-22 01:04:03', 'S1 Sistem Informasi'),
(107, 'CPL07', 'PL02', '2026-02-22 01:04:03', '2026-02-22 01:04:03', 'S1 Sistem Informasi'),
(108, 'CPL08', 'PL03', '2026-02-22 01:04:03', '2026-02-22 01:04:03', 'S1 Sistem Informasi'),
(109, 'CPL09', 'PL02', '2026-02-22 01:04:03', '2026-02-22 01:04:03', 'S1 Sistem Informasi'),
(110, 'CPL10', 'PL03', '2026-02-22 01:04:03', '2026-02-22 01:04:03', 'S1 Sistem Informasi'),
(111, 'CPL11', 'PL01', '2026-02-22 01:04:03', '2026-02-22 01:04:03', 'S1 Sistem Informasi'),
(112, 'CPL12', 'PL04', '2026-02-22 01:04:03', '2026-02-22 01:04:03', 'S1 Sistem Informasi'),
(113, 'CPL13', 'PL05', '2026-02-22 01:04:03', '2026-02-22 01:04:03', 'S1 Sistem Informasi');

-- --------------------------------------------------------

--
-- Table structure for table `cpl_prodi`
--

CREATE TABLE `cpl_prodi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_cpl` varchar(255) NOT NULL,
  `deskripsi_cpl` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prodi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cpl_prodi`
--

INSERT INTO `cpl_prodi` (`id`, `kode_cpl`, `deskripsi_cpl`, `created_at`, `updated_at`, `prodi`) VALUES
(1, 'CPL01', 'Mampu bersikap religius, memiliki sikap taat aturan hukum serta disiplin dalam kehidupan bermasyarakat dan bernegara', '2026-01-19 04:50:29', '2026-01-19 04:50:29', 'S1 Informatika'),
(2, 'CPL02', 'Menunjukan sikap profesional dalam bentuk kepatuhan pada etika profesi, kemampuan bekerjasama dalam tim multidisiplin, pemahaman tentang pembelajaran dan respon terhadap isu sosial dan perkembangan teknologi', '2026-01-19 04:50:29', '2026-01-19 04:50:29', 'S1 Informatika'),
(3, 'CPL03', 'Memiliki pengetahuan yang memadai terkait cara kerja sistem komputer dan mampu menerapkan/menggunakan berbagai algoritma/metode untuk memecahkan masalah pada suatu organisasi.', '2026-01-19 04:50:29', '2026-01-19 04:50:29', 'S1 Informatika'),
(4, 'CPL04', 'Memiliki kompetensi untuk menganalisis persoalan computing yang kompleks dan mengidentifikasi solusi pengelolaan proyek teknologi informatika dengan wawasan transdisiplin, khususnya dalam rekayasa perangkat lunak yang mendukung sistem cerdas di bidang kesehatan.', '2026-01-19 04:50:29', '2026-01-19 04:50:29', 'S1 Informatika'),
(5, 'CPL05', 'Menguasai konsep teoritis bidang pengetahuan Ilmu Komputer/Informatika dalam mendesain dan mensimulasikan aplikasi teknologi multi-platform yang relevan dengan kebutuhan industri dan masyarakat.', '2026-01-19 04:50:29', '2026-01-19 04:50:29', 'S1 Informatika'),
(6, 'CPL06', 'Memiliki kemampuan (pengelolaan) manajerial tim dan kerja sama (team work), manajemen diri, mampu berkomunikasi baik lisan maupun tertulis dengan baik dan mampu melakukan presentasi terutama dalam konteks pengembangan sistem cerdas di bidang kesehatan.', '2026-01-19 04:50:29', '2026-01-19 04:50:29', 'S1 Informatika'),
(7, 'CPL07', 'Menyusun deskripsi saintifik hasil kajian implikasi pengembangan atau implementasi ilmu pengethuan teknologi dalam bentuk Skripsi atau laporan tugas akhir atau artikel ilmiah.', '2026-01-19 04:50:29', '2026-01-19 04:50:29', 'S1 Informatika'),
(8, 'CPL08', 'Kemampuan mengimplementasi kebutuhan computing dengan mempertimbangkan berbagai metode/algoritma yang sesuai, khususnya yang diterapkan dalam sistem cerdas', '2026-01-19 04:50:29', '2026-01-19 04:50:29', 'S1 Informatika'),
(9, 'CPL09', 'Kemampuan Menganalisis, Merancang, Membuat dan mengevaluasi user interface dan aplikasi interaktif dengan mempertimbangkan kebutuhan pengguna dan perkembangan ilmu transdisiplin.', '2026-01-19 04:50:29', '2026-01-19 04:50:29', 'S1 Informatika'),
(10, 'CPL10', 'Kemampuan mendesain, mengimpementasi dan mengevaluasi solusi berbasis computing multi-platform yang memenuhi kebutuhan-kebutuhan computing pada sebuah organisasi.', '2026-01-19 04:50:29', '2026-01-19 04:50:29', 'S1 Informatika'),
(11, 'CPL11', 'Kemampuan memecahkan masalah di dunia industri dengan pendekatan sistem cerdas menggunakan algoritma sesuai, khususnya di bidang kesehatan', '2026-01-19 04:50:29', '2026-01-19 04:50:29', 'S1 Informatika'),
(12, 'CPL12', 'Kemampuan merancang, mengimplementasikan, mengelola, dan mengevaluasi sistem pengelolaan data dan informasi yang efisien, scalable, berkualitas, dan aman dengan menggunakan pendekatan model data yang tepat serta prinsip-prinsip rekayasa perangkat lunak yang mendukung pengembangan sistem cerdas, terutama di bidang kesehatan.', '2026-01-19 04:50:29', '2026-01-19 04:50:29', 'S1 Informatika'),
(13, 'CPL13', 'Memiliki tanggung jawab profesional, semangat kemandirian, daya juang, kewirausahaan dan ber-budaya', '2026-01-19 04:50:29', '2026-01-19 04:50:29', 'S1 Informatika'),
(40, 'CPL01', 'Mampu memahami, menganalisis, dan menilai konsep dasar dan peran sistem informasi dalam mengelola data dan memberikan rekomendasi pengambilan keputusan pada proses dan sistem organisasi.', '2026-02-22 00:48:47', '2026-02-22 00:48:47', 'S1 Sistem Informasi'),
(41, 'CPL02', 'Mampu merancang dan menggunakan database, serta mengolah dan menganalisa data dengan alat dan teknik pengolahan data', '2026-02-22 00:48:47', '2026-02-22 00:48:47', 'S1 Sistem Informasi'),
(42, 'CPL03', 'Mampu memahami dan menggunakan berbagai metodologi pengembangan sistem beserta alat pemodelan sistem dan menganalisa kebutuhan pengguna dalam membangun sistem informasi untuk mencapai tujuan organisasi', '2026-02-22 00:48:47', '2026-02-22 00:48:47', 'S1 Sistem Informasi'),
(43, 'CPL04', 'Mampu membuat perencanaan infrastruktur TI, arsitektur jaringan, layanan fisik dan cloud, menganalisa konsep identifikasi, otentikasi, otorisasi akses dalam konteks melindungi orang dan perangkat', '2026-02-22 00:48:47', '2026-02-22 00:48:47', 'S1 Sistem Informasi'),
(44, 'CPL05', 'Mampu memahami dan menerapkan kode etik dalam penggunaan informasi dan data pada perancangan, implementasi, dan penggunaan suatu sistem', '2026-02-22 00:48:47', '2026-02-22 00:48:47', 'S1 Sistem Informasi'),
(45, 'CPL06', 'Memiliki kemampuan merencanakan, menerapkan, memelihara dan meningkatkan sistem informasi organisasi untuk mencapai tujuan dan sasaran organisasi yang strategis baik jangka pendek maupun jangka panjang', '2026-02-22 00:48:47', '2026-02-22 00:48:47', 'S1 Sistem Informasi'),
(46, 'CPL07', 'Mampu memahami, mengidentifikasi dan menerapkan konsep, teknik dan metodologi manajemen proyek sistem informasi.', '2026-02-22 00:48:47', '2026-02-22 00:48:47', 'S1 Sistem Informasi'),
(47, 'CPL08', 'Mampu memahami dan menerapkan konsep, teknik, dan metode dalam analisis data dan visualisasi data sebagai pengetahuan yang berkaitan dengan teknologi informasi', '2026-02-22 00:48:47', '2026-02-22 00:48:47', 'S1 Sistem Informasi'),
(48, 'CPL09', 'Mampu memahami, mengidentifikasi, dan merekomendasikan kebutuhan bisnis terhadap dampak pengguaan teknologi informasi dalam organisasi.', '2026-02-22 00:48:47', '2026-02-22 00:48:47', 'S1 Sistem Informasi'),
(49, 'CPL10', 'Mampu memahami dan memanfaatkan teknologi informasi dalam pengelolaan bisnis', '2026-02-22 00:48:47', '2026-02-22 00:48:47', 'S1 Sistem Informasi'),
(50, 'CPL11', 'Mampu menerapkan konsep, metode dan teknik dalam merancang UI/UX', '2026-02-22 00:48:47', '2026-02-22 00:48:47', 'S1 Sistem Informasi'),
(51, 'CPL12', 'Memiliki tanggung jawab profesional, semangat kemandirian, daya juang, kewirausahaan dan ber-budaya', '2026-02-22 00:48:47', '2026-02-22 00:48:47', 'S1 Sistem Informasi'),
(52, 'CPL13', 'Memiliki jiwa kepemimpinan, mampu berkomunikasi serta menunjukkan kinerja bermutu', '2026-02-22 00:48:47', '2026-02-22 00:48:47', 'S1 Sistem Informasi');

-- --------------------------------------------------------

--
-- Table structure for table `cpmk`
--

CREATE TABLE `cpmk` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_cpmk` varchar(255) NOT NULL,
  `deskripsi_cpmk` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prodi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cpmk`
--

INSERT INTO `cpmk` (`id`, `kode_cpmk`, `deskripsi_cpmk`, `created_at`, `updated_at`, `prodi`) VALUES
(1, 'CPMK011', 'Mampu menginternalisasi nilai-nilai ketaqwaan kepada Tuhan Yang Maha Esa', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(2, 'CPMK012', 'Mampu menjalankan kehidupan sosial masyarakat yang berdasarkan aturan dan norma hukum yang berlaku', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(3, 'CPMK013', 'Mampu menerapkan kedisiplinan dalam kehidupan bermasyarakat dan bernegara', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(4, 'CPMK021', 'Mampu menerapkan etika profesi dalam pengambilan keputusan dan praktik pengembangan teknologi informatika.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(5, 'CPMK022', 'Mampu bekerja secara efektif dan berkolaborasi dalam tim multidisiplin untuk mencapai tujuan bersama.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(6, 'CPMK023', 'Mampu merespons dan menganalisis isu-isu sosial serta perkembangan teknologi dalam konteks profesional.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(7, 'CPMK024', 'Mampu mengembangkan sikap profesional, komunikasi efektif, dan kepemimpinan dalam tim dengan orientasi pembelajaran berkelanjutan.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(8, 'CPMK031', 'Mampu memahami cara kerja sistem komputer', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(9, 'CPMK032', 'Mampu menerapkan/menggunakan berbagai metode/algoritma dalam memecahkan masalah pada suatu organisasi', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(10, 'CPMK041', 'Mampu menerapkan konsep matematika dalam analisis dan pemodelan permasalahan computing yang kompleks.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(11, 'CPMK042', 'Mampu menggunakan algoritma dan struktur data dalam merancang solusi untuk permasalahan computing yang kompleks.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(12, 'CPMK043', 'Mampu mengintegrasikan ilmu pengetahuan lain yang relevan untuk mengembangkan solusi computing yang inovatif.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(13, 'CPMK044', 'Mampu mengidentifikasi, merumuskan, dan menyelesaikan permasalahan computing yang kompleks dengan pendekatan multidisiplin.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(14, 'CPMK051', 'Mampu menguasai konsep teoritis bidang pengetahuan Ilmu Komputer / Informatika dalam mendesain aplikasi teknologi multi-platform yang relevan dengan kebutuhan industri dan masyarakat.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(15, 'CPMK052', 'Mampu menguasai konsep teoritis bidang pengetahuan Ilmu Komputer / Informatika dalam mensimulasikan aplikasi teknologi multiplatform', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(16, 'CPMK061', 'Mampu mengelola tim, komunikasi dan berkolaborasi dalam proyek teknologi informasi', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(17, 'CPMK062', 'Mampu mengelola diri sendiri', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(18, 'CPMK063', 'Mampu menyajikan gagasan secara lisan dan tertulis', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(19, 'CPMK071', 'Mampu menyusun deskripsi saintifik hasil kajian implikasi pengembangan atau implementasi ilmu pengetahuan teknologi dalam bentuk skripsi atau laporan tugas akhir', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(20, 'CPMK072', 'Mampu menyusun deskripsi saintifik hasil kajian implikasi pengembangan atau implementasi ilmu pengetahuan teknologi dalam bentuk artikel ilmiah', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(21, 'CPMK081', 'Mampu menganalisis dan mendesain kebutuhan computing dengan benar.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(22, 'CPMK082', 'Mampu mengimplementasikan kebutuhan computing dengan sistematis', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(23, 'CPMK083', 'Mampu mengevaluasi kebutuhan computing yang efisien sesuai kebutuhan.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(24, 'CPMK084', 'Mampu memenuhi kebutuhan-kebutuhan berbasis computing.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(25, 'CPMK091', 'Mampu menganalisis dan merancang user interface dan aplikasi interaktif dengan mempertimbangkan kebutuhan pengguna dan perkembangan ilmu transdisiplin.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(26, 'CPMK092', 'Mampu membuat user interface dan aplikasi interaktif', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(27, 'CPMK093', 'Mampu mengevaluasi user interface dan aplikasi interaktif', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(28, 'CPMK101', 'Mampu mendesain solusi berbasis computing multi-platform yang memenuhi kebutuhan-kebutuhan computing pada sebuah organisasi.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(29, 'CPMK102', 'Mampu mengimplementasi solusi berbasis computing multi-platform.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(30, 'CPMK103', 'Mampu mengevaluasi solusi berbasis computing multi-platform', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(31, 'CPMK111', 'Mampu menganalisis dan merumuskan masalah di industri kesehatan yang dapat diselesaikan dengan sistem cerdas.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(32, 'CPMK112', 'Mampu merancang dan mengimplementasikan algoritma sistem cerdas yang sesuai untuk aplikasi di bidang kesehatan.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(33, 'CPMK113', 'Mampu mengevaluasi dan mengoptimalkan solusi sistem cerdas dalam menyelesaikan permasalahan di industri kesehatan.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(34, 'CPMK121', 'Mampu merancang dan mengimplementasikan sistem pengelolaan data dan informasi yang efisien dan aman dengan pendekatan model data yang tepat untuk aplikasi kesehatan.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(35, 'CPMK122', 'Mampu mengelola kualitas dan keamanan sistem pengelolaan data serta informasi yang diterapkan di sistem cerdas untuk bidang kesehatan.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(36, 'CPMK123', 'Mampu mengevaluasi dan mengoptimalkan sistem pengelolaan data dan informasi agar sesuai dengan kebutuhan dan standar sistem cerdas di bidang kesehatan.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(37, 'CPMK131', 'mampu menunjukkan sikap disiplin, tanggung jawab, dan kemandirian dalam aktivitas akademik maupun sosial.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(38, 'CPMK132', 'mampu mengembangkan semangat juang dan integritas dalam menghadapi tantangan kehidupan.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(39, 'CPMK134', 'mampu menunjukkan sikap tanggung jawab profesional dan etika dalam aktivitas kewirausahaan.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(40, 'CPMK135', 'mampu mengembangkan semangat kemandirian, daya juang, dan kreativitas untuk menghasilkan ide bisnis inovatif', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(41, 'CPMK137', 'Mahasiswa mampu menunjukkan kemandirian dan tanggung jawab dalam menyelesaikan masalah dengan pendekatan computational thinking.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(42, 'CPMK138', 'Mahasiswa mampu mengembangkan kreativitas, ketekunan, dan daya juang dalam merancang solusi algoritmik.', '2026-01-19 07:17:30', '2026-01-19 07:17:30', 'S1 Informatika'),
(46, 'CPMK011', 'Mampu memahami konsep dasar sistem informasi', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(47, 'CPMK012', 'Mampu menganalisis proses dan sistem organisasi', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(48, 'CPMK013', 'Mampu menilai proses dan sistem pengelolaan data pada organisasi', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(49, 'CPMK014', 'Mampu menilai peran sistem informasi dalam memberikan rekomendasi pengambilan keputusan di organisasi', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(50, 'CPMK021', 'Mampu merancang database', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(51, 'CPMK022', 'Mampu menggunakan database', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(52, 'CPMK023', 'Mampu mengolah data dengan alat dan teknik pengolahan data', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(53, 'CPMK024', 'Mampu menganalisa data dengan alat dan teknik pengolahan data', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(54, 'CMPK031', 'Mampu memahami berbagai metodologi pengembangan sistem', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(55, 'CPMK032', 'Mampu menggunakan berbagai alat pengembangan sistem', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(56, 'CPMK033', 'Mampu menganalisa kebutuhan pengguna dalam membangun sistem informasi untuk mencapai tujuan organisasi', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(57, 'CPMK041', 'Mampu membuat perencanaan infrastruktur TI, arsitektur jaringan, serta layanan fisik/cloud', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(58, 'CPMK042', 'Mampu menganalisis konsep identifikasi, otentikasi, otorisasi akses dalam konteks keamanan sistem', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(59, 'CPMK051', 'Mampu memahami kode etik dalam penggunaan informasi data pada perancangan, implementasi dan penggunaan suatu sistem', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(60, 'CPMK052', 'Mampu menerapkan kode etik dalam penggunaan informasi data pada perancangan, implementasi dan penggunaan suatu sistem', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(61, 'CPMK061', 'Mampu merencanakan sistem informasi organisasi untuk mencapai tujuan dan sasaran organisasi jangka panjang', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(62, 'CPMK062', 'Mampu menerapkan sistem informasi untuk mencapai tujuan dan sasaran organisasi jangka pendek.', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(63, 'CPMK063', 'Mampu memelihara sistem informasi organisasi untuk mencapai tujuan organisasi jangka pendek.', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(64, 'CPMK064', 'Mampu meningkatkan layanan sistem informasi yang strategis secara jangka pendek.', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(65, 'CPMK071', 'Mampu memahami konsep, teknik dan metodologi manajemen proyek sistem informasi', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(66, 'CPMK072', 'Mampu mengidentifikasi konsep, teknik dan metodologi manajemen proyek sistem informasi', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(67, 'CPMK073', 'Mampu menerapkan konsep, teknik dan metodologi manajemen proyek sistem informasi', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(68, 'CPMK081', 'Mampu memahami konsep dasar analisis data dan visualisasi data', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(69, 'CPMK082', 'Mampu menerapkan teknik analisis data dan visualisasi untuk mendukung pengambilan keputusan berbasis data.', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(70, 'CPMK083', 'Mampu menggunakan alat dan metode yang relevan untuk menghasilkan visualisasi data yang informatif dan efektif.', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(71, 'CPMK091', 'CPMK091: Mampu mengidentifikasi kebutuhan bisnis yang dapat dioptimalkan dengan teknologi informasi.', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(72, 'CPMK092', 'CPMK092: Mampu menganalisis dampak penggunaan teknologi informasi pada proses bisnis dalam organisasi.', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(73, 'CPMK093', 'CPMK093: Mampu merekomendasikan solusi teknologi informasi yang sesuai untuk mendukung tujuan bisnis organisasi', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(74, 'CPMK101', 'Mampu menjelaskan peran teknologi informasi dalam mendukung pengelolaan bisnis.', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(75, 'CPMK102', 'Mampu memanfaatkan teknologi informasi dalam pengambilan keputusan dan pengelolaan bisnis secara efektif.', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(76, 'CMPK111', 'Mampu menjelaskan prinsip-prinsip dasar desain UI/UX.', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(77, 'CMPK112', 'Mampu merancang antarmuka pengguna berdasarkan kebutuhan pengguna.', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(78, 'CMPK113', 'Mampu menerapkan metode dan teknik dalam pengembangan prototipe UI/UX yang efektif', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(79, 'CPMK121', 'Mampu menunjukkan tanggung jawab profesional dan kemandirian', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(80, 'CPMK122', 'Mampu menerapkan daya juang dan semangat kewirausahaan dalam berbagai konteks profesional di bidang teknologi informasi.', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(81, 'CPMK131', 'Mampu memimpin dan mengelola tim dengan baik dalam lingkungan profesional', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(82, 'CPMK132', 'Mampu berkomunikasi secara efektif dalam lingkungan profesional.', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi'),
(83, 'CPMK133', 'Mampu bekerja sama dengan tim untuk mencapai hasil kerja yang bermutu tinggi.', '2026-02-24 00:00:16', '2026-02-24 00:00:16', 'S1 Sistem Informasi');

-- --------------------------------------------------------

--
-- Table structure for table `dosen_profils`
--

CREATE TABLE `dosen_profils` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `nik` varchar(255) NOT NULL,
  `nidn` varchar(255) DEFAULT NULL,
  `gelar_depan` varchar(255) DEFAULT NULL,
  `gelar_belakang` varchar(255) DEFAULT NULL,
  `prodi` varchar(255) NOT NULL,
  `fakultas` varchar(255) NOT NULL,
  `jabatan_fungsional` varchar(255) DEFAULT NULL,
  `jabatan_struktural` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dosen_profils`
--

INSERT INTO `dosen_profils` (`id`, `user_id`, `nik`, `nidn`, `gelar_depan`, `gelar_belakang`, `prodi`, `fakultas`, `jabatan_fungsional`, `jabatan_struktural`, `created_at`, `updated_at`) VALUES
(1, 100, '3302242506820001', '3302242506820001', '', 'S.Si., M.Eng.', 'S1 Informatika', 'Sains dan Teknologi', 'Lektor', 'Dekan', '2026-02-03 01:56:35', '2026-03-01 20:14:18'),
(2, 2, '114902190892', '114902190892', '', 'S.Kom., M.T.', 'S1 Sistem Informasi', 'Sains dan Teknologi', 'Asisten Ahli', 'Kaprodi', '2026-02-03 01:56:35', '2026-03-01 20:20:17'),
(3, 5, '103409030173', '103409030173', '', 'S,Kom., M.T.', 'S1 Sistem Informasi', 'Sains dan Teknologi', 'Asisten Ahli', 'BAUK', '2026-02-03 01:56:35', '2026-03-01 20:15:56'),
(4, 7, '3311064308940002', '3311064308940002', '', 'S.Kom., M.Kom.', 'S1 Informatika', 'Sains dan Teknologi', 'Asisten Ahli', '', '2026-02-03 01:56:35', '2026-03-01 20:19:26'),
(5, 3, '115911190894', '0623089401', 'Dr.', 'S.Kom., M.Kom.', 'S1 Informatika', 'Sains dan Teknologi', 'Asisten Ahli', 'Kaprodi', '2026-02-03 01:56:35', '2026-02-17 00:07:00'),
(12, 106, '111002141181', '6124444', 'Dr', 'S.Si.T, S.Kep, Ns, M.Kes.', 'S1 Keperawatan', 'Kesehatan', 'Lektor Kepala', 'BPMI', '2026-02-18 01:04:31', '2026-03-01 20:25:22'),
(13, 107, '116805210694', '116805210694', '', 'SE., MM.', 'S1 Manajemen', 'Ilmu Sosial', 'Lektor', 'Kaprodi', '2026-03-01 19:59:16', '2026-03-01 20:14:34'),
(15, 109, '113512150793', '06231', 'apt', 'M. Farm', 'S1 Farmasi', 'Kesehatan', 'Lektor', NULL, '2026-03-01 20:10:08', '2026-03-01 20:10:08'),
(16, 110, '116905210389', '116905210389', NULL, 'S.E., M.Ak., Ak., ACPA.', 'S1 Akuntansi', 'Ilmu Sosial', 'Lektor', 'Kaprodi', '2026-03-01 20:23:05', '2026-03-01 20:23:05'),
(17, 111, '114402190188', '114402190188', NULL, 'M. Pd.', 'S1 Pendidikan Bahasa Inggris', 'Ilmu Sosial', 'Lektor', 'Kaprodi', '2026-03-01 20:24:12', '2026-03-01 20:24:12'),
(18, 112, '116605211289', '116605211289', NULL, 'S.H., M.H., LL.M.', 'S1 Hukum', 'Ilmu Sosial', 'Lektor Kepala', 'Kaprodi', '2026-03-01 20:25:06', '2026-03-01 20:25:06'),
(19, 113, '106508090285', '106508090285', NULL, 'SST., M.Kes.', 'S1 Kebidanan', 'Kesehatan', 'Lektor', 'Kaprodi', '2026-03-01 20:26:25', '2026-03-01 20:26:25'),
(20, 114, '104703051278', '104703051278', 'Dr.', 'S.Kep., Ns., M.Kep.', 'S1 Keperawatan', 'Kesehatan', 'Lektor Kepala', 'Kaprodi', '2026-03-01 20:27:25', '2026-03-01 20:27:25'),
(21, 115, '105201061179', '105201061179', 'Dr. Ns.', 'S.Kep., MSc.', 'D4 Keperawatan Anestesiologi', 'Kesehatan', 'Lektor Kepala', 'Kaprodi', '2026-03-01 20:28:22', '2026-03-01 20:28:22');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_fakultas` varchar(255) NOT NULL,
  `kode_fakultas` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fakultas`
--

INSERT INTO `fakultas` (`id`, `nama_fakultas`, `kode_fakultas`, `created_at`, `updated_at`) VALUES
(1, 'Kesehatan', 'FKES', '2026-02-18 06:56:47', '2026-02-18 06:56:47'),
(2, 'Sains dan Teknologi', 'FST', '2026-02-18 06:56:47', '2026-02-18 06:56:47'),
(3, 'Ilmu Sosial', 'FIS', '2026-02-18 06:56:47', '2026-02-18 06:56:47');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `krs`
--

CREATE TABLE `krs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mahasiswa_id` varchar(255) NOT NULL,
  `kode_mk` varchar(255) NOT NULL,
  `semester` varchar(255) NOT NULL,
  `tahun_akademik` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nilai_angka` decimal(5,2) DEFAULT NULL,
  `nilai_huruf` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `krs`
--

INSERT INTO `krs` (`id`, `mahasiswa_id`, `kode_mk`, `semester`, `tahun_akademik`, `created_at`, `updated_at`, `nilai_angka`, `nilai_huruf`) VALUES
(275, '250111001', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(276, '250111001', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(277, '250111001', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(278, '250111001', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(279, '250111001', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(280, '250111001', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(281, '250111001', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(282, '250111002', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(283, '250111002', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(284, '250111002', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(285, '250111002', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(286, '250111002', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(287, '250111002', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(288, '250111002', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(289, '250111003', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(290, '250111003', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(291, '250111003', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(292, '250111003', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(293, '250111003', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(294, '250111003', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(295, '250111003', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(296, '250111004', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(297, '250111004', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(298, '250111004', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(299, '250111004', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(300, '250111004', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(301, '250111004', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(302, '250111004', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(303, '250111005', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(304, '250111005', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(305, '250111005', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(306, '250111005', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(307, '250111005', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(308, '250111005', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(309, '250111005', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(310, '250111006', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(311, '250111006', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(312, '250111006', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(313, '250111006', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(314, '250111006', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(315, '250111006', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(316, '250111006', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(317, '250111007', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(318, '250111007', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(319, '250111007', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(320, '250111007', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(321, '250111007', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(322, '250111007', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(323, '250111007', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(324, '250111008', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(325, '250111008', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(326, '250111008', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(327, '250111008', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(328, '250111008', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(329, '250111008', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(330, '250111008', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(331, '250111009', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(332, '250111009', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(333, '250111009', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(334, '250111009', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(335, '250111009', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(336, '250111009', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(337, '250111009', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(338, '250111010', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(339, '250111010', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(340, '250111010', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(341, '250111010', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(342, '250111010', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(343, '250111010', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(344, '250111010', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(345, '250111011', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(346, '250111011', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(347, '250111011', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(348, '250111011', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(349, '250111011', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(350, '250111011', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(351, '250111011', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(352, '250111012', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(353, '250111012', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(354, '250111012', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(355, '250111012', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(356, '250111012', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(357, '250111012', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(358, '250111012', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(359, '250111013', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(360, '250111013', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(361, '250111013', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(362, '250111013', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(363, '250111013', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(364, '250111013', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(365, '250111013', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(366, '250111014', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(367, '250111014', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(368, '250111014', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(369, '250111014', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(370, '250111014', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(371, '250111014', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(372, '250111014', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(373, '250111015', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(374, '250111015', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(375, '250111015', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(376, '250111015', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(377, '250111015', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(378, '250111015', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(379, '250111015', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(380, '250111016', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(381, '250111016', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(382, '250111016', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(383, '250111016', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(384, '250111016', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(385, '250111016', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(386, '250111016', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(387, '250111017', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(388, '250111017', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(389, '250111017', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(390, '250111017', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(391, '250111017', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(392, '250111017', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(393, '250111017', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(394, '250111018', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(395, '250111018', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(396, '250111018', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(397, '250111018', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(398, '250111018', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(399, '250111018', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(400, '250111018', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(401, '250111019', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(402, '250111019', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(403, '250111019', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(404, '250111019', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(405, '250111019', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(406, '250111019', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(407, '250111019', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(408, '250111020', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(409, '250111020', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(410, '250111020', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(411, '250111020', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(412, '250111020', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(413, '250111020', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(414, '250111020', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(415, '250111021', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(416, '250111021', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(417, '250111021', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(418, '250111021', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(419, '250111021', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(420, '250111021', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(421, '250111021', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(422, '250111022', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(423, '250111022', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(424, '250111022', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(425, '250111022', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(426, '250111022', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(427, '250111022', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(428, '250111022', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(429, '250111023', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(430, '250111023', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(431, '250111023', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(432, '250111023', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(433, '250111023', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(434, '250111023', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(435, '250111023', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(436, '250111024', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(437, '250111024', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(438, '250111024', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(439, '250111024', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(440, '250111024', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(441, '250111024', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(442, '250111024', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(443, '250111025', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(444, '250111025', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(445, '250111025', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(446, '250111025', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(447, '250111025', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(448, '250111025', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(449, '250111025', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(450, '250111026', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(451, '250111026', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(452, '250111026', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(453, '250111026', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(454, '250111026', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(455, '250111026', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(456, '250111026', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(457, '250111027', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(458, '250111027', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(459, '250111027', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(460, '250111027', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(461, '250111027', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(462, '250111027', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(463, '250111027', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(464, '250111028', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(465, '250111028', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(466, '250111028', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(467, '250111028', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(468, '250111028', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(469, '250111028', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(470, '250111028', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(471, '250111029', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(472, '250111029', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(473, '250111029', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(474, '250111029', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(475, '250111029', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(476, '250111029', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(477, '250111029', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(478, '250111030', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(479, '250111030', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(480, '250111030', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(481, '250111030', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(482, '250111030', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(483, '250111030', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(484, '250111030', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(485, '250111031', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(486, '250111031', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(487, '250111031', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(488, '250111031', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(489, '250111031', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(490, '250111031', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(491, '250111031', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(492, '250111032', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(493, '250111032', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(494, '250111032', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(495, '250111032', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(496, '250111032', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(497, '250111032', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(498, '250111032', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(499, '250111033', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(500, '250111033', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(501, '250111033', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(502, '250111033', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(503, '250111033', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(504, '250111033', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(505, '250111033', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(506, '250111034', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(507, '250111034', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(508, '250111034', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(509, '250111034', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(510, '250111034', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(511, '250111034', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(512, '250111034', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(513, '250111035', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(514, '250111035', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(515, '250111035', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(516, '250111035', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(517, '250111035', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(518, '250111035', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(519, '250111035', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(520, '250111036', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(521, '250111036', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(522, '250111036', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:30', '2026-01-20 00:47:30', NULL, NULL),
(523, '250111036', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(524, '250111036', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(525, '250111036', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(526, '250111036', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(527, '250111037', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(528, '250111037', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(529, '250111037', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(530, '250111037', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(531, '250111037', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(532, '250111037', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(533, '250111037', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(534, '250111038', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(535, '250111038', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(536, '250111038', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(537, '250111038', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(538, '250111038', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(539, '250111038', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(540, '250111038', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(541, '250111039', 'IK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(542, '250111039', 'MKFSIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(543, '250111039', 'IK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(544, '250111039', 'MKDUIK1101', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(545, '250111039', 'MKDUIK1103', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(546, '250111039', 'MKDUIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL),
(547, '250111039', 'MKFSIK1102', 'Ganjil', '2025/2026', '2026-01-20 00:47:31', '2026-01-20 00:47:31', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswas`
--

CREATE TABLE `mahasiswas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nim` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `angkatan` varchar(4) NOT NULL,
  `prodi` varchar(255) NOT NULL,
  `kelas` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mahasiswas`
--

INSERT INTO `mahasiswas` (`id`, `nim`, `nama`, `angkatan`, `prodi`, `kelas`, `created_at`, `updated_at`) VALUES
(1, '220111002', 'ADAM FATHURROHMAN ARYA BAKHTI', '2022', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 00:01:22'),
(2, '220111003', 'AKMAL RAKA PANGESTU', '2022', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(3, '220111004', 'BERLIANA RAHMADHANI', '2022', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(4, '220111010', 'FEBRI RAHAYU NINGSIH', '2022', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(5, '220111001', 'HAFIZAH ZURIYAT TAYYIBAH', '2022', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(6, '220111005', 'OKTAVIA PUTRI HANDAYANI', '2022', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(7, '220111008', 'TOAT TULOH', '2022', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(8, '210111006', 'YULIN PENGGU', '2022', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(9, '220111009', 'ZULKIFLI', '2022', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(10, '230111001', 'ANGGI DWI SAPUTRA', '2023', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(11, '230111002', 'ANNASTASYA NABILA ELSA WULANDARI', '2023', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(12, '230111004', 'ESHA RIZKY FILLIANSYAH', '2023', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(13, '230111005', 'FAKHRI ZAHI MUMTAZA', '2023', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(14, '230111007', 'MUHAMMAD HUMAM NUQI', '2023', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(15, '230111009', 'RACHMAN HIDAYAT', '2023', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(16, '230111010', 'SAFA KIANA', '2023', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(17, '230111011', 'SETIAWAN', '2023', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(18, '240111016', 'ADWIN IRSADI', '2023', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(19, '240111017', 'AGRIBY DIANDRA CHANIAGO', '2023', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(20, '240111018', 'ANISYA', '2023', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(21, '240111001', 'AKHMAD NOVAL KHUSEN', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(22, '240111002', 'ARIF DERMAWAN', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(23, '240111003', 'APRIZA FREDIANSYAH', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(24, '240111004', 'EVAN IRMANSYAH WICAKSONO', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(25, '240111005', 'FADLI ANADREA', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(26, '240111006', 'FAYYAZ AQEEL NAQIB', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(27, '240111007', 'GALIH RESTU JAYA SAPUTRA', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(28, '240111008', 'KENDRIAN', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(29, '240111009', 'KHAFID DAYAN JATI', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(30, '240111010', 'LINA ENDARWATI', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(31, '240111011', 'NISRINA KAMILIA PUTRI', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(32, '240111012', 'ROSITA ZENI SAPUTRI', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(33, '240111013', 'SUWITO', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(34, '240111014', 'TEGAR RIFA\'I', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(35, '240111015', 'FARHATUN NISA SALSABILA', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(36, '240111019', 'HANAN BAYU ANGGORO', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(37, '240111020', 'NATIYA CHOYRUNNISA', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(38, '240111021', 'ARYA SUKMA ARIFIN', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(39, '240111022', 'DENNY YULLOH', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(40, '240111023', 'DWI SATRIO NUGROHO', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(41, '240111024', 'INDRA NUR JANAN', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(42, '240111025', 'SAEPUL MAULANA ZIDNI WILDANI', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(43, '240111026', 'UNTUNG DWI PRASETYO', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(44, '240111027', 'WAHYU FAJAR ROMADON', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(45, '240111028', 'MUHAMMAD AFIF AMRULLOH', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(46, '240111030', 'ROZIANA FAUZUN', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(47, '240111031', 'SIAM PURWONO', '2024', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(48, '250111001', 'AHMAD JAUHARI', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(49, '250111002', 'ALDI PRATAMA', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(50, '250111003', 'ALIF NOVAL PRATAMA', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(51, '250111004', 'ALKAUTSARIO FRANS ARIANANTO', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(52, '250111005', 'ANGGARA PRASETYO WARDANA', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(53, '250111006', 'ANIN ANASZAH BELLA SHABINA', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(54, '250111007', 'ANJAR PROBO PRIHATMOJO', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(55, '250111008', 'ERIKA NOVITA SARI', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(56, '250111009', 'FAHISAL SETIANTO', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(57, '250111010', 'FAHMI ANZAL MUBAROK', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(58, '250111011', 'FATHUL NUR HIDAYAT', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(59, '250111012', 'HAFIZ NUR FAUZAN', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(60, '250111013', 'JOSEP CAFASSO VABLUBYARAN OHOIWUTUN', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(61, '250111014', 'KHADIQ ZARKASY', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(62, '250111015', 'LINDA AGUSTINA', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(63, '250111016', 'M LINTANG KARNO', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(64, '250111017', 'MEILY ATIFAHTUN NISA', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(65, '250111018', 'MUHAMAD DAFA NURUZZUFAR AL MUBAROK', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(66, '250111019', 'MUHAMAD NUR AKBAR', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(67, '250111020', 'MUHAMMAD SAFI\'I', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(68, '250111021', 'NADIA NUR SHELA', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(69, '250111022', 'OKTAVIANI AZZAHRA', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(70, '250111023', 'RAHAYU JUMRIHAYATI', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(71, '250111024', 'RENO NUR ROHMAT', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(72, '250111025', 'RESTU RISMAWATI', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(73, '250111026', 'RIDLO DWI PRASETYO', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(74, '250111027', 'RIRI SYAFALA GHOFARO JAMAL', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(75, '250111028', 'RIZAL FATCHURROZAQ', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(76, '250111029', 'RIZKI NURFADILAH', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(77, '250111030', 'SEFTI DWI RAMANDA', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(78, '250111031', 'SHINTA WINDIANA', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(79, '250111032', 'SYUKRON MAULANA', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(80, '250111033', 'TAUFAN NUR SAFFARUDIN', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(81, '250111034', 'VEGA ADRIYAN', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(82, '250111035', 'ZAIN GHATHFAAN KIESA', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(83, '250111036', 'FIRMANTO NUGROADI', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(84, '250111037', 'RIVA AIKA CHAIRUNISA', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(85, '250111038', 'DANIA KHALID KAMAL TAHA', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(86, '250111039', 'YEKI DENIAS HAGISIMIJAU', '2025', 'S1 Informatika', 'A', '2026-01-20 06:54:33', '2026-01-20 06:54:33'),
(87, '220112004', 'AMALIA ARDIYANI', '2022', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(88, '220112005', 'APRIANDA ALIF BUDIMAN', '2022', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(89, '220112006', 'DWITA URIP NATASA', '2022', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(90, '220112007', 'EVANA ANUGRAH PURWAYANTO', '2022', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(91, '220112001', 'FADILA NUR KAMALA', '2022', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(92, '220112008', 'IWAN SAFI\'I', '2022', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(93, '220112003', 'LAELY ISNA MAULIDIA', '2022', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(94, '220112009', 'MUHIT FAHRI ALAMSAH', '2022', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(95, '220112010', 'NUR AMANAH ZAEN', '2022', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(96, '220112002', 'NUR CHOERUN NISA', '2022', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(97, '220112011', 'ROFIQ HIDAYAT', '2022', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(98, '230112001', 'INDAH TRIVILIA', '2023', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(99, '230112003', 'AMANDA TITANIA PUTRI', '2023', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(100, '230112004', 'AMELIA YULIANTI', '2023', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(101, '230112005', 'ANISA FEBRIYANI', '2023', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(102, '230112007', 'OLA SAFIRA', '2023', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(103, '230112008', 'WINA TRI ASIH', '2023', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(104, '240112011', 'EDGINA RANGGA ARKANANTA', '2023', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(105, '240112012', 'IRFAN FADILLAHZAIN', '2023', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(106, '240112013', 'MOHAMAD FAIZ RAMDANI', '2023', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(107, '240112014', 'RAGIL YUDI SAPUTRA', '2023', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(108, '240112015', 'RIZKA KHUMAIDA', '2023', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(109, '240112016', 'SEFIA NUR ROHMAH', '2023', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(110, '240112002', 'DEFNI MUFLIKHATUN FAJRIYAH', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(111, '240112003', 'FATIMAH ZAHRO', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(112, '240112004', 'HENDRA IRAWAN', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(113, '240112005', 'IMADUDDIN MUHAMMAD ZIDANE', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(114, '240112006', 'M WAHYU AGUS DWIANTO', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(115, '240112007', 'RANA SURYANI FADHILAH', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(116, '240112008', 'RANI FADHILAH', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(117, '240112010', 'SYAHRUL SETIAWAN', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(118, '240112017', 'REVA PAOLINA ANGGRAENI', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(119, '240112018', 'DWI PRASDEWO JINGGA PUTRA', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(120, '240112019', 'IMAM FAOZI', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(121, '240112021', 'ADITYA SETYA KURNIAWAN', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(122, '240112022', 'ANGGI ASMARA', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(123, '240112024', 'BAYU SUPRIYANTO', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(124, '240112025', 'DARYOTO', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(125, '240112026', 'DONI IRAWAN', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(126, '240112027', 'KRISNA NOVANDA ADI SAPUTRA', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(127, '240112028', 'MUNIF FADHLUROHMAN', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(128, '240112030', 'ANGLING CAHYA WISNU MURTI', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(129, '240112031', 'DANANG TRILAKSONO', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(130, '240112032', 'HERU DWI CAHYADI', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(131, '240112033', 'PUNGKAS SETIAWAN', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(132, '240112034', 'DEVA GALIH PANGESTU', '2024', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(133, '250112001', 'ADIB TAUFIQURROHMAN', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(134, '250112002', 'ALFA SEPTIAN RAMADHAN', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(135, '250112003', 'ARLIAN SYAHPUTRA', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(136, '250112004', 'ASTRI NURUL LATIFAH', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(137, '250112005', 'ASYIFA SALSABILA', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(138, '250112006', 'CANTIK INTAN SAPUTRI', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(139, '250112007', 'DEA AMELIA MAYAZ', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(140, '250112008', 'DEVA BAGUS PRAKOSO', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(141, '250112009', 'DHETA AFIKA', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(142, '250112010', 'DWI YUNIARTI', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(143, '250112011', 'FATAKHULLAH AKBAR', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(144, '250112012', 'FIFI NURHIDAYAH', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(145, '250112013', 'HESTI RAHAYU', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(146, '250112014', 'IBNU NUR ZAKI', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(147, '250112015', 'LILIS SUGANDA', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(148, '250112016', 'LUTFI MUHAMMAD VICKY', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(149, '250112017', 'LUTFIAN ZAKI AL KAUTSAR', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(150, '250112018', 'M. KAFILIHANDRI', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(151, '250112019', 'MARCELLO KENZZO JOSA NENO', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(152, '250112020', 'NAYLA RAISYA WARDA', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(153, '250112021', 'NOVIA YENI WULANDARI', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(154, '250112022', 'PUTRI FEBRIANA SARI', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(155, '250112023', 'RICHMA SHOLAWATI', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(156, '250112024', 'RIFKI IMAM DURORI', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(157, '250112025', 'SALSA NABIILAH PUTRI', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(158, '250112026', 'SHAHARA EKA PUTRI MAHARANI', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(159, '250112027', 'SULIS SETIOWATI', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(160, '250112028', 'UT MAHDISTA ALMAHDI', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(161, '250112029', 'VERONICA AGUSTIEN', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(162, '250112030', 'VIANDIKA PRATAMA PUTRA', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(163, '250112031', 'VIKRI AWALLULOH', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(164, '250112032', 'WAHID MUSTOFA', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(165, '250112033', 'YASMIN RIZKY JUNEETA', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49'),
(166, '250112034', 'HASSAN KHALID HASSAN AWADELSEED', '2025', 'S1 Sistem Informasi', 'A', '2026-02-25 00:55:24', '2026-02-25 00:57:49');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_mk` varchar(255) NOT NULL,
  `nama_mk` varchar(255) NOT NULL,
  `sks` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `sks_teori` int(11) NOT NULL DEFAULT 0,
  `sks_praktik` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prodi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`id`, `kode_mk`, `nama_mk`, `sks`, `smt`, `sks_teori`, `sks_praktik`, `created_at`, `updated_at`, `prodi`) VALUES
(1, 'MKDUIK1101', 'Pendidikan Agama', 2, 1, 2, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(2, 'MKDUIK1102', 'Pendidikan Pancasila', 2, 1, 2, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(3, 'MKDUIK1103', 'Pendidikan Kewarganegaraan', 2, 1, 2, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(4, 'MKFSIK1101', 'Dasar Pemrograman', 4, 1, 2, 2, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(5, 'MKFSIK1102', 'Rekayasa Perangkat Lunak', 3, 1, 3, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(6, 'IK1101', 'Interaksi Manusia dan Komputer', 3, 1, 3, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(7, 'IK1102', 'Aljabar Linier', 3, 1, 3, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(8, 'MKWUIK1204', 'Karakter Mandiri dan Ber-Budaya', 2, 2, 2, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(9, 'MKDUIK1204', 'Bahasa Indonesia', 2, 2, 2, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(10, 'MKFSIK1203', 'Algoritma Pemrograman & Struktur Data', 4, 2, 2, 2, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(11, 'MKFSIK1204', 'Konsep Basis Data', 3, 2, 2, 1, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(12, 'MKFSIK1205', 'Sistem Operasi', 3, 2, 3, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(13, 'IK1201', 'Organisasi dan Arsitektur Komputer', 3, 2, 3, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(14, 'IK1202', 'Logika Matematika', 3, 2, 3, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(15, 'MKFSIK2106', 'Jaringan Komputer', 4, 3, 3, 1, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(16, 'IK2101', 'Pemrograman Berorientasi Objek', 4, 3, 2, 2, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(17, 'IK2102', 'Statistika dan Probabilitas', 3, 3, 3, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(18, 'IK2103', 'Sistem Basis Data', 4, 3, 3, 1, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(19, 'IK2104', 'Kalkulus', 3, 3, 3, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(20, 'IK2105', 'Kompleksitas Algoritma', 3, 3, 3, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(21, 'IK2106', 'Matematika Diskrit', 3, 3, 3, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(22, 'MKWUIK2203', 'Kewirausahaan', 2, 4, 2, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(23, 'IK2201', 'Pemrograman berbasis Web', 4, 4, 2, 2, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(24, 'IK2202', 'Data Science', 3, 4, 2, 1, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(25, 'IK2203', 'Etika Profesi', 2, 4, 2, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(26, 'IK2204', 'Cloud Computing', 3, 4, 3, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(27, 'IK2205', 'Kecerdasan Buatan', 3, 4, 3, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(28, 'IK2206', 'Analisis dan Desain Perangkat Lunak', 3, 4, 3, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(29, 'IK2207', 'Pengolahan Citra Digital', 3, 4, 2, 1, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(30, 'MKWUIK3101', 'Bahasa Inggris', 2, 5, 2, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(31, 'MKFSIK3107', 'Metodologi Tugas Akhir Bidang Komputer', 3, 5, 3, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(32, 'IK3101', 'Pemrograman Mobile', 4, 5, 2, 2, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(33, 'IK3102', 'Manajemen Proyek Teknologi Informasi', 3, 5, 3, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(34, 'IK3103', 'Proyek Perangkat Lunak', 3, 5, 1, 2, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(35, 'IK3104', 'Komputasi Paralel dan Terdistribusi', 3, 5, 3, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(36, 'IK3105', 'Pembelajaran Mesin', 3, 5, 2, 1, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(37, 'IK3106', 'Computational Thinking', 2, 5, 2, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(38, 'IK3107', 'UI/UX Design (Pilihan)', 3, 5, 2, 1, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(39, 'IK3201', 'Web Services', 3, 6, 2, 1, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(40, 'IK3202', 'Keamanan Data dan Informasi', 3, 6, 3, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(41, 'IK3203', 'Internet of Things', 3, 6, 2, 1, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(42, 'IK3204', 'Pemrograman Berbasis Platform', 3, 6, 2, 1, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(43, 'IK3205', 'Big Data', 3, 6, 3, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(44, 'IK3208', 'Penjaminan Kualitas Perangkat Lunak (pilihan)', 2, 6, 2, 0, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(45, 'MKWUIK4102', 'KKN', 3, 7, 0, 3, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(46, 'IK4190', 'Magang', 3, 7, 0, 3, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(47, 'IK4291', 'Tugas Akhir', 6, 8, 0, 6, '2026-01-19 04:58:15', '2026-01-19 04:58:15', 'S1 Informatika'),
(51, 'IK3108', 'Computer Vision (Pilihan)', 3, 5, 3, 0, '2026-01-19 06:43:02', '2026-01-19 06:43:02', 'S1 Informatika'),
(52, 'IK3109', 'Rekayasa Data (Pilihan)', 3, 5, 3, 0, '2026-01-19 06:43:02', '2026-01-19 06:43:02', 'S1 Informatika'),
(53, 'IK3110', 'Logika Fuzzy (Pilihan)', 3, 5, 3, 0, '2026-01-19 06:43:02', '2026-01-19 06:43:02', 'S1 Informatika'),
(54, 'IK3209', 'Pengembangan Perangkat Lunak Scalable (pilihan)', 2, 6, 2, 0, '2026-01-19 06:46:51', '2026-01-19 06:46:51', 'S1 Informatika'),
(55, 'IK3210', 'Natural Language Processing (pilihan)', 3, 6, 3, 0, '2026-01-19 06:46:51', '2026-01-19 06:46:51', 'S1 Informatika'),
(56, 'IK3211', 'Deep Learning (pilihan)', 2, 6, 2, 0, '2026-01-19 06:46:51', '2026-01-19 06:46:51', 'S1 Informatika'),
(57, 'IK3212', 'Sistem Pendukung Keputusan (pilihan)', 2, 6, 2, 0, '2026-01-19 06:46:51', '2026-01-19 06:46:51', 'S1 Informatika'),
(58, 'IK3213', 'Jejaring Semantik (pilihan)', 3, 6, 3, 0, '2026-01-19 06:46:51', '2026-01-19 06:46:51', 'S1 Informatika'),
(62, 'IK3206', 'Web Semantik (pilihan)', 3, 5, 3, 0, '2026-01-19 07:01:55', '2026-01-19 07:01:55', 'S1 Informatika'),
(63, 'IK3207', 'Visualisasi Data (pilihan)', 3, 5, 3, 0, '2026-01-19 07:01:55', '2026-01-19 07:01:55', 'S1 Informatika'),
(125, 'MKDUSI1101', 'Pendidikan Agama', 2, 0, 1, 2, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(126, 'MKDUSI1102', 'Pendidikan Pancasila', 2, 0, 1, 2, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(127, 'MKDUSI1103', 'Pendidikan Kewarganegaraan', 2, 0, 1, 2, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(128, 'SI1101', 'Interaksi Manusia Komputer', 3, 0, 1, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(129, 'SI1102', 'Dasar Pemrograman', 4, 1, 1, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(130, 'SI1103', 'Konsep Sistem Informasi', 3, 0, 1, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(131, 'SI1104', 'Pengantar Teknologi Informasi', 3, 1, 1, 2, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(132, 'MKDUSI1204', 'Bahasa Indonesia', 2, 0, 2, 2, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(133, 'MKWUSI1201', 'Bahasa Inggris', 2, 0, 2, 2, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(134, 'MKFSSI1203', 'Algoritma dan Struktur Data', 4, 1, 2, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(135, 'MKFSSI1204', 'Konsep Basis Data', 3, 1, 2, 2, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(136, 'MKFSSI1205', 'Sistem Operasi', 3, 1, 2, 2, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(137, 'SI1201', 'Sistem Informasi Manajemen', 3, 0, 2, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(138, 'SI1202', 'Pemodelan Proses Bisnis', 3, 0, 2, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(139, 'MKFSSI2106', 'Jaringan Komputer', 4, 1, 3, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(140, 'SI2101', 'Pemrograman Berorientasi Objek', 4, 1, 3, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(141, 'SI2102', 'Statistika dan Probabilitas', 3, 0, 3, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(142, 'SI2103', 'Sistem Basis Data', 4, 1, 3, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(143, 'SI2104', 'Transformasi Digital', 3, 0, 3, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(144, 'SI2105', 'Kepemimpinan dan Manajemen Organisasi', 3, 0, 3, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(145, 'MKFSSI2202', 'Rekayasa Perangkat Lunak', 3, 0, 3, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(146, 'MKWUSI2203', 'Kewirausahaan', 2, 0, 3, 2, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(147, 'SI2201', 'Pemrograman berbasis Web', 4, 1, 4, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(148, 'SI2202', 'Analisis dan Perancangan Sistem Informasi', 3, 1, 4, 2, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(149, 'SI2203', 'Tata Kelola Teknologi Informasi', 3, 0, 4, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(150, 'SI2204', 'Fundamental ERP', 3, 0, 4, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(151, 'SI2205', 'Keamanan Jaringan', 3, 0, 4, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(152, 'SI2206', 'UI/UX Design', 3, 1, 4, 2, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(153, 'MKFSSI3107', 'Metodologi Tugas Akhir Bidang Komputer', 3, 0, 5, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(154, 'SI3101', 'Pemrograman Mobile', 4, 1, 5, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(155, 'SI3102', 'Manajemen Proyek Sistem Informasi', 4, 1, 5, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(156, 'SI3103', 'Proyek Perangkat Lunak', 3, 2, 5, 1, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(157, 'SI3104', 'Etika Profesi dan Profesional', 2, 0, 5, 2, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(158, 'SI3105', 'Computational Thinking', 2, 0, 5, 2, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(159, 'SI3106', 'Big Data', 3, 0, 5, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(160, 'SI3107', 'Data Mining', 3, 1, 5, 2, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(161, 'SI3108', 'Perencanaan Strategis Sistem Informasi', 3, 0, 5, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(162, 'SI3109', 'Manajemen Risiko dan Kontrol Sistem Informasi', 3, 0, 5, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(163, 'SI3201', 'Software Testing dan Quality Assurance', 3, 0, 6, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(164, 'SI3202', 'Audit Sistem Informasi', 3, 0, 6, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(165, 'SI3203', 'Komunikasi dan Negosiasi', 3, 0, 6, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(166, 'SI3204', 'Keamanan Sistem Informasi', 3, 0, 6, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(167, 'SI3205', 'Business Intelligence and Analytics', 3, 1, 6, 2, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(168, 'SI3206', 'Data Visualization', 3, 0, 6, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(169, 'SI3207', 'Pemrograman Berbasis Web Lanjut', 3, 1, 6, 2, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(170, 'SI3208', 'Evaluasi Pengalaman dan Antarmuka Pengguna', 3, 1, 6, 2, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(171, 'SI3209', 'Manajemen Hubungan Pelanggan', 3, 0, 6, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(172, 'SI3210', 'Arsitektur Enterprise', 3, 0, 6, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(173, 'SI3211', 'Manajemen Rantai Pasok', 3, 0, 6, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(174, 'SI3212', 'Kecerdasan Buatan', 3, 0, 6, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(175, 'SI3213', 'e-business', 3, 0, 6, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(176, 'SI3214', 'Manajemen Layanan Teknologi Informasi', 3, 0, 6, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(177, 'SI3215', 'Cloud Computing', 3, 0, 6, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(178, 'SI3216', 'Sistem Pendukung Keputusan', 3, 0, 6, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(179, 'SI3217', 'Startup Digital', 3, 0, 6, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(180, 'SI3218', 'Communication Skill', 3, 0, 6, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(181, 'SI3219', 'Manajemen Proses Bisnis', 3, 0, 6, 3, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(182, 'MKWUSI4102', 'Kuliah Kerja Nyata', 3, 3, 7, 0, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(183, 'SI4190', 'Magang', 3, 3, 7, 0, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi'),
(184, 'SI4291', 'Tugas Akhir', 6, 6, 8, 0, '2026-02-23 23:25:13', '2026-02-23 23:25:13', 'S1 Sistem Informasi');

-- --------------------------------------------------------

--
-- Table structure for table `metode_penilaian`
--

CREATE TABLE `metode_penilaian` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_mk` varchar(255) NOT NULL,
  `kode_cpmk` varchar(255) NOT NULL,
  `kode_sub_cpmk` varchar(255) NOT NULL,
  `mbkm` decimal(5,2) NOT NULL DEFAULT 0.00,
  `kehadiran` decimal(5,2) NOT NULL DEFAULT 0.00,
  `tugas` decimal(5,2) NOT NULL DEFAULT 0.00,
  `quiz` decimal(5,2) NOT NULL DEFAULT 0.00,
  `uts` decimal(5,2) NOT NULL DEFAULT 0.00,
  `uas` decimal(5,2) NOT NULL DEFAULT 0.00,
  `praktik` decimal(5,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prodi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `metode_penilaian`
--

INSERT INTO `metode_penilaian` (`id`, `kode_mk`, `kode_cpmk`, `kode_sub_cpmk`, `mbkm`, `kehadiran`, `tugas`, `quiz`, `uts`, `uas`, `praktik`, `created_at`, `updated_at`, `prodi`) VALUES
(1, 'MKDUIK1101', 'CPMK011', 'Sub-CPMK0111', 0.00, 10.00, 30.00, 10.00, 25.00, 25.00, 0.00, '2026-02-25 00:24:04', '2026-02-25 00:44:22', 'S1 Informatika'),
(2, 'MKDUIK1102', 'CPMK012', 'Sub-CPMK0121', 0.00, 5.00, 15.00, 0.00, 13.00, 0.00, 0.00, '2026-02-25 00:24:04', '2026-02-25 00:43:55', 'S1 Informatika'),
(3, 'MKDUIK1102', 'CPMK012', 'Sub-CPMK0122', 0.00, 5.00, 15.00, 0.00, 12.00, 0.00, 0.00, '2026-02-25 00:24:04', '2026-02-25 00:44:03', 'S1 Informatika'),
(4, 'MKDUIK1102', 'CPMK013', 'Sub-CPMK0131', 0.00, 0.00, 0.00, 10.00, 0.00, 25.00, 0.00, '2026-02-25 00:24:04', '2026-02-25 00:24:04', 'S1 Informatika'),
(5, 'MKDUIK1103', 'CPMK013', 'Sub-CPMK0121', 0.00, 5.00, 15.00, 0.00, 13.00, 0.00, 0.00, '2026-02-25 00:24:04', '2026-02-25 00:24:04', 'S1 Informatika'),
(6, 'MKDUIK1103', 'CPMK013', 'Sub-CPMK0122', 0.00, 5.00, 15.00, 0.00, 12.00, 0.00, 0.00, '2026-02-25 00:24:04', '2026-02-25 00:24:04', 'S1 Informatika'),
(7, 'MKDUIK1103', 'CPMK013', 'Sub-CPMK0131', 0.00, 0.00, 0.00, 10.00, 0.00, 25.00, 0.00, '2026-02-25 00:24:04', '2026-02-25 00:24:04', 'S1 Informatika'),
(8, 'MKFSIK1101', 'CPMK042', 'Sub-CPMK0421', 0.00, 4.00, 7.00, 0.00, 9.00, 9.00, 7.00, '2026-02-25 00:24:04', '2026-02-25 00:24:04', 'S1 Informatika'),
(9, 'MKFSIK1101', 'CPMK042', 'Sub-CPMK0422', 0.00, 3.00, 7.00, 0.00, 8.00, 8.00, 7.00, '2026-02-25 00:24:04', '2026-02-25 00:24:04', 'S1 Informatika'),
(10, 'MKFSIK1101', 'CPMK042', 'Sub-CPMK0423', 0.00, 3.00, 6.00, 0.00, 8.00, 8.00, 6.00, '2026-02-25 00:24:04', '2026-02-25 00:24:04', 'S1 Informatika'),
(11, 'MKFSIK1102', 'CPMK051', 'Sub-CPMK0511', 0.00, 10.00, 0.00, 10.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:04', '2026-02-25 00:24:04', 'S1 Informatika'),
(12, 'MKFSIK1102', 'CPMK091', 'Sub-CPMK911', 0.00, 0.00, 30.00, 0.00, 0.00, 25.00, 0.00, '2026-02-25 00:24:04', '2026-02-25 00:24:04', 'S1 Informatika'),
(13, 'IK1101', 'CPMK091', 'Sub-CPMK0912', 0.00, 10.00, 0.00, 0.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:04', '2026-02-25 00:24:04', 'S1 Informatika'),
(14, 'IK1101', 'CPMK092', 'Sub-CPMK0923', 0.00, 0.00, 0.00, 10.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:04', '2026-02-25 00:24:04', 'S1 Informatika'),
(15, 'IK1101', 'CPMK093', 'Sub-CPMK0932', 0.00, 0.00, 30.00, 0.00, 0.00, 25.00, 0.00, '2026-02-25 00:24:04', '2026-02-25 00:24:04', 'S1 Informatika'),
(16, 'IK1102', 'CPMK041', 'Sub-CPMK0411', 0.00, 5.00, 15.00, 5.00, 13.00, 13.00, 0.00, '2026-02-25 00:24:04', '2026-02-25 00:24:04', 'S1 Informatika'),
(17, 'IK1102', 'CPMK041', 'Sub-CPMK0412', 0.00, 5.00, 15.00, 5.00, 12.00, 12.00, 0.00, '2026-02-25 00:24:04', '2026-02-25 00:24:04', 'S1 Informatika'),
(18, 'MKWUIK1204', 'CPMK013', 'Sub-CPMK0131', 0.00, 5.00, 10.00, 13.00, 13.00, 10.00, 0.00, '2026-02-25 00:24:04', '2026-02-25 00:24:04', 'S1 Informatika'),
(19, 'MKWUIK1204', 'CPMK013', 'Sub-CPMK0132', 0.00, 5.00, 10.00, 12.00, 12.00, 10.00, 0.00, '2026-02-25 00:24:04', '2026-02-25 00:24:04', 'S1 Informatika'),
(20, 'MKDUIK1204', 'CPMK063', 'Sub-CPMK0631', 0.00, 4.00, 7.00, 7.00, 9.00, 9.00, 0.00, '2026-02-25 00:24:04', '2026-02-25 00:24:04', 'S1 Informatika'),
(21, 'MKDUIK1204', 'CPMK063', 'Sub-CPMK0632', 0.00, 3.00, 7.00, 7.00, 8.00, 8.00, 0.00, '2026-02-25 00:24:04', '2026-02-25 00:24:04', 'S1 Informatika'),
(22, 'MKDUIK1204', 'CPMK063', 'Sub-CPMK0633', 0.00, 3.00, 6.00, 6.00, 8.00, 8.00, 0.00, '2026-02-25 00:24:04', '2026-02-25 00:24:04', 'S1 Informatika'),
(23, 'MKFSIK1203', 'CPMK084', 'Sub-CPMK0841', 0.00, 3.00, 4.00, 3.00, 7.00, 7.00, 4.00, '2026-02-25 00:24:04', '2026-02-25 00:24:04', 'S1 Informatika'),
(24, 'MKFSIK1203', 'CPMK084', 'Sub-CPMK0842', 0.00, 3.00, 4.00, 3.00, 6.00, 6.00, 4.00, '2026-02-25 00:24:04', '2026-02-25 00:24:04', 'S1 Informatika'),
(25, 'MKFSIK1203', 'CPMK084', 'Sub-CPMK0843', 0.00, 2.00, 4.00, 2.00, 6.00, 6.00, 4.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(26, 'MKFSIK1203', 'CPMK084', 'Sub-CPMK0844', 0.00, 2.00, 3.00, 2.00, 6.00, 6.00, 3.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(27, 'MKFSIK1204', 'CPMK051', 'Sub-CPMK0513', 0.00, 3.00, 4.00, 3.00, 7.00, 7.00, 4.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(28, 'MKFSIK1204', 'CPMK051', 'Sub-CPMK0514', 0.00, 3.00, 4.00, 3.00, 6.00, 6.00, 4.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(29, 'MKFSIK1204', 'CPMK051', 'Sub-CPMK0515', 0.00, 2.00, 4.00, 2.00, 6.00, 6.00, 4.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(30, 'MKFSIK1204', 'CPMK051', 'Sub-CPMK0516', 0.00, 2.00, 3.00, 2.00, 6.00, 6.00, 3.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(31, 'MKFSIK1205', 'CPMK031', 'Sub-CPMK0311', 0.00, 4.00, 0.00, 4.00, 9.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(32, 'MKFSIK1205', 'CPMK031', 'Sub-CPMK0312', 0.00, 3.00, 0.00, 3.00, 8.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(33, 'MKFSIK1205', 'CPMK031', 'Sub-CPMK0313', 0.00, 3.00, 0.00, 3.00, 8.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(34, 'MKFSIK1205', 'CPMK052', 'Sub-CPMK0524', 0.00, 0.00, 5.00, 0.00, 0.00, 9.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(35, 'MKFSIK1205', 'CPMK052', 'Sub-CPMK0525', 0.00, 0.00, 5.00, 0.00, 0.00, 8.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(36, 'MKFSIK1205', 'CPMK052', 'Sub-CPMK0526', 0.00, 0.00, 5.00, 0.00, 0.00, 8.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(37, 'IK1201', 'CPMK031', 'Sub-CPMK0314', 0.00, 4.00, 10.00, 0.00, 9.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(38, 'IK1201', 'CPMK031', 'Sub-CPMK0315', 0.00, 3.00, 10.00, 0.00, 8.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(39, 'IK1201', 'CPMK031', 'Sub-CPMK0316', 0.00, 3.00, 10.00, 0.00, 8.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(40, 'IK1201', 'CPMK052', 'Sub-CPMK0527', 0.00, 0.00, 0.00, 5.00, 0.00, 13.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(41, 'IK1201', 'CPMK052', 'Sub-CPMK0528', 0.00, 0.00, 0.00, 5.00, 0.00, 12.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(42, 'IK1202', 'CPMK041', 'Sub-CPMK0413', 0.00, 0.00, 15.00, 10.00, 0.00, 25.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(43, 'IK1202', 'CPMK052', 'Sub-CPMK0529', 0.00, 10.00, 15.00, 0.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(44, 'MKFSIK2106', 'CPMK031', 'Sub-CPMK0317', 0.00, 4.00, 5.00, 4.00, 9.00, 5.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(45, 'MKFSIK2106', 'CPMK031', 'Sub-CPMK0318', 0.00, 3.00, 5.00, 3.00, 8.00, 15.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:42:43', 'S1 Informatika'),
(46, 'MKFSIK2106', 'CPMK031', 'Sub-CPMK0319', 0.00, 3.00, 5.00, 3.00, 8.00, 5.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(47, 'IK2101', 'CPMK081', 'Sub-CPMK0812', 0.00, 0.00, 0.00, 10.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(48, 'IK2101', 'CPMK084', 'Sub-CPMK0845', 0.00, 5.00, 8.00, 0.00, 0.00, 15.00, 8.00, '2026-02-25 00:24:05', '2026-02-25 00:30:18', 'S1 Informatika'),
(49, 'IK2101', 'CPMK084', 'Sub-CPMK0846', 0.00, 5.00, 7.00, 0.00, 0.00, 10.00, 7.00, '2026-02-25 00:24:05', '2026-02-25 00:30:26', 'S1 Informatika'),
(50, 'IK2102', 'CPMK041', 'Sub-CPMK0414', 0.00, 10.00, 0.00, 10.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(51, 'IK2102', 'CPMK052', 'Sub-CPMK05210', 0.00, 0.00, 15.00, 0.00, 0.00, 25.00, 15.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(52, 'IK2103', 'CPMK051', 'Sub-CPMK0517', 0.00, 0.00, 0.00, 4.00, 9.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(53, 'IK2103', 'CPMK051', 'Sub-CPMK0518', 0.00, 0.00, 0.00, 3.00, 8.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(54, 'IK2103', 'CPMK051', 'Sub-CPMK0519', 0.00, 0.00, 0.00, 3.00, 8.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(55, 'IK2103', 'CPMK121', 'Sub-CPMK1211', 0.00, 4.00, 5.00, 0.00, 0.00, 9.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(56, 'IK2103', 'CPMK121', 'Sub-CPMK1212', 0.00, 3.00, 5.00, 0.00, 0.00, 8.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(57, 'IK2103', 'CPMK121', 'Sub-CPMK1213', 0.00, 3.00, 5.00, 0.00, 0.00, 8.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(58, 'IK2104', 'CPMK041', 'Sub-CPMK0415', 0.00, 10.00, 0.00, 10.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(59, 'IK2104', 'CPMK052', 'Sub-CPMK05211', 0.00, 0.00, 30.00, 0.00, 0.00, 25.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(60, 'IK2105', 'CPMK042', 'Sub-CPMK0424', 0.00, 0.00, 0.00, 5.00, 13.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(61, 'IK2105', 'CPMK042', 'Sub-CPMK0425', 0.00, 0.00, 0.00, 5.00, 12.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(62, 'IK2105', 'CPMK081', 'Sub-CPMK0813', 0.00, 5.00, 15.00, 0.00, 0.00, 15.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(63, 'IK2105', 'CPMK081', 'Sub-CPMK0814', 0.00, 5.00, 15.00, 0.00, 0.00, 10.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:35:14', 'S1 Informatika'),
(64, 'IK2106', 'CPMK041', 'Sub-CPMK0416', 0.00, 10.00, 0.00, 0.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(65, 'IK2106', 'CPMK052', 'Sub-CPMK05211', 0.00, 0.00, 30.00, 10.00, 0.00, 25.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(66, 'MKWUIK2203', 'CPMK023', 'Sub-CPMK0231', 0.00, 10.00, 30.00, 0.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(67, 'MKWUIK2203', 'CPMK024', 'Sub-CPMK0241', 0.00, 0.00, 0.00, 10.00, 0.00, 25.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(68, 'IK2201', 'CPMK084', 'Sub-CPMK0847', 0.00, 10.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(69, 'IK2201', 'CPMK092', 'Sub-CPMK0925', 0.00, 0.00, 15.00, 10.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(70, 'IK2201', 'CPMK102', 'Sub-CPMK1022', 0.00, 0.00, 0.00, 0.00, 13.00, 13.00, 8.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(71, 'IK2201', 'CPMK102', 'Sub-CPMK1023', 0.00, 0.00, 0.00, 0.00, 12.00, 12.00, 7.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(72, 'IK2202', 'CPMK084', 'Sub-CPMK0848', 0.00, 0.00, 0.00, 4.00, 9.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(73, 'IK2202', 'CPMK084', 'Sub-CPMK0849', 0.00, 0.00, 0.00, 3.00, 8.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(74, 'IK2202', 'CPMK084', 'Sub-CPMK08410', 0.00, 0.00, 0.00, 3.00, 8.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(75, 'IK2202', 'CPMK121', 'Sub-CPMK1214', 0.00, 4.00, 5.00, 0.00, 0.00, 9.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(76, 'IK2202', 'CPMK121', 'Sub-CPMK1215', 0.00, 3.00, 5.00, 0.00, 0.00, 8.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(77, 'IK2202', 'CPMK121', 'Sub-CPMK1216', 0.00, 3.00, 5.00, 0.00, 0.00, 8.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(78, 'IK2203', 'CPMK121', 'Sub-CPMK0211', 0.00, 10.00, 0.00, 10.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(79, 'IK2203', 'CPMK023', 'Sub-CPMK0231', 0.00, 0.00, 0.00, 0.00, 0.00, 25.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(80, 'IK2203', 'CPMK024', 'Sub-CPMK0242', 0.00, 0.00, 30.00, 0.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(81, 'IK2204', 'CPMK043', 'Sub-CPMK0432', 0.00, 5.00, 5.00, 4.00, 9.00, 9.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(82, 'IK2204', 'CPMK043', 'Sub-CPMK0433', 0.00, 5.00, 5.00, 3.00, 8.00, 8.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(83, 'IK2204', 'CPMK043', 'Sub-CPMK0434', 0.00, 0.00, 5.00, 3.00, 8.00, 8.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:36:05', 'S1 Informatika'),
(84, 'IK2205', 'CPMK032', 'Sub-CPMK0321', 0.00, 0.00, 0.00, 10.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(85, 'IK2205', 'CPMK082', 'Sub-CPMK0825', 0.00, 0.00, 30.00, 0.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(86, 'IK2205', 'CPMK111', 'Sub-CPMK1111', 0.00, 5.00, 0.00, 0.00, 0.00, 13.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(87, 'IK2205', 'CPMK111', 'Sub-CPMK1112', 0.00, 5.00, 0.00, 0.00, 0.00, 12.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(88, 'IK2206', 'CPMK051', 'Sub-CPMK05110', 0.00, 0.00, 0.00, 10.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(89, 'IK2206', 'CPMK081', 'Sub-CPMK0815', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(90, 'IK2206', 'CPMK091', 'Sub-CPMK0913', 0.00, 0.00, 0.00, 0.00, 0.00, 25.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(91, 'IK2206', 'CPMK092', 'Sub-CPMK0926', 0.00, 10.00, 0.00, 0.00, 0.00, 0.00, 15.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(92, 'IK2206', 'CPMK093', 'Sub-CPMK0933', 0.00, 0.00, 15.00, 0.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(93, 'IK2206', 'CPMK101', 'Sub-CPMK1012', 0.00, 0.00, 0.00, 0.00, 0.00, 25.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(94, 'IK2207', 'CPMK044', 'Sub-CPMK0441', 0.00, 5.00, 0.00, 5.00, 10.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(95, 'IK2207', 'CPMK044', 'Sub-CPMK0442', 0.00, 5.00, 0.00, 5.00, 15.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(96, 'IK2207', 'CPMK112', 'Sub-CPMK1121', 0.00, 0.00, 5.00, 0.00, 0.00, 10.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(97, 'IK2207', 'CPMK112', 'Sub-CPMK1122', 0.00, 0.00, 5.00, 0.00, 0.00, 5.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(98, 'IK2207', 'CPMK112', 'Sub-CPMK1123', 0.00, 0.00, 5.00, 0.00, 0.00, 10.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(99, 'MKWUIK3101', 'CPMK063', 'Sub-CPMK0634', 0.00, 4.00, 10.00, 3.00, 10.00, 10.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(100, 'MKWUIK3101', 'CPMK063', 'Sub-CPMK0635', 0.00, 3.00, 10.00, 4.00, 10.00, 10.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(101, 'MKWUIK3101', 'CPMK063', 'Sub-CPMK0636', 0.00, 3.00, 10.00, 3.00, 5.00, 5.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(102, 'MKFSIK3107', 'CPMK063', 'Sub-CPMK0637', 0.00, 10.00, 0.00, 10.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(103, 'MKFSIK3107', 'CPMK072', 'Sub-CPMK0721', 0.00, 0.00, 30.00, 0.00, 0.00, 25.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(104, 'IK3101', 'CPMK042', 'Sub-CPMK0426', 0.00, 0.00, 0.00, 10.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(105, 'IK3101', 'CPMK051', 'Sub-CPMK05111', 0.00, 0.00, 0.00, 0.00, 10.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(106, 'IK3101', 'CPMK051', 'Sub-CPMK05112', 0.00, 0.00, 0.00, 0.00, 5.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(107, 'IK3101', 'CPMK051', 'Sub-CPMK05113', 0.00, 0.00, 0.00, 0.00, 10.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(108, 'IK3101', 'CPMK102', 'Sub-CPMK1024', 0.00, 3.00, 5.00, 0.00, 0.00, 10.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(109, 'IK3101', 'CPMK102', 'Sub-CPMK1025', 0.00, 3.00, 5.00, 0.00, 0.00, 5.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(110, 'IK3101', 'CPMK102', 'Sub-CPMK1026', 0.00, 4.00, 5.00, 0.00, 0.00, 10.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(111, 'IK3102', 'CPMK051', 'Sub-CPMK05117', 0.00, 10.00, 0.00, 0.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(112, 'IK3102', 'CPMK061', 'Sub-CPMK0612', 0.00, 0.00, 0.00, 0.00, 0.00, 25.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(113, 'IK3102', 'CPMK062', 'Sub-CPMK0621', 0.00, 0.00, 0.00, 10.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(114, 'IK3102', 'CPMK063', 'Sub-CPMK0638', 0.00, 0.00, 30.00, 0.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(115, 'IK3103', 'CPMK022', 'Sub-CPMK0222', 0.00, 0.00, 0.00, 10.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(116, 'IK3103', 'CPMK024', 'Sub-CPMK0244', 0.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(117, 'IK3103', 'CPMK063', 'Sub-CPMK0639', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 15.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(118, 'IK3103', 'CPMK081', 'Sub-CPMK0816', 0.00, 10.00, 15.00, 0.00, 0.00, 25.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(119, 'IK3104', 'CPMK044', 'Sub-CPMK0444', 0.00, 4.00, 10.00, 3.00, 10.00, 10.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(120, 'IK3104', 'CPMK044', 'Sub-CPMK0445', 0.00, 3.00, 10.00, 3.00, 5.00, 5.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(121, 'IK3104', 'CPMK044', 'Sub-CPMK0446', 0.00, 3.00, 10.00, 4.00, 10.00, 10.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(122, 'IK3105', 'CPMK032', 'Sub-CPMK0324', 0.00, 4.00, 0.00, 4.00, 10.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(123, 'IK3105', 'CPMK032', 'Sub-CPMK0325', 0.00, 3.00, 0.00, 3.00, 10.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(124, 'IK3105', 'CPMK032', 'Sub-CPMK0326', 0.00, 3.00, 0.00, 3.00, 5.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(125, 'IK3105', 'CPMK112', 'Sub-CPMK1123', 0.00, 0.00, 15.00, 0.00, 0.00, 10.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(126, 'IK3105', 'CPMK112', 'Sub-CPMK1124', 0.00, 0.00, 15.00, 0.00, 0.00, 15.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(127, 'IK3201', 'CPMK051', 'Sub-CPMK05114', 0.00, 0.00, 0.00, 3.00, 5.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(128, 'IK3201', 'CPMK051', 'Sub-CPMK05115', 0.00, 0.00, 0.00, 3.00, 10.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(129, 'IK3201', 'CPMK051', 'Sub-CPMK05116', 0.00, 0.00, 0.00, 4.00, 10.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(130, 'IK3201', 'CPMK102', 'Sub-CPMK1027', 0.00, 5.00, 5.00, 0.00, 0.00, 10.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(131, 'IK3201', 'CPMK102', 'Sub-CPMK1028', 0.00, 5.00, 5.00, 0.00, 0.00, 10.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(132, 'IK3201', 'CPMK102', 'Sub-CPMK1029', 0.00, 0.00, 5.00, 0.00, 0.00, 5.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:38:09', 'S1 Informatika'),
(133, 'IK3202', 'CPMK044', 'Sub-CPMK0447', 0.00, 0.00, 0.00, 10.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(134, 'IK3202', 'CPMK122', 'Sub-CPMK1221', 0.00, 0.00, 15.00, 0.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(135, 'IK3202', 'CPMK123', 'Sub-CPMK1233', 0.00, 10.00, 0.00, 0.00, 0.00, 25.00, 15.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(136, 'IK3203', 'CPMK032', 'Sub-CPMK0327', 0.00, 5.00, 0.00, 5.00, 10.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(137, 'IK3203', 'CPMK032', 'Sub-CPMK0328', 0.00, 5.00, 0.00, 5.00, 15.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(138, 'IK3203', 'CPMK083', 'Sub-CPMK0836', 0.00, 0.00, 10.00, 0.00, 0.00, 10.00, 10.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(139, 'IK3203', 'CPMK083', 'Sub-CPMK0837', 0.00, 0.00, 5.00, 0.00, 0.00, 15.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(140, 'IK3204', 'CPMK042', 'Sub-CPMK0427', 0.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(141, 'IK3204', 'CPMK101', 'Sub-CPMK1013', 0.00, 0.00, 0.00, 10.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(142, 'IK3204', 'CPMK102', 'Sub-CPMK10210', 0.00, 10.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(143, 'IK3204', 'CPMK103', 'Sub-CPMK1033', 0.00, 0.00, 10.00, 0.00, 0.00, 10.00, 10.00, '2026-02-25 00:24:05', '2026-02-25 00:39:11', 'S1 Informatika'),
(144, 'IK3204', 'CPMK103', 'Sub-CPMK1034', 0.00, 0.00, 5.00, 0.00, 0.00, 15.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:39:23', 'S1 Informatika'),
(145, 'IK3205', 'CPMK043', 'Sub-CPMK0435', 0.00, 0.00, 0.00, 10.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(146, 'IK3205', 'CPMK082', 'Sub-CPMK0828', 0.00, 10.00, 0.00, 0.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(147, 'IK3205', 'CPMK111', 'Sub-CPMK1116', 0.00, 0.00, 15.00, 0.00, 0.00, 25.00, 15.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(149, 'IK3206', 'CPMK101', 'Sub-CPMK1014', 0.00, 5.00, 0.00, 5.00, 10.00, 0.00, 10.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(150, 'IK3206', 'CPMK101', 'Sub-CPMK1015', 0.00, 5.00, 0.00, 5.00, 15.00, 0.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(151, 'IK3206', 'CPMK121', 'Sub-CPMK1217', 0.00, 0.00, 10.00, 0.00, 0.00, 10.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(152, 'IK3206', 'CPMK121', 'Sub-CPMK1218', 0.00, 0.00, 5.00, 0.00, 0.00, 15.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(153, 'IK3207', 'CPMK091', 'Sub-CPMK0914', 0.00, 0.00, 0.00, 5.00, 10.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(154, 'IK3207', 'CPMK091', 'Sub-CPMK0915', 0.00, 0.00, 0.00, 5.00, 15.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(155, 'IK3207', 'CPMK121', 'Sub-CPMK1219', 0.00, 5.00, 10.00, 0.00, 0.00, 10.00, 15.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(156, 'IK3207', 'CPMK121', 'Sub-CPMK1210', 0.00, 5.00, 5.00, 0.00, 0.00, 15.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(157, 'IK3208', 'CPMK093', 'Sub-CPMK0934', 0.00, 5.00, 0.00, 5.00, 10.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(158, 'IK3208', 'CPMK093', 'Sub-CPMK0935', 0.00, 5.00, 0.00, 5.00, 15.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(159, 'IK3208', 'CPMK122', 'Sub-CPMK1223', 0.00, 0.00, 15.00, 0.00, 0.00, 25.00, 15.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(160, 'IK3209', 'CPMK103', 'Sub-CPMK1035', 0.00, 0.00, 0.00, 10.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(161, 'IK3209', 'CPMK113', 'Sub-CPMK1133', 0.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(162, 'IK3209', 'CPMK122', 'Sub-CPMK1224', 0.00, 0.00, 0.00, 0.00, 0.00, 25.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(163, 'IK3209', 'CPMK123', 'Sub-CPMK1236', 0.00, 10.00, 15.00, 0.00, 0.00, 0.00, 15.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(164, 'IK3109', 'CPMK082', 'Sub-CPMK0829', 0.00, 0.00, 0.00, 10.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(165, 'IK3109', 'CPMK121', 'Sub-CPMK1211', 0.00, 5.00, 10.00, 0.00, 0.00, 10.00, 10.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(166, 'IK3109', 'CPMK121', 'Sub-CPMK1212', 0.00, 5.00, 5.00, 0.00, 0.00, 15.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:37:23', 'S1 Informatika'),
(167, 'IK3107', 'CPMK091', 'Sub-CPMK0916', 0.00, 5.00, 0.00, 5.00, 10.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(168, 'IK3107', 'CPMK091', 'Sub-CPMK0917', 0.00, 5.00, 0.00, 5.00, 15.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(169, 'IK3107', 'CPMK092', 'Sub-CPMK0927', 0.00, 0.00, 10.00, 0.00, 0.00, 15.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(170, 'IK3107', 'CPMK092', 'Sub-CPMK0928', 0.00, 0.00, 5.00, 0.00, 0.00, 10.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(171, 'IK3107', 'CPMK093', 'Sub-CPMK0936', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 15.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(172, 'IK3210', 'CPMK032', 'Sub-CPMK0329', 0.00, 10.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(173, 'IK3210', 'CPMK044', 'Sub-CPMK04410', 0.00, 0.00, 0.00, 5.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(174, 'IK3210', 'CPMK044', 'Sub-CPMK04411', 0.00, 0.00, 0.00, 5.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(175, 'IK3210', 'CPMK083', 'Sub-CPMK0838', 0.00, 0.00, 0.00, 0.00, 10.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(176, 'IK3210', 'CPMK083', 'Sub-CPMK0839', 0.00, 0.00, 0.00, 0.00, 15.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(177, 'IK3210', 'CPMK111', 'Sub-CPMK1117', 0.00, 0.00, 10.00, 0.00, 0.00, 10.00, 10.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(178, 'IK3210', 'CPMK111', 'Sub-CPMK1118', 0.00, 0.00, 5.00, 0.00, 0.00, 15.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(179, 'IK3211', 'CPMK032', 'Sub-CPMK03210', 0.00, 10.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(180, 'IK3211', 'CPMK044', 'Sub-CPMK04412', 0.00, 0.00, 0.00, 5.00, 10.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(181, 'IK3211', 'CPMK044', 'Sub-CPMK04413', 0.00, 0.00, 0.00, 5.00, 15.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(182, 'IK3211', 'CPMK083', 'Sub-CPMK08310', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(183, 'IK3211', 'CPMK084', 'Sub-CPMK08412', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 15.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(184, 'IK3211', 'CPMK112', 'Sub-CPMK1125', 0.00, 0.00, 0.00, 0.00, 0.00, 10.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(185, 'IK3211', 'CPMK112', 'Sub-CPMK1126', 0.00, 0.00, 0.00, 0.00, 0.00, 15.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(186, 'IK3211', 'CPMK113', 'Sub-CPMK1134', 0.00, 0.00, 15.00, 0.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(187, 'IK3212', 'CPMK043', 'Sub-CPMK0436', 0.00, 0.00, 0.00, 10.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(188, 'IK3212', 'CPMK082', 'Sub-CPMK08210', 0.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(189, 'IK3212', 'CPMK111', 'Sub-CPMK11110', 0.00, 10.00, 15.00, 0.00, 0.00, 25.00, 15.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(190, 'IK3110', 'CPMK043', 'Sub-CPMK0437', 0.00, 0.00, 0.00, 10.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(191, 'IK3110', 'CPMK083', 'Sub-CPMK08311', 0.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(192, 'IK3110', 'CPMK112', 'Sub-CPMK1127', 0.00, 4.00, 5.00, 0.00, 0.00, 10.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(193, 'IK3110', 'CPMK112', 'Sub-CPMK1128', 0.00, 3.00, 5.00, 0.00, 0.00, 10.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(194, 'IK3110', 'CPMK112', 'Sub-CPMK1129', 0.00, 3.00, 5.00, 0.00, 0.00, 5.00, 5.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(195, 'IK3108', 'CPMK112', 'Sub-CPMK11210', 0.00, 5.00, 0.00, 5.00, 10.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(196, 'IK3108', 'CPMK112', 'Sub-CPMK11211', 0.00, 5.00, 0.00, 5.00, 15.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(197, 'IK3108', 'CPMK113', 'Sub-CPMK1135', 0.00, 0.00, 15.00, 0.00, 0.00, 25.00, 15.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(198, 'IK3213', 'CPMK081', 'Sub-CPMK0817', 0.00, 0.00, 0.00, 10.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(199, 'IK3213', 'CPMK082', 'Sub-CPMK08211', 0.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(200, 'IK3213', 'CPMK083', 'Sub-CPMK08312', 0.00, 0.00, 15.00, 0.00, 0.00, 25.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(201, 'IK3213', 'CPMK084', 'Sub-CPMK08413', 0.00, 10.00, 0.00, 0.00, 0.00, 0.00, 15.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(202, 'MKWUIK4102', 'CPMK052', 'Sub-CPMK05212', 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(203, 'MKWUIK4102', 'CPMK061', 'Sub-CPMK0611', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(204, 'IK4190', 'CPMK052', 'Sub-CPMK05213', 0.00, 40.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(205, 'IK4190', 'CPMK061', 'Sub-CPMK0611', 0.00, 0.00, 20.00, 0.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(206, 'IK4190', 'CPMK062', 'Sub-CPMK0623', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 40.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(207, 'IK4291', 'CPMK063', 'Sub-CPMK06310', 0.00, 40.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(208, 'IK4291', 'CPMK071', 'Sub-CPMK0711', 0.00, 0.00, 20.00, 0.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(209, 'IK4291', 'CPMK072', 'Sub-CPMK0726', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(210, 'IK4291', 'CPMK072', 'Sub-CPMK0721', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(211, 'IK3106', 'CPMK032', 'Sub-CPMK03211', 0.00, 10.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(212, 'IK3106', 'CPMK137', 'Sub-CPMK1371', 0.00, 0.00, 0.00, 10.00, 25.00, 0.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika'),
(213, 'IK3106', 'CPMK138', 'Sub-CPMK1381', 0.00, 0.00, 30.00, 0.00, 0.00, 25.00, 0.00, '2026-02-25 00:24:05', '2026-02-25 00:24:05', 'S1 Informatika');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_01_19_043335_add_two_factor_columns_to_users_table', 1),
(5, '2026_01_19_043425_create_personal_access_tokens_table', 1),
(6, '2026_01_19_043838_create_cpl_prodi_table', 2),
(7, '2026_01_19_043847_create_profil_lulusan_table', 2),
(8, '2026_01_19_043854_create_cpl_pl_table', 2),
(9, '2026_01_19_043901_create_bahan_kajian_table', 2),
(10, '2026_01_19_043908_create_cpl_bk_table', 2),
(11, '2026_01_19_043918_create_mata_kuliah_table', 2),
(12, '2026_01_19_043926_create_bk_mk_table', 2),
(13, '2026_01_19_044018_create_cpl_bk_mk_table', 2),
(14, '2026_01_19_044026_create_organisasi_mk_table', 2),
(15, '2026_01_19_044032_create_cpl_mk_table', 2),
(16, '2026_01_19_044038_create_cpmk_table', 2),
(17, '2026_01_19_044044_create_cpl_cpmk_table', 2),
(18, '2026_01_19_044051_create_pemetaan_mk_cpl_cpmk_table', 2),
(19, '2026_01_19_044058_create_sub_cpmk_table', 2),
(20, '2026_01_19_044104_create_relasi_capaian_table', 2),
(21, '2026_01_19_044111_create_metode_penilaian_table', 2),
(22, '2026_01_20_062810_create_mahasiswas_table', 3),
(23, '2026_01_20_062819_create_krs_table', 4),
(25, '2026_01_20_073123_add_nilai_to_krs_table', 5),
(26, '2026_01_20_074355_change_foreign_key_on_krs_table', 6),
(27, '2026_01_20_074552_fix_krs_foreign_key', 6),
(28, '2026_02_03_013428_create_dosen_profils_table', 7),
(30, '2026_02_03_044436_create_portofolios_table', 8),
(31, '2026_02_03_044445_create_portofolio_details_table', 8),
(32, '2026_02_18_065009_create_fakultas_table', 9),
(33, '2026_02_18_065016_create_prodi_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `organisasi_mk`
--

CREATE TABLE `organisasi_mk` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_mk` varchar(255) NOT NULL,
  `kategori` enum('MKWU','MKDU','MKFS','IK','MKP') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prodi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organisasi_mk`
--

INSERT INTO `organisasi_mk` (`id`, `kode_mk`, `kategori`, `created_at`, `updated_at`, `prodi`) VALUES
(1, 'MKWUIK1204', 'MKWU', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(2, 'MKWUIK2203', 'MKWU', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(3, 'MKWUIK3101', 'MKWU', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(4, 'MKWUIK4102', 'MKWU', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(5, 'MKDUIK1101', 'MKDU', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(6, 'MKDUIK1102', 'MKDU', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(7, 'MKDUIK1103', 'MKDU', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(8, 'MKDUIK1204', 'MKDU', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(9, 'MKFSIK1101', 'MKFS', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(10, 'MKFSIK1102', 'MKFS', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(11, 'MKFSIK1203', 'MKFS', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(12, 'MKFSIK1204', 'MKFS', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(13, 'MKFSIK1205', 'MKFS', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(14, 'MKFSIK2106', 'MKFS', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(15, 'MKFSIK3107', 'MKFS', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(16, 'IK3107', 'MKP', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(17, 'IK3108', 'MKP', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(18, 'IK3109', 'MKP', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(19, 'IK3110', 'MKP', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(20, 'IK3206', 'MKP', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(21, 'IK3207', 'MKP', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(22, 'IK3208', 'MKP', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(23, 'IK3209', 'MKP', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(24, 'IK3210', 'MKP', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(25, 'IK3211', 'MKP', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(26, 'IK3212', 'MKP', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(27, 'IK3213', 'MKP', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(28, 'IK1101', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(29, 'IK1102', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(30, 'IK1201', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(31, 'IK1202', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(32, 'IK2101', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(33, 'IK2102', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(34, 'IK2103', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(35, 'IK2104', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(36, 'IK2105', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(37, 'IK2106', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(38, 'IK2201', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(39, 'IK2202', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(40, 'IK2203', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(41, 'IK2204', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(42, 'IK2205', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(43, 'IK2206', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(44, 'IK2207', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(45, 'IK3101', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(46, 'IK3102', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(47, 'IK3103', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(48, 'IK3104', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(49, 'IK3105', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(50, 'IK3106', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(51, 'IK3201', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(52, 'IK3202', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(53, 'IK3203', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(54, 'IK3204', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(55, 'IK3205', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(56, 'IK4190', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika'),
(57, 'IK4291', '', '2026-01-19 07:05:45', '2026-01-19 07:05:45', 'S1 Informatika');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('imamahmadashari@uhb.ac.id', '$2y$12$/kvTd3RkL4BVc39v0SZeO.mGxFZYAf/PKcLFu74tExhQlak22vwky', '2026-02-17 00:47:41');

-- --------------------------------------------------------

--
-- Table structure for table `pemetaan_mk_cpl_cpmk`
--

CREATE TABLE `pemetaan_mk_cpl_cpmk` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_mk` varchar(255) NOT NULL,
  `kode_cpl` varchar(255) NOT NULL,
  `kode_cpmk` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prodi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pemetaan_mk_cpl_cpmk`
--

INSERT INTO `pemetaan_mk_cpl_cpmk` (`id`, `kode_mk`, `kode_cpl`, `kode_cpmk`, `created_at`, `updated_at`, `prodi`) VALUES
(1, 'MKDUIK1101', 'CPL01', 'CPMK011', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(2, 'MKDUIK1102', 'CPL01', 'CPMK012', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(3, 'MKDUIK1102', 'CPL01', 'CPMK013', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(4, 'MKDUIK1103', 'CPL01', 'CPMK012', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(5, 'MKDUIK1103', 'CPL01', 'CPMK013', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(6, 'MKFSIK1101', 'CPL04', 'CPMK042', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(7, 'MKFSIK1102', 'CPL05', 'CPMK051', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(8, 'MKFSIK1102', 'CPL09', 'CPMK091', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(9, 'IK1101', 'CPL09', 'CPMK091', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(10, 'IK1101', 'CPL09', 'CPMK092', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(11, 'IK1101', 'CPL09', 'CPMK093', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(12, 'IK1102', 'CPL04', 'CPMK041', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(13, 'MKWUIK1204', 'CPL01', 'CPMK013', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(14, 'MKWUIK1204', 'CPL13', 'CPMK131', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(15, 'MKWUIK1204', 'CPL13', 'CPMK132', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(16, 'MKDUIK1204', 'CPL06', 'CPMK063', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(17, 'MKFSIK1203', 'CPL08', 'CPMK084', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(18, 'MKFSIK1204', 'CPL04', 'CPMK043', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(19, 'MKFSIK1204', 'CPL05', 'CPMK051', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(20, 'MKFSIK1205', 'CPL03', 'CPMK031', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(21, 'MKFSIK1205', 'CPL05', 'CPMK052', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(22, 'IK1201', 'CPL03', 'CPMK031', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(23, 'IK1201', 'CPL05', 'CPMK052', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(24, 'IK1202', 'CPL04', 'CPMK041', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(25, 'IK1202', 'CPL05', 'CPMK052', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(26, 'MKFSIK2106', 'CPL03', 'CPMK031', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(27, 'IK2101', 'CPL08', 'CPMK081', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(28, 'IK2101', 'CPL08', 'CPMK084', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(29, 'IK2102', 'CPL04', 'CPMK041', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(30, 'IK2102', 'CPL05', 'CPMK052', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(31, 'IK2103', 'CPL05', 'CPMK051', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(32, 'IK2103', 'CPL12', 'CPMK121', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(33, 'IK2104', 'CPL04', 'CPMK041', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(34, 'IK2104', 'CPL05', 'CPMK052', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(35, 'IK2105', 'CPL04', 'CPMK042', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(36, 'IK2105', 'CPL08', 'CPMK081', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(37, 'IK2106', 'CPL04', 'CPMK041', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(38, 'IK2106', 'CPL05', 'CPMK052', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(39, 'MKWUIK2203', 'CPL02', 'CPMK023', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(40, 'MKWUIK2203', 'CPL02', 'CPMK024', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(41, 'MKWUIK2203', 'CPL06', 'CPMK062', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(42, 'MKWUIK2203', 'CPL13', 'CPMK134', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(43, 'IK2201', 'CPL08', 'CPMK083', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(44, 'IK2201', 'CPL09', 'CPMK092', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(45, 'IK2201', 'CPL10', 'CPMK102', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(46, 'IK2202', 'CPL08', 'CPMK082', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(47, 'IK2202', 'CPL12', 'CPMK121', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(48, 'IK2203', 'CPL01', 'CPMK011', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(49, 'IK2203', 'CPL01', 'CPMK012', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(50, 'IK2203', 'CPL02', 'CPMK021', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(51, 'IK2203', 'CPL02', 'CPMK023', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(52, 'IK2203', 'CPL02', 'CPMK024', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(53, 'IK2204', 'CPL04', 'CPMK043', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(54, 'IK2205', 'CPL03', 'CPMK032', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(55, 'IK2205', 'CPL08', 'CPMK082', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(56, 'IK2205', 'CPL11', 'CPMK111', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(57, 'IK2206', 'CPL05', 'CPMK051', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(58, 'IK2206', 'CPL08', 'CPMK081', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(59, 'IK2206', 'CPL08', 'CPMK083', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(60, 'IK2206', 'CPL09', 'CPMK091', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(61, 'IK2206', 'CPL09', 'CPMK092', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(62, 'IK2206', 'CPL09', 'CPMK093', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(63, 'IK2206', 'CPL10', 'CPMK101', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(64, 'IK2206', 'CPL10', 'CPMK103', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(65, 'IK2207', 'CPL04', 'CPMK044', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(66, 'IK2207', 'CPL08', 'CPMK083', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(67, 'IK2207', 'CPL11', 'CPMK112', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(68, 'MKWUIK3101', 'CPL06', 'CPMK063', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(69, 'MKFSIK3107', 'CPL07', 'CPMK071', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(70, 'MKFSIK3107', 'CPL07', 'CPMK072', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(71, 'IK3101', 'CPL04', 'CPMK042', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(72, 'IK3101', 'CPL05', 'CPMK051', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(73, 'IK3101', 'CPL01', 'CPMK102', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(74, 'IK3102', 'CPL02', 'CPMK022', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(75, 'IK3102', 'CPL02', 'CPMK024', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(76, 'IK3102', 'CPL06', 'CPMK061', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(77, 'IK3102', 'CPL06', 'CPMK062', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(78, 'IK3102', 'CPL06', 'CPMK063', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(79, 'IK3103', 'CPL02', 'CPMK022', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(80, 'IK3103', 'CPL02', 'CPMK024', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(81, 'IK3104', 'CPL04', 'CPMK044', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(82, 'IK3105', 'CPL03', 'CPMK032', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(83, 'IK3105', 'CPL11', 'CPMK111', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(84, 'IK3105', 'CPL11', 'CPMK112', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(85, 'IK3106', 'CPL03', 'CPMK032', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(86, 'IK3106', 'CPL13', 'CPMK135', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(87, 'IK3107', 'CPL09', 'CPMK091', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(88, 'IK3107', 'CPL09', 'CPMK092', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(89, 'IK3107', 'CPL09', 'CPMK093', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(90, 'IK3108', 'CPL09', 'CPMK093', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(91, 'IK3108', 'CPL11', 'CPMK112', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(92, 'IK3108', 'CPL11', 'CPMK113', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(93, 'IK3109', 'CPL08', 'CPMK082', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(94, 'IK3109', 'CPL12', 'CPMK121', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(95, 'IK3110', 'CPL04', 'CPMK043', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(96, 'IK3110', 'CPL08', 'CPMK083', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(97, 'IK3110', 'CPL11', 'CPMK112', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(98, 'IK3201', 'CPL05', 'CPMK051', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(99, 'IK3201', 'CPL10', 'CPMK102', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(100, 'IK3202', 'CPL12', 'CPMK122', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(101, 'IK3202', 'CPL12', 'CPMK123', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(102, 'IK3203', 'CPL03', 'CPMK032', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(103, 'IK3203', 'CPL08', 'CPMK083', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(104, 'IK3204', 'CPL04', 'CPMK042', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(105, 'IK3204', 'CPL05', 'CPMK051', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(106, 'IK3204', 'CPL10', 'CPMK101', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(107, 'IK3204', 'CPL10', 'CPMK102', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(108, 'IK3204', 'CPL10', 'CPMK103', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(109, 'IK3205', 'CPL04', 'CPMK043', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(110, 'IK3205', 'CPL08', 'CPMK082', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(111, 'IK3205', 'CPL11', 'CPMK111', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(112, 'IK3206', 'CPL08', 'CPMK084', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(113, 'IK3206', 'CPL10', 'CPMK101', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(114, 'IK3206', 'CPL12', 'CPMK121', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(115, 'IK3207', 'CPL09', 'CPMK091', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(116, 'IK3207', 'CPL12', 'CPMK121', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(117, 'IK3208', 'CPL09', 'CPMK093', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(118, 'IK3208', 'CPL12', 'CPMK122', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(119, 'IK3209', 'CPL10', 'CPMK103', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(120, 'IK3209', 'CPL11', 'CPMK113', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(121, 'IK3209', 'CPL12', 'CPMK122', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(122, 'IK3209', 'CPL12', 'CPMK123', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(123, 'IK3210', 'CPL03', 'CPMK032', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(124, 'IK3210', 'CPL04', 'CPMK044', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(125, 'IK3210', 'CPL08', 'CPMK083', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(126, 'IK3210', 'CPL11', 'CPMK111', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(127, 'IK3211', 'CPL03', 'CPMK032', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(128, 'IK3211', 'CPL04', 'CPMK044', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(129, 'IK3211', 'CPL08', 'CPMK083', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(130, 'IK3211', 'CPL08', 'CPMK084', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(131, 'IK3211', 'CPL11', 'CPMK112', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(132, 'IK3211', 'CPL11', 'CPMK113', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(133, 'IK3212', 'CPL04', 'CPMK043', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(134, 'IK3212', 'CPL08', 'CPMK082', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(135, 'IK3212', 'CPL11', 'CPMK111', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(136, 'IK3213', 'CPL08', 'CPMK081', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(137, 'IK3213', 'CPL08', 'CPMK082', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(138, 'IK3213', 'CPL08', 'CPMK083', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(139, 'IK3213', 'CPL12', 'CPMK123', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(140, 'MKWUIK4102', 'CPL05', 'CPMK052', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(141, 'MKWUIK4102', 'CPL06', 'CPMK061', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(142, 'IK4190', 'CPL05', 'CPMK052', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(143, 'IK4190', 'CPL06', 'CPMK061', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(144, 'IK4190', 'CPL06', 'CPMK062', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(145, 'IK4291', 'CPL06', 'CPMK063', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(146, 'IK4291', 'CPL07', 'CPMK071', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika'),
(147, 'IK4291', 'CPL07', 'CPMK072', '2026-01-19 07:58:42', '2026-01-19 07:58:42', 'S1 Informatika');

-- --------------------------------------------------------

--
-- Table structure for table `penilaian_komponens`
--

CREATE TABLE `penilaian_komponens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nim` varchar(255) NOT NULL,
  `kode_mk` varchar(255) NOT NULL,
  `smt` int(11) NOT NULL,
  `tahun_akademik` varchar(20) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `kehadiran` decimal(5,2) NOT NULL DEFAULT 0.00,
  `tugas` decimal(5,2) NOT NULL DEFAULT 0.00,
  `kuiz` decimal(5,2) NOT NULL DEFAULT 0.00,
  `praktik` decimal(5,2) NOT NULL DEFAULT 0.00,
  `uts` decimal(5,2) NOT NULL DEFAULT 0.00,
  `uas` decimal(5,2) NOT NULL DEFAULT 0.00,
  `nilai_mbkm` decimal(5,2) DEFAULT NULL,
  `dosen1` varchar(200) NOT NULL,
  `dosen2` varchar(200) DEFAULT NULL,
  `dosen3` varchar(200) DEFAULT NULL,
  `nilai_akhir` decimal(5,2) DEFAULT NULL,
  `nilai_huruf` char(2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prodi` varchar(100) DEFAULT NULL,
  `nik` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penilaian_komponens`
--

INSERT INTO `penilaian_komponens` (`id`, `nim`, `kode_mk`, `smt`, `tahun_akademik`, `user_id`, `kehadiran`, `tugas`, `kuiz`, `praktik`, `uts`, `uas`, `nilai_mbkm`, `dosen1`, `dosen2`, `dosen3`, `nilai_akhir`, `nilai_huruf`, `created_at`, `updated_at`, `prodi`, `nik`) VALUES
(1, '240111001', 'IK2105', 3, '2025/2026', 1, 81.67, 53.33, 58.60, 0.00, 75.40, 71.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 66.63, 'B', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(2, '240111002', 'IK2105', 3, '2025/2026', 1, 89.44, 66.67, 71.20, 0.00, 83.00, 86.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 78.31, 'A-', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(3, '240111003', 'IK2105', 3, '2025/2026', 1, 81.67, 39.67, 71.60, 0.00, 81.00, 82.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 67.98, 'B', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(4, '240111004', 'IK2105', 3, '2025/2026', 1, 78.89, 66.67, 63.60, 0.00, 79.40, 79.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 73.85, 'B+', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(5, '240111005', 'IK2105', 3, '2025/2026', 1, 84.44, 80.00, 69.60, 0.00, 80.60, 81.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 79.80, 'A-', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(6, '240111006', 'IK2105', 3, '2025/2026', 1, 78.89, 53.00, 64.00, 0.00, 79.40, 79.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 69.79, 'B', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(7, '240111007', 'IK2105', 3, '2025/2026', 1, 84.44, 66.67, 66.60, 0.00, 79.00, 78.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 74.35, 'B+', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(8, '240111008', 'IK2105', 3, '2025/2026', 1, 78.89, 66.67, 64.60, 0.00, 78.40, 77.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 73.20, 'B+', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(9, '240111009', 'IK2105', 3, '2025/2026', 1, 76.11, 13.33, 60.00, 0.00, 74.60, 0.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 36.26, 'D', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(10, '240111010', 'IK2105', 3, '2025/2026', 1, 84.44, 79.67, 65.00, 0.00, 83.60, 87.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 81.49, 'A', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(11, '240111011', 'IK2105', 3, '2025/2026', 1, 84.44, 80.00, 69.60, 0.00, 78.60, 77.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 78.30, 'A-', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(12, '240111012', 'IK2105', 3, '2025/2026', 1, 84.44, 80.00, 69.60, 0.00, 80.00, 80.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 79.40, 'A-', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(13, '240111013', 'IK2105', 3, '2025/2026', 1, 89.44, 66.67, 74.60, 0.00, 84.00, 88.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 79.40, 'A-', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(14, '240111014', 'IK2105', 3, '2025/2026', 1, 84.44, 80.00, 69.60, 0.00, 80.00, 80.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 79.40, 'A-', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(15, '240111015', 'IK2105', 3, '2025/2026', 1, 84.44, 80.00, 69.60, 0.00, 79.60, 79.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 79.05, 'A-', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(16, '240111019', 'IK2105', 3, '2025/2026', 1, 84.44, 80.00, 69.60, 0.00, 80.60, 81.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 79.80, 'A-', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(17, '240111020', 'IK2105', 3, '2025/2026', 1, 84.44, 66.67, 67.60, 0.00, 76.60, 73.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 72.60, 'B+', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(18, '240111021', 'IK2105', 3, '2025/2026', 1, 84.44, 40.00, 60.00, 0.00, 75.00, 70.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 62.69, 'B-', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(19, '240111022', 'IK2105', 3, '2025/2026', 1, 84.44, 40.00, 60.00, 0.00, 75.60, 71.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 63.09, 'B-', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(20, '240111023', 'IK2105', 3, '2025/2026', 1, 84.44, 40.00, 60.00, 0.00, 75.00, 70.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 62.69, 'B-', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(21, '240111024', 'IK2105', 3, '2025/2026', 1, 84.44, 46.67, 60.00, 0.00, 76.00, 72.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 65.44, 'B', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(22, '240111025', 'IK2105', 3, '2025/2026', 1, 84.44, 46.67, 60.00, 0.00, 75.60, 71.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 65.09, 'B', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(23, '240111026', 'IK2105', 3, '2025/2026', 1, 84.44, 40.00, 60.00, 0.00, 80.60, 81.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 66.84, 'B', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(24, '240111027', 'IK2105', 3, '2025/2026', 1, 84.44, 40.00, 60.00, 0.00, 79.60, 79.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 66.09, 'B', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(25, '240111028', 'IK2105', 3, '2025/2026', 1, 84.44, 40.00, 60.00, 0.00, 76.00, 72.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 63.44, 'B-', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(26, '240111030', 'IK2105', 3, '2025/2026', 1, 84.44, 40.00, 60.00, 0.00, 75.00, 70.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 62.69, 'B-', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(27, '240111031', 'IK2105', 3, '2025/2026', 1, 84.44, 53.33, 60.00, 0.00, 77.00, 74.00, NULL, 'Imam Ahmad Ashari, S.Kom., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', 'Rian Ardianto, S.Kom., M.Kom. Dosen.', 68.19, 'B', '2026-01-20 21:29:01', '2026-01-20 21:29:01', 'S1 Informatika', '115911190894'),
(28, '230111001', 'MKFSIK1102', 1, '2023/2024', 1, 79.58, 79.58, 79.58, 0.00, 73.00, 67.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, M.Kom.', '-', 75.75, 'A-', '2026-02-16 18:57:30', '2026-02-16 19:12:52', 'S1 Informatika', '115911190894'),
(29, '230111002', 'MKFSIK1102', 1, '2023/2024', 1, 77.33, 77.33, 77.33, 0.00, 75.00, 72.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, M.Kom.', '-', 75.80, 'A-', '2026-02-16 18:57:30', '2026-02-16 19:12:52', 'S1 Informatika', '115911190894'),
(30, '230111004', 'MKFSIK1102', 1, '2023/2024', 1, 80.00, 80.00, 80.00, 0.00, 78.00, 57.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, M.Kom.', '-', 75.00, 'A-', '2026-02-16 18:57:30', '2026-02-16 19:12:52', 'S1 Informatika', '115911190894'),
(31, '230111005', 'MKFSIK1102', 1, '2023/2024', 1, 80.42, 80.42, 80.42, 0.00, 76.00, 70.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, M.Kom.', '-', 77.45, 'A-', '2026-02-16 18:57:30', '2026-02-16 19:12:52', 'S1 Informatika', '115911190894'),
(32, '230111007', 'MKFSIK1102', 1, '2023/2024', 1, 80.83, 80.83, 80.83, 0.00, 73.00, 75.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, M.Kom.', '-', 78.10, 'A-', '2026-02-16 18:57:30', '2026-02-16 19:12:52', 'S1 Informatika', '115911190894'),
(33, '230111009', 'MKFSIK1102', 1, '2023/2024', 1, 80.17, 80.17, 80.17, 0.00, 73.00, 71.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, M.Kom.', '-', 76.90, 'A-', '2026-02-16 18:57:30', '2026-02-16 19:12:52', 'S1 Informatika', '115911190894'),
(34, '230111010', 'MKFSIK1102', 1, '2023/2024', 1, 77.50, 77.50, 77.50, 0.00, 74.00, 66.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, M.Kom.', '-', 74.50, 'A-', '2026-02-16 18:57:30', '2026-02-16 19:12:52', 'S1 Informatika', '115911190894'),
(35, '230111011', 'MKFSIK1102', 1, '2023/2024', 1, 79.17, 79.17, 79.17, 0.00, 73.00, 46.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, M.Kom.', '-', 71.30, 'B+', '2026-02-16 18:57:30', '2026-02-16 19:12:52', 'S1 Informatika', '115911190894'),
(36, '230111001', 'MKFSIK1101', 1, '2023/2024', 1, 80.00, 80.00, 80.00, 80.00, 85.00, 88.00, NULL, 'Ir. Purwono, S.KOM., M.KOM.', 'Rian Adrianto, M.Kom.', '-', 82.60, 'A', '2026-02-16 19:16:02', '2026-02-16 19:16:02', 'S1 Informatika', '115911190894'),
(37, '230111002', 'MKFSIK1101', 1, '2023/2024', 1, 75.50, 75.50, 75.50, 75.50, 80.00, 85.00, NULL, 'Ir. Purwono, S.KOM., M.KOM.', 'Rian Adrianto, M.Kom.', '-', 78.30, 'A-', '2026-02-16 19:16:02', '2026-02-16 19:16:02', 'S1 Informatika', '115911190894'),
(38, '230111004', 'MKFSIK1101', 1, '2023/2024', 1, 76.00, 76.00, 76.00, 76.00, 78.00, 86.00, NULL, 'Ir. Purwono, S.KOM., M.KOM.', 'Rian Adrianto, M.Kom.', '-', 78.40, 'A-', '2026-02-16 19:16:02', '2026-02-16 19:16:02', 'S1 Informatika', '115911190894'),
(39, '230111005', 'MKFSIK1101', 1, '2023/2024', 1, 75.33, 75.33, 75.33, 75.33, 80.00, 85.00, NULL, 'Ir. Purwono, S.KOM., M.KOM.', 'Rian Adrianto, M.Kom.', '-', 78.20, 'A-', '2026-02-16 19:16:02', '2026-02-16 19:16:02', 'S1 Informatika', '115911190894'),
(40, '230111007', 'MKFSIK1101', 1, '2023/2024', 1, 73.50, 73.50, 73.50, 73.50, 75.00, 86.00, NULL, 'Ir. Purwono, S.KOM., M.KOM.', 'Rian Adrianto, M.Kom.', '-', 76.30, 'A-', '2026-02-16 19:16:02', '2026-02-16 19:16:02', 'S1 Informatika', '115911190894'),
(41, '230111009', 'MKFSIK1101', 1, '2023/2024', 1, 80.00, 80.00, 80.00, 80.00, 80.00, 88.00, NULL, 'Ir. Purwono, S.KOM., M.KOM.', 'Rian Adrianto, M.Kom.', '-', 81.60, 'A', '2026-02-16 19:16:02', '2026-02-16 19:16:02', 'S1 Informatika', '115911190894'),
(42, '230111010', 'MKFSIK1101', 1, '2023/2024', 1, 72.67, 72.67, 72.67, 72.67, 74.00, 76.00, NULL, 'Ir. Purwono, S.KOM., M.KOM.', 'Rian Adrianto, M.Kom.', '-', 73.60, 'B+', '2026-02-16 19:16:02', '2026-02-16 19:16:02', 'S1 Informatika', '115911190894'),
(43, '230111011', 'MKFSIK1101', 1, '2023/2024', 1, 75.00, 75.00, 75.00, 75.00, 75.00, 88.00, NULL, 'Ir. Purwono, S.KOM., M.KOM.', 'Rian Adrianto, M.Kom.', '-', 77.60, 'A-', '2026-02-16 19:16:02', '2026-02-16 19:16:02', 'S1 Informatika', '115911190894'),
(44, '230111001', 'IK1102', 1, '2023/2024', 1, 82.33, 88.88, 92.50, 0.00, 77.00, 100.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Rosyid Al-Hakim, S.Si., S.Kom., M.T.', '-', 88.40, 'A', '2026-02-16 19:32:35', '2026-02-16 20:01:02', 'S1 Informatika', '115911190894'),
(45, '230111002', 'IK1102', 1, '2023/2024', 1, 81.50, 90.63, 93.00, 0.00, 97.00, 90.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Rosyid Al-Hakim, S.Si., S.Kom., M.T.', '-', 91.39, 'A', '2026-02-16 19:32:35', '2026-02-16 20:01:12', 'S1 Informatika', '115911190894'),
(46, '230111004', 'IK1102', 1, '2023/2024', 1, 81.50, 90.13, 94.50, 0.00, 89.00, 85.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Rosyid Al-Hakim, S.Si., S.Kom., M.T.', '-', 88.14, 'A', '2026-02-16 19:32:35', '2026-02-16 20:01:20', 'S1 Informatika', '115911190894'),
(47, '230111005', 'IK1102', 1, '2023/2024', 1, 82.33, 90.63, 93.50, 0.00, 89.00, 100.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Rosyid Al-Hakim, S.Si., S.Kom., M.T.', '-', 92.02, 'A', '2026-02-16 19:32:35', '2026-02-16 20:01:27', 'S1 Informatika', '115911190894'),
(48, '230111007', 'IK1102', 1, '2023/2024', 1, 81.50, 88.75, 95.00, 0.00, 98.00, 100.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Rosyid Al-Hakim, S.Si., S.Kom., M.T.', '-', 93.78, 'A', '2026-02-16 19:32:35', '2026-02-16 20:01:34', 'S1 Informatika', '115911190894'),
(49, '230111009', 'IK1102', 1, '2023/2024', 1, 82.33, 90.00, 94.00, 0.00, 85.00, 100.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Rosyid Al-Hakim, S.Si., S.Kom., M.T.', '-', 90.88, 'A', '2026-02-16 19:32:35', '2026-02-16 20:01:41', 'S1 Informatika', '115911190894'),
(50, '230111010', 'IK1102', 1, '2023/2024', 1, 81.50, 80.63, 92.50, 0.00, 90.00, 75.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Rosyid Al-Hakim, S.Si., S.Kom., M.T.', '-', 82.84, 'A', '2026-02-16 19:32:35', '2026-02-16 20:01:48', 'S1 Informatika', '115911190894'),
(51, '230111011', 'IK1102', 1, '2023/2024', 1, 78.00, 82.13, 94.50, 0.00, 92.00, 75.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Rosyid Al-Hakim, S.Si., S.Kom., M.T.', '-', 83.64, 'A', '2026-02-16 19:32:35', '2026-02-16 20:01:55', 'S1 Informatika', '115911190894'),
(52, '230111001', 'IK1101', 1, '2023/2024', 1, 80.63, 83.13, 81.50, 0.00, 90.00, 71.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan. S.Kom., M.Kom.', '-', 81.40, 'A', '2026-02-16 19:36:55', '2026-02-16 19:36:55', 'S1 Informatika', '115911190894'),
(53, '230111002', 'IK1101', 1, '2023/2024', 1, 80.63, 84.38, 90.00, 0.00, 90.00, 69.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan. S.Kom., M.Kom.', '-', 82.13, 'A', '2026-02-16 19:36:55', '2026-02-16 19:36:55', 'S1 Informatika', '115911190894'),
(54, '230111004', 'IK1101', 1, '2023/2024', 1, 80.63, 81.88, 90.00, 0.00, 95.00, 83.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan. S.Kom., M.Kom.', '-', 86.13, 'A', '2026-02-16 19:36:55', '2026-02-16 19:36:55', 'S1 Informatika', '115911190894'),
(55, '230111005', 'IK1101', 1, '2023/2024', 1, 80.63, 82.50, 90.00, 0.00, 92.00, 65.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan. S.Kom., M.Kom.', '-', 81.06, 'A', '2026-02-16 19:36:55', '2026-02-16 19:36:55', 'S1 Informatika', '115911190894'),
(56, '230111007', 'IK1101', 1, '2023/2024', 1, 80.63, 80.13, 90.00, 0.00, 95.00, 83.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan. S.Kom., M.Kom.', '-', 85.60, 'A', '2026-02-16 19:36:55', '2026-02-16 19:36:55', 'S1 Informatika', '115911190894'),
(57, '230111009', 'IK1101', 1, '2023/2024', 1, 80.63, 84.25, 81.50, 0.00, 90.00, 65.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan. S.Kom., M.Kom.', '-', 80.24, 'A', '2026-02-16 19:36:55', '2026-02-16 19:36:55', 'S1 Informatika', '115911190894'),
(58, '230111010', 'IK1101', 1, '2023/2024', 1, 80.63, 80.13, 41.50, 0.00, 88.00, 80.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan. S.Kom., M.Kom.', '-', 78.25, 'A-', '2026-02-16 19:36:55', '2026-02-16 19:36:55', 'S1 Informatika', '115911190894'),
(59, '230111011', 'IK1101', 1, '2023/2024', 1, 80.63, 70.25, 35.00, 0.00, 81.00, 66.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan. S.Kom., M.Kom.', '-', 69.39, 'B+', '2026-02-16 19:36:55', '2026-02-16 19:36:55', 'S1 Informatika', '115911190894'),
(68, '230111001', 'MKDUIK1103', 1, '2023/2024', 1, 70.00, 70.00, 70.00, 0.00, 71.00, 88.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'RINDY ACVIONITA, S.H., M.KN.', '-', 73.80, 'B+', '2026-02-16 19:46:27', '2026-02-16 19:46:27', 'S1 Informatika', '115911190894'),
(69, '230111002', 'MKDUIK1103', 1, '2023/2024', 1, 70.00, 70.00, 70.00, 0.00, 84.00, 93.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'RINDY ACVIONITA, S.H., M.KN.', '-', 77.40, 'A-', '2026-02-16 19:46:27', '2026-02-16 19:46:27', 'S1 Informatika', '115911190894'),
(70, '230111004', 'MKDUIK1103', 1, '2023/2024', 1, 70.00, 70.00, 70.00, 0.00, 93.00, 94.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'RINDY ACVIONITA, S.H., M.KN.', '-', 79.40, 'A', '2026-02-16 19:46:27', '2026-02-16 19:46:27', 'S1 Informatika', '115911190894'),
(71, '230111005', 'MKDUIK1103', 1, '2023/2024', 1, 70.00, 70.00, 70.00, 0.00, 94.00, 100.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'RINDY ACVIONITA, S.H., M.KN.', '-', 80.80, 'A', '2026-02-16 19:46:27', '2026-02-16 19:46:27', 'S1 Informatika', '115911190894'),
(72, '230111007', 'MKDUIK1103', 1, '2023/2024', 1, 70.00, 70.00, 70.00, 0.00, 91.00, 89.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'RINDY ACVIONITA, S.H., M.KN.', '-', 78.00, 'A-', '2026-02-16 19:46:27', '2026-02-16 19:46:27', 'S1 Informatika', '115911190894'),
(73, '230111009', 'MKDUIK1103', 1, '2023/2024', 1, 70.00, 70.00, 70.00, 0.00, 83.00, 93.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'RINDY ACVIONITA, S.H., M.KN.', '-', 77.20, 'A-', '2026-02-16 19:46:27', '2026-02-16 19:46:27', 'S1 Informatika', '115911190894'),
(74, '230111010', 'MKDUIK1103', 1, '2023/2024', 1, 70.00, 70.00, 70.00, 0.00, 78.00, 79.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'RINDY ACVIONITA, S.H., M.KN.', '-', 73.40, 'B+', '2026-02-16 19:46:27', '2026-02-16 19:46:27', 'S1 Informatika', '115911190894'),
(75, '230111011', 'MKDUIK1103', 1, '2023/2024', 1, 70.00, 70.00, 70.00, 0.00, 61.00, 85.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'RINDY ACVIONITA, S.H., M.KN.', '-', 71.20, 'B+', '2026-02-16 19:46:27', '2026-02-16 19:46:27', 'S1 Informatika', '115911190894'),
(76, '230111001', 'MKDUIK1101', 1, '2023/2024', 1, 84.00, 84.00, 84.00, 0.00, 42.00, 90.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.PD., M.PD.', '-', 76.80, 'A-', '2026-02-16 19:48:54', '2026-02-16 19:48:54', 'S1 Informatika', '115911190894'),
(77, '230111002', 'MKDUIK1101', 1, '2023/2024', 1, 83.00, 83.00, 83.00, 0.00, 70.00, 71.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.PD., M.PD.', '-', 78.00, 'A-', '2026-02-16 19:48:54', '2026-02-16 19:48:54', 'S1 Informatika', '115911190894'),
(78, '230111004', 'MKDUIK1101', 1, '2023/2024', 1, 85.33, 85.33, 85.33, 0.00, 90.00, 85.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.PD., M.PD.', '-', 86.20, 'A', '2026-02-16 19:48:54', '2026-02-16 19:48:54', 'S1 Informatika', '115911190894'),
(79, '230111005', 'MKDUIK1101', 1, '2023/2024', 1, 84.33, 84.33, 84.33, 0.00, 94.00, 91.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.PD., M.PD.', '-', 87.60, 'A', '2026-02-16 19:48:54', '2026-02-16 19:48:54', 'S1 Informatika', '115911190894'),
(80, '230111007', 'MKDUIK1101', 1, '2023/2024', 1, 84.33, 84.33, 84.33, 0.00, 84.00, 93.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.PD., M.PD.', '-', 86.00, 'A', '2026-02-16 19:48:54', '2026-02-16 19:48:54', 'S1 Informatika', '115911190894'),
(81, '230111009', 'MKDUIK1101', 1, '2023/2024', 1, 84.00, 84.00, 84.00, 0.00, 94.00, 67.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.PD., M.PD.', '-', 82.60, 'A', '2026-02-16 19:48:54', '2026-02-16 19:48:54', 'S1 Informatika', '115911190894'),
(82, '230111010', 'MKDUIK1101', 1, '2023/2024', 1, 84.33, 84.33, 84.33, 0.00, 80.00, 90.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.PD., M.PD.', '-', 84.60, 'A', '2026-02-16 19:48:54', '2026-02-16 19:48:54', 'S1 Informatika', '115911190894'),
(83, '230111011', 'MKDUIK1101', 1, '2023/2024', 1, 79.67, 79.67, 79.67, 0.00, 96.00, 90.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.PD., M.PD.', '-', 85.00, 'A', '2026-02-16 19:48:54', '2026-02-16 19:48:54', 'S1 Informatika', '115911190894'),
(84, '230111001', 'MKDUIK1102', 1, '2023/2024', 1, 75.00, 75.00, 85.00, 0.00, 80.00, 75.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DIAN NASTITI, S.PD., M.PD.', '-', 78.25, 'A-', '2026-02-16 19:52:15', '2026-02-16 19:52:15', 'S1 Informatika', '115911190894'),
(85, '230111002', 'MKDUIK1102', 1, '2023/2024', 1, 79.00, 79.00, 85.00, 0.00, 84.00, 80.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DIAN NASTITI, S.PD., M.PD.', '-', 81.70, 'A', '2026-02-16 19:52:15', '2026-02-16 19:52:15', 'S1 Informatika', '115911190894'),
(86, '230111004', 'MKDUIK1102', 1, '2023/2024', 1, 80.00, 80.00, 85.00, 0.00, 80.00, 90.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DIAN NASTITI, S.PD., M.PD.', '-', 83.50, 'A', '2026-02-16 19:52:15', '2026-02-16 19:52:15', 'S1 Informatika', '115911190894'),
(87, '230111005', 'MKDUIK1102', 1, '2023/2024', 1, 81.00, 81.00, 85.00, 0.00, 80.00, 80.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DIAN NASTITI, S.PD., M.PD.', '-', 81.30, 'A', '2026-02-16 19:52:15', '2026-02-16 19:52:15', 'S1 Informatika', '115911190894'),
(88, '230111007', 'MKDUIK1102', 1, '2023/2024', 1, 76.60, 76.60, 85.00, 0.00, 80.00, 80.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DIAN NASTITI, S.PD., M.PD.', '-', 79.98, 'A', '2026-02-16 19:52:15', '2026-02-16 19:52:15', 'S1 Informatika', '115911190894'),
(89, '230111009', 'MKDUIK1102', 1, '2023/2024', 1, 78.00, 78.00, 85.00, 0.00, 82.00, 88.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DIAN NASTITI, S.PD., M.PD.', '-', 82.90, 'A', '2026-02-16 19:52:15', '2026-02-16 19:52:15', 'S1 Informatika', '115911190894'),
(90, '230111010', 'MKDUIK1102', 1, '2023/2024', 1, 78.00, 78.00, 85.00, 0.00, 90.00, 83.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DIAN NASTITI, S.PD., M.PD.', '-', 83.65, 'A', '2026-02-16 19:52:15', '2026-02-16 19:52:15', 'S1 Informatika', '115911190894'),
(91, '230111011', 'MKDUIK1102', 1, '2023/2024', 1, 67.00, 67.00, 85.00, 0.00, 86.00, 85.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DIAN NASTITI, S.PD., M.PD.', '-', 79.85, 'A', '2026-02-16 19:52:15', '2026-02-16 19:52:15', 'S1 Informatika', '115911190894'),
(92, '230111001', 'MKFSIK1203', 2, '2023/2024', 1, 80.00, 80.00, 80.00, 80.00, 77.00, 90.00, NULL, 'Retno Agus Setiawan, S.Kom., M.T.', 'Ir. Purwono, S.Kom., M.Kom.', '-', 81.75, 'A', '2026-02-16 20:11:02', '2026-02-16 20:11:02', 'S1 Informatika', '115911190894'),
(93, '230111002', 'MKFSIK1203', 2, '2023/2024', 1, 80.00, 78.88, 78.88, 80.00, 83.00, 90.00, NULL, 'Retno Agus Setiawan, S.Kom., M.T.', 'Ir. Purwono, S.Kom., M.Kom.', '-', 83.03, 'A', '2026-02-16 20:11:02', '2026-02-16 20:11:02', 'S1 Informatika', '115911190894'),
(94, '230111004', 'MKFSIK1203', 2, '2023/2024', 1, 77.50, 68.75, 68.75, 75.42, 69.00, 90.00, NULL, 'Retno Agus Setiawan, S.Kom., M.T.', 'Ir. Purwono, S.Kom., M.Kom.', '-', 76.33, 'A-', '2026-02-16 20:11:02', '2026-02-16 20:11:02', 'S1 Informatika', '115911190894'),
(95, '230111005', 'MKFSIK1203', 2, '2023/2024', 1, 75.00, 78.25, 78.25, 78.83, 80.00, 90.00, NULL, 'Retno Agus Setiawan, S.Kom., M.T.', 'Ir. Purwono, S.Kom., M.Kom.', '-', 81.42, 'A', '2026-02-16 20:11:02', '2026-02-16 20:11:02', 'S1 Informatika', '115911190894'),
(96, '230111007', 'MKFSIK1203', 2, '2023/2024', 1, 72.50, 72.50, 72.50, 77.08, 68.00, 80.00, NULL, 'Retno Agus Setiawan, S.Kom., M.T.', 'Ir. Purwono, S.Kom., M.Kom.', '-', 74.17, 'B+', '2026-02-16 20:11:02', '2026-02-16 20:11:02', 'S1 Informatika', '115911190894'),
(97, '230111009', 'MKFSIK1203', 2, '2023/2024', 1, 79.00, 79.50, 79.50, 80.00, 70.00, 90.00, NULL, 'Retno Agus Setiawan, S.Kom., M.T.', 'Ir. Purwono, S.Kom., M.Kom.', '-', 79.80, 'A-', '2026-02-16 20:11:02', '2026-02-16 20:11:02', 'S1 Informatika', '115911190894'),
(98, '230111010', 'MKFSIK1203', 2, '2023/2024', 1, 75.00, 71.88, 71.88, 72.08, 73.00, 90.00, NULL, 'Retno Agus Setiawan, S.Kom., M.T.', 'Ir. Purwono, S.Kom., M.Kom.', '-', 77.04, 'A-', '2026-02-16 20:11:02', '2026-02-16 20:11:02', 'S1 Informatika', '115911190894'),
(99, '230111011', 'MKFSIK1203', 2, '2023/2024', 1, 77.50, 72.50, 72.50, 70.42, 68.00, 80.00, NULL, 'Retno Agus Setiawan, S.Kom., M.T.', 'Ir. Purwono, S.Kom., M.Kom.', '-', 73.33, 'B+', '2026-02-16 20:11:02', '2026-02-16 20:11:02', 'S1 Informatika', '115911190894'),
(100, '230111001', 'MKWUIK3101', 2, '2023/2024', 1, 69.83, 69.83, 69.83, 0.00, 54.00, 43.05, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'Diannike Putri, S.S., M.Hum.', '-', 59.18, 'C+', '2026-02-16 20:16:00', '2026-02-16 20:16:00', 'S1 Informatika', '115911190894'),
(101, '230111002', 'MKWUIK3101', 2, '2023/2024', 1, 68.33, 68.33, 68.33, 0.00, 65.50, 51.05, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'Diannike Putri, S.S., M.Hum.', '-', 63.30, 'B-', '2026-02-16 20:16:00', '2026-02-16 20:16:00', 'S1 Informatika', '115911190894'),
(102, '230111004', 'MKWUIK3101', 2, '2023/2024', 1, 47.33, 47.33, 47.33, 0.00, 57.00, 19.15, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'Diannike Putri, S.S., M.Hum.', '-', 42.70, 'D+', '2026-02-16 20:16:00', '2026-02-16 20:16:00', 'S1 Informatika', '115911190894'),
(103, '230111005', 'MKWUIK3101', 2, '2023/2024', 1, 65.83, 65.83, 65.83, 0.00, 80.00, 65.85, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'Diannike Putri, S.S., M.Hum.', '-', 69.38, 'B', '2026-02-16 20:16:00', '2026-02-16 20:16:00', 'S1 Informatika', '115911190894'),
(104, '230111007', 'MKWUIK3101', 2, '2023/2024', 1, 69.17, 69.17, 69.17, 0.00, 58.00, 53.40, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'Diannike Putri, S.S., M.Hum.', '-', 62.43, 'B-', '2026-02-16 20:16:00', '2026-02-16 20:16:00', 'S1 Informatika', '115911190894'),
(105, '230111009', 'MKWUIK3101', 2, '2023/2024', 1, 70.00, 70.00, 70.00, 0.00, 59.50, 71.85, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'Diannike Putri, S.S., M.Hum.', '-', 67.84, 'B', '2026-02-16 20:16:00', '2026-02-16 20:16:00', 'S1 Informatika', '115911190894'),
(106, '230111010', 'MKWUIK3101', 2, '2023/2024', 1, 59.17, 59.17, 59.17, 0.00, 68.50, 72.75, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'Diannike Putri, S.S., M.Hum.', '-', 64.90, 'B-', '2026-02-16 20:16:00', '2026-02-16 20:16:00', 'S1 Informatika', '115911190894'),
(107, '230111011', 'MKWUIK3101', 2, '2023/2024', 1, 65.50, 65.50, 65.50, 0.00, 50.50, 37.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'Diannike Putri, S.S., M.Hum.', '-', 54.63, 'C', '2026-02-16 20:16:00', '2026-02-16 20:16:00', 'S1 Informatika', '115911190894'),
(108, '230111001', 'MKFSIK1204', 2, '2023/2024', 1, 85.00, 77.50, 77.50, 60.00, 74.00, 93.00, NULL, 'Retno Agus Setiawan, S.Kom., M.T.', 'Imam Ahmad Ashari, S.Kom., M.Kom.', '-', 77.75, 'A-', '2026-02-16 20:18:57', '2026-02-16 20:18:57', 'S1 Informatika', '115911190894'),
(109, '230111002', 'MKFSIK1204', 2, '2023/2024', 1, 85.00, 85.00, 85.00, 66.67, 75.00, 100.00, NULL, 'Retno Agus Setiawan, S.Kom., M.T.', 'Imam Ahmad Ashari, S.Kom., M.Kom.', '-', 82.58, 'A', '2026-02-16 20:18:57', '2026-02-16 20:18:57', 'S1 Informatika', '115911190894'),
(110, '230111004', 'MKFSIK1204', 2, '2023/2024', 1, 73.57, 82.50, 82.50, 56.67, 80.00, 100.00, NULL, 'Retno Agus Setiawan, S.Kom., M.T.', 'Imam Ahmad Ashari, S.Kom., M.Kom.', '-', 80.19, 'A', '2026-02-16 20:18:57', '2026-02-16 20:18:57', 'S1 Informatika', '115911190894'),
(111, '230111005', 'MKFSIK1204', 2, '2023/2024', 1, 85.00, 85.00, 85.00, 60.00, 85.00, 100.00, NULL, 'Retno Agus Setiawan, S.Kom., M.T.', 'Imam Ahmad Ashari, S.Kom., M.Kom.', '-', 83.75, 'A', '2026-02-16 20:18:57', '2026-02-16 20:18:57', 'S1 Informatika', '115911190894'),
(112, '230111007', 'MKFSIK1204', 2, '2023/2024', 1, 83.57, 85.00, 85.00, 66.67, 80.00, 98.00, NULL, 'Retno Agus Setiawan, S.Kom., M.T.', 'Imam Ahmad Ashari, S.Kom., M.Kom.', '-', 83.19, 'A', '2026-02-16 20:18:57', '2026-02-16 20:18:57', 'S1 Informatika', '115911190894'),
(113, '230111009', 'MKFSIK1204', 2, '2023/2024', 1, 85.00, 80.00, 80.00, 60.00, 75.00, 100.00, NULL, 'Retno Agus Setiawan, S.Kom., M.T.', 'Imam Ahmad Ashari, S.Kom., M.Kom.', '-', 80.25, 'A', '2026-02-16 20:18:57', '2026-02-16 20:18:57', 'S1 Informatika', '115911190894'),
(114, '230111010', 'MKFSIK1204', 2, '2023/2024', 1, 81.07, 68.75, 68.75, 66.67, 75.00, 80.00, NULL, 'Retno Agus Setiawan, S.Kom., M.T.', 'Imam Ahmad Ashari, S.Kom., M.Kom.', '-', 73.94, 'B+', '2026-02-16 20:18:57', '2026-02-16 20:18:57', 'S1 Informatika', '115911190894'),
(115, '230111011', 'MKFSIK1204', 2, '2023/2024', 1, 79.29, 60.00, 60.00, 63.33, 75.00, 29.00, NULL, 'Retno Agus Setiawan, S.Kom., M.T.', 'Imam Ahmad Ashari, S.Kom., M.Kom.', '-', 58.60, 'C+', '2026-02-16 20:18:57', '2026-02-16 20:18:57', 'S1 Informatika', '115911190894'),
(116, '230111001', 'IK1201', 2, '2023/2024', 1, 88.25, 88.25, 88.25, 0.00, 70.00, 87.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Dinar Mustofa, S.Kom., M.Kom.', '-', 84.35, 'A', '2026-02-16 20:21:01', '2026-02-16 20:21:01', 'S1 Informatika', '115911190894'),
(117, '230111002', 'IK1201', 2, '2023/2024', 1, 88.25, 88.25, 88.25, 0.00, 80.00, 89.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Dinar Mustofa, S.Kom., M.Kom.', '-', 86.75, 'A', '2026-02-16 20:21:01', '2026-02-16 20:21:01', 'S1 Informatika', '115911190894'),
(118, '230111004', 'IK1201', 2, '2023/2024', 1, 72.50, 72.50, 72.50, 0.00, 90.00, 84.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Dinar Mustofa, S.Kom., M.Kom.', '-', 78.30, 'A-', '2026-02-16 20:21:01', '2026-02-16 20:21:01', 'S1 Informatika', '115911190894'),
(119, '230111005', 'IK1201', 2, '2023/2024', 1, 86.50, 86.50, 86.50, 0.00, 95.00, 88.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Dinar Mustofa, S.Kom., M.Kom.', '-', 88.50, 'A', '2026-02-16 20:21:01', '2026-02-16 20:21:01', 'S1 Informatika', '115911190894'),
(120, '230111007', 'IK1201', 2, '2023/2024', 1, 84.75, 84.75, 84.75, 0.00, 85.00, 86.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Dinar Mustofa, S.Kom., M.Kom.', '-', 85.05, 'A', '2026-02-16 20:21:01', '2026-02-16 20:21:01', 'S1 Informatika', '115911190894'),
(121, '230111009', 'IK1201', 2, '2023/2024', 1, 88.50, 88.50, 88.50, 0.00, 95.00, 88.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Dinar Mustofa, S.Kom., M.Kom.', '-', 89.70, 'A', '2026-02-16 20:21:01', '2026-02-16 20:21:01', 'S1 Informatika', '115911190894'),
(122, '230111010', 'IK1201', 2, '2023/2024', 1, 73.50, 73.50, 73.50, 0.00, 70.00, 85.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Dinar Mustofa, S.Kom., M.Kom.', '-', 75.10, 'A-', '2026-02-16 20:21:01', '2026-02-16 20:21:01', 'S1 Informatika', '115911190894'),
(123, '230111011', 'IK1201', 2, '2023/2024', 1, 66.75, 66.75, 66.75, 0.00, 95.00, 85.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Dinar Mustofa, S.Kom., M.Kom.', '-', 76.05, 'A-', '2026-02-16 20:21:01', '2026-02-16 20:21:01', 'S1 Informatika', '115911190894'),
(124, '230111001', 'MKFSIK1205', 2, '2023/2024', 1, 74.50, 74.50, 74.50, 0.00, 84.00, 61.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 73.50, 'B+', '2026-02-16 20:23:04', '2026-02-16 20:23:04', 'S1 Informatika', '115911190894'),
(125, '230111002', 'MKFSIK1205', 2, '2023/2024', 1, 72.25, 72.25, 72.25, 0.00, 92.00, 68.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 76.13, 'A-', '2026-02-16 20:23:04', '2026-02-16 20:23:04', 'S1 Informatika', '115911190894'),
(126, '230111004', 'MKFSIK1205', 2, '2023/2024', 1, 72.00, 72.00, 72.00, 0.00, 86.00, 55.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 71.25, 'B+', '2026-02-16 20:23:04', '2026-02-16 20:23:04', 'S1 Informatika', '115911190894'),
(127, '230111005', 'MKFSIK1205', 2, '2023/2024', 1, 72.50, 72.50, 72.50, 0.00, 94.00, 58.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 74.25, 'A-', '2026-02-16 20:23:04', '2026-02-16 20:23:04', 'S1 Informatika', '115911190894'),
(128, '230111007', 'MKFSIK1205', 2, '2023/2024', 1, 71.75, 71.75, 71.75, 0.00, 92.00, 63.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 74.63, 'A-', '2026-02-16 20:23:04', '2026-02-16 20:23:04', 'S1 Informatika', '115911190894'),
(129, '230111009', 'MKFSIK1205', 2, '2023/2024', 1, 74.25, 74.25, 74.25, 0.00, 88.00, 86.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 80.63, 'A', '2026-02-16 20:23:04', '2026-02-16 20:23:04', 'S1 Informatika', '115911190894'),
(130, '230111010', 'MKFSIK1205', 2, '2023/2024', 1, 53.75, 53.75, 53.75, 0.00, 86.00, 63.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 64.13, 'B', '2026-02-16 20:23:04', '2026-02-16 20:23:04', 'S1 Informatika', '115911190894'),
(131, '230111011', 'MKFSIK1205', 2, '2023/2024', 1, 75.00, 75.00, 75.00, 0.00, 90.00, 65.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 76.25, 'A-', '2026-02-16 20:23:04', '2026-02-16 20:23:04', 'S1 Informatika', '115911190894'),
(132, '230111001', 'IK1202', 2, '2023/2024', 1, 80.00, 96.00, 90.00, 0.00, 78.00, 90.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDHLO AL HAKIM, S.Kom., M.Kom.', '-', 87.80, 'A', '2026-02-16 20:25:05', '2026-02-16 20:25:05', 'S1 Informatika', '115911190894'),
(133, '230111002', 'IK1202', 2, '2023/2024', 1, 85.00, 99.40, 90.00, 0.00, 100.00, 95.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDHLO AL HAKIM, S.Kom., M.Kom.', '-', 96.07, 'A', '2026-02-16 20:25:05', '2026-02-16 20:25:05', 'S1 Informatika', '115911190894'),
(134, '230111004', 'IK1202', 2, '2023/2024', 1, 80.00, 96.20, 90.00, 0.00, 98.00, 88.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDHLO AL HAKIM, S.Kom., M.Kom.', '-', 92.36, 'A', '2026-02-16 20:25:06', '2026-02-16 20:25:06', 'S1 Informatika', '115911190894'),
(135, '230111005', 'IK1202', 2, '2023/2024', 1, 85.00, 99.60, 90.00, 0.00, 100.00, 96.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDHLO AL HAKIM, S.Kom., M.Kom.', '-', 96.38, 'A', '2026-02-16 20:25:06', '2026-02-16 20:25:06', 'S1 Informatika', '115911190894'),
(136, '230111007', 'IK1202', 2, '2023/2024', 1, 85.00, 96.00, 90.00, 0.00, 90.00, 87.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDHLO AL HAKIM, S.Kom., M.Kom.', '-', 90.55, 'A', '2026-02-16 20:25:06', '2026-02-16 20:25:06', 'S1 Informatika', '115911190894'),
(137, '230111009', 'IK1202', 2, '2023/2024', 1, 85.00, 97.00, 90.00, 0.00, 100.00, 90.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDHLO AL HAKIM, S.Kom., M.Kom.', '-', 94.10, 'A', '2026-02-16 20:25:06', '2026-02-16 20:25:06', 'S1 Informatika', '115911190894'),
(138, '230111010', 'IK1202', 2, '2023/2024', 1, 80.00, 96.80, 50.00, 0.00, 91.00, 89.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDHLO AL HAKIM, S.Kom., M.Kom.', '-', 87.04, 'A', '2026-02-16 20:25:06', '2026-02-16 20:25:06', 'S1 Informatika', '115911190894'),
(139, '230111011', 'IK1202', 2, '2023/2024', 1, 85.00, 96.40, 90.00, 0.00, 87.00, 86.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDHLO AL HAKIM, S.Kom., M.Kom.', '-', 89.67, 'A', '2026-02-16 20:25:06', '2026-02-16 20:25:06', 'S1 Informatika', '115911190894'),
(140, '240111001', 'IK1102', 1, '2024/2025', 1, 80.00, 100.00, 90.00, 0.00, 79.00, 75.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 85.50, 'A', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(141, '240111002', 'IK1102', 1, '2024/2025', 1, 90.00, 100.00, 90.00, 0.00, 97.00, 65.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 88.50, 'A', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(142, '240111003', 'IK1102', 1, '2024/2025', 1, 80.00, 60.00, 90.00, 0.00, 78.00, 50.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 67.00, 'B', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(143, '240111004', 'IK1102', 1, '2024/2025', 1, 80.00, 100.00, 90.00, 0.00, 74.00, 75.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 84.25, 'A', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(144, '240111005', 'IK1102', 1, '2024/2025', 1, 80.00, 100.00, 90.00, 0.00, 76.00, 60.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 81.00, 'A', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(145, '240111006', 'IK1102', 1, '2024/2025', 1, 80.00, 100.00, 90.00, 0.00, 78.00, 50.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 79.00, 'A-', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(146, '240111007', 'IK1102', 1, '2024/2025', 1, 80.00, 55.00, 90.00, 0.00, 73.00, 58.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 66.25, 'B', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(147, '240111008', 'IK1102', 1, '2024/2025', 1, 90.00, 100.00, 90.00, 0.00, 84.00, 95.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 92.75, 'A', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(148, '240111009', 'IK1102', 1, '2024/2025', 1, 80.00, 80.00, 90.00, 0.00, 80.00, 60.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 76.00, 'A-', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(149, '240111010', 'IK1102', 1, '2024/2025', 1, 80.00, 100.00, 90.00, 0.00, 77.00, 55.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 80.00, 'A', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(150, '240111011', 'IK1102', 1, '2024/2025', 1, 80.00, 100.00, 90.00, 0.00, 78.00, 40.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 76.50, 'A-', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(151, '240111012', 'IK1102', 1, '2024/2025', 1, 80.00, 60.00, 90.00, 0.00, 82.00, 40.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 65.50, 'B', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(152, '240111013', 'IK1102', 1, '2024/2025', 1, 90.00, 90.00, 90.00, 0.00, 97.00, 55.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 83.00, 'A', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(153, '240111014', 'IK1102', 1, '2024/2025', 1, 80.00, 70.00, 90.00, 0.00, 80.00, 80.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 78.00, 'A-', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(154, '240111015', 'IK1102', 1, '2024/2025', 1, 80.00, 80.00, 90.00, 0.00, 85.00, 38.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 71.75, 'B+', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(155, '240111019', 'IK1102', 1, '2024/2025', 1, 80.00, 100.00, 90.00, 0.00, 76.00, 86.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 87.50, 'A', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(156, '240111020', 'IK1102', 1, '2024/2025', 1, 80.00, 100.00, 90.00, 0.00, 73.00, 40.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 75.25, 'A-', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(157, '240111021', 'IK1102', 1, '2024/2025', 1, 80.00, 80.00, 90.00, 0.00, 80.00, 80.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 81.00, 'A', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(158, '240111022', 'IK1102', 1, '2024/2025', 1, 80.00, 80.00, 90.00, 0.00, 82.00, 95.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 85.25, 'A', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(159, '240111023', 'IK1102', 1, '2024/2025', 1, 80.00, 80.00, 90.00, 0.00, 82.00, 70.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 79.00, 'A-', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(160, '240111024', 'IK1102', 1, '2024/2025', 1, 80.00, 80.00, 90.00, 0.00, 79.00, 35.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 69.50, 'B', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(161, '240111025', 'IK1102', 1, '2024/2025', 1, 80.00, 80.00, 90.00, 0.00, 80.00, 80.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 81.00, 'A', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(162, '240111026', 'IK1102', 1, '2024/2025', 1, 80.00, 80.00, 90.00, 0.00, 83.00, 95.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 85.50, 'A', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(163, '240111027', 'IK1102', 1, '2024/2025', 1, 80.00, 80.00, 90.00, 0.00, 78.00, 90.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 83.00, 'A', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(164, '240111028', 'IK1102', 1, '2024/2025', 1, 80.00, 80.00, 90.00, 0.00, 80.00, 35.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 69.75, 'B', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(165, '240111030', 'IK1102', 1, '2024/2025', 1, 80.00, 80.00, 90.00, 0.00, 80.00, 35.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 69.75, 'B', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(166, '240111031', 'IK1102', 1, '2024/2025', 1, 80.00, 80.00, 90.00, 0.00, 80.00, 85.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', '-', 82.25, 'A', '2026-02-16 20:37:42', '2026-02-16 20:37:42', 'S1 Informatika', '115911190894'),
(167, '240111001', 'MKDUIK1102', 1, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 84.00, 96.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 84.00, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(168, '240111002', 'MKDUIK1102', 1, '2024/2025', 1, 83.67, 83.67, 83.67, 0.00, 90.00, 98.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 87.80, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(169, '240111003', 'MKDUIK1102', 1, '2024/2025', 1, 81.00, 81.00, 81.00, 0.00, 90.00, 100.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 86.60, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(170, '240111004', 'MKDUIK1102', 1, '2024/2025', 1, 81.33, 81.33, 81.33, 0.00, 82.00, 96.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 84.40, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(171, '240111005', 'MKDUIK1102', 1, '2024/2025', 1, 81.33, 81.33, 81.33, 0.00, 84.00, 88.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 83.20, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(172, '240111006', 'MKDUIK1102', 1, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 84.00, 100.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 84.80, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(173, '240111007', 'MKDUIK1102', 1, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 86.00, 100.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 85.20, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(174, '240111008', 'MKDUIK1102', 1, '2024/2025', 1, 81.33, 81.33, 81.33, 0.00, 86.00, 98.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 85.60, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(175, '240111009', 'MKDUIK1102', 1, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 76.00, 100.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 83.20, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(176, '240111010', 'MKDUIK1102', 1, '2024/2025', 1, 81.33, 81.33, 81.33, 0.00, 86.00, 100.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 86.00, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(177, '240111011', 'MKDUIK1102', 1, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 82.00, 100.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 84.40, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(178, '240111012', 'MKDUIK1102', 1, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 82.00, 98.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 84.00, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(179, '240111013', 'MKDUIK1102', 1, '2024/2025', 1, 83.33, 83.33, 83.33, 0.00, 86.00, 98.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 86.80, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(180, '240111014', 'MKDUIK1102', 1, '2024/2025', 1, 81.67, 81.67, 81.67, 0.00, 88.00, 100.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 86.60, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(181, '240111015', 'MKDUIK1102', 1, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 84.00, 96.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 84.00, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(182, '240111019', 'MKDUIK1102', 1, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 82.00, 94.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 83.20, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(183, '240111020', 'MKDUIK1102', 1, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 86.00, 98.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 84.80, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(184, '240111021', 'MKDUIK1102', 1, '2024/2025', 1, 81.67, 81.67, 81.67, 0.00, 79.00, 76.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 80.00, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(185, '240111022', 'MKDUIK1102', 1, '2024/2025', 1, 81.00, 81.00, 81.00, 0.00, 80.00, 78.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 80.20, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(186, '240111023', 'MKDUIK1102', 1, '2024/2025', 1, 81.67, 81.67, 81.67, 0.00, 80.00, 79.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 80.80, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(187, '240111024', 'MKDUIK1102', 1, '2024/2025', 1, 79.33, 79.33, 79.33, 0.00, 80.00, 80.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 79.60, 'A-', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(188, '240111025', 'MKDUIK1102', 1, '2024/2025', 1, 80.67, 80.67, 80.67, 0.00, 79.00, 82.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 80.60, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(189, '240111026', 'MKDUIK1102', 1, '2024/2025', 1, 82.33, 82.33, 82.33, 0.00, 81.00, 76.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 80.80, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(190, '240111027', 'MKDUIK1102', 1, '2024/2025', 1, 79.00, 79.00, 79.00, 0.00, 78.00, 81.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 79.20, 'A-', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894');
INSERT INTO `penilaian_komponens` (`id`, `nim`, `kode_mk`, `smt`, `tahun_akademik`, `user_id`, `kehadiran`, `tugas`, `kuiz`, `praktik`, `uts`, `uas`, `nilai_mbkm`, `dosen1`, `dosen2`, `dosen3`, `nilai_akhir`, `nilai_huruf`, `created_at`, `updated_at`, `prodi`, `nik`) VALUES
(191, '240111028', 'MKDUIK1102', 1, '2024/2025', 1, 81.67, 81.67, 81.67, 0.00, 79.00, 81.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 81.00, 'A', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(192, '240111030', 'MKDUIK1102', 1, '2024/2025', 1, 80.67, 80.67, 80.67, 0.00, 81.00, 76.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 79.80, 'A-', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(193, '240111031', 'MKDUIK1102', 1, '2024/2025', 1, 80.33, 80.33, 80.33, 0.00, 80.00, 79.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', '-', 80.00, 'A-', '2026-02-16 20:42:55', '2026-02-16 20:42:55', 'S1 Informatika', '115911190894'),
(194, '240111001', 'MKFSIK1101', 1, '2024/2025', 1, 70.00, 77.00, 61.00, 0.00, 60.00, 77.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 70.45, 'B+', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(195, '240111002', 'MKFSIK1101', 1, '2024/2025', 1, 82.00, 85.00, 80.00, 0.00, 74.00, 80.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 80.20, 'A', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(196, '240111003', 'MKFSIK1101', 1, '2024/2025', 1, 65.00, 69.00, 68.00, 0.00, 76.00, 76.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 72.00, 'B+', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(197, '240111004', 'MKFSIK1101', 1, '2024/2025', 1, 61.00, 79.00, 80.00, 0.00, 75.00, 61.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 71.80, 'B+', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(198, '240111005', 'MKFSIK1101', 1, '2024/2025', 1, 62.00, 62.00, 61.00, 0.00, 80.00, 80.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 70.90, 'B+', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(199, '240111006', 'MKFSIK1101', 1, '2024/2025', 1, 71.00, 74.00, 60.00, 0.00, 60.00, 80.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 70.30, 'B+', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(200, '240111007', 'MKFSIK1101', 1, '2024/2025', 1, 75.00, 68.00, 65.00, 0.00, 62.00, 85.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 71.15, 'B+', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(201, '240111008', 'MKFSIK1101', 1, '2024/2025', 1, 72.00, 80.00, 80.00, 0.00, 63.00, 87.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 76.70, 'A-', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(202, '240111009', 'MKFSIK1101', 1, '2024/2025', 1, 71.00, 76.00, 73.00, 0.00, 63.00, 70.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 70.45, 'B+', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(203, '240111010', 'MKFSIK1101', 1, '2024/2025', 1, 80.00, 74.00, 69.00, 0.00, 73.00, 85.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 76.60, 'A-', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(204, '240111011', 'MKFSIK1101', 1, '2024/2025', 1, 70.00, 64.00, 80.00, 0.00, 69.00, 61.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 66.70, 'B', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(205, '240111012', 'MKFSIK1101', 1, '2024/2025', 1, 63.00, 78.00, 70.00, 0.00, 64.00, 79.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 72.45, 'B+', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(206, '240111013', 'MKFSIK1101', 1, '2024/2025', 1, 77.00, 89.00, 70.00, 0.00, 75.00, 88.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 82.15, 'A', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(207, '240111014', 'MKFSIK1101', 1, '2024/2025', 1, 66.00, 80.00, 73.00, 0.00, 71.00, 82.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 76.15, 'A-', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(208, '240111015', 'MKFSIK1101', 1, '2024/2025', 1, 73.00, 62.00, 74.00, 0.00, 78.00, 80.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 72.80, 'B+', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(209, '240111019', 'MKFSIK1101', 1, '2024/2025', 1, 79.00, 75.00, 66.00, 0.00, 78.00, 87.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 78.25, 'A-', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(210, '240111020', 'MKFSIK1101', 1, '2024/2025', 1, 71.00, 78.00, 60.00, 0.00, 73.00, 75.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 73.50, 'B+', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(211, '240111021', 'MKFSIK1101', 1, '2024/2025', 1, 61.00, 68.00, 70.00, 0.00, 75.00, 70.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 69.75, 'B', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(212, '240111022', 'MKFSIK1101', 1, '2024/2025', 1, 66.00, 67.00, 75.00, 0.00, 68.00, 64.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 67.20, 'B', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(213, '240111023', 'MKFSIK1101', 1, '2024/2025', 1, 77.00, 65.00, 64.00, 0.00, 60.00, 77.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 67.85, 'B', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(214, '240111024', 'MKFSIK1101', 1, '2024/2025', 1, 73.00, 73.00, 60.00, 0.00, 75.00, 50.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 66.45, 'B', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(215, '240111025', 'MKFSIK1101', 1, '2024/2025', 1, 63.00, 77.00, 79.00, 0.00, 77.00, 50.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 69.05, 'B', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(216, '240111026', 'MKFSIK1101', 1, '2024/2025', 1, 70.00, 79.00, 70.00, 0.00, 69.00, 86.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 76.45, 'A-', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(217, '240111027', 'MKFSIK1101', 1, '2024/2025', 1, 75.00, 73.00, 67.00, 0.00, 61.00, 75.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 70.10, 'B+', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(218, '240111028', 'MKFSIK1101', 1, '2024/2025', 1, 78.00, 73.00, 65.00, 0.00, 68.00, 69.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 70.45, 'B+', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(219, '240111030', 'MKFSIK1101', 1, '2024/2025', 1, 73.00, 77.00, 78.00, 0.00, 61.00, 50.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 65.95, 'B', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(220, '240111031', 'MKFSIK1101', 1, '2024/2025', 1, 67.00, 72.00, 77.00, 0.00, 68.00, 63.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 68.75, 'B', '2026-02-16 20:44:58', '2026-02-16 20:44:58', 'S1 Informatika', '115911190894'),
(221, '240111001', 'MKDUIK1101', 1, '2024/2025', 1, 90.00, 90.00, 90.00, 0.00, 66.00, 90.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 85.20, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(222, '240111002', 'MKDUIK1101', 1, '2024/2025', 1, 100.00, 100.00, 100.00, 0.00, 80.00, 94.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 94.80, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(223, '240111003', 'MKDUIK1101', 1, '2024/2025', 1, 90.00, 90.00, 90.00, 0.00, 66.00, 82.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 83.60, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(224, '240111004', 'MKDUIK1101', 1, '2024/2025', 1, 90.00, 90.00, 90.00, 0.00, 72.00, 88.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 86.00, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(225, '240111005', 'MKDUIK1101', 1, '2024/2025', 1, 90.00, 90.00, 90.00, 0.00, 66.00, 88.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 84.80, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(226, '240111006', 'MKDUIK1101', 1, '2024/2025', 1, 90.00, 90.00, 90.00, 0.00, 54.00, 90.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 82.80, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(227, '240111007', 'MKDUIK1101', 1, '2024/2025', 1, 90.00, 90.00, 90.00, 0.00, 74.00, 90.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 86.80, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(228, '240111008', 'MKDUIK1101', 1, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 64.00, 78.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 76.40, 'A-', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(229, '240111009', 'MKDUIK1101', 1, '2024/2025', 1, 90.00, 90.00, 90.00, 0.00, 66.00, 86.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 84.40, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(230, '240111010', 'MKDUIK1101', 1, '2024/2025', 1, 95.00, 95.00, 95.00, 0.00, 78.00, 92.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 91.00, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(231, '240111011', 'MKDUIK1101', 1, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 44.00, 72.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 71.20, 'B+', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(232, '240111012', 'MKDUIK1101', 1, '2024/2025', 1, 95.00, 95.00, 95.00, 0.00, 78.00, 90.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 90.60, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(233, '240111013', 'MKDUIK1101', 1, '2024/2025', 1, 100.00, 100.00, 100.00, 0.00, 86.00, 96.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 96.40, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(234, '240111014', 'MKDUIK1101', 1, '2024/2025', 1, 90.00, 90.00, 90.00, 0.00, 78.00, 88.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 87.20, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(235, '240111015', 'MKDUIK1101', 1, '2024/2025', 1, 90.00, 90.00, 90.00, 0.00, 56.00, 88.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 82.80, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(236, '240111019', 'MKDUIK1101', 1, '2024/2025', 1, 95.00, 95.00, 95.00, 0.00, 72.00, 90.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 89.40, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(237, '240111020', 'MKDUIK1101', 1, '2024/2025', 1, 90.00, 90.00, 90.00, 0.00, 72.00, 88.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 86.00, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(238, '240111021', 'MKDUIK1101', 1, '2024/2025', 1, 100.00, 100.00, 100.00, 0.00, 70.00, 100.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 94.00, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(239, '240111022', 'MKDUIK1101', 1, '2024/2025', 1, 100.00, 100.00, 100.00, 0.00, 70.00, 100.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 94.00, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(240, '240111023', 'MKDUIK1101', 1, '2024/2025', 1, 70.00, 70.00, 70.00, 0.00, 60.00, 70.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 68.00, 'B', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(241, '240111024', 'MKDUIK1101', 1, '2024/2025', 1, 90.00, 90.00, 90.00, 0.00, 70.00, 90.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 86.00, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(242, '240111025', 'MKDUIK1101', 1, '2024/2025', 1, 95.00, 95.00, 95.00, 0.00, 70.00, 95.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 90.00, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(243, '240111026', 'MKDUIK1101', 1, '2024/2025', 1, 100.00, 100.00, 100.00, 0.00, 70.00, 100.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 94.00, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(244, '240111027', 'MKDUIK1101', 1, '2024/2025', 1, 95.00, 95.00, 95.00, 0.00, 70.00, 95.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 90.00, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(245, '240111028', 'MKDUIK1101', 1, '2024/2025', 1, 70.00, 70.00, 70.00, 0.00, 60.00, 70.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 68.00, 'B', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(246, '240111030', 'MKDUIK1101', 1, '2024/2025', 1, 70.00, 70.00, 70.00, 0.00, 60.00, 70.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 68.00, 'B', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(247, '240111031', 'MKDUIK1101', 1, '2024/2025', 1, 100.00, 100.00, 100.00, 0.00, 70.00, 100.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'KUSWANTORO, S.Pd., M.Pd.', '-', 94.00, 'A', '2026-02-16 20:47:55', '2026-02-16 20:47:55', 'S1 Informatika', '115911190894'),
(248, '240111001', 'MKDUIK1103', 1, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 98.00, 86.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 84.80, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(249, '240111002', 'MKDUIK1103', 1, '2024/2025', 1, 83.50, 83.50, 83.50, 0.00, 96.00, 94.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 88.10, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(250, '240111003', 'MKDUIK1103', 1, '2024/2025', 1, 81.00, 81.00, 81.00, 0.00, 86.00, 94.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 84.60, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(251, '240111004', 'MKDUIK1103', 1, '2024/2025', 1, 81.00, 81.00, 81.00, 0.00, 96.00, 92.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 86.20, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(252, '240111005', 'MKDUIK1103', 1, '2024/2025', 1, 81.00, 81.00, 81.00, 0.00, 94.00, 88.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 85.00, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(253, '240111006', 'MKDUIK1103', 1, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 84.00, 94.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 83.60, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(254, '240111007', 'MKDUIK1103', 1, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 48.00, 90.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 75.60, 'A-', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(255, '240111008', 'MKDUIK1103', 1, '2024/2025', 1, 81.00, 81.00, 81.00, 0.00, 98.00, 90.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 86.20, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(256, '240111009', 'MKDUIK1103', 1, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 82.00, 92.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 82.80, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(257, '240111010', 'MKDUIK1103', 1, '2024/2025', 1, 81.00, 81.00, 81.00, 0.00, 94.00, 92.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 85.80, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(258, '240111011', 'MKDUIK1103', 1, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 86.00, 90.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 83.20, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(259, '240111012', 'MKDUIK1103', 1, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 88.00, 90.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 83.60, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(260, '240111013', 'MKDUIK1103', 1, '2024/2025', 1, 83.50, 83.50, 83.50, 0.00, 80.00, 88.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 83.70, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(261, '240111014', 'MKDUIK1103', 1, '2024/2025', 1, 82.50, 82.50, 82.50, 0.00, 96.00, 96.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 87.90, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(262, '240111015', 'MKDUIK1103', 1, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 82.00, 84.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 81.20, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(263, '240111019', 'MKDUIK1103', 1, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 80.00, 94.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 82.80, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(264, '240111020', 'MKDUIK1103', 1, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 94.00, 92.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 85.20, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(265, '240111021', 'MKDUIK1103', 1, '2024/2025', 1, 95.00, 95.00, 95.00, 0.00, 70.00, 95.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 90.00, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(266, '240111022', 'MKDUIK1103', 1, '2024/2025', 1, 85.00, 85.00, 85.00, 0.00, 70.00, 85.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 82.00, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(267, '240111023', 'MKDUIK1103', 1, '2024/2025', 1, 70.00, 70.00, 70.00, 0.00, 60.00, 70.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 68.00, 'B', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(268, '240111024', 'MKDUIK1103', 1, '2024/2025', 1, 95.00, 95.00, 95.00, 0.00, 70.00, 95.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 90.00, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(269, '240111025', 'MKDUIK1103', 1, '2024/2025', 1, 70.00, 70.00, 70.00, 0.00, 70.00, 70.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 70.00, 'B+', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(270, '240111026', 'MKDUIK1103', 1, '2024/2025', 1, 90.00, 90.00, 90.00, 0.00, 70.00, 90.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 86.00, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(271, '240111027', 'MKDUIK1103', 1, '2024/2025', 1, 85.00, 85.00, 85.00, 0.00, 70.00, 85.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 82.00, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(272, '240111028', 'MKDUIK1103', 1, '2024/2025', 1, 70.00, 70.00, 70.00, 0.00, 60.00, 70.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 68.00, 'B', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(273, '240111030', 'MKDUIK1103', 1, '2024/2025', 1, 70.00, 70.00, 70.00, 0.00, 60.00, 70.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 68.00, 'B', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(274, '240111031', 'MKDUIK1103', 1, '2024/2025', 1, 90.00, 90.00, 90.00, 0.00, 70.00, 90.00, NULL, 'ARIF SETIA SANDI A., S.KOM., M.KOM.', 'INDAH AYU PERMANA PRIBADI, S.IP., M.Sos.', '-', 86.00, 'A', '2026-02-16 20:50:01', '2026-02-16 20:50:01', 'S1 Informatika', '115911190894'),
(275, '240111001', 'MKFSIK1102', 1, '2024/2025', 1, 78.44, 78.44, 78.44, 0.00, 78.00, 87.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 80.07, 'A', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(276, '240111002', 'MKFSIK1102', 1, '2024/2025', 1, 78.44, 78.44, 78.44, 0.00, 78.00, 88.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 80.27, 'A', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(277, '240111003', 'MKFSIK1102', 1, '2024/2025', 1, 57.44, 57.44, 57.44, 0.00, 76.00, 77.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 65.07, 'B', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(278, '240111004', 'MKFSIK1102', 1, '2024/2025', 1, 76.22, 76.22, 76.22, 0.00, 76.00, 80.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 76.93, 'A-', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(279, '240111005', 'MKFSIK1102', 1, '2024/2025', 1, 69.00, 69.00, 69.00, 0.00, 78.00, 80.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 73.00, 'B+', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(280, '240111006', 'MKFSIK1102', 1, '2024/2025', 1, 74.56, 74.56, 74.56, 0.00, 75.00, 70.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 73.73, 'B+', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(281, '240111007', 'MKFSIK1102', 1, '2024/2025', 1, 76.00, 76.00, 76.00, 0.00, 76.00, 85.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 77.80, 'A-', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(282, '240111008', 'MKFSIK1102', 1, '2024/2025', 1, 77.33, 77.33, 77.33, 0.00, 74.00, 87.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 78.60, 'A-', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(283, '240111009', 'MKFSIK1102', 1, '2024/2025', 1, 74.44, 74.44, 74.44, 0.00, 73.00, 72.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 73.67, 'B+', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(284, '240111010', 'MKFSIK1102', 1, '2024/2025', 1, 77.11, 77.11, 77.11, 0.00, 78.00, 82.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 78.27, 'A-', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(285, '240111011', 'MKFSIK1102', 1, '2024/2025', 1, 77.00, 77.00, 77.00, 0.00, 75.00, 85.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 78.20, 'A-', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(286, '240111012', 'MKFSIK1102', 1, '2024/2025', 1, 75.67, 75.67, 75.67, 0.00, 76.00, 70.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 74.60, 'B+', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(287, '240111013', 'MKFSIK1102', 1, '2024/2025', 1, 78.22, 78.22, 78.22, 0.00, 78.00, 80.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 78.53, 'A-', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(288, '240111014', 'MKFSIK1102', 1, '2024/2025', 1, 77.33, 77.33, 77.33, 0.00, 74.00, 87.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 78.60, 'A-', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(289, '240111015', 'MKFSIK1102', 1, '2024/2025', 1, 77.33, 77.33, 77.33, 0.00, 75.00, 85.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 78.40, 'A-', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(290, '240111019', 'MKFSIK1102', 1, '2024/2025', 1, 76.22, 76.22, 76.22, 0.00, 74.00, 85.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 77.53, 'A-', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(291, '240111020', 'MKFSIK1102', 1, '2024/2025', 1, 77.33, 77.33, 77.33, 0.00, 58.00, 80.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 74.00, 'B+', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(292, '240111021', 'MKFSIK1102', 1, '2024/2025', 1, 75.25, 75.25, 75.25, 0.00, 56.00, 65.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 69.35, 'B', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(293, '240111022', 'MKFSIK1102', 1, '2024/2025', 1, 74.75, 74.75, 74.75, 0.00, 56.00, 66.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 69.25, 'B', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(294, '240111023', 'MKFSIK1102', 1, '2024/2025', 1, 60.00, 60.00, 60.00, 0.00, 55.00, 65.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 60.00, 'B-', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(295, '240111024', 'MKFSIK1102', 1, '2024/2025', 1, 73.71, 73.71, 73.71, 0.00, 71.00, 53.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 69.03, 'B', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(296, '240111025', 'MKFSIK1102', 1, '2024/2025', 1, 75.25, 75.25, 75.25, 0.00, 68.00, 50.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 68.75, 'B', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(297, '240111026', 'MKFSIK1102', 1, '2024/2025', 1, 75.63, 75.63, 75.63, 0.00, 74.00, 45.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 69.18, 'B', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(298, '240111027', 'MKFSIK1102', 1, '2024/2025', 1, 74.67, 74.67, 74.67, 0.00, 77.00, 66.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 73.40, 'B+', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(299, '240111028', 'MKFSIK1102', 1, '2024/2025', 1, 60.00, 60.00, 60.00, 0.00, 55.00, 65.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 60.00, 'B-', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(300, '240111030', 'MKFSIK1102', 1, '2024/2025', 1, 60.00, 60.00, 60.00, 0.00, 65.00, 65.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 62.00, 'B-', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(301, '240111031', 'MKFSIK1102', 1, '2024/2025', 1, 74.33, 74.33, 74.33, 0.00, 77.00, 68.00, NULL, 'R. Bagus Bambang Sumantri, S.T., M.Kom.', 'Jatmiko Indriyanto, S.Kom., M.kom.', '-', 73.60, 'B+', '2026-02-16 20:51:53', '2026-02-16 20:51:53', 'S1 Informatika', '115911190894'),
(302, '240111001', 'IK1101', 1, '2024/2025', 1, 80.00, 80.00, 70.00, 0.00, 80.00, 87.50, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 80.88, 'A', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(303, '240111002', 'IK1101', 1, '2024/2025', 1, 90.00, 87.50, 70.00, 0.00, 94.00, 89.50, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 88.13, 'A', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(304, '240111003', 'IK1101', 1, '2024/2025', 1, 80.00, 80.00, 70.00, 0.00, 39.00, 88.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 70.75, 'B+', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(305, '240111004', 'IK1101', 1, '2024/2025', 1, 80.00, 80.00, 70.00, 0.00, 69.00, 85.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 77.50, 'A-', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(306, '240111005', 'IK1101', 1, '2024/2025', 1, 80.00, 80.00, 70.00, 0.00, 64.00, 45.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 66.25, 'B', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(307, '240111006', 'IK1101', 1, '2024/2025', 1, 80.00, 80.00, 70.00, 0.00, 45.00, 82.50, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 70.88, 'B+', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(308, '240111007', 'IK1101', 1, '2024/2025', 1, 80.00, 80.00, 70.00, 0.00, 74.00, 84.50, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 78.63, 'A-', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(309, '240111008', 'IK1101', 1, '2024/2025', 1, 80.00, 80.00, 70.00, 0.00, 57.00, 88.50, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 75.38, 'A-', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(310, '240111009', 'IK1101', 1, '2024/2025', 1, 80.00, 80.00, 70.00, 0.00, 83.00, 86.50, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 81.38, 'A', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(311, '240111010', 'IK1101', 1, '2024/2025', 1, 80.00, 80.00, 70.00, 0.00, 81.00, 85.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 80.50, 'A', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(312, '240111011', 'IK1101', 1, '2024/2025', 1, 80.00, 80.00, 70.00, 0.00, 45.00, 45.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 61.50, 'B-', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(313, '240111012', 'IK1101', 1, '2024/2025', 1, 80.00, 80.00, 70.00, 0.00, 55.00, 87.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 74.50, 'B+', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(314, '240111013', 'IK1101', 1, '2024/2025', 1, 90.00, 87.50, 70.00, 0.00, 82.00, 90.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 85.25, 'A', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(315, '240111014', 'IK1101', 1, '2024/2025', 1, 80.00, 80.00, 70.00, 0.00, 52.00, 86.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 73.50, 'B+', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(316, '240111015', 'IK1101', 1, '2024/2025', 1, 80.00, 80.00, 70.00, 0.00, 68.00, 87.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 77.75, 'A-', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(317, '240111019', 'IK1101', 1, '2024/2025', 1, 80.00, 80.00, 70.00, 0.00, 75.00, 86.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 79.25, 'A-', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(318, '240111020', 'IK1101', 1, '2024/2025', 1, 80.00, 80.00, 70.00, 0.00, 72.00, 85.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 78.25, 'A-', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(319, '240111021', 'IK1101', 1, '2024/2025', 1, 80.00, 60.00, 60.00, 0.00, 64.00, 61.50, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 63.38, 'B-', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(320, '240111022', 'IK1101', 1, '2024/2025', 1, 80.00, 60.00, 60.00, 0.00, 64.00, 61.50, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 63.38, 'B-', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(321, '240111023', 'IK1101', 1, '2024/2025', 1, 80.00, 60.00, 60.00, 0.00, 66.00, 61.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 63.75, 'B-', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(322, '240111024', 'IK1101', 1, '2024/2025', 1, 80.00, 60.00, 60.00, 0.00, 52.00, 60.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 60.00, 'B-', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(323, '240111025', 'IK1101', 1, '2024/2025', 1, 80.00, 60.00, 60.00, 0.00, 64.00, 59.50, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 62.88, 'B-', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(324, '240111026', 'IK1101', 1, '2024/2025', 1, 80.00, 60.00, 60.00, 0.00, 83.00, 61.50, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 68.13, 'B', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(325, '240111027', 'IK1101', 1, '2024/2025', 1, 80.00, 60.00, 60.00, 0.00, 82.00, 61.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 67.75, 'B', '2026-02-16 20:54:13', '2026-02-16 20:54:13', 'S1 Informatika', '115911190894'),
(326, '240111028', 'IK1101', 1, '2024/2025', 1, 80.00, 60.00, 60.00, 0.00, 62.00, 60.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 62.50, 'B-', '2026-02-16 20:54:14', '2026-02-16 20:54:14', 'S1 Informatika', '115911190894'),
(327, '240111030', 'IK1101', 1, '2024/2025', 1, 80.00, 60.00, 60.00, 0.00, 67.00, 60.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 63.75, 'B-', '2026-02-16 20:54:14', '2026-02-16 20:54:14', 'S1 Informatika', '115911190894'),
(328, '240111031', 'IK1101', 1, '2024/2025', 1, 80.00, 60.00, 60.00, 0.00, 85.00, 60.00, NULL, 'Khoirun Nisa, S.Kom., M.Kom.', 'Retno Agus Setiawan, S.Kom., M.T.', 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 68.25, 'B', '2026-02-16 20:54:14', '2026-02-16 20:54:14', 'S1 Informatika', '115911190894'),
(329, '230111001', 'IK2104', 3, '2024/2025', 1, 73.00, 73.00, 73.00, 0.00, 90.00, 81.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Anggit Wirasto, S.Si., M.Eng., M.Eng.', '', 78.00, 'A-', '2026-02-16 20:56:28', '2026-02-16 20:56:58', 'S1 Informatika', '115911190894'),
(330, '230111002', 'IK2104', 3, '2024/2025', 1, 75.00, 75.00, 75.00, 0.00, 90.00, 90.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Anggit Wirasto, S.Si., M.Eng., M.Eng.', '', 81.00, 'A', '2026-02-16 20:56:28', '2026-02-16 20:56:58', 'S1 Informatika', '115911190894'),
(331, '230111004', 'IK2104', 3, '2024/2025', 1, 75.00, 75.00, 75.00, 0.00, 90.00, 74.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Anggit Wirasto, S.Si., M.Eng., M.Eng.', '', 77.86, 'A-', '2026-02-16 20:56:28', '2026-02-16 20:56:58', 'S1 Informatika', '115911190894'),
(332, '230111005', 'IK2104', 3, '2024/2025', 1, 75.00, 75.00, 75.00, 0.00, 90.00, 96.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Anggit Wirasto, S.Si., M.Eng., M.Eng.', '', 82.20, 'A', '2026-02-16 20:56:28', '2026-02-16 20:56:58', 'S1 Informatika', '115911190894'),
(333, '230111007', 'IK2104', 3, '2024/2025', 1, 66.00, 66.00, 66.00, 0.00, 90.00, 82.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Anggit Wirasto, S.Si., M.Eng., M.Eng.', '', 74.00, 'B+', '2026-02-16 20:56:28', '2026-02-16 20:56:58', 'S1 Informatika', '115911190894'),
(334, '230111009', 'IK2104', 3, '2024/2025', 1, 55.00, 55.00, 55.00, 0.00, 90.00, 96.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Anggit Wirasto, S.Si., M.Eng., M.Eng.', '', 70.20, 'B+', '2026-02-16 20:56:28', '2026-02-16 20:56:58', 'S1 Informatika', '115911190894'),
(335, '230111010', 'IK2104', 3, '2024/2025', 1, 75.00, 75.00, 75.00, 0.00, 90.00, 81.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Anggit Wirasto, S.Si., M.Eng., M.Eng.', '', 79.29, 'A-', '2026-02-16 20:56:28', '2026-02-16 20:56:58', 'S1 Informatika', '115911190894'),
(336, '230111011', 'IK2104', 3, '2024/2025', 1, 73.00, 73.00, 73.00, 0.00, 90.00, 86.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Anggit Wirasto, S.Si., M.Eng., M.Eng.', '', 79.00, 'A-', '2026-02-16 20:56:28', '2026-02-16 20:56:58', 'S1 Informatika', '115911190894'),
(337, '240111016', 'IK2104', 3, '2024/2025', 1, 75.00, 75.00, 75.00, 0.00, 90.00, 84.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Anggit Wirasto, S.Si., M.Eng., M.Eng.', '', 79.80, 'A-', '2026-02-16 20:56:28', '2026-02-16 20:56:58', 'S1 Informatika', '115911190894'),
(338, '240111017', 'IK2104', 3, '2024/2025', 1, 75.00, 75.00, 75.00, 0.00, 90.00, 95.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Anggit Wirasto, S.Si., M.Eng., M.Eng.', '', 82.00, 'A', '2026-02-16 20:56:28', '2026-02-16 20:56:58', 'S1 Informatika', '115911190894'),
(339, '240111018', 'IK2104', 3, '2024/2025', 1, 75.00, 75.00, 75.00, 0.00, 70.00, 90.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Anggit Wirasto, S.Si., M.Eng., M.Eng.', '', 77.00, 'A-', '2026-02-16 20:56:28', '2026-02-16 20:56:58', 'S1 Informatika', '115911190894'),
(340, '230111001', 'IK2102', 3, '2024/2025', 1, 70.94, 70.94, 70.94, 0.00, 63.67, 78.00, NULL, 'Anggit Wirasto, S.Si., M.Eng.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', '-', 70.90, 'B+', '2026-02-16 21:00:26', '2026-02-16 21:00:26', 'S1 Informatika', '115911190894'),
(341, '230111002', 'IK2102', 3, '2024/2025', 1, 77.56, 77.56, 77.56, 0.00, 84.67, 78.00, NULL, 'Anggit Wirasto, S.Si., M.Eng.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', '-', 79.07, 'A-', '2026-02-16 21:00:26', '2026-02-16 21:00:26', 'S1 Informatika', '115911190894'),
(342, '230111004', 'IK2102', 3, '2024/2025', 1, 77.56, 77.56, 77.56, 0.00, 73.67, 78.00, NULL, 'Anggit Wirasto, S.Si., M.Eng.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', '-', 76.87, 'A-', '2026-02-16 21:00:26', '2026-02-16 21:00:26', 'S1 Informatika', '115911190894'),
(343, '230111005', 'IK2102', 3, '2024/2025', 1, 69.94, 69.94, 69.94, 0.00, 69.67, 78.00, NULL, 'Anggit Wirasto, S.Si., M.Eng.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', '-', 71.50, 'B+', '2026-02-16 21:00:26', '2026-02-16 21:00:26', 'S1 Informatika', '115911190894'),
(344, '230111007', 'IK2102', 3, '2024/2025', 1, 78.50, 78.50, 78.50, 0.00, 73.67, 78.00, NULL, 'Anggit Wirasto, S.Si., M.Eng.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', '-', 77.43, 'A-', '2026-02-16 21:00:26', '2026-02-16 21:00:26', 'S1 Informatika', '115911190894'),
(345, '230111009', 'IK2102', 3, '2024/2025', 1, 79.44, 79.44, 79.44, 0.00, 68.67, 78.00, NULL, 'Anggit Wirasto, S.Si., M.Eng.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', '-', 77.00, 'A-', '2026-02-16 21:00:26', '2026-02-16 21:00:26', 'S1 Informatika', '115911190894'),
(346, '230111010', 'IK2102', 3, '2024/2025', 1, 69.00, 69.00, 69.00, 0.00, 82.00, 73.00, NULL, 'Anggit Wirasto, S.Si., M.Eng.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', '-', 72.40, 'B+', '2026-02-16 21:00:26', '2026-02-16 21:00:26', 'S1 Informatika', '115911190894'),
(347, '230111011', 'IK2102', 3, '2024/2025', 1, 77.56, 77.56, 77.56, 0.00, 75.67, 68.00, NULL, 'Anggit Wirasto, S.Si., M.Eng.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', '-', 75.27, 'A-', '2026-02-16 21:00:26', '2026-02-16 21:00:26', 'S1 Informatika', '115911190894'),
(348, '240111016', 'IK2102', 3, '2024/2025', 1, 53.78, 53.78, 53.78, 0.00, 75.00, 68.00, NULL, 'Anggit Wirasto, S.Si., M.Eng.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', '-', 60.87, 'B-', '2026-02-16 21:00:26', '2026-02-16 21:00:26', 'S1 Informatika', '115911190894'),
(349, '240111017', 'IK2102', 3, '2024/2025', 1, 45.44, 45.44, 45.44, 0.00, 75.67, 78.00, NULL, 'Anggit Wirasto, S.Si., M.Eng.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', '-', 58.00, 'C+', '2026-02-16 21:00:26', '2026-02-16 21:00:26', 'S1 Informatika', '115911190894'),
(350, '240111018', 'IK2102', 3, '2024/2025', 1, 76.50, 76.50, 76.50, 0.00, 78.00, 76.00, NULL, 'Anggit Wirasto, S.Si., M.Eng.', 'Jatmiko Indriyanto, S.Kom., M.Kom.', '-', 76.60, 'A-', '2026-02-16 21:00:26', '2026-02-16 21:00:26', 'S1 Informatika', '115911190894'),
(351, '230111001', 'IK2106', 3, '2024/2025', 1, 83.33, 83.33, 83.33, 0.00, 85.00, 84.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 83.80, 'A', '2026-02-16 21:02:20', '2026-02-16 21:02:20', 'S1 Informatika', '115911190894'),
(352, '230111002', 'IK2106', 3, '2024/2025', 1, 83.33, 83.33, 83.33, 0.00, 90.00, 90.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 86.00, 'A', '2026-02-16 21:02:20', '2026-02-16 21:02:20', 'S1 Informatika', '115911190894'),
(353, '230111004', 'IK2106', 3, '2024/2025', 1, 83.33, 83.33, 83.33, 0.00, 87.00, 87.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 84.80, 'A', '2026-02-16 21:02:20', '2026-02-16 21:02:20', 'S1 Informatika', '115911190894'),
(354, '230111005', 'IK2106', 3, '2024/2025', 1, 83.33, 83.33, 83.33, 0.00, 90.00, 89.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 85.80, 'A', '2026-02-16 21:02:20', '2026-02-16 21:02:20', 'S1 Informatika', '115911190894'),
(355, '230111007', 'IK2106', 3, '2024/2025', 1, 83.33, 83.33, 83.33, 0.00, 85.00, 92.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 85.40, 'A', '2026-02-16 21:02:20', '2026-02-16 21:02:20', 'S1 Informatika', '115911190894'),
(356, '230111009', 'IK2106', 3, '2024/2025', 1, 83.33, 83.33, 83.33, 0.00, 90.00, 92.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 86.40, 'A', '2026-02-16 21:02:20', '2026-02-16 21:02:20', 'S1 Informatika', '115911190894'),
(357, '230111010', 'IK2106', 3, '2024/2025', 1, 83.33, 83.33, 83.33, 0.00, 90.00, 86.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 85.20, 'A', '2026-02-16 21:02:20', '2026-02-16 21:02:20', 'S1 Informatika', '115911190894'),
(358, '230111011', 'IK2106', 3, '2024/2025', 1, 73.33, 73.33, 73.33, 0.00, 85.00, 89.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 78.80, 'A-', '2026-02-16 21:02:20', '2026-02-16 21:02:20', 'S1 Informatika', '115911190894'),
(359, '240111016', 'IK2106', 3, '2024/2025', 1, 56.67, 56.67, 56.67, 0.00, 85.00, 85.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 68.00, 'B', '2026-02-16 21:02:20', '2026-02-16 21:02:20', 'S1 Informatika', '115911190894'),
(360, '240111017', 'IK2106', 3, '2024/2025', 1, 56.67, 56.67, 56.67, 0.00, 90.00, 75.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 67.00, 'B', '2026-02-16 21:02:20', '2026-02-16 21:02:20', 'S1 Informatika', '115911190894'),
(361, '240111018', 'IK2106', 3, '2024/2025', 1, 83.33, 83.33, 83.33, 0.00, 85.00, 95.00, NULL, 'ROSYID RIDLO AL HAKIM, S.KOM., S.SI., M.T.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 86.00, 'A', '2026-02-16 21:02:20', '2026-02-16 21:02:20', 'S1 Informatika', '115911190894'),
(362, '230111001', 'IK2103', 3, '2024/2025', 1, 100.00, 79.10, 79.10, 80.00, 98.00, 87.00, NULL, 'Imam Ahmad Ashari., S.Kom., M.Kom.', 'Anggit Wirasto, S.Si.,M.Eng.', 'Arif Setia Sandi, S.Kom., M.Kom. ', 88.07, 'A', '2026-02-16 21:04:01', '2026-02-16 21:04:01', 'S1 Informatika', '115911190894'),
(363, '230111002', 'IK2103', 3, '2024/2025', 1, 100.00, 79.40, 79.40, 80.00, 95.00, 84.00, NULL, 'Imam Ahmad Ashari., S.Kom., M.Kom.', 'Anggit Wirasto, S.Si.,M.Eng.', 'Arif Setia Sandi, S.Kom., M.Kom. ', 86.63, 'A', '2026-02-16 21:04:01', '2026-02-16 21:04:01', 'S1 Informatika', '115911190894'),
(364, '230111004', 'IK2103', 3, '2024/2025', 1, 100.00, 78.30, 78.30, 79.10, 84.00, 79.00, NULL, 'Imam Ahmad Ashari., S.Kom., M.Kom.', 'Anggit Wirasto, S.Si.,M.Eng.', 'Arif Setia Sandi, S.Kom., M.Kom. ', 82.23, 'A', '2026-02-16 21:04:01', '2026-02-16 21:04:01', 'S1 Informatika', '115911190894'),
(365, '230111005', 'IK2103', 3, '2024/2025', 1, 93.75, 79.30, 79.30, 80.00, 98.00, 89.00, NULL, 'Imam Ahmad Ashari., S.Kom., M.Kom.', 'Anggit Wirasto, S.Si.,M.Eng.', 'Arif Setia Sandi, S.Kom., M.Kom. ', 87.99, 'A', '2026-02-16 21:04:01', '2026-02-16 21:04:01', 'S1 Informatika', '115911190894'),
(366, '230111007', 'IK2103', 3, '2024/2025', 1, 100.00, 79.00, 79.00, 79.70, 80.00, 77.00, NULL, 'Imam Ahmad Ashari., S.Kom., M.Kom.', 'Anggit Wirasto, S.Si.,M.Eng.', 'Arif Setia Sandi, S.Kom., M.Kom. ', 80.99, 'A', '2026-02-16 21:04:01', '2026-02-16 21:04:01', 'S1 Informatika', '115911190894'),
(367, '230111009', 'IK2103', 3, '2024/2025', 1, 93.75, 78.60, 78.60, 80.00, 96.00, 91.00, NULL, 'Imam Ahmad Ashari., S.Kom., M.Kom.', 'Anggit Wirasto, S.Si.,M.Eng.', 'Arif Setia Sandi, S.Kom., M.Kom. ', 87.85, 'A', '2026-02-16 21:04:01', '2026-02-16 21:04:01', 'S1 Informatika', '115911190894'),
(368, '230111010', 'IK2103', 3, '2024/2025', 1, 100.00, 77.50, 77.50, 79.30, 90.00, 85.00, NULL, 'Imam Ahmad Ashari., S.Kom., M.Kom.', 'Anggit Wirasto, S.Si.,M.Eng.', 'Arif Setia Sandi, S.Kom., M.Kom. ', 85.11, 'A', '2026-02-16 21:04:01', '2026-02-16 21:04:01', 'S1 Informatika', '115911190894'),
(369, '230111011', 'IK2103', 3, '2024/2025', 1, 100.00, 69.70, 69.70, 78.90, 83.00, 74.00, NULL, 'Imam Ahmad Ashari., S.Kom., M.Kom.', 'Anggit Wirasto, S.Si.,M.Eng.', 'Arif Setia Sandi, S.Kom., M.Kom. ', 78.97, 'A-', '2026-02-16 21:04:01', '2026-02-16 21:04:01', 'S1 Informatika', '115911190894'),
(370, '240111016', 'IK2103', 3, '2024/2025', 1, 87.50, 70.30, 70.30, 31.50, 88.00, 75.00, NULL, 'Imam Ahmad Ashari., S.Kom., M.Kom.', 'Anggit Wirasto, S.Si.,M.Eng.', 'Arif Setia Sandi, S.Kom., M.Kom. ', 69.86, 'B', '2026-02-16 21:04:01', '2026-02-16 21:04:01', 'S1 Informatika', '115911190894');
INSERT INTO `penilaian_komponens` (`id`, `nim`, `kode_mk`, `smt`, `tahun_akademik`, `user_id`, `kehadiran`, `tugas`, `kuiz`, `praktik`, `uts`, `uas`, `nilai_mbkm`, `dosen1`, `dosen2`, `dosen3`, `nilai_akhir`, `nilai_huruf`, `created_at`, `updated_at`, `prodi`, `nik`) VALUES
(371, '240111017', 'IK2103', 3, '2024/2025', 1, 100.00, 54.70, 54.70, 79.40, 98.00, 87.00, NULL, 'Imam Ahmad Ashari., S.Kom., M.Kom.', 'Anggit Wirasto, S.Si.,M.Eng.', 'Arif Setia Sandi, S.Kom., M.Kom. ', 83.07, 'A', '2026-02-16 21:04:01', '2026-02-16 21:04:01', 'S1 Informatika', '115911190894'),
(372, '240111018', 'IK2103', 3, '2024/2025', 1, 100.00, 45.40, 45.40, 71.20, 85.00, 75.00, NULL, 'Imam Ahmad Ashari., S.Kom., M.Kom.', 'Anggit Wirasto, S.Si.,M.Eng.', 'Arif Setia Sandi, S.Kom., M.Kom. ', 73.32, 'B+', '2026-02-16 21:04:01', '2026-02-16 21:04:01', 'S1 Informatika', '115911190894'),
(373, '230111001', 'IK2105', 3, '2024/2025', 1, 87.00, 81.00, 72.00, 0.00, 89.00, 75.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 81.20, 'A', '2026-02-16 21:06:01', '2026-02-16 21:06:01', 'S1 Informatika', '115911190894'),
(374, '230111002', 'IK2105', 3, '2024/2025', 1, 80.00, 84.00, 74.00, 0.00, 89.00, 70.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 80.35, 'A', '2026-02-16 21:06:01', '2026-02-16 21:06:01', 'S1 Informatika', '115911190894'),
(375, '230111004', 'IK2105', 3, '2024/2025', 1, 86.00, 80.00, 86.00, 0.00, 80.00, 72.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 79.20, 'A-', '2026-02-16 21:06:01', '2026-02-16 21:06:01', 'S1 Informatika', '115911190894'),
(376, '230111005', 'IK2105', 3, '2024/2025', 1, 75.00, 83.00, 76.00, 0.00, 87.00, 84.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 82.75, 'A', '2026-02-16 21:06:01', '2026-02-16 21:06:01', 'S1 Informatika', '115911190894'),
(377, '230111007', 'IK2105', 3, '2024/2025', 1, 77.00, 81.00, 70.00, 0.00, 80.00, 82.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 79.50, 'A-', '2026-02-16 21:06:01', '2026-02-16 21:06:01', 'S1 Informatika', '115911190894'),
(378, '230111009', 'IK2105', 3, '2024/2025', 1, 84.00, 89.00, 85.00, 0.00, 90.00, 77.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 85.35, 'A', '2026-02-16 21:06:01', '2026-02-16 21:06:01', 'S1 Informatika', '115911190894'),
(379, '230111010', 'IK2105', 3, '2024/2025', 1, 75.00, 80.00, 70.00, 0.00, 80.00, 82.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 79.00, 'A-', '2026-02-16 21:06:01', '2026-02-16 21:06:01', 'S1 Informatika', '115911190894'),
(380, '230111011', 'IK2105', 3, '2024/2025', 1, 83.00, 80.00, 78.00, 0.00, 79.00, 71.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 77.60, 'A-', '2026-02-16 21:06:01', '2026-02-16 21:06:01', 'S1 Informatika', '115911190894'),
(381, '240111016', 'IK2105', 3, '2024/2025', 1, 83.00, 80.00, 80.00, 0.00, 78.00, 76.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 78.80, 'A-', '2026-02-16 21:06:01', '2026-02-16 21:06:01', 'S1 Informatika', '115911190894'),
(382, '240111017', 'IK2105', 3, '2024/2025', 1, 85.00, 85.00, 71.00, 0.00, 89.00, 85.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 84.60, 'A', '2026-02-16 21:06:01', '2026-02-16 21:06:01', 'S1 Informatika', '115911190894'),
(383, '240111018', 'IK2105', 3, '2024/2025', 1, 79.00, 80.00, 70.00, 0.00, 80.00, 81.00, NULL, 'Rian Ardianto, S.Kom., M.Kom.', 'Khoirun Nisa, S.Kom., M.Kom.', '-', 79.15, 'A-', '2026-02-16 21:06:01', '2026-02-16 21:06:01', 'S1 Informatika', '115911190894'),
(384, '230111001', 'IK2101', 3, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 87.00, 75.00, NULL, 'Ir. Purwono, S.Kom., M.Kom.', 'Tri Styo Famuji, S.Kom., M.Kom.', '-', 80.40, 'A', '2026-02-16 21:07:23', '2026-02-16 21:07:23', 'S1 Informatika', '115911190894'),
(385, '230111002', 'IK2101', 3, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 86.00, 74.00, NULL, 'Ir. Purwono, S.Kom., M.Kom.', 'Tri Styo Famuji, S.Kom., M.Kom.', '-', 80.00, 'A', '2026-02-16 21:07:23', '2026-02-16 21:07:23', 'S1 Informatika', '115911190894'),
(386, '230111004', 'IK2101', 3, '2024/2025', 1, 75.00, 75.00, 75.00, 0.00, 75.00, 72.00, NULL, 'Ir. Purwono, S.Kom., M.Kom.', 'Tri Styo Famuji, S.Kom., M.Kom.', '-', 74.40, 'B+', '2026-02-16 21:07:23', '2026-02-16 21:07:23', 'S1 Informatika', '115911190894'),
(387, '230111005', 'IK2101', 3, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 83.00, 80.00, NULL, 'Ir. Purwono, S.Kom., M.Kom.', 'Tri Styo Famuji, S.Kom., M.Kom.', '-', 80.60, 'A', '2026-02-16 21:07:23', '2026-02-16 21:07:23', 'S1 Informatika', '115911190894'),
(388, '230111007', 'IK2101', 3, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 70.00, 70.00, NULL, 'Ir. Purwono, S.Kom., M.Kom.', 'Tri Styo Famuji, S.Kom., M.Kom.', '-', 76.00, 'A-', '2026-02-16 21:07:23', '2026-02-16 21:07:23', 'S1 Informatika', '115911190894'),
(389, '230111009', 'IK2101', 3, '2024/2025', 1, 85.00, 85.00, 85.00, 0.00, 85.00, 91.00, NULL, 'Ir. Purwono, S.Kom., M.Kom.', 'Tri Styo Famuji, S.Kom., M.Kom.', '-', 86.20, 'A', '2026-02-16 21:07:23', '2026-02-16 21:07:23', 'S1 Informatika', '115911190894'),
(390, '230111010', 'IK2101', 3, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 70.00, 55.00, NULL, 'Ir. Purwono, S.Kom., M.Kom.', 'Tri Styo Famuji, S.Kom., M.Kom.', '-', 73.00, 'B+', '2026-02-16 21:07:23', '2026-02-16 21:07:23', 'S1 Informatika', '115911190894'),
(391, '230111011', 'IK2101', 3, '2024/2025', 1, 80.00, 80.00, 80.00, 0.00, 70.00, 40.00, NULL, 'Ir. Purwono, S.Kom., M.Kom.', 'Tri Styo Famuji, S.Kom., M.Kom.', '-', 70.00, 'B+', '2026-02-16 21:07:23', '2026-02-16 21:07:23', 'S1 Informatika', '115911190894'),
(392, '240111016', 'IK2101', 3, '2024/2025', 1, 85.00, 85.00, 85.00, 0.00, 60.00, 60.00, NULL, 'Ir. Purwono, S.Kom., M.Kom.', 'Tri Styo Famuji, S.Kom., M.Kom.', '-', 75.00, 'A-', '2026-02-16 21:07:23', '2026-02-16 21:07:23', 'S1 Informatika', '115911190894'),
(393, '240111017', 'IK2101', 3, '2024/2025', 1, 85.00, 85.00, 85.00, 0.00, 90.00, 90.00, NULL, 'Ir. Purwono, S.Kom., M.Kom.', 'Tri Styo Famuji, S.Kom., M.Kom.', '-', 87.00, 'A', '2026-02-16 21:07:23', '2026-02-16 21:07:23', 'S1 Informatika', '115911190894'),
(394, '240111018', 'IK2101', 3, '2024/2025', 1, 85.00, 85.00, 85.00, 0.00, 80.00, 81.00, NULL, 'Ir. Purwono, S.Kom., M.Kom.', 'Tri Styo Famuji, S.Kom., M.Kom.', '-', 83.20, 'A', '2026-02-16 21:07:23', '2026-02-16 21:07:23', 'S1 Informatika', '115911190894'),
(395, '230111001', 'MKFSIK2106', 3, '2024/2025', 3, 80.63, 80.63, 80.63, 0.00, 66.00, 85.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DInar Mustofa, M.Kom.', '-', 78.58, 'A-', '2026-02-16 21:08:40', '2026-03-01 19:00:57', 'S1 Informatika', '115911190894'),
(396, '230111002', 'MKFSIK2106', 3, '2024/2025', 3, 83.75, 83.75, 83.75, 0.00, 60.00, 85.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DInar Mustofa, M.Kom.', '-', 79.25, 'A-', '2026-02-16 21:08:40', '2026-03-01 19:00:57', 'S1 Informatika', '115911190894'),
(397, '230111004', 'MKFSIK2106', 3, '2024/2025', 3, 82.75, 82.75, 82.75, 0.00, 60.00, 85.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DInar Mustofa, M.Kom.', '-', 78.65, 'A-', '2026-02-16 21:08:40', '2026-03-01 19:00:57', 'S1 Informatika', '115911190894'),
(398, '230111005', 'MKFSIK2106', 3, '2024/2025', 3, 86.00, 86.00, 86.00, 0.00, 60.00, 85.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DInar Mustofa, M.Kom.', '-', 80.60, 'A', '2026-02-16 21:08:40', '2026-03-01 19:00:57', 'S1 Informatika', '115911190894'),
(399, '230111007', 'MKFSIK2106', 3, '2024/2025', 3, 79.38, 79.38, 79.38, 0.00, 60.00, 85.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DInar Mustofa, M.Kom.', '-', 76.63, 'A-', '2026-02-16 21:08:40', '2026-03-01 19:00:57', 'S1 Informatika', '115911190894'),
(400, '230111009', 'MKFSIK2106', 3, '2024/2025', 3, 81.50, 81.50, 81.50, 0.00, 60.00, 100.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DInar Mustofa, M.Kom.', '-', 80.90, 'A', '2026-02-16 21:08:40', '2026-03-01 19:00:57', 'S1 Informatika', '115911190894'),
(401, '230111010', 'MKFSIK2106', 3, '2024/2025', 3, 78.88, 78.88, 78.88, 0.00, 60.00, 85.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DInar Mustofa, M.Kom.', '-', 76.33, 'A-', '2026-02-16 21:08:40', '2026-03-01 19:00:57', 'S1 Informatika', '115911190894'),
(402, '230111011', 'MKFSIK2106', 3, '2024/2025', 3, 80.63, 80.63, 80.63, 0.00, 60.00, 85.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DInar Mustofa, M.Kom.', '-', 77.38, 'A-', '2026-02-16 21:08:40', '2026-03-01 19:00:57', 'S1 Informatika', '115911190894'),
(403, '240111016', 'MKFSIK2106', 3, '2024/2025', 3, 73.13, 73.13, 73.13, 0.00, 66.00, 85.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DInar Mustofa, M.Kom.', '-', 74.08, 'B+', '2026-02-16 21:08:40', '2026-03-01 19:00:57', 'S1 Informatika', '115911190894'),
(404, '240111017', 'MKFSIK2106', 3, '2024/2025', 3, 82.50, 82.50, 82.50, 0.00, 60.00, 100.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DInar Mustofa, M.Kom.', '-', 81.50, 'A', '2026-02-16 21:08:40', '2026-03-01 19:00:57', 'S1 Informatika', '115911190894'),
(405, '240111018', 'MKFSIK2106', 3, '2024/2025', 3, 81.38, 81.38, 81.38, 0.00, 60.00, 85.00, NULL, 'DENY NUGROHO TRIWIBOWO, S.KOM., M.KOM.', 'DInar Mustofa, M.Kom.', '-', 77.83, 'A-', '2026-02-16 21:08:40', '2026-03-01 19:00:57', 'S1 Informatika', '115911190894'),
(406, '230111001', 'IK2206', 4, '2024/2025', 3, 82.50, 82.50, 82.50, 0.00, 78.00, 85.00, NULL, 'Ir. Purwono, M.Kom', '-', '-', 82.10, 'A', '2026-03-01 19:20:23', '2026-03-01 19:23:49', 'S1 Informatika', '115911190894'),
(407, '230111002', 'IK2206', 4, '2024/2025', 3, 81.67, 81.67, 81.67, 0.00, 78.00, 90.00, NULL, 'Ir. Purwono, M.Kom', '-', '-', 82.60, 'A', '2026-03-01 19:20:23', '2026-03-01 19:23:49', 'S1 Informatika', '115911190894'),
(408, '230111004', 'IK2206', 4, '2024/2025', 3, 66.83, 66.83, 66.83, 0.00, 76.00, 80.00, NULL, 'Ir. Purwono, M.Kom', '-', '-', 71.30, 'B+', '2026-03-01 19:20:23', '2026-03-01 19:23:49', 'S1 Informatika', '115911190894'),
(409, '230111005', 'IK2206', 4, '2024/2025', 3, 81.67, 81.67, 81.67, 0.00, 78.00, 90.00, NULL, 'Ir. Purwono, M.Kom', '-', '-', 82.60, 'A', '2026-03-01 19:20:23', '2026-03-01 19:23:49', 'S1 Informatika', '115911190894'),
(410, '230111007', 'IK2206', 4, '2024/2025', 3, 65.50, 65.50, 65.50, 0.00, 74.00, 85.00, NULL, 'Ir. Purwono, M.Kom', '-', '-', 71.10, 'B+', '2026-03-01 19:20:23', '2026-03-01 19:23:49', 'S1 Informatika', '115911190894'),
(411, '230111009', 'IK2206', 4, '2024/2025', 3, 85.67, 85.67, 85.67, 0.00, 86.00, 90.00, NULL, 'Ir. Purwono, M.Kom', '-', '-', 86.60, 'A', '2026-03-01 19:20:23', '2026-03-01 19:23:49', 'S1 Informatika', '115911190894'),
(412, '230111010', 'IK2206', 4, '2024/2025', 3, 81.33, 81.33, 81.33, 0.00, 78.00, 85.00, NULL, 'Ir. Purwono, M.Kom', '-', '-', 81.40, 'A', '2026-03-01 19:20:23', '2026-03-01 19:23:49', 'S1 Informatika', '115911190894'),
(413, '230111011', 'IK2206', 4, '2024/2025', 3, 64.17, 64.17, 64.17, 0.00, 60.00, 83.00, NULL, 'Ir. Purwono, M.Kom', '-', '-', 67.10, 'B', '2026-03-01 19:20:23', '2026-03-01 19:23:49', 'S1 Informatika', '115911190894'),
(414, '240111016', 'IK2206', 4, '2024/2025', 3, 63.33, 63.33, 63.33, 0.00, 60.00, 78.00, NULL, 'Ir. Purwono, M.Kom', '-', '-', 65.60, 'B', '2026-03-01 19:20:23', '2026-03-01 19:23:49', 'S1 Informatika', '115911190894'),
(415, '240111017', 'IK2206', 4, '2024/2025', 3, 84.17, 84.17, 84.17, 0.00, 84.00, 90.00, NULL, 'Ir. Purwono, M.Kom', '-', '-', 85.30, 'A', '2026-03-01 19:20:23', '2026-03-01 19:23:49', 'S1 Informatika', '115911190894'),
(416, '240111018', 'IK2206', 4, '2024/2025', 3, 67.50, 67.50, 67.50, 0.00, 78.00, 78.00, NULL, 'Ir. Purwono, M.Kom', '-', '-', 71.70, 'B+', '2026-03-01 19:20:23', '2026-03-01 19:23:49', 'S1 Informatika', '115911190894');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portofolios`
--

CREATE TABLE `portofolios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_mk` varchar(255) NOT NULL,
  `angkatan` varchar(4) NOT NULL,
  `link_rps` text DEFAULT NULL,
  `prodi` varchar(100) DEFAULT NULL,
  `integrasi_penelitian` varchar(255) DEFAULT NULL,
  `integrasi_pengabmas` varchar(255) DEFAULT NULL,
  `lik_jurnal_pengajaran` varchar(255) DEFAULT NULL,
  `link_presensi_kehadiran_mahasiswa` varchar(255) DEFAULT NULL,
  `link_bahan_ajar` varchar(255) DEFAULT NULL,
  `link_analisis_soal` varchar(255) DEFAULT NULL,
  `link_sampel_pekerjaan_mahasiswa` varchar(255) DEFAULT NULL,
  `link_nilai_panjang` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `portofolios`
--

INSERT INTO `portofolios` (`id`, `kode_mk`, `angkatan`, `link_rps`, `prodi`, `integrasi_penelitian`, `integrasi_pengabmas`, `lik_jurnal_pengajaran`, `link_presensi_kehadiran_mahasiswa`, `link_bahan_ajar`, `link_analisis_soal`, `link_sampel_pekerjaan_mahasiswa`, `link_nilai_panjang`, `created_at`, `updated_at`) VALUES
(1, 'IK2105', '2024', 'https://docs.google.com/document/d/1bNiLsbvtK-o_7TMfJsO2I7q7__cBrf7n/edit?usp=drive_link&ouid=101875990558995035227&rtpof=true&sd=true', 'S1 Informatika', NULL, NULL, 'https://sampel-portofolio.com/', 'https://sampel-portofolio.com/', 'https://sampel-portofolio.com/', 'https://sampel-portofolio.com/', 'https://sampel-portofolio.com/', 'https://sampel-portofolio.com/', '2026-02-02 21:57:55', '2026-02-28 00:52:01'),
(2, 'IK2103', '2023', 'https://drive.google.com/drive/u/2/folders/1nVwsLru4Q3xuUaRphCfuYWHhnIQ2Dz5q', 'S1 Informatika', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-16 21:36:09', '2026-02-16 21:36:09'),
(3, 'MKFSIK1101', '2023', 'https://drive.google.com/drive/u/2/folders/1nVwsLru4Q3xuUaRphCfuYWHhnIQ2Dz5q', 'S1 Informatika', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-16 22:31:53', '2026-02-16 22:31:53'),
(4, 'MKFSIK1101', '2024', 'https://drive.google.com/drive/u/2/folders/1nVwsLru4Q3xuUaRphCfuYWHhnIQ2Dz5q', 'S1 Informatika', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-16 22:33:34', '2026-02-16 22:33:34'),
(5, 'MKDUIK1101', '2024', 'https://agama.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-21 19:25:42', '2026-02-21 19:25:42'),
(6, 'MKDUIK1102', '2024', 'https://gemini.google.com/app/e14d3e0aaa0f64f8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-21 19:27:51', '2026-02-21 19:27:51'),
(7, 'MKDUIK1103', '2024', 'https://gemini.google.com/app/e14d3e0aaa0f64f8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-21 19:31:34', '2026-02-21 19:31:34'),
(8, 'MKFSIK1102', '2024', 'https://gemini.google.com/app/e14d3e0aaa0f64f8', 'S1 Informatika', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-21 19:34:35', '2026-02-21 19:42:24'),
(9, 'IK1101', '2024', 'https://gemini.google.com/app/29e85f5e713d1227', 'S1 Informatika', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-25 22:01:29', '2026-02-25 22:01:29'),
(10, 'IK1101', '2023', 'https://gemini.google.com/app/29e85f5e713d1227', 'S1 Informatika', 'amonia', NULL, 'https://gemini.google.com/app/6f3a7c38f2a70f78', 'https://gemini.google.com/app/6f3a7c38f2a70f78', 'https://gemini.google.com/app/6f3a7c38f2a70f78', 'https://gemini.google.com/app/6f3a7c38f2a70f78', 'https://gemini.google.com/app/6f3a7c38f2a70f78', 'https://gemini.google.com/app/6f3a7c38f2a70f78', '2026-02-25 23:44:24', '2026-02-28 00:06:59');

-- --------------------------------------------------------

--
-- Table structure for table `portofolio_details`
--

CREATE TABLE `portofolio_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `portofolio_id` bigint(20) UNSIGNED NOT NULL,
  `kode_cpmk` varchar(255) NOT NULL,
  `refleksi_analisis` text DEFAULT NULL,
  `program_perbaikan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prodi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `portofolio_details`
--

INSERT INTO `portofolio_details` (`id`, `portofolio_id`, `kode_cpmk`, `refleksi_analisis`, `program_perbaikan`, `created_at`, `updated_at`, `prodi`) VALUES
(1, 1, 'CPMK042', '•	Partisipasi mahasiswa cenderung kurang aktif\n•	Persiapan UTS kurang\n', '•	Umpan balik aktivitas pembelajaran', '2026-02-02 21:57:55', '2026-02-02 21:57:55', 'S1 Informatika'),
(2, 1, 'CPMK081', '•	Laporan raktikum belum disinkronkan dengan materi kuliah.\n•		Menyeragamkan template laporan praktikum.\n', '•	Survei dan refleksi pembelajaran.\n•	Menyeragamkan template laporan praktikum\n', '2026-02-02 21:57:55', '2026-02-02 21:57:55', 'S1 Informatika'),
(3, 2, 'CPMK051', 'Rata rata tinggi, sudah OK', 'Dipertahankan', '2026-02-16 21:36:09', '2026-02-16 21:36:09', 'S1 Informatika'),
(4, 2, 'CPMK121', 'Rata rata tinggi, sudah OK', 'Dipertahankan', '2026-02-16 21:36:09', '2026-02-16 21:36:09', 'S1 Informatika'),
(5, 3, 'CPMK042', 'Masih perlu usaha keras bagi mahasiswa semester 1 untuk memahami dasar pemrograman dikarenakan kebanyakan bukan berasal dari jurusan ikomputer saat SMA/SMK/MA', 'Perlu ditingkatkan lagi', '2026-02-16 22:31:53', '2026-02-16 22:31:53', 'S1 Informatika'),
(6, 4, 'CPMK042', 'Masih banyak yang perlu dipelajari lagi', 'Perlu perbaikan', '2026-02-16 22:33:34', '2026-02-16 22:33:34', 'S1 Informatika'),
(7, 5, 'CPMK011', 'Bagus banget', 'Sudah Bagus', '2026-02-21 19:25:42', '2026-02-21 19:27:02', NULL),
(8, 6, 'CPMK012', 'bagys', 'bagys', '2026-02-21 19:27:51', '2026-02-21 19:27:51', NULL),
(9, 6, 'CPMK013', 'bagys', 'bagys', '2026-02-21 19:27:51', '2026-02-21 19:27:51', NULL),
(10, 7, 'CPMK012', 'bagus', 'bagus', '2026-02-21 19:31:34', '2026-02-21 19:31:34', NULL),
(11, 7, 'CPMK013', 'bagus', 'bagus', '2026-02-21 19:31:34', '2026-02-21 19:31:34', NULL),
(12, 8, 'CPMK051', 'bagus123455', 'bagus', '2026-02-21 19:34:35', '2026-02-21 19:42:24', NULL),
(13, 8, 'CPMK091', 'bagus', 'bagus', '2026-02-21 19:34:35', '2026-02-21 19:34:35', NULL),
(14, 9, 'CPMK091', 'tes1234567', 'tes1234567', '2026-02-25 22:01:29', '2026-02-25 22:01:29', NULL),
(15, 9, 'CPMK092', 'testes1234567', 'tes1234567', '2026-02-25 22:01:29', '2026-02-25 22:01:29', NULL),
(16, 9, 'CPMK093', 'testes1234567', 'testes1234567', '2026-02-25 22:01:29', '2026-02-25 22:01:29', NULL),
(17, 10, 'CPMK091', 'Meskipun persentase mahasiswa kategori tinggi telah melampaui target (72.73% dari target 60%), namun rerata nilai aktual (63.57) masih berada di bawah ambang batas skor minimal 70. Hal ini mengindikasikan adanya kesenjangan nilai yang cukup lebar antar mahasiswa, di mana sebagian besar sudah mencapai level tinggi namun skor keseluruhannya belum optimal.', 'Melakukan tinjauan ulang terhadap materi ajar atau metode penilaian agar lebih merata. Memberikan sesi penguatan atau tugas tambahan bagi kelompok mahasiswa yang belum mencapai skor 70 agar rerata kelas dapat meningkat sesuai target.', '2026-02-25 23:44:24', '2026-02-26 01:11:48', NULL),
(18, 10, 'CPMK092', 'Ketercapaian pada CPMK ini sangat rendah karena rerata nilai dan persentase kategori tinggi masih berada di angka 0%. Hal ini menunjukkan kemungkinan materi belum tersampaikan sepenuhnya, metode asesmen yang belum dilakukan, atau adanya kendala teknis dalam pengumpulan data nilai mahasiswa.', 'Melakukan evaluasi menyeluruh terhadap pelaksanaan pembelajaran untuk CPMK ini. Jika penilaian belum dilakukan, maka perlu dijadwalkan ulang. Jika sudah dilakukan namun nilai rendah, perlu dilakukan remedial atau perubahan metode penyampaian materi agar lebih mudah dipahami mahasiswa.', '2026-02-25 23:44:24', '2026-02-26 01:11:48', NULL),
(19, 10, 'CPMK093', 'Hasil evaluasi menunjukkan kinerja yang belum memenuhi target di kedua parameter. Rerata nilai hanya mencapai 56.11 (target ≥ 70) dan persentase mahasiswa kategori tinggi hanya 27.27% (target minimal 60%). Kondisi ini menunjukkan bahwa materi pada CPMK ini dianggap sulit oleh mayoritas mahasiswa.', 'Menerapkan metode pembelajaran yang lebih interaktif atau berbasis praktikum untuk membantu pemahaman materi. Diperlukan asistensi tambahan atau kelompok belajar (peer teaching) untuk membantu 72.73% mahasiswa yang belum masuk kategori tinggi agar dapat meningkatkan capaian belajarnya.', '2026-02-25 23:44:24', '2026-02-26 01:11:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fakultas_id` bigint(20) UNSIGNED NOT NULL,
  `nama_prodi` varchar(255) NOT NULL,
  `kode_prodi` varchar(255) NOT NULL,
  `jenjang` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`id`, `fakultas_id`, `nama_prodi`, `kode_prodi`, `jenjang`, `created_at`, `updated_at`) VALUES
(1, 1, 'S1 Keperawatan', 'KEP-S1', 'S1', '2026-02-18 06:56:47', '2026-02-18 06:56:47'),
(2, 1, 'S1 Farmasi', 'FAR-S1', 'S1', '2026-02-18 06:56:47', '2026-02-18 06:56:47'),
(3, 1, 'D3 Keperawatan', 'KEP-D3', 'D3', '2026-02-18 06:56:47', '2026-02-18 06:56:47'),
(4, 1, 'S1 Kebidanan', 'KEB-S1', 'S1', '2026-02-18 06:56:47', '2026-02-18 06:56:47'),
(5, 1, 'D4 Keperawatan Anestesiologi', 'ANES-D4', 'D4', '2026-02-18 06:56:47', '2026-02-18 06:56:47'),
(6, 1, 'Profesi Ners', 'NERS-P', 'Profesi', '2026-02-18 06:56:47', '2026-02-18 06:56:47'),
(7, 1, 'Profesi Apoteker', 'APT-P', 'Profesi', '2026-02-18 06:56:47', '2026-02-18 06:56:47'),
(8, 1, 'Profesi Kebidanan', 'KEB-P', 'Profesi', '2026-02-18 06:56:47', '2026-02-18 06:56:47'),
(9, 3, 'S1 Hukum', 'HKM-S1', 'S1', '2026-02-18 06:56:47', '2026-02-18 06:56:47'),
(10, 3, 'S1 Akuntansi', 'AKT-S1', 'S1', '2026-02-18 06:56:47', '2026-02-18 06:56:47'),
(11, 3, 'S1 Manajemen', 'MAN-S1', 'S1', '2026-02-18 06:56:47', '2026-02-18 06:56:47'),
(12, 3, 'S1 Pendidikan Bahasa Inggris', 'PBI-S1', 'S1', '2026-02-18 06:56:47', '2026-02-18 06:56:47'),
(13, 2, 'S1 Informatika', 'INF-S1', 'S1', '2026-02-18 06:56:47', '2026-02-18 06:56:47'),
(14, 2, 'S1 Sistem Informasi', 'SI-S1', 'S1', '2026-02-18 06:56:47', '2026-02-18 06:56:47');

-- --------------------------------------------------------

--
-- Table structure for table `profil_lulusan`
--

CREATE TABLE `profil_lulusan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_pl` varchar(255) NOT NULL,
  `deskripsi_pl` text NOT NULL,
  `profesi` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prodi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profil_lulusan`
--

INSERT INTO `profil_lulusan` (`id`, `kode_pl`, `deskripsi_pl`, `profesi`, `created_at`, `updated_at`, `prodi`) VALUES
(1, 'PL01', 'Lulusan memiliki kemampuan menganalisis persoalan computing serta menerapkan prinsip-prinsip computing dan disiplin ilmu relevan lainnya untuk mengidentifikasi solusi bagi organisasi.', 'Software Developer, Program Analyst, Database Programmer, AI Engineer', '2026-01-19 04:48:53', '2026-01-19 04:48:53', 'S1 Informatika'),
(2, 'PL02', 'Lulusan memiliki kemampuan mendesain, mengimplementasi dan mengevaluasi solusi berbasis computing yang memenuhi kebutuhan dalam dunia industri dan khususnya pada bidang kesehatan dengan pendekatan yang sesuai.', 'Software Developer, Health IT Specialist', '2026-01-19 04:48:53', '2026-01-19 04:48:53', 'S1 Informatika'),
(3, 'PL03', 'Lulusan memiliki tanggung jawab profesional, semangat kemandirian, daya juang, kewirausahaan dan ber-budaya', 'Entrepreneur, Professional Consultant', '2026-01-19 04:48:53', '2026-01-19 04:48:53', 'S1 Informatika'),
(4, 'PL04', 'Lulusan memiliki jiwa kepemimpinan, mampu berkomunikasi serta menunjukkan kinerja bermutu', 'Project Manager, Team Leader', '2026-01-19 04:48:53', '2026-01-19 04:48:53', 'S1 Informatika'),
(5, 'PL05', 'Lulusan memiliki kemampuan menganalisis, mendesain, mengimplementasi, mengevaluasi serta mengelola data dan informasi dengan menggunakan sistem cerdas, khususnya di bidang kesehatan', 'Data Scientist, AI Researcher', '2026-01-19 04:48:53', '2026-01-19 04:48:53', 'S1 Informatika'),
(16, 'PL01', 'Lulusan memiliki kemampuan menganalisis, merancang, membuat, dan melakukan evaluasi sistem informasi yang selaras dengan tujuan organisasi. (IS2020)', 'Application developer, System Analyst, IT Consultant, Data Engineer, Data Analyst', '2026-02-20 07:09:48', '2026-02-20 07:09:48', 'S1 Sistem Informasi'),
(17, 'PL02', 'Lulusan memiliki kemampuan memahami, menerapkan dan mengintegrasikan model sistem, menggunakan metode dan berbagai teknik peningkatan bisnis proses yang mendatangkan suatu nilai untuk organisasi. (IS2020)', 'Business Process Analyst, Systems Integrator', '2026-02-20 07:09:48', '2026-02-20 07:09:48', 'S1 Sistem Informasi'),
(18, 'PL03', 'Lulusan memiliki kemampuan untuk mengumpulkan, menyimpan, memanipulasi, menganalisis, dan menyajikan data, khususnya di bidang kesehatan untuk membantu organisasi dalam pengambilan keputusan.', 'Health Data Analyst, Database Administrator', '2026-02-20 07:09:48', '2026-02-20 07:09:48', 'S1 Sistem Informasi'),
(19, 'PL04', 'Lulusan memiliki tanggung jawab profesional, semangat kemandirian, daya juang, kewirausahaan dan ber-budaya', 'Entrepreneur, Professional Consultant', '2026-02-20 07:09:48', '2026-02-20 07:09:48', 'S1 Sistem Informasi'),
(20, 'PL05', 'Lulusan memiliki jiwa kepemimpinan, mampu berkomunikasi serta menunjukkan kinerja bermutu', 'Project Manager, Team Leader', '2026-02-20 07:09:48', '2026-02-20 07:09:48', 'S1 Sistem Informasi');

-- --------------------------------------------------------

--
-- Table structure for table `relasi_capaian`
--

CREATE TABLE `relasi_capaian` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_mk` varchar(255) NOT NULL,
  `kode_cpl` varchar(255) NOT NULL,
  `kode_cpmk` varchar(255) NOT NULL,
  `kode_sub_cpmk` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prodi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `relasi_capaian`
--

INSERT INTO `relasi_capaian` (`id`, `kode_mk`, `kode_cpl`, `kode_cpmk`, `kode_sub_cpmk`, `created_at`, `updated_at`, `prodi`) VALUES
(857, 'MKDUIK1101', 'CPL01', 'CPMK011', 'Sub-CPMK0111', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(858, 'MKDUIK1102', 'CPL01', 'CPMK012', 'Sub-CPMK0121', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(859, 'MKDUIK1102', 'CPL01', 'CPMK012', 'Sub-CPMK0122', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(860, 'MKDUIK1102', 'CPL01', 'CPMK013', 'Sub-CPMK0131', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(861, 'MKDUIK1103', 'CPL01', 'CPMK012', 'Sub-CPMK0121', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(862, 'MKDUIK1103', 'CPL01', 'CPMK012', 'Sub-CPMK0122', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(863, 'MKDUIK1103', 'CPL01', 'CPMK013', 'Sub-CPMK0131', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(864, 'MKFSIK1101', 'CPL04', 'CPMK042', 'Sub-CPMK0421', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(865, 'MKFSIK1101', 'CPL04', 'CPMK042', 'Sub-CPMK0422', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(866, 'MKFSIK1101', 'CPL04', 'CPMK042', 'Sub-CPMK0423', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(867, 'MKFSIK1102', 'CPL05', 'CPMK051', 'Sub-CPMK0511', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(868, 'MKFSIK1102', 'CPL09', 'CPMK091', 'Sub-CPMK0911', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(869, 'IK1101', 'CPL09', 'CPMK091', 'Sub-CPMK0912', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(870, 'IK1101', 'CPL09', 'CPMK092', 'Sub-CPMK0923', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(871, 'IK1101', 'CPL09', 'CPMK093', 'Sub-CPMK0932', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(872, 'IK1102', 'CPL04', 'CPMK041', 'Sub-CPMK0411', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(873, 'IK1102', 'CPL04', 'CPMK041', 'Sub-CPMK0412', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(874, 'MKWUIK1204', 'CPL01', 'CPMK013', 'Sub-CPMK0131', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(875, 'MKWUIK1204', 'CPL01', 'CPMK013', 'Sub-CPMK0132', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(876, 'MKDUIK1204', 'CPL06', 'CPMK063', 'Sub-CPMK0631', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(877, 'MKDUIK1204', 'CPL06', 'CPMK063', 'Sub-CPMK0632', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(878, 'MKDUIK1204', 'CPL06', 'CPMK063', 'Sub-CPMK0633', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(879, 'MKFSIK1203', 'CPL08', 'CPMK084', 'Sub-CPMK0841', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(880, 'MKFSIK1203', 'CPL08', 'CPMK084', 'Sub-CPMK0842', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(881, 'MKFSIK1203', 'CPL08', 'CPMK084', 'Sub-CPMK0843', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(882, 'MKFSIK1203', 'CPL08', 'CPMK084', 'Sub-CPMK0844', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(883, 'MKFSIK1204', 'CPL04', 'CPMK043', 'Sub-CPMK0431', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(884, 'MKFSIK1204', 'CPL05', 'CPMK051', 'Sub-CPMK0513', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(885, 'MKFSIK1204', 'CPL05', 'CPMK051', 'Sub-CPMK0514', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(886, 'MKFSIK1204', 'CPL05', 'CPMK051', 'Sub-CPMK0515', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(887, 'MKFSIK1204', 'CPL05', 'CPMK051', 'Sub-CPMK0516', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(888, 'MKFSIK1205', 'CPL03', 'CPMK031', 'Sub-CPMK0311', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(889, 'MKFSIK1205', 'CPL03', 'CPMK031', 'Sub-CPMK0312', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(890, 'MKFSIK1205', 'CPL03', 'CPMK031', 'Sub-CPMK0313', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(891, 'MKFSIK1205', 'CPL05', 'CPMK052', 'Sub-CPMK0524', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(892, 'MKFSIK1205', 'CPL05', 'CPMK052', 'Sub-CPMK0525', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(893, 'MKFSIK1205', 'CPL05', 'CPMK052', 'Sub-CPMK0526', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(894, 'IK1201', 'CPL03', 'CPMK031', 'Sub-CPMK0314', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(895, 'IK1201', 'CPL03', 'CPMK031', 'Sub-CPMK0315', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(896, 'IK1201', 'CPL03', 'CPMK031', 'Sub-CPMK0316', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(897, 'IK1201', 'CPL05', 'CPMK052', 'Sub-CPMK0528', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(898, 'IK1202', 'CPL04', 'CPMK041', 'Sub-CPMK0413', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(899, 'IK1202', 'CPL05', 'CPMK052', 'Sub-CPMK0529', '2026-01-20 01:48:55', '2026-01-20 01:48:55', 'S1 Informatika'),
(955, 'MKFSIK2106', 'CPL03', 'CPMK031', 'Sub-CPMK0317', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(956, 'MKFSIK2106', 'CPL03', 'CPMK031', 'Sub-CPMK0318', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(957, 'MKFSIK2106', 'CPL03', 'CPMK031', 'Sub-CPMK0319', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(958, 'IK2101', 'CPL08', 'CPMK081', 'Sub-CPMK0812', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(959, 'IK2101', 'CPL08', 'CPMK084', 'Sub-CPMK0845', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(960, 'IK2101', 'CPL08', 'CPMK084', 'Sub-CPMK0846', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(961, 'IK2102', 'CPL04', 'CPMK041', 'Sub-CPMK0414', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(962, 'IK2102', 'CPL05', 'CPMK052', 'Sub-CPMK05210', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(963, 'IK2103', 'CPL05', 'CPMK051', 'Sub-CPMK0517', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(964, 'IK2103', 'CPL05', 'CPMK051', 'Sub-CPMK0518', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(965, 'IK2103', 'CPL05', 'CPMK051', 'Sub-CPMK0519', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(966, 'IK2103', 'CPL12', 'CPMK121', 'Sub-CPMK1211', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(967, 'IK2103', 'CPL12', 'CPMK121', 'Sub-CPMK1212', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(968, 'IK2103', 'CPL12', 'CPMK121', 'Sub-CPMK1213', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(969, 'IK2104', 'CPL04', 'CPMK041', 'Sub-CPMK0415', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(970, 'IK2104', 'CPL05', 'CPMK052', 'Sub-CPMK05211', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(971, 'IK2105', 'CPL04', 'CPMK042', 'Sub-CPMK0424', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(972, 'IK2105', 'CPL04', 'CPMK042', 'Sub-CPMK0425', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(973, 'IK2105', 'CPL08', 'CPMK081', 'Sub-CPMK0813', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(974, 'IK2105', 'CPL08', 'CPMK081', 'Sub-CPMK0814', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(975, 'IK2106', 'CPL04', 'CPMK041', 'Sub-CPMK0416', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(976, 'IK2106', 'CPL05', 'CPMK052', 'Sub-CPMK05211', '2026-01-20 01:49:51', '2026-01-20 01:49:51', 'S1 Informatika'),
(977, 'MKWUIK3101', 'CPL06', 'CPMK063', 'Sub-CPMK0634', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(978, 'MKWUIK3101', 'CPL06', 'CPMK063', 'Sub-CPMK0635', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(979, 'MKWUIK3101', 'CPL06', 'CPMK063', 'Sub-CPMK0636', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(980, 'MKFSIK3107', 'CPL06', 'CPMK063', 'Sub-CPMK0637', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(981, 'MKFSIK3107', 'CPL07', 'CPMK072', 'Sub-CPMK0721', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(982, 'IK3101', 'CPL04', 'CPMK042', 'Sub-CPMK0426', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(983, 'IK3101', 'CPL05', 'CPMK051', 'Sub-CPMK05111', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(984, 'IK3101', 'CPL05', 'CPMK051', 'Sub-CPMK05112', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(985, 'IK3101', 'CPL05', 'CPMK051', 'Sub-CPMK05113', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(986, 'IK3101', 'CPL10', 'CPMK102', 'Sub-CPMK1024', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(987, 'IK3101', 'CPL10', 'CPMK102', 'Sub-CPMK1025', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(988, 'IK3101', 'CPL10', 'CPMK102', 'Sub-CPMK1026', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(989, 'IK3102', 'CPL05', 'CPMK051', 'Sub-CPMK05117', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(990, 'IK3102', 'CPL06', 'CPMK061', 'Sub-CPMK0612', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(991, 'IK3102', 'CPL06', 'CPMK062', 'Sub-CPMK0621', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(992, 'IK3102', 'CPL06', 'CPMK063', 'Sub-CPMK0638', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(993, 'IK3103', 'CPL02', 'CPMK022', 'Sub-CPMK0222', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(994, 'IK3103', 'CPL02', 'CPMK024', 'Sub-CPMK0244', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(995, 'IK3103', 'CPL06', 'CPMK063', 'Sub-CPMK0639', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(996, 'IK3103', 'CPL08', 'CPMK081', 'Sub-CPMK0816', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(997, 'IK3104', 'CPL04', 'CPMK044', 'Sub-CPMK0444', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(998, 'IK3104', 'CPL04', 'CPMK044', 'Sub-CPMK0445', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(999, 'IK3104', 'CPL04', 'CPMK044', 'Sub-CPMK0446', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1000, 'IK3105', 'CPL03', 'CPMK032', 'Sub-CPMK0324', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1001, 'IK3105', 'CPL03', 'CPMK032', 'Sub-CPMK0325', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1002, 'IK3105', 'CPL03', 'CPMK032', 'Sub-CPMK0326', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1003, 'IK3105', 'CPL11', 'CPMK112', 'Sub-CPMK1123', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1004, 'IK3105', 'CPL11', 'CPMK112', 'Sub-CPMK1124', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1005, 'IK3106', 'CPL03', 'CPMK032', 'Sub-CPMK03211', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1006, 'IK3106', 'CPL13', 'CPMK137', 'Sub-CPMK1371', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1007, 'IK3106', 'CPL13', 'CPMK138', 'Sub-CPMK1381', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1008, 'IK3201', 'CPL05', 'CPMK051', 'Sub-CPMK05114', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1009, 'IK3201', 'CPL05', 'CPMK051', 'Sub-CPMK05115', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1010, 'IK3201', 'CPL05', 'CPMK051', 'Sub-CPMK05116', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1011, 'IK3201', 'CPL10', 'CPMK102', 'Sub-CPMK1027', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1012, 'IK3201', 'CPL10', 'CPMK102', 'Sub-CPMK1028', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1013, 'IK3201', 'CPL10', 'CPMK102', 'Sub-CPMK1029', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1014, 'IK3202', 'CPL04', 'CPMK044', 'Sub-CPMK0447', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1015, 'IK3202', 'CPL12', 'CPMK122', 'Sub-CPMK1221', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1016, 'IK3202', 'CPL12', 'CPMK123', 'Sub-CPMK1233', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1017, 'IK3203', 'CPL03', 'CPMK032', 'Sub-CPMK0327', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1018, 'IK3203', 'CPL03', 'CPMK032', 'Sub-CPMK0328', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1019, 'IK3203', 'CPL08', 'CPMK083', 'Sub-CPMK0836', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1020, 'IK3203', 'CPL08', 'CPMK083', 'Sub-CPMK0837', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1021, 'IK3204', 'CPL04', 'CPMK042', 'Sub-CPMK0427', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1022, 'IK3204', 'CPL10', 'CPMK101', 'Sub-CPMK1013', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1023, 'IK3204', 'CPL10', 'CPMK102', 'Sub-CPMK10210', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1024, 'IK3204', 'CPL10', 'CPMK103', 'Sub-CPMK1033', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1025, 'IK3204', 'CPL10', 'CPMK103', 'Sub-CPMK1034', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1026, 'IK3205', 'CPL04', 'CPMK043', 'Sub-CPMK0435', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1027, 'IK3205', 'CPL08', 'CPMK082', 'Sub-CPMK0828', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1028, 'IK3205', 'CPL11', 'CPMK111', 'Sub-CPMK1116', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1029, 'IK3206', 'CPL08', 'CPMK084', 'Sub-CPMK08411', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1030, 'IK3206', 'CPL10', 'CPMK101', 'Sub-CPMK1014', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1031, 'IK3206', 'CPL10', 'CPMK101', 'Sub-CPMK1015', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1032, 'IK3206', 'CPL12', 'CPMK121', 'Sub-CPMK1217', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1033, 'IK3206', 'CPL12', 'CPMK121', 'Sub-CPMK1218', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1034, 'IK3207', 'CPL09', 'CPMK091', 'Sub-CPMK0914', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1035, 'IK3207', 'CPL09', 'CPMK091', 'Sub-CPMK0915', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1036, 'IK3207', 'CPL12', 'CPMK121', 'Sub-CPMK1219', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1037, 'IK3207', 'CPL12', 'CPMK121', 'Sub-CPMK1210', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1038, 'IK3208', 'CPL09', 'CPMK093', 'Sub-CPMK0934', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1039, 'IK3208', 'CPL09', 'CPMK093', 'Sub-CPMK0935', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1040, 'IK3208', 'CPL12', 'CPMK122', 'Sub-CPMK1223', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1041, 'IK3209', 'CPL10', 'CPMK103', 'Sub-CPMK1035', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1042, 'IK3209', 'CPL11', 'CPMK113', 'Sub-CPMK1133', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1043, 'IK3209', 'CPL12', 'CPMK122', 'Sub-CPMK1224', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1044, 'IK3209', 'CPL12', 'CPMK123', 'Sub-CPMK1236', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1045, 'IK3109', 'CPL08', 'CPMK082', 'Sub-CPMK0829', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1046, 'IK3109', 'CPL12', 'CPMK121', 'Sub-CPMK1211', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1047, 'IK3109', 'CPL12', 'CPMK121', 'Sub-CPMK1212', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1048, 'IK3107', 'CPL09', 'CPMK091', 'Sub-CPMK0916', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1049, 'IK3107', 'CPL09', 'CPMK091', 'Sub-CPMK0917', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1050, 'IK3107', 'CPL09', 'CPMK092', 'Sub-CPMK0927', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1051, 'IK3107', 'CPL09', 'CPMK092', 'Sub-CPMK0928', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1052, 'IK3107', 'CPL09', 'CPMK093', 'Sub-CPMK0936', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1053, 'IK3210', 'CPL03', 'CPMK032', 'Sub-CPMK0329', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1054, 'IK3210', 'CPL04', 'CPMK044', 'Sub-CPMK04410', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1055, 'IK3210', 'CPL04', 'CPMK044', 'Sub-CPMK04411', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1056, 'IK3210', 'CPL08', 'CPMK083', 'Sub-CPMK0838', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1057, 'IK3210', 'CPL08', 'CPMK083', 'Sub-CPMK0839', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1058, 'IK3210', 'CPL11', 'CPMK111', 'Sub-CPMK1117', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1059, 'IK3210', 'CPL11', 'CPMK111', 'Sub-CPMK1118', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1060, 'IK3210', 'CPL11', 'CPMK111', 'Sub-CPMK1119', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1061, 'IK3211', 'CPL03', 'CPMK032', 'Sub-CPMK03210', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1062, 'IK3211', 'CPL04', 'CPMK044', 'Sub-CPMK04412', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1063, 'IK3211', 'CPL04', 'CPMK044', 'Sub-CPMK04413', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1064, 'IK3211', 'CPL08', 'CPMK083', 'Sub-CPMK08310', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1065, 'IK3211', 'CPL08', 'CPMK084', 'Sub-CPMK08412', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1066, 'IK3211', 'CPL11', 'CPMK112', 'Sub-CPMK1125', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1067, 'IK3211', 'CPL11', 'CPMK112', 'Sub-CPMK1126', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1068, 'IK3211', 'CPL11', 'CPMK113', 'Sub-CPMK1134', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1069, 'IK3212', 'CPL04', 'CPMK043', 'Sub-CPMK0436', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1070, 'IK3212', 'CPL08', 'CPMK082', 'Sub-CPMK08210', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1071, 'IK3212', 'CPL11', 'CPMK111', 'Sub-CPMK11110', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1072, 'IK3110', 'CPL04', 'CPMK043', 'Sub-CPMK0437', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1073, 'IK3110', 'CPL08', 'CPMK083', 'Sub-CPMK08311', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1074, 'IK3110', 'CPL11', 'CPMK112', 'Sub-CPMK1127', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1075, 'IK3110', 'CPL11', 'CPMK112', 'Sub-CPMK1128', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1076, 'IK3110', 'CPL11', 'CPMK112', 'Sub-CPMK1129', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1077, 'IK3108', 'CPL11', 'CPMK112', 'Sub-CPMK11210', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1078, 'IK3108', 'CPL11', 'CPMK112', 'Sub-CPMK11211', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1079, 'IK3108', 'CPL11', 'CPMK113', 'Sub-CPMK1135', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1080, 'IK3213', 'CPL08', 'CPMK081', 'Sub-CPMK0817', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1081, 'IK3213', 'CPL08', 'CPMK082', 'Sub-CPMK08211', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1082, 'IK3213', 'CPL08', 'CPMK083', 'Sub-CPMK08312', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1083, 'IK3213', 'CPL08', 'CPMK084', 'Sub-CPMK08413', '2026-01-20 01:50:48', '2026-01-20 01:50:48', 'S1 Informatika'),
(1084, 'MKWUIK4102', 'CPL05', 'CPMK052', 'Sub-CPMK05212', '2026-01-20 01:51:08', '2026-01-20 01:51:08', 'S1 Informatika'),
(1085, 'MKWUIK4102', 'CPL06', 'CPMK061', 'Sub-CPMK0611', '2026-01-20 01:51:08', '2026-01-20 01:51:08', 'S1 Informatika'),
(1086, 'IK4190', 'CPL05', 'CPMK052', 'Sub-CPMK05213', '2026-01-20 01:51:08', '2026-01-20 01:51:08', 'S1 Informatika'),
(1087, 'IK4190', 'CPL06', 'CPMK061', 'Sub-CPMK0611', '2026-01-20 01:51:08', '2026-01-20 01:51:08', 'S1 Informatika'),
(1088, 'IK4190', 'CPL06', 'CPMK062', 'Sub-CPMK0623', '2026-01-20 01:51:08', '2026-01-20 01:51:08', 'S1 Informatika'),
(1089, 'IK4291', 'CPL06', 'CPMK063', 'Sub-CPMK06310', '2026-01-20 01:51:08', '2026-01-20 01:51:08', 'S1 Informatika'),
(1090, 'IK4291', 'CPL07', 'CPMK071', 'Sub-CPMK0711', '2026-01-20 01:51:08', '2026-01-20 01:51:08', 'S1 Informatika'),
(1091, 'IK4291', 'CPL07', 'CPMK072', 'Sub-CPMK0726', '2026-01-20 01:51:08', '2026-01-20 01:51:08', 'S1 Informatika'),
(1092, 'IK4291', 'CPL07', 'CPMK072', 'Sub-CPMK0721', '2026-01-20 01:51:08', '2026-01-20 01:51:08', 'S1 Informatika'),
(1107, 'IK2203', 'CPL02', 'CPMK024', 'Sub-CPMK0242', '2026-01-20 01:54:23', '2026-01-20 01:54:23', 'S1 Informatika'),
(1108, 'IK2204', 'CPL04', 'CPMK043', 'Sub-CPMK0432', '2026-01-20 01:54:23', '2026-01-20 01:54:23', 'S1 Informatika'),
(1109, 'IK2204', 'CPL04', 'CPMK043', 'Sub-CPMK0433', '2026-01-20 01:54:23', '2026-01-20 01:54:23', 'S1 Informatika'),
(1110, 'IK2204', 'CPL04', 'CPMK043', 'Sub-CPMK0434', '2026-01-20 01:54:23', '2026-01-20 01:54:23', 'S1 Informatika'),
(1111, 'IK2205', 'CPL03', 'CPMK032', 'Sub-CPMK0321', '2026-01-20 01:54:23', '2026-01-20 01:54:23', 'S1 Informatika'),
(1112, 'IK2205', 'CPL08', 'CPMK082', 'Sub-CPMK0825', '2026-01-20 01:54:23', '2026-01-20 01:54:23', 'S1 Informatika'),
(1113, 'IK2205', 'CPL11', 'CPMK111', 'Sub-CPMK1111', '2026-01-20 01:54:23', '2026-01-20 01:54:23', 'S1 Informatika'),
(1114, 'IK2205', 'CPL11', 'CPMK111', 'Sub-CPMK1112', '2026-01-20 01:54:23', '2026-01-20 01:54:23', 'S1 Informatika'),
(1115, 'IK2206', 'CPL05', 'CPMK051', 'Sub-CPMK05110', '2026-01-20 01:54:23', '2026-01-20 01:54:23', 'S1 Informatika'),
(1116, 'IK2206', 'CPL08', 'CPMK081', 'Sub-CPMK0815', '2026-01-20 01:54:23', '2026-01-20 01:54:23', 'S1 Informatika'),
(1117, 'IK2206', 'CPL09', 'CPMK091', 'Sub-CPMK0913', '2026-01-20 01:54:23', '2026-01-20 01:54:23', 'S1 Informatika'),
(1118, 'IK2206', 'CPL09', 'CPMK092', 'Sub-CPMK0926', '2026-01-20 01:54:23', '2026-01-20 01:54:23', 'S1 Informatika'),
(1119, 'IK2206', 'CPL09', 'CPMK093', 'Sub-CPMK0933', '2026-01-20 01:54:23', '2026-01-20 01:54:23', 'S1 Informatika'),
(1120, 'IK2206', 'CPL10', 'CPMK101', 'Sub-CPMK1012', '2026-01-20 01:54:23', '2026-01-20 01:54:23', 'S1 Informatika'),
(1121, 'IK2207', 'CPL04', 'CPMK044', 'Sub-CPMK0441', '2026-01-20 01:54:23', '2026-01-20 01:54:23', 'S1 Informatika'),
(1122, 'IK2207', 'CPL04', 'CPMK044', 'Sub-CPMK0442', '2026-01-20 01:54:23', '2026-01-20 01:54:23', 'S1 Informatika'),
(1123, 'IK2207', 'CPL11', 'CPMK112', 'Sub-CPMK1121', '2026-01-20 01:54:23', '2026-01-20 01:54:23', 'S1 Informatika'),
(1124, 'IK2207', 'CPL11', 'CPMK112', 'Sub-CPMK1122', '2026-01-20 01:54:23', '2026-01-20 01:54:23', 'S1 Informatika'),
(1125, 'IK2207', 'CPL11', 'CPMK112', 'Sub-CPMK1123', '2026-01-20 01:54:23', '2026-01-20 01:54:23', 'S1 Informatika'),
(1126, 'MKWUIK2203', 'CPL02', 'CPMK023', 'Sub-CPMK0231', '2026-01-20 01:54:49', '2026-01-20 01:54:49', 'S1 Informatika'),
(1127, 'MKWUIK2203', 'CPL02', 'CPMK024', 'Sub-CPMK0241', '2026-01-20 01:54:49', '2026-01-20 01:54:49', 'S1 Informatika'),
(1128, 'IK2201', 'CPL08', 'CPMK084', 'Sub-CPMK0847', '2026-01-20 01:54:49', '2026-01-20 01:54:49', 'S1 Informatika'),
(1129, 'IK2201', 'CPL09', 'CPMK092', 'Sub-CPMK0925', '2026-01-20 01:54:49', '2026-01-20 01:54:49', 'S1 Informatika'),
(1130, 'IK2201', 'CPL10', 'CPMK102', 'Sub-CPMK1022', '2026-01-20 01:54:49', '2026-01-20 01:54:49', 'S1 Informatika'),
(1131, 'IK2201', 'CPL10', 'CPMK102', 'Sub-CPMK1023', '2026-01-20 01:54:49', '2026-01-20 01:54:49', 'S1 Informatika'),
(1132, 'IK2202', 'CPL12', 'CPMK121', 'Sub-CPMK1215', '2026-01-20 01:55:27', '2026-01-20 01:55:27', 'S1 Informatika'),
(1133, 'IK2202', 'CPL12', 'CPMK121', 'Sub-CPMK1216', '2026-01-20 01:55:27', '2026-01-20 01:55:27', 'S1 Informatika'),
(1134, 'IK2203', 'CPL02', 'CPMK021', 'Sub-CPMK0211', '2026-01-20 01:55:27', '2026-01-20 01:55:27', 'S1 Informatika'),
(1135, 'IK2203', 'CPL02', 'CPMK023', 'Sub-CPMK0231', '2026-01-20 01:55:27', '2026-01-20 01:55:27', 'S1 Informatika'),
(1136, 'IK2202', 'CPL08', 'CPMK084', 'Sub-CPMK0848', '2026-01-20 01:57:35', '2026-01-20 01:57:35', 'S1 Informatika'),
(1137, 'IK2202', 'CPL08', 'CPMK084', 'Sub-CPMK08410', '2026-01-20 01:57:35', '2026-01-20 01:57:35', 'S1 Informatika'),
(1138, 'IK2202', 'CPL12', 'CPMK121', 'Sub-CPMK1214', '2026-01-20 01:57:35', '2026-01-20 01:57:35', 'S1 Informatika'),
(1142, 'MK01', 'CPL01', 'CPMK012', 'Sub-CPMK0121', '2026-02-24 00:33:10', '2026-02-24 00:33:10', 'S1 Sistem Informasi'),
(1143, 'MK01', 'CPL01', 'CPMK012', 'Sub-CPMK0122', '2026-02-24 00:33:10', '2026-02-24 00:33:10', 'S1 Sistem Informasi');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('dDWox0HTc7rUfMb1J2oCkVOkvI8c8qLw8IwplKDd', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSnhFRjdTODlBTE1XVm5ENDFvMzQ1THE4SWJsMlZOWmJobzhKcHJzciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9rdXJpa3VsdW0tb2JlL3BsIjtzOjU6InJvdXRlIjtzOjg6InBsLmluZGV4Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MztzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjQ6IjUxNTc1MTRmMGI2NDZlMmFiMGZlM2VhMTQxNDZmNGE2ZjgxNGM4MTU2ZTYyMDdmNGYwZGMwMWE0MGRiMjVjMzAiO30=', 1772422993),
('M6ssFOLZnkF2plpqfZMsZYJXMrFRMslce7D9h8fT', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiUjIyZHFrWEM0U3p4aFZWcFJSTndKY2pqOVl2eFVKcnJXVmlYMDgzUSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjY0OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvcGVuaWxhaWFuLW9iZS9wb3J0b2ZvbGlvP3RhaHVuPTIwMjMlMkYyMDI0IjtzOjU6InJvdXRlIjtzOjE2OiJwb3J0b2ZvbGlvLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MztzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjQ6IjUxNTc1MTRmMGI2NDZlMmFiMGZlM2VhMTQxNDZmNGE2ZjgxNGM4MTU2ZTYyMDdmNGYwZGMwMWE0MGRiMjVjMzAiO30=', 1772423617);

-- --------------------------------------------------------

--
-- Table structure for table `sub_cpmk`
--

CREATE TABLE `sub_cpmk` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_sub_cpmk` varchar(255) NOT NULL,
  `uraian_sub_cpmk` text NOT NULL,
  `materi_pembelajaran` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prodi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_cpmk`
--

INSERT INTO `sub_cpmk` (`id`, `kode_sub_cpmk`, `uraian_sub_cpmk`, `materi_pembelajaran`, `created_at`, `updated_at`, `prodi`) VALUES
(1, 'Sub-CPMK0111', 'Kemampuan untuk bertingkah laku menghargai nilai - nilai kemanusiaan dalam melakukan kegiatannya berdasarkan agama , moral , dan etika.', 'Tes', '2026-01-20 01:35:45', '2026-01-19 19:58:32', 'S1 Informatika'),
(2, 'Sub-CPMK0121', 'Kemampuan menjalankan kehidupan sosial masyarakat', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(3, 'Sub-CPMK0122', 'Kemampuan memahami aturan dan norma hukum', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(4, 'Sub-CPMK0131', 'Kemampuan memahami kehidupan bermasyarakat dan bernegara', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(5, 'Sub-CPMK0421', 'Mampu memahami dan menerapkan algoritma dasar untuk menyelesaikan permasalahan computing.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(6, 'Sub-CPMK0422', 'Mampu menggunakan struktur data seperti array, list, dan tree dalam merancang solusi.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(7, 'Sub-CPMK0423', 'Mampu memilih algoritma dan struktur data yang sesuai untuk merancang solusi terhadap masalah computing yang kompleks.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(8, 'Sub-CPMK0511', 'Kemampuan memahami teori bidang rekayasa perangkat lunak dalam mendesain aplikasi teknologi multi-platform yang relevan dengan kebutuhan industri dan masyarakat', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(9, 'Sub-CPMK0911', 'Kemampuan menganalisis dan merancang user interface pada aplikasi perangkat lunak yang interaktif', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(10, 'Sub-CPMK0912', 'Kemampuan menganalisis dan merancang penerapan metode dengan mempertimbangkan keterkaitan aspek manusia dan komputer yang dapat mempengaruhi interaksi pengguna pada sistem interaktif', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(11, 'Sub-CPMK0923', 'Kemampuan mengimplementasikan metode dalam membangun sistem interaktif dengan mempertimbangkan keterkaitan aspek manusia dan komputer', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(12, 'Sub-CPMK0932', 'Kemampuan mengevaluasi metode dalam membangun sistem interaktif dengan mempertimbangkan keterkaitan aspek manusia dan komputer', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(13, 'Sub-CPMK0411', 'Mampu memahami dan menggunakan konsep dasar matriks dan vektor dalam pemodelan masalah computing.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(14, 'Sub-CPMK0412', 'Mampu menerapkan metode aljabar linier untuk menyelesaikan sistem persamaan linear dalam computing.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(15, 'Sub-CPMK0132', 'Mampu mengaplikasikan kedisiplinan dalam berperan serta aktif di lingkungan sosial dan bernegara.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(16, 'Sub-CPMK0631', 'Mampu menyusun gagasan secara runtut dan jelas dalam bentuk tulisan formal maupun non-formal.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(17, 'Sub-CPMK0632', 'Mampu menyampaikan gagasan secara lisan dengan tata bahasa yang baik dan efektif dalam diskusi atau presentasi.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(18, 'Sub-CPMK0633', 'Mampu memanfaatkan teknik komunikasi yang tepat dalam menyajikan argumen atau ide secara lisan dan tertulis.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(19, 'Sub-CPMK0841', 'Mampu merancang dan mengimplementasikan algoritma yang efisien untuk memenuhi kebutuhan berbasis computing.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(20, 'Sub-CPMK0842', 'Mampu memilih dan menerapkan struktur data yang sesuai untuk menyelesaikan masalah berbasis computing.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(21, 'Sub-CPMK0843', 'Mampu mengintegrasikan algoritma dan struktur data dalam pengembangan solusi computing yang efektif.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(22, 'Sub-CPMK0844', 'Mampu mengevaluasi performa algoritma dan struktur data yang digunakan melalui analisis kompleksitas waktu dan ruang untuk memastikan solusi computing yang efektif dan efisien.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(23, 'Sub-CPMK0431', 'Mampu memanfaatkan konsep-konsep dari ilmu pengetahuan lain seperti statistika dan machine learning dalam perancangan solusi basis data.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(24, 'Sub-CPMK0513', 'Mampu merancang dan mengimplementasikan basis data yang efisien dan scalable untuk aplikasi multi-platform.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(25, 'Sub-CPMK0514', 'Mampu mengaplikasikan konsep database management systems (DBMS) dalam pengembangan solusi multi-platform yang relevan dengan industri.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(26, 'Sub-CPMK0515', 'Mampu mendesain struktur basis data yang sesuai dengan kebutuhan pengguna, termasuk integrasi dengan berbagai platform teknologi.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(27, 'Sub-CPMK0516', 'Mampu memahami dan menerapkan normalisasi data untuk memastikan efisiensi penyimpanan dan pemrosesan pada aplikasi multi-platform.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(28, 'Sub-CPMK0311', 'Mampu menjelaskan peran utama sistem operasi sebagai pengelola sumber daya komputer, termasuk CPU, memori, dan perangkat I/O', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(29, 'Sub-CPMK0312', 'Mampu memahami cara kerja manajemen proses di dalam sistem operasi, termasuk konsep multitasking, scheduling, dan deadlock. manajemen memori, seperti paging, segmentation, dan virtual memory dalam sistem operasi modern.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(30, 'Sub-CPMK0313', 'Mampu menganalisis fungsi file system dalam mengelola penyimpanan data dan interaksi dengan perangkat penyimpanan.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(31, 'Sub-CPMK0524', 'Mampu memanfaatkan konsep sistem operasi seperti thread dan concurrency dalam mensimulasikan aplikasi multiplatform.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(32, 'Sub-CPMK0525', 'Mampu menerapkan prinsip-prinsip sistem operasi dalam pengelolaan sumber daya pada aplikasi multiplatform untuk berbagai perangkat (mobile, desktop, cloud).', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(33, 'Sub-CPMK0526', 'Mampu menggunakan tools simulasi sistem operasi untuk menguji kinerja aplikasi pada platform yang berbeda.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(34, 'Sub-CPMK0314', 'Mampu menjelaskan fungsi dan interaksi antar komponen utama komputer (CPU, memori, dan perangkat input/output) dalam arsitektur komputer.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(35, 'Sub-CPMK0315', 'Mampu memodelkan pengelolaan memori dalam arsitektur komputer, termasuk cache, paging, dan virtual memory.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(36, 'Sub-CPMK0316', 'Mampu menganalisis peran arsitektur komputer dalam efisiensi dan kinerja sistem.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(37, 'Sub-CPMK0528', 'Mampu menggunakan perangkat simulasi untuk mensimulasikan aplikasi teknologi pada platform dengan arsitektur yang berbeda.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(38, 'Sub-CPMK0413', 'Kemampuan memahami dan menerapkan logika matematika dalam memodelkan permasalahan computing', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(39, 'Sub-CPMK0529', 'Kemampuan menguasai teori logika matematika dalam memodelkan aplikasi teknologi multi-platform yang relevan dengan kebutuhan industri dan masyarakat', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(40, 'Sub-CPMK0317', 'Kemampuan memahami dasar-dasar arsitektur jaringan komputer dan peran sistem komputer dalam jaringan', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(41, 'Sub-CPMK0318', 'Kemampuan menganalisis cara kerja protokol jaringan dalam mendukung komunikasi antar sistem komputer.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(42, 'Sub-CPMK0319', 'Kemampuan memodelkan aliran data dan manajemen sumber daya di dalam jaringan komputer yang terhubung dengan sistem komputer.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(43, 'Sub-CPMK0812', 'Kemampuan menganalisis dan mendesain solusi berorientasi objek berdasarkan metode pengembangan yang terstruktur.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(44, 'Sub-CPMK0845', 'Kemampuan memenuhi kebutuhan-kebutuhan untuk terkait pemrograman berbasis objek pada organisasi', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(45, 'Sub-CPMK0846', 'Kemampuan mengimplementasikan solusi berbasis objek untuk memenuhi berbagai kebutuhan sistem computing.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(46, 'Sub-CPMK0414', 'Kemampuan memahami dan menerapkan statistika dan probabilitas dalam memodelkan permasalahan computing', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(47, 'Sub-CPMK05210', 'Kemampuan menguasai teori statistika dan probabilitas dalam memodelkan aplikasi teknologi multi-platform yang relevan dengan kebutuhan industri dan masyarakat', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(48, 'Sub-CPMK0517', 'Kemampuan memahami konsep basis data relasional dan non-relasional dalam mendesain aplikasi multi-platform.', '- Memahami konsep dasar dan komponen sistem basis data \n- Mampu membahas tren terkini dalam basis data seperti NoSQL dan Big Data serta perbandingannya dengan RDBMS tradisional', '2026-01-20 01:35:45', '2026-02-16 21:46:27', 'S1 Informatika'),
(49, 'Sub-CPMK0518', 'Kemampuan merancang skema basis data yang mendukung interoperabilitas aplikasi di berbagai platform teknologi.', '- Mampu mendesain ERD dan mengimplementasikannya menjadi tabel\n- Mampu menghubungkan aplikasi web sederhana dengan database menggunakan phpMyAdmin\n- Mampu menjelaskan tantangan basis data terdistribusi', '2026-01-20 01:35:45', '2026-02-16 21:45:38', 'S1 Informatika'),
(50, 'Sub-CPMK0519', 'Kemampuan menerapkan teori manajemen basis data dalam membangun aplikasi yang relevan dengan kebutuhan industri dan masyarakat.', '- Mampu menulis dan menjalankan query SQL dasar, termasuk fungsi agregat dan subquery\n- Mampu menganalisis dan mengoptimalkan query menggunakan fitur EXPLAIN\n- Mampu melakukan backup dan restore database \n- Mampu membuat skema star sederhana dan menjalankan query OLAP ', '2026-01-20 01:35:45', '2026-02-16 21:48:01', 'S1 Informatika'),
(51, 'Sub-CPMK1211', 'Kemampuan merancang sistem basis data yang efisien dan aman dengan memperhatikan kebutuhan aplikasi kesehatan.', '- Mampu menormalisasi tabel\n- Mampu membuat dan mengelola indeks ', '2026-01-20 01:35:45', '2026-02-16 21:49:10', 'S1 Informatika'),
(52, 'Sub-CPMK1212', 'Kemampuan mengimplementasikan sistem pengelolaan data berbasis model data yang tepat untuk mendukung pengolahan informasi di bidang kesehatan.', '- Mampu mengelola transaksi (COMMIT, ROLLBACK) ', '2026-01-20 01:35:45', '2026-02-16 21:49:44', 'S1 Informatika'),
(53, 'Sub-CPMK1213', 'Kemampuan mengintegrasikan metode keamanan data untuk melindungi informasi sensitif dalam aplikasi kesehatan yang menggunakan basis data.', '- Mampu menambahkan dan mengelola constraints pada tabel\n- Mampu mengelola keamanan basis data dengan mengatur pengguna dan hak akses ', '2026-01-20 01:35:45', '2026-02-16 21:50:35', 'S1 Informatika'),
(54, 'Sub-CPMK0415', 'Kemampuan memahami dan menerapkan kalkulus dalam memodelkan permasalahan computing', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(55, 'Sub-CPMK05211', 'Kemampuan menguasai kalkulus dalam memodelkan aplikasi teknologi multi-platform yang relevan dengan kebutuhan industri dan masyarakat', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(56, 'Sub-CPMK0424', 'Kemampuan menguasai dan menerapkan algoritma serta struktur data dalam merancang solusi yang efisien terhadap masalah computing', '(1) Pengantar kompleksitas algoritma, (2) Struktur data untuk solusi efisien (3) Struktur data untuk solusi efisien (Bagian 2)', '2026-01-20 01:35:45', '2026-02-03 21:04:40', 'S1 Informatika'),
(57, 'Sub-CPMK0425', 'Kemampuan mengevaluasi kinerja algoritma berdasarkan analisis kompleksitas waktu dan ruang dalam menyelesaikan permasalahan computing yang kompleks.', '(1) Dasar-dasar kompleksitas, (2) Analisis kompleksitas waktu, (3) Analisis kompleksitas ruang, (4) Evaluasi kinerja algoritma ', '2026-01-20 01:35:45', '2026-02-03 21:05:53', 'S1 Informatika'),
(58, 'Sub-CPMK0813', 'Kemampuan menganalisis dan mendesain algoritma yang sesuai kebutuhan computing', '(1) Perancangan algoritma efisien, (2) Analisis & desain kebutuhan computing', '2026-01-20 01:35:45', '2026-02-03 21:06:58', 'S1 Informatika'),
(59, 'Sub-CPMK0814', 'Kemampuan mengevaluasi desain algoritma dan struktur data yang digunakan dalam memenuhi kebutuhan sistem computing dengan pendekatan yang sistematis.', '(1) Evaluasi desain algoritma', '2026-01-20 01:35:45', '2026-02-03 21:07:40', 'S1 Informatika'),
(60, 'Sub-CPMK0416', 'Kemampuan memahami dan menerapkan matematika diskrit dalam memodelkan permasalahan computing', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(61, 'Sub-CPMK0231', 'Kemampuan mengidentifikasi dan menganalisis isu-isu sosial dan perkembangan teknologi yang berdampak pada industri dan lingkungan profesional.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(62, 'Sub-CPMK0241', 'Kemampuan menerapkan sikap profesional dalam pengambilan keputusan dan pengelolaan tim, serta mengadaptasi strategi bisnis sesuai perkembangan terbaru.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(63, 'Sub-CPMK0847', 'Kemampuan merancang dan mengimplementasikan solusi berbasis web untuk memenuhi kebutuhan computing dengan tepat', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(64, 'Sub-CPMK0925', 'Kemampuan menerapkan prinsip-prinsip desain UI/UX untuk memastikan aplikasi web mudah digunakan dan menarik bagi pengguna.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(65, 'Sub-CPMK1022', 'Kemampuan mengembangkan aplikasi web yang dapat berjalan di berbagai platform (desktop, mobile, tablet) dengan performa optimal.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(66, 'Sub-CPMK1023', 'Kemampuan mengintegrasikan teknologi server-side dan client-side untuk memastikan aplikasi web berfungsi dengan baik di berbagai perangkat.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(67, 'Sub-CPMK0848', 'Kemampuan menganalisis kebutuhan data dan computing dalam mengembangkan solusi berbasis data science.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(68, 'Sub-CPMK08410', 'Kemampuan menggunakan alat dan metode machine learning untuk membangun model yang memenuhi kebutuhan spesifik berbasis data dalam computing.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(69, 'Sub-CPMK1214', 'Kemampuan merancang model data yang efisien dan sesuai untuk mengelola informasi dalam sistem aplikasi kesehatan.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(70, 'Sub-CPMK1215', 'Kemampuan mengimplementasikan solusi pengelolaan data dengan memperhatikan aspek keamanan data dalam aplikasi kesehatan.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(71, 'Sub-CPMK1216', 'Kemampuan mengintegrasikan teknik pengolahan data dan algoritma machine learning untuk memecahkan masalah di bidang kesehatan dengan pendekatan berbasis data.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(72, 'Sub-CPMK0211', 'Kemampuan menerapkan etika profesi dalam pengambilan keputusan yang terkait dengan pengembangan dan penggunaan teknologi.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(73, 'Sub-CPMK0242', 'Kemampuan menerapkan sikap profesional dalam pengambilan keputusan dan pengelolaan tim, serta mengadaptasi strategi bisnis sesuai perkembangan terbaru.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(74, 'Sub-CPMK0432', 'Kemampuan memanfaatkan teknik optimasi dan keamanan dari ilmu lain untuk meningkatkan efisiensi dan keamanan dalam solusi cloud computing.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(75, 'Sub-CPMK0433', 'Kemampuan mengintegrasikan solusi berbasis cloud dengan teknologi lain, seperti Internet of Things (IoT) dan Artificial Intelligence (AI), untuk menciptakan inovasi di bidang computing.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(76, 'Sub-CPMK0434', 'Kemampuan menerapkan konsep dari disiplin ilmu lain, seperti big data dan machine learning, dalam pengembangan solusi cloud computing.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(77, 'Sub-CPMK0321', 'Kemampuan memahami dan memilih algoritma kecerdasan buatan yang tepat untuk memecahkan masalah dalam konteks organisasi.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(78, 'Sub-CPMK0825', 'Kemampuan merancang solusi computing berbasis AI yang hemat sumber daya namun tetap optimal dalam performa.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(79, 'Sub-CPMK1111', 'Kemampuan merumuskan model dan algoritma AI yang relevan untuk menyelesaikan masalah kesehatan, seperti diagnosis otomatis atau analisis data medis.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(80, 'Sub-CPMK1112', 'Kemampuan menerapkan sistem cerdas berbasis AI dalam konteks kesehatan untuk meningkatkan efisiensi dan akurasi proses klinis atau administratif.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(81, 'Sub-CPMK05110', 'Kemampuan memahami teori bidang analisis dan desain perangkat lunak dalam memodelkan aplikasi teknologi multi-platform yang relevan dengan kebutuhan industri dan masyarakat', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(82, 'Sub-CPMK0815', 'Kemampuan menyusun model analisis dan desain perangkat lunak dengan tools dengan benar', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(83, 'Sub-CPMK0913', 'Kemampuan menganalisis dan merancang ulang user interface pada aplikasi perangkat lunak yang interaktif', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(84, 'Sub-CPMK0926', 'Kemampuan re-design user interface pada aplikasi perangkat lunak yang interaktif dengan beragam metode', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(85, 'Sub-CPMK0933', 'Kemampuan mengevaluasi re-design user interface pada aplikasi perangkat lunak yang interaktif dengan sistematika yang tepat', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(86, 'Sub-CPMK1012', 'Mampu menyusun model analisis dan desain perangkat lunak yang mendukung teknologi multi-platform pada sebuah organisasi', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(87, 'Sub-CPMK0441', 'Kemampuan mengidentifikasi permasalahan pengolahan citra digital yang memerlukan pendekatan multidisiplin.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(88, 'Sub-CPMK0442', 'Kemampuan merumuskan solusi berdasarkan integrasi ilmu dari berbagai bidang seperti matematika, teknik komputer, dan ilmu kesehatan dalam pengolahan citra digital.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(89, 'Sub-CPMK1121', 'Kemampuan merancang algoritma sistem cerdas berbasis pengolahan citra digital yang relevan untuk aplikasi kesehatan, seperti analisis gambar medis.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(90, 'Sub-CPMK1122', 'Kemampuan mengimplementasikan algoritma pengolahan citra cerdas untuk mendukung diagnosis dan pengambilan keputusan klinis.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(91, 'Sub-CPMK1123', 'Kemampuan mengevaluasi performa algoritma sistem cerdas dalam aplikasi kesehatan untuk memastikan akurasi dan efisiensi dalam pengolahan data medis berbasis citra.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(92, 'Sub-CPMK0634', 'Kemampuan menyusun gagasan dalam bentuk tulisan akademik atau profesional dengan tata bahasa yang baik dan benar.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(93, 'Sub-CPMK0635', 'Kemampuan menyampaikan gagasan secara lisan dalam diskusi atau presentasi dengan jelas dan efektif.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(94, 'Sub-CPMK0636', 'Kemampuan menggunakan teknik komunikasi yang tepat untuk mempresentasikan ide secara formal dan informal dalam konteks akademik atau profesional.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(95, 'Sub-CPMK0637', 'Kemampuan menyajikan gagasan artikel ilmiah secara lisan dan tertulis', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(96, 'Sub-CPMK0721', 'Kemampuan menyusun menyusun artikel ilmiah dengan tata tulis bidang informatika', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(97, 'Sub-CPMK0426', 'Kemampuan memilih dan menerapkan algoritma serta struktur data yang sesuai untuk memecahkan masalah computing pada aplikasi mobile.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(98, 'Sub-CPMK05111', 'Kemampuan memahami teori komputasi terkait multi-platform dan menerapkannya dalam desain aplikasi mobile.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(99, 'Sub-CPMK05112', 'Kemampuan merancang aplikasi mobile dengan konsep multi-platform yang mendukung integrasi antara perangkat dan platform yang berbeda.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(100, 'Sub-CPMK05113', 'Kemampuan menerapkan prinsip desain berbasis multi-platform dalam pengembangan aplikasi mobile yang relevan dengan kebutuhan industri.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(101, 'Sub-CPMK1024', 'Kemampuan mengembangkan aplikasi mobile yang dapat berjalan secara optimal di berbagai platform (Android, iOS, dll.).', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(102, 'Sub-CPMK1025', 'Kemampuan menggunakan framework multi-platform, seperti React Native atau Flutter, untuk mengimplementasi solusi mobile yang efisien', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(103, 'Sub-CPMK1026', 'Kemampuan mengintegrasikan teknologi cloud dan API dalam aplikasi mobile untuk mendukung fungsi lintas platform.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(104, 'Sub-CPMK05117', 'Kemampuan Menjelaskan konsep dan prinsip manajemen proyek TI, mengidentifikasi kebutuhan industri atau masyarakat untuk desain aplikasi multi-platform, serta membuat rancangan arsitektur proyek TI multi-platform yang memenuhi kebutuhan pengguna dan standar industri.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(105, 'Sub-CPMK0612', 'Kemampuan Menetapkan struktur organisasi tim proyek, mendistribusikan tugas dan tanggung jawab anggota tim, serta menerapkan strategi komunikasi yang efektif untuk kelancaran proyek.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(106, 'Sub-CPMK0621', 'Menyusun jadwal kerja pribadi yang selaras dengan timeline proyek, menetapkan target kerja individu sesuai peran, dan mengatur prioritas kerja untuk menyelesaikan tugas tepat waktu.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(107, 'Sub-CPMK0638', 'Menyusun laporan proyek secara sistematis sesuai kaidah penulisan ilmiah, menyampaikan ide atau hasil proyek secara lisan dengan bahasa yang jelas dan meyakinkan, serta menggunakan media presentasi yang efektif untuk mendukung penyampaian gagasan.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(108, 'Sub-CPMK0222', 'Kemampuan memecahkan masalah secara kolaboratif dalam tim untuk mencapai tujuan proyek perangkat lunak.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(109, 'Sub-CPMK0244', 'Kemampuan mengembangkan kepemimpinan dalam pengelolaan tim proyek untuk memastikan keberhasilan proyek.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(110, 'Sub-CPMK0639', 'Kemampuan menyajikan gagasan proyek perangkat lunak secara lisan dan tertulis secara efektif.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(111, 'Sub-CPMK0816', 'Kemampuan menganalisis dan merancang solusi perangkat lunak secara tepat dan sesuai kebutuhan', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(112, 'Sub-CPMK0444', 'Kemampuan mengidentifikasi permasalahan komputasi yang kompleks dan memerlukan solusi berbasis paralel dan terdistribusi.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(113, 'Sub-CPMK0445', 'Kemampuan merumuskan solusi komputasi yang melibatkan berbagai disiplin ilmu, seperti algoritma paralel, arsitektur komputer, dan ilmu jaringan.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(114, 'Sub-CPMK0446', 'Kemampuan menerapkan teknik komputasi paralel dan terdistribusi dalam menyelesaikan masalah computing yang kompleks secara efisien.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(115, 'Sub-CPMK0324', 'Kemampuan memahami algoritma pembelajaran mesin yang sesuai untuk memecahkan masalah organisasi berdasarkan data yang tersedia.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(116, 'Sub-CPMK0325', 'Kemampuan menerapkan teknik supervised learning dan unsupervised learning dalam konteks pemecahan masalah organisasi.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(117, 'Sub-CPMK0326', 'Kemampuan mengukur performa algoritma yang diterapkan untuk memastikan solusi yang efisien dan relevan bagi organisasi.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(118, 'Sub-CPMK1124', 'Kemampuan mengimplementasikan algoritma machine learning untuk mengolah data medis dalam rangka meningkatkan kualitas perawatan kesehatan.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(119, 'Sub-CPMK05114', 'Kemampuan memahami konsep dasar web services, seperti SOAP, REST, dan API, dalam desain aplikasi multi-platform.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(120, 'Sub-CPMK05115', 'Kemampuan menerapkan konsep komunikasi antar platform melalui web services yang dapat diintegrasikan dalam aplikasi industri.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(121, 'Sub-CPMK05116', 'Kemampuan merancang arsitektur aplikasi berbasis web services yang relevan dengan kebutuhan multi-platform dalam konteks industri dan masyarakat.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(122, 'Sub-CPMK1027', 'Kemampuan mengembangkan aplikasi web services yang dapat berjalan pada berbagai platform (desktop, mobile, cloud).', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(123, 'Sub-CPMK1028', 'Kemampuan menggunakan framework dan protokol untuk mengimplementasi web services yang mendukung interoperabilitas antar platform.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(124, 'Sub-CPMK1029', 'Kemampuan mengintegrasikan web services dengan aplikasi multi-platform untuk memastikan kompatibilitas dan efisiensi sistem.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(125, 'Sub-CPMK0447', 'Kemampuan Mengidentifikasi ancaman keamanan data dan informasi yang kompleks dalam sistem computing, merumuskan solusi keamanan dengan pendekatan multidisiplin seperti enkripsi, manajemen risiko, dan kebijakan keamanan, serta menerapkan teknik keamanan yang relevan untuk mengatasi permasalahan tersebut.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(126, 'Sub-CPMK1221', 'Mengelola kualitas data dan menerapkan teknik keamanan seperti enkripsi dan kontrol akses sesuai standar industri kesehatan untuk melindungi data di sistem cerdas dari serangan siber.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(127, 'Sub-CPMK1233', 'Kemampuan Mengidentifikasi kekurangan keamanan pada sistem pengelolaan data, mengoptimalkan penggunaan teknik seperti enkripsi, audit keamanan, dan kontrol akses, serta mengevaluasi sistem untuk memastikan kualitas dan keamanan sesuai standar kesehatan.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(128, 'Sub-CPMK0327', 'Kemampuan mengidentifikasi masalah organisasi yang dapat diselesaikan dengan penerapan teknologi Internet of Things (IoT).', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(129, 'Sub-CPMK0328', 'Kemampuan menggunakan algoritma pengolahan data sensor dan edge computing untuk mengembangkan solusi IoT yang efektif.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(130, 'Sub-CPMK0836', 'Kemampuan mengoptimalkan infrastruktur IoT untuk memastikan efisiensi sistem sesuai dengan kebutuhan organisasi.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(131, 'Sub-CPMK0837', 'Kemampuan mengevaluasi performa sistem IoT dalam hal konsumsi daya, bandwidth, dan efisiensi pemrosesan data.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(132, 'Sub-CPMK0427', 'Kemampuan mengoptimalkan struktur data dan algoritma untuk meningkatkan efisiensi dan performa aplikasi pada berbagai platform.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(133, 'Sub-CPMK1013', 'Kemampuan mendesain solusi multi-platform yang mendukung interoperabilitas dan performa optimal di berbagai lingkungan computing.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(134, 'Sub-CPMK10210', 'Kemampuan menggunakan framework multi-platform, dalam pengembangan aplikasi', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(135, 'Sub-CPMK1033', 'Kemampuan mengevaluasi kompatibilitas dan interoperabilitas aplikasi multi-platform di berbagai sistem operasi dan perangkat.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(136, 'Sub-CPMK1034', 'Kemampuan menerapkan metode pengujian dan debugging secara menyeluruh untuk memastikan solusi multi-platform berjalan secara optimal.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(137, 'Sub-CPMK0435', 'Kemampuan mengintegrasikan konsep big data dengan ilmu lain seperti ekonomi, kesehatan, dan sosial untuk memecahkan masalah yang kompleks.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(138, 'Sub-CPMK0828', 'Kemampuan merancang dan mengimplementasikan infrastruktur big data yang efisien dan sesuai dengan kebutuhan computing.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(139, 'Sub-CPMK1116', 'Kemampuan merancang dan mengimplementasikan infrastruktur big data yang efisien dan sesuai dengan kebutuhan computing.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(140, 'Sub-CPMK08411', 'Kemampuan menggunakan teknologi web semantik, seperti RDF dan OWL, untuk memenuhi kebutuhan komputasi dalam pengelolaan data berbasis web.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(141, 'Sub-CPMK1014', 'Kemampuan mengidentifikasi kebutuhan multi-platform dalam organisasi dan menerapkan konsep web semantik untuk solusi yang kompatibel.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(142, 'Sub-CPMK1015', 'Kemampuan mendesain sistem web semantik yang dapat berfungsi di berbagai platform dan mendukung integrasi data antar organisasi.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(143, 'Sub-CPMK1217', 'Kemampuan merancang model data berbasis web semantik yang efisien dan sesuai untuk pengelolaan informasi kesehatan.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(144, 'Sub-CPMK1218', 'Kemampuan mengimplementasikan sistem pengelolaan data berbasis web semantik yang aman dan sesuai dengan regulasi di bidang kesehatan.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(145, 'Sub-CPMK0914', 'Kemampuan menganalisis kebutuhan pengguna untuk merancang user interface yang intuitif and interaktif.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(146, 'Sub-CPMK0915', 'Kemampuan merancang visualisasi data yang interaktif dan menarik dengan mempertimbangkan perkembangan teknologi dan ilmu transdisiplin.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(147, 'Sub-CPMK1219', 'Kemampuan merancang sistem pengelolaan data untuk aplikasi kesehatan yang efisien, aman, dan berbasis visualisasi data yang efektif.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(148, 'Sub-CPMK1210', 'Kemampuan mengimplementasikan teknik visualisasi data yang sesuai dengan model data kesehatan untuk mendukung pengambilan keputusan klinis.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(149, 'Sub-CPMK0934', 'Kemampuan mengevaluasi kesesuaian user interface dengan prinsip UI/UX untuk meningkatkan interaktivitas dan kenyamanan pengguna.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(150, 'Sub-CPMK0935', 'Kemampuan mengukur performa aplikasi interaktif dalam berbagai skenario penggunaan untuk memastikan kualitas dan kepuasan pengguna.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(151, 'Sub-CPMK1223', 'Kemampuan mengimplementasikan teknik keamanan data untuk melindungi informasi sensitif dalam sistem cerdas di bidang kesehatan.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(152, 'Sub-CPMK1035', 'Kemampuan mengevaluasi performa solusi multi-platform dalam hal efisiensi, kompatibilitas, dan interoperabilitas di berbagai perangkat.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(153, 'Sub-CPMK1133', 'Kemampuan menerapkan pendekatan pembelajaran mesin (machine learning) untuk mengembangkan dan memperbarui solusi sistem cerdas dalam konteks kesehatan.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(154, 'Sub-CPMK1224', 'Kemampuan mengelola sistem keamanan dan kualitas data dalam aplikasi kesehatan untuk memastikan integritas dan keandalan informasi.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(155, 'Sub-CPMK1236', 'Kemampuan melakukan validasi dan pengujian keamanan serta efisiensi sistem pengelolaan data yang diterapkan dalam aplikasi kesehatan berbasis sistem cerdas.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(156, 'Sub-CPMK0829', 'Kemampuan menerapkan arsitektur pengelolaan data yang efisien untuk memenuhi kebutuhan computing di berbagai platform.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(157, 'Sub-CPMK0916', 'Kemampuan menganalisis kebutuhan pengguna untuk merancang user interface yang sesuai dengan perilaku dan preferensi pengguna.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(158, 'Sub-CPMK0917', 'Kemampuan merancang user interface yang intuitif dan responsif untuk meningkatkan pengalaman pengguna dalam berbagai konteks.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(159, 'Sub-CPMK0927', 'Kemampuan menerapkan prinsip UI/UX untuk membuat aplikasi interaktif yang fungsional dan menarik secara visual.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(160, 'Sub-CPMK0928', 'Kemampuan mengembangkan prototype interaktif untuk menguji dan memperbaiki user interface sebelum implementasi penuh.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(161, 'Sub-CPMK0936', 'Kemampuan mengevaluasi performa aplikasi interaktif dari perspektif pengguna untuk memastikan kepuasan dan pengalaman pengguna yang optimal.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(162, 'Sub-CPMK0329', 'Kemampuan menggunakan metode NLP untuk analisis sentimen, klasifikasi teks, atau chatbot dalam konteks bisnis organisasi.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(163, 'Sub-CPMK04410', 'Kemampuan mengidentifikasi permasalahan kompleks yang melibatkan pengolahan bahasa alami dan memerlukan pendekatan multidisiplin.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(164, 'Sub-CPMK04411', 'Kemampuan merancang solusi NLP dengan memanfaatkan berbagai disiplin ilmu untuk menyelesaikan permasalahan computing yang kompleks.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(165, 'Sub-CPMK0838', 'Kemampuan mengevaluasi kebutuhan computing yang diperlukan untuk memproses data teks dalam jumlah besar dengan efisien.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(166, 'Sub-CPMK0839', 'Kemampuan mengoptimalkan penggunaan sumber daya computing saat menerapkan algoritma NLP untuk mencapai performa yang efisien.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(167, 'Sub-CPMK1117', 'Kemampuan menganalisis masalah berbasis teks di industri kesehatan, seperti analisis catatan medis, dengan memanfaatkan teknik NLP.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(168, 'Sub-CPMK1118', 'Kemampuan merumuskan solusi berbasis NLP untuk menyelesaikan masalah kesehatan seperti ekstraksi informasi dari catatan pasien dan diagnosa otomatis.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(169, 'Sub-CPMK1119', 'Kemampuan menerapkan sistem cerdas berbasis NLP untuk mendukung proses pengambilan keputusan di bidang kesehatan.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(170, 'Sub-CPMK03210', 'Kemampuan menggunakan metode deep learning, seperti convolutional neural networks (CNN) dan recurrent neural networks (RNN), dalam analisis data besar.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(171, 'Sub-CPMK04412', 'Kemampuan mengidentifikasi permasalahan kompleks yang memerlukan pendekatan multidisiplin dalam penerapan deep learning.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(172, 'Sub-CPMK04413', 'Kemampuan menerapkan teknik deep learning untuk menyelesaikan masalah yang kompleks dengan memanfaatkan berbagai disiplin ilmu.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(173, 'Sub-CPMK08310', 'Kemampuan mengevaluasi kebutuhan computing untuk melatih model deep learning yang efisien.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(174, 'Sub-CPMK08412', 'Kemampuan mengimplementasikan solusi deep learning yang dapat memenuhi kebutuhan computing untuk aplikasi tertentu.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(175, 'Sub-CPMK1125', 'Kemampuan merancang algoritma deep learning yang relevan untuk aplikasi kesehatan, seperti pengenalan gambar medis dan diagnosa otomatis.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(176, 'Sub-CPMK1126', 'Kemampuan mengimplementasikan algoritma deep learning untuk menganalisis data kesehatan dalam aplikasi cerdas.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(177, 'Sub-CPMK1134', 'Kemampuan menerapkan teknik evaluasi model untuk memastikan solusi sistem cerdas berbasis deep learning bekerja secara efisien di industri kesehatan.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(178, 'Sub-CPMK0436', 'Kemampuan mengintegrasikan metode pengambilan keputusan dengan teknologi machine learning dan data mining untuk mengembangkan solusi computing yang efektif.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(179, 'Sub-CPMK08210', 'Kemampuan merancang dan mengimplementasikan sistem pendukung keputusan yang sistematis, dari pengumpulan data hingga analisis keputusan', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(180, 'Sub-CPMK11110', 'Kemampuan menganalisis permasalahan klinis dan manajerial di industri kesehatan yang dapat diatasi dengan sistem pendukung keputusan berbasis AI.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(181, 'Sub-CPMK0437', 'Kemampuan mengintegrasikan konsep dari disiplin ilmu matematika, statistika, dan pengambilan keputusan untuk mengembangkan solusi berbasis logika fuzzy.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(182, 'Sub-CPMK08311', 'Kemampuan mengukur dan meningkatkan efisiensi algoritma fuzzy dalam aplikasi yang memerlukan komputasi besar.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(183, 'Sub-CPMK1127', 'Kemampuan merancang algoritma logika fuzzy yang dapat diterapkan dalam aplikasi kesehatan untuk menangani data medis yang tidak pasti atau ambigu.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(184, 'Sub-CPMK1128', 'Kemampuan mengimplementasikan sistem cerdas berbasis logika fuzzy dalam aplikasi kesehatan untuk membantu pengambilan keputusan klinis.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(185, 'Sub-CPMK1129', 'Kemampuan mengevaluasi performa algoritma logika fuzzy di bidang kesehatan untuk memastikan keakuratan dan keandalannya dalam aplikasi klinis.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(186, 'Sub-CPMK11210', 'Kemampuan merancang algoritma computer vision yang dapat digunakan dalam aplikasi kesehatan, seperti analisis citra medis untuk diagnosis.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(187, 'Sub-CPMK11211', 'Kemampuan mengimplementasikan algoritma computer vision yang mendukung pengambilan keputusan di sektor kesehatan, seperti deteksi anomali pada gambar medis.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(188, 'Sub-CPMK1135', 'Kemampuan melakukan evaluasi sistematis terhadap solusi sistem cerdas berbasis computer vision untuk meningkatkan kualitas dan kecepatan proses di bidang kesehatan.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(189, 'Sub-CPMK0817', 'kemampuan menganalisis dan mengdesain solusi untuk proyek terkait analisis jejaringsosial dengan benar', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(190, 'Sub-CPMK08211', 'kemampuan mengimplementasi solusi untuk proyek terkait analisis jejaring sosial dengan sistematik', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(191, 'Sub-CPMK08312', 'kemampuan mengevaluasi solusi untuk proyek terkait analisis jejarning sosial yang efesien sesuai kebutuhan', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(192, 'Sub-CPMK08413', 'Kemampuan memenuhi kebutuhan-kebutuhan untuk terkait analisis jejaring sosial pada organisasi', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(193, 'Sub-CPMK05212', 'Kemampuan menerapkan teori pengembangan aplikasi multiplatform dalam konteks proyek berbasis masyarakat selama kegiatan KKN.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(194, 'Sub-CPMK0611', 'Kemampuan mengelola tim , komunikasi dan kolaborasi dalam manajemen proyek perangkat lunak', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(195, 'Sub-CPMK05213', 'Kemampuan menerapkan konsep-konsep teoritis dalam pengembangan aplikasi multiplatform sesuai dengan kebutuhan industri selama program magang.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(196, 'Sub-CPMK0623', 'Kemampuan melakukan refleksi terhadap kinerja diri, serta terus memperbaiki diri berdasarkan pengalaman dan umpan balik dari rekan kerja atau supervisor.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(197, 'Sub-CPMK06310', 'Kemampuan menyajikan gagasan proyek akhir secara lisan dan tertulis', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(198, 'Sub-CPMK0711', 'Kemampuan menyusun kerangka berfikir saintifik hasil implementasi ilmu pengetahuan teknologi dalam bentuk laporan tugas akhir', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(199, 'Sub-CPMK0726', 'Kemampuan menyusun kerangka berfikir saintifik hasil implementasi ilmu pengetahuan teknologi dalam bentuk artikel ilmiah', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(200, 'Sub-CPMK03211', 'Kemampuan memilih dan menerapkan metode/algoritma yang sesuai untuk menyelesaikan permasalahan organisasi secara tepat.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(201, 'Sub-CPMK1371', 'Kemampuan menyelesaikan masalah dengan pendekatan computational thinking secara mandiri dan penuh tanggung jawab.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(202, 'Sub-CPMK1381', 'Kemampuan merancang solusi algoritmik secara kreatif, tekun, dan menunjukkan daya juang dalam proses penyelesaiannya.', '', '2026-01-20 01:35:45', '2026-01-20 01:35:45', 'S1 Informatika'),
(204, 'Sub-CPMK0188', 'tes', NULL, '2026-02-16 00:38:19', '2026-02-16 00:38:19', 'S1 Informatika'),
(206, 'Sub-CPMK0111', 'Mampu menjelaskan konsep dasar sistem', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(207, 'Sub-CPMK0112', 'Mampu menjelaskan konsep informasi dan sistem informasi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(208, 'Sub-CPMK0113', 'Mampu menjelaskan isu-isu terkait sistem informasi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(209, 'Sub-CPMK0121', 'Mampu menganalisis proses organisasi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(210, 'Sub-CPMK0122', 'Mampu menganalisis sistem organisasi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(211, 'Sub-CPMK0131', 'Mampu menilai proses yang ada pada organisasi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(212, 'Sub-CPMK0132', 'Mampu menilai sistem pengelolaan data pada organisasi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(213, 'Sub-CPMK0141', 'Mampu menilai peran sistem informasi pada organisasi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(214, 'Sub-CPMK0142', 'Mampu memberikan rekomendasi pengambilan keputusan di organisasi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(215, 'Sub-CPMK0211', 'Mampu memahami konsep sistem basis data dan jenis-jenis pemodelan data', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(216, 'Sub-CPMK0212', 'Mampu memodelkan data dan informasi dalam bentuk ERD dan model relasional', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(217, 'Sub-CPMK0213', 'Mampu mengidentifikasi ketergantungan fungsional dan mengimplementasikan teknik normalisasi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(218, 'Sub-CPMK0221', 'Mampu menjelaskan komponen sistem basis data', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(219, 'Sub-CPMK0222', 'Mampu merancang basis data melalui proses normalisasi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(220, 'Sub-CPMK0223', 'Mampu mengimplementasikan pemrograman basis data menggunakan SQL', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(221, 'Sub-CPMK0224', 'Mampu mengelola basis data pada skala pembelajaran studi kasus', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(222, 'Sub-CPMK0231', 'Mampu memanipulasi data menggunakan Bahasa Query sederhana', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(223, 'Sub-CPMK0232', 'Mampu menerapkan fungsi-fungsi SQL', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(224, 'Sub-CPMK0233', 'Mampu merancang desain basis data berdasarkan studi kasus nyata', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(225, 'Sub-CPMK0234', 'Mampu memahami peran statistika dan probabilitas untuk analisis data', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(226, 'Sub-CPMK0235', 'Mampu memahami teori-teori probabilitas', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(227, 'Sub-CPMK0236', 'Mampu memahami variabel acak dan distribusi univariat', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(228, 'Sub-CPMK0241', 'Mampu menerapkan fungsi dan operator pada ekspresi SQL', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(229, 'Sub-CPMK0242', 'Mampu melakukan operasi data spesifik menggunakan stored procedure', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(230, 'Sub-CPMK0243', 'Mampu menjelaskan konsep transaksi pada basis data', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(231, 'Sub-CPMK0244', 'Mampu menjelaskan konsep keamanan sistem basis data', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(232, 'Sub-CPMK0245', 'Mampu menjelaskan konsep pemrosesan query', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(233, 'Sub-CPMK0246', 'Mampu menyusun rencana pengelolaan basis data', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi');
INSERT INTO `sub_cpmk` (`id`, `kode_sub_cpmk`, `uraian_sub_cpmk`, `materi_pembelajaran`, `created_at`, `updated_at`, `prodi`) VALUES
(234, 'Sub-CPMK0311', 'Mampu menjelaskan konsep dasar berbagai metodologi pengembangan sistem', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(235, 'Sub-CPMK0312', 'Mampu menerapkan langkah-langkah awal metodologi pengembangan sistem', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(236, 'Sub-CPMK0313', 'Mengevaluasi efektivitas penggunaan metodologi pengembangan sistem', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(237, 'Sub-CPMK0314', 'Menjelaskan teknik-teknik pengujian sistem', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(238, 'Sub-CPMK0315', 'Menjelaskan strategi pengujian sistem', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(239, 'Sub-CPMK0316', 'Melakukan pengujian dan pemeliharaan sistem berdasarkan studi kasus nyata', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(240, 'Sub-CPMK0321', 'Mampu memahami konsep dasar pemrograman', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(241, 'Sub-CPMK0322', 'Mampu membuat program sederhana', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(242, 'Sub-CPMK0323', 'Mampu menerapkan konsep debugging dan troubleshooting', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(243, 'Sub-CPMK0324', 'Mampu menerapkan struktur data dasar', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(244, 'Sub-CPMK0325', 'Mampu memahami dan mengimplementasikan algoritma dasar', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(245, 'Sub-CPMK0326', 'Mampu menggunakan IDE dan alat bantu pengembangan', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(246, 'Sub-CPMK0331', 'Mampu melakukan analisis kebutuhan pengguna dan bisnis', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(247, 'Sub-CPMK0332', 'Mampu merancang model proses bisnis organisasi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(248, 'Sub-CPMK0411', 'Mampu memahami sistem operasi Linux', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(249, 'Sub-CPMK0412', 'Mampu memahami operasi dasar input output Linux', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(250, 'Sub-CPMK0413', 'Mampu memahami operasi file, direktori, dan hak akses', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(251, 'Sub-CPMK0414', 'Mampu memahami manajemen proses dan perangkat keras', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(252, 'Sub-CPMK0415', 'Mampu memahami bash/shell', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(253, 'Sub-CPMK0416', 'Mampu memahami manajemen user dan group', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(254, 'Sub-CPMK0417', 'Mampu memahami manajemen aplikasi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(255, 'Sub-CPMK0511', 'Mampu menjelaskan unsur-unsur organisasi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(256, 'Sub-CPMK0512', 'Mampu menjelaskan perilaku organisasi sosial', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(257, 'Sub-CPMK0513', 'Mampu memahami etika dalam bisnis dan TI/SI', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(258, 'Sub-CPMK0521', 'Mampu memahami konsep monev dan audit TI/SI', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(259, 'Sub-CPMK0614', 'Mampu memahami konsep tata kelola TI', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(260, 'Sub-CPMK0711', 'Mampu memahami konsep proyek', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(261, 'Sub-CPMK0721', 'Mampu menginisiasi dan merencanakan proyek SI', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(262, 'Sub-CPMK0731', 'Mampu membuat analisis kebutuhan perangkat lunak berbasis studi kasus', '', '2026-02-24 00:14:13', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(263, 'Sub-CPMK0821', 'Mampu memahami konsep data mining', '', '2026-02-24 00:14:13', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(264, 'Sub-CPMK0923', 'Mampu memahami konsep kecerdasan buatan', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(265, 'Sub-CPMK1011', 'Mampu menjelaskan konsep dasar pemodelan proses bisnis', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(266, 'Sub-CPMK1012', 'Mampu menganalisis proses bisnis menggunakan standar dan notasi pemodelan', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(267, 'Sub-CPMK1013', 'Mampu menjelaskan tahapan pengelolaan siklus hidup proses bisnis', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(268, 'Sub-CPMK1014', 'Mampu menganalisis kebutuhan perbaikan proses bisnis dan merekomendasikan solusi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(269, 'Sub-CPMK1015', 'Mampu menjelaskan konsep dasar kewirausahaan dan peran teknologi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(270, 'Sub-CPMK1016', 'Mampu menjabarkan perbedaan Process Improvement dan Process Reengineering', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(271, 'Sub-CPMK1017', 'Mampu menggambarkan proses AS-IS dan TO-BE', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(272, 'Sub-CPMK1018', 'Mampu menganalisis proses AS-IS dengan metode kualitatif dan kuantitatif', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(273, 'Sub-CPMK1019', 'Mampu mereparasi proses AS-IS dengan metode redesign', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(274, 'Sub-CPMK10110', 'Mampu menunjukkan eksekusi proses model pada perangkat lunak BPM', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(275, 'Sub-CPMK10111', 'Mampu memilih metode heuristics yang tepat dalam process redesign', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(276, 'Sub-CPMK10112', 'Mampu memahami konsep dasar dan permasalahan bisnis start-up', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(277, 'Sub-CPMK10113', 'Mampu memahami langkah pengembangan produk dan layanan start-up', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(278, 'Sub-CPMK1021', 'Mampu menjelaskan konsep dasar manajemen hubungan pelanggan (CRM)', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(279, 'Sub-CPMK1022', 'Mampu menjabarkan tahap identifikasi, diferensiasi, interaksi dan customisasi CRM', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(280, 'Sub-CPMK1023', 'Mampu mengadaptasikan pendekatan analytical CRM', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(281, 'Sub-CPMK1024', 'Mampu menjelaskan berbagai tool CRM', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(282, 'Sub-CPMK1025', 'Mampu menjabarkan tahapan pengelolaan program CRM', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(283, 'Sub-CPMK1026', 'Mampu mengidentifikasi proses bisnis CRM', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(284, 'Sub-CPMK1027', 'Mampu menjelaskan konsep dasar manajemen rantai pasok', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(285, 'Sub-CPMK1028', 'Mampu memetakan proses bisnis umum rantai pasok', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(286, 'Sub-CPMK1029', 'Mampu menerapkan metode pengelolaan permintaan', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(287, 'Sub-CPMK10210', 'Mampu menerapkan metode perencanaan agregat', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(288, 'Sub-CPMK10211', 'Mampu menerapkan metode pengelolaan persediaan', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(289, 'Sub-CPMK10212', 'Mampu menjabarkan proses logistik dan pemenuhan pesanan', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(290, 'Sub-CPMK10213', 'Mampu menjabarkan peran informasi dalam rantai pasok', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(291, 'Sub-CPMK10214', 'Mampu menganalisis permasalahan rantai pasok dan mengusulkan solusi SI/TI', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(292, 'Sub-CPMK10215', 'Mampu menjelaskan teori probabilitas dan penerapannya', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(293, 'Sub-CPMK10216', 'Mampu menerapkan metode machine learning', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(294, 'Sub-CPMK10217', 'Mampu menerapkan realisasi AI dalam studi kasus nyata', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(295, 'Sub-CPMK10218', 'Mampu menjelaskan penyimpanan dan manajemen data cloud computing', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(296, 'Sub-CPMK10219', 'Mampu memahami topik riset mengenai cloud computing', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(297, 'Sub-CPMK10220', 'Mampu menerapkan layanan cloud computing dalam organisasi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(298, 'Sub-CPMK1111', 'Mampu menjelaskan konsep dasar interaksi manusia dan komputer', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(299, 'Sub-CPMK1112', 'Mampu menjelaskan dan menganalisis masalah perancangan interaksi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(300, 'Sub-CPMK1113', 'Mampu menjelaskan dasar perancangan interaksi berfokus pada pengguna', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(301, 'Sub-CPMK1114', 'Mampu menjelaskan teknik dan model perancangan interaksi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(302, 'Sub-CPMK1115', 'Mampu menjelaskan perancangan interaksi pada perangkat lunak', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(303, 'Sub-CPMK1116', 'Mampu merancang interaksi pada perangkat lunak', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(304, 'Sub-CPMK1117', 'Mampu menjelaskan design principles dan general design planning', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(305, 'Sub-CPMK1118', 'Mampu menjelaskan telemetry dan analytics', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(306, 'Sub-CPMK1121', 'Mampu menerapkan konsep UI/UX dalam pengembangan perangkat lunak', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(307, 'Sub-CPMK1122', 'Mampu mengimplementasikan antarmuka pengguna menggunakan HTML, CSS, dan JavaScript', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(308, 'Sub-CPMK1123', 'Mampu menjelaskan integrasi antar sistem menggunakan web service dan peran API', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(309, 'Sub-CPMK1124', 'Mampu mengintegrasikan web service dengan aplikasi klien dan menguji konektivitas', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(310, 'Sub-CPMK1125', 'Mampu melakukan pengujian dan debugging aplikasi mobile', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(311, 'Sub-CPMK1131', 'Mampu menjelaskan aturan perancangan dan menggunakan tools perancangan', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(312, 'Sub-CPMK1132', 'Mampu membuat wireframes dan mockup', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(313, 'Sub-CPMK1133', 'Mampu membuat prototype', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(314, 'Sub-CPMK1134', 'Mampu memahami faktor dan teknik evaluasi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(315, 'Sub-CPMK1135', 'Mampu menggunakan metode evaluasi sesuai kebutuhan', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(316, 'Sub-CPMK1136', 'Mampu memperbaiki hasil perancangan interaksi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(317, 'Sub-CPMK1137', 'Mampu menjelaskan tren antarmuka pengguna saat ini', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(318, 'Sub-CPMK1211', 'Mampu menjelaskan tahapan menyusun business plan', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(319, 'Sub-CPMK1212', 'Mampu menjelaskan tantangan dan risiko bisnis', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(320, 'Sub-CPMK1213', 'Mampu menemukan ide inovasi bisnis start-up', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(321, 'Sub-CPMK1214', 'Mampu menyusun business model', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(322, 'Sub-CPMK1215', 'Mampu menjelaskan sejarah, kedudukan, dan fungsi Bahasa Indonesia', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(323, 'Sub-CPMK1216', 'Mampu menjelaskan etika dan plagiasi dalam karya ilmiah', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(324, 'Sub-CPMK1217', 'Mampu menghasilkan karya ilmiah populer dan resmi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(325, 'Sub-CPMK1218', 'Mampu melakukan perujukan dan pengutipan', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(326, 'Sub-CPMK1219', 'Mampu memahami istilah teknis bahasa Inggris di bidang TI', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(327, 'Sub-CPMK1210', 'Mampu membaca dan memahami literatur teknis bahasa Inggris', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(328, 'Sub-CPMK12111', 'Mampu menulis laporan teknis dan email profesional dalam bahasa Inggris', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(329, 'Sub-CPMK12112', 'Mampu menyusun rencana kegiatan berdasarkan landasan ilmiah', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(330, 'Sub-CPMK12113', 'Mampu menyajikan hasil observasi dalam bentuk tulisan ilmiah', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(331, 'Sub-CPMK12114', 'Mampu memahami konsep dasar keimanan dan ketuhanan dalam Islam', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(332, 'Sub-CPMK12115', 'Mampu memahami prinsip ajaran Islam secara utuh', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(333, 'Sub-CPMK12116', 'Mampu memahami tingkatan ajaran agama Islam', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(334, 'Sub-CPMK1221', 'Mampu mengembangkan model bisnis inovatif berbasis teknologi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(335, 'Sub-CPMK1222', 'Mampu mengidentifikasi peluang bisnis berdasarkan analisis pasar', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(336, 'Sub-CPMK1223', 'Mampu melakukan penelusuran sistematis dan berpikir kritis', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(337, 'Sub-CPMK1224', 'Mampu memahami pentingnya bela negara dan partisipasi politik', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(338, 'Sub-CPMK1225', 'Mampu memahami isu kebangsaan dan globalisasi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(339, 'Sub-CPMK1226', 'Mampu menjelaskan Pancasila dalam kajian sejarah bangsa', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(340, 'Sub-CPMK1227', 'Mampu menjelaskan Pancasila sebagai sistem filsafat', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(341, 'Sub-CPMK1228', 'Mampu menganalisis Pancasila sebagai dasar negara', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(342, 'Sub-CPMK1229', 'Mampu menganalisis Pancasila sebagai ideologi negara', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(343, 'Sub-CPMK12210', '(Duplikasi kode – perlu verifikasi penomoran)', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(344, 'Sub-CPMK1311', 'Mampu menjelaskan teori dan penerapan kepemimpinan', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(345, 'Sub-CPMK1312', 'Mampu menjelaskan tantangan, perubahan, dan pengembangan organisasi sosial', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(346, 'Sub-CPMK1313', 'Mampu menerapkan aturan profesional SI/TI secara beretika', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(347, 'Sub-CPMK1314', 'Mampu melakukan observasi dan menganalisis hasil observasi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(348, 'Sub-CPMK1315', 'Mampu menghubungkan teori dengan praktik riil di lapangan', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(349, 'Sub-CPMK1316', 'Mampu berkomunikasi dengan pihak mitra dan menunjukkan unjuk kerja profesional', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(350, 'Sub-CPMK1321', 'Mampu menjelaskan teori komunikasi manusia', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(351, 'Sub-CPMK1322', 'Mampu menunjukkan keterampilan komunikasi visual, lisan, tertulis', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(352, 'Sub-CPMK1323', 'Mampu membangun hubungan kerja dalam kelompok', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(353, 'Sub-CPMK1324', 'Mampu menerapkan prinsip komunikasi efektif', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(354, 'Sub-CPMK1325', 'Mampu memahami strategi komunikasi dalam negosiasi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(355, 'Sub-CPMK1326', 'Mampu menganalisis masalah dalam negosiasi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(356, 'Sub-CPMK1327', 'Mampu merencanakan strategi negosiasi efektif', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(357, 'Sub-CPMK1328', 'Mampu memahami ejaan, pilihan kata, kalimat, dan paragraf ilmiah', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(358, 'Sub-CPMK1329', 'Mampu memahami penulisan proposal, laporan, artikel', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(359, 'Sub-CPMK13210', 'Mampu menyunting tulisan karya ilmiah', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(360, 'Sub-CPMK13211', 'Mampu menerapkan teknik presentasi yang baik', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(361, 'Sub-CPMK13212', 'Mampu berkomunikasi lisan dalam bahasa Inggris', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(362, 'Sub-CPMK13213', 'Mampu memahami struktur kalimat dan tata bahasa Inggris teknis', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(363, 'Sub-CPMK1331', 'Mampu menjelaskan pandangan Islam terhadap sains dan teknologi', '', '2026-02-24 00:14:13', '2026-02-24 00:14:13', 'S1 Sistem Informasi'),
(364, 'Sub-CPMK1332', 'Mampu menjelaskan etika komunikasi dan konsep cyber dalam Islam', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(365, 'Sub-CPMK1333', 'Mampu menjelaskan hukum Islam terkait fenomena modern', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(366, 'Sub-CPMK1334', 'Mampu memahami konsep kewarganegaraan dan nasionalisme', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(367, 'Sub-CPMK1335', 'Mampu menganalisis demokrasi dan HAM', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(368, 'Sub-CPMK1336', 'Mampu menjelaskan Pancasila sebagai sistem etika', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(369, 'Sub-CPMK1337', 'Mampu menjelaskan Pancasila sebagai dasar nilai pengembangan ilmu', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(370, 'Sub-CPMK1338', 'Mampu menjelaskan nilai Pancasila dalam IPTEK', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(371, 'Sub-CPMK1633', 'Mampu memahami proses audit TI/SI terstandar', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(372, 'Sub-CPMK1634', 'Mampu menyusun perangkat audit TI/SI', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(373, 'Sub-CPMK1635', 'Mampu mengeksekusi monev terhadap fungsi TI/SI', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(374, 'Sub-CPMK0712', 'Mampu memahami kerangka manajemen proyek', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(375, 'Sub-CPMK0713', 'Mampu memahami area pengetahuan manajemen proyek', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(376, 'Sub-CPMK0714', 'Mampu memahami lingkungan proyek sistem informasi', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(377, 'Sub-CPMK0722', 'Mampu mengeksekusi dan mengevaluasi proyek sistem informasi', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(378, 'Sub-CPMK0723', 'Mampu menjelaskan konsep dasar rekayasa perangkat lunak', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(379, 'Sub-CPMK0724', 'Mampu menjelaskan metode dan model pengembangan perangkat lunak', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(380, 'Sub-CPMK0725', 'Mampu memahami teknik analisis kebutuhan perangkat lunak', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(381, 'Sub-CPMK0726', 'Mampu menjelaskan dasar desain perangkat lunak', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(382, 'Sub-CPMK0727', 'Mampu menjelaskan konsep dasar penelitian', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(383, 'Sub-CPMK0732', 'Mampu merancang dan mengimplementasikan desain perangkat lunak modular', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(384, 'Sub-CPMK0733', 'Mampu menerapkan strategi pengujian perangkat lunak', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(385, 'Sub-CPMK0734', 'Mampu mengimplementasikan metode pengembangan perangkat lunak', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(386, 'Sub-CPMK0735', 'Mampu mengevaluasi kualitas perangkat lunak', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(387, 'Sub-CPMK0741', 'Mampu menyusun proposal penelitian', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(388, 'Sub-CPMK0742', 'Mampu mengidentifikasi masalah penelitian', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(389, 'Sub-CPMK0743', 'Mampu menyusun tinjauan pustaka', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(390, 'Sub-CPMK0744', 'Mampu merancang metodologi penelitian', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(391, 'Sub-CPMK0745', 'Mampu mengolah dan menganalisis data penelitian', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(392, 'Sub-CPMK0746', 'Mampu menyusun laporan hasil penelitian', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(393, 'Sub-CPMK0811', 'Mampu memahami konsep dasar kecerdasan buatan', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(394, 'Sub-CPMK0812', 'Mampu menjelaskan teknik pencarian dan representasi pengetahuan', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(395, 'Sub-CPMK0813', 'Mampu menerapkan algoritma dasar kecerdasan buatan', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(396, 'Sub-CPMK0814', 'Mampu memahami konsep machine learning', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(397, 'Sub-CPMK0815', 'Mampu mengimplementasikan model machine learning sederhana', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(398, 'Sub-CPMK0822', 'Mampu menerapkan teknik klasifikasi dan clustering', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(399, 'Sub-CPMK0823', 'Mampu melakukan preprocessing data', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(400, 'Sub-CPMK0824', 'Mampu mengevaluasi model data mining', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(401, 'Sub-CPMK0831', 'Mampu memahami konsep keamanan informasi', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(402, 'Sub-CPMK0832', 'Mampu mengidentifikasi ancaman dan risiko keamanan', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(403, 'Sub-CPMK0833', 'Mampu menerapkan teknik pengamanan sistem', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(404, 'Sub-CPMK0834', 'Mampu memahami konsep kriptografi dasar', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(405, 'Sub-CPMK0835', 'Mampu menerapkan algoritma kriptografi sederhana', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(406, 'Sub-CPMK0841', 'Mampu memahami konsep komputasi awan', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(407, 'Sub-CPMK0842', 'Mampu menjelaskan model layanan cloud (IaaS, PaaS, SaaS)', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(408, 'Sub-CPMK0843', 'Mampu mengimplementasikan layanan cloud sederhana', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(409, 'Sub-CPMK0851', 'Mampu memahami konsep Internet of Things (IoT)', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(410, 'Sub-CPMK0852', 'Mampu menjelaskan arsitektur IoT', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(411, 'Sub-CPMK0853', 'Mampu mengintegrasikan perangkat IoT dengan sistem informasi', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(412, 'Sub-CPMK0861', 'Mampu memahami konsep Big Data', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(413, 'Sub-CPMK0862', 'Mampu menjelaskan teknologi Big Data', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(414, 'Sub-CPMK0863', 'Mampu melakukan analisis data skala besar', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(415, 'Sub-CPMK0871', 'Mampu memahami konsep blockchain', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(416, 'Sub-CPMK0872', 'Mampu menjelaskan mekanisme smart contract', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(417, 'Sub-CPMK0873', 'Mampu menganalisis penerapan blockchain dalam bisnis', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(418, 'Sub-CPMK0881', 'Mampu memahami etika profesi TI', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(419, 'Sub-CPMK0882', 'Mampu menganalisis studi kasus pelanggaran etika TI', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(420, 'Sub-CPMK0891', 'Mampu memahami konsep transformasi digital', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(421, 'Sub-CPMK0892', 'Mampu menganalisis strategi transformasi digital organisasi', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi'),
(422, 'Sub-CPMK0893', 'Mampu merancang roadmap transformasi digital', '', '2026-02-24 00:14:14', '2026-02-24 00:14:14', 'S1 Sistem Informasi');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `role` varchar(100) NOT NULL,
  `level` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `role`, `level`, `created_at`, `updated_at`) VALUES
(2, 'Retno Agus Setiawan', 'retnoagussetiawan@uhb.ac.id', NULL, '$2y$12$pZxKxhWrbC2/pg80VlLjvOJ.5XLgbB5wMoQ6gZ.LI9prgprMKPEVm', NULL, NULL, NULL, NULL, NULL, NULL, 'Kaprodi', 1, '2026-02-03 01:56:16', '2026-03-01 20:20:17'),
(3, 'Imam Ahmad Ashari', 'imamahmadashari@uhb.ac.id', NULL, '$2y$12$PH.X9KCoCGa8ExATOx//yumTRazrGvoIE.0Wdsc.cJCtdSoqgmXKi', NULL, NULL, NULL, NULL, NULL, NULL, 'Kaprodi', 1, '2026-02-03 01:56:16', '2026-02-17 00:55:44'),
(5, 'Hadi Jayusman', 'hadijayusman@uhb.ac.id', NULL, '$2y$12$.DVbrc7dqLsCml/X16z0qezfaXHbKd9vo9NkH2khZigaS7xw0aR3i', NULL, NULL, NULL, NULL, NULL, NULL, 'BAUK', 0, '2026-02-03 01:56:16', '2026-03-01 20:20:56'),
(7, 'Khoirun Nisa', 'khoirunnisa@uhb.ac.id', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '2026-02-03 01:56:16', '2026-03-01 20:19:26'),
(100, 'Anggit Wirasto', 'anggitwirasto@uhb.ac.id', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, 'Dekan', 0, '2026-02-03 01:56:16', '2026-03-01 20:14:18'),
(106, 'Mariah Ulfah', 'mariahulfah@uhb.ac.id', NULL, '$2y$12$ujvyOZGeGPnET5GL6wyC0e5FMlRLWnfkt/E77K6fgML7jFiitkOIu', NULL, NULL, NULL, NULL, NULL, NULL, 'dosen', 1, '2026-02-18 01:04:31', '2026-02-18 01:04:31'),
(107, 'Faizal Rizky Yuttama', 'faizal@uhb.ac.id', NULL, '$2y$12$kEKnbqHlD2A9Ul.VjsftyuCQx0oaQicl49QPWGtZyDkfN1u/M5mMe', NULL, NULL, NULL, NULL, NULL, NULL, 'dosen', 0, '2026-03-01 19:59:16', '2026-03-01 19:59:16'),
(109, 'Galih Samodra', 'galihsamodra@uhb.ac.id', NULL, '$2y$12$rY6P546MZDCHrh2OlNYxnuraEU0kmx7yWEK5IsgfIhpODmoQE7UkW', NULL, NULL, NULL, NULL, NULL, NULL, 'dosen', 0, '2026-03-01 20:10:08', '2026-03-01 20:10:08'),
(110, 'Giovanny Bangun Kristianto', 'giovannybangunkristianto@uhb.ac.id', NULL, '$2y$12$hX0BfI26D6uHb7bGXJxqpe8wRQJhRcslBiSe2TbdSfi18iNVOtBmO', NULL, NULL, NULL, NULL, NULL, NULL, 'dosen', 0, '2026-03-01 20:23:05', '2026-03-01 20:23:05'),
(111, 'Tri Pujiani', 'tripujiani@uhb.ac.id', NULL, '$2y$12$1iSa3VNZN1jy1g2.Ygpo2ubGA9z3mGHFc1t7u4YvsMbtX2lP6L18u', NULL, NULL, NULL, NULL, NULL, NULL, 'dosen', 0, '2026-03-01 20:24:11', '2026-03-01 20:24:11'),
(112, 'Maya Ruhtiani', 'mayaruhtiani@uhb.ac.id', NULL, '$2y$12$S2G/WzD0J4v.ApD2uClGoudQ.EDPWhg5BuJkT9DcOfacgEkipi4O6', NULL, NULL, NULL, NULL, NULL, NULL, 'dosen', 0, '2026-03-01 20:25:06', '2026-03-01 20:25:06'),
(113, 'Surtiningsih', 'surtiningsih@uhb.ac.id', NULL, '$2y$12$1xA5uREJbDui.5mY.razu.3olh0RAuGnwAv7VMbf1ZNWr2sh4zE/2', NULL, NULL, NULL, NULL, NULL, NULL, 'dosen', 0, '2026-03-01 20:26:25', '2026-03-01 20:26:25'),
(114, 'Atun Raudotul Ma’rifah', 'atunraudotul@uhb.ac.id', NULL, '$2y$12$bF4iHmHQTE.XPlXGlYRhje/NjqqdGEjKscLzVOqzFAIvF4XJvZRpy', NULL, NULL, NULL, NULL, NULL, NULL, 'dosen', 0, '2026-03-01 20:27:25', '2026-03-01 20:27:25'),
(115, 'Rahmaya Nova Handayani', 'mayanova2005@gmail.com', NULL, '$2y$12$kOXy7tyKpLiT83l6CpnpLe2OthretCxZ7ZOr5H7Gqbgp2U7BhtOnm', NULL, NULL, NULL, NULL, NULL, NULL, 'dosen', 0, '2026-03-01 20:28:22', '2026-03-01 20:28:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bahan_kajian`
--
ALTER TABLE `bahan_kajian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bk_mk`
--
ALTER TABLE `bk_mk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cpl_bk`
--
ALTER TABLE `cpl_bk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cpl_bk_mk`
--
ALTER TABLE `cpl_bk_mk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cpl_cpmk`
--
ALTER TABLE `cpl_cpmk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cpl_cpmk_kode_cpl_foreign` (`kode_cpl`),
  ADD KEY `cpl_cpmk_kode_cpmk_foreign` (`kode_cpmk`),
  ADD KEY `cpl_cpmk_kode_mk_foreign` (`kode_mk`);

--
-- Indexes for table `cpl_mk`
--
ALTER TABLE `cpl_mk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cpl_pl`
--
ALTER TABLE `cpl_pl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cpl_prodi`
--
ALTER TABLE `cpl_prodi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cpmk`
--
ALTER TABLE `cpmk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dosen_profils`
--
ALTER TABLE `dosen_profils`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dosen_profils_nik_unique` (`nik`),
  ADD UNIQUE KEY `dosen_profils_nidn_unique` (`nidn`),
  ADD KEY `dosen_profils_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fakultas_kode_fakultas_unique` (`kode_fakultas`);

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
  ADD KEY `krs_kode_mk_foreign` (`kode_mk`),
  ADD KEY `krs_mahasiswa_id_foreign` (`mahasiswa_id`);

--
-- Indexes for table `mahasiswas`
--
ALTER TABLE `mahasiswas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mahasiswas_nim_unique` (`nim`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mata_kuliah_kode_mk_unique` (`kode_mk`);

--
-- Indexes for table `metode_penilaian`
--
ALTER TABLE `metode_penilaian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organisasi_mk`
--
ALTER TABLE `organisasi_mk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organisasi_mk_kode_mk_foreign` (`kode_mk`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pemetaan_mk_cpl_cpmk`
--
ALTER TABLE `pemetaan_mk_cpl_cpmk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pemetaan_mk_cpl_cpmk_kode_mk_foreign` (`kode_mk`),
  ADD KEY `pemetaan_mk_cpl_cpmk_kode_cpl_foreign` (`kode_cpl`),
  ADD KEY `pemetaan_mk_cpl_cpmk_kode_cpmk_foreign` (`kode_cpmk`);

--
-- Indexes for table `penilaian_komponens`
--
ALTER TABLE `penilaian_komponens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penilaian_komponens_nim_foreign` (`nim`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `portofolios`
--
ALTER TABLE `portofolios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `portofolios_kode_mk_angkatan_unique` (`kode_mk`,`angkatan`),
  ADD KEY `portofolios_kode_mk_index` (`kode_mk`),
  ADD KEY `portofolios_angkatan_index` (`angkatan`);

--
-- Indexes for table `portofolio_details`
--
ALTER TABLE `portofolio_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portofolio_details_portofolio_id_foreign` (`portofolio_id`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `prodi_kode_prodi_unique` (`kode_prodi`),
  ADD KEY `prodi_fakultas_id_foreign` (`fakultas_id`);

--
-- Indexes for table `profil_lulusan`
--
ALTER TABLE `profil_lulusan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `relasi_capaian`
--
ALTER TABLE `relasi_capaian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sub_cpmk`
--
ALTER TABLE `sub_cpmk`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `bahan_kajian`
--
ALTER TABLE `bahan_kajian`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `bk_mk`
--
ALTER TABLE `bk_mk`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=586;

--
-- AUTO_INCREMENT for table `cpl_bk`
--
ALTER TABLE `cpl_bk`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `cpl_bk_mk`
--
ALTER TABLE `cpl_bk_mk`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5172;

--
-- AUTO_INCREMENT for table `cpl_cpmk`
--
ALTER TABLE `cpl_cpmk`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `cpl_mk`
--
ALTER TABLE `cpl_mk`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=507;

--
-- AUTO_INCREMENT for table `cpl_pl`
--
ALTER TABLE `cpl_pl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `cpl_prodi`
--
ALTER TABLE `cpl_prodi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `cpmk`
--
ALTER TABLE `cpmk`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `dosen_profils`
--
ALTER TABLE `dosen_profils`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `krs`
--
ALTER TABLE `krs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=548;

--
-- AUTO_INCREMENT for table `mahasiswas`
--
ALTER TABLE `mahasiswas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `metode_penilaian`
--
ALTER TABLE `metode_penilaian`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `organisasi_mk`
--
ALTER TABLE `organisasi_mk`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `pemetaan_mk_cpl_cpmk`
--
ALTER TABLE `pemetaan_mk_cpl_cpmk`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `penilaian_komponens`
--
ALTER TABLE `penilaian_komponens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=417;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portofolios`
--
ALTER TABLE `portofolios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `portofolio_details`
--
ALTER TABLE `portofolio_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `profil_lulusan`
--
ALTER TABLE `profil_lulusan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `relasi_capaian`
--
ALTER TABLE `relasi_capaian`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1144;

--
-- AUTO_INCREMENT for table `sub_cpmk`
--
ALTER TABLE `sub_cpmk`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=423;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cpl_cpmk`
--
ALTER TABLE `cpl_cpmk`
  ADD CONSTRAINT `cpl_cpmk_kode_cpl_foreign` FOREIGN KEY (`kode_cpl`) REFERENCES `cpl_prodi` (`kode_cpl`) ON DELETE CASCADE,
  ADD CONSTRAINT `cpl_cpmk_kode_cpmk_foreign` FOREIGN KEY (`kode_cpmk`) REFERENCES `cpmk` (`kode_cpmk`) ON DELETE CASCADE,
  ADD CONSTRAINT `cpl_cpmk_kode_mk_foreign` FOREIGN KEY (`kode_mk`) REFERENCES `mata_kuliah` (`kode_mk`) ON DELETE CASCADE;

--
-- Constraints for table `dosen_profils`
--
ALTER TABLE `dosen_profils`
  ADD CONSTRAINT `dosen_profils_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `krs`
--
ALTER TABLE `krs`
  ADD CONSTRAINT `krs_kode_mk_foreign` FOREIGN KEY (`kode_mk`) REFERENCES `mata_kuliah` (`kode_mk`) ON DELETE CASCADE,
  ADD CONSTRAINT `krs_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswas` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `organisasi_mk`
--
ALTER TABLE `organisasi_mk`
  ADD CONSTRAINT `organisasi_mk_kode_mk_foreign` FOREIGN KEY (`kode_mk`) REFERENCES `mata_kuliah` (`kode_mk`) ON DELETE CASCADE;

--
-- Constraints for table `pemetaan_mk_cpl_cpmk`
--
ALTER TABLE `pemetaan_mk_cpl_cpmk`
  ADD CONSTRAINT `pemetaan_mk_cpl_cpmk_kode_cpl_foreign` FOREIGN KEY (`kode_cpl`) REFERENCES `cpl_prodi` (`kode_cpl`) ON DELETE CASCADE,
  ADD CONSTRAINT `pemetaan_mk_cpl_cpmk_kode_cpmk_foreign` FOREIGN KEY (`kode_cpmk`) REFERENCES `cpmk` (`kode_cpmk`) ON DELETE CASCADE,
  ADD CONSTRAINT `pemetaan_mk_cpl_cpmk_kode_mk_foreign` FOREIGN KEY (`kode_mk`) REFERENCES `mata_kuliah` (`kode_mk`) ON DELETE CASCADE;

--
-- Constraints for table `penilaian_komponens`
--
ALTER TABLE `penilaian_komponens`
  ADD CONSTRAINT `penilaian_komponens_nim_foreign` FOREIGN KEY (`nim`) REFERENCES `mahasiswas` (`nim`) ON DELETE CASCADE;

--
-- Constraints for table `portofolio_details`
--
ALTER TABLE `portofolio_details`
  ADD CONSTRAINT `portofolio_details_portofolio_id_foreign` FOREIGN KEY (`portofolio_id`) REFERENCES `portofolios` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `prodi`
--
ALTER TABLE `prodi`
  ADD CONSTRAINT `prodi_fakultas_id_foreign` FOREIGN KEY (`fakultas_id`) REFERENCES `fakultas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
