-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2025 at 04:38 AM
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
-- Database: `cinema_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `movie_id` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(255) NOT NULL,
  `hall` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(255) NOT NULL,
  `seats` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`seats`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `movie_id`, `location`, `hall`, `date`, `time`, `seats`, `created_at`, `updated_at`) VALUES
(1, 1, 'Cinema One', 'Hall A', '2025-07-13', '2:00 PM', '\"[\\\"A1\\\",\\\"A2\\\",\\\"A3\\\"]\"', '2025-07-12 09:09:05', '2025-07-12 09:09:05'),
(2, 1, 'Cinema One', 'Hall 1', '2025-07-13', '12:30 PM', '\"[\\\"A1\\\"]\"', '2025-07-12 10:18:25', '2025-07-12 10:18:25'),
(3, 1, 'Cinema One', 'Hall 1', '2025-07-13', '12:30 PM', '\"[\\\"A1\\\"]\"', '2025-07-12 10:18:25', '2025-07-12 10:18:25'),
(4, 1, 'GSC Mid Valley', 'Hall 5', '2025-07-14', '7:30 PM', '\"[A1,A2,A3]\"', '2025-07-12 11:38:12', '2025-07-12 11:38:12'),
(5, 1, 'GSC Mid Valley', 'Hall 5', '2025-07-14', '7:30 PM', '\"[\\\"B1\\\",\\\"B2\\\"]\"', '2025-07-12 11:58:58', '2025-07-12 11:58:58'),
(14, 1, 'Cinema One', 'Hall 1', '2025-07-14', '6:30 PM', '\"[\\\"B9\\\"]\"', '2025-07-13 03:38:55', '2025-07-13 03:38:55'),
(15, 1, 'Cinema One', 'Hall 2', '2025-07-14', '10:00 AM', '\"[\\\"G1\\\",\\\"G2\\\"]\"', '2025-07-13 03:52:18', '2025-07-13 03:52:18'),
(16, 2, 'Cinema Two', 'Hall 2', '2025-07-15', '6:30 PM', '\"[\\\"H8\\\",\\\"H7\\\"]\"', '2025-07-13 03:53:35', '2025-07-13 03:53:35'),
(17, 1, 'Cinema One', 'Hall 2', '2025-07-14', '10:00 AM', '\"[\\\"F9\\\",\\\"F8\\\",\\\"F7\\\",\\\"F6\\\",\\\"F5\\\",\\\"F4\\\",\\\"F3\\\",\\\"F2\\\",\\\"F1\\\"]\"', '2025-07-13 04:13:15', '2025-07-13 04:13:15'),
(18, 1, 'Cinema One', 'Hall 2', '2025-07-14', '10:00 AM', '\"[\\\"G9\\\"]\"', '2025-07-13 04:15:24', '2025-07-13 04:15:24'),
(19, 1, 'Cinema One', 'Hall 2', '2025-07-14', '8:00 PM', '\"[\\\"C9\\\",\\\"D9\\\"]\"', '2025-07-13 04:27:48', '2025-07-13 04:27:48'),
(20, 1, 'Cinema One', 'Hall 2', '2025-07-14', '8:00 PM', '\"[\\\"G9\\\",\\\"G8\\\"]\"', '2025-07-13 04:29:53', '2025-07-13 04:29:53'),
(21, 1, 'Cinema One', 'Hall 1', '2025-07-14', '6:30 PM', '\"[\\\"G9\\\",\\\"G8\\\"]\"', '2025-07-13 04:40:33', '2025-07-13 04:40:33'),
(22, 1, 'Cinema One', 'Hall 1', '2025-07-14', '8:00 PM', '\"[\\\"G9\\\",\\\"G8\\\"]\"', '2025-07-13 04:45:44', '2025-07-13 04:45:44'),
(23, 1, 'Cinema One', 'Hall 1', '2025-07-14', '8:00 PM', '\"[\\\"G7\\\",\\\"G6\\\"]\"', '2025-07-13 04:55:20', '2025-07-13 04:55:20'),
(24, 1, 'Cinema One', 'Hall 1', '2025-07-14', '8:00 PM', '\"[\\\"H8\\\",\\\"H7\\\"]\"', '2025-07-13 04:57:07', '2025-07-13 04:57:07'),
(25, 1, 'Cinema One', 'Hall 1', '2025-07-14', '8:00 PM', '\"[\\\"H2\\\",\\\"H3\\\"]\"', '2025-07-13 04:59:22', '2025-07-13 04:59:22'),
(26, 2, 'Cinema One', 'Hall 1', '2025-07-14', '8:00 PM', '\"[\\\"H8\\\",\\\"H7\\\",\\\"H6\\\",\\\"H5\\\",\\\"H4\\\",\\\"H3\\\",\\\"H2\\\"]\"', '2025-07-13 05:00:04', '2025-07-13 05:00:04'),
(27, 1, 'Cinema One', 'Hall 2', '2025-07-14', '8:00 PM', '\"[\\\"F9\\\",\\\"E9\\\"]\"', '2025-07-13 05:10:07', '2025-07-13 05:10:07'),
(35, 1, 'Cinema One', 'Hall 1', '2025-07-13', '8:00 PM', '\"[\\\"G9\\\",\\\"G8\\\"]\"', '2025-07-13 12:53:51', '2025-07-13 12:53:51'),
(36, 1, 'Cinema One', 'Hall 1', '2025-07-14', '6:30 PM', '\"[\\\"H8\\\",\\\"H7\\\"]\"', '2025-07-13 12:57:26', '2025-07-13 12:57:26'),
(37, 1, 'Cinema One', 'Hall 1', '2025-07-14', '6:30 PM', '\"[\\\"A8\\\",\\\"A7\\\"]\"', '2025-07-13 17:31:04', '2025-07-13 17:31:04'),
(38, 1, 'Cinema One', 'Hall 1', '2025-07-14', '6:30 PM', '\"[\\\"C1\\\",\\\"C2\\\"]\"', '2025-07-13 17:33:26', '2025-07-13 17:33:26');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(4, '2025_07_12_144252_create_movies_table', 1),
(5, '2025_07_12_144309_create_bookings_table', 1),
(6, '2025_07_12_161546_create_reviews_table', 2),
(7, '2025_07_12_170014_recreate_bookings_table', 3),
(8, '2025_07_12_185808_create_payments_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `genres` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`genres`)),
  `release_date` varchar(255) DEFAULT NULL,
  `age_rating` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `synopsis` text DEFAULT NULL,
  `cast` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`cast`)),
  `director` varchar(255) DEFAULT NULL,
  `writer` varchar(255) DEFAULT NULL,
  `totalReviews` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `genres`, `release_date`, `age_rating`, `duration`, `rating`, `synopsis`, `cast`, `director`, `writer`, `totalReviews`, `created_at`, `updated_at`) VALUES
(1, 'Venom: Let There Be Carnage', '\"[\\\"Action\\\",\\\"Adventure\\\",\\\"Sci-Fi\\\"]\"', 'October 2021', '15+', '2h 28m', 4.8, 'Eddie Brock, a journalist who is adjusting to his new symbiotic relationship with Venom...', '\"[\\\"Tom Hardy\\\",\\\"Woody Harrelson\\\",\\\"Michelle Williams\\\",\\\"Naomie Harris\\\",\\\"Reid Scott\\\",\\\"Stephen Graham\\\"]\"', 'Andy Serkis', 'Marcel', 20, '2025-07-12 07:35:04', '2025-07-12 07:35:04'),
(2, 'Interstellar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-12 07:35:04', '2025-07-12 07:35:04'),
(3, 'The Matrix', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-12 07:35:04', '2025-07-12 07:35:04'),
(4, 'Avengers: Endgame', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-12 07:35:04', '2025-07-12 07:35:04'),
(5, 'Tenet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-12 07:35:04', '2025-07-12 07:35:04');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `card_number` varchar(255) NOT NULL,
  `expiry_date` varchar(255) NOT NULL,
  `cvv` varchar(255) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `card_number`, `expiry_date`, `cvv`, `amount`, `created_at`, `updated_at`) VALUES
(1, '1212121212', '0929', '2222', 72.80, '2025-07-12 11:20:01', '2025-07-12 11:20:01'),
(2, '4111111111111111', '12/25', '123', 106.40, '2025-07-12 11:38:12', '2025-07-12 11:38:12'),
(3, '4111111111111111', '12/25', '123', 91.60, '2025-07-12 11:58:58', '2025-07-12 11:58:58'),
(4, '4111111111111111', '1225', '2222', 72.80, '2025-07-12 12:12:59', '2025-07-12 12:12:59'),
(5, '4111111111111111', '1225', '2222', 72.80, '2025-07-12 12:15:17', '2025-07-12 12:15:17'),
(6, '4111111111111111', '1225', '2222', 72.80, '2025-07-12 12:15:34', '2025-07-12 12:15:34'),
(7, '11111111111111', '0919', '2222', 74.40, '2025-07-12 12:26:09', '2025-07-12 12:26:09'),
(8, '12111111111', '0929', '2222', 40.00, '2025-07-13 03:08:35', '2025-07-13 03:08:35'),
(9, '12111111111', '0929', '2222', 40.00, '2025-07-13 03:10:26', '2025-07-13 03:10:26'),
(10, '1211111', '0929', '1111', 42.00, '2025-07-13 03:16:59', '2025-07-13 03:16:59'),
(11, '121111111', '0929', '2222', 40.00, '2025-07-13 03:21:55', '2025-07-13 03:21:55'),
(12, '12111111', '0929', '2222', 42.00, '2025-07-13 03:38:55', '2025-07-13 03:38:55'),
(13, '1211111', '0929', '0000', 54.00, '2025-07-13 03:52:18', '2025-07-13 03:52:18'),
(14, '1211111', '0000', '1212', 60.00, '2025-07-13 03:53:35', '2025-07-13 03:53:35'),
(15, '121111', '0929', '0000', 260.00, '2025-07-13 04:13:15', '2025-07-13 04:13:15'),
(16, '12111', '000', '2222', 20.00, '2025-07-13 04:15:24', '2025-07-13 04:15:24'),
(17, '1211111', '0929', '0000', 76.00, '2025-07-13 04:27:48', '2025-07-13 04:27:48'),
(18, '0000000000', '0929', '2222', 84.00, '2025-07-13 04:29:53', '2025-07-13 04:29:53'),
(19, '999999999', '9999', '0000', 60.00, '2025-07-13 04:40:33', '2025-07-13 04:40:33'),
(20, '4444444', '9999', '0000', 80.00, '2025-07-13 04:45:44', '2025-07-13 04:45:44'),
(21, '11111', '1111', '1111', 60.00, '2025-07-13 04:55:20', '2025-07-13 04:55:20'),
(22, '111111111', '9999', '1111', 84.00, '2025-07-13 04:57:07', '2025-07-13 04:57:07'),
(23, '111111111', '1111', '1111', 60.00, '2025-07-13 04:59:22', '2025-07-13 04:59:22'),
(24, '11111', '1111', '1111', 260.00, '2025-07-13 05:00:04', '2025-07-13 05:00:04'),
(25, '11111111', '1111', '1111', 80.00, '2025-07-13 05:10:07', '2025-07-13 05:10:07'),
(26, '88888', '8888', '8888', 100.00, '2025-07-13 12:42:19', '2025-07-13 12:42:19'),
(27, '88888', '8888', '8888', 100.00, '2025-07-13 12:42:33', '2025-07-13 12:42:33'),
(28, '1111111', '1111', '1111', 80.00, '2025-07-13 12:44:01', '2025-07-13 12:44:01'),
(29, '22222', '2222', '2222', 40.00, '2025-07-13 12:45:42', '2025-07-13 12:45:42'),
(30, '1111', '111', '111', 80.00, '2025-07-13 12:47:07', '2025-07-13 12:47:07'),
(31, '11111', '111', '111', 68.00, '2025-07-13 12:52:30', '2025-07-13 12:52:30'),
(32, '11111', '111', '111', 68.00, '2025-07-13 12:52:40', '2025-07-13 12:52:40'),
(33, '1111', '1111', '1111', 40.00, '2025-07-13 12:53:51', '2025-07-13 12:53:51'),
(34, '1111', '111', '111', 60.00, '2025-07-13 12:57:26', '2025-07-13 12:57:26'),
(35, '11111111', '1111', '1111', 73.20, '2025-07-13 17:31:04', '2025-07-13 17:31:04'),
(36, '1111', '1111', '1111', 80.00, '2025-07-13 17:33:26', '2025-07-13 17:33:26');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `movie_id` bigint(20) UNSIGNED NOT NULL,
  `user` varchar(255) NOT NULL,
  `stars` tinyint(4) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `movie_id`, `user`, `stars`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ali', 5, 'Amazing movie, loved every second!', NULL, NULL),
(2, 1, 'Lina', 3, 'Great visual effects but story was average.', NULL, NULL),
(3, 1, 'Syamim', 3, 'Good movie.', NULL, NULL),
(4, 1, 'Farhan', 4, 'Great experience and visuals!', '2025-07-12 08:40:20', '2025-07-12 08:40:20'),
(5, 1, 'Han', 4, 'Great experience', '2025-07-12 08:40:32', '2025-07-12 08:40:32');

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
('dLHDx1zcNvNrk70onmhW4H6njfOPd9FiInKw97Ju', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEJqZUlqMjJpVURhQTdRSnk2T3ZvRm1lYjRtWUEwRzVGRFNsVE9mdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1752349915),
('hAGxqQYg0nQabyoyxSa2Y5L2jkVL40GGFA0P0jpy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2ZJeEpoN3c1MEN2dlFSaFpDTjd0UjdzbmZGck9nRmR3QlZFcHkzOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1752455927),
('hTLOepEEPAgzdQWVrLp4VckKa6XSKv9SW2fi7thG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGkyQUo3dU0xVTRIMUZsNlZLVlFOeDUxU0wxWGxNcmRsb0pQOHluaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1752404717),
('PGWVKPVL3k9hf3AMimvPn4hiY5WtwTVo0urUOMbl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibU5ScTFuNVozc1kwWU43MnZ2UzN6RDRpMTg2MTNHRGU2ZTJzdkZKeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1752407461),
('RsrNlJvanhrJOQMAviDiKPb8P3XGA4Ch0mwET4CY', NULL, '127.0.0.1', 'PostmanRuntime/7.44.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNG1ieW9wVHpTemNUS1hEMXlYNkNNdEFoaDBhNkNTZEhCeTBabUtqayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1752349751);

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
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_movie_id_foreign` (`movie_id`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_movie_id_foreign` (`movie_id`);

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
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
