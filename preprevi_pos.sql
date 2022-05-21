-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 21, 2022 at 02:59 PM
-- Server version: 5.7.38
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `preprevi_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_details` text COLLATE utf8mb4_unicode_ci,
  `account_type_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `transaction_payment_id` int(11) DEFAULT NULL,
  `transfer_transaction_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_account_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `business_id`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-19 04:39:03', '2022-03-19 04:39:03'),
(2, 'default', 'added', 2, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-03-19 04:47:51', '2022-03-19 04:47:51'),
(3, 'default', 'added', 3, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-03-19 05:00:03', '2022-03-19 05:00:03'),
(4, 'default', 'added', 4, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2000}}', '2022-03-19 05:17:47', '2022-03-19 05:17:47'),
(5, 'default', 'added', 5, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-03-19 05:22:14', '2022-03-19 05:22:14'),
(6, 'default', 'added', 6, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-03-19 05:24:51', '2022-03-19 05:24:51'),
(7, 'default', 'added', 7, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-03-19 05:26:44', '2022-03-19 05:26:44'),
(8, 'default', 'added', 8, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-03-19 05:27:33', '2022-03-19 05:27:33'),
(9, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-11 07:33:52', '2022-04-11 07:33:52'),
(10, 'default', 'added', 9, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 07:34:18', '2022-04-11 07:34:18'),
(11, 'default', 'added', 10, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 07:47:04', '2022-04-11 07:47:04'),
(12, 'default', 'added', 11, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 07:47:37', '2022-04-11 07:47:37'),
(13, 'default', 'added', 12, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 07:50:48', '2022-04-11 07:50:48'),
(14, 'default', 'added', 13, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 07:57:23', '2022-04-11 07:57:23'),
(15, 'default', 'added', 14, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 07:57:56', '2022-04-11 07:57:56'),
(16, 'default', 'added', 15, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 07:58:57', '2022-04-11 07:58:57'),
(17, 'default', 'added', 16, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:11:35', '2022-04-11 08:11:35'),
(18, 'default', 'added', 17, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:20:29', '2022-04-11 08:20:29'),
(19, 'default', 'added', 18, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":2000}}', '2022-04-11 08:21:30', '2022-04-11 08:21:30'),
(20, 'default', 'added', 19, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:22:38', '2022-04-11 08:22:38'),
(21, 'default', 'added', 20, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:24:08', '2022-04-11 08:24:08'),
(22, 'default', 'added', 21, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:28:32', '2022-04-11 08:28:32'),
(23, 'default', 'added', 22, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:32:14', '2022-04-11 08:32:14'),
(24, 'default', 'added', 23, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:33:49', '2022-04-11 08:33:49'),
(25, 'default', 'added', 24, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:35:21', '2022-04-11 08:35:21'),
(26, 'default', 'added', 25, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:35:59', '2022-04-11 08:35:59'),
(27, 'default', 'added', 26, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:36:30', '2022-04-11 08:36:30'),
(28, 'default', 'added', 27, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:38:15', '2022-04-11 08:38:15'),
(29, 'default', 'added', 28, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:39:21', '2022-04-11 08:39:21'),
(30, 'default', 'added', 29, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":2000}}', '2022-04-11 08:39:44', '2022-04-11 08:39:44'),
(31, 'default', 'added', 30, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:40:18', '2022-04-11 08:40:18'),
(32, 'default', 'added', 31, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:40:47', '2022-04-11 08:40:47'),
(33, 'default', 'added', 32, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:40:56', '2022-04-11 08:40:56'),
(34, 'default', 'added', 33, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:41:26', '2022-04-11 08:41:26'),
(35, 'default', 'added', 34, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:41:58', '2022-04-11 08:41:58'),
(36, 'default', 'added', 35, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:43:00', '2022-04-11 08:43:00'),
(37, 'default', 'added', 36, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:44:55', '2022-04-11 08:44:55'),
(38, 'default', 'added', 37, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:46:02', '2022-04-11 08:46:02'),
(39, 'default', 'added', 38, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:48:39', '2022-04-11 08:48:39'),
(40, 'default', 'added', 39, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:49:54', '2022-04-11 08:49:54'),
(41, 'default', 'added', 40, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:50:28', '2022-04-11 08:50:28'),
(42, 'default', 'added', 41, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:55:22', '2022-04-11 08:55:22'),
(43, 'default', 'added', 42, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 08:57:22', '2022-04-11 08:57:22'),
(44, 'default', 'added', 43, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 09:01:03', '2022-04-11 09:01:03'),
(45, 'default', 'added', 44, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 09:02:55', '2022-04-11 09:02:55'),
(46, 'default', 'added', 45, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-11 09:03:40', '2022-04-11 09:03:40'),
(47, 'default', 'added', 46, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-11 09:10:33', '2022-04-11 09:10:33'),
(48, 'default', 'added', 47, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 09:25:46', '2022-04-11 09:25:46'),
(49, 'default', 'added', 48, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-11 09:26:48', '2022-04-11 09:26:48'),
(50, 'default', 'added', 49, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 09:29:25', '2022-04-11 09:29:25'),
(51, 'default', 'added', 50, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 09:30:03', '2022-04-11 09:30:03'),
(52, 'default', 'added', 51, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-11 09:30:47', '2022-04-11 09:30:47'),
(53, 'default', 'added', 52, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 09:33:08', '2022-04-11 09:33:08'),
(54, 'default', 'added', 53, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 09:34:36', '2022-04-11 09:34:36'),
(55, 'default', 'added', 54, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 09:34:43', '2022-04-11 09:34:43'),
(56, 'default', 'added', 55, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":2000}}', '2022-04-11 09:35:01', '2022-04-11 09:35:01'),
(57, 'default', 'added', 56, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 09:35:53', '2022-04-11 09:35:53'),
(58, 'default', 'added', 57, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":2000}}', '2022-04-11 09:39:13', '2022-04-11 09:39:13'),
(59, 'default', 'added', 58, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 09:45:52', '2022-04-11 09:45:52'),
(60, 'default', 'added', 59, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 09:47:45', '2022-04-11 09:47:45'),
(61, 'default', 'added', 60, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 09:48:09', '2022-04-11 09:48:09'),
(62, 'default', 'added', 61, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 09:48:56', '2022-04-11 09:48:56'),
(63, 'default', 'added', 62, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 09:50:54', '2022-04-11 09:50:54'),
(64, 'default', 'added', 63, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 09:52:15', '2022-04-11 09:52:15'),
(65, 'default', 'added', 64, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 09:54:32', '2022-04-11 09:54:32'),
(66, 'default', 'added', 65, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 09:55:27', '2022-04-11 09:55:27'),
(67, 'default', 'added', 66, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 09:55:44', '2022-04-11 09:55:44'),
(68, 'default', 'added', 67, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 09:56:31', '2022-04-11 09:56:31'),
(69, 'default', 'added', 68, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 09:57:31', '2022-04-11 09:57:31'),
(70, 'default', 'added', 69, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 10:32:00', '2022-04-11 10:32:00'),
(71, 'default', 'added', 70, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 10:36:32', '2022-04-11 10:36:32'),
(72, 'default', 'added', 71, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 10:37:40', '2022-04-11 10:37:40'),
(73, 'default', 'added', 72, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":2000}}', '2022-04-11 10:41:34', '2022-04-11 10:41:34'),
(74, 'default', 'added', 73, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 10:42:53', '2022-04-11 10:42:53'),
(75, 'default', 'added', 74, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 10:47:00', '2022-04-11 10:47:00'),
(76, 'default', 'added', 75, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 10:47:21', '2022-04-11 10:47:21'),
(77, 'default', 'added', 76, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 10:54:35', '2022-04-11 10:54:35'),
(78, 'default', 'added', 77, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 10:56:50', '2022-04-11 10:56:50'),
(79, 'default', 'added', 78, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 10:59:12', '2022-04-11 10:59:12'),
(80, 'default', 'added', 79, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 11:01:01', '2022-04-11 11:01:01'),
(81, 'default', 'added', 80, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-11 11:01:10', '2022-04-11 11:01:10'),
(82, 'default', 'added', 81, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 11:01:40', '2022-04-11 11:01:40'),
(83, 'default', 'added', 82, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 11:09:11', '2022-04-11 11:09:11'),
(84, 'default', 'added', 83, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 11:10:12', '2022-04-11 11:10:12'),
(85, 'default', 'added', 84, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 11:10:48', '2022-04-11 11:10:48'),
(86, 'default', 'added', 85, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 11:20:52', '2022-04-11 11:20:52'),
(87, 'default', 'added', 86, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 11:22:26', '2022-04-11 11:22:26'),
(88, 'default', 'added', 87, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 11:23:52', '2022-04-11 11:23:52'),
(89, 'default', 'added', 88, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 11:27:55', '2022-04-11 11:27:55'),
(90, 'default', 'added', 2, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-04-11 11:29:21', '2022-04-11 11:29:21'),
(91, 'default', 'added', 89, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 11:29:36', '2022-04-11 11:29:36'),
(92, 'default', 'added', 90, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-11 11:31:20', '2022-04-11 11:31:20'),
(93, 'default', 'added', 91, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 11:32:56', '2022-04-11 11:32:56'),
(94, 'default', 'added', 3, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-04-11 11:34:34', '2022-04-11 11:34:34'),
(95, 'default', 'added', 92, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 11:34:37', '2022-04-11 11:34:37'),
(96, 'default', 'added', 4, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-04-11 11:36:19', '2022-04-11 11:36:19'),
(97, 'default', 'added', 93, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 11:36:22', '2022-04-11 11:36:22'),
(98, 'default', 'added', 5, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-04-11 11:38:36', '2022-04-11 11:38:36'),
(99, 'default', 'added', 94, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 11:38:38', '2022-04-11 11:38:38'),
(100, 'default', 'added', 6, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-04-11 11:41:20', '2022-04-11 11:41:20'),
(101, 'default', 'added', 95, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 11:41:22', '2022-04-11 11:41:22'),
(102, 'default', 'added', 96, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 11:56:59', '2022-04-11 11:56:59'),
(103, 'default', 'added', 97, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-11 11:59:47', '2022-04-11 11:59:47'),
(104, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-12 02:45:03', '2022-04-12 02:45:03'),
(105, 'default', 'added', 98, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-12 02:49:51', '2022-04-12 02:49:51'),
(106, 'default', 'added', 99, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-12 02:51:25', '2022-04-12 02:51:25'),
(107, 'default', 'added', 7, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-04-12 02:59:25', '2022-04-12 02:59:25'),
(108, 'default', 'added', 100, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"ordered\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-12 03:00:25', '2022-04-12 03:00:25'),
(109, 'default', 'added', 101, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-12 03:11:33', '2022-04-12 03:11:33'),
(110, 'default', 'added', 102, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-12 03:12:01', '2022-04-12 03:12:01'),
(111, 'default', 'added', 103, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-12 03:16:58', '2022-04-12 03:16:58'),
(112, 'default', 'added', 104, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-12 03:17:50', '2022-04-12 03:17:50'),
(113, 'default', 'added', 105, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":2000}}', '2022-04-12 03:18:10', '2022-04-12 03:18:10'),
(114, 'default', 'added', 106, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-12 03:29:37', '2022-04-12 03:29:37'),
(115, 'default', 'added', 107, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-12 03:31:13', '2022-04-12 03:31:13'),
(116, 'default', 'added', 108, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-12 03:36:08', '2022-04-12 03:36:08'),
(117, 'default', 'added', 109, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":2000}}', '2022-04-12 03:40:13', '2022-04-12 03:40:13'),
(118, 'default', 'added', 110, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-12 03:41:35', '2022-04-12 03:41:35'),
(119, 'default', 'added', 111, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-12 03:46:07', '2022-04-12 03:46:07'),
(120, 'default', 'added', 112, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-12 03:46:20', '2022-04-12 03:46:20'),
(121, 'default', 'added', 113, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-12 03:50:07', '2022-04-12 03:50:07'),
(122, 'default', 'added', 114, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-12 03:57:44', '2022-04-12 03:57:44'),
(123, 'default', 'added', 115, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-12 03:59:47', '2022-04-12 03:59:47'),
(124, 'default', 'added', 116, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-12 04:01:38', '2022-04-12 04:01:38'),
(125, 'default', 'added', 117, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-12 04:11:41', '2022-04-12 04:11:41'),
(126, 'default', 'added', 118, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-12 04:15:59', '2022-04-12 04:15:59'),
(127, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-13 04:30:26', '2022-04-13 04:30:26'),
(128, 'default', 'added', 119, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 04:30:41', '2022-04-13 04:30:41'),
(129, 'default', 'added', 120, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 04:30:51', '2022-04-13 04:30:51'),
(130, 'default', 'added', 121, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-13 04:30:58', '2022-04-13 04:30:58'),
(131, 'default', 'added', 122, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 04:56:09', '2022-04-13 04:56:09'),
(132, 'default', 'added', 123, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 04:56:30', '2022-04-13 04:56:30'),
(133, 'default', 'added', 124, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 04:57:44', '2022-04-13 04:57:44'),
(134, 'default', 'added', 125, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 04:58:18', '2022-04-13 04:58:18'),
(135, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-13 06:42:34', '2022-04-13 06:42:34'),
(136, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-13 06:44:20', '2022-04-13 06:44:20'),
(137, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-13 06:45:56', '2022-04-13 06:45:56'),
(138, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-13 06:48:54', '2022-04-13 06:48:54'),
(139, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-13 06:50:36', '2022-04-13 06:50:36'),
(140, 'default', 'added', 126, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 06:51:21', '2022-04-13 06:51:21'),
(141, 'default', 'added', 127, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 06:52:03', '2022-04-13 06:52:03'),
(142, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-13 06:53:58', '2022-04-13 06:53:58'),
(143, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-13 06:54:03', '2022-04-13 06:54:03'),
(144, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-13 06:55:47', '2022-04-13 06:55:47'),
(145, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-13 07:08:31', '2022-04-13 07:08:31'),
(146, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-13 07:08:45', '2022-04-13 07:08:45'),
(147, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-13 07:10:46', '2022-04-13 07:10:46'),
(148, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-13 07:41:29', '2022-04-13 07:41:29'),
(149, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-13 07:43:17', '2022-04-13 07:43:17'),
(150, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-13 08:04:59', '2022-04-13 08:04:59'),
(151, 'default', 'added', 128, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":2000}}', '2022-04-13 08:16:15', '2022-04-13 08:16:15'),
(152, 'default', 'added', 129, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 08:25:56', '2022-04-13 08:25:56'),
(153, 'default', 'added', 130, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 08:28:41', '2022-04-13 08:28:41'),
(154, 'default', 'added', 131, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 08:41:10', '2022-04-13 08:41:10'),
(155, 'default', 'added', 132, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":3000}}', '2022-04-13 08:42:35', '2022-04-13 08:42:35'),
(156, 'default', 'added', 133, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 08:47:29', '2022-04-13 08:47:29'),
(157, 'default', 'added', 134, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 08:48:16', '2022-04-13 08:48:16'),
(158, 'default', 'added', 135, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":2000}}', '2022-04-13 08:49:37', '2022-04-13 08:49:37'),
(159, 'default', 'added', 136, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 08:51:45', '2022-04-13 08:51:45'),
(160, 'default', 'added', 137, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":2000}}', '2022-04-13 09:00:51', '2022-04-13 09:00:51'),
(161, 'default', 'added', 138, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 09:03:12', '2022-04-13 09:03:12'),
(162, 'default', 'added', 139, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 09:19:37', '2022-04-13 09:19:37'),
(163, 'default', 'added', 140, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 09:23:57', '2022-04-13 09:23:57'),
(164, 'default', 'added', 141, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 09:25:49', '2022-04-13 09:25:49'),
(165, 'default', 'added', 142, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 09:27:18', '2022-04-13 09:27:18'),
(166, 'default', 'added', 143, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 09:28:13', '2022-04-13 09:28:13'),
(167, 'default', 'added', 144, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 09:30:33', '2022-04-13 09:30:33'),
(168, 'default', 'added', 145, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 09:30:45', '2022-04-13 09:30:45'),
(169, 'default', 'added', 146, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 09:32:07', '2022-04-13 09:32:07'),
(170, 'default', 'added', 147, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 09:33:01', '2022-04-13 09:33:01'),
(171, 'default', 'added', 148, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":2000}}', '2022-04-13 09:42:56', '2022-04-13 09:42:56'),
(172, 'default', 'added', 149, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 09:44:13', '2022-04-13 09:44:13'),
(173, 'default', 'added', 150, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 09:45:33', '2022-04-13 09:45:33'),
(174, 'default', 'added', 151, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 09:46:00', '2022-04-13 09:46:00'),
(175, 'default', 'added', 152, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 09:47:37', '2022-04-13 09:47:37'),
(176, 'default', 'added', 153, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 09:51:27', '2022-04-13 09:51:27'),
(177, 'default', 'added', 154, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 09:53:41', '2022-04-13 09:53:41'),
(178, 'default', 'added', 155, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 09:56:28', '2022-04-13 09:56:28'),
(179, 'default', 'added', 156, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 09:58:33', '2022-04-13 09:58:33'),
(180, 'default', 'added', 157, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 09:59:15', '2022-04-13 09:59:15'),
(181, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-13 10:31:26', '2022-04-13 10:31:26'),
(182, 'default', 'added', 158, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 10:31:35', '2022-04-13 10:31:35'),
(183, 'default', 'added', 159, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-13 10:37:34', '2022-04-13 10:37:34'),
(184, 'default', 'added', 160, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 10:37:46', '2022-04-13 10:37:46'),
(185, 'default', 'added', 161, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":1000}}', '2022-04-13 10:38:11', '2022-04-13 10:38:11'),
(186, 'default', 'added', 162, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 10:51:59', '2022-04-13 10:51:59'),
(187, 'default', 'added', 163, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 10:52:51', '2022-04-13 10:52:51'),
(188, 'default', 'added', 164, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 10:55:32', '2022-04-13 10:55:32'),
(189, 'default', 'added', 165, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 10:58:20', '2022-04-13 10:58:20'),
(190, 'default', 'added', 166, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:06:16', '2022-04-13 11:06:16'),
(191, 'default', 'added', 167, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:11:06', '2022-04-13 11:11:06'),
(192, 'default', 'added', 168, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:13:53', '2022-04-13 11:13:53'),
(193, 'default', 'added', 169, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:14:48', '2022-04-13 11:14:48'),
(194, 'default', 'added', 170, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:15:16', '2022-04-13 11:15:16'),
(195, 'default', 'added', 171, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:21:45', '2022-04-13 11:21:45'),
(196, 'default', 'added', 172, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:22:33', '2022-04-13 11:22:33'),
(197, 'default', 'added', 173, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:24:29', '2022-04-13 11:24:29'),
(198, 'default', 'added', 174, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:25:03', '2022-04-13 11:25:03'),
(199, 'default', 'added', 175, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:25:29', '2022-04-13 11:25:29'),
(200, 'default', 'added', 176, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:26:40', '2022-04-13 11:26:40'),
(201, 'default', 'added', 177, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:27:11', '2022-04-13 11:27:11'),
(202, 'default', 'added', 178, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:28:35', '2022-04-13 11:28:35'),
(203, 'default', 'added', 179, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:29:53', '2022-04-13 11:29:53'),
(204, 'default', 'added', 180, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:30:56', '2022-04-13 11:30:56'),
(205, 'default', 'added', 181, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:31:23', '2022-04-13 11:31:23'),
(206, 'default', 'added', 182, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:31:45', '2022-04-13 11:31:45'),
(207, 'default', 'added', 183, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:32:11', '2022-04-13 11:32:11'),
(208, 'default', 'added', 184, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:33:04', '2022-04-13 11:33:04'),
(209, 'default', 'added', 185, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:33:39', '2022-04-13 11:33:39'),
(210, 'default', 'added', 186, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:34:08', '2022-04-13 11:34:08'),
(211, 'default', 'added', 187, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:34:53', '2022-04-13 11:34:53'),
(212, 'default', 'added', 188, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:35:38', '2022-04-13 11:35:38'),
(213, 'default', 'added', 189, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:36:02', '2022-04-13 11:36:02'),
(214, 'default', 'added', 190, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:37:43', '2022-04-13 11:37:43'),
(215, 'default', 'added', 191, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:38:59', '2022-04-13 11:38:59'),
(216, 'default', 'added', 192, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:39:19', '2022-04-13 11:39:19'),
(217, 'default', 'added', 193, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:41:19', '2022-04-13 11:41:19'),
(218, 'default', 'added', 194, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:41:56', '2022-04-13 11:41:56'),
(219, 'default', 'added', 195, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:42:37', '2022-04-13 11:42:37'),
(220, 'default', 'added', 196, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:45:29', '2022-04-13 11:45:29'),
(221, 'default', 'added', 197, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:45:34', '2022-04-13 11:45:34'),
(222, 'default', 'added', 198, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:46:16', '2022-04-13 11:46:16'),
(223, 'default', 'added', 199, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:46:41', '2022-04-13 11:46:41'),
(224, 'default', 'added', 200, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:50:04', '2022-04-13 11:50:04'),
(225, 'default', 'added', 201, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:50:43', '2022-04-13 11:50:43'),
(226, 'default', 'added', 202, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:51:54', '2022-04-13 11:51:54'),
(227, 'default', 'added', 203, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:52:31', '2022-04-13 11:52:31'),
(228, 'default', 'added', 204, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":2000}}', '2022-04-13 11:53:22', '2022-04-13 11:53:22'),
(229, 'default', 'added', 205, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:53:47', '2022-04-13 11:53:47'),
(230, 'default', 'added', 206, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:55:21', '2022-04-13 11:55:21'),
(231, 'default', 'added', 207, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:55:54', '2022-04-13 11:55:54'),
(232, 'default', 'added', 208, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:56:41', '2022-04-13 11:56:41'),
(233, 'default', 'added', 209, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:57:07', '2022-04-13 11:57:07');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `business_id`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(234, 'default', 'added', 210, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:57:30', '2022-04-13 11:57:30'),
(235, 'default', 'added', 211, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:58:04', '2022-04-13 11:58:04'),
(236, 'default', 'added', 212, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 11:59:20', '2022-04-13 11:59:20'),
(237, 'default', 'added', 213, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:01:13', '2022-04-13 12:01:13'),
(238, 'default', 'added', 214, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:02:36', '2022-04-13 12:02:36'),
(239, 'default', 'added', 215, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:03:25', '2022-04-13 12:03:25'),
(240, 'default', 'added', 216, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:03:56', '2022-04-13 12:03:56'),
(241, 'default', 'added', 217, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:06:19', '2022-04-13 12:06:19'),
(242, 'default', 'added', 218, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:07:55', '2022-04-13 12:07:55'),
(243, 'default', 'added', 219, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:09:44', '2022-04-13 12:09:44'),
(244, 'default', 'added', 220, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:11:04', '2022-04-13 12:11:04'),
(245, 'default', 'added', 221, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:11:24', '2022-04-13 12:11:24'),
(246, 'default', 'added', 222, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:13:01', '2022-04-13 12:13:01'),
(247, 'default', 'added', 223, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:14:53', '2022-04-13 12:14:53'),
(248, 'default', 'added', 224, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:15:29', '2022-04-13 12:15:29'),
(249, 'default', 'added', 225, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:16:25', '2022-04-13 12:16:25'),
(250, 'default', 'added', 226, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:16:38', '2022-04-13 12:16:38'),
(251, 'default', 'added', 227, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:17:41', '2022-04-13 12:17:41'),
(252, 'default', 'added', 228, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:18:19', '2022-04-13 12:18:19'),
(253, 'default', 'added', 229, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:18:43', '2022-04-13 12:18:43'),
(254, 'default', 'added', 230, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:19:52', '2022-04-13 12:19:52'),
(255, 'default', 'added', 231, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:20:20', '2022-04-13 12:20:20'),
(256, 'default', 'added', 232, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:21:13', '2022-04-13 12:21:13'),
(257, 'default', 'added', 233, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:26:20', '2022-04-13 12:26:20'),
(258, 'default', 'added', 234, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:27:29', '2022-04-13 12:27:29'),
(259, 'default', 'added', 235, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:28:36', '2022-04-13 12:28:36'),
(260, 'default', 'added', 236, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:29:46', '2022-04-13 12:29:46'),
(261, 'default', 'added', 237, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:31:37', '2022-04-13 12:31:37'),
(262, 'default', 'added', 238, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:32:46', '2022-04-13 12:32:46'),
(263, 'default', 'added', 239, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:34:13', '2022-04-13 12:34:13'),
(264, 'default', 'added', 240, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:35:02', '2022-04-13 12:35:02'),
(265, 'default', 'added', 241, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:40:42', '2022-04-13 12:40:42'),
(266, 'default', 'added', 242, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:41:47', '2022-04-13 12:41:47'),
(267, 'default', 'added', 243, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:46:50', '2022-04-13 12:46:50'),
(268, 'default', 'added', 244, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:47:37', '2022-04-13 12:47:37'),
(269, 'default', 'added', 245, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:48:57', '2022-04-13 12:48:57'),
(270, 'default', 'added', 246, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:49:32', '2022-04-13 12:49:32'),
(271, 'default', 'added', 247, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:51:26', '2022-04-13 12:51:26'),
(272, 'default', 'added', 248, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:52:21', '2022-04-13 12:52:21'),
(273, 'default', 'added', 249, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:53:34', '2022-04-13 12:53:34'),
(274, 'default', 'added', 250, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:54:29', '2022-04-13 12:54:29'),
(275, 'default', 'added', 251, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:57:29', '2022-04-13 12:57:29'),
(276, 'default', 'added', 252, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:58:23', '2022-04-13 12:58:23'),
(277, 'default', 'added', 253, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:58:49', '2022-04-13 12:58:49'),
(278, 'default', 'added', 254, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:59:29', '2022-04-13 12:59:29'),
(279, 'default', 'added', 255, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 12:59:56', '2022-04-13 12:59:56'),
(280, 'default', 'added', 256, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:00:43', '2022-04-13 13:00:43'),
(281, 'default', 'added', 257, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:01:14', '2022-04-13 13:01:14'),
(282, 'default', 'added', 258, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:03:01', '2022-04-13 13:03:01'),
(283, 'default', 'added', 259, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":2000}}', '2022-04-13 13:04:00', '2022-04-13 13:04:00'),
(284, 'default', 'added', 260, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:04:58', '2022-04-13 13:04:58'),
(285, 'default', 'added', 261, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:06:58', '2022-04-13 13:06:58'),
(286, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-13 13:07:46', '2022-04-13 13:07:46'),
(287, 'default', 'added', 262, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:08:31', '2022-04-13 13:08:31'),
(288, 'default', 'added', 263, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:09:27', '2022-04-13 13:09:27'),
(289, 'default', 'added', 264, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:24:30', '2022-04-13 13:24:30'),
(290, 'default', 'added', 265, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:25:09', '2022-04-13 13:25:09'),
(291, 'default', 'added', 266, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:25:59', '2022-04-13 13:25:59'),
(292, 'default', 'added', 267, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:27:49', '2022-04-13 13:27:49'),
(293, 'default', 'added', 268, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:28:17', '2022-04-13 13:28:17'),
(294, 'default', 'added', 269, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:30:44', '2022-04-13 13:30:44'),
(295, 'default', 'added', 270, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:31:45', '2022-04-13 13:31:45'),
(296, 'default', 'added', 271, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:32:15', '2022-04-13 13:32:15'),
(297, 'default', 'added', 273, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 13:34:02', '2022-04-13 13:34:02'),
(298, 'default', 'added', 274, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:34:08', '2022-04-13 13:34:08'),
(299, 'default', 'added', 275, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:34:55', '2022-04-13 13:34:55'),
(300, 'default', 'added', 276, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:36:43', '2022-04-13 13:36:43'),
(301, 'default', 'added', 277, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:37:21', '2022-04-13 13:37:21'),
(302, 'default', 'added', 278, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:38:33', '2022-04-13 13:38:33'),
(303, 'default', 'added', 279, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:39:22', '2022-04-13 13:39:22'),
(304, 'default', 'added', 280, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:39:43', '2022-04-13 13:39:43'),
(305, 'default', 'added', 281, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:39:49', '2022-04-13 13:39:49'),
(306, 'default', 'added', 282, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:40:37', '2022-04-13 13:40:37'),
(307, 'default', 'added', 283, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":12.5}}', '2022-04-13 13:40:51', '2022-04-13 13:40:51'),
(308, 'default', 'added', 284, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 13:41:25', '2022-04-13 13:41:25'),
(309, 'default', 'added', 285, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:42:21', '2022-04-13 13:42:21'),
(310, 'default', 'added', 286, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:42:58', '2022-04-13 13:42:58'),
(311, 'default', 'added', 287, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:43:33', '2022-04-13 13:43:33'),
(312, 'default', 'added', 288, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:44:13', '2022-04-13 13:44:13'),
(313, 'default', 'added', 289, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:44:44', '2022-04-13 13:44:44'),
(314, 'default', 'added', 290, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:45:39', '2022-04-13 13:45:39'),
(315, 'default', 'added', 291, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:45:50', '2022-04-13 13:45:50'),
(316, 'default', 'added', 292, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:46:59', '2022-04-13 13:46:59'),
(317, 'default', 'added', 293, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:47:48', '2022-04-13 13:47:48'),
(318, 'default', 'added', 294, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:48:41', '2022-04-13 13:48:41'),
(319, 'default', 'added', 295, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:49:32', '2022-04-13 13:49:32'),
(320, 'default', 'added', 296, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:50:53', '2022-04-13 13:50:53'),
(321, 'default', 'added', 297, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:52:27', '2022-04-13 13:52:27'),
(322, 'default', 'added', 298, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:53:13', '2022-04-13 13:53:13'),
(323, 'default', 'added', 299, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:54:16', '2022-04-13 13:54:16'),
(324, 'default', 'added', 300, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:54:44', '2022-04-13 13:54:44'),
(325, 'default', 'added', 301, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:55:10', '2022-04-13 13:55:10'),
(326, 'default', 'added', 302, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:55:50', '2022-04-13 13:55:50'),
(327, 'default', 'added', 303, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:56:13', '2022-04-13 13:56:13'),
(328, 'default', 'added', 304, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:56:32', '2022-04-13 13:56:32'),
(329, 'default', 'added', 305, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:57:06', '2022-04-13 13:57:06'),
(330, 'default', 'added', 306, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:57:34', '2022-04-13 13:57:34'),
(331, 'default', 'added', 307, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:58:53', '2022-04-13 13:58:53'),
(332, 'default', 'added', 308, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:59:21', '2022-04-13 13:59:21'),
(333, 'default', 'added', 309, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 13:59:43', '2022-04-13 13:59:43'),
(334, 'default', 'added', 310, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:01:03', '2022-04-13 14:01:03'),
(335, 'default', 'added', 311, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:02:28', '2022-04-13 14:02:28'),
(336, 'default', 'added', 312, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:03:39', '2022-04-13 14:03:39'),
(337, 'default', 'added', 313, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:04:54', '2022-04-13 14:04:54'),
(338, 'default', 'added', 314, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:07:44', '2022-04-13 14:07:44'),
(339, 'default', 'added', 315, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:10:09', '2022-04-13 14:10:09'),
(340, 'default', 'added', 316, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:10:34', '2022-04-13 14:10:34'),
(341, 'default', 'added', 317, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:12:40', '2022-04-13 14:12:40'),
(342, 'default', 'added', 318, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:13:11', '2022-04-13 14:13:11'),
(343, 'default', 'added', 319, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:13:57', '2022-04-13 14:13:57'),
(344, 'default', 'added', 320, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:15:03', '2022-04-13 14:15:03'),
(345, 'default', 'added', 321, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:15:36', '2022-04-13 14:15:36'),
(346, 'default', 'added', 322, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:16:45', '2022-04-13 14:16:45'),
(347, 'default', 'added', 323, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:17:23', '2022-04-13 14:17:23'),
(348, 'default', 'added', 324, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:18:04', '2022-04-13 14:18:04'),
(349, 'default', 'added', 325, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 14:18:32', '2022-04-13 14:18:32'),
(350, 'default', 'added', 326, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:20:29', '2022-04-13 14:20:29'),
(351, 'default', 'added', 327, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:20:58', '2022-04-13 14:20:58'),
(352, 'default', 'added', 328, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:23:23', '2022-04-13 14:23:23'),
(353, 'default', 'added', 329, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:25:21', '2022-04-13 14:25:21'),
(354, 'default', 'added', 330, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:27:31', '2022-04-13 14:27:31'),
(355, 'default', 'added', 331, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:27:46', '2022-04-13 14:27:46'),
(356, 'default', 'added', 332, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 14:29:22', '2022-04-13 14:29:22'),
(357, 'default', 'added', 333, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 14:30:58', '2022-04-13 14:30:58'),
(358, 'default', 'added', 334, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:33:08', '2022-04-13 14:33:08'),
(359, 'default', 'added', 335, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:34:17', '2022-04-13 14:34:17'),
(360, 'default', 'added', 336, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:36:07', '2022-04-13 14:36:07'),
(361, 'default', 'added', 337, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:36:49', '2022-04-13 14:36:49'),
(362, 'default', 'added', 338, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:37:11', '2022-04-13 14:37:11'),
(363, 'default', 'added', 339, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 14:40:26', '2022-04-13 14:40:26'),
(364, 'default', 'added', 340, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 14:47:36', '2022-04-13 14:47:36'),
(365, 'default', 'added', 341, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 14:48:44', '2022-04-13 14:48:44'),
(366, 'default', 'added', 342, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 14:49:11', '2022-04-13 14:49:11'),
(367, 'default', 'added', 343, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 14:49:56', '2022-04-13 14:49:56'),
(368, 'default', 'added', 344, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 14:51:26', '2022-04-13 14:51:26'),
(369, 'default', 'added', 345, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 14:52:06', '2022-04-13 14:52:06'),
(370, 'default', 'added', 346, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 14:53:01', '2022-04-13 14:53:01'),
(371, 'default', 'added', 347, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 14:53:48', '2022-04-13 14:53:48'),
(372, 'default', 'added', 348, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 14:55:30', '2022-04-13 14:55:30'),
(373, 'default', 'added', 349, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 14:56:39', '2022-04-13 14:56:39'),
(374, 'default', 'added', 350, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 14:58:12', '2022-04-13 14:58:12'),
(375, 'default', 'added', 351, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 15:00:01', '2022-04-13 15:00:01'),
(376, 'default', 'added', 352, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 15:02:57', '2022-04-13 15:02:57'),
(377, 'default', 'added', 353, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 15:04:04', '2022-04-13 15:04:04'),
(378, 'default', 'added', 354, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 15:05:19', '2022-04-13 15:05:19'),
(379, 'default', 'added', 355, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 15:08:30', '2022-04-13 15:08:30'),
(380, 'default', 'added', 356, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 15:09:04', '2022-04-13 15:09:04'),
(381, 'default', 'added', 357, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 15:13:59', '2022-04-13 15:13:59'),
(382, 'default', 'added', 358, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 15:14:52', '2022-04-13 15:14:52'),
(383, 'default', 'added', 359, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 15:25:57', '2022-04-13 15:25:57'),
(384, 'default', 'added', 360, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 15:36:15', '2022-04-13 15:36:15'),
(385, 'default', 'added', 361, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 15:38:12', '2022-04-13 15:38:12'),
(386, 'default', 'added', 362, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 15:40:00', '2022-04-13 15:40:00'),
(387, 'default', 'added', 363, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 15:42:33', '2022-04-13 15:42:33'),
(388, 'default', 'added', 364, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 15:43:31', '2022-04-13 15:43:31'),
(389, 'default', 'added', 365, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 15:46:00', '2022-04-13 15:46:00'),
(390, 'default', 'added', 366, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 15:50:17', '2022-04-13 15:50:17'),
(391, 'default', 'added', 367, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-13 15:57:41', '2022-04-13 15:57:41'),
(392, 'default', 'added', 368, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 15:58:29', '2022-04-13 15:58:29'),
(393, 'default', 'added', 369, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 15:59:58', '2022-04-13 15:59:58'),
(394, 'default', 'added', 370, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 16:00:45', '2022-04-13 16:00:45'),
(395, 'default', 'added', 371, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-13 16:03:42', '2022-04-13 16:03:42'),
(396, 'default', 'added', 372, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-13 16:06:39', '2022-04-13 16:06:39'),
(397, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-17 04:09:53', '2022-04-17 04:09:53'),
(398, 'default', 'added', 373, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 04:11:18', '2022-04-17 04:11:18'),
(399, 'default', 'added', 374, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 05:02:11', '2022-04-17 05:02:11'),
(400, 'default', 'added', 375, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 05:05:18', '2022-04-17 05:05:18'),
(401, 'default', 'added', 376, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 05:05:36', '2022-04-17 05:05:36'),
(402, 'default', 'added', 377, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 05:06:13', '2022-04-17 05:06:13'),
(403, 'default', 'added', 378, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 05:25:51', '2022-04-17 05:25:51'),
(404, 'default', 'added', 379, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 05:30:05', '2022-04-17 05:30:05'),
(405, 'default', 'added', 380, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 07:08:32', '2022-04-17 07:08:32'),
(406, 'default', 'added', 381, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 07:10:34', '2022-04-17 07:10:34'),
(407, 'default', 'added', 382, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 07:19:49', '2022-04-17 07:19:49'),
(408, 'default', 'added', 383, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 07:20:30', '2022-04-17 07:20:30'),
(409, 'default', 'added', 384, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 07:24:53', '2022-04-17 07:24:53'),
(410, 'default', 'added', 385, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 07:26:55', '2022-04-17 07:26:55'),
(411, 'default', 'added', 386, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 07:54:24', '2022-04-17 07:54:24'),
(412, 'default', 'added', 387, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 07:57:43', '2022-04-17 07:57:43'),
(413, 'default', 'added', 388, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 08:07:04', '2022-04-17 08:07:04'),
(414, 'default', 'added', 389, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 08:09:20', '2022-04-17 08:09:20'),
(415, 'default', 'added', 390, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 08:10:58', '2022-04-17 08:10:58'),
(416, 'default', 'added', 391, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 08:11:45', '2022-04-17 08:11:45'),
(417, 'default', 'added', 392, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 08:13:46', '2022-04-17 08:13:46'),
(418, 'default', 'added', 393, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 08:24:16', '2022-04-17 08:24:16'),
(419, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-17 08:26:36', '2022-04-17 08:26:36'),
(420, 'default', 'added', 394, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 08:26:53', '2022-04-17 08:26:53'),
(421, 'default', 'added', 395, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 08:28:24', '2022-04-17 08:28:24'),
(422, 'default', 'added', 396, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1012.5}}', '2022-04-17 08:41:17', '2022-04-17 08:41:17'),
(423, 'default', 'added', 397, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1012.5}}', '2022-04-17 08:43:03', '2022-04-17 08:43:03'),
(424, 'default', 'added', 398, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 08:46:30', '2022-04-17 08:46:30'),
(425, 'default', 'added', 399, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 08:47:22', '2022-04-17 08:47:22'),
(426, 'default', 'added', 400, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 08:47:59', '2022-04-17 08:47:59'),
(427, 'default', 'added', 401, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":12.5}}', '2022-04-17 08:49:43', '2022-04-17 08:49:43'),
(428, 'default', 'added', 402, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 08:51:30', '2022-04-17 08:51:30'),
(429, 'default', 'added', 403, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 08:53:51', '2022-04-17 08:53:51'),
(430, 'default', 'added', 404, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 08:54:38', '2022-04-17 08:54:38'),
(431, 'default', 'added', 405, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 08:58:16', '2022-04-17 08:58:16'),
(432, 'default', 'added', 406, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 09:00:32', '2022-04-17 09:00:32'),
(433, 'default', 'added', 407, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 09:01:31', '2022-04-17 09:01:31'),
(434, 'default', 'added', 408, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 09:02:01', '2022-04-17 09:02:01'),
(435, 'default', 'added', 409, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 09:03:53', '2022-04-17 09:03:53'),
(436, 'default', 'added', 410, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 09:06:45', '2022-04-17 09:06:45'),
(437, 'default', 'added', 411, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 09:08:01', '2022-04-17 09:08:01'),
(438, 'default', 'added', 412, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 09:08:27', '2022-04-17 09:08:27'),
(439, 'default', 'added', 413, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 09:09:00', '2022-04-17 09:09:00'),
(440, 'default', 'added', 414, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1012.5}}', '2022-04-17 09:10:34', '2022-04-17 09:10:34'),
(441, 'default', 'added', 415, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 09:14:17', '2022-04-17 09:14:17'),
(442, 'default', 'added', 416, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 09:24:08', '2022-04-17 09:24:08'),
(443, 'default', 'added', 417, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 09:25:53', '2022-04-17 09:25:53'),
(444, 'default', 'added', 418, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-17 09:29:47', '2022-04-17 09:29:47'),
(445, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-18 02:41:31', '2022-04-18 02:41:31'),
(446, 'default', 'added', 419, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-18 02:42:48', '2022-04-18 02:42:48'),
(447, 'default', 'added', 420, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-18 02:45:08', '2022-04-18 02:45:08'),
(448, 'default', 'added', 421, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-18 02:45:35', '2022-04-18 02:45:35'),
(449, 'default', 'added', 422, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-18 02:45:42', '2022-04-18 02:45:42'),
(450, 'default', 'added', 423, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-18 02:46:04', '2022-04-18 02:46:04'),
(451, 'default', 'added', 424, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-18 02:47:45', '2022-04-18 02:47:45'),
(452, 'default', 'added', 425, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-18 02:48:15', '2022-04-18 02:48:15'),
(453, 'default', 'added', 426, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1000}}', '2022-04-18 02:48:52', '2022-04-18 02:48:52'),
(454, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-18 05:10:17', '2022-04-18 05:10:17'),
(455, 'default', 'added', 427, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1012.5}}', '2022-04-18 05:11:58', '2022-04-18 05:11:58');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `business_id`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(456, 'default', 'added', 428, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1012.5}}', '2022-04-18 05:12:50', '2022-04-18 05:12:50'),
(457, 'default', 'added', 429, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":12.5}}', '2022-04-18 05:13:21', '2022-04-18 05:13:21'),
(458, 'default', 'added', 430, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":-87.5}}', '2022-04-18 05:13:43', '2022-04-18 05:13:43'),
(459, 'default', 'added', 8, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-04-18 05:14:53', '2022-04-18 05:14:53'),
(460, 'default', 'added', 431, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":12.5}}', '2022-04-18 05:15:01', '2022-04-18 05:15:01'),
(461, 'default', 'added', 432, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":12.5}}', '2022-04-18 05:16:11', '2022-04-18 05:16:11'),
(462, 'default', 'added', 433, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":912.5}}', '2022-04-18 05:16:38', '2022-04-18 05:16:38'),
(463, 'default', 'added', 434, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1200}}', '2022-04-18 05:25:50', '2022-04-18 05:25:50'),
(464, 'default', 'added', 435, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1200}}', '2022-04-18 05:27:45', '2022-04-18 05:27:45'),
(465, 'default', 'added', 9, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-04-18 05:28:50', '2022-04-18 05:28:50'),
(466, 'default', 'added', 436, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-18 05:28:56', '2022-04-18 05:28:56'),
(467, 'default', 'added', 437, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-18 05:31:55', '2022-04-18 05:31:55'),
(468, 'default', 'added', 438, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1100}}', '2022-04-18 05:32:38', '2022-04-18 05:32:38'),
(469, 'default', 'added', 10, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-04-18 06:41:57', '2022-04-18 06:41:57'),
(470, 'default', 'added', 439, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"ordered\",\"payment_status\":\"paid\",\"final_total\":1662.5}}', '2022-04-18 06:42:39', '2022-04-18 06:42:39'),
(471, 'default', 'added', 440, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-18 06:49:36', '2022-04-18 06:49:36'),
(472, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-18 06:50:08', '2022-04-18 06:50:08'),
(473, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-18 07:05:52', '2022-04-18 07:05:52'),
(474, 'default', 'added', 441, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2000}}', '2022-04-18 07:06:19', '2022-04-18 07:06:19'),
(475, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-18 07:07:42', '2022-04-18 07:07:42'),
(476, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-18 08:52:06', '2022-04-18 08:52:06'),
(477, 'default', 'added', 442, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1012.5}}', '2022-04-18 08:52:24', '2022-04-18 08:52:24'),
(478, 'default', 'added', 443, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1012.5}}', '2022-04-18 08:56:28', '2022-04-18 08:56:28'),
(479, 'default', 'added', 444, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1012.5}}', '2022-04-18 09:30:27', '2022-04-18 09:30:27'),
(480, 'default', 'edited', 444, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"ordered\",\"payment_status\":\"paid\",\"final_total\":1362.5},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1012.5000\"}}', '2022-04-18 13:43:04', '2022-04-18 13:43:04'),
(481, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-19 08:53:09', '2022-04-19 08:53:09'),
(482, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-19 09:35:19', '2022-04-19 09:35:19'),
(483, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-27 05:58:58', '2022-04-27 05:58:58'),
(484, 'default', 'added', 445, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":1012.5}}', '2022-04-27 05:59:25', '2022-04-27 05:59:25'),
(485, 'default', 'added', 446, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1012.5}}', '2022-04-27 05:59:50', '2022-04-27 05:59:50'),
(486, 'default', 'added', 447, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":12.5}}', '2022-04-27 06:04:20', '2022-04-27 06:04:20'),
(487, 'default', 'added', 11, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-04-27 07:32:37', '2022-04-27 07:32:37'),
(488, 'default', 'added', 452, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"shipping_status\":\"shipped\",\"final_total\":30300}}', '2022-04-27 07:35:55', '2022-04-27 07:35:55'),
(489, 'default', 'added', 453, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":25012.5}}', '2022-04-27 07:37:08', '2022-04-27 07:37:08'),
(490, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-27 09:56:28', '2022-04-27 09:56:28'),
(491, 'default', 'sell_deleted', 437, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":437,\"invoice_no\":\"0075\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1000.0000\"}}', '2022-04-27 10:02:08', '2022-04-27 10:02:08'),
(492, 'default', 'sell_deleted', 436, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":436,\"invoice_no\":\"0074\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1000.0000\"}}', '2022-04-27 10:02:11', '2022-04-27 10:02:11'),
(493, 'default', 'sell_deleted', 435, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":435,\"invoice_no\":\"0073\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', '2022-04-27 10:02:14', '2022-04-27 10:02:14'),
(494, 'default', 'sell_deleted', 434, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":434,\"invoice_no\":\"0072\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1200.0000\"}}', '2022-04-27 10:02:19', '2022-04-27 10:02:19'),
(495, 'default', 'sell_deleted', 433, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":433,\"invoice_no\":\"0071\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"912.5000\"}}', '2022-04-27 10:02:23', '2022-04-27 10:02:23'),
(496, 'default', 'sell_deleted', 432, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":432,\"invoice_no\":\"0070\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"12.5000\"}}', '2022-04-27 10:02:25', '2022-04-27 10:02:25'),
(497, 'default', 'sell_deleted', 431, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":431,\"invoice_no\":\"0069\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"12.5000\"}}', '2022-04-27 10:02:27', '2022-04-27 10:02:27'),
(498, 'default', 'sell_deleted', 430, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":430,\"invoice_no\":\"0068\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"-87.5000\"}}', '2022-04-27 10:02:29', '2022-04-27 10:02:29'),
(499, 'default', 'sell_deleted', 429, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":429,\"invoice_no\":\"0067\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"12.5000\"}}', '2022-04-27 10:02:32', '2022-04-27 10:02:32'),
(500, 'default', 'sell_deleted', 428, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":428,\"invoice_no\":\"0066\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1012.5000\"}}', '2022-04-27 10:02:35', '2022-04-27 10:02:35'),
(501, 'default', 'sell_deleted', 427, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":427,\"invoice_no\":\"0065\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1012.5000\"}}', '2022-04-27 10:02:37', '2022-04-27 10:02:37'),
(502, 'default', 'sell_deleted', 418, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":418,\"invoice_no\":\"0064\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1000.0000\"}}', '2022-04-27 10:02:39', '2022-04-27 10:02:39'),
(503, 'default', 'sell_deleted', 417, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":417,\"invoice_no\":\"0063\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1000.0000\"}}', '2022-04-27 10:02:41', '2022-04-27 10:02:41'),
(504, 'default', 'sell_deleted', 416, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":416,\"invoice_no\":\"0062\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1000.0000\"}}', '2022-04-27 10:02:43', '2022-04-27 10:02:43'),
(505, 'default', 'sell_deleted', 415, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":415,\"invoice_no\":\"0061\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1000.0000\"}}', '2022-04-27 10:02:45', '2022-04-27 10:02:45'),
(506, 'default', 'sell_deleted', 414, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":414,\"invoice_no\":\"0060\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1012.5000\"}}', '2022-04-27 10:02:47', '2022-04-27 10:02:47'),
(507, 'default', 'sell_deleted', 413, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":413,\"invoice_no\":\"0059\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1000.0000\"}}', '2022-04-27 10:02:49', '2022-04-27 10:02:49'),
(508, 'default', 'sell_deleted', 420, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":420,\"invoice_no\":\"2022\\/0354\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"1000.0000\"}}', '2022-04-27 10:03:13', '2022-04-27 10:03:13'),
(509, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-27 10:04:11', '2022-04-27 10:04:11'),
(510, 'default', 'sell_deleted', 412, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":412,\"invoice_no\":\"0058\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1000.0000\"}}', '2022-04-27 10:05:19', '2022-04-27 10:05:19'),
(511, 'default', 'sell_deleted', 411, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":411,\"invoice_no\":\"0057\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1000.0000\"}}', '2022-04-27 10:05:21', '2022-04-27 10:05:21'),
(512, 'default', 'sell_deleted', 410, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":410,\"invoice_no\":\"0056\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1000.0000\"}}', '2022-04-27 10:05:23', '2022-04-27 10:05:23'),
(513, 'default', 'sell_deleted', 409, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":409,\"invoice_no\":\"0055\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1000.0000\"}}', '2022-04-27 10:05:27', '2022-04-27 10:05:27'),
(514, 'default', 'sell_deleted', 408, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":408,\"invoice_no\":\"0054\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1000.0000\"}}', '2022-04-27 10:05:30', '2022-04-27 10:05:30'),
(515, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-30 05:17:03', '2022-04-30 05:17:03'),
(516, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-30 05:42:20', '2022-04-30 05:42:20'),
(517, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-05-01 02:02:43', '2022-05-01 02:02:43'),
(518, 'default', 'added', 455, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":24000}}', '2022-05-01 02:05:50', '2022-05-01 02:05:50'),
(519, 'default', 'added', 456, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":24000}}', '2022-05-01 02:07:48', '2022-05-01 02:07:48'),
(520, 'default', 'added', 457, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":24000}}', '2022-05-01 03:14:40', '2022-05-01 03:14:40'),
(521, 'default', 'added', 458, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":6500}}', '2022-05-01 03:16:43', '2022-05-01 03:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_continuous` tinyint(1) NOT NULL DEFAULT '0',
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `description`, `width`, `height`, `paper_width`, `paper_height`, `top_margin`, `left_margin`, `row_distance`, `col_distance`, `stickers_in_one_row`, `is_default`, `is_continuous`, `stickers_in_one_sheet`, `business_id`, `created_at`, `updated_at`) VALUES
(1, '20 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 4\" x 1\", Labels per sheet: 20', 4.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.1250, 0.0000, 0.1875, 2, 0, 0, 20, NULL, '2017-12-18 00:43:44', '2017-12-18 00:43:44'),
(2, '30 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2.625\" x 1\", Labels per sheet: 30', 2.6250, 1.0000, 8.5000, 11.0000, 0.5000, 0.1880, 0.0000, 0.1250, 3, 0, 0, 30, NULL, '2017-12-18 00:34:39', '2017-12-18 00:40:40'),
(3, '32 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1.25\", Labels per sheet: 32', 2.0000, 1.2500, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 32, NULL, '2017-12-18 00:25:40', '2017-12-18 00:25:40'),
(4, '40 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1\", Labels per sheet: 40', 2.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 40, NULL, '2017-12-18 00:28:40', '2017-12-18 00:28:40'),
(5, '50 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 1.5\" x 1\", Labels per sheet: 50', 1.5000, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.0000, 5, 0, 0, 50, NULL, '2017-12-18 00:21:10', '2017-12-18 00:21:10'),
(6, 'Continuous Rolls - 31.75mm x 25.4mm', 'Label Size: 31.75mm x 25.4mm, Gap: 3.18mm', 1.2500, 1.0000, 1.2500, 0.0000, 0.1250, 0.0000, 0.1250, 0.0000, 1, 0, 1, NULL, NULL, '2017-12-18 00:21:10', '2017-12-18 00:21:10');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `waiter_id` int(10) UNSIGNED DEFAULT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `correspondent_id` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `booking_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `business_id`, `name`, `description`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Asus', NULL, 1, NULL, '2022-04-27 06:23:05', '2022-04-27 06:23:05'),
(2, 1, 'MSI', NULL, 1, NULL, '2022-04-27 06:23:10', '2022-04-27 06:23:10'),
(3, 1, 'Gigabyte', NULL, 1, NULL, '2022-04-27 06:23:19', '2022-04-27 06:23:19'),
(4, 1, 'ECS', NULL, 1, NULL, '2022-04-27 06:23:25', '2022-04-27 06:23:25'),
(5, 1, 'Intel', NULL, 1, NULL, '2022-04-27 06:23:34', '2022-04-27 06:23:34'),
(6, 1, 'AMD', NULL, 1, NULL, '2022-04-27 06:23:39', '2022-04-27 06:23:39'),
(7, 1, 'Foxconn', NULL, 1, NULL, '2022-04-27 06:23:46', '2022-04-27 06:23:46'),
(8, 1, 'Palit', NULL, 1, NULL, '2022-04-27 06:24:04', '2022-04-27 06:24:04'),
(9, 1, 'Antec', NULL, 1, NULL, '2022-04-28 18:27:14', '2022-04-28 18:27:14'),
(10, 1, 'Corsair', NULL, 1, NULL, '2022-04-28 18:27:22', '2022-04-28 18:27:22'),
(11, 1, 'Samsung', NULL, 1, NULL, '2022-04-28 18:27:30', '2022-04-28 18:27:30'),
(12, 1, 'Segate', NULL, 1, NULL, '2022-04-28 18:27:39', '2022-04-28 18:27:39'),
(13, 1, 'Western Digital', NULL, 1, NULL, '2022-04-28 18:27:49', '2022-04-28 18:27:49'),
(14, 1, 'Biostar', NULL, 1, NULL, '2022-04-28 18:28:09', '2022-04-28 18:28:09'),
(15, 1, 'Logitech', NULL, 1, NULL, '2022-04-28 18:28:25', '2022-04-28 18:28:25'),
(16, 1, 'Razor', NULL, 1, NULL, '2022-04-28 18:28:35', '2022-04-28 18:28:35'),
(17, 1, 'Marvo', NULL, 1, NULL, '2022-04-28 18:28:42', '2022-04-28 18:28:42'),
(18, 1, 'Zotac', NULL, 1, NULL, '2022-04-28 18:28:50', '2022-04-28 18:28:50');

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_label_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_label_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_sales_tax` int(10) UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT '0.00',
  `owner_id` int(10) UNSIGNED NOT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint(4) NOT NULL DEFAULT '1',
  `accounting_method` enum('fifo','lifo','avco') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'includes',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `expiry_type` enum('add_expiry','add_manufacturing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int(11) NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT '1',
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int(10) UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `transaction_edit_days` int(10) UNSIGNED NOT NULL DEFAULT '30',
  `stock_expiry_alert_days` int(10) UNSIGNED NOT NULL DEFAULT '30',
  `keyboard_shortcuts` text COLLATE utf8mb4_unicode_ci,
  `pos_settings` text COLLATE utf8mb4_unicode_ci,
  `weighing_scale_setting` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'used to store the configuration of weighing scale',
  `enable_brand` tinyint(1) NOT NULL DEFAULT '1',
  `enable_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT '1',
  `enable_purchase_status` tinyint(1) DEFAULT '1',
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT '0',
  `default_unit` int(11) DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT '0',
  `enable_racks` tinyint(1) NOT NULL DEFAULT '0',
  `enable_row` tinyint(1) NOT NULL DEFAULT '0',
  `enable_position` tinyint(1) NOT NULL DEFAULT '0',
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT '1',
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT '1',
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT '1',
  `currency_symbol_placement` enum('before','after') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'before',
  `enabled_modules` text COLLATE utf8mb4_unicode_ci,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '24',
  `ref_no_prefixes` text COLLATE utf8mb4_unicode_ci,
  `theme_color` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text COLLATE utf8mb4_unicode_ci,
  `sms_settings` text COLLATE utf8mb4_unicode_ci,
  `custom_labels` text COLLATE utf8mb4_unicode_ci,
  `common_settings` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `currency_id`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `code_label_1`, `code_1`, `code_label_2`, `code_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `weighing_scale_setting`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_sub_units`, `enable_racks`, `enable_row`, `enable_position`, `enable_editing_product_from_purchase`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `ref_no_prefixes`, `theme_color`, `created_by`, `enable_rp`, `rp_name`, `amount_for_unit_rp`, `min_order_total_for_rp`, `max_rp_per_order`, `redeem_amount_per_unit_rp`, `min_order_total_for_redeem`, `min_redeem_point`, `max_redeem_point`, `rp_expiry_period`, `rp_expiry_type`, `email_settings`, `sms_settings`, `custom_labels`, `common_settings`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'SHALOM TEK', 111, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 1, 'Asia/Colombo', 1, 'fifo', '0.00', 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, '1.000', 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"amount_rounding_method\":null,\"cmmsn_calculation_type\":\"invoice_value\",\"razor_pay_key_id\":null,\"razor_pay_key_secret\":null,\"stripe_public_key\":null,\"stripe_secret_key\":null,\"cash_denominations\":null,\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 0, NULL, 1, 0, 'before', '[\"add_sale\",\"pos_sale\",\"stock_adjustment\",\"expenses\",\"types_of_service\"]', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"purchase_return\":null,\"purchase_order\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":null,\"sales_order\":null}', 'blue', NULL, 0, NULL, '1.0000', '1.0000', NULL, '1.0000', '1.0000', NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"sms_service\":\"other\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null,\"custom_pay_4\":null,\"custom_pay_5\":null,\"custom_pay_6\":null,\"custom_pay_7\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase_shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null}}', '{\"enable_product_warranty\":\"1\",\"default_credit_limit\":null,\"default_datatable_page_entries\":\"25\"}', 1, '2022-03-19 04:38:49', '2022-05-01 02:13:10');

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

CREATE TABLE `business_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_scheme_id` int(10) UNSIGNED NOT NULL,
  `invoice_layout_id` int(10) UNSIGNED NOT NULL,
  `sale_invoice_layout_id` int(11) DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT '1',
  `receipt_printer_type` enum('browser','printer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'browser',
  `printer_id` int(11) DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_products` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `default_payment_accounts` text COLLATE utf8mb4_unicode_ci,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `location_id`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `invoice_layout_id`, `sale_invoice_layout_id`, `selling_price_group_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `featured_products`, `is_active`, `default_payment_accounts`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'BL0001', 'SHALOM TEK', 'No 12', 'Sri Lanka', 'Libray Road', 'Badulla', '90000', 1, 1, 1, NULL, 1, 'browser', NULL, '+94713899599', NULL, NULL, 'www.shalomtek.lk', NULL, 1, '{\"cash\":{\"is_enabled\":\"1\"},\"card\":{\"is_enabled\":\"1\"},\"cheque\":{\"is_enabled\":\"1\"},\"bank_transfer\":{\"is_enabled\":\"1\"},\"other\":{\"is_enabled\":\"1\"},\"custom_pay_1\":{\"is_enabled\":\"1\"},\"custom_pay_2\":{\"is_enabled\":\"1\"},\"custom_pay_3\":{\"is_enabled\":\"1\"},\"custom_pay_4\":{\"is_enabled\":\"1\"},\"custom_pay_5\":{\"is_enabled\":\"1\"},\"custom_pay_6\":{\"is_enabled\":\"1\"},\"custom_pay_7\":{\"is_enabled\":\"1\"}}', NULL, NULL, NULL, NULL, NULL, '2022-03-19 04:38:49', '2022-04-11 09:54:20');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('close','open') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `total_card_slips` int(11) NOT NULL DEFAULT '0',
  `total_cheques` int(11) NOT NULL DEFAULT '0',
  `denominations` text COLLATE utf8mb4_unicode_ci,
  `closing_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `business_id`, `location_id`, `user_id`, `status`, `closed_at`, `closing_amount`, `total_card_slips`, `total_cheques`, `denominations`, `closing_note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'close', '2022-03-19 10:18:15', '1000.0000', 0, 0, NULL, NULL, '2022-03-19 04:47:00', '2022-03-19 04:48:15'),
(2, 1, 1, 1, 'close', '2022-03-19 10:20:35', '0.0000', 0, 0, NULL, NULL, '2022-03-19 04:50:00', '2022-03-19 04:50:35'),
(3, 1, 1, 1, 'close', '2022-03-19 10:23:34', '0.0000', 0, 0, NULL, NULL, '2022-03-19 04:53:00', '2022-03-19 04:53:34'),
(4, 1, 1, 1, 'close', '2022-03-19 10:27:42', '0.0000', 0, 0, NULL, NULL, '2022-03-19 04:55:00', '2022-03-19 04:57:42'),
(5, 1, 1, 1, 'close', '2022-03-19 10:29:11', '0.0000', 0, 0, NULL, NULL, '2022-03-19 04:58:00', '2022-03-19 04:59:11'),
(6, 1, 1, 1, 'close', '2022-04-18 12:37:34', '75100.0000', 0, 0, NULL, NULL, '2022-03-19 04:59:00', '2022-04-18 07:07:34'),
(7, 1, 1, 1, 'close', '2022-04-27 15:35:51', '30425.0000', 0, 0, NULL, NULL, '2022-04-18 08:52:00', '2022-04-27 10:05:51'),
(8, 1, 1, 1, 'open', NULL, '0.0000', 0, 0, NULL, NULL, '2022-04-30 05:53:00', '2022-04-30 05:53:04');

-- --------------------------------------------------------

--
-- Table structure for table `cash_register_transactions`
--

CREATE TABLE `cash_register_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_register_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `pay_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_register_transactions`
--

INSERT INTO `cash_register_transactions` (`id`, `cash_register_id`, `amount`, `pay_method`, `type`, `transaction_type`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 1, '1000.0000', 'cash', 'credit', 'sell', 2, '2022-03-19 04:47:51', '2022-03-19 04:47:51'),
(2, 6, '1000.0000', 'cash', 'credit', 'sell', 3, '2022-03-19 05:00:03', '2022-03-19 05:00:03'),
(3, 6, '2000.0000', 'cash', 'credit', 'sell', 4, '2022-03-19 05:17:47', '2022-03-19 05:17:47'),
(4, 6, '1000.0000', 'cash', 'credit', 'sell', 5, '2022-03-19 05:22:14', '2022-03-19 05:22:14'),
(5, 6, '1000.0000', 'cash', 'credit', 'sell', 6, '2022-03-19 05:24:51', '2022-03-19 05:24:51'),
(6, 6, '1000.0000', 'cash', 'credit', 'sell', 7, '2022-03-19 05:26:44', '2022-03-19 05:26:44'),
(7, 6, '1000.0000', 'cash', 'credit', 'sell', 8, '2022-03-19 05:27:33', '2022-03-19 05:27:33'),
(8, 6, '1000.0000', 'cash', 'credit', 'sell', 45, '2022-04-11 09:03:40', '2022-04-11 09:03:40'),
(9, 6, '0.0000', 'cash', 'credit', 'sell', 45, '2022-04-11 09:03:40', '2022-04-11 09:03:40'),
(10, 6, '1000.0000', 'cash', 'credit', 'sell', 46, '2022-04-11 09:10:33', '2022-04-11 09:10:33'),
(11, 6, '0.0000', 'cash', 'credit', 'sell', 46, '2022-04-11 09:10:33', '2022-04-11 09:10:33'),
(12, 6, '1000.0000', 'cash', 'credit', 'sell', 48, '2022-04-11 09:26:48', '2022-04-11 09:26:48'),
(13, 6, '0.0000', 'cash', 'credit', 'sell', 48, '2022-04-11 09:26:48', '2022-04-11 09:26:48'),
(14, 6, '1000.0000', 'cash', 'credit', 'sell', 51, '2022-04-11 09:30:47', '2022-04-11 09:30:47'),
(15, 6, '0.0000', 'cash', 'credit', 'sell', 51, '2022-04-11 09:30:47', '2022-04-11 09:30:47'),
(16, 6, '1000.0000', 'cash', 'credit', 'sell', 80, '2022-04-11 11:01:10', '2022-04-11 11:01:10'),
(17, 6, '0.0000', 'cash', 'credit', 'sell', 80, '2022-04-11 11:01:10', '2022-04-11 11:01:10'),
(18, 6, '1000.0000', 'cash', 'credit', 'sell', 90, '2022-04-11 11:31:20', '2022-04-11 11:31:20'),
(19, 6, '0.0000', 'cash', 'credit', 'sell', 90, '2022-04-11 11:31:20', '2022-04-11 11:31:20'),
(20, 6, '1000.0000', 'cash', 'credit', 'sell', 100, '2022-04-12 03:00:25', '2022-04-12 03:00:25'),
(21, 6, '0.0000', 'cash', 'credit', 'sell', 100, '2022-04-12 03:00:25', '2022-04-12 03:00:25'),
(22, 6, '1000.0000', 'cash', 'credit', 'sell', 118, '2022-04-12 04:15:58', '2022-04-12 04:15:58'),
(23, 6, '0.0000', 'cash', 'credit', 'sell', 118, '2022-04-12 04:15:58', '2022-04-12 04:15:58'),
(24, 6, '1000.0000', 'cash', 'credit', 'sell', 121, '2022-04-13 04:30:58', '2022-04-13 04:30:58'),
(25, 6, '1000.0000', 'cash', 'credit', 'sell', 159, '2022-04-13 10:37:34', '2022-04-13 10:37:34'),
(26, 6, '1000.0000', 'cash', 'credit', 'sell', 372, '2022-04-13 16:06:39', '2022-04-13 16:06:39'),
(27, 6, '1000.0000', 'cash', 'credit', 'sell', 373, '2022-04-17 04:11:18', '2022-04-17 04:11:18'),
(28, 6, '1000.0000', 'cash', 'credit', 'sell', 374, '2022-04-17 05:02:11', '2022-04-17 05:02:11'),
(29, 6, '1000.0000', 'cash', 'credit', 'sell', 375, '2022-04-17 05:05:18', '2022-04-17 05:05:18'),
(30, 6, '1000.0000', 'cash', 'credit', 'sell', 376, '2022-04-17 05:05:36', '2022-04-17 05:05:36'),
(31, 6, '1000.0000', 'cash', 'credit', 'sell', 377, '2022-04-17 05:06:13', '2022-04-17 05:06:13'),
(32, 6, '1000.0000', 'cash', 'credit', 'sell', 378, '2022-04-17 05:25:51', '2022-04-17 05:25:51'),
(33, 6, '1000.0000', 'cash', 'credit', 'sell', 379, '2022-04-17 05:30:05', '2022-04-17 05:30:05'),
(34, 6, '1000.0000', 'cash', 'credit', 'sell', 380, '2022-04-17 07:08:31', '2022-04-17 07:08:31'),
(35, 6, '1000.0000', 'cash', 'credit', 'sell', 381, '2022-04-17 07:10:34', '2022-04-17 07:10:34'),
(36, 6, '1000.0000', 'cash', 'credit', 'sell', 382, '2022-04-17 07:19:49', '2022-04-17 07:19:49'),
(37, 6, '1000.0000', 'cash', 'credit', 'sell', 383, '2022-04-17 07:20:30', '2022-04-17 07:20:30'),
(38, 6, '1000.0000', 'cash', 'credit', 'sell', 384, '2022-04-17 07:24:53', '2022-04-17 07:24:53'),
(39, 6, '1000.0000', 'cash', 'credit', 'sell', 385, '2022-04-17 07:26:55', '2022-04-17 07:26:55'),
(40, 6, '1000.0000', 'cash', 'credit', 'sell', 386, '2022-04-17 07:54:24', '2022-04-17 07:54:24'),
(41, 6, '1000.0000', 'cash', 'credit', 'sell', 387, '2022-04-17 07:57:43', '2022-04-17 07:57:43'),
(42, 6, '1000.0000', 'cash', 'credit', 'sell', 388, '2022-04-17 08:07:04', '2022-04-17 08:07:04'),
(43, 6, '1000.0000', 'cash', 'credit', 'sell', 389, '2022-04-17 08:09:20', '2022-04-17 08:09:20'),
(44, 6, '1000.0000', 'cash', 'credit', 'sell', 390, '2022-04-17 08:10:58', '2022-04-17 08:10:58'),
(45, 6, '1000.0000', 'cash', 'credit', 'sell', 391, '2022-04-17 08:11:45', '2022-04-17 08:11:45'),
(46, 6, '1000.0000', 'cash', 'credit', 'sell', 392, '2022-04-17 08:13:46', '2022-04-17 08:13:46'),
(47, 6, '1000.0000', 'cash', 'credit', 'sell', 393, '2022-04-17 08:24:16', '2022-04-17 08:24:16'),
(48, 6, '1000.0000', 'cash', 'credit', 'sell', 394, '2022-04-17 08:26:53', '2022-04-17 08:26:53'),
(49, 6, '1000.0000', 'cash', 'credit', 'sell', 395, '2022-04-17 08:28:24', '2022-04-17 08:28:24'),
(50, 6, '1012.5000', 'cash', 'credit', 'sell', 396, '2022-04-17 08:41:17', '2022-04-17 08:41:17'),
(51, 6, '1012.5000', 'cash', 'credit', 'sell', 397, '2022-04-17 08:43:03', '2022-04-17 08:43:03'),
(52, 6, '1000.0000', 'cash', 'credit', 'sell', 398, '2022-04-17 08:46:30', '2022-04-17 08:46:30'),
(53, 6, '1000.0000', 'cash', 'credit', 'sell', 399, '2022-04-17 08:47:22', '2022-04-17 08:47:22'),
(54, 6, '1000.0000', 'cash', 'credit', 'sell', 400, '2022-04-17 08:47:59', '2022-04-17 08:47:59'),
(55, 6, '12.5000', 'cash', 'credit', 'sell', 401, '2022-04-17 08:49:43', '2022-04-17 08:49:43'),
(56, 6, '1000.0000', 'cash', 'credit', 'sell', 402, '2022-04-17 08:51:30', '2022-04-17 08:51:30'),
(57, 6, '1000.0000', 'cash', 'credit', 'sell', 403, '2022-04-17 08:53:51', '2022-04-17 08:53:51'),
(58, 6, '1000.0000', 'cash', 'credit', 'sell', 404, '2022-04-17 08:54:38', '2022-04-17 08:54:38'),
(59, 6, '1000.0000', 'cash', 'credit', 'sell', 405, '2022-04-17 08:58:16', '2022-04-17 08:58:16'),
(60, 6, '1000.0000', 'cash', 'credit', 'sell', 406, '2022-04-17 09:00:32', '2022-04-17 09:00:32'),
(61, 6, '1000.0000', 'cash', 'credit', 'sell', 407, '2022-04-17 09:01:31', '2022-04-17 09:01:31'),
(84, 6, '1100.0000', 'cash', 'credit', 'sell', 438, '2022-04-18 05:32:38', '2022-04-18 05:32:38'),
(85, 6, '1662.5000', 'cash', 'credit', 'sell', 439, '2022-04-18 06:42:39', '2022-04-18 06:42:39'),
(86, 6, '2000.0000', 'cash', 'credit', 'sell', 441, '2022-04-18 07:06:19', '2022-04-18 07:06:19'),
(87, 7, '1000.0000', 'cash', 'credit', 'initial', NULL, '2022-04-18 08:52:15', '2022-04-18 08:52:15'),
(88, 7, '1012.5000', 'cash', 'credit', 'sell', 442, '2022-04-18 08:52:24', '2022-04-18 08:52:24'),
(89, 7, '1012.5000', 'cash', 'credit', 'sell', 443, '2022-04-18 08:56:28', '2022-04-18 08:56:28'),
(90, 7, '1012.5000', 'cash', 'credit', 'sell', 444, '2022-04-18 09:30:27', '2022-04-18 09:30:27'),
(91, 7, '350.0000', 'cash', 'credit', 'sell', 444, '2022-04-18 13:43:04', '2022-04-18 13:43:04'),
(92, 7, '1012.5000', 'cash', 'credit', 'sell', 446, '2022-04-27 05:59:50', '2022-04-27 05:59:50'),
(93, 7, '12.5000', 'cash', 'credit', 'sell', 447, '2022-04-27 06:04:20', '2022-04-27 06:04:20'),
(94, 7, '25012.5000', 'cash', 'credit', 'sell', 453, '2022-04-27 07:37:08', '2022-04-27 07:37:08'),
(95, 8, '1000.0000', 'cash', 'credit', 'initial', NULL, '2022-04-30 05:53:04', '2022-04-30 05:53:04'),
(96, 8, '24000.0000', 'cash', 'credit', 'sell', 455, '2022-05-01 02:05:50', '2022-05-01 02:05:50'),
(97, 8, '24000.0000', 'cash', 'credit', 'sell', 456, '2022-05-01 02:07:48', '2022-05-01 02:07:48'),
(98, 8, '24000.0000', 'cash', 'credit', 'sell', 457, '2022-05-01 03:14:40', '2022-05-01 03:14:40'),
(99, 8, '6500.0000', 'cash', 'credit', 'sell', 458, '2022-05-01 03:16:43', '2022-05-01 03:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `short_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `category_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `business_id`, `short_code`, `parent_id`, `created_by`, `category_type`, `description`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Motherboard', 1, 'MB', 0, 1, 'product', 'Motherboard', NULL, NULL, '2022-04-27 06:12:45', '2022-04-28 18:42:48'),
(2, 'Processor', 1, 'PRO', 0, 1, 'product', 'Central Processing Unit', NULL, NULL, '2022-04-27 06:13:05', '2022-04-28 18:41:43'),
(3, 'Brand New', 1, 'MbNew', 1, 1, 'product', 'Brand new Motherboard', NULL, NULL, '2022-04-27 06:13:55', '2022-04-28 18:35:37'),
(4, 'Brand New', 1, 'ProNew', 2, 1, 'product', 'Brand New Processor', NULL, NULL, '2022-04-27 06:14:38', '2022-04-28 18:34:51'),
(5, 'Used', 1, 'MU', 1, 1, 'product', NULL, NULL, '2022-04-28 18:40:34', '2022-04-27 06:17:06', '2022-04-28 18:40:34'),
(6, 'Used', 1, 'PU', 2, 1, 'product', NULL, NULL, '2022-04-28 18:40:38', '2022-04-27 06:17:27', '2022-04-28 18:40:38'),
(7, 'Memory', 1, 'Mem', 0, 1, 'product', 'Memory', NULL, NULL, '2022-04-27 06:18:21', '2022-04-28 18:50:22'),
(8, 'Brand New', 1, 'MemNew', 7, 1, 'product', 'Brand new Memory', NULL, NULL, '2022-04-27 06:19:00', '2022-04-28 18:35:21'),
(9, 'Hard Drive', 1, 'HDD', 0, 1, 'product', 'Hard Drive', NULL, NULL, '2022-04-27 06:20:27', '2022-04-28 18:43:24'),
(10, 'Brand New', 1, 'BN', 0, 1, 'product', NULL, NULL, '2022-04-28 18:38:55', '2022-04-27 06:20:43', '2022-04-28 18:38:55'),
(11, 'Pre Owned', 1, 'PO', 0, 1, 'product', NULL, NULL, '2022-04-28 18:40:49', '2022-04-27 06:21:03', '2022-04-28 18:40:49'),
(12, 'Brand New', 1, 'PsuNew', 13, 1, 'product', 'Brand New Power Supply', NULL, NULL, '2022-04-27 06:21:32', '2022-04-28 18:38:47'),
(13, 'Power Supply', 1, 'PSU', 0, 1, 'product', 'Power Supply', NULL, NULL, '2022-04-27 06:21:53', '2022-04-28 18:42:24'),
(14, 'Brand New', 1, 'HddNew', 9, 1, 'product', 'Brand New Hard Drive', NULL, NULL, '2022-04-27 06:22:16', '2022-04-28 18:37:18'),
(15, 'Solid State Drive', 1, 'SSD', 0, 1, 'product', 'Solid State Drive', NULL, NULL, '2022-04-27 06:22:39', '2022-04-28 18:42:11'),
(16, 'Brand New', 1, 'SsdNew', 15, 1, 'product', 'Brand New Solid State Drive', NULL, NULL, '2022-04-28 18:40:00', '2022-04-28 18:40:00'),
(17, 'Casing', 1, 'CHA', 0, 1, 'product', 'Casing', NULL, NULL, '2022-04-28 18:43:54', '2022-04-28 18:43:54'),
(18, 'Graphics Card', 1, 'GPU', 0, 1, 'product', 'Graphics Card', NULL, NULL, '2022-04-28 18:44:21', '2022-04-28 18:44:21'),
(19, 'Brand New', 1, 'ChaNew', 17, 1, 'product', 'Brand New Casing', NULL, NULL, '2022-04-28 18:44:54', '2022-04-28 18:44:54'),
(20, 'Brand New', 1, 'GpuNew', 18, 1, 'product', 'Brand New Graphics card', NULL, NULL, '2022-04-28 18:45:50', '2022-04-28 18:45:50'),
(21, 'CPU Cooler', 1, 'Coo', 0, 1, 'product', 'CPU Cooler', NULL, NULL, '2022-04-28 18:48:02', '2022-04-28 18:48:02'),
(22, 'Brand New', 1, 'CooNew', 21, 1, 'product', 'Brand New Cpu Cooler', NULL, NULL, '2022-04-28 18:48:33', '2022-04-28 18:48:33'),
(23, 'Monitor', 1, 'Mo', 0, 1, 'product', 'Monitor', NULL, NULL, '2022-04-28 18:49:20', '2022-04-28 18:49:20'),
(24, 'Brand New', 1, 'MoNew', 23, 1, 'product', 'Brand New Monitor', NULL, NULL, '2022-04-28 18:50:03', '2022-04-28 18:50:03');

-- --------------------------------------------------------

--
-- Table structure for table `categorizables`
--

CREATE TABLE `categorizables` (
  `category_id` int(11) NOT NULL,
  `categorizable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorizable_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_business_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_1` text COLLATE utf8mb4_unicode_ci,
  `address_line_2` text COLLATE utf8mb4_unicode_ci,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `balance` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `total_rp` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_used` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_custom_field_details` longtext COLLATE utf8mb4_unicode_ci,
  `is_export` tinyint(1) NOT NULL DEFAULT '0',
  `export_custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_6` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field6` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field7` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field8` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field9` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field10` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `business_id`, `type`, `supplier_business_name`, `name`, `prefix`, `first_name`, `middle_name`, `last_name`, `email`, `contact_id`, `contact_status`, `tax_number`, `city`, `state`, `country`, `address_line_1`, `address_line_2`, `zip_code`, `dob`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `credit_limit`, `created_by`, `balance`, `total_rp`, `total_rp_used`, `total_rp_expired`, `is_default`, `shipping_address`, `shipping_custom_field_details`, `is_export`, `export_custom_field_1`, `export_custom_field_2`, `export_custom_field_3`, `export_custom_field_4`, `export_custom_field_5`, `export_custom_field_6`, `position`, `customer_group_id`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `custom_field6`, `custom_field7`, `custom_field8`, `custom_field9`, `custom_field10`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '0.0000', 1, '0.0000', 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-19 04:38:49', '2022-03-19 04:38:49'),
(2, 1, 'customer', NULL, 'Mr Dinitha Rathnayake', 'Mr', 'Dinitha', NULL, 'Rathnayake', NULL, 'CO0002', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0787200877', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-11 11:29:21', '2022-04-11 11:29:21'),
(3, 1, 'customer', NULL, '', NULL, NULL, NULL, NULL, NULL, 'CO0003', 'active', NULL, 'badulla', NULL, NULL, 'wewassagama,badulla', NULL, NULL, NULL, '0787200877', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-11 11:34:34', '2022-04-11 11:34:34'),
(4, 1, 'customer', NULL, 'Mr Dinitha Rathnayake', 'Mr', 'Dinitha', NULL, 'Rathnayake', NULL, 'CO0004', 'active', NULL, 'Badulla', NULL, NULL, 'wewassagama', 'vineethagama', NULL, NULL, '0787200877', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, 'wewassagama,vineethagama,badulla', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-11 11:36:19', '2022-04-11 11:36:19'),
(5, 1, 'customer', NULL, 'Mr  Dinitha rathnayake', 'Mr ', 'Dinitha', 'rathnayake', NULL, NULL, 'CO0005', 'active', NULL, 'Badulla', NULL, NULL, 'wewassagama', 'Vineethgama', NULL, NULL, '0787200877', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Store pickup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-11 11:38:36', '2022-04-11 11:38:36'),
(6, 1, 'customer', NULL, '5645 lkj lkhj', '5645', 'lkj', 'lkhj', NULL, NULL, 'CO0006', 'active', NULL, 'sada', NULL, NULL, 'adad', 'sadad', NULL, NULL, '0787200877', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'adsadadasd74845454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-11 11:41:20', '2022-04-11 11:41:20'),
(7, 1, 'customer', NULL, 'Mac', NULL, 'Mac', NULL, NULL, NULL, 'CO0007', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-12 02:59:25', '2022-04-12 02:59:25'),
(8, 1, 'customer', NULL, '', NULL, NULL, NULL, NULL, NULL, 'CO0008', 'active', NULL, 'badulla', NULL, NULL, 'wewassagama', 'wineethagama', NULL, NULL, '0787200877', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-18 05:14:53', '2022-04-18 05:14:53'),
(9, 1, 'customer', NULL, 'Mr Ashan devinda', 'Mr', 'Ashan', NULL, 'devinda', NULL, 'CO0009', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0787200877', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-18 05:28:50', '2022-04-18 05:28:50'),
(10, 1, 'customer', NULL, 'Mr Ashan Devinda', 'Mr', 'Ashan', NULL, 'Devinda', NULL, 'CO0010', 'active', NULL, 'Badulla', NULL, NULL, 'Wewassagama', 'Vineethagama', NULL, NULL, '0787200877', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-18 06:41:57', '2022-04-18 06:41:57'),
(11, 1, 'customer', NULL, 'Mr Yomal Abeygunawardena', 'Mr', 'Yomal', NULL, 'Abeygunawardena', NULL, 'CO0011', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0767151755', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-27 07:32:36', '2022-04-27 07:32:36');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHS', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MXN', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NGN', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL),
(137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL),
(138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL),
(139, 'Angola', 'Kwanza', 'AOA', 'Kz', ',', '.', NULL, NULL),
(140, 'Kuwait', 'Kuwaiti dinar', 'KWD', 'KD', ',', '.', NULL, NULL),
(141, 'Bahrain', 'Bahraini dinar', 'BHD', 'BD', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(5,2) NOT NULL,
  `price_calculation_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'percentage',
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_configurations`
--

CREATE TABLE `dashboard_configurations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `spg` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Applicable in specified selling price group only. Use of applicable_in_spg column is discontinued',
  `applicable_in_cg` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_variations`
--

CREATE TABLE `discount_variations` (
  `discount_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_and_notes`
--

CREATE TABLE `document_and_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `notable_id` int(11) NOT NULL,
  `notable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_sub_taxes`
--

CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_layouts`
--

CREATE TABLE `invoice_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_text` text COLLATE utf8mb4_unicode_ci,
  `invoice_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `round_off_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_due_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT '0',
  `client_id_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT '1',
  `show_brand` tinyint(1) NOT NULL DEFAULT '0',
  `show_sku` tinyint(1) NOT NULL DEFAULT '1',
  `show_cat_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `show_lot` tinyint(1) NOT NULL DEFAULT '0',
  `show_image` tinyint(1) NOT NULL DEFAULT '0',
  `show_sale_description` tinyint(1) NOT NULL DEFAULT '0',
  `sales_person_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT '0',
  `table_product_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_qty_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_unit_price_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_subtotal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_code_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT '0',
  `show_business_name` tinyint(1) NOT NULL DEFAULT '0',
  `show_location_name` tinyint(1) NOT NULL DEFAULT '1',
  `show_landmark` tinyint(1) NOT NULL DEFAULT '1',
  `show_city` tinyint(1) NOT NULL DEFAULT '1',
  `show_state` tinyint(1) NOT NULL DEFAULT '1',
  `show_zip_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_country` tinyint(1) NOT NULL DEFAULT '1',
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT '1',
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT '0',
  `show_email` tinyint(1) NOT NULL DEFAULT '0',
  `show_tax_1` tinyint(1) NOT NULL DEFAULT '1',
  `show_tax_2` tinyint(1) NOT NULL DEFAULT '0',
  `show_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `show_payments` tinyint(1) NOT NULL DEFAULT '0',
  `show_customer` tinyint(1) NOT NULL DEFAULT '0',
  `customer_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_agent_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_commission_agent` tinyint(1) NOT NULL DEFAULT '0',
  `show_reward_point` tinyint(1) NOT NULL DEFAULT '0',
  `highlight_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `module_info` text COLLATE utf8mb4_unicode_ci,
  `common_settings` text COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `business_id` int(10) UNSIGNED NOT NULL,
  `show_qr_code` tinyint(1) NOT NULL DEFAULT '0',
  `qr_code_fields` text COLLATE utf8mb4_unicode_ci,
  `design` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT 'classic',
  `cn_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cn_amount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_tax_headings` text COLLATE utf8mb4_unicode_ci,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT '0',
  `prev_bal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_return_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `contact_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `location_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `round_off_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `date_time_format`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_expiry`, `show_lot`, `show_image`, `show_sale_description`, `sales_person_label`, `show_sales_person`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `commission_agent_label`, `show_commission_agent`, `show_reward_point`, `highlight_color`, `footer_text`, `module_info`, `common_settings`, `is_default`, `business_id`, `show_qr_code`, `qr_code_fields`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `table_tax_headings`, `show_previous_bal`, `prev_bal_label`, `change_return_label`, `product_custom_fields`, `contact_custom_fields`, `location_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Default', NULL, 'Invoice No', 'Qutation No', 'INVOICE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'QUOTATION', 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', 'm/d/y g:i a', 1, 1, 0, 0, 0, 0, 0, 1, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, '1650179969_header.png', 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 'Name', NULL, 0, 0, '#000000', NULL, '{\"types_of_service\":{\"types_of_service_label\":null}}', '{\"proforma_heading\":null,\"sales_order_heading\":null,\"due_date_label\":null,\"total_quantity_label\":null,\"item_discount_label\":null,\"show_warranty_name\":\"1\",\"num_to_word_format\":\"international\",\"tax_summary_label\":null}', 1, 1, 1, NULL, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, '[\"product_custom_field1\"]', NULL, NULL, '2022-03-19 04:38:49', '2022-05-01 02:07:23');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_schemes`
--

CREATE TABLE `invoice_schemes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme_type` enum('blank','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_number` int(11) DEFAULT NULL,
  `invoice_count` int(11) NOT NULL DEFAULT '0',
  `total_digits` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Default', 'blank', '', 1, 88, 4, 1, '2022-03-19 04:38:49', '2022-05-01 03:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `uploaded_by` int(11) DEFAULT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_media_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2017_07_05_071953_create_currencies_table', 1),
(9, '2017_07_05_073658_create_business_table', 1),
(10, '2017_07_22_075923_add_business_id_users_table', 1),
(11, '2017_07_23_113209_create_brands_table', 1),
(12, '2017_07_26_083429_create_permission_tables', 1),
(13, '2017_07_26_110000_create_tax_rates_table', 1),
(14, '2017_07_26_122313_create_units_table', 1),
(15, '2017_07_27_075706_create_contacts_table', 1),
(16, '2017_08_04_071038_create_categories_table', 1),
(17, '2017_08_08_115903_create_products_table', 1),
(18, '2017_08_09_061616_create_variation_templates_table', 1),
(19, '2017_08_09_061638_create_variation_value_templates_table', 1),
(20, '2017_08_10_061146_create_product_variations_table', 1),
(21, '2017_08_10_061216_create_variations_table', 1),
(22, '2017_08_19_054827_create_transactions_table', 1),
(23, '2017_08_31_073533_create_purchase_lines_table', 1),
(24, '2017_10_15_064638_create_transaction_payments_table', 1),
(25, '2017_10_31_065621_add_default_sales_tax_to_business_table', 1),
(26, '2017_11_20_051930_create_table_group_sub_taxes', 1),
(27, '2017_11_20_063603_create_transaction_sell_lines', 1),
(28, '2017_11_21_064540_create_barcodes_table', 1),
(29, '2017_11_23_181237_create_invoice_schemes_table', 1),
(30, '2017_12_25_122822_create_business_locations_table', 1),
(31, '2017_12_25_160253_add_location_id_to_transactions_table', 1),
(32, '2017_12_25_163227_create_variation_location_details_table', 1),
(33, '2018_01_04_115627_create_sessions_table', 1),
(34, '2018_01_05_112817_create_invoice_layouts_table', 1),
(35, '2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations', 1),
(36, '2018_01_08_104124_create_expense_categories_table', 1),
(37, '2018_01_08_123327_modify_transactions_table_for_expenses', 1),
(38, '2018_01_09_111005_modify_payment_status_in_transactions_table', 1),
(39, '2018_01_09_111109_add_paid_on_column_to_transaction_payments_table', 1),
(40, '2018_01_25_172439_add_printer_related_fields_to_business_locations_table', 1),
(41, '2018_01_27_184322_create_printers_table', 1),
(42, '2018_01_30_181442_create_cash_registers_table', 1),
(43, '2018_01_31_125836_create_cash_register_transactions_table', 1),
(44, '2018_02_07_173326_modify_business_table', 1),
(45, '2018_02_08_105425_add_enable_product_expiry_column_to_business_table', 1),
(46, '2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table', 1),
(47, '2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table', 1),
(48, '2018_02_08_155348_add_exchange_rate_to_transactions_table', 1),
(49, '2018_02_09_124945_modify_transaction_payments_table_for_contact_payments', 1),
(50, '2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table', 1),
(51, '2018_02_12_114605_add_quantity_sold_in_purchase_lines_table', 1),
(52, '2018_02_13_183323_alter_decimal_fields_size', 1),
(53, '2018_02_14_161928_add_transaction_edit_days_to_business_table', 1),
(54, '2018_02_15_161032_add_document_column_to_transactions_table', 1),
(55, '2018_02_17_124709_add_more_options_to_invoice_layouts', 1),
(56, '2018_02_19_111517_add_keyboard_shortcut_column_to_business_table', 1),
(57, '2018_02_19_121537_stock_adjustment_move_to_transaction_table', 1),
(58, '2018_02_20_165505_add_is_direct_sale_column_to_transactions_table', 1),
(59, '2018_02_21_105329_create_system_table', 1),
(60, '2018_02_23_100549_version_1_2', 1),
(61, '2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table', 1),
(62, '2018_02_26_103612_add_sales_commission_agent_column_to_business_table', 1),
(63, '2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt', 1),
(64, '2018_02_26_134500_add_commission_agent_to_transactions_table', 1),
(65, '2018_02_27_121422_add_item_addition_method_to_business_table', 1),
(66, '2018_02_27_170232_modify_transactions_table_for_stock_transfer', 1),
(67, '2018_03_05_153510_add_enable_inline_tax_column_to_business_table', 1),
(68, '2018_03_06_210206_modify_product_barcode_types', 1),
(69, '2018_03_13_181541_add_expiry_type_to_business_table', 1),
(70, '2018_03_16_113446_product_expiry_setting_for_business', 1),
(71, '2018_03_19_113601_add_business_settings_options', 1),
(72, '2018_03_26_125334_add_pos_settings_to_business_table', 1),
(73, '2018_03_26_165350_create_customer_groups_table', 1),
(74, '2018_03_27_122720_customer_group_related_changes_in_tables', 1),
(75, '2018_03_29_110138_change_tax_field_to_nullable_in_business_table', 1),
(76, '2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table', 1),
(77, '2018_03_29_134340_add_inline_discount_fields_in_purchase_lines', 1),
(78, '2018_03_31_140921_update_transactions_table_exchange_rate', 1),
(79, '2018_04_03_103037_add_contact_id_to_contacts_table', 1),
(80, '2018_04_03_122709_add_changes_to_invoice_layouts_table', 1),
(81, '2018_04_09_135320_change_exchage_rate_size_in_business_table', 1),
(82, '2018_04_17_123122_add_lot_number_to_business', 1),
(83, '2018_04_17_160845_add_product_racks_table', 1),
(84, '2018_04_20_182015_create_res_tables_table', 1),
(85, '2018_04_24_105246_restaurant_fields_in_transaction_table', 1),
(86, '2018_04_24_114149_add_enabled_modules_business_table', 1),
(87, '2018_04_24_133704_add_modules_fields_in_invoice_layout_table', 1),
(88, '2018_04_27_132653_quotation_related_change', 1),
(89, '2018_05_02_104439_add_date_format_and_time_format_to_business', 1),
(90, '2018_05_02_111939_add_sell_return_to_transaction_payments', 1),
(91, '2018_05_14_114027_add_rows_positions_for_products', 1),
(92, '2018_05_14_125223_add_weight_to_products_table', 1),
(93, '2018_05_14_164754_add_opening_stock_permission', 1),
(94, '2018_05_15_134729_add_design_to_invoice_layouts', 1),
(95, '2018_05_16_183307_add_tax_fields_invoice_layout', 1),
(96, '2018_05_18_191956_add_sell_return_to_transaction_table', 1),
(97, '2018_05_21_131349_add_custom_fileds_to_contacts_table', 1),
(98, '2018_05_21_131607_invoice_layout_fields_for_sell_return', 1),
(99, '2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table', 1),
(100, '2018_05_22_123527_create_reference_counts_table', 1),
(101, '2018_05_22_154540_add_ref_no_prefixes_column_to_business_table', 1),
(102, '2018_05_24_132620_add_ref_no_column_to_transaction_payments_table', 1),
(103, '2018_05_24_161026_add_location_id_column_to_business_location_table', 1),
(104, '2018_05_25_180603_create_modifiers_related_table', 1),
(105, '2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table', 1),
(106, '2018_05_31_114645_add_res_order_status_column_to_transactions_table', 1),
(107, '2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table', 1),
(108, '2018_06_05_111905_modify_products_table_for_modifiers', 1),
(109, '2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table', 1),
(110, '2018_06_07_152443_add_is_service_staff_to_roles_table', 1),
(111, '2018_06_07_182258_add_image_field_to_products_table', 1),
(112, '2018_06_13_133705_create_bookings_table', 1),
(113, '2018_06_15_173636_add_email_column_to_contacts_table', 1),
(114, '2018_06_27_182835_add_superadmin_related_fields_business', 1),
(115, '2018_07_10_101913_add_custom_fields_to_products_table', 1),
(116, '2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table', 1),
(117, '2018_07_17_163920_add_theme_skin_color_column_to_business_table', 1),
(118, '2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table', 1),
(119, '2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table', 1),
(120, '2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table', 1),
(121, '2018_07_26_124720_change_design_column_type_in_invoice_layouts_table', 1),
(122, '2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table', 1),
(123, '2018_07_28_103614_add_credit_limit_column_to_contacts_table', 1),
(124, '2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table', 1),
(125, '2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods', 1),
(126, '2018_08_14_104036_add_opening_balance_type_to_transactions_table', 1),
(127, '2018_09_04_155900_create_accounts_table', 1),
(128, '2018_09_06_114438_create_selling_price_groups_table', 1),
(129, '2018_09_06_154057_create_variation_group_prices_table', 1),
(130, '2018_09_07_102413_add_permission_to_access_default_selling_price', 1),
(131, '2018_09_07_134858_add_selling_price_group_id_to_transactions_table', 1),
(132, '2018_09_10_112448_update_product_type_to_single_if_null_in_products_table', 1),
(133, '2018_09_10_152703_create_account_transactions_table', 1),
(134, '2018_09_10_173656_add_account_id_column_to_transaction_payments_table', 1),
(135, '2018_09_19_123914_create_notification_templates_table', 1),
(136, '2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table', 1),
(137, '2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table', 1),
(138, '2018_09_26_105557_add_transaction_payments_for_existing_expenses', 1),
(139, '2018_09_27_111609_modify_transactions_table_for_purchase_return', 1),
(140, '2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table', 1),
(141, '2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table', 1),
(142, '2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table', 1),
(143, '2018_10_03_185947_add_default_notification_templates_to_database', 1),
(144, '2018_10_09_153105_add_business_id_to_transaction_payments_table', 1),
(145, '2018_10_16_135229_create_permission_for_sells_and_purchase', 1),
(146, '2018_10_22_114441_add_columns_for_variable_product_modifications', 1),
(147, '2018_10_22_134428_modify_variable_product_data', 1),
(148, '2018_10_30_181558_add_table_tax_headings_to_invoice_layout', 1),
(149, '2018_10_31_122619_add_pay_terms_field_transactions_table', 1),
(150, '2018_10_31_161328_add_new_permissions_for_pos_screen', 1),
(151, '2018_10_31_174752_add_access_selected_contacts_only_to_users_table', 1),
(152, '2018_10_31_175627_add_user_contact_access', 1),
(153, '2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table', 1),
(154, '2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table', 1),
(155, '2018_11_08_105621_add_role_permissions', 1),
(156, '2018_11_26_114135_add_is_suspend_column_to_transactions_table', 1),
(157, '2018_11_28_104410_modify_units_table_for_multi_unit', 1),
(158, '2018_11_28_170952_add_sub_unit_id_to_purchase_lines_and_sell_lines', 1),
(159, '2018_11_29_115918_add_primary_key_in_system_table', 1),
(160, '2018_12_03_185546_add_product_description_column_to_products_table', 1),
(161, '2018_12_06_114937_modify_system_table_and_users_table', 1),
(162, '2018_12_13_160007_add_custom_fields_display_options_to_invoice_layouts_table', 1),
(163, '2018_12_14_103307_modify_system_table', 1),
(164, '2018_12_18_133837_add_prev_balance_due_columns_to_invoice_layouts_table', 1),
(165, '2018_12_18_170656_add_invoice_token_column_to_transaction_table', 1),
(166, '2018_12_20_133639_add_date_time_format_column_to_invoice_layouts_table', 1),
(167, '2018_12_21_120659_add_recurring_invoice_fields_to_transactions_table', 1),
(168, '2018_12_24_154933_create_notifications_table', 1),
(169, '2019_01_08_112015_add_document_column_to_transaction_payments_table', 1),
(170, '2019_01_10_124645_add_account_permission', 1),
(171, '2019_01_16_125825_add_subscription_no_column_to_transactions_table', 1),
(172, '2019_01_28_111647_add_order_addresses_column_to_transactions_table', 1),
(173, '2019_02_13_173821_add_is_inactive_column_to_products_table', 1),
(174, '2019_02_19_103118_create_discounts_table', 1),
(175, '2019_02_21_120324_add_discount_id_column_to_transaction_sell_lines_table', 1),
(176, '2019_02_21_134324_add_permission_for_discount', 1),
(177, '2019_03_04_170832_add_service_staff_columns_to_transaction_sell_lines_table', 1),
(178, '2019_03_09_102425_add_sub_type_column_to_transactions_table', 1),
(179, '2019_03_09_124457_add_indexing_transaction_sell_lines_purchase_lines_table', 1),
(180, '2019_03_12_120336_create_activity_log_table', 1),
(181, '2019_03_15_132925_create_media_table', 1),
(182, '2019_05_08_130339_add_indexing_to_parent_id_in_transaction_payments_table', 1),
(183, '2019_05_10_132311_add_missing_column_indexing', 1),
(184, '2019_05_14_091812_add_show_image_column_to_invoice_layouts_table', 1),
(185, '2019_05_25_104922_add_view_purchase_price_permission', 1),
(186, '2019_06_17_103515_add_profile_informations_columns_to_users_table', 1),
(187, '2019_06_18_135524_add_permission_to_view_own_sales_only', 1),
(188, '2019_06_19_112058_add_database_changes_for_reward_points', 1),
(189, '2019_06_28_133732_change_type_column_to_string_in_transactions_table', 1),
(190, '2019_07_13_111420_add_is_created_from_api_column_to_transactions_table', 1),
(191, '2019_07_15_165136_add_fields_for_combo_product', 1),
(192, '2019_07_19_103446_add_mfg_quantity_used_column_to_purchase_lines_table', 1),
(193, '2019_07_22_152649_add_not_for_selling_in_product_table', 1),
(194, '2019_07_29_185351_add_show_reward_point_column_to_invoice_layouts_table', 1),
(195, '2019_08_08_162302_add_sub_units_related_fields', 1),
(196, '2019_08_26_133419_update_price_fields_decimal_point', 1),
(197, '2019_09_02_160054_remove_location_permissions_from_roles', 1),
(198, '2019_09_03_185259_add_permission_for_pos_screen', 1),
(199, '2019_09_04_163141_add_location_id_to_cash_registers_table', 1),
(200, '2019_09_04_184008_create_types_of_services_table', 1),
(201, '2019_09_06_131445_add_types_of_service_fields_to_transactions_table', 1),
(202, '2019_09_09_134810_add_default_selling_price_group_id_column_to_business_locations_table', 1),
(203, '2019_09_12_105616_create_product_locations_table', 1),
(204, '2019_09_17_122522_add_custom_labels_column_to_business_table', 1),
(205, '2019_09_18_164319_add_shipping_fields_to_transactions_table', 1),
(206, '2019_09_19_170927_close_all_active_registers', 1),
(207, '2019_09_23_161906_add_media_description_cloumn_to_media_table', 1),
(208, '2019_10_18_155633_create_account_types_table', 1),
(209, '2019_10_22_163335_add_common_settings_column_to_business_table', 1),
(210, '2019_10_29_132521_add_update_purchase_status_permission', 1),
(211, '2019_11_09_110522_add_indexing_to_lot_number', 1),
(212, '2019_11_19_170824_add_is_active_column_to_business_locations_table', 1),
(213, '2019_11_21_162913_change_quantity_field_types_to_decimal', 1),
(214, '2019_11_25_160340_modify_categories_table_for_polymerphic_relationship', 1),
(215, '2019_12_02_105025_create_warranties_table', 1),
(216, '2019_12_03_180342_add_common_settings_field_to_invoice_layouts_table', 1),
(217, '2019_12_05_183955_add_more_fields_to_users_table', 1),
(218, '2019_12_06_174904_add_change_return_label_column_to_invoice_layouts_table', 1),
(219, '2019_12_11_121307_add_draft_and_quotation_list_permissions', 1),
(220, '2019_12_12_180126_copy_expense_total_to_total_before_tax', 1),
(221, '2019_12_19_181412_make_alert_quantity_field_nullable_on_products_table', 1),
(222, '2019_12_25_173413_create_dashboard_configurations_table', 1),
(223, '2020_01_08_133506_create_document_and_notes_table', 1),
(224, '2020_01_09_113252_add_cc_bcc_column_to_notification_templates_table', 1),
(225, '2020_01_16_174818_add_round_off_amount_field_to_transactions_table', 1),
(226, '2020_01_28_162345_add_weighing_scale_settings_in_business_settings_table', 1),
(227, '2020_02_18_172447_add_import_fields_to_transactions_table', 1),
(228, '2020_03_13_135844_add_is_active_column_to_selling_price_groups_table', 1),
(229, '2020_03_16_115449_add_contact_status_field_to_contacts_table', 1),
(230, '2020_03_26_124736_add_allow_login_column_in_users_table', 1),
(231, '2020_04_13_154150_add_feature_products_column_to_business_loactions', 1),
(232, '2020_04_15_151802_add_user_type_to_users_table', 1),
(233, '2020_04_22_153905_add_subscription_repeat_on_column_to_transactions_table', 1),
(234, '2020_04_28_111436_add_shipping_address_to_contacts_table', 1),
(235, '2020_06_01_094654_add_max_sale_discount_column_to_users_table', 1),
(236, '2020_06_12_162245_modify_contacts_table', 1),
(237, '2020_06_22_103104_change_recur_interval_default_to_one', 1),
(238, '2020_07_09_174621_add_balance_field_to_contacts_table', 1),
(239, '2020_07_23_104933_change_status_column_to_varchar_in_transaction_table', 1),
(240, '2020_09_07_171059_change_completed_stock_transfer_status_to_final', 1),
(241, '2020_09_21_123224_modify_booking_status_column_in_bookings_table', 1),
(242, '2020_09_22_121639_create_discount_variations_table', 1),
(243, '2020_10_05_121550_modify_business_location_table_for_invoice_layout', 1),
(244, '2020_10_16_175726_set_status_as_received_for_opening_stock', 1),
(245, '2020_10_23_170823_add_for_group_tax_column_to_tax_rates_table', 1),
(246, '2020_11_04_130940_add_more_custom_fields_to_contacts_table', 1),
(247, '2020_11_10_152841_add_cash_register_permissions', 1),
(248, '2020_11_17_164041_modify_type_column_to_varchar_in_contacts_table', 1),
(249, '2020_12_18_181447_add_shipping_custom_fields_to_transactions_table', 1),
(250, '2020_12_22_164303_add_sub_status_column_to_transactions_table', 1),
(251, '2020_12_24_153050_add_custom_fields_to_transactions_table', 1),
(252, '2020_12_28_105403_add_whatsapp_text_column_to_notification_templates_table', 1),
(253, '2020_12_29_165925_add_model_document_type_to_media_table', 1),
(254, '2021_02_08_175632_add_contact_number_fields_to_users_table', 1),
(255, '2021_02_11_172217_add_indexing_for_multiple_columns', 1),
(256, '2021_02_23_122043_add_more_columns_to_customer_groups_table', 1),
(257, '2021_02_24_175551_add_print_invoice_permission_to_all_roles', 1),
(258, '2021_03_03_162021_add_purchase_order_columns_to_purchase_lines_and_transactions_table', 1),
(259, '2021_03_11_120229_add_sales_order_columns', 1),
(260, '2021_03_16_120705_add_business_id_to_activity_log_table', 1),
(261, '2021_03_16_153427_add_code_columns_to_business_table', 1),
(262, '2021_03_18_173308_add_account_details_column_to_accounts_table', 1),
(263, '2021_03_18_183119_add_prefer_payment_account_columns_to_transactions_table', 1),
(264, '2021_03_22_120810_add_more_types_of_service_custom_fields', 1),
(265, '2021_03_24_183132_add_shipping_export_custom_field_details_to_contacts_table', 1),
(266, '2021_03_25_170715_add_export_custom_fields_info_to_transactions_table', 1),
(267, '2021_04_15_063449_add_denominations_column_to_cash_registers_table', 1),
(268, '2021_05_22_083426_add_indexing_to_account_transactions_table', 1),
(269, '2021_07_08_065808_add_additional_expense_columns_to_transaction_table', 1),
(270, '2021_07_13_082918_add_qr_code_columns_to_invoice_layouts_table', 1),
(271, '2021_07_21_061615_add_fields_to_show_commission_agent_in_invoice_layout', 1),
(272, '2021_08_13_105549_add_crm_contact_id_to_users_table', 1),
(273, '2021_08_25_114932_add_payment_link_fields_to_transaction_payments_table', 1),
(274, '2021_09_01_063110_add_spg_column_to_discounts_table', 1),
(275, '2021_09_03_061528_modify_cash_register_transactions_table', 1),
(276, '2021_10_05_061658_add_source_column_to_transactions_table', 1),
(277, '2021_12_16_121851_add_parent_id_column_to_expense_categories_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `template_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci,
  `sms_body` text COLLATE utf8mb4_unicode_ci,
  `whatsapp_text` text COLLATE utf8mb4_unicode_ci,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT '0',
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT '0',
  `auto_send_wa_notif` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `business_id`, `template_for`, `email_body`, `sms_body`, `whatsapp_text`, `subject`, `cc`, `bcc`, `auto_send`, `auto_send_sms`, `auto_send_wa_notif`, `created_at`, `updated_at`) VALUES
(1, 1, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-19 04:38:49', '2022-03-19 04:38:49'),
(2, 1, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-19 04:38:49', '2022-03-19 04:38:49'),
(3, 1, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-19 04:38:49', '2022-03-19 04:38:49'),
(4, 1, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2022-03-19 04:38:49', '2022-03-19 04:38:49'),
(5, 1, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-19 04:38:49', '2022-03-19 04:38:49'),
(6, 1, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-19 04:38:49', '2022-03-19 04:38:49'),
(7, 1, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-19 04:38:49', '2022-03-19 04:38:49'),
(8, 1, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-19 04:38:49', '2022-03-19 04:38:49'),
(9, 1, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-19 04:38:49', '2022-03-19 04:38:49');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2022-03-19 04:33:10', NULL),
(2, 'direct_sell.access', 'web', '2022-03-19 04:33:10', NULL),
(3, 'product.opening_stock', 'web', '2022-03-19 04:33:12', '2022-03-19 04:33:12'),
(4, 'crud_all_bookings', 'web', '2022-03-19 04:33:13', '2022-03-19 04:33:13'),
(5, 'crud_own_bookings', 'web', '2022-03-19 04:33:13', '2022-03-19 04:33:13'),
(6, 'access_default_selling_price', 'web', '2022-03-19 04:33:15', '2022-03-19 04:33:15'),
(7, 'purchase.payments', 'web', '2022-03-19 04:33:15', '2022-03-19 04:33:15'),
(8, 'sell.payments', 'web', '2022-03-19 04:33:15', '2022-03-19 04:33:15'),
(9, 'edit_product_price_from_sale_screen', 'web', '2022-03-19 04:33:16', '2022-03-19 04:33:16'),
(10, 'edit_product_discount_from_sale_screen', 'web', '2022-03-19 04:33:16', '2022-03-19 04:33:16'),
(11, 'roles.view', 'web', '2022-03-19 04:33:16', '2022-03-19 04:33:16'),
(12, 'roles.create', 'web', '2022-03-19 04:33:16', '2022-03-19 04:33:16'),
(13, 'roles.update', 'web', '2022-03-19 04:33:16', '2022-03-19 04:33:16'),
(14, 'roles.delete', 'web', '2022-03-19 04:33:16', '2022-03-19 04:33:16'),
(15, 'account.access', 'web', '2022-03-19 04:33:17', '2022-03-19 04:33:17'),
(16, 'discount.access', 'web', '2022-03-19 04:33:17', '2022-03-19 04:33:17'),
(17, 'view_purchase_price', 'web', '2022-03-19 04:33:18', '2022-03-19 04:33:18'),
(18, 'view_own_sell_only', 'web', '2022-03-19 04:33:18', '2022-03-19 04:33:18'),
(19, 'edit_product_discount_from_pos_screen', 'web', '2022-03-19 04:33:19', '2022-03-19 04:33:19'),
(20, 'edit_product_price_from_pos_screen', 'web', '2022-03-19 04:33:19', '2022-03-19 04:33:19'),
(21, 'access_shipping', 'web', '2022-03-19 04:33:20', '2022-03-19 04:33:20'),
(22, 'purchase.update_status', 'web', '2022-03-19 04:33:20', '2022-03-19 04:33:20'),
(23, 'list_drafts', 'web', '2022-03-19 04:33:20', '2022-03-19 04:33:20'),
(24, 'list_quotations', 'web', '2022-03-19 04:33:20', '2022-03-19 04:33:20'),
(25, 'view_cash_register', 'web', '2022-03-19 04:33:22', '2022-03-19 04:33:22'),
(26, 'close_cash_register', 'web', '2022-03-19 04:33:22', '2022-03-19 04:33:22'),
(27, 'print_invoice', 'web', '2022-03-19 04:33:24', '2022-03-19 04:33:24'),
(28, 'user.view', 'web', '2022-03-19 04:33:37', NULL),
(29, 'user.create', 'web', '2022-03-19 04:33:37', NULL),
(30, 'user.update', 'web', '2022-03-19 04:33:37', NULL),
(31, 'user.delete', 'web', '2022-03-19 04:33:37', NULL),
(32, 'supplier.view', 'web', '2022-03-19 04:33:37', NULL),
(33, 'supplier.create', 'web', '2022-03-19 04:33:37', NULL),
(34, 'supplier.update', 'web', '2022-03-19 04:33:37', NULL),
(35, 'supplier.delete', 'web', '2022-03-19 04:33:37', NULL),
(36, 'customer.view', 'web', '2022-03-19 04:33:37', NULL),
(37, 'customer.create', 'web', '2022-03-19 04:33:37', NULL),
(38, 'customer.update', 'web', '2022-03-19 04:33:37', NULL),
(39, 'customer.delete', 'web', '2022-03-19 04:33:37', NULL),
(40, 'product.view', 'web', '2022-03-19 04:33:37', NULL),
(41, 'product.create', 'web', '2022-03-19 04:33:37', NULL),
(42, 'product.update', 'web', '2022-03-19 04:33:37', NULL),
(43, 'product.delete', 'web', '2022-03-19 04:33:37', NULL),
(44, 'purchase.view', 'web', '2022-03-19 04:33:37', NULL),
(45, 'purchase.create', 'web', '2022-03-19 04:33:37', NULL),
(46, 'purchase.update', 'web', '2022-03-19 04:33:37', NULL),
(47, 'purchase.delete', 'web', '2022-03-19 04:33:37', NULL),
(48, 'sell.view', 'web', '2022-03-19 04:33:37', NULL),
(49, 'sell.create', 'web', '2022-03-19 04:33:37', NULL),
(50, 'sell.update', 'web', '2022-03-19 04:33:37', NULL),
(51, 'sell.delete', 'web', '2022-03-19 04:33:37', NULL),
(52, 'purchase_n_sell_report.view', 'web', '2022-03-19 04:33:37', NULL),
(53, 'contacts_report.view', 'web', '2022-03-19 04:33:37', NULL),
(54, 'stock_report.view', 'web', '2022-03-19 04:33:37', NULL),
(55, 'tax_report.view', 'web', '2022-03-19 04:33:37', NULL),
(56, 'trending_product_report.view', 'web', '2022-03-19 04:33:37', NULL),
(57, 'register_report.view', 'web', '2022-03-19 04:33:37', NULL),
(58, 'sales_representative.view', 'web', '2022-03-19 04:33:37', NULL),
(59, 'expense_report.view', 'web', '2022-03-19 04:33:37', NULL),
(60, 'business_settings.access', 'web', '2022-03-19 04:33:37', NULL),
(61, 'barcode_settings.access', 'web', '2022-03-19 04:33:37', NULL),
(62, 'invoice_settings.access', 'web', '2022-03-19 04:33:37', NULL),
(63, 'brand.view', 'web', '2022-03-19 04:33:37', NULL),
(64, 'brand.create', 'web', '2022-03-19 04:33:37', NULL),
(65, 'brand.update', 'web', '2022-03-19 04:33:37', NULL),
(66, 'brand.delete', 'web', '2022-03-19 04:33:37', NULL),
(67, 'tax_rate.view', 'web', '2022-03-19 04:33:37', NULL),
(68, 'tax_rate.create', 'web', '2022-03-19 04:33:37', NULL),
(69, 'tax_rate.update', 'web', '2022-03-19 04:33:37', NULL),
(70, 'tax_rate.delete', 'web', '2022-03-19 04:33:37', NULL),
(71, 'unit.view', 'web', '2022-03-19 04:33:37', NULL),
(72, 'unit.create', 'web', '2022-03-19 04:33:37', NULL),
(73, 'unit.update', 'web', '2022-03-19 04:33:37', NULL),
(74, 'unit.delete', 'web', '2022-03-19 04:33:37', NULL),
(75, 'category.view', 'web', '2022-03-19 04:33:37', NULL),
(76, 'category.create', 'web', '2022-03-19 04:33:37', NULL),
(77, 'category.update', 'web', '2022-03-19 04:33:37', NULL),
(78, 'category.delete', 'web', '2022-03-19 04:33:37', NULL),
(79, 'expense.access', 'web', '2022-03-19 04:33:37', NULL),
(80, 'access_all_locations', 'web', '2022-03-19 04:33:37', NULL),
(81, 'dashboard.data', 'web', '2022-03-19 04:33:37', NULL),
(82, 'location.1', 'web', '2022-03-19 04:38:49', '2022-03-19 04:38:49');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` enum('network','windows','linux') COLLATE utf8mb4_unicode_ci NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier','combo') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int(11) UNSIGNED DEFAULT NULL,
  `sub_unit_ids` text COLLATE utf8mb4_unicode_ci,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` int(10) UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT '0',
  `alert_quantity` decimal(22,4) DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT '0',
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `warranty_id` int(11) DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT '0',
  `not_for_selling` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `image`, `product_description`, `created_by`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(1, '001', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, '5.0000', '0001', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, '2022-03-19 04:46:00', '2022-04-27 10:00:53'),
(2, '002', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, '5.0000', '0002', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-04-13 13:25:35', '2022-04-13 13:26:32'),
(3, 'B85 Gaming Motherboard (1150)', 1, 'single', 1, NULL, 1, 1, 3, NULL, 'exclusive', 1, '2.0000', '0003', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-04-27 06:32:52', '2022-04-27 06:32:52'),
(4, 'Core i3 Processor', 1, 'single', 1, NULL, NULL, 2, 6, NULL, 'exclusive', 1, '2.0000', '0004', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-04-27 06:47:28', '2022-04-27 06:47:28'),
(5, 'Memory', 1, 'single', 1, NULL, 7, 7, 8, NULL, 'exclusive', 1, '5.0000', '0005', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-04-27 07:04:32', '2022-04-27 07:04:32'),
(6, 'Corsair VS 650 Powersupply', 1, 'single', 1, NULL, 4, 11, NULL, NULL, 'exclusive', 1, NULL, '0006', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-04-27 07:27:44', '2022-04-27 07:27:44'),
(7, 'Antec Symphony 240 ARGB', 1, 'single', 1, NULL, 9, 21, 22, NULL, 'inclusive', 1, '100.0000', '0007', 'C128', NULL, NULL, 0, NULL, '123456789', NULL, NULL, NULL, '1651297897_symphony-240-argb-pdt01.png', '<p>123</p>', 1, 3, 0, 0, '2022-04-30 05:51:37', '2022-05-01 03:13:55');

-- --------------------------------------------------------

--
-- Table structure for table `product_locations`
--

CREATE TABLE `product_locations` (
  `product_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_locations`
--

INSERT INTO `product_locations` (`product_id`, `location_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_racks`
--

CREATE TABLE `product_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `rack` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `row` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_template_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `variation_template_id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(1, NULL, 'DUMMY', 1, 1, '2022-03-19 04:46:00', '2022-03-19 04:46:00'),
(2, NULL, 'DUMMY', 2, 1, '2022-04-13 13:25:35', '2022-04-13 13:25:35'),
(3, NULL, 'DUMMY', 3, 1, '2022-04-27 06:32:52', '2022-04-27 06:32:52'),
(4, NULL, 'DUMMY', 4, 1, '2022-04-27 06:47:28', '2022-04-27 06:47:28'),
(5, NULL, 'DUMMY', 5, 1, '2022-04-27 07:04:32', '2022-04-27 07:04:32'),
(6, NULL, 'DUMMY', 6, 1, '2022-04-27 07:27:44', '2022-04-27 07:27:44'),
(7, NULL, 'DUMMY', 7, 1, '2022-04-30 05:51:37', '2022-04-30 05:51:37');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `pp_without_discount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) NOT NULL,
  `purchase_price_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `purchase_order_line_id` int(11) DEFAULT NULL,
  `quantity_sold` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `po_quantity_purchased` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_quantity_used` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `purchase_order_line_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `po_quantity_purchased`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '200.0000', '1000.0000', '0.00', '1000.0000', '1000.0000', '0.0000', NULL, NULL, '60.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-03-19 04:47:31', '2022-04-27 10:05:30'),
(2, 272, 2, 2, '18.0000', '10.0000', '0.00', '10.0000', '10.0000', '0.0000', NULL, NULL, '10.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-04-13 13:33:50', '2022-04-27 10:02:47'),
(3, 448, 3, 3, '5.0000', '10500.0000', '0.00', '10500.0000', '10500.0000', '0.0000', NULL, NULL, '1.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-04-27 06:33:25', '2022-04-27 07:37:08'),
(4, 449, 4, 4, '5.0000', '5200.0000', '0.00', '5200.0000', '5200.0000', '0.0000', NULL, NULL, '2.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-04-27 06:47:51', '2022-05-01 03:16:43'),
(5, 450, 5, 5, '5.0000', '4500.0000', '0.00', '4500.0000', '4500.0000', '0.0000', NULL, NULL, '1.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-04-27 07:04:46', '2022-04-27 07:37:08'),
(6, 451, 6, 6, '5.0000', '3500.0000', '0.00', '3500.0000', '3500.0000', '0.0000', NULL, NULL, '1.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-04-27 07:29:09', '2022-04-27 07:37:08'),
(7, 454, 7, 7, '1000.0000', '21000.0000', '0.00', '21000.0000', '21000.0000', '0.0000', NULL, NULL, '3.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-05-01 02:04:56', '2022-05-01 03:14:40');

-- --------------------------------------------------------

--
-- Table structure for table `reference_counts`
--

CREATE TABLE `reference_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ref_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_count` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'contacts', 11, 1, '2022-03-19 04:38:49', '2022-04-27 07:32:36'),
(2, 'business_location', 1, 1, '2022-03-19 04:38:49', '2022-03-19 04:38:49'),
(3, 'sell_payment', 88, 1, '2022-03-19 04:47:51', '2022-05-01 03:16:43'),
(4, 'draft', 363, 1, '2022-04-11 07:34:18', '2022-04-27 07:35:55');

-- --------------------------------------------------------

--
-- Table structure for table `res_product_modifier_sets`
--

CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `res_tables`
--

CREATE TABLE `res_tables` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_service_staff` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `created_at`, `updated_at`) VALUES
(1, 'Admin#1', 'web', 1, 1, 0, '2022-03-19 04:38:49', '2022-03-19 04:38:49'),
(2, 'Cashier#1', 'web', 1, 0, 0, '2022-03-19 04:38:49', '2022-03-19 04:38:49');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(25, 2),
(26, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(80, 2);

-- --------------------------------------------------------

--
-- Table structure for table `selling_price_groups`
--

CREATE TABLE `selling_price_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_line_warranties`
--

CREATE TABLE `sell_line_warranties` (
  `sell_line_id` int(11) NOT NULL,
  `warranty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sell_line_warranties`
--

INSERT INTO `sell_line_warranties` (`sell_line_id`, `warranty_id`) VALUES
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 2),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(171, 1),
(172, 1),
(173, 1),
(174, 1),
(175, 1),
(176, 1),
(177, 1),
(178, 1),
(179, 1),
(180, 1),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(187, 1),
(188, 1),
(189, 1),
(190, 1),
(191, 1),
(192, 1),
(193, 1),
(194, 1),
(195, 1),
(196, 1),
(197, 1),
(198, 1),
(199, 1),
(200, 1),
(201, 1),
(202, 1),
(203, 1),
(204, 1),
(205, 1),
(206, 1),
(207, 1),
(208, 1),
(209, 1),
(210, 1),
(211, 1),
(212, 1),
(213, 1),
(214, 1),
(215, 1),
(216, 1),
(217, 1),
(218, 1),
(219, 1),
(220, 1),
(221, 1),
(222, 1),
(223, 1),
(224, 1),
(225, 1),
(226, 1),
(227, 1),
(228, 1),
(229, 1),
(230, 1),
(231, 1),
(232, 1),
(233, 1),
(234, 1),
(235, 1),
(236, 1),
(237, 1),
(238, 1),
(239, 1),
(240, 1),
(241, 1),
(242, 1),
(243, 1),
(244, 1),
(245, 1),
(246, 1),
(247, 1),
(248, 1),
(249, 1),
(250, 1),
(251, 1),
(252, 1),
(253, 1),
(254, 1),
(255, 1),
(256, 1),
(257, 1),
(258, 1),
(259, 1),
(260, 1),
(261, 1),
(262, 1),
(263, 1),
(264, 1),
(265, 1),
(266, 1),
(267, 1),
(268, 1),
(269, 1),
(270, 1),
(271, 1),
(273, 1),
(274, 1),
(275, 1),
(276, 1),
(277, 1),
(278, 1),
(279, 1),
(280, 1),
(281, 1),
(284, 1),
(285, 1),
(286, 1),
(287, 1),
(288, 1),
(289, 1),
(290, 1),
(291, 1),
(292, 1),
(293, 1),
(294, 1),
(295, 1),
(296, 1),
(297, 1),
(298, 1),
(299, 1),
(300, 1),
(301, 1),
(302, 1),
(303, 1),
(304, 1),
(305, 1),
(306, 1),
(307, 1),
(308, 1),
(309, 1),
(310, 1),
(311, 1),
(312, 1),
(313, 1),
(314, 1),
(315, 1),
(316, 1),
(317, 1),
(318, 1),
(319, 1),
(320, 1),
(321, 1),
(322, 1),
(323, 1),
(324, 1),
(325, 1),
(327, 1),
(328, 1),
(329, 1),
(330, 1),
(331, 1),
(332, 1),
(333, 1),
(335, 1),
(337, 1),
(338, 1),
(339, 1),
(340, 1),
(341, 1),
(342, 1),
(344, 1),
(346, 1),
(347, 1),
(349, 1),
(351, 1),
(353, 1),
(355, 1),
(357, 1),
(359, 1),
(361, 1),
(363, 1),
(365, 1),
(367, 1),
(369, 1),
(370, 1),
(371, 1),
(373, 1),
(375, 1),
(376, 1),
(378, 1),
(380, 1),
(382, 1),
(384, 1),
(386, 1),
(388, 1),
(390, 1),
(392, 1),
(394, 1),
(395, 1),
(397, 1),
(399, 1),
(401, 1),
(403, 1),
(404, 1),
(405, 1),
(406, 1),
(407, 1),
(408, 1),
(409, 1),
(410, 1),
(411, 1),
(412, 1),
(413, 1),
(414, 1),
(415, 1),
(416, 1),
(417, 1),
(418, 1),
(419, 1),
(420, 1),
(421, 1),
(422, 1),
(423, 1),
(424, 1),
(425, 1),
(426, 1),
(427, 1),
(429, 1),
(431, 1),
(432, 1),
(433, 1),
(435, 1),
(436, 1),
(437, 1),
(438, 1),
(439, 1),
(440, 1),
(441, 1),
(442, 1),
(443, 1),
(444, 1),
(445, 1),
(446, 1),
(447, 1),
(449, 1),
(450, 1),
(451, 1),
(452, 1),
(453, 1),
(454, 1),
(455, 1),
(456, 1),
(457, 1),
(459, 1),
(460, 1),
(461, 1),
(462, 1),
(464, 1),
(466, 2),
(471, 1),
(472, 1),
(473, 1),
(474, 1),
(475, 1),
(476, 1),
(477, 1),
(479, 1),
(481, 1),
(482, 1),
(484, 1),
(486, 1),
(488, 1),
(490, 1),
(493, 5),
(494, 5),
(495, 5),
(496, 5),
(502, 3),
(503, 3),
(504, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments_temp`
--

CREATE TABLE `stock_adjustments_temp` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_lines`
--

CREATE TABLE `stock_adjustment_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`id`, `key`, `value`) VALUES
(1, 'db_version', '4.7.6'),
(2, 'default_business_active_status', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT '0',
  `for_tax_group` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `res_table_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT '0',
  `payment_status` enum('paid','due','partial') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int(11) UNSIGNED DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_repeat_on` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) DEFAULT '0.0000',
  `rp_redeemed` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_charges` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `shipping_custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_notes` text COLLATE utf8mb4_unicode_ci,
  `staff_note` text COLLATE utf8mb4_unicode_ci,
  `is_export` tinyint(1) NOT NULL DEFAULT '0',
  `export_custom_fields_info` longtext COLLATE utf8mb4_unicode_ci,
  `round_off_amount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Difference of rounded total and actual total',
  `additional_expense_key_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_1` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `additional_expense_key_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_2` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `additional_expense_key_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_3` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `additional_expense_key_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_4` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `final_total` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `expense_category_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_sub_category_id` int(11) DEFAULT NULL,
  `expense_for` int(10) UNSIGNED DEFAULT NULL,
  `commission_agent` int(11) DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspend` tinyint(1) NOT NULL DEFAULT '0',
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `total_amount_recovered` decimal(22,4) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int(11) DEFAULT NULL,
  `return_parent_id` int(11) DEFAULT NULL,
  `opening_stock_product_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `prefer_payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefer_payment_account` int(11) DEFAULT NULL,
  `sales_order_ids` text COLLATE utf8mb4_unicode_ci,
  `purchase_order_ids` text COLLATE utf8mb4_unicode_ci,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_batch` int(11) DEFAULT NULL,
  `import_time` datetime DEFAULT NULL,
  `types_of_service_id` int(11) DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_1` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_2` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_3` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_4` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_5` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_6` text COLLATE utf8mb4_unicode_ci,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT '0',
  `rp_earned` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `order_addresses` text COLLATE utf8mb4_unicode_ci,
  `is_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recur_repetitions` int(11) DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int(11) DEFAULT NULL,
  `invoice_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `source`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `is_export`, `export_custom_fields_info`, `round_off_amount`, `additional_expense_key_1`, `additional_expense_value_1`, `additional_expense_key_2`, `additional_expense_value_2`, `additional_expense_key_3`, `additional_expense_value_3`, `additional_expense_key_4`, `additional_expense_value_4`, `final_total`, `expense_category_id`, `expense_sub_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `prefer_payment_method`, `prefer_payment_account`, `sales_order_ids`, `purchase_order_ids`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `service_custom_field_5`, `service_custom_field_6`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:17:31', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '200000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-19 04:47:31', '2022-03-19 04:47:31'),
(2, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0001', '', NULL, NULL, NULL, '2022-03-19 10:17:51', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-19 04:47:51', '2022-03-19 04:47:51'),
(3, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0002', '', NULL, NULL, NULL, '2022-03-19 10:30:03', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-19 05:00:03', '2022-03-19 05:00:03'),
(4, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0003', '', NULL, NULL, NULL, '2022-03-19 10:47:47', '2000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-19 05:17:47', '2022-03-19 05:17:47'),
(5, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0004', '', NULL, NULL, NULL, '2022-03-19 10:52:14', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-19 05:22:14', '2022-03-19 05:22:14'),
(6, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0005', '', NULL, NULL, NULL, '2022-03-19 10:54:51', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-19 05:24:51', '2022-03-19 05:24:51'),
(7, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0006', '', NULL, NULL, NULL, '2022-03-19 10:56:44', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-19 05:26:44', '2022-03-19 05:26:44'),
(8, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0007', '', NULL, NULL, NULL, '2022-03-19 10:57:33', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-19 05:27:33', '2022-03-19 05:27:33'),
(9, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0001', '', NULL, NULL, NULL, '2022-04-11 13:04:18', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'a8cfaf12642c4ef8bdbbf4ea6f614431', NULL, NULL, 0, '2022-04-11 07:34:18', '2022-04-27 10:06:28'),
(10, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0002', '', NULL, NULL, NULL, '2022-04-11 13:17:04', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 07:47:04', '2022-04-11 07:47:04'),
(11, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0003', '', NULL, NULL, NULL, '2022-04-11 13:17:37', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 07:47:37', '2022-04-11 07:47:37'),
(12, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0004', '', NULL, NULL, NULL, '2022-04-11 13:20:48', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 07:50:48', '2022-04-11 07:50:48'),
(13, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0005', '', NULL, NULL, NULL, '2022-04-11 13:27:23', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 07:57:23', '2022-04-11 07:57:23'),
(14, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0006', '', NULL, NULL, NULL, '2022-04-11 13:27:56', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 07:57:56', '2022-04-11 07:57:56'),
(15, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0007', '', NULL, NULL, NULL, '2022-04-11 13:28:57', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 07:58:57', '2022-04-11 07:58:57'),
(16, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0008', '', NULL, NULL, NULL, '2022-04-11 13:41:35', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:11:35', '2022-04-11 08:11:35'),
(17, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0009', '', NULL, NULL, NULL, '2022-04-11 13:50:29', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:20:29', '2022-04-11 08:20:29'),
(18, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0010', '', NULL, NULL, NULL, '2022-04-11 13:51:30', '2000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:21:30', '2022-04-11 08:21:30'),
(19, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0011', '', NULL, NULL, NULL, '2022-04-11 13:52:38', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:22:38', '2022-04-11 08:22:38'),
(20, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0012', '', NULL, NULL, NULL, '2022-04-11 13:54:08', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:24:08', '2022-04-11 08:24:08'),
(21, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0013', '', NULL, NULL, NULL, '2022-04-11 13:58:32', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:28:32', '2022-04-11 08:28:32'),
(22, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0014', '', NULL, NULL, NULL, '2022-04-11 14:02:14', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:32:14', '2022-04-11 08:32:14'),
(23, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0015', '', NULL, NULL, NULL, '2022-04-11 14:03:49', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:33:49', '2022-04-11 08:33:49'),
(24, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0016', '', NULL, NULL, NULL, '2022-04-11 14:05:21', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:35:21', '2022-04-11 08:35:21'),
(25, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0017', '', NULL, NULL, NULL, '2022-04-11 14:05:59', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:35:59', '2022-04-11 08:35:59'),
(26, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0018', '', NULL, NULL, NULL, '2022-04-11 14:06:30', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:36:30', '2022-04-11 08:36:30'),
(27, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0019', '', NULL, NULL, NULL, '2022-04-11 14:08:15', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:38:15', '2022-04-11 08:38:15'),
(28, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0020', '', NULL, NULL, NULL, '2022-04-11 14:09:21', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:39:21', '2022-04-11 08:39:21'),
(29, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0021', '', NULL, NULL, NULL, '2022-04-11 14:09:44', '2000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:39:44', '2022-04-11 08:39:44'),
(30, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0022', '', NULL, NULL, NULL, '2022-04-11 14:10:18', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:40:18', '2022-04-11 08:40:18'),
(31, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0023', '', NULL, NULL, NULL, '2022-04-11 14:10:47', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:40:47', '2022-04-11 08:40:47'),
(32, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0024', '', NULL, NULL, NULL, '2022-04-11 14:10:56', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:40:56', '2022-04-11 08:40:56'),
(33, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0025', '', NULL, NULL, NULL, '2022-04-11 14:11:26', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:41:26', '2022-04-11 08:41:26'),
(34, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0026', '', NULL, NULL, NULL, '2022-04-11 14:11:58', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:41:58', '2022-04-11 08:41:58'),
(35, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0027', '', NULL, NULL, NULL, '2022-04-11 14:13:00', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:43:00', '2022-04-11 08:43:00'),
(36, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0028', '', NULL, NULL, NULL, '2022-04-11 14:14:55', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:44:55', '2022-04-11 08:44:55'),
(37, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0029', '', NULL, NULL, NULL, '2022-04-11 14:16:02', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:46:02', '2022-04-11 08:46:02'),
(38, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0030', '', NULL, NULL, NULL, '2022-04-11 14:18:39', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:48:39', '2022-04-11 08:48:39'),
(39, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0031', '', NULL, NULL, NULL, '2022-04-11 14:19:53', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:49:53', '2022-04-11 08:49:53'),
(40, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0032', '', NULL, NULL, NULL, '2022-04-11 14:20:28', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:50:28', '2022-04-11 08:50:28'),
(41, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0033', '', NULL, NULL, NULL, '2022-04-11 14:25:22', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:55:22', '2022-04-11 08:55:22'),
(42, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0034', '', NULL, NULL, NULL, '2022-04-11 14:27:22', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 08:57:22', '2022-04-11 08:57:22'),
(43, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0035', '', NULL, NULL, NULL, '2022-04-11 14:31:03', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:01:03', '2022-04-11 09:01:03'),
(44, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0036', '', NULL, NULL, NULL, '2022-04-11 14:32:55', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:02:55', '2022-04-11 09:02:55'),
(45, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0008', '', NULL, NULL, NULL, '2022-04-11 14:33:40', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:03:40', '2022-04-11 09:03:40'),
(46, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0009', '', NULL, NULL, NULL, '2022-04-11 14:40:33', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:10:33', '2022-04-11 09:10:33'),
(47, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0037', '', NULL, NULL, NULL, '2022-04-11 14:55:46', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:25:46', '2022-04-11 09:25:46'),
(48, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0010', '', NULL, NULL, NULL, '2022-04-11 14:56:48', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:26:48', '2022-04-11 09:26:48'),
(49, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0038', '', NULL, NULL, NULL, '2022-04-11 14:59:25', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:29:25', '2022-04-11 09:29:25'),
(50, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0039', '', NULL, NULL, NULL, '2022-04-11 15:00:03', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:30:03', '2022-04-11 09:30:03'),
(51, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0011', '', NULL, NULL, NULL, '2022-04-11 15:00:47', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:30:47', '2022-04-11 09:30:47'),
(52, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0040', '', NULL, NULL, NULL, '2022-04-11 15:03:08', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:33:08', '2022-04-11 09:33:08'),
(53, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0041', '', NULL, NULL, NULL, '2022-04-11 15:04:36', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:34:36', '2022-04-11 09:34:36'),
(54, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0042', '', NULL, NULL, NULL, '2022-04-11 15:04:43', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:34:43', '2022-04-11 09:34:43'),
(55, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0043', '', NULL, NULL, NULL, '2022-04-11 15:05:01', '2000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:35:01', '2022-04-11 09:35:01'),
(56, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0044', '', NULL, NULL, NULL, '2022-04-11 15:05:53', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:35:53', '2022-04-11 09:35:53'),
(57, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0045', '', NULL, NULL, NULL, '2022-04-11 15:09:13', '2000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:39:13', '2022-04-11 09:39:13'),
(58, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0046', '', NULL, NULL, NULL, '2022-04-11 15:15:52', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:45:52', '2022-04-11 09:45:52'),
(59, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0047', '', NULL, NULL, NULL, '2022-04-11 15:17:45', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:47:45', '2022-04-11 09:47:45'),
(60, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0048', '', NULL, NULL, NULL, '2022-04-11 15:18:09', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:48:09', '2022-04-11 09:48:09'),
(61, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0049', '', NULL, NULL, NULL, '2022-04-11 15:18:56', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:48:56', '2022-04-11 09:48:56'),
(62, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0050', '', NULL, NULL, NULL, '2022-04-11 15:20:54', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:50:54', '2022-04-11 09:50:54'),
(63, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0051', '', NULL, NULL, NULL, '2022-04-11 15:22:15', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:52:15', '2022-04-11 09:52:15'),
(64, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0052', '', NULL, NULL, NULL, '2022-04-11 15:24:32', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:54:32', '2022-04-11 09:54:32'),
(65, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0053', '', NULL, NULL, NULL, '2022-04-11 15:25:27', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:55:27', '2022-04-11 09:55:27'),
(66, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0054', '', NULL, NULL, NULL, '2022-04-11 15:25:44', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:55:44', '2022-04-11 09:55:44'),
(67, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0055', '', NULL, NULL, NULL, '2022-04-11 15:26:31', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:56:31', '2022-04-11 09:56:31'),
(68, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0056', '', NULL, NULL, NULL, '2022-04-11 15:27:31', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 09:57:31', '2022-04-11 09:57:31'),
(69, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0057', '', NULL, NULL, NULL, '2022-04-11 16:02:00', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 10:32:00', '2022-04-11 10:32:00'),
(70, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0058', '', NULL, NULL, NULL, '2022-04-11 16:06:32', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 10:36:32', '2022-04-11 10:36:32');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `source`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `is_export`, `export_custom_fields_info`, `round_off_amount`, `additional_expense_key_1`, `additional_expense_value_1`, `additional_expense_key_2`, `additional_expense_value_2`, `additional_expense_key_3`, `additional_expense_value_3`, `additional_expense_key_4`, `additional_expense_value_4`, `final_total`, `expense_category_id`, `expense_sub_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `prefer_payment_method`, `prefer_payment_account`, `sales_order_ids`, `purchase_order_ids`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `service_custom_field_5`, `service_custom_field_6`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(71, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0059', '', NULL, NULL, NULL, '2022-04-11 16:07:40', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 10:37:40', '2022-04-11 10:37:40'),
(72, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0060', '', NULL, NULL, NULL, '2022-04-11 16:11:34', '2000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 10:41:34', '2022-04-11 10:41:34'),
(73, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0061', '', NULL, NULL, NULL, '2022-04-11 16:12:53', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 10:42:53', '2022-04-11 10:42:53'),
(74, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0062', '', NULL, NULL, NULL, '2022-04-11 16:16:59', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 10:47:00', '2022-04-11 10:47:00'),
(75, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0063', '', NULL, NULL, NULL, '2022-04-11 16:17:21', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 10:47:21', '2022-04-11 10:47:21'),
(76, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0064', '', NULL, NULL, NULL, '2022-04-11 16:24:35', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 10:54:35', '2022-04-11 10:54:35'),
(77, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0065', '', NULL, NULL, NULL, '2022-04-11 16:26:50', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 10:56:50', '2022-04-11 10:56:50'),
(78, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0066', '', NULL, NULL, NULL, '2022-04-11 16:29:12', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 10:59:12', '2022-04-11 10:59:12'),
(79, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0067', '', NULL, NULL, NULL, '2022-04-11 16:31:01', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 11:01:01', '2022-04-11 11:01:01'),
(80, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0012', '', NULL, NULL, NULL, '2022-04-11 16:31:10', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 11:01:10', '2022-04-11 11:01:10'),
(81, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0068', '', NULL, NULL, NULL, '2022-04-11 16:31:40', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 11:01:40', '2022-04-11 11:01:40'),
(82, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0069', '', NULL, NULL, NULL, '2022-04-11 16:39:11', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 11:09:11', '2022-04-11 11:09:11'),
(83, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0070', '', NULL, NULL, NULL, '2022-04-11 16:40:12', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 11:10:12', '2022-04-11 11:10:12'),
(84, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0071', '', NULL, NULL, NULL, '2022-04-11 16:40:48', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 11:10:48', '2022-04-11 11:10:48'),
(85, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0072', '', NULL, NULL, NULL, '2022-04-11 16:50:52', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 11:20:52', '2022-04-11 11:20:52'),
(86, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0073', '', NULL, NULL, NULL, '2022-04-11 16:52:26', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 11:22:26', '2022-04-11 11:22:26'),
(87, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0074', '', NULL, NULL, NULL, '2022-04-11 16:53:52', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 11:23:52', '2022-04-11 11:23:52'),
(88, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0075', '', NULL, NULL, NULL, '2022-04-11 16:57:55', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 11:27:55', '2022-04-11 11:27:55'),
(89, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 2, NULL, '2022/0076', '', NULL, NULL, NULL, '2022-04-11 16:59:36', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 11:29:36', '2022-04-11 11:29:36'),
(90, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0013', '', NULL, NULL, NULL, '2022-04-11 17:01:20', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 11:31:20', '2022-04-11 11:31:20'),
(91, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0077', '', NULL, NULL, NULL, '2022-04-11 17:02:56', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 11:32:56', '2022-04-11 11:32:56'),
(92, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 3, NULL, '2022/0078', '', NULL, NULL, NULL, '2022-04-11 17:04:37', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 11:34:37', '2022-04-11 11:34:37'),
(93, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 4, NULL, '2022/0079', '', NULL, NULL, NULL, '2022-04-11 17:06:22', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, 'wewassagama,vineethagama,badulla', NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 11:36:22', '2022-04-11 11:36:22'),
(94, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 5, NULL, '2022/0080', '', NULL, NULL, NULL, '2022-04-11 17:08:38', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 11:38:38', '2022-04-11 11:38:38'),
(95, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 6, NULL, '2022/0081', '', NULL, NULL, NULL, '2022-04-11 17:11:22', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 11:41:22', '2022-04-11 11:41:22'),
(96, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0082', '', NULL, NULL, NULL, '2022-04-11 17:26:59', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 11:56:59', '2022-04-11 11:56:59'),
(97, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0083', '', NULL, NULL, NULL, '2022-04-11 17:29:47', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-11 11:59:47', '2022-04-11 11:59:47'),
(98, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0084', '', NULL, NULL, NULL, '2022-04-12 08:19:51', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-12 02:49:51', '2022-04-12 02:49:51'),
(99, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0085', '', NULL, NULL, NULL, '2022-04-12 08:21:25', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-12 02:51:25', '2022-04-12 02:51:25'),
(100, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 7, NULL, '0014', '', NULL, NULL, NULL, '2022-04-12 08:30:25', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', '46464', '165445', 'ordered', NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-12 03:00:25', '2022-04-12 03:00:25'),
(101, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0086', '', NULL, NULL, NULL, '2022-04-12 08:41:33', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-12 03:11:33', '2022-04-12 03:11:33'),
(102, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0087', '', NULL, NULL, NULL, '2022-04-12 08:42:01', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-12 03:12:01', '2022-04-12 03:12:01'),
(103, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0088', '', NULL, NULL, NULL, '2022-04-12 08:46:58', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-12 03:16:58', '2022-04-12 03:16:58'),
(104, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0089', '', NULL, NULL, NULL, '2022-04-12 08:47:50', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-12 03:17:50', '2022-04-12 03:17:50'),
(105, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0090', '', NULL, NULL, NULL, '2022-04-12 08:48:10', '2000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-12 03:18:10', '2022-04-12 03:18:10'),
(106, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0091', '', NULL, NULL, NULL, '2022-04-12 08:59:37', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-12 03:29:37', '2022-04-12 03:29:37'),
(107, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0092', '', NULL, NULL, NULL, '2022-04-12 09:01:13', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-12 03:31:13', '2022-04-12 03:31:13'),
(108, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0093', '', NULL, NULL, NULL, '2022-04-12 09:06:08', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-12 03:36:08', '2022-04-12 03:36:08'),
(109, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0094', '', NULL, NULL, NULL, '2022-04-12 09:10:13', '2000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-12 03:40:13', '2022-04-12 03:40:13'),
(110, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0095', '', NULL, NULL, NULL, '2022-04-12 09:11:35', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-12 03:41:35', '2022-04-12 03:41:35'),
(111, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0096', '', NULL, NULL, NULL, '2022-04-12 09:16:07', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-12 03:46:07', '2022-04-12 03:46:07'),
(112, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0097', '', NULL, NULL, NULL, '2022-04-12 09:16:20', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-12 03:46:20', '2022-04-12 03:46:20'),
(113, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0098', '', NULL, NULL, NULL, '2022-04-12 09:20:07', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-12 03:50:07', '2022-04-12 03:50:07'),
(114, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0099', '', NULL, NULL, NULL, '2022-04-12 09:27:44', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-12 03:57:44', '2022-04-12 03:57:44'),
(115, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0100', '', NULL, NULL, NULL, '2022-04-12 09:29:47', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-12 03:59:47', '2022-04-12 03:59:47'),
(116, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0101', '', NULL, NULL, NULL, '2022-04-12 09:31:38', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-12 04:01:38', '2022-04-12 04:01:38'),
(117, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0102', '', NULL, NULL, NULL, '2022-04-12 09:41:41', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-12 04:11:41', '2022-04-12 04:11:41'),
(118, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0015', '', NULL, NULL, NULL, '2022-04-12 09:45:58', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-12 04:15:58', '2022-04-12 04:15:58'),
(119, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0103', '', NULL, NULL, NULL, '2022-04-13 10:00:41', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 04:30:41', '2022-04-13 04:30:41'),
(120, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0104', '', NULL, NULL, NULL, '2022-04-13 10:00:51', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 04:30:51', '2022-04-13 04:30:51'),
(121, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0016', '', NULL, NULL, NULL, '2022-04-13 10:00:58', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 04:30:58', '2022-04-13 04:30:58'),
(122, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0105', '', NULL, NULL, NULL, '2022-04-13 10:26:09', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 04:56:09', '2022-04-13 04:56:09'),
(123, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0106', '', NULL, NULL, NULL, '2022-04-13 10:26:30', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 04:56:30', '2022-04-13 04:56:30'),
(124, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0107', '', NULL, NULL, NULL, '2022-04-13 10:27:44', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 04:57:44', '2022-04-13 04:57:44'),
(125, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0108', '', NULL, NULL, NULL, '2022-04-13 10:28:18', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 04:58:18', '2022-04-13 04:58:18'),
(126, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0109', '', NULL, NULL, NULL, '2022-04-13 12:21:21', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 06:51:21', '2022-04-13 06:51:21'),
(127, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0110', '', NULL, NULL, NULL, '2022-04-13 12:22:03', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 06:52:03', '2022-04-13 06:52:03'),
(128, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0111', '', NULL, NULL, NULL, '2022-04-13 13:46:15', '2000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 08:16:15', '2022-04-13 08:16:15'),
(129, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0112', '', NULL, NULL, NULL, '2022-04-13 13:55:56', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 08:25:56', '2022-04-13 08:25:56'),
(130, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0113', '', NULL, NULL, NULL, '2022-04-13 13:58:41', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 08:28:41', '2022-04-13 08:28:41'),
(131, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0114', '', NULL, NULL, NULL, '2022-04-13 14:11:10', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 08:41:10', '2022-04-13 08:41:10'),
(132, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0115', '', NULL, NULL, NULL, '2022-04-13 14:12:35', '3000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '3000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 08:42:35', '2022-04-13 08:42:35'),
(133, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0116', '', NULL, NULL, NULL, '2022-04-13 14:17:29', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 08:47:29', '2022-04-13 08:47:29'),
(134, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0117', '', NULL, NULL, NULL, '2022-04-13 14:18:16', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 08:48:16', '2022-04-13 08:48:16'),
(135, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0118', '', NULL, NULL, NULL, '2022-04-13 14:19:37', '2000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 08:49:37', '2022-04-13 08:49:37'),
(136, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0119', '', NULL, NULL, NULL, '2022-04-13 14:21:45', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 08:51:45', '2022-04-13 08:51:45'),
(137, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0120', '', NULL, NULL, NULL, '2022-04-13 14:30:51', '2000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 09:00:51', '2022-04-13 09:00:51'),
(138, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0121', '', NULL, NULL, NULL, '2022-04-13 14:33:12', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 09:03:12', '2022-04-13 09:03:12'),
(139, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0122', '', NULL, NULL, NULL, '2022-04-13 14:49:37', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 09:19:37', '2022-04-13 09:19:37');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `source`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `is_export`, `export_custom_fields_info`, `round_off_amount`, `additional_expense_key_1`, `additional_expense_value_1`, `additional_expense_key_2`, `additional_expense_value_2`, `additional_expense_key_3`, `additional_expense_value_3`, `additional_expense_key_4`, `additional_expense_value_4`, `final_total`, `expense_category_id`, `expense_sub_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `prefer_payment_method`, `prefer_payment_account`, `sales_order_ids`, `purchase_order_ids`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `service_custom_field_5`, `service_custom_field_6`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(140, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0123', '', NULL, NULL, NULL, '2022-04-13 14:53:57', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 09:23:57', '2022-04-13 09:23:57'),
(141, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0124', '', NULL, NULL, NULL, '2022-04-13 14:55:49', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 09:25:49', '2022-04-13 09:25:49'),
(142, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0125', '', NULL, NULL, NULL, '2022-04-13 14:57:18', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 09:27:18', '2022-04-13 09:27:18'),
(143, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0126', '', NULL, NULL, NULL, '2022-04-13 14:58:13', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 09:28:13', '2022-04-13 09:28:13'),
(144, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0127', '', NULL, NULL, NULL, '2022-04-13 15:00:33', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 09:30:33', '2022-04-13 09:30:33'),
(145, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0128', '', NULL, NULL, NULL, '2022-04-13 15:00:45', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 09:30:45', '2022-04-13 09:30:45'),
(146, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0129', '', NULL, NULL, NULL, '2022-04-13 15:02:07', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 09:32:07', '2022-04-13 09:32:07'),
(147, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0130', '', NULL, NULL, NULL, '2022-04-13 15:03:01', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 09:33:01', '2022-04-13 09:33:01'),
(148, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0131', '', NULL, NULL, NULL, '2022-04-13 15:12:56', '2000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 09:42:56', '2022-04-13 09:42:56'),
(149, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0132', '', NULL, NULL, NULL, '2022-04-13 15:14:13', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 09:44:13', '2022-04-13 09:44:13'),
(150, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0133', '', NULL, NULL, NULL, '2022-04-13 15:15:33', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 09:45:33', '2022-04-13 09:45:33'),
(151, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0134', '', NULL, NULL, NULL, '2022-04-13 15:16:00', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 09:46:00', '2022-04-13 09:46:00'),
(152, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0135', '', NULL, NULL, NULL, '2022-04-13 15:17:37', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 09:47:37', '2022-04-13 09:47:37'),
(153, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0136', '', NULL, NULL, NULL, '2022-04-13 15:21:27', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 09:51:27', '2022-04-13 09:51:27'),
(154, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0137', '', NULL, NULL, NULL, '2022-04-13 15:23:41', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 09:53:41', '2022-04-13 09:53:41'),
(155, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0138', '', NULL, NULL, NULL, '2022-04-13 15:26:28', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 09:56:28', '2022-04-13 09:56:28'),
(156, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0139', '', NULL, NULL, NULL, '2022-04-13 15:28:33', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 09:58:33', '2022-04-13 09:58:33'),
(157, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0140', '', NULL, NULL, NULL, '2022-04-13 15:29:15', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 09:59:15', '2022-04-13 09:59:15'),
(158, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0141', '', NULL, NULL, NULL, '2022-04-13 16:01:35', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 10:31:35', '2022-04-13 10:31:35'),
(159, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0017', '', NULL, NULL, NULL, '2022-04-13 16:07:34', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 10:37:34', '2022-04-13 10:37:34'),
(160, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0142', '', NULL, NULL, NULL, '2022-04-13 16:07:46', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 10:37:46', '2022-04-13 10:37:46'),
(161, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', NULL, 0, NULL, NULL, 1, NULL, '2022/0143', '', NULL, NULL, NULL, '2022-04-13 16:08:11', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 10:38:11', '2022-04-13 10:38:11'),
(162, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0144', '', NULL, NULL, NULL, '2022-04-13 16:21:59', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 10:51:59', '2022-04-13 10:51:59'),
(163, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0145', '', NULL, NULL, NULL, '2022-04-13 16:22:51', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 10:52:51', '2022-04-13 10:52:51'),
(164, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0146', '', NULL, NULL, NULL, '2022-04-13 16:25:32', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 10:55:32', '2022-04-13 10:55:32'),
(165, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0147', '', NULL, NULL, NULL, '2022-04-13 16:28:20', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 10:58:20', '2022-04-13 10:58:20'),
(166, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0148', '', NULL, NULL, NULL, '2022-04-13 16:36:16', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:06:16', '2022-04-13 11:06:16'),
(167, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0149', '', NULL, NULL, NULL, '2022-04-13 16:41:06', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:11:06', '2022-04-13 11:11:06'),
(168, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0150', '', NULL, NULL, NULL, '2022-04-13 16:43:53', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:13:53', '2022-04-13 11:13:53'),
(169, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0151', '', NULL, NULL, NULL, '2022-04-13 16:44:48', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:14:48', '2022-04-13 11:14:48'),
(170, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0152', '', NULL, NULL, NULL, '2022-04-13 16:45:16', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:15:16', '2022-04-13 11:15:16'),
(171, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0153', '', NULL, NULL, NULL, '2022-04-13 16:51:45', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:21:45', '2022-04-13 11:21:45'),
(172, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0154', '', NULL, NULL, NULL, '2022-04-13 16:52:33', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:22:33', '2022-04-13 11:22:33'),
(173, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0155', '', NULL, NULL, NULL, '2022-04-13 16:54:28', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:24:29', '2022-04-13 11:24:29'),
(174, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0156', '', NULL, NULL, NULL, '2022-04-13 16:55:03', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:25:03', '2022-04-13 11:25:03'),
(175, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0157', '', NULL, NULL, NULL, '2022-04-13 16:55:29', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:25:29', '2022-04-13 11:25:29'),
(176, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0158', '', NULL, NULL, NULL, '2022-04-13 16:56:40', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:26:40', '2022-04-13 11:26:40'),
(177, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0159', '', NULL, NULL, NULL, '2022-04-13 16:57:11', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:27:11', '2022-04-13 11:27:11'),
(178, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0160', '', NULL, NULL, NULL, '2022-04-13 16:58:35', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:28:35', '2022-04-13 11:28:35'),
(179, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0161', '', NULL, NULL, NULL, '2022-04-13 16:59:53', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:29:53', '2022-04-13 11:29:53'),
(180, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0162', '', NULL, NULL, NULL, '2022-04-13 17:00:56', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:30:56', '2022-04-13 11:30:56'),
(181, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0163', '', NULL, NULL, NULL, '2022-04-13 17:01:23', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:31:23', '2022-04-13 11:31:23'),
(182, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0164', '', NULL, NULL, NULL, '2022-04-13 17:01:45', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:31:45', '2022-04-13 11:31:45'),
(183, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0165', '', NULL, NULL, NULL, '2022-04-13 17:02:11', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:32:11', '2022-04-13 11:32:11'),
(184, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0166', '', NULL, NULL, NULL, '2022-04-13 17:03:04', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:33:04', '2022-04-13 11:33:04'),
(185, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0167', '', NULL, NULL, NULL, '2022-04-13 17:03:39', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:33:39', '2022-04-13 11:33:39'),
(186, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0168', '', NULL, NULL, NULL, '2022-04-13 17:04:08', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:34:08', '2022-04-13 11:34:08'),
(187, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0169', '', NULL, NULL, NULL, '2022-04-13 17:04:53', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:34:53', '2022-04-13 11:34:53'),
(188, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0170', '', NULL, NULL, NULL, '2022-04-13 17:05:38', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:35:38', '2022-04-13 11:35:38'),
(189, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0171', '', NULL, NULL, NULL, '2022-04-13 17:06:02', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:36:02', '2022-04-13 11:36:02'),
(190, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0172', '', NULL, NULL, NULL, '2022-04-13 17:07:43', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:37:43', '2022-04-13 11:37:43'),
(191, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0173', '', NULL, NULL, NULL, '2022-04-13 17:08:59', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:38:59', '2022-04-13 11:38:59'),
(192, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0174', '', NULL, NULL, NULL, '2022-04-13 17:09:19', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:39:19', '2022-04-13 11:39:19'),
(193, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0175', '', NULL, NULL, NULL, '2022-04-13 17:11:19', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:41:19', '2022-04-13 11:41:19'),
(194, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0176', '', NULL, NULL, NULL, '2022-04-13 17:11:56', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:41:56', '2022-04-13 11:41:56'),
(195, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0177', '', NULL, NULL, NULL, '2022-04-13 17:12:37', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:42:37', '2022-04-13 11:42:37'),
(196, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0178', '', NULL, NULL, NULL, '2022-04-13 17:15:29', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:45:29', '2022-04-13 11:45:29'),
(197, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0179', '', NULL, NULL, NULL, '2022-04-13 17:15:34', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:45:34', '2022-04-13 11:45:34'),
(198, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0180', '', NULL, NULL, NULL, '2022-04-13 17:16:15', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:46:16', '2022-04-13 11:46:16'),
(199, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0181', '', NULL, NULL, NULL, '2022-04-13 17:16:41', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:46:41', '2022-04-13 11:46:41'),
(200, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0182', '', NULL, NULL, NULL, '2022-04-13 17:20:04', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:50:04', '2022-04-13 11:50:04'),
(201, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0183', '', NULL, NULL, NULL, '2022-04-13 17:20:43', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:50:43', '2022-04-13 11:50:43'),
(202, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0184', '', NULL, NULL, NULL, '2022-04-13 17:21:54', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:51:54', '2022-04-13 11:51:54'),
(203, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0185', '', NULL, NULL, NULL, '2022-04-13 17:22:31', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:52:31', '2022-04-13 11:52:31'),
(204, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0186', '', NULL, NULL, NULL, '2022-04-13 17:23:22', '2000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:53:22', '2022-04-13 11:53:22'),
(205, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0187', '', NULL, NULL, NULL, '2022-04-13 17:23:47', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:53:47', '2022-04-13 11:53:47'),
(206, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0188', '', NULL, NULL, NULL, '2022-04-13 17:25:21', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:55:21', '2022-04-13 11:55:21'),
(207, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0189', '', NULL, NULL, NULL, '2022-04-13 17:25:54', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:55:54', '2022-04-13 11:55:54'),
(208, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0190', '', NULL, NULL, NULL, '2022-04-13 17:26:41', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:56:41', '2022-04-13 11:56:41');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `source`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `is_export`, `export_custom_fields_info`, `round_off_amount`, `additional_expense_key_1`, `additional_expense_value_1`, `additional_expense_key_2`, `additional_expense_value_2`, `additional_expense_key_3`, `additional_expense_value_3`, `additional_expense_key_4`, `additional_expense_value_4`, `final_total`, `expense_category_id`, `expense_sub_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `prefer_payment_method`, `prefer_payment_account`, `sales_order_ids`, `purchase_order_ids`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `service_custom_field_5`, `service_custom_field_6`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(209, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0191', '', NULL, NULL, NULL, '2022-04-13 17:27:07', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:57:07', '2022-04-13 11:57:07'),
(210, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0192', '', NULL, NULL, NULL, '2022-04-13 17:27:30', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:57:30', '2022-04-13 11:57:30'),
(211, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0193', '', NULL, NULL, NULL, '2022-04-13 17:28:04', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:58:04', '2022-04-13 11:58:04'),
(212, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0194', '', NULL, NULL, NULL, '2022-04-13 17:29:20', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 11:59:20', '2022-04-13 11:59:20'),
(213, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0195', '', NULL, NULL, NULL, '2022-04-13 17:31:13', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:01:13', '2022-04-13 12:01:13'),
(214, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0196', '', NULL, NULL, NULL, '2022-04-13 17:32:36', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:02:36', '2022-04-13 12:02:36'),
(215, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0197', '', NULL, NULL, NULL, '2022-04-13 17:33:25', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:03:25', '2022-04-13 12:03:25'),
(216, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0198', '', NULL, NULL, NULL, '2022-04-13 17:33:56', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:03:56', '2022-04-13 12:03:56'),
(217, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0199', '', NULL, NULL, NULL, '2022-04-13 17:36:19', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:06:19', '2022-04-13 12:06:19'),
(218, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0200', '', NULL, NULL, NULL, '2022-04-13 17:37:55', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:07:55', '2022-04-13 12:07:55'),
(219, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0201', '', NULL, NULL, NULL, '2022-04-13 17:39:44', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:09:44', '2022-04-13 12:09:44'),
(220, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0202', '', NULL, NULL, NULL, '2022-04-13 17:41:04', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:11:04', '2022-04-13 12:11:04'),
(221, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0203', '', NULL, NULL, NULL, '2022-04-13 17:41:24', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:11:24', '2022-04-13 12:11:24'),
(222, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0204', '', NULL, NULL, NULL, '2022-04-13 17:43:01', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:13:01', '2022-04-13 12:13:01'),
(223, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0205', '', NULL, NULL, NULL, '2022-04-13 17:44:53', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:14:53', '2022-04-13 12:14:53'),
(224, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0206', '', NULL, NULL, NULL, '2022-04-13 17:45:29', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:15:29', '2022-04-13 12:15:29'),
(225, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0207', '', NULL, NULL, NULL, '2022-04-13 17:46:25', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:16:25', '2022-04-13 12:16:25'),
(226, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0208', '', NULL, NULL, NULL, '2022-04-13 17:46:38', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:16:38', '2022-04-13 12:16:38'),
(227, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0209', '', NULL, NULL, NULL, '2022-04-13 17:47:41', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:17:41', '2022-04-13 12:17:41'),
(228, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0210', '', NULL, NULL, NULL, '2022-04-13 17:48:19', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:18:19', '2022-04-13 12:18:19'),
(229, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0211', '', NULL, NULL, NULL, '2022-04-13 17:48:43', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:18:43', '2022-04-13 12:18:43'),
(230, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0212', '', NULL, NULL, NULL, '2022-04-13 17:49:52', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:19:52', '2022-04-13 12:19:52'),
(231, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0213', '', NULL, NULL, NULL, '2022-04-13 17:50:20', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:20:20', '2022-04-13 12:20:20'),
(232, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0214', '', NULL, NULL, NULL, '2022-04-13 17:51:13', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:21:13', '2022-04-13 12:21:13'),
(233, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0215', '', NULL, NULL, NULL, '2022-04-13 17:56:20', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:26:20', '2022-04-13 12:26:20'),
(234, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0216', '', NULL, NULL, NULL, '2022-04-13 17:57:29', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:27:29', '2022-04-13 12:27:29'),
(235, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0217', '', NULL, NULL, NULL, '2022-04-13 17:58:36', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:28:36', '2022-04-13 12:28:36'),
(236, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0218', '', NULL, NULL, NULL, '2022-04-13 17:59:46', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:29:46', '2022-04-13 12:29:46'),
(237, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0219', '', NULL, NULL, NULL, '2022-04-13 18:01:37', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:31:37', '2022-04-13 12:31:37'),
(238, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0220', '', NULL, NULL, NULL, '2022-04-13 18:02:46', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:32:46', '2022-04-13 12:32:46'),
(239, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0221', '', NULL, NULL, NULL, '2022-04-13 18:04:13', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:34:13', '2022-04-13 12:34:13'),
(240, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0222', '', NULL, NULL, NULL, '2022-04-13 18:05:02', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:35:02', '2022-04-13 12:35:02'),
(241, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0223', '', NULL, NULL, NULL, '2022-04-13 18:10:42', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:40:42', '2022-04-13 12:40:42'),
(242, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0224', '', NULL, NULL, NULL, '2022-04-13 18:11:47', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:41:47', '2022-04-13 12:41:47'),
(243, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0225', '', NULL, NULL, NULL, '2022-04-13 18:16:50', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:46:50', '2022-04-13 12:46:50'),
(244, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0226', '', NULL, NULL, NULL, '2022-04-13 18:17:37', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:47:37', '2022-04-13 12:47:37'),
(245, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0227', '', NULL, NULL, NULL, '2022-04-13 18:18:57', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:48:57', '2022-04-13 12:48:57'),
(246, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0228', '', NULL, NULL, NULL, '2022-04-13 18:19:32', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:49:32', '2022-04-13 12:49:32'),
(247, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0229', '', NULL, NULL, NULL, '2022-04-13 18:21:26', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:51:26', '2022-04-13 12:51:26'),
(248, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0230', '', NULL, NULL, NULL, '2022-04-13 18:22:21', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:52:21', '2022-04-13 12:52:21'),
(249, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0231', '', NULL, NULL, NULL, '2022-04-13 18:23:34', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:53:34', '2022-04-13 12:53:34'),
(250, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0232', '', NULL, NULL, NULL, '2022-04-13 18:24:29', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:54:29', '2022-04-13 12:54:29'),
(251, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0233', '', NULL, NULL, NULL, '2022-04-13 18:27:29', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:57:29', '2022-04-13 12:57:29'),
(252, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0234', '', NULL, NULL, NULL, '2022-04-13 18:28:23', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:58:23', '2022-04-13 12:58:23'),
(253, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0235', '', NULL, NULL, NULL, '2022-04-13 18:28:49', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:58:49', '2022-04-13 12:58:49'),
(254, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0236', '', NULL, NULL, NULL, '2022-04-13 18:29:29', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:59:29', '2022-04-13 12:59:29'),
(255, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0237', '', NULL, NULL, NULL, '2022-04-13 18:29:56', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 12:59:56', '2022-04-13 12:59:56'),
(256, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0238', '', NULL, NULL, NULL, '2022-04-13 18:30:43', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:00:43', '2022-04-13 13:00:43'),
(257, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0239', '', NULL, NULL, NULL, '2022-04-13 18:31:14', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:01:14', '2022-04-13 13:01:14'),
(258, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0240', '', NULL, NULL, NULL, '2022-04-13 18:33:01', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:03:01', '2022-04-13 13:03:01'),
(259, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0241', '', NULL, NULL, NULL, '2022-04-13 18:34:00', '2000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:04:00', '2022-04-13 13:04:00'),
(260, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0242', '', NULL, NULL, NULL, '2022-04-13 18:34:58', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:04:58', '2022-04-13 13:04:58'),
(261, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0243', '', NULL, NULL, NULL, '2022-04-13 18:36:58', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:06:58', '2022-04-13 13:06:58'),
(262, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0244', '', NULL, NULL, NULL, '2022-04-13 18:38:31', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:08:31', '2022-04-13 13:08:31'),
(263, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0245', '', NULL, NULL, NULL, '2022-04-13 18:39:27', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:09:27', '2022-04-13 13:09:27'),
(264, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0246', '', NULL, NULL, NULL, '2022-04-13 18:54:30', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:24:30', '2022-04-13 13:24:30'),
(265, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0247', '', NULL, NULL, NULL, '2022-04-13 18:55:09', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:25:09', '2022-04-13 13:25:09'),
(266, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0248', '', NULL, NULL, NULL, '2022-04-13 18:55:59', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:25:59', '2022-04-13 13:25:59'),
(267, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0249', '', NULL, NULL, NULL, '2022-04-13 18:57:49', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:27:49', '2022-04-13 13:27:49'),
(268, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0250', '', NULL, NULL, NULL, '2022-04-13 18:58:17', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:28:17', '2022-04-13 13:28:17'),
(269, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0251', '', NULL, NULL, NULL, '2022-04-13 19:00:44', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:30:44', '2022-04-13 13:30:44'),
(270, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0252', '', NULL, NULL, NULL, '2022-04-13 19:01:45', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:31:45', '2022-04-13 13:31:45'),
(271, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0253', '', NULL, NULL, NULL, '2022-04-13 19:02:15', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:32:15', '2022-04-13 13:32:15'),
(272, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 19:03:00', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 13:33:50', '2022-04-27 10:01:46'),
(273, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0254', '', NULL, NULL, NULL, '2022-04-13 19:04:02', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:34:02', '2022-04-13 13:34:02'),
(274, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0255', '', NULL, NULL, NULL, '2022-04-13 19:04:08', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:34:08', '2022-04-13 13:34:08'),
(275, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0256', '', NULL, NULL, NULL, '2022-04-13 19:04:55', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:34:55', '2022-04-13 13:34:55'),
(276, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0257', '', NULL, NULL, NULL, '2022-04-13 19:06:43', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:36:43', '2022-04-13 13:36:43'),
(277, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0258', '', NULL, NULL, NULL, '2022-04-13 19:07:21', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:37:21', '2022-04-13 13:37:21');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `source`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `is_export`, `export_custom_fields_info`, `round_off_amount`, `additional_expense_key_1`, `additional_expense_value_1`, `additional_expense_key_2`, `additional_expense_value_2`, `additional_expense_key_3`, `additional_expense_value_3`, `additional_expense_key_4`, `additional_expense_value_4`, `final_total`, `expense_category_id`, `expense_sub_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `prefer_payment_method`, `prefer_payment_account`, `sales_order_ids`, `purchase_order_ids`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `service_custom_field_5`, `service_custom_field_6`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(278, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0259', '', NULL, NULL, NULL, '2022-04-13 19:08:33', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:38:33', '2022-04-13 13:38:33'),
(279, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0260', '', NULL, NULL, NULL, '2022-04-13 19:09:22', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:39:22', '2022-04-13 13:39:22'),
(280, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0261', '', NULL, NULL, NULL, '2022-04-13 19:09:43', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:39:43', '2022-04-13 13:39:43'),
(281, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0262', '', NULL, NULL, NULL, '2022-04-13 19:09:49', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:39:49', '2022-04-13 13:39:49'),
(282, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0263', '', NULL, NULL, NULL, '2022-04-13 19:10:37', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:40:37', '2022-04-13 13:40:37'),
(283, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0264', '', NULL, NULL, NULL, '2022-04-13 19:10:51', '12.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '12.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:40:51', '2022-04-13 13:40:51'),
(284, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0265', '', NULL, NULL, NULL, '2022-04-13 19:11:25', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:41:25', '2022-04-13 13:41:25'),
(285, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0266', '', NULL, NULL, NULL, '2022-04-13 19:12:21', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:42:21', '2022-04-13 13:42:21'),
(286, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0267', '', NULL, NULL, NULL, '2022-04-13 19:12:58', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:42:58', '2022-04-13 13:42:58'),
(287, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0268', '', NULL, NULL, NULL, '2022-04-13 19:13:33', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:43:33', '2022-04-13 13:43:33'),
(288, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0269', '', NULL, NULL, NULL, '2022-04-13 19:14:13', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:44:13', '2022-04-13 13:44:13'),
(289, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0270', '', NULL, NULL, NULL, '2022-04-13 19:14:44', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:44:44', '2022-04-13 13:44:44'),
(290, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0271', '', NULL, NULL, NULL, '2022-04-13 19:15:39', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:45:39', '2022-04-13 13:45:39'),
(291, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0272', '', NULL, NULL, NULL, '2022-04-13 19:15:49', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:45:49', '2022-04-13 13:45:49'),
(292, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0273', '', NULL, NULL, NULL, '2022-04-13 19:16:59', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:46:59', '2022-04-13 13:46:59'),
(293, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0274', '', NULL, NULL, NULL, '2022-04-13 19:17:48', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:47:48', '2022-04-13 13:47:48'),
(294, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0275', '', NULL, NULL, NULL, '2022-04-13 19:18:41', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:48:41', '2022-04-13 13:48:41'),
(295, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0276', '', NULL, NULL, NULL, '2022-04-13 19:19:32', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:49:32', '2022-04-13 13:49:32'),
(296, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0277', '', NULL, NULL, NULL, '2022-04-13 19:20:53', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:50:53', '2022-04-13 13:50:53'),
(297, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0278', '', NULL, NULL, NULL, '2022-04-13 19:22:27', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:52:27', '2022-04-13 13:52:27'),
(298, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0279', '', NULL, NULL, NULL, '2022-04-13 19:23:13', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:53:13', '2022-04-13 13:53:13'),
(299, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0280', '', NULL, NULL, NULL, '2022-04-13 19:24:16', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:54:16', '2022-04-13 13:54:16'),
(300, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0281', '', NULL, NULL, NULL, '2022-04-13 19:24:44', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:54:44', '2022-04-13 13:54:44'),
(301, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0282', '', NULL, NULL, NULL, '2022-04-13 19:25:09', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:55:10', '2022-04-13 13:55:10'),
(302, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0283', '', NULL, NULL, NULL, '2022-04-13 19:25:50', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:55:50', '2022-04-13 13:55:50'),
(303, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0284', '', NULL, NULL, NULL, '2022-04-13 19:26:13', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:56:13', '2022-04-13 13:56:13'),
(304, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0285', '', NULL, NULL, NULL, '2022-04-13 19:26:32', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:56:32', '2022-04-13 13:56:32'),
(305, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0286', '', NULL, NULL, NULL, '2022-04-13 19:27:06', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:57:06', '2022-04-13 13:57:06'),
(306, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0287', '', NULL, NULL, NULL, '2022-04-13 19:27:34', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:57:34', '2022-04-13 13:57:34'),
(307, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0288', '', NULL, NULL, NULL, '2022-04-13 19:28:53', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:58:53', '2022-04-13 13:58:53'),
(308, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0289', '', NULL, NULL, NULL, '2022-04-13 19:29:21', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:59:21', '2022-04-13 13:59:21'),
(309, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0290', '', NULL, NULL, NULL, '2022-04-13 19:29:43', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 13:59:43', '2022-04-13 13:59:43'),
(310, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0291', '', NULL, NULL, NULL, '2022-04-13 19:31:03', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:01:03', '2022-04-13 14:01:03'),
(311, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0292', '', NULL, NULL, NULL, '2022-04-13 19:32:28', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:02:28', '2022-04-13 14:02:28'),
(312, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0293', '', NULL, NULL, NULL, '2022-04-13 19:33:39', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:03:39', '2022-04-13 14:03:39'),
(313, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0294', '', NULL, NULL, NULL, '2022-04-13 19:34:54', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:04:54', '2022-04-13 14:04:54'),
(314, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0295', '', NULL, NULL, NULL, '2022-04-13 19:37:44', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:07:44', '2022-04-13 14:07:44'),
(315, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0296', '', NULL, NULL, NULL, '2022-04-13 19:40:09', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:10:09', '2022-04-13 14:10:09'),
(316, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0297', '', NULL, NULL, NULL, '2022-04-13 19:40:34', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:10:34', '2022-04-13 14:10:34'),
(317, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0298', '', NULL, NULL, NULL, '2022-04-13 19:42:40', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:12:40', '2022-04-13 14:12:40'),
(318, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0299', '', NULL, NULL, NULL, '2022-04-13 19:43:11', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:13:11', '2022-04-13 14:13:11'),
(319, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0300', '', NULL, NULL, NULL, '2022-04-13 19:43:57', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:13:57', '2022-04-13 14:13:57'),
(320, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0301', '', NULL, NULL, NULL, '2022-04-13 19:45:03', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:15:03', '2022-04-13 14:15:03'),
(321, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0302', '', NULL, NULL, NULL, '2022-04-13 19:45:36', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:15:36', '2022-04-13 14:15:36'),
(322, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0303', '', NULL, NULL, NULL, '2022-04-13 19:46:45', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:16:45', '2022-04-13 14:16:45'),
(323, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0304', '', NULL, NULL, NULL, '2022-04-13 19:47:23', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:17:23', '2022-04-13 14:17:23'),
(324, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0305', '', NULL, NULL, NULL, '2022-04-13 19:48:04', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:18:04', '2022-04-13 14:18:04'),
(325, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0306', '', NULL, NULL, NULL, '2022-04-13 19:48:32', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:18:32', '2022-04-13 14:18:32'),
(326, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0307', '', NULL, NULL, NULL, '2022-04-13 19:50:29', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:20:29', '2022-04-13 14:20:29'),
(327, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0308', '', NULL, NULL, NULL, '2022-04-13 19:50:58', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:20:58', '2022-04-13 14:20:58'),
(328, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0309', '', NULL, NULL, NULL, '2022-04-13 19:53:23', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:23:23', '2022-04-13 14:23:23'),
(329, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0310', '', NULL, NULL, NULL, '2022-04-13 19:55:21', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:25:21', '2022-04-13 14:25:21'),
(330, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0311', '', NULL, NULL, NULL, '2022-04-13 19:57:31', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:27:31', '2022-04-13 14:27:31'),
(331, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0312', '', NULL, NULL, NULL, '2022-04-13 19:57:46', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:27:46', '2022-04-13 14:27:46'),
(332, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0313', '', NULL, NULL, NULL, '2022-04-13 19:59:22', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:29:22', '2022-04-13 14:29:22'),
(333, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0314', '', NULL, NULL, NULL, '2022-04-13 20:00:58', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:30:58', '2022-04-13 14:30:58'),
(334, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0315', '', NULL, NULL, NULL, '2022-04-13 20:03:08', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:33:08', '2022-04-13 14:33:08'),
(335, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0316', '', NULL, NULL, NULL, '2022-04-13 20:04:17', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:34:17', '2022-04-13 14:34:17'),
(336, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0317', '', NULL, NULL, NULL, '2022-04-13 20:06:07', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:36:07', '2022-04-13 14:36:07'),
(337, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0318', '', NULL, NULL, NULL, '2022-04-13 20:06:49', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:36:49', '2022-04-13 14:36:49'),
(338, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0319', '', NULL, NULL, NULL, '2022-04-13 20:07:10', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:37:11', '2022-04-13 14:37:11'),
(339, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0320', '', NULL, NULL, NULL, '2022-04-13 20:10:26', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:40:26', '2022-04-13 14:40:26'),
(340, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0321', '', NULL, NULL, NULL, '2022-04-13 20:17:36', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:47:36', '2022-04-13 14:47:36'),
(341, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0322', '', NULL, NULL, NULL, '2022-04-13 20:18:43', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:48:44', '2022-04-13 14:48:44'),
(342, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0323', '', NULL, NULL, NULL, '2022-04-13 20:19:11', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:49:11', '2022-04-13 14:49:11'),
(343, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0324', '', NULL, NULL, NULL, '2022-04-13 20:19:56', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:49:56', '2022-04-13 14:49:56'),
(344, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0325', '', NULL, NULL, NULL, '2022-04-13 20:21:26', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:51:26', '2022-04-13 14:51:26'),
(345, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0326', '', NULL, NULL, NULL, '2022-04-13 20:22:06', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:52:06', '2022-04-13 14:52:06'),
(346, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0327', '', NULL, NULL, NULL, '2022-04-13 20:23:01', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:53:01', '2022-04-13 14:53:01');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `source`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `is_export`, `export_custom_fields_info`, `round_off_amount`, `additional_expense_key_1`, `additional_expense_value_1`, `additional_expense_key_2`, `additional_expense_value_2`, `additional_expense_key_3`, `additional_expense_value_3`, `additional_expense_key_4`, `additional_expense_value_4`, `final_total`, `expense_category_id`, `expense_sub_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `prefer_payment_method`, `prefer_payment_account`, `sales_order_ids`, `purchase_order_ids`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `service_custom_field_5`, `service_custom_field_6`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(347, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0328', '', NULL, NULL, NULL, '2022-04-13 20:23:48', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:53:48', '2022-04-13 14:53:48'),
(348, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0329', '', NULL, NULL, NULL, '2022-04-13 20:25:30', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:55:30', '2022-04-13 14:55:30'),
(349, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0330', '', NULL, NULL, NULL, '2022-04-13 20:26:39', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:56:39', '2022-04-13 14:56:39'),
(350, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0331', '', NULL, NULL, NULL, '2022-04-13 20:28:12', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 14:58:12', '2022-04-13 14:58:12'),
(351, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0332', '', NULL, NULL, NULL, '2022-04-13 20:30:01', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 15:00:01', '2022-04-13 15:00:01'),
(352, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0333', '', NULL, NULL, NULL, '2022-04-13 20:32:57', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 15:02:57', '2022-04-13 15:02:57'),
(353, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0334', '', NULL, NULL, NULL, '2022-04-13 20:34:04', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 15:04:04', '2022-04-13 15:04:04'),
(354, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0335', '', NULL, NULL, NULL, '2022-04-13 20:35:19', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 15:05:19', '2022-04-13 15:05:19'),
(355, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0336', '', NULL, NULL, NULL, '2022-04-13 20:38:30', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 15:08:30', '2022-04-13 15:08:30'),
(356, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0337', '', NULL, NULL, NULL, '2022-04-13 20:39:04', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 15:09:04', '2022-04-13 15:09:04'),
(357, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0338', '', NULL, NULL, NULL, '2022-04-13 20:43:59', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 15:13:59', '2022-04-13 15:13:59'),
(358, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0339', '', NULL, NULL, NULL, '2022-04-13 20:44:52', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 15:14:52', '2022-04-13 15:14:52'),
(359, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0340', '', NULL, NULL, NULL, '2022-04-13 20:55:57', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 15:25:57', '2022-04-13 15:25:57'),
(360, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0341', '', NULL, NULL, NULL, '2022-04-13 21:06:15', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 15:36:15', '2022-04-13 15:36:15'),
(361, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0342', '', NULL, NULL, NULL, '2022-04-13 21:08:12', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 15:38:12', '2022-04-13 15:38:12'),
(362, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0343', '', NULL, NULL, NULL, '2022-04-13 21:10:00', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 15:40:00', '2022-04-13 15:40:00'),
(363, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0344', '', NULL, NULL, NULL, '2022-04-13 21:12:33', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 15:42:33', '2022-04-13 15:42:33'),
(364, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0345', '', NULL, NULL, NULL, '2022-04-13 21:13:31', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 15:43:31', '2022-04-13 15:43:31'),
(365, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0346', '', NULL, NULL, NULL, '2022-04-13 21:16:00', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 15:46:00', '2022-04-13 15:46:00'),
(366, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0347', '', NULL, NULL, NULL, '2022-04-13 21:20:17', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 15:50:17', '2022-04-13 15:50:17'),
(367, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0348', '', NULL, NULL, NULL, '2022-04-13 21:27:41', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 15:57:41', '2022-04-13 15:57:41'),
(368, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0349', '', NULL, NULL, NULL, '2022-04-13 21:28:29', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 15:58:29', '2022-04-13 15:58:29'),
(369, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0350', '', NULL, NULL, NULL, '2022-04-13 21:29:58', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 15:59:58', '2022-04-13 15:59:58'),
(370, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0351', '', NULL, NULL, NULL, '2022-04-13 21:30:45', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 16:00:45', '2022-04-13 16:00:45'),
(371, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0352', '', NULL, NULL, NULL, '2022-04-13 21:33:42', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 16:03:42', '2022-04-13 16:03:42'),
(372, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0018', '', NULL, NULL, NULL, '2022-04-13 21:36:39', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-13 16:06:39', '2022-04-13 16:06:39'),
(373, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0019', '', NULL, NULL, NULL, '2022-04-17 09:41:18', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 04:11:18', '2022-04-17 04:11:18'),
(374, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0020', '', NULL, NULL, NULL, '2022-04-17 10:32:11', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 05:02:11', '2022-04-17 05:02:11'),
(375, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0021', '', NULL, NULL, NULL, '2022-04-17 10:35:18', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 05:05:18', '2022-04-17 05:05:18'),
(376, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0022', '', NULL, NULL, NULL, '2022-04-17 10:35:36', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 05:05:36', '2022-04-17 05:05:36'),
(377, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0023', '', NULL, NULL, NULL, '2022-04-17 10:36:13', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 05:06:13', '2022-04-17 05:06:13'),
(378, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0024', '', NULL, NULL, NULL, '2022-04-17 10:55:50', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 05:25:50', '2022-04-17 05:25:51'),
(379, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0025', '', NULL, NULL, NULL, '2022-04-17 11:00:05', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 05:30:05', '2022-04-17 05:30:05'),
(380, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0026', '', NULL, NULL, NULL, '2022-04-17 12:38:31', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 07:08:31', '2022-04-17 07:08:31'),
(381, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0027', '', NULL, NULL, NULL, '2022-04-17 12:40:34', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 07:10:34', '2022-04-17 07:10:34'),
(382, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0028', '', NULL, NULL, NULL, '2022-04-17 12:49:49', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 07:19:49', '2022-04-17 07:19:49'),
(383, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0029', '', NULL, NULL, NULL, '2022-04-17 12:50:30', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 07:20:30', '2022-04-17 07:20:30'),
(384, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0030', '', NULL, NULL, NULL, '2022-04-17 12:54:53', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 07:24:53', '2022-04-17 07:24:53'),
(385, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0031', '', NULL, NULL, NULL, '2022-04-17 12:56:55', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 07:26:55', '2022-04-17 07:26:55'),
(386, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0032', '', NULL, NULL, NULL, '2022-04-17 13:24:24', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 07:54:24', '2022-04-17 07:54:24'),
(387, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0033', '', NULL, NULL, NULL, '2022-04-17 13:27:43', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 07:57:43', '2022-04-17 07:57:43'),
(388, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0034', '', NULL, NULL, NULL, '2022-04-17 13:37:04', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 08:07:04', '2022-04-17 08:07:04'),
(389, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0035', '', NULL, NULL, NULL, '2022-04-17 13:39:20', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 08:09:20', '2022-04-17 08:09:20'),
(390, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0036', '', NULL, NULL, NULL, '2022-04-17 13:40:58', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 08:10:58', '2022-04-17 08:10:58'),
(391, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0037', '', NULL, NULL, NULL, '2022-04-17 13:41:45', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 08:11:45', '2022-04-17 08:11:45'),
(392, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0038', '', NULL, NULL, NULL, '2022-04-17 13:43:46', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 08:13:46', '2022-04-17 08:13:46'),
(393, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0039', '', NULL, NULL, NULL, '2022-04-17 13:54:16', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 08:24:16', '2022-04-17 08:24:16'),
(394, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0040', '', NULL, NULL, NULL, '2022-04-17 13:56:53', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 08:26:53', '2022-04-17 08:26:53'),
(395, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0041', '', NULL, NULL, NULL, '2022-04-17 13:58:24', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 08:28:24', '2022-04-17 08:28:24'),
(396, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0042', '', NULL, NULL, NULL, '2022-04-17 14:11:17', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 08:41:17', '2022-04-17 08:41:17'),
(397, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0043', '', NULL, NULL, NULL, '2022-04-17 14:13:03', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 08:43:03', '2022-04-17 08:43:03'),
(398, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0044', '', NULL, NULL, NULL, '2022-04-17 14:16:30', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 08:46:30', '2022-04-17 08:46:30'),
(399, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0045', '', NULL, NULL, NULL, '2022-04-17 14:17:22', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 08:47:22', '2022-04-17 08:47:22'),
(400, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0046', '', NULL, NULL, NULL, '2022-04-17 14:17:59', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 08:47:59', '2022-04-17 08:47:59'),
(401, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0047', '', NULL, NULL, NULL, '2022-04-17 14:19:43', '12.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '12.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 08:49:43', '2022-04-17 08:49:43'),
(402, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0048', '', NULL, NULL, NULL, '2022-04-17 14:21:30', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 08:51:30', '2022-04-17 08:51:30'),
(403, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0049', '', NULL, NULL, NULL, '2022-04-17 14:23:51', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 08:53:51', '2022-04-17 08:53:51'),
(404, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0050', '', NULL, NULL, NULL, '2022-04-17 14:24:38', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 08:54:38', '2022-04-17 08:54:38'),
(405, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0051', '', NULL, NULL, NULL, '2022-04-17 14:28:16', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 08:58:16', '2022-04-17 08:58:16'),
(406, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0052', '', NULL, NULL, NULL, '2022-04-17 14:30:32', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 09:00:32', '2022-04-17 09:00:32'),
(407, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0053', '', NULL, NULL, NULL, '2022-04-17 14:31:31', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-17 09:01:31', '2022-04-17 09:01:31'),
(419, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0353', '', NULL, NULL, NULL, '2022-04-18 08:12:48', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-18 02:42:48', '2022-04-18 02:42:48'),
(421, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0355', '', NULL, NULL, NULL, '2022-04-18 08:15:35', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-18 02:45:35', '2022-04-18 02:45:35'),
(422, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0356', '', NULL, NULL, NULL, '2022-04-18 08:15:42', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-18 02:45:42', '2022-04-18 02:45:42'),
(423, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0357', '', NULL, NULL, NULL, '2022-04-18 08:16:04', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-18 02:46:04', '2022-04-18 02:46:04'),
(424, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0358', '', NULL, NULL, NULL, '2022-04-18 08:17:45', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-18 02:47:45', '2022-04-18 02:47:45'),
(425, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0359', '', NULL, NULL, NULL, '2022-04-18 08:18:15', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-18 02:48:15', '2022-04-18 02:48:15'),
(426, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0360', '', NULL, NULL, NULL, '2022-04-18 08:18:52', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-18 02:48:52', '2022-04-18 02:48:52'),
(438, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0076', '', NULL, NULL, NULL, '2022-04-18 11:02:38', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1100.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '100.0000', 'fixed', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-18 05:32:38', '2022-04-18 05:32:38'),
(439, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 10, NULL, '0077', '', NULL, NULL, NULL, '2022-04-18 12:12:39', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, '1235', 'ordered', NULL, '450.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1662.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '200.0000', 'fixed', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-18 06:42:39', '2022-04-18 06:42:39');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `source`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `is_export`, `export_custom_fields_info`, `round_off_amount`, `additional_expense_key_1`, `additional_expense_value_1`, `additional_expense_key_2`, `additional_expense_value_2`, `additional_expense_key_3`, `additional_expense_value_3`, `additional_expense_key_4`, `additional_expense_value_4`, `final_total`, `expense_category_id`, `expense_sub_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `prefer_payment_method`, `prefer_payment_account`, `sales_order_ids`, `purchase_order_ids`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `service_custom_field_5`, `service_custom_field_6`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(440, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0361', '', NULL, NULL, NULL, '2022-04-18 12:19:36', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-18 06:49:36', '2022-04-18 06:49:36'),
(441, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0078', '', NULL, NULL, NULL, '2022-04-18 12:36:19', '2000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-18 07:06:19', '2022-04-18 07:06:19'),
(442, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0079', '', NULL, NULL, NULL, '2022-04-18 14:22:24', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-18 08:52:24', '2022-04-18 08:52:24'),
(443, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0080', '', NULL, NULL, NULL, '2022-04-18 14:26:28', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-18 08:56:28', '2022-04-18 08:56:28'),
(444, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 10, NULL, '0081', '', NULL, NULL, NULL, '2022-04-18 15:00:27', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', '123', 'Wewassagama,\r\nVineethagama,\r\nBadulla', 'ordered', NULL, '350.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1362.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-18 09:30:27', '2022-04-18 13:43:04'),
(445, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0362', '', NULL, NULL, NULL, '2022-04-27 11:29:25', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-27 05:59:25', '2022-04-27 05:59:25'),
(446, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0082', '', NULL, NULL, NULL, '2022-04-27 11:29:50', '1012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-27 05:59:50', '2022-04-27 05:59:50'),
(447, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0083', '', NULL, NULL, NULL, '2022-04-27 11:34:20', '12.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '12.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-27 06:04:20', '2022-04-27 06:04:20'),
(448, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 12:03:25', '10500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '52500.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-27 06:33:25', '2022-04-27 06:33:25'),
(449, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 12:17:51', '5200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '26000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-27 06:47:51', '2022-04-27 06:47:51'),
(450, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 12:34:46', '4500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '22500.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-27 07:04:46', '2022-04-27 07:04:46'),
(451, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 12:59:09', '3500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '17500.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-27 07:29:09', '2022-04-27 07:29:09'),
(452, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 11, NULL, '2022/0363', '', NULL, NULL, NULL, '2022-04-27 13:05:55', '29500.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', 'No 12 Library RD Badulla', NULL, 'shipped', 'promto', '800.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '30300.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-27 07:35:55', '2022-04-27 07:35:55'),
(453, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0084', '', NULL, NULL, NULL, '2022-04-27 13:07:08', '25012.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '25012.5000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-27 07:37:08', '2022-04-27 07:37:08'),
(454, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 07:34:56', '21000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '21000000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-01 02:04:56', '2022-05-01 02:04:56'),
(455, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0085', '', NULL, NULL, NULL, '2022-05-01 07:35:50', '24000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '24000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-05-01 02:05:50', '2022-05-01 02:05:50'),
(456, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0086', '', NULL, NULL, NULL, '2022-05-01 07:37:48', '24000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '24000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-05-01 02:07:48', '2022-05-01 02:07:48'),
(457, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0087', '', NULL, NULL, NULL, '2022-05-01 08:44:40', '24000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '24000.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-05-01 03:14:40', '2022-05-01 03:14:40'),
(458, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0088', '', NULL, NULL, NULL, '2022-05-01 08:46:43', '6500.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '6500.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-05-01 03:16:43', '2022-05-01 03:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments`
--

CREATE TABLE `transaction_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(11) UNSIGNED DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_transaction_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_security` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `paid_through_link` tinyint(1) NOT NULL DEFAULT '0',
  `gateway` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_advance` tinyint(1) NOT NULL DEFAULT '0',
  `payment_for` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_payments`
--

INSERT INTO `transaction_payments` (`id`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `paid_through_link`, `gateway`, `is_advance`, `payment_for`, `parent_id`, `note`, `document`, `payment_ref_no`, `account_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-19 10:17:51', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0001', NULL, '2022-03-19 04:47:51', '2022-03-19 04:47:51'),
(2, 3, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-19 10:30:03', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0002', NULL, '2022-03-19 05:00:03', '2022-03-19 05:00:03'),
(3, 4, 1, 0, '2000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-19 10:47:47', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0003', NULL, '2022-03-19 05:17:47', '2022-03-19 05:17:47'),
(4, 5, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-19 10:52:14', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0004', NULL, '2022-03-19 05:22:14', '2022-03-19 05:22:14'),
(5, 6, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-19 10:54:51', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0005', NULL, '2022-03-19 05:24:51', '2022-03-19 05:24:51'),
(6, 7, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-19 10:56:44', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0006', NULL, '2022-03-19 05:26:44', '2022-03-19 05:26:44'),
(7, 8, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-19 10:57:33', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0007', NULL, '2022-03-19 05:27:33', '2022-03-19 05:27:33'),
(8, 45, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-11 14:33:40', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0008', NULL, '2022-04-11 09:03:40', '2022-04-11 09:03:40'),
(9, 46, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-11 14:40:33', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0009', NULL, '2022-04-11 09:10:33', '2022-04-11 09:10:33'),
(10, 48, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-11 14:56:48', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0010', NULL, '2022-04-11 09:26:48', '2022-04-11 09:26:48'),
(11, 51, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-11 15:00:47', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0011', NULL, '2022-04-11 09:30:47', '2022-04-11 09:30:47'),
(12, 80, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-11 16:31:10', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0012', NULL, '2022-04-11 11:01:10', '2022-04-11 11:01:10'),
(13, 90, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-11 17:01:20', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0013', NULL, '2022-04-11 11:31:20', '2022-04-11 11:31:20'),
(14, 100, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-12 08:30:25', 1, 0, NULL, 0, 7, NULL, NULL, NULL, 'SP2022/0014', NULL, '2022-04-12 03:00:25', '2022-04-12 03:00:25'),
(15, 118, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-12 09:45:58', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0015', NULL, '2022-04-12 04:15:58', '2022-04-12 04:15:58'),
(16, 121, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 10:00:58', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0016', NULL, '2022-04-13 04:30:58', '2022-04-13 04:30:58'),
(17, 159, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 16:07:34', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0017', NULL, '2022-04-13 10:37:34', '2022-04-13 10:37:34'),
(18, 372, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 21:36:39', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0018', NULL, '2022-04-13 16:06:39', '2022-04-13 16:06:39'),
(19, 373, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 09:41:18', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0019', NULL, '2022-04-17 04:11:18', '2022-04-17 04:11:18'),
(20, 374, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 10:32:11', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0020', NULL, '2022-04-17 05:02:11', '2022-04-17 05:02:11'),
(21, 375, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 10:35:18', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0021', NULL, '2022-04-17 05:05:18', '2022-04-17 05:05:18'),
(22, 376, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 10:35:36', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0022', NULL, '2022-04-17 05:05:36', '2022-04-17 05:05:36'),
(23, 377, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 10:36:13', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0023', NULL, '2022-04-17 05:06:13', '2022-04-17 05:06:13'),
(24, 378, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 10:55:50', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0024', NULL, '2022-04-17 05:25:50', '2022-04-17 05:25:50'),
(25, 379, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 11:00:05', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0025', NULL, '2022-04-17 05:30:05', '2022-04-17 05:30:05'),
(26, 380, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 12:38:31', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0026', NULL, '2022-04-17 07:08:31', '2022-04-17 07:08:31'),
(27, 381, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 12:40:34', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0027', NULL, '2022-04-17 07:10:34', '2022-04-17 07:10:34'),
(28, 382, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 12:49:49', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0028', NULL, '2022-04-17 07:19:49', '2022-04-17 07:19:49'),
(29, 383, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 12:50:30', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0029', NULL, '2022-04-17 07:20:30', '2022-04-17 07:20:30'),
(30, 384, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 12:54:53', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0030', NULL, '2022-04-17 07:24:53', '2022-04-17 07:24:53'),
(31, 385, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 12:56:55', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0031', NULL, '2022-04-17 07:26:55', '2022-04-17 07:26:55'),
(32, 386, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 13:24:24', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0032', NULL, '2022-04-17 07:54:24', '2022-04-17 07:54:24'),
(33, 387, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 13:27:43', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0033', NULL, '2022-04-17 07:57:43', '2022-04-17 07:57:43'),
(34, 388, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 13:37:04', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0034', NULL, '2022-04-17 08:07:04', '2022-04-17 08:07:04'),
(35, 389, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 13:39:20', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0035', NULL, '2022-04-17 08:09:20', '2022-04-17 08:09:20'),
(36, 390, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 13:40:58', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0036', NULL, '2022-04-17 08:10:58', '2022-04-17 08:10:58'),
(37, 391, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 13:41:45', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0037', NULL, '2022-04-17 08:11:45', '2022-04-17 08:11:45'),
(38, 392, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 13:43:46', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0038', NULL, '2022-04-17 08:13:46', '2022-04-17 08:13:46'),
(39, 393, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 13:54:16', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0039', NULL, '2022-04-17 08:24:16', '2022-04-17 08:24:16'),
(40, 394, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 13:56:53', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0040', NULL, '2022-04-17 08:26:53', '2022-04-17 08:26:53'),
(41, 395, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 13:58:24', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0041', NULL, '2022-04-17 08:28:24', '2022-04-17 08:28:24'),
(42, 396, 1, 0, '1012.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 14:11:17', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0042', NULL, '2022-04-17 08:41:17', '2022-04-17 08:41:17'),
(43, 397, 1, 0, '1012.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 14:13:03', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0043', NULL, '2022-04-17 08:43:03', '2022-04-17 08:43:03'),
(44, 398, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 14:16:30', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0044', NULL, '2022-04-17 08:46:30', '2022-04-17 08:46:30'),
(45, 399, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 14:17:22', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0045', NULL, '2022-04-17 08:47:22', '2022-04-17 08:47:22'),
(46, 400, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 14:17:59', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0046', NULL, '2022-04-17 08:47:59', '2022-04-17 08:47:59'),
(47, 401, 1, 0, '12.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 14:19:43', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0047', NULL, '2022-04-17 08:49:43', '2022-04-17 08:49:43'),
(48, 402, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 14:21:30', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0048', NULL, '2022-04-17 08:51:30', '2022-04-17 08:51:30'),
(49, 403, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 14:23:51', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0049', NULL, '2022-04-17 08:53:51', '2022-04-17 08:53:51'),
(50, 404, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 14:24:38', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0050', NULL, '2022-04-17 08:54:38', '2022-04-17 08:54:38'),
(51, 405, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 14:28:16', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0051', NULL, '2022-04-17 08:58:16', '2022-04-17 08:58:16'),
(52, 406, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 14:30:32', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0052', NULL, '2022-04-17 09:00:32', '2022-04-17 09:00:32'),
(53, 407, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-17 14:31:31', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0053', NULL, '2022-04-17 09:01:31', '2022-04-17 09:01:31'),
(76, 438, 1, 0, '1100.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-18 11:02:38', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0076', NULL, '2022-04-18 05:32:38', '2022-04-18 05:32:38'),
(77, 439, 1, 0, '1662.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-18 12:12:39', 1, 0, NULL, 0, 10, NULL, NULL, NULL, 'SP2022/0077', NULL, '2022-04-18 06:42:39', '2022-04-18 06:42:39'),
(78, 441, 1, 0, '2000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-18 12:36:19', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0078', NULL, '2022-04-18 07:06:19', '2022-04-18 07:06:19'),
(79, 442, 1, 0, '1012.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-18 14:22:24', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0079', NULL, '2022-04-18 08:52:24', '2022-04-18 08:52:24'),
(80, 443, 1, 0, '1012.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-18 14:26:28', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0080', NULL, '2022-04-18 08:56:28', '2022-04-18 08:56:28'),
(81, 444, 1, 0, '1362.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-18 15:00:27', 1, 0, NULL, 0, 10, NULL, NULL, NULL, 'SP2022/0081', NULL, '2022-04-18 09:30:27', '2022-04-18 13:43:04'),
(82, 446, 1, 0, '1012.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-27 11:29:50', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0082', NULL, '2022-04-27 05:59:50', '2022-04-27 05:59:50'),
(83, 447, 1, 0, '12.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-27 11:34:20', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0083', NULL, '2022-04-27 06:04:20', '2022-04-27 06:04:20'),
(84, 453, 1, 0, '25012.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-27 13:07:08', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0084', NULL, '2022-04-27 07:37:08', '2022-04-27 07:37:08'),
(85, 455, 1, 0, '24000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-01 07:35:50', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0085', NULL, '2022-05-01 02:05:50', '2022-05-01 02:05:50'),
(86, 456, 1, 0, '24000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-01 07:37:48', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0086', NULL, '2022-05-01 02:07:48', '2022-05-01 02:07:48'),
(87, 457, 1, 0, '24000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-01 08:44:40', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0087', NULL, '2022-05-01 03:14:40', '2022-05-01 03:14:40'),
(88, 458, 1, 0, '6500.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-01 08:46:43', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0088', NULL, '2022-05-01 03:16:43', '2022-05-01 03:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines`
--

CREATE TABLE `transaction_sell_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `unit_price_before_discount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line_discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `sell_line_note` text COLLATE utf8mb4_unicode_ci,
  `so_line_id` int(11) DEFAULT NULL,
  `so_quantity_invoiced` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `res_service_staff_id` int(11) DEFAULT NULL,
  `res_line_order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_sell_line_id` int(11) DEFAULT NULL,
  `children_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines`
--

INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `so_line_id`, `so_quantity_invoiced`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-19 04:47:51', '2022-03-19 04:47:51'),
(2, 3, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-19 05:00:03', '2022-03-19 05:00:03'),
(3, 4, 1, 1, '2.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-19 05:17:47', '2022-03-19 05:17:47'),
(4, 5, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-19 05:22:14', '2022-03-19 05:22:14'),
(5, 6, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-19 05:24:51', '2022-03-19 05:24:51'),
(6, 7, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-19 05:26:44', '2022-03-19 05:26:44'),
(7, 8, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-19 05:27:33', '2022-03-19 05:27:33'),
(8, 9, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 07:34:18', '2022-04-11 07:34:18'),
(9, 10, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 07:47:04', '2022-04-11 07:47:04'),
(10, 11, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 07:47:37', '2022-04-11 07:47:37'),
(11, 12, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 07:50:48', '2022-04-11 07:50:48'),
(12, 13, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 07:57:23', '2022-04-11 07:57:23'),
(13, 14, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 07:57:56', '2022-04-11 07:57:56'),
(14, 15, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 07:58:57', '2022-04-11 07:58:57'),
(15, 16, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:11:35', '2022-04-11 08:11:35'),
(16, 17, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:20:29', '2022-04-11 08:20:29'),
(17, 18, 1, 1, '2.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:21:30', '2022-04-11 08:21:30'),
(18, 19, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:22:38', '2022-04-11 08:22:38'),
(19, 20, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:24:08', '2022-04-11 08:24:08'),
(20, 21, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:28:32', '2022-04-11 08:28:32'),
(21, 22, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:32:14', '2022-04-11 08:32:14'),
(22, 23, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:33:49', '2022-04-11 08:33:49'),
(23, 24, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:35:21', '2022-04-11 08:35:21'),
(24, 25, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:35:59', '2022-04-11 08:35:59'),
(25, 26, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:36:30', '2022-04-11 08:36:30'),
(26, 27, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:38:15', '2022-04-11 08:38:15'),
(27, 28, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:39:21', '2022-04-11 08:39:21'),
(28, 29, 1, 1, '2.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:39:44', '2022-04-11 08:39:44'),
(29, 30, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:40:18', '2022-04-11 08:40:18'),
(30, 31, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:40:47', '2022-04-11 08:40:47'),
(31, 32, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:40:56', '2022-04-11 08:40:56'),
(32, 33, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:41:26', '2022-04-11 08:41:26'),
(33, 34, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:41:58', '2022-04-11 08:41:58'),
(34, 35, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:43:00', '2022-04-11 08:43:00'),
(35, 36, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:44:55', '2022-04-11 08:44:55'),
(36, 37, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:46:02', '2022-04-11 08:46:02'),
(37, 38, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:48:39', '2022-04-11 08:48:39'),
(38, 39, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:49:54', '2022-04-11 08:49:54'),
(39, 40, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:50:28', '2022-04-11 08:50:28'),
(40, 41, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:55:22', '2022-04-11 08:55:22'),
(41, 42, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 08:57:22', '2022-04-11 08:57:22'),
(42, 43, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:01:03', '2022-04-11 09:01:03'),
(43, 44, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:02:55', '2022-04-11 09:02:55'),
(44, 45, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:03:40', '2022-04-11 09:03:40'),
(45, 46, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:10:33', '2022-04-11 09:10:33'),
(46, 47, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:25:46', '2022-04-11 09:25:46'),
(47, 48, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:26:48', '2022-04-11 09:26:48'),
(48, 49, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:29:25', '2022-04-11 09:29:25'),
(49, 50, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:30:03', '2022-04-11 09:30:03'),
(50, 51, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:30:47', '2022-04-11 09:30:47'),
(51, 52, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:33:08', '2022-04-11 09:33:08'),
(52, 53, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:34:36', '2022-04-11 09:34:36'),
(53, 54, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:34:43', '2022-04-11 09:34:43'),
(54, 55, 1, 1, '2.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:35:01', '2022-04-11 09:35:01'),
(55, 56, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:35:53', '2022-04-11 09:35:53'),
(56, 57, 1, 1, '2.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:39:13', '2022-04-11 09:39:13'),
(57, 58, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:45:52', '2022-04-11 09:45:52'),
(58, 59, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:47:45', '2022-04-11 09:47:45'),
(59, 60, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:48:09', '2022-04-11 09:48:09'),
(60, 61, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:48:56', '2022-04-11 09:48:56'),
(61, 62, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:50:54', '2022-04-11 09:50:54'),
(62, 63, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:52:15', '2022-04-11 09:52:15'),
(63, 64, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:54:32', '2022-04-11 09:54:32'),
(64, 65, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:55:27', '2022-04-11 09:55:27'),
(65, 66, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:55:44', '2022-04-11 09:55:44'),
(66, 67, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:56:31', '2022-04-11 09:56:31'),
(67, 68, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 09:57:31', '2022-04-11 09:57:31'),
(68, 69, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 10:32:00', '2022-04-11 10:32:00'),
(69, 70, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 10:36:32', '2022-04-11 10:36:32'),
(70, 71, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 10:37:40', '2022-04-11 10:37:40'),
(71, 72, 1, 1, '2.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 10:41:34', '2022-04-11 10:41:34'),
(72, 73, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 10:42:53', '2022-04-11 10:42:53'),
(73, 74, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 10:47:00', '2022-04-11 10:47:00'),
(74, 75, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 10:47:21', '2022-04-11 10:47:21'),
(75, 76, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 10:54:35', '2022-04-11 10:54:35'),
(76, 77, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 10:56:50', '2022-04-11 10:56:50'),
(77, 78, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 10:59:12', '2022-04-11 10:59:12'),
(78, 79, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 11:01:01', '2022-04-11 11:01:01'),
(79, 80, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 11:01:10', '2022-04-11 11:01:10'),
(80, 81, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 11:01:40', '2022-04-11 11:01:40'),
(81, 82, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 11:09:11', '2022-04-11 11:09:11'),
(82, 83, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 11:10:12', '2022-04-11 11:10:12'),
(83, 84, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 11:10:48', '2022-04-11 11:10:48'),
(84, 85, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 11:20:52', '2022-04-11 11:20:52'),
(85, 86, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 11:22:26', '2022-04-11 11:22:26'),
(86, 87, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 11:23:52', '2022-04-11 11:23:52'),
(87, 88, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 11:27:55', '2022-04-11 11:27:55'),
(88, 89, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 11:29:36', '2022-04-11 11:29:36'),
(89, 90, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 11:31:20', '2022-04-11 11:31:20'),
(90, 91, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 11:32:56', '2022-04-11 11:32:56'),
(91, 92, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 11:34:37', '2022-04-11 11:34:37'),
(92, 93, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 11:36:22', '2022-04-11 11:36:22'),
(93, 94, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 11:38:38', '2022-04-11 11:38:38'),
(94, 95, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 11:41:22', '2022-04-11 11:41:22'),
(95, 96, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 11:56:59', '2022-04-11 11:56:59'),
(96, 97, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-11 11:59:47', '2022-04-11 11:59:47'),
(97, 98, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-12 02:49:51', '2022-04-12 02:49:51'),
(98, 99, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-12 02:51:25', '2022-04-12 02:51:25'),
(99, 100, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-12 03:00:25', '2022-04-12 03:00:25'),
(100, 101, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-12 03:11:33', '2022-04-12 03:11:33'),
(101, 102, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-12 03:12:01', '2022-04-12 03:12:01'),
(102, 103, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-12 03:16:58', '2022-04-12 03:16:58'),
(103, 104, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-12 03:17:50', '2022-04-12 03:17:50'),
(104, 105, 1, 1, '2.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-12 03:18:10', '2022-04-12 03:18:10'),
(105, 106, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-12 03:29:37', '2022-04-12 03:29:37'),
(106, 107, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-12 03:31:13', '2022-04-12 03:31:13'),
(107, 108, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-12 03:36:08', '2022-04-12 03:36:08'),
(108, 109, 1, 1, '2.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-12 03:40:13', '2022-04-12 03:40:13'),
(109, 110, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-12 03:41:35', '2022-04-12 03:41:35'),
(110, 111, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-12 03:46:07', '2022-04-12 03:46:07'),
(111, 112, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-12 03:46:20', '2022-04-12 03:46:20'),
(112, 113, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-12 03:50:07', '2022-04-12 03:50:07'),
(113, 114, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-12 03:57:44', '2022-04-12 03:57:44'),
(114, 115, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-12 03:59:47', '2022-04-12 03:59:47'),
(115, 116, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-12 04:01:38', '2022-04-12 04:01:38'),
(116, 117, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-12 04:11:41', '2022-04-12 04:11:41'),
(117, 118, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-12 04:15:58', '2022-04-12 04:15:58'),
(118, 119, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 04:30:41', '2022-04-13 04:30:41'),
(119, 120, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 04:30:51', '2022-04-13 04:30:51'),
(120, 121, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 04:30:58', '2022-04-13 04:30:58'),
(121, 122, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 04:56:09', '2022-04-13 04:56:09'),
(122, 123, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 04:56:30', '2022-04-13 04:56:30'),
(123, 124, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 04:57:44', '2022-04-13 04:57:44'),
(124, 125, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 04:58:18', '2022-04-13 04:58:18'),
(125, 126, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 06:51:21', '2022-04-13 06:51:21'),
(126, 127, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 06:52:03', '2022-04-13 06:52:03'),
(127, 128, 1, 1, '2.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 08:16:15', '2022-04-13 08:16:15'),
(128, 129, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 08:25:56', '2022-04-13 08:25:56'),
(129, 130, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 08:28:41', '2022-04-13 08:28:41'),
(130, 131, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 08:41:10', '2022-04-13 08:41:10'),
(131, 132, 1, 1, '3.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 08:42:35', '2022-04-13 08:42:35'),
(132, 133, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 08:47:29', '2022-04-13 08:47:29'),
(133, 134, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 08:48:16', '2022-04-13 08:48:16'),
(134, 135, 1, 1, '2.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 08:49:37', '2022-04-13 08:49:37'),
(135, 136, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 08:51:45', '2022-04-13 08:51:45'),
(136, 137, 1, 1, '2.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 09:00:51', '2022-04-13 09:00:51'),
(137, 138, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 09:03:12', '2022-04-13 09:03:12'),
(138, 139, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 09:19:37', '2022-04-13 09:19:37'),
(139, 140, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 09:23:57', '2022-04-13 09:23:57'),
(140, 141, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 09:25:49', '2022-04-13 09:25:49'),
(141, 142, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 09:27:18', '2022-04-13 09:27:18'),
(142, 143, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 09:28:13', '2022-04-13 09:28:13'),
(143, 144, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 09:30:33', '2022-04-13 09:30:33'),
(144, 145, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 09:30:45', '2022-04-13 09:30:45'),
(145, 146, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 09:32:07', '2022-04-13 09:32:07'),
(146, 147, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 09:33:01', '2022-04-13 09:33:01'),
(147, 148, 1, 1, '2.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 09:42:56', '2022-04-13 09:42:56'),
(148, 149, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 09:44:13', '2022-04-13 09:44:13'),
(149, 150, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 09:45:33', '2022-04-13 09:45:33'),
(150, 151, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 09:46:00', '2022-04-13 09:46:00'),
(151, 152, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 09:47:37', '2022-04-13 09:47:37'),
(152, 153, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 09:51:27', '2022-04-13 09:51:27'),
(153, 154, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 09:53:41', '2022-04-13 09:53:41'),
(154, 155, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 09:56:28', '2022-04-13 09:56:28'),
(155, 156, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 09:58:33', '2022-04-13 09:58:33'),
(156, 157, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 09:59:15', '2022-04-13 09:59:15'),
(157, 158, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 10:31:35', '2022-04-13 10:31:35'),
(158, 159, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 10:37:34', '2022-04-13 10:37:34'),
(159, 160, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 10:37:46', '2022-04-13 10:37:46'),
(160, 161, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 10:38:11', '2022-04-13 10:38:11'),
(161, 162, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 10:51:59', '2022-04-13 10:51:59'),
(162, 163, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 10:52:51', '2022-04-13 10:52:51'),
(163, 164, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 10:55:32', '2022-04-13 10:55:32'),
(164, 165, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 10:58:20', '2022-04-13 10:58:20'),
(165, 166, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:06:16', '2022-04-13 11:06:16'),
(166, 167, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:11:06', '2022-04-13 11:11:06'),
(167, 168, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:13:53', '2022-04-13 11:13:53'),
(168, 169, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:14:48', '2022-04-13 11:14:48'),
(169, 170, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:15:16', '2022-04-13 11:15:16'),
(170, 171, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:21:45', '2022-04-13 11:21:45'),
(171, 172, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:22:33', '2022-04-13 11:22:33'),
(172, 173, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:24:29', '2022-04-13 11:24:29'),
(173, 174, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:25:03', '2022-04-13 11:25:03'),
(174, 175, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:25:29', '2022-04-13 11:25:29'),
(175, 176, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:26:40', '2022-04-13 11:26:40'),
(176, 177, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:27:11', '2022-04-13 11:27:11'),
(177, 178, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:28:35', '2022-04-13 11:28:35'),
(178, 179, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:29:53', '2022-04-13 11:29:53'),
(179, 180, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:30:56', '2022-04-13 11:30:56'),
(180, 181, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:31:23', '2022-04-13 11:31:23'),
(181, 182, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:31:45', '2022-04-13 11:31:45'),
(182, 183, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:32:11', '2022-04-13 11:32:11'),
(183, 184, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:33:04', '2022-04-13 11:33:04'),
(184, 185, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:33:39', '2022-04-13 11:33:39'),
(185, 186, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:34:08', '2022-04-13 11:34:08'),
(186, 187, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:34:53', '2022-04-13 11:34:53'),
(187, 188, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:35:38', '2022-04-13 11:35:38'),
(188, 189, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:36:02', '2022-04-13 11:36:02'),
(189, 190, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:37:43', '2022-04-13 11:37:43'),
(190, 191, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:38:59', '2022-04-13 11:38:59'),
(191, 192, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:39:19', '2022-04-13 11:39:19'),
(192, 193, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:41:19', '2022-04-13 11:41:19'),
(193, 194, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:41:56', '2022-04-13 11:41:56'),
(194, 195, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:42:37', '2022-04-13 11:42:37'),
(195, 196, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:45:29', '2022-04-13 11:45:29'),
(196, 197, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:45:34', '2022-04-13 11:45:34'),
(197, 198, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:46:16', '2022-04-13 11:46:16'),
(198, 199, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:46:41', '2022-04-13 11:46:41'),
(199, 200, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:50:04', '2022-04-13 11:50:04'),
(200, 201, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:50:43', '2022-04-13 11:50:43'),
(201, 202, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:51:54', '2022-04-13 11:51:54'),
(202, 203, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:52:31', '2022-04-13 11:52:31'),
(203, 204, 1, 1, '2.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:53:22', '2022-04-13 11:53:22'),
(204, 205, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:53:47', '2022-04-13 11:53:47'),
(205, 206, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:55:21', '2022-04-13 11:55:21'),
(206, 207, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:55:54', '2022-04-13 11:55:54'),
(207, 208, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:56:41', '2022-04-13 11:56:41'),
(208, 209, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:57:07', '2022-04-13 11:57:07'),
(209, 210, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:57:30', '2022-04-13 11:57:30'),
(210, 211, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:58:04', '2022-04-13 11:58:04'),
(211, 212, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 11:59:20', '2022-04-13 11:59:20'),
(212, 213, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:01:13', '2022-04-13 12:01:13'),
(213, 214, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:02:36', '2022-04-13 12:02:36'),
(214, 215, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:03:25', '2022-04-13 12:03:25'),
(215, 216, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:03:56', '2022-04-13 12:03:56'),
(216, 217, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:06:19', '2022-04-13 12:06:19'),
(217, 218, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:07:55', '2022-04-13 12:07:55'),
(218, 219, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:09:44', '2022-04-13 12:09:44'),
(219, 220, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:11:04', '2022-04-13 12:11:04'),
(220, 221, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:11:24', '2022-04-13 12:11:24'),
(221, 222, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:13:01', '2022-04-13 12:13:01'),
(222, 223, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:14:53', '2022-04-13 12:14:53'),
(223, 224, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:15:29', '2022-04-13 12:15:29'),
(224, 225, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:16:25', '2022-04-13 12:16:25'),
(225, 226, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:16:38', '2022-04-13 12:16:38'),
(226, 227, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:17:41', '2022-04-13 12:17:41'),
(227, 228, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:18:19', '2022-04-13 12:18:19'),
(228, 229, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:18:43', '2022-04-13 12:18:43'),
(229, 230, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:19:52', '2022-04-13 12:19:52'),
(230, 231, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:20:20', '2022-04-13 12:20:20');
INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `so_line_id`, `so_quantity_invoiced`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(231, 232, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:21:13', '2022-04-13 12:21:13'),
(232, 233, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:26:20', '2022-04-13 12:26:20'),
(233, 234, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:27:29', '2022-04-13 12:27:29'),
(234, 235, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:28:36', '2022-04-13 12:28:36'),
(235, 236, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:29:46', '2022-04-13 12:29:46'),
(236, 237, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:31:37', '2022-04-13 12:31:37'),
(237, 238, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:32:46', '2022-04-13 12:32:46'),
(238, 239, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:34:13', '2022-04-13 12:34:13'),
(239, 240, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:35:02', '2022-04-13 12:35:02'),
(240, 241, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:40:42', '2022-04-13 12:40:42'),
(241, 242, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:41:47', '2022-04-13 12:41:47'),
(242, 243, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:46:50', '2022-04-13 12:46:50'),
(243, 244, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:47:37', '2022-04-13 12:47:37'),
(244, 245, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:48:57', '2022-04-13 12:48:57'),
(245, 246, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:49:32', '2022-04-13 12:49:32'),
(246, 247, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:51:26', '2022-04-13 12:51:26'),
(247, 248, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:52:21', '2022-04-13 12:52:21'),
(248, 249, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:53:34', '2022-04-13 12:53:34'),
(249, 250, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:54:29', '2022-04-13 12:54:29'),
(250, 251, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:57:29', '2022-04-13 12:57:29'),
(251, 252, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:58:23', '2022-04-13 12:58:23'),
(252, 253, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:58:49', '2022-04-13 12:58:49'),
(253, 254, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:59:29', '2022-04-13 12:59:29'),
(254, 255, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 12:59:56', '2022-04-13 12:59:56'),
(255, 256, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:00:43', '2022-04-13 13:00:43'),
(256, 257, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:01:14', '2022-04-13 13:01:14'),
(257, 258, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:03:01', '2022-04-13 13:03:01'),
(258, 259, 1, 1, '2.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:04:00', '2022-04-13 13:04:00'),
(259, 260, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:04:58', '2022-04-13 13:04:58'),
(260, 261, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:06:58', '2022-04-13 13:06:58'),
(261, 262, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:08:31', '2022-04-13 13:08:31'),
(262, 263, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:09:27', '2022-04-13 13:09:27'),
(263, 264, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:24:30', '2022-04-13 13:24:30'),
(264, 265, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:25:09', '2022-04-13 13:25:09'),
(265, 266, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:25:59', '2022-04-13 13:25:59'),
(266, 267, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:27:49', '2022-04-13 13:27:49'),
(267, 268, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:28:17', '2022-04-13 13:28:17'),
(268, 269, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:30:44', '2022-04-13 13:30:44'),
(269, 270, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:31:45', '2022-04-13 13:31:45'),
(270, 271, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:32:15', '2022-04-13 13:32:15'),
(271, 273, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:34:02', '2022-04-13 13:34:02'),
(272, 273, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:34:02', '2022-04-13 13:34:02'),
(273, 274, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:34:08', '2022-04-13 13:34:08'),
(274, 275, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:34:55', '2022-04-13 13:34:55'),
(275, 276, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:36:43', '2022-04-13 13:36:43'),
(276, 277, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:37:21', '2022-04-13 13:37:21'),
(277, 278, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:38:33', '2022-04-13 13:38:33'),
(278, 279, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:39:22', '2022-04-13 13:39:22'),
(279, 280, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:39:43', '2022-04-13 13:39:43'),
(280, 281, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:39:49', '2022-04-13 13:39:49'),
(281, 282, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:40:37', '2022-04-13 13:40:37'),
(282, 283, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:40:51', '2022-04-13 13:40:51'),
(283, 284, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:41:25', '2022-04-13 13:41:25'),
(284, 284, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:41:25', '2022-04-13 13:41:25'),
(285, 285, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:42:21', '2022-04-13 13:42:21'),
(286, 286, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:42:58', '2022-04-13 13:42:58'),
(287, 287, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:43:33', '2022-04-13 13:43:33'),
(288, 288, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:44:13', '2022-04-13 13:44:13'),
(289, 289, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:44:44', '2022-04-13 13:44:44'),
(290, 290, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:45:39', '2022-04-13 13:45:39'),
(291, 291, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:45:50', '2022-04-13 13:45:50'),
(292, 292, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:46:59', '2022-04-13 13:46:59'),
(293, 293, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:47:48', '2022-04-13 13:47:48'),
(294, 294, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:48:41', '2022-04-13 13:48:41'),
(295, 295, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:49:32', '2022-04-13 13:49:32'),
(296, 296, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:50:53', '2022-04-13 13:50:53'),
(297, 297, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:52:27', '2022-04-13 13:52:27'),
(298, 298, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:53:13', '2022-04-13 13:53:13'),
(299, 299, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:54:16', '2022-04-13 13:54:16'),
(300, 300, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:54:44', '2022-04-13 13:54:44'),
(301, 301, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:55:10', '2022-04-13 13:55:10'),
(302, 302, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:55:50', '2022-04-13 13:55:50'),
(303, 303, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:56:13', '2022-04-13 13:56:13'),
(304, 304, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:56:32', '2022-04-13 13:56:32'),
(305, 305, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:57:06', '2022-04-13 13:57:06'),
(306, 306, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:57:34', '2022-04-13 13:57:34'),
(307, 307, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:58:53', '2022-04-13 13:58:53'),
(308, 308, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:59:21', '2022-04-13 13:59:21'),
(309, 309, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 13:59:43', '2022-04-13 13:59:43'),
(310, 310, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:01:03', '2022-04-13 14:01:03'),
(311, 311, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:02:28', '2022-04-13 14:02:28'),
(312, 312, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:03:39', '2022-04-13 14:03:39'),
(313, 313, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:04:54', '2022-04-13 14:04:54'),
(314, 314, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:07:44', '2022-04-13 14:07:44'),
(315, 315, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:10:09', '2022-04-13 14:10:09'),
(316, 316, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:10:34', '2022-04-13 14:10:34'),
(317, 317, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:12:40', '2022-04-13 14:12:40'),
(318, 318, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:13:11', '2022-04-13 14:13:11'),
(319, 319, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:13:57', '2022-04-13 14:13:57'),
(320, 320, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:15:03', '2022-04-13 14:15:03'),
(321, 321, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:15:36', '2022-04-13 14:15:36'),
(322, 322, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:16:45', '2022-04-13 14:16:45'),
(323, 323, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:17:23', '2022-04-13 14:17:23'),
(324, 324, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:18:04', '2022-04-13 14:18:04'),
(325, 325, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:18:32', '2022-04-13 14:18:32'),
(326, 325, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:18:32', '2022-04-13 14:18:32'),
(327, 326, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:20:29', '2022-04-13 14:20:29'),
(328, 327, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:20:58', '2022-04-13 14:20:58'),
(329, 328, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:23:23', '2022-04-13 14:23:23'),
(330, 329, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:25:21', '2022-04-13 14:25:21'),
(331, 330, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:27:31', '2022-04-13 14:27:31'),
(332, 331, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:27:46', '2022-04-13 14:27:46'),
(333, 332, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:29:22', '2022-04-13 14:29:22'),
(334, 332, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:29:22', '2022-04-13 14:29:22'),
(335, 333, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:30:58', '2022-04-13 14:30:58'),
(336, 333, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:30:58', '2022-04-13 14:30:58'),
(337, 334, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:33:08', '2022-04-13 14:33:08'),
(338, 335, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:34:17', '2022-04-13 14:34:17'),
(339, 336, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:36:07', '2022-04-13 14:36:07'),
(340, 337, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:36:49', '2022-04-13 14:36:49'),
(341, 338, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:37:11', '2022-04-13 14:37:11'),
(342, 339, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:40:26', '2022-04-13 14:40:26'),
(343, 339, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:40:26', '2022-04-13 14:40:26'),
(344, 340, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:47:36', '2022-04-13 14:47:36'),
(345, 340, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:47:36', '2022-04-13 14:47:36'),
(346, 341, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:48:44', '2022-04-13 14:48:44'),
(347, 342, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:49:11', '2022-04-13 14:49:11'),
(348, 342, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:49:11', '2022-04-13 14:49:11'),
(349, 343, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:49:56', '2022-04-13 14:49:56'),
(350, 343, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:49:56', '2022-04-13 14:49:56'),
(351, 344, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:51:26', '2022-04-13 14:51:26'),
(352, 344, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:51:26', '2022-04-13 14:51:26'),
(353, 345, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:52:06', '2022-04-13 14:52:06'),
(354, 345, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:52:06', '2022-04-13 14:52:06'),
(355, 346, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:53:01', '2022-04-13 14:53:01'),
(356, 346, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:53:01', '2022-04-13 14:53:01'),
(357, 347, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:53:48', '2022-04-13 14:53:48'),
(358, 347, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:53:48', '2022-04-13 14:53:48'),
(359, 348, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:55:30', '2022-04-13 14:55:30'),
(360, 348, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:55:30', '2022-04-13 14:55:30'),
(361, 349, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:56:39', '2022-04-13 14:56:39'),
(362, 349, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:56:39', '2022-04-13 14:56:39'),
(363, 350, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:58:12', '2022-04-13 14:58:12'),
(364, 350, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 14:58:12', '2022-04-13 14:58:12'),
(365, 351, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:00:01', '2022-04-13 15:00:01'),
(366, 351, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:00:01', '2022-04-13 15:00:01'),
(367, 352, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:02:57', '2022-04-13 15:02:57'),
(368, 352, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:02:57', '2022-04-13 15:02:57'),
(369, 353, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:04:04', '2022-04-13 15:04:04'),
(370, 354, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:05:19', '2022-04-13 15:05:19'),
(371, 355, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:08:30', '2022-04-13 15:08:30'),
(372, 355, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:08:30', '2022-04-13 15:08:30'),
(373, 356, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:09:04', '2022-04-13 15:09:04'),
(374, 356, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:09:04', '2022-04-13 15:09:04'),
(375, 357, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:13:59', '2022-04-13 15:13:59'),
(376, 358, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:14:52', '2022-04-13 15:14:52'),
(377, 358, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:14:52', '2022-04-13 15:14:52'),
(378, 359, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:25:57', '2022-04-13 15:25:57'),
(379, 359, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:25:57', '2022-04-13 15:25:57'),
(380, 360, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:36:15', '2022-04-13 15:36:15'),
(381, 360, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:36:15', '2022-04-13 15:36:15'),
(382, 361, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:38:12', '2022-04-13 15:38:12'),
(383, 361, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:38:12', '2022-04-13 15:38:12'),
(384, 362, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:40:00', '2022-04-13 15:40:00'),
(385, 362, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:40:00', '2022-04-13 15:40:00'),
(386, 363, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:42:33', '2022-04-13 15:42:33'),
(387, 363, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:42:33', '2022-04-13 15:42:33'),
(388, 364, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:43:31', '2022-04-13 15:43:31'),
(389, 364, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:43:31', '2022-04-13 15:43:31'),
(390, 365, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:46:00', '2022-04-13 15:46:00'),
(391, 365, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:46:00', '2022-04-13 15:46:00'),
(392, 366, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:50:17', '2022-04-13 15:50:17'),
(393, 366, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:50:17', '2022-04-13 15:50:17'),
(394, 367, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:57:41', '2022-04-13 15:57:41'),
(395, 368, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:58:29', '2022-04-13 15:58:29'),
(396, 368, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:58:29', '2022-04-13 15:58:29'),
(397, 369, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:59:58', '2022-04-13 15:59:58'),
(398, 369, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 15:59:58', '2022-04-13 15:59:58'),
(399, 370, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 16:00:45', '2022-04-13 16:00:45'),
(400, 370, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 16:00:45', '2022-04-13 16:00:45'),
(401, 371, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 16:03:42', '2022-04-13 16:03:42'),
(402, 371, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 16:03:42', '2022-04-13 16:03:42'),
(403, 372, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-13 16:06:39', '2022-04-13 16:06:39'),
(404, 373, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 04:11:18', '2022-04-17 04:11:18'),
(405, 374, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 05:02:11', '2022-04-17 05:02:11'),
(406, 375, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 05:05:18', '2022-04-17 05:05:18'),
(407, 376, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 05:05:36', '2022-04-17 05:05:36'),
(408, 377, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 05:06:13', '2022-04-17 05:06:13'),
(409, 378, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 05:25:50', '2022-04-17 05:25:50'),
(410, 379, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 05:30:05', '2022-04-17 05:30:05'),
(411, 380, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 07:08:31', '2022-04-17 07:08:31'),
(412, 381, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 07:10:34', '2022-04-17 07:10:34'),
(413, 382, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 07:19:49', '2022-04-17 07:19:49'),
(414, 383, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 07:20:30', '2022-04-17 07:20:30'),
(415, 384, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 07:24:53', '2022-04-17 07:24:53'),
(416, 385, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 07:26:55', '2022-04-17 07:26:55'),
(417, 386, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 07:54:24', '2022-04-17 07:54:24'),
(418, 387, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 07:57:43', '2022-04-17 07:57:43'),
(419, 388, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 08:07:04', '2022-04-17 08:07:04'),
(420, 389, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 08:09:20', '2022-04-17 08:09:20'),
(421, 390, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 08:10:58', '2022-04-17 08:10:58'),
(422, 391, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 08:11:45', '2022-04-17 08:11:45'),
(423, 392, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 08:13:46', '2022-04-17 08:13:46'),
(424, 393, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 08:24:16', '2022-04-17 08:24:16'),
(425, 394, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 08:26:53', '2022-04-17 08:26:53'),
(426, 395, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 08:28:24', '2022-04-17 08:28:24'),
(427, 396, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 08:41:17', '2022-04-17 08:41:17'),
(428, 396, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 08:41:17', '2022-04-17 08:41:17'),
(429, 397, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 08:43:03', '2022-04-17 08:43:03'),
(430, 397, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 08:43:03', '2022-04-17 08:43:03'),
(431, 398, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 08:46:30', '2022-04-17 08:46:30'),
(432, 399, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 08:47:22', '2022-04-17 08:47:22'),
(433, 400, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 08:47:59', '2022-04-17 08:47:59'),
(434, 401, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 08:49:43', '2022-04-17 08:49:43'),
(435, 402, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 08:51:30', '2022-04-17 08:51:30'),
(436, 403, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 08:53:51', '2022-04-17 08:53:51'),
(437, 404, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 08:54:38', '2022-04-17 08:54:38'),
(438, 405, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 08:58:16', '2022-04-17 08:58:16'),
(439, 406, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 09:00:32', '2022-04-17 09:00:32'),
(440, 407, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-17 09:01:31', '2022-04-17 09:01:31'),
(453, 419, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-18 02:42:48', '2022-04-18 02:42:48'),
(455, 421, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-18 02:45:35', '2022-04-18 02:45:35'),
(456, 422, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-18 02:45:42', '2022-04-18 02:45:42'),
(457, 423, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-18 02:46:04', '2022-04-18 02:46:04'),
(458, 423, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-18 02:46:04', '2022-04-18 02:46:04'),
(459, 424, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-18 02:47:45', '2022-04-18 02:47:45'),
(460, 425, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-18 02:48:15', '2022-04-18 02:48:15'),
(461, 426, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-18 02:48:52', '2022-04-18 02:48:52'),
(476, 438, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-18 05:32:38', '2022-04-18 05:32:38'),
(477, 439, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-18 06:42:39', '2022-04-18 06:42:39'),
(478, 439, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-18 06:42:39', '2022-04-18 06:42:39'),
(479, 440, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-18 06:49:36', '2022-04-18 06:49:36'),
(480, 440, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-18 06:49:36', '2022-04-18 06:49:36'),
(481, 441, 1, 1, '1.0000', '0.0000', '2000.0000', '2000.0000', 'fixed', '0.0000', '2000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-18 07:06:19', '2022-04-18 07:06:19'),
(482, 442, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-18 08:52:24', '2022-04-18 08:52:24'),
(483, 442, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-18 08:52:24', '2022-04-18 08:52:24'),
(484, 443, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-18 08:56:28', '2022-04-18 08:56:28'),
(485, 443, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-18 08:56:28', '2022-04-18 08:56:28'),
(486, 444, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-18 09:30:27', '2022-04-18 13:43:04'),
(487, 444, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-18 09:30:27', '2022-04-18 13:43:04');
INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `so_line_id`, `so_quantity_invoiced`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(488, 445, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-27 05:59:25', '2022-04-27 05:59:25'),
(489, 445, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-27 05:59:25', '2022-04-27 05:59:25'),
(490, 446, 1, 1, '1.0000', '0.0000', '1000.0000', '1000.0000', 'fixed', '0.0000', '1000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-27 05:59:50', '2022-04-27 05:59:50'),
(491, 446, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-27 05:59:50', '2022-04-27 05:59:50'),
(492, 447, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-27 06:04:20', '2022-04-27 06:04:20'),
(493, 452, 6, 6, '1.0000', '0.0000', '3500.0000', '3500.0000', 'fixed', '0.0000', '3500.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-27 07:35:55', '2022-04-27 07:35:55'),
(494, 452, 5, 5, '2.0000', '0.0000', '4500.0000', '4500.0000', 'fixed', '0.0000', '4500.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-27 07:35:55', '2022-04-27 07:35:55'),
(495, 452, 3, 3, '1.0000', '0.0000', '10500.0000', '10500.0000', 'fixed', '0.0000', '10500.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-27 07:35:55', '2022-04-27 07:35:55'),
(496, 452, 4, 4, '1.0000', '0.0000', '6500.0000', '6500.0000', 'fixed', '0.0000', '6500.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-27 07:35:55', '2022-04-27 07:35:55'),
(497, 453, 6, 6, '1.0000', '0.0000', '3500.0000', '3500.0000', 'fixed', '0.0000', '3500.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-27 07:37:08', '2022-04-27 07:37:08'),
(498, 453, 2, 2, '1.0000', '0.0000', '12.5000', '12.5000', 'fixed', '0.0000', '12.5000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-27 07:37:08', '2022-04-27 07:37:08'),
(499, 453, 3, 3, '1.0000', '0.0000', '10500.0000', '10500.0000', 'fixed', '0.0000', '10500.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-27 07:37:08', '2022-04-27 07:37:08'),
(500, 453, 4, 4, '1.0000', '0.0000', '6500.0000', '6500.0000', 'fixed', '0.0000', '6500.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-27 07:37:08', '2022-04-27 07:37:08'),
(501, 453, 5, 5, '1.0000', '0.0000', '4500.0000', '4500.0000', 'fixed', '0.0000', '4500.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-27 07:37:08', '2022-04-27 07:37:08'),
(502, 455, 7, 7, '1.0000', '0.0000', '24000.0000', '24000.0000', 'fixed', '0.0000', '24000.0000', '0.0000', NULL, NULL, NULL, '123456', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-05-01 02:05:50', '2022-05-01 02:05:50'),
(503, 456, 7, 7, '1.0000', '0.0000', '24000.0000', '24000.0000', 'fixed', '0.0000', '24000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-05-01 02:07:48', '2022-05-01 02:07:48'),
(504, 457, 7, 7, '1.0000', '0.0000', '24000.0000', '24000.0000', 'fixed', '0.0000', '24000.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-05-01 03:14:40', '2022-05-01 03:14:40'),
(505, 458, 4, 4, '1.0000', '0.0000', '6500.0000', '6500.0000', 'fixed', '0.0000', '6500.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-05-01 03:16:43', '2022-05-01 03:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `sell_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int(10) UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines_purchase_lines`
--

INSERT INTO `transaction_sell_lines_purchase_lines` (`id`, `sell_line_id`, `stock_adjustment_line_id`, `purchase_line_id`, `quantity`, `qty_returned`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, '1.0000', '0.0000', '2022-03-19 04:47:51', '2022-03-19 04:47:51'),
(2, 2, NULL, 1, '1.0000', '0.0000', '2022-03-19 05:00:03', '2022-03-19 05:00:03'),
(3, 3, NULL, 1, '2.0000', '0.0000', '2022-03-19 05:17:47', '2022-03-19 05:17:47'),
(4, 4, NULL, 1, '1.0000', '0.0000', '2022-03-19 05:22:14', '2022-03-19 05:22:14'),
(5, 5, NULL, 1, '1.0000', '0.0000', '2022-03-19 05:24:51', '2022-03-19 05:24:51'),
(6, 6, NULL, 1, '1.0000', '0.0000', '2022-03-19 05:26:44', '2022-03-19 05:26:44'),
(7, 7, NULL, 1, '1.0000', '0.0000', '2022-03-19 05:27:33', '2022-03-19 05:27:33'),
(8, 44, NULL, 1, '1.0000', '0.0000', '2022-04-11 09:03:40', '2022-04-11 09:03:40'),
(9, 45, NULL, 1, '1.0000', '0.0000', '2022-04-11 09:10:33', '2022-04-11 09:10:33'),
(10, 47, NULL, 1, '1.0000', '0.0000', '2022-04-11 09:26:48', '2022-04-11 09:26:48'),
(11, 50, NULL, 1, '1.0000', '0.0000', '2022-04-11 09:30:47', '2022-04-11 09:30:47'),
(12, 79, NULL, 1, '1.0000', '0.0000', '2022-04-11 11:01:10', '2022-04-11 11:01:10'),
(13, 89, NULL, 1, '1.0000', '0.0000', '2022-04-11 11:31:20', '2022-04-11 11:31:20'),
(14, 99, NULL, 1, '1.0000', '0.0000', '2022-04-12 03:00:25', '2022-04-12 03:00:25'),
(15, 117, NULL, 1, '1.0000', '0.0000', '2022-04-12 04:15:58', '2022-04-12 04:15:58'),
(16, 120, NULL, 1, '1.0000', '0.0000', '2022-04-13 04:30:58', '2022-04-13 04:30:58'),
(17, 158, NULL, 1, '1.0000', '0.0000', '2022-04-13 10:37:34', '2022-04-13 10:37:34'),
(18, 403, NULL, 1, '1.0000', '0.0000', '2022-04-13 16:06:39', '2022-04-13 16:06:39'),
(19, 404, NULL, 1, '1.0000', '0.0000', '2022-04-17 04:11:18', '2022-04-17 04:11:18'),
(20, 405, NULL, 1, '1.0000', '0.0000', '2022-04-17 05:02:11', '2022-04-17 05:02:11'),
(21, 406, NULL, 1, '1.0000', '0.0000', '2022-04-17 05:05:18', '2022-04-17 05:05:18'),
(22, 407, NULL, 1, '1.0000', '0.0000', '2022-04-17 05:05:36', '2022-04-17 05:05:36'),
(23, 408, NULL, 1, '1.0000', '0.0000', '2022-04-17 05:06:13', '2022-04-17 05:06:13'),
(24, 409, NULL, 1, '1.0000', '0.0000', '2022-04-17 05:25:51', '2022-04-17 05:25:51'),
(25, 410, NULL, 1, '1.0000', '0.0000', '2022-04-17 05:30:05', '2022-04-17 05:30:05'),
(26, 411, NULL, 1, '1.0000', '0.0000', '2022-04-17 07:08:31', '2022-04-17 07:08:31'),
(27, 412, NULL, 1, '1.0000', '0.0000', '2022-04-17 07:10:34', '2022-04-17 07:10:34'),
(28, 413, NULL, 1, '1.0000', '0.0000', '2022-04-17 07:19:49', '2022-04-17 07:19:49'),
(29, 414, NULL, 1, '1.0000', '0.0000', '2022-04-17 07:20:30', '2022-04-17 07:20:30'),
(30, 415, NULL, 1, '1.0000', '0.0000', '2022-04-17 07:24:53', '2022-04-17 07:24:53'),
(31, 416, NULL, 1, '1.0000', '0.0000', '2022-04-17 07:26:55', '2022-04-17 07:26:55'),
(32, 417, NULL, 1, '1.0000', '0.0000', '2022-04-17 07:54:24', '2022-04-17 07:54:24'),
(33, 418, NULL, 1, '1.0000', '0.0000', '2022-04-17 07:57:43', '2022-04-17 07:57:43'),
(34, 419, NULL, 1, '1.0000', '0.0000', '2022-04-17 08:07:04', '2022-04-17 08:07:04'),
(35, 420, NULL, 1, '1.0000', '0.0000', '2022-04-17 08:09:20', '2022-04-17 08:09:20'),
(36, 421, NULL, 1, '1.0000', '0.0000', '2022-04-17 08:10:58', '2022-04-17 08:10:58'),
(37, 422, NULL, 1, '1.0000', '0.0000', '2022-04-17 08:11:45', '2022-04-17 08:11:45'),
(38, 423, NULL, 1, '1.0000', '0.0000', '2022-04-17 08:13:46', '2022-04-17 08:13:46'),
(39, 424, NULL, 1, '1.0000', '0.0000', '2022-04-17 08:24:16', '2022-04-17 08:24:16'),
(40, 425, NULL, 1, '1.0000', '0.0000', '2022-04-17 08:26:53', '2022-04-17 08:26:53'),
(41, 426, NULL, 1, '1.0000', '0.0000', '2022-04-17 08:28:24', '2022-04-17 08:28:24'),
(42, 427, NULL, 1, '1.0000', '0.0000', '2022-04-17 08:41:17', '2022-04-17 08:41:17'),
(43, 428, NULL, 2, '1.0000', '0.0000', '2022-04-17 08:41:17', '2022-04-17 08:41:17'),
(44, 429, NULL, 1, '1.0000', '0.0000', '2022-04-17 08:43:03', '2022-04-17 08:43:03'),
(45, 430, NULL, 2, '1.0000', '0.0000', '2022-04-17 08:43:03', '2022-04-17 08:43:03'),
(46, 431, NULL, 1, '1.0000', '0.0000', '2022-04-17 08:46:30', '2022-04-17 08:46:30'),
(47, 432, NULL, 1, '1.0000', '0.0000', '2022-04-17 08:47:22', '2022-04-17 08:47:22'),
(48, 433, NULL, 1, '1.0000', '0.0000', '2022-04-17 08:47:59', '2022-04-17 08:47:59'),
(49, 434, NULL, 2, '1.0000', '0.0000', '2022-04-17 08:49:43', '2022-04-17 08:49:43'),
(50, 435, NULL, 1, '1.0000', '0.0000', '2022-04-17 08:51:30', '2022-04-17 08:51:30'),
(51, 436, NULL, 1, '1.0000', '0.0000', '2022-04-17 08:53:51', '2022-04-17 08:53:51'),
(52, 437, NULL, 1, '1.0000', '0.0000', '2022-04-17 08:54:38', '2022-04-17 08:54:38'),
(53, 438, NULL, 1, '1.0000', '0.0000', '2022-04-17 08:58:16', '2022-04-17 08:58:16'),
(54, 439, NULL, 1, '1.0000', '0.0000', '2022-04-17 09:00:32', '2022-04-17 09:00:32'),
(55, 440, NULL, 1, '1.0000', '0.0000', '2022-04-17 09:01:31', '2022-04-17 09:01:31'),
(82, 476, NULL, 1, '1.0000', '0.0000', '2022-04-18 05:32:38', '2022-04-18 05:32:38'),
(83, 477, NULL, 1, '1.0000', '0.0000', '2022-04-18 06:42:39', '2022-04-18 06:42:39'),
(84, 478, NULL, 2, '1.0000', '0.0000', '2022-04-18 06:42:39', '2022-04-18 06:42:39'),
(85, 481, NULL, 1, '1.0000', '0.0000', '2022-04-18 07:06:19', '2022-04-18 07:06:19'),
(86, 482, NULL, 1, '1.0000', '0.0000', '2022-04-18 08:52:24', '2022-04-18 08:52:24'),
(87, 483, NULL, 2, '1.0000', '0.0000', '2022-04-18 08:52:24', '2022-04-18 08:52:24'),
(88, 484, NULL, 1, '1.0000', '0.0000', '2022-04-18 08:56:28', '2022-04-18 08:56:28'),
(89, 485, NULL, 2, '1.0000', '0.0000', '2022-04-18 08:56:28', '2022-04-18 08:56:28'),
(90, 486, NULL, 1, '1.0000', '0.0000', '2022-04-18 09:30:27', '2022-04-18 09:30:27'),
(91, 487, NULL, 2, '1.0000', '0.0000', '2022-04-18 09:30:27', '2022-04-18 09:30:27'),
(92, 490, NULL, 1, '1.0000', '0.0000', '2022-04-27 05:59:50', '2022-04-27 05:59:50'),
(93, 491, NULL, 2, '1.0000', '0.0000', '2022-04-27 05:59:50', '2022-04-27 05:59:50'),
(94, 492, NULL, 2, '1.0000', '0.0000', '2022-04-27 06:04:20', '2022-04-27 06:04:20'),
(95, 497, NULL, 6, '1.0000', '0.0000', '2022-04-27 07:37:08', '2022-04-27 07:37:08'),
(96, 498, NULL, 2, '1.0000', '0.0000', '2022-04-27 07:37:08', '2022-04-27 07:37:08'),
(97, 499, NULL, 3, '1.0000', '0.0000', '2022-04-27 07:37:08', '2022-04-27 07:37:08'),
(98, 500, NULL, 4, '1.0000', '0.0000', '2022-04-27 07:37:08', '2022-04-27 07:37:08'),
(99, 501, NULL, 5, '1.0000', '0.0000', '2022-04-27 07:37:08', '2022-04-27 07:37:08'),
(100, 502, NULL, 7, '1.0000', '0.0000', '2022-05-01 02:05:50', '2022-05-01 02:05:50'),
(101, 503, NULL, 7, '1.0000', '0.0000', '2022-05-01 02:07:48', '2022-05-01 02:07:48'),
(102, 504, NULL, 7, '1.0000', '0.0000', '2022-05-01 03:14:40', '2022-05-01 03:14:40'),
(103, 505, NULL, 4, '1.0000', '0.0000', '2022-05-01 03:16:43', '2022-05-01 03:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `types_of_services`
--

CREATE TABLE `types_of_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `business_id` int(11) NOT NULL,
  `location_price_group` text COLLATE utf8mb4_unicode_ci,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types_of_services`
--

INSERT INTO `types_of_services` (`id`, `name`, `description`, `business_id`, `location_price_group`, `packing_charge`, `packing_charge_type`, `enable_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Service Fee', NULL, 1, '{\"1\":\"0\"}', '0.0000', 'fixed', 0, '2022-04-18 05:25:30', '2022-04-18 06:41:04');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `actual_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int(11) DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `base_unit_id`, `base_unit_multiplier`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pieces', 'Pc(s)', 0, NULL, NULL, 1, NULL, '2022-03-19 04:38:49', '2022-03-19 04:38:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `surname` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `contact_no` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `max_sales_discount_percent` decimal(5,2) DEFAULT NULL,
  `allow_login` tinyint(1) NOT NULL DEFAULT '1',
  `status` enum('active','inactive','terminated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `crm_contact_id` int(10) UNSIGNED DEFAULT NULL,
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT '0',
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT '0.00',
  `selected_contacts` tinyint(1) NOT NULL DEFAULT '0',
  `dob` date DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `family_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` text COLLATE utf8mb4_unicode_ci,
  `current_address` text COLLATE utf8mb4_unicode_ci,
  `guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` longtext COLLATE utf8mb4_unicode_ci,
  `id_proof_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_proof_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `max_sales_discount_percent`, `allow_login`, `status`, `crm_contact_id`, `is_cmmsn_agnt`, `cmmsn_percent`, `selected_contacts`, `dob`, `gender`, `marital_status`, `blood_group`, `contact_number`, `alt_number`, `family_number`, `fb_link`, `twitter_link`, `social_media_1`, `social_media_2`, `permanent_address`, `current_address`, `guardian_name`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `bank_details`, `id_proof_name`, `id_proof_number`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'user', 'Mr', 'Asiri', NULL, 'adm-asiri', 'lucianmacwolf4@gmail.com', '$2y$10$mq0xmJxMKVCo6YUDtPsUVuRN/kI8g4yZX5Nf75dWX0NAIlfa479Yi', 'en', NULL, NULL, 'Y4U4VZbwMI6SBuuNvqFBwaNzmmhiCcufppPhji17UWNwn7thCrTExxwvbzSE', 1, NULL, 1, 'active', NULL, 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-19 04:38:49', '2022-03-19 04:38:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_access`
--

CREATE TABLE `user_contact_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `sub_sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL,
  `variation_value_id` int(11) DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `profit_percent` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text COLLATE utf8mb4_unicode_ci COMMENT 'Contains the combo variation details'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(1, 'DUMMY', 1, '0001', 1, NULL, '1000.0000', '1000.0000', '0.0000', '1000.0000', '1000.0000', '2022-03-19 04:46:00', '2022-04-27 10:00:53', NULL, '[]'),
(2, 'DUMMY', 2, '0002', 2, NULL, '10.0000', '10.0000', '25.0000', '12.5000', '12.5000', '2022-04-13 13:25:35', '2022-04-13 13:26:32', NULL, '[]'),
(3, 'DUMMY', 3, '0003', 3, NULL, '10500.0000', '10500.0000', '0.0000', '10500.0000', '10500.0000', '2022-04-27 06:32:52', '2022-04-27 06:32:52', NULL, '[]'),
(4, 'DUMMY', 4, '0004', 4, NULL, '5200.0000', '5200.0000', '25.0000', '6500.0000', '6500.0000', '2022-04-27 06:47:28', '2022-04-27 06:47:28', NULL, '[]'),
(5, 'DUMMY', 5, '0005', 5, NULL, '4500.0000', '4500.0000', '0.0000', '4500.0000', '4500.0000', '2022-04-27 07:04:32', '2022-04-27 07:04:32', NULL, '[]'),
(6, 'DUMMY', 6, '0006', 6, NULL, '3500.0000', '3500.0000', '0.0000', '3500.0000', '3500.0000', '2022-04-27 07:27:44', '2022-04-27 07:27:44', NULL, '[]'),
(7, 'DUMMY', 7, '0007', 7, NULL, '25000.0000', '0.0000', '0.0000', '24000.0000', '24000.0000', '2022-04-30 05:51:37', '2022-05-01 03:13:55', NULL, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `variation_group_prices`
--

CREATE TABLE `variation_group_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `price_group_id` int(10) UNSIGNED NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_location_details`
--

CREATE TABLE `variation_location_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `qty_available` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_location_details`
--

INSERT INTO `variation_location_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `location_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, '140.0000', '2022-03-19 04:47:31', '2022-04-27 10:05:30'),
(2, 2, 2, 2, 1, '8.0000', '2022-04-13 13:33:50', '2022-04-27 10:02:47'),
(3, 3, 3, 3, 1, '4.0000', '2022-04-27 06:33:25', '2022-04-27 07:37:08'),
(4, 4, 4, 4, 1, '3.0000', '2022-04-27 06:47:51', '2022-05-01 03:16:43'),
(5, 5, 5, 5, 1, '4.0000', '2022-04-27 07:04:46', '2022-04-27 07:37:08'),
(6, 6, 6, 6, 1, '4.0000', '2022-04-27 07:29:09', '2022-04-27 07:37:08'),
(7, 7, 7, 7, 1, '997.0000', '2022-05-01 02:04:56', '2022-05-01 03:14:40');

-- --------------------------------------------------------

--
-- Table structure for table `variation_templates`
--

CREATE TABLE `variation_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_value_templates`
--

CREATE TABLE `variation_value_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variation_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warranties`
--

CREATE TABLE `warranties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `duration` int(11) NOT NULL,
  `duration_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warranties`
--

INSERT INTO `warranties` (`id`, `name`, `business_id`, `description`, `duration`, `duration_type`, `created_at`, `updated_at`) VALUES
(1, '24 M', 1, NULL, 24, 'months', '2022-03-19 04:41:33', '2022-04-19 09:20:38'),
(2, '12 M', 1, NULL, 12, 'months', '2022-03-19 04:42:01', '2022-04-19 09:19:42'),
(3, '36 M', 1, NULL, 36, 'months', '2022-03-19 04:42:14', '2022-04-19 09:03:03'),
(4, '6 M', 1, NULL, 6, 'months', '2022-04-18 06:49:18', '2022-04-19 09:02:15'),
(5, '3 M', 1, NULL, 3, 'months', '2022-04-19 09:00:29', '2022-04-19 09:02:42'),
(6, '1 M', 1, NULL, 1, 'months', '2022-04-19 09:00:50', '2022-04-19 09:04:36'),
(7, '60 M', 1, NULL, 60, 'months', '2022-04-19 09:01:35', '2022-04-19 09:02:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_business_id_index` (`business_id`),
  ADD KEY `accounts_account_type_id_index` (`account_type_id`),
  ADD KEY `accounts_created_by_index` (`created_by`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_account_id_index` (`account_id`),
  ADD KEY `account_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  ADD KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  ADD KEY `account_transactions_created_by_index` (`created_by`),
  ADD KEY `account_transactions_type_index` (`type`),
  ADD KEY `account_transactions_sub_type_index` (`sub_type`),
  ADD KEY `account_transactions_operation_date_index` (`operation_date`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_types_parent_account_type_id_index` (`parent_account_type_id`),
  ADD KEY `account_types_business_id_index` (`business_id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcodes_business_id_foreign` (`business_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_contact_id_foreign` (`contact_id`),
  ADD KEY `bookings_business_id_foreign` (`business_id`),
  ADD KEY `bookings_created_by_foreign` (`created_by`),
  ADD KEY `bookings_table_id_index` (`table_id`),
  ADD KEY `bookings_waiter_id_index` (`waiter_id`),
  ADD KEY `bookings_location_id_index` (`location_id`),
  ADD KEY `bookings_booking_status_index` (`booking_status`),
  ADD KEY `bookings_correspondent_id_index` (`correspondent_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_business_id_foreign` (`business_id`),
  ADD KEY `brands_created_by_foreign` (`created_by`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_owner_id_foreign` (`owner_id`),
  ADD KEY `business_currency_id_foreign` (`currency_id`),
  ADD KEY `business_default_sales_tax_foreign` (`default_sales_tax`);

--
-- Indexes for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_locations_business_id_index` (`business_id`),
  ADD KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  ADD KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`),
  ADD KEY `business_locations_sale_invoice_layout_id_index` (`sale_invoice_layout_id`),
  ADD KEY `business_locations_selling_price_group_id_index` (`selling_price_group_id`),
  ADD KEY `business_locations_receipt_printer_type_index` (`receipt_printer_type`),
  ADD KEY `business_locations_printer_id_index` (`printer_id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_registers_business_id_foreign` (`business_id`),
  ADD KEY `cash_registers_user_id_foreign` (`user_id`),
  ADD KEY `cash_registers_location_id_index` (`location_id`);

--
-- Indexes for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  ADD KEY `cash_register_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `cash_register_transactions_type_index` (`type`),
  ADD KEY `cash_register_transactions_transaction_type_index` (`transaction_type`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_business_id_foreign` (`business_id`),
  ADD KEY `categories_created_by_foreign` (`created_by`),
  ADD KEY `categories_parent_id_index` (`parent_id`);

--
-- Indexes for table `categorizables`
--
ALTER TABLE `categorizables`
  ADD KEY `categorizables_categorizable_type_categorizable_id_index` (`categorizable_type`,`categorizable_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_business_id_foreign` (`business_id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`),
  ADD KEY `contacts_type_index` (`type`),
  ADD KEY `contacts_contact_status_index` (`contact_status`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_groups_business_id_foreign` (`business_id`),
  ADD KEY `customer_groups_created_by_index` (`created_by`),
  ADD KEY `customer_groups_price_calculation_type_index` (`price_calculation_type`),
  ADD KEY `customer_groups_selling_price_group_id_index` (`selling_price_group_id`);

--
-- Indexes for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_configurations_business_id_foreign` (`business_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_business_id_index` (`business_id`),
  ADD KEY `discounts_brand_id_index` (`brand_id`),
  ADD KEY `discounts_category_id_index` (`category_id`),
  ADD KEY `discounts_location_id_index` (`location_id`),
  ADD KEY `discounts_priority_index` (`priority`),
  ADD KEY `discounts_spg_index` (`spg`);

--
-- Indexes for table `discount_variations`
--
ALTER TABLE `discount_variations`
  ADD KEY `discount_variations_discount_id_index` (`discount_id`),
  ADD KEY `discount_variations_variation_id_index` (`variation_id`);

--
-- Indexes for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_and_notes_business_id_index` (`business_id`),
  ADD KEY `document_and_notes_notable_id_index` (`notable_id`),
  ADD KEY `document_and_notes_created_by_index` (`created_by`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_business_id_foreign` (`business_id`);

--
-- Indexes for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  ADD KEY `group_sub_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_layouts_business_id_foreign` (`business_id`);

--
-- Indexes for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_schemes_business_id_foreign` (`business_id`),
  ADD KEY `invoice_schemes_scheme_type_index` (`scheme_type`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_business_id_index` (`business_id`),
  ADD KEY `media_uploaded_by_index` (`uploaded_by`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_business_id_foreign` (`business_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_tax_foreign` (`tax`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_business_id_index` (`business_id`),
  ADD KEY `products_unit_id_index` (`unit_id`),
  ADD KEY `products_created_by_index` (`created_by`),
  ADD KEY `products_warranty_id_index` (`warranty_id`),
  ADD KEY `products_type_index` (`type`),
  ADD KEY `products_tax_type_index` (`tax_type`),
  ADD KEY `products_barcode_type_index` (`barcode_type`);

--
-- Indexes for table `product_locations`
--
ALTER TABLE `product_locations`
  ADD KEY `product_locations_product_id_index` (`product_id`),
  ADD KEY `product_locations_location_id_index` (`location_id`);

--
-- Indexes for table `product_racks`
--
ALTER TABLE `product_racks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_racks_business_id_index` (`business_id`),
  ADD KEY `product_racks_location_id_index` (`location_id`),
  ADD KEY `product_racks_product_id_index` (`product_id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_name_index` (`name`),
  ADD KEY `product_variations_product_id_index` (`product_id`);

--
-- Indexes for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_lines_product_id_foreign` (`product_id`),
  ADD KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`),
  ADD KEY `purchase_lines_lot_number_index` (`lot_number`);

--
-- Indexes for table `reference_counts`
--
ALTER TABLE `reference_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference_counts_business_id_index` (`business_id`);

--
-- Indexes for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`);

--
-- Indexes for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_tables_business_id_foreign` (`business_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_business_id_foreign` (`business_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_price_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  ADD KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`),
  ADD KEY `stock_adjustment_lines_lot_no_line_id_index` (`lot_no_line_id`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_business_id_foreign` (`business_id`),
  ADD KEY `tax_rates_created_by_foreign` (`created_by`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_tax_id_foreign` (`tax_id`),
  ADD KEY `transactions_business_id_index` (`business_id`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_contact_id_index` (`contact_id`),
  ADD KEY `transactions_transaction_date_index` (`transaction_date`),
  ADD KEY `transactions_created_by_index` (`created_by`),
  ADD KEY `transactions_location_id_index` (`location_id`),
  ADD KEY `transactions_expense_for_foreign` (`expense_for`),
  ADD KEY `transactions_expense_category_id_index` (`expense_category_id`),
  ADD KEY `transactions_sub_type_index` (`sub_type`),
  ADD KEY `transactions_return_parent_id_index` (`return_parent_id`),
  ADD KEY `type` (`type`),
  ADD KEY `transactions_status_index` (`status`),
  ADD KEY `transactions_sub_status_index` (`sub_status`),
  ADD KEY `transactions_res_table_id_index` (`res_table_id`),
  ADD KEY `transactions_res_waiter_id_index` (`res_waiter_id`),
  ADD KEY `transactions_res_order_status_index` (`res_order_status`),
  ADD KEY `transactions_payment_status_index` (`payment_status`),
  ADD KEY `transactions_discount_type_index` (`discount_type`),
  ADD KEY `transactions_commission_agent_index` (`commission_agent`),
  ADD KEY `transactions_transfer_parent_id_index` (`transfer_parent_id`),
  ADD KEY `transactions_types_of_service_id_index` (`types_of_service_id`),
  ADD KEY `transactions_packing_charge_type_index` (`packing_charge_type`),
  ADD KEY `transactions_recur_parent_id_index` (`recur_parent_id`),
  ADD KEY `transactions_selling_price_group_id_index` (`selling_price_group_id`);

--
-- Indexes for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_payments_created_by_index` (`created_by`),
  ADD KEY `transaction_payments_parent_id_index` (`parent_id`);

--
-- Indexes for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  ADD KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `transaction_sell_lines_children_type_index` (`children_type`),
  ADD KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`),
  ADD KEY `transaction_sell_lines_line_discount_type_index` (`line_discount_type`),
  ADD KEY `transaction_sell_lines_discount_id_index` (`discount_id`),
  ADD KEY `transaction_sell_lines_lot_no_line_id_index` (`lot_no_line_id`),
  ADD KEY `transaction_sell_lines_sub_unit_id_index` (`sub_unit_id`);

--
-- Indexes for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_line_id` (`sell_line_id`),
  ADD KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  ADD KEY `purchase_line_id` (`purchase_line_id`);

--
-- Indexes for table `types_of_services`
--
ALTER TABLE `types_of_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `types_of_services_business_id_index` (`business_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_business_id_foreign` (`business_id`),
  ADD KEY `units_created_by_foreign` (`created_by`),
  ADD KEY `units_base_unit_id_index` (`base_unit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_business_id_foreign` (`business_id`),
  ADD KEY `users_user_type_index` (`user_type`),
  ADD KEY `users_crm_contact_id_foreign` (`crm_contact_id`);

--
-- Indexes for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_contact_access_user_id_index` (`user_id`),
  ADD KEY `user_contact_access_contact_id_index` (`contact_id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`),
  ADD KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  ADD KEY `variations_name_index` (`name`),
  ADD KEY `variations_sub_sku_index` (`sub_sku`),
  ADD KEY `variations_variation_value_id_index` (`variation_value_id`);

--
-- Indexes for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  ADD KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`);

--
-- Indexes for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_location_details_location_id_foreign` (`location_id`),
  ADD KEY `variation_location_details_product_id_index` (`product_id`),
  ADD KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  ADD KEY `variation_location_details_variation_id_index` (`variation_id`);

--
-- Indexes for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_templates_business_id_foreign` (`business_id`);

--
-- Indexes for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_value_templates_name_index` (`name`),
  ADD KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`);

--
-- Indexes for table `warranties`
--
ALTER TABLE `warranties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warranties_business_id_index` (`business_id`),
  ADD KEY `warranties_duration_type_index` (`duration_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=522;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business_locations`
--
ALTER TABLE `business_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_racks`
--
ALTER TABLE `product_racks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reference_counts`
--
ALTER TABLE `reference_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `res_tables`
--
ALTER TABLE `res_tables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system`
--
ALTER TABLE `system`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=459;

--
-- AUTO_INCREMENT for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=506;

--
-- AUTO_INCREMENT for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `types_of_services`
--
ALTER TABLE `types_of_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `variation_templates`
--
ALTER TABLE `variation_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warranties`
--
ALTER TABLE `warranties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD CONSTRAINT `dashboard_configurations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `printers`
--
ALTER TABLE `printers`
  ADD CONSTRAINT `printers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD CONSTRAINT `res_product_modifier_sets_modifier_set_id_foreign` FOREIGN KEY (`modifier_set_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD CONSTRAINT `res_tables_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD CONSTRAINT `selling_price_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD CONSTRAINT `stock_adjustment_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD CONSTRAINT `tax_rates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_for_foreign` FOREIGN KEY (`expense_for`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `transactions_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD CONSTRAINT `transaction_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD CONSTRAINT `transaction_sell_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_crm_contact_id_foreign` FOREIGN KEY (`crm_contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variations`
--
ALTER TABLE `variations`
  ADD CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variations_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD CONSTRAINT `variation_group_prices_price_group_id_foreign` FOREIGN KEY (`price_group_id`) REFERENCES `selling_price_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variation_group_prices_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD CONSTRAINT `variation_location_details_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `variation_location_details_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`);

--
-- Constraints for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD CONSTRAINT `variation_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD CONSTRAINT `variation_value_templates_variation_template_id_foreign` FOREIGN KEY (`variation_template_id`) REFERENCES `variation_templates` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
