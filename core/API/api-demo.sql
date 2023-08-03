-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2023 at 10:29 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `basefex`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@basefex.co', 'febxadmin', NULL, '6346ab2e6449f1665575726.png', 'Pa!@()_2e3s2', 'BqUy3jmXOQryMmbyz7TZtFemTOt8asihdlCiJ0cHrrPYbjeOupFUk7uNwNTE', NULL, '2023-04-01 16:40:05'),
(2, 'Sage Admin', 'danzexperiments@gmail.com', 'sageadmin', NULL, '6346ab2e6449f1665575726.png', '$2y$10$ZVzvZbkOzlyn4SxofYwwP.VziaE/LufrxzCNyXA2sHHhf61C2UKVa', 'BqUy3jmXOQryMmbyz7TZtFemTOt8asihdlCiJ0cHrrPYbKeOupFUF7uNwNTX', '2023-04-19 11:43:04', '2023-04-19 10:52:26');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `click_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `trx` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crypto_currencies`
--

CREATE TABLE `crypto_currencies` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Disable : 0, Enable : 1',
  `price` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rank` bigint(20) NOT NULL DEFAULT 0,
  `one_hour` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `twenty_four` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `seven_day` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `market_cap` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `volume_24h` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `circulating_supply` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crypto_currencies`
--

INSERT INTO `crypto_currencies` (`id`, `name`, `image`, `symbol`, `status`, `price`, `rank`, `one_hour`, `twenty_four`, `seven_day`, `market_cap`, `volume_24h`, `circulating_supply`, `created_at`, `updated_at`) VALUES
(1, 'Bitcoin', '6426c6a6358ec1680262822.jpg', 'BTC', 1, '27267.40557314', 1, '-0.30399728', '-3.04201958', '-10.22413893', '527714771092.02000000', '16942693907.66200000', '19353318.00000000', '2023-03-31 15:40:22', '2023-04-22 12:58:29'),
(2, 'Ethereum', '6426c740285061680262976.jpg', 'ETH', 1, '1850.31906082', 2, '-0.29115867', '-3.14484420', '-11.85848019', '222804660301.31000000', '9590837537.01470000', '120414184.24503000', '2023-03-31 15:42:56', '2023-04-22 12:58:29'),
(3, 'Tether', '6426c7641e04b1680263012.jpg', 'USDT', 1, '1.00027859', 3, '0.00216175', '0.02775177', '-0.07655776', '81444552289.22900000', '27571884743.45000000', '81421868892.89300000', '2023-03-31 15:43:32', '2023-04-22 12:58:29'),
(4, 'Binance Coin', '6429d8319ac541680463921.png', 'BNB', 1, '327.60975313', 4, '-0.12979671', '0.20706932', '-1.36824890', '51062722860.28000000', '771583916.55997000', '155864477.08834000', '2023-04-02 23:32:01', '2023-04-22 12:58:29'),
(5, 'U.S. Dollar Coin', '6429d8b3d233e1680464051.png', 'USDC', 1, '1.00021978', 5, '0.00923166', '0.01914289', '0.01498817', '30785847210.54000000', '4622745655.85880000', '30779082462.93800000', '2023-04-02 23:34:11', '2023-04-22 12:58:29'),
(6, 'XRP', '6429d8f7a07ac1680464119.png', 'XRP', 1, '0.45950993', 6, '0.45174594', '-1.72986951', '-12.05730873', '23780011126.47500000', '1141350405.49720000', '51750810378.00000000', '2023-04-02 23:35:19', '2023-04-22 12:58:29'),
(7, 'Cardano', '6429d95333ad41680464211.png', 'ADA', 1, '0.39261330', 7, '-0.03150749', '-2.28933122', '-14.15911293', '13658504058.25800000', '358276357.42390000', '34788693853.94000000', '2023-04-02 23:36:51', '2023-04-22 12:58:29'),
(8, 'Dogecoin', '6429d98e80daa1680464270.png', 'DOGE', 1, '0.07918156', 8, '-0.17529770', '-5.70972089', '-11.32480746', '11009650140.81400000', '676680469.74847000', '139043106383.71000000', '2023-04-02 23:37:50', '2023-04-22 12:58:29'),
(9, 'Chainlink', '6429d9eb475531680464363.png', 'LINK', 1, '7.12722367', 19, '-0.27984042', '-4.04612136', '-8.73304861', '3685487151.01550000', '263769481.63121000', '517099970.45279000', '2023-04-02 23:39:23', '2023-04-22 12:58:29'),
(10, 'Tezos', '6429da4bf05871680464459.png', 'XTZ', 1, '1.01873442', 51, '-0.41880466', '-2.19439340', '-11.15406201', '952711499.63523000', '21679056.13369700', '935191238.27570000', '2023-04-02 23:41:00', '2023-04-22 12:58:29'),
(11, 'Theta', '6429dac54ab651680464581.png', 'THETA', 1, '1.00418641', 47, '-0.13253537', '-2.53128867', '-10.68695773', '1004186406.59100000', '15504414.85162100', '1000000000.00000000', '2023-04-02 23:43:01', '2023-04-22 12:58:29'),
(12, 'PancakeSwap', '6429db173a64f1680464663.png', 'CAKE', 1, '3.39048532', 72, '-0.12960476', '-1.02312414', '-6.81133847', '626778101.63019000', '29333342.99815400', '184863830.14820000', '2023-04-02 23:44:23', '2023-04-22 12:58:30'),
(13, 'Filecoin', '6429db67848891680464743.png', 'FIL', 1, '5.25224661', 30, '-0.36263359', '-4.93223361', '-14.15204545', '2203179024.51450000', '192202783.28732000', '419473644.00000000', '2023-04-02 23:45:43', '2023-04-22 12:58:30'),
(14, 'Polygon', '6429dba9bab101680464809.png', 'MATIC', 1, '1.00949477', 9, '-0.28808641', '-3.21387548', '-13.94599876', '9307005850.77310000', '406428810.78093000', '9219469069.28490000', '2023-04-02 23:46:49', '2023-04-22 12:58:30'),
(15, 'Algorand', '6429dc0f08d921680464911.png', 'ALGO', 1, '0.18815036', 40, '-0.22341300', '-0.95558193', '-17.42195007', '1360364998.79380000', '62878956.17652000', '7230201394.41490000', '2023-04-02 23:48:31', '2023-04-22 12:58:30');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `method_code` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `method_currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `final_amo` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_amo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_try` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT 0,
  `admin_feedback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `method_code`, `amount`, `method_currency`, `charge`, `rate`, `final_amo`, `detail`, `btc_amo`, `btc_wallet`, `trx`, `payment_try`, `status`, `from_api`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(1, 3, 1000, '700.00000000', 'USDT', '0.00000000', '1.00000000', '700.00000000', NULL, '0', '', '1AQ37B6K8VZB', 0, 0, 0, NULL, '2023-04-01 15:24:07', '2023-04-01 15:24:07'),
(2, 4, 1000, '7000.00000000', 'USDT', '0.00000000', '1.00000000', '7000.00000000', NULL, '0', '', '29X47C9FJFSU', 0, 0, 0, NULL, '2023-04-01 16:16:52', '2023-04-01 16:16:52'),
(3, 6, 1000, '4000.00000000', 'USDT', '0.00000000', '1.00000000', '4000.00000000', '[]', '0', '', 'MWA5XPUAWD58', 0, 3, 0, 'Not successful', '2023-04-02 23:53:23', '2023-04-05 16:40:55'),
(4, 6, 1000, '10000.00000000', 'USDT', '0.00000000', '1.00000000', '10000.00000000', NULL, '0', '', 'BDYEKW7K7UGP', 0, 0, 0, NULL, '2023-04-02 23:55:11', '2023-04-02 23:55:11'),
(5, 6, 1000, '1000.00000000', 'USDT', '0.00000000', '1.00000000', '1000.00000000', NULL, '0', '', 'KUJ47GGATST2', 0, 0, 0, NULL, '2023-04-03 00:00:29', '2023-04-03 00:00:29'),
(6, 6, 1000, '100.00000000', 'USDT', '0.00000000', '1.00000000', '100.00000000', '[]', '0', '', 'V81OHYURTX57', 0, 3, 0, 'Not successful', '2023-04-03 07:44:06', '2023-04-05 16:08:53'),
(7, 3, 1000, '600.00000000', 'USDT', '0.00000000', '1.00000000', '600.00000000', NULL, '0', '', '5SPOFNVCD8XZ', 0, 0, 0, NULL, '2023-04-03 09:29:27', '2023-04-03 09:29:27'),
(8, 7, 1000, '100.00000000', 'USDT', '0.00000000', '1.00000000', '100.00000000', NULL, '0', '', 'XGQSE9YC1KPF', 0, 0, 0, NULL, '2023-04-03 16:45:30', '2023-04-03 16:45:30'),
(9, 17, 1000, '2000.00000000', 'USDT', '0.00000000', '1.00000000', '20.00000000', '[]', '0', '', 'SBSD5MND27AV', 0, 1, 0, NULL, '2023-04-04 00:07:09', '2023-04-04 11:33:05'),
(10, 8, 1000, '100.00000000', 'USDT', '0.00000000', '1.00000000', '100.00000000', '[]', '0', '', '4EAU4ZYUD9U9', 0, 1, 0, NULL, '2023-04-04 00:42:01', '2023-04-04 13:52:17'),
(11, 8, 1000, '100.00000000', 'USDT', '0.00000000', '1.00000000', '100.00000000', NULL, '0', '', 'PRPR4PFUBPG3', 0, 0, 0, NULL, '2023-04-04 00:52:21', '2023-04-04 00:52:21'),
(12, 6, 1000, '5000.00000000', 'USDT', '0.00000000', '1.00000000', '5000.00000000', NULL, '0', '', 'B6BGHGZWTET8', 0, 0, 0, NULL, '2023-04-04 10:58:32', '2023-04-04 10:58:32'),
(13, 3, 1000, '455.00000000', 'USDT', '0.00000000', '1.00000000', '455.00000000', NULL, '0', '', 'PUMNY3PKXKMM', 0, 0, 0, NULL, '2023-04-04 14:33:19', '2023-04-04 14:33:19'),
(14, 9, 1000, '50.00000000', 'USDT', '0.00000000', '1.00000000', '50.00000000', NULL, '0', '', '54X3QYBVQAZ7', 0, 0, 0, NULL, '2023-04-04 15:00:14', '2023-04-04 15:00:14'),
(15, 6, 1000, '1000.00000000', 'USDT', '0.00000000', '1.00000000', '1000.00000000', NULL, '0', '', 'YDBBXX18GKDG', 0, 0, 0, NULL, '2023-04-04 17:37:09', '2023-04-04 17:37:09'),
(16, 7, 1000, '10.00000000', 'USDT', '0.00000000', '1.00000000', '10.00000000', NULL, '0', '', '5GASZ3SEJBQJ', 0, 0, 0, NULL, '2023-04-04 18:07:55', '2023-04-04 18:07:55'),
(17, 6, 1000, '100.00000000', 'USDT', '0.00000000', '1.00000000', '100.00000000', NULL, '0', '', 'T45YEMFYDR94', 0, 0, 0, NULL, '2023-04-04 18:12:19', '2023-04-04 18:12:19'),
(18, 6, 1000, '100.00000000', 'USDT', '0.00000000', '1.00000000', '100.00000000', NULL, '0', '', 'EM2EMMW32YKB', 0, 0, 0, NULL, '2023-04-04 18:13:47', '2023-04-04 18:13:47'),
(19, 7, 1000, '20.00000000', 'USDT', '0.00000000', '1.00000000', '20.00000000', NULL, '0', '', 'W6EMBTV6TV6J', 0, 0, 0, NULL, '2023-04-04 20:09:13', '2023-04-04 20:09:13'),
(20, 7, 1000, '20.00000000', 'USDT', '0.00000000', '1.00000000', '20.00000000', NULL, '0', '', 'K96HONYZ1MY1', 0, 0, 0, NULL, '2023-04-04 20:11:08', '2023-04-04 20:11:08'),
(21, 5, 1000, '20.00000000', 'USDT', '0.00000000', '1.00000000', '20.00000000', NULL, '0', '', 'FDYK6FJF9B4P', 0, 0, 0, NULL, '2023-04-04 22:19:11', '2023-04-04 22:19:11'),
(22, 5, 1000, '20.00000000', 'USDT', '0.00000000', '1.00000000', '20.00000000', NULL, '0', '', 'BPS6JQD28H25', 0, 0, 0, NULL, '2023-04-04 22:19:11', '2023-04-04 22:19:11'),
(23, 7, 1000, '20.00000000', 'USDT', '0.00000000', '1.00000000', '20.00000000', NULL, '0', '', '2OFR9ZH8KB15', 0, 0, 0, NULL, '2023-04-05 00:04:01', '2023-04-05 00:04:01'),
(24, 10, 1000, '20.00000000', 'USDT', '0.00000000', '1.00000000', '20.00000000', NULL, '0', '', '29TCDQKD6AMK', 0, 0, 0, NULL, '2023-04-05 01:17:50', '2023-04-05 01:17:50'),
(25, 8, 1000, '100.00000000', 'USDT', '0.00000000', '1.00000000', '100.00000000', NULL, '0', '', '1GCD6CV76KCK', 0, 0, 0, NULL, '2023-04-05 14:49:25', '2023-04-05 14:49:25'),
(26, 10, 1000, '500.00000000', 'USDT', '0.00000000', '1.00000000', '500.00000000', NULL, '0', '', '3U7RE7E2Y5HB', 0, 0, 0, NULL, '2023-04-05 15:03:21', '2023-04-05 15:03:21'),
(27, 10, 1000, '599.00000000', 'USDT', '0.00000000', '1.00000000', '599.00000000', NULL, '0', '', 'NYQEX6RSKNPK', 0, 0, 0, NULL, '2023-04-05 15:55:29', '2023-04-05 15:55:29'),
(28, 10, 1000, '599.00000000', 'USDT', '0.00000000', '1.00000000', '599.00000000', NULL, '0', '', '585WY9ASF9X6', 0, 0, 0, NULL, '2023-04-05 16:02:19', '2023-04-05 16:02:19'),
(29, 10, 1000, '599.00000000', 'USDT', '0.00000000', '1.00000000', '599.00000000', NULL, '0', '', '38N48W51SB1Z', 0, 0, 0, NULL, '2023-04-05 16:07:01', '2023-04-05 16:07:01'),
(30, 7, 1000, '23.00000000', 'USDT', '0.00000000', '1.00000000', '23.00000000', NULL, '0', '', '7VFOE2T3AZ13', 0, 0, 0, NULL, '2023-04-05 16:13:37', '2023-04-05 16:13:37'),
(31, 7, 1000, '21.00000000', 'USDT', '0.00000000', '1.00000000', '21.00000000', NULL, '0', '', 'JFBRXHBFFOSV', 0, 0, 0, NULL, '2023-04-05 16:42:14', '2023-04-05 16:42:14'),
(32, 10, 1000, '599.00000000', 'USDT', '0.00000000', '1.00000000', '599.00000000', '[{\"name\":\"trx screenshots\",\"type\":\"file\",\"value\":\"2023\\/04\\/05\\/642d6f340b9b41680699188.pdf\"}]', '0', '', '5UMUMVMVD6PR', 0, 1, 0, NULL, '2023-04-05 16:52:28', '2023-04-05 16:54:32'),
(33, 7, 1000, '1000.00000000', 'USDT', '0.00000000', '1.00000000', '1000.00000000', '[{\"name\":\"trx screenshots\",\"type\":\"file\",\"value\":\"2023\\/04\\/05\\/642d6f649a5401680699236.jpeg\"}]', '0', '', 'FF7DFND27EYR', 0, 1, 0, NULL, '2023-04-05 16:53:29', '2023-04-06 01:04:17'),
(34, 3, 1000, '500000.00000000', 'USDT', '0.00000000', '1.00000000', '500000.00000000', '[{\"name\":\"trx screenshots\",\"type\":\"file\",\"value\":\"2023\\/04\\/05\\/642d704f3bf041680699471.jpg\"}]', '0', '', '2HD3KRYE4Y8H', 0, 1, 0, NULL, '2023-04-05 16:57:38', '2023-04-05 17:02:24'),
(35, 12, 1000, '76869699696.00000000', 'USDT', '0.00000000', '1.00000000', '76869699696.00000000', '[{\"name\":\"trx screenshots\",\"type\":\"file\",\"value\":\"2023\\/04\\/05\\/642d7125e15841680699685.jpg\"}]', '0', '', '2J4BTPRJ8HVT', 0, 1, 0, NULL, '2023-04-05 17:01:16', '2023-04-05 17:02:14'),
(36, 7, 1000, '5800.00000000', 'USDT', '0.00000000', '1.00000000', '5800.00000000', '[{\"name\":\"trx screenshots\",\"type\":\"file\",\"value\":\"2023\\/04\\/07\\/642ff8da17cbf1680865498.jpeg\"}]', '0', '', 'PKGKMY9KUAM3', 0, 1, 0, NULL, '2023-04-07 15:04:31', '2023-04-07 15:06:39'),
(37, 7, 1000, '2500.00000000', 'USDT', '0.00000000', '1.00000000', '2500.00000000', NULL, '0', '', 'ZMQXT6GXSAG9', 0, 0, 0, NULL, '2023-04-10 09:51:36', '2023-04-10 09:51:36'),
(38, 7, 1000, '2500.00000000', 'USDT', '0.00000000', '1.00000000', '2500.00000000', NULL, '0', '', 'XC44TTFHDFTK', 0, 0, 0, NULL, '2023-04-10 09:58:00', '2023-04-10 09:58:00'),
(39, 7, 1000, '10000.00000000', 'USDT', '0.00000000', '1.00000000', '10000.00000000', NULL, '0', '', 'VKXR51UYWD8X', 0, 0, 0, NULL, '2023-04-10 09:58:36', '2023-04-10 09:58:36'),
(40, 7, 1000, '56.00000000', 'USDT', '0.00000000', '1.00000000', '56.00000000', NULL, '0', '', 'FOUJ2A4RTNKA', 0, 0, 0, NULL, '2023-04-13 21:27:19', '2023-04-13 21:27:19'),
(41, 14, 1000, '650.00000000', 'USDT', '0.00000000', '1.00000000', '650.00000000', NULL, '0', '', 'AGCGM1AEP54V', 0, 0, 0, NULL, '2023-04-15 14:23:49', '2023-04-15 14:23:49'),
(42, 14, 1000, '650.00000000', 'USDT', '0.00000000', '1.00000000', '650.00000000', NULL, '0', '', '9P5FK9T33VAM', 0, 0, 0, NULL, '2023-04-15 14:25:35', '2023-04-15 14:25:35'),
(43, 14, 1000, '650.00000000', 'USDT', '0.00000000', '1.00000000', '650.00000000', '[{\"name\":\"trx screenshots\",\"type\":\"file\",\"value\":\"2023\\/04\\/15\\/643a7fc6cea231681555398.jpg\"}]', '0', '', 'WYBYYUPMED4O', 0, 1, 0, NULL, '2023-04-15 14:42:52', '2023-04-15 14:43:40'),
(44, 7, 1000, '20.00000000', 'USDT', '0.00000000', '1.00000000', '20.00000000', NULL, '0', '', 'F6DM3DXOKF1N', 0, 0, 0, NULL, '2023-04-17 12:07:36', '2023-04-17 12:07:36'),
(45, 7, 1000, '20.00000000', 'USDT', '0.00000000', '1.00000000', '20.00000000', NULL, '0', '', 'E6F1FX9R1TZO', 0, 0, 0, NULL, '2023-04-17 12:08:03', '2023-04-17 12:08:03'),
(46, 16, 1000, '25.00000000', 'USDT', '0.00000000', '1.00000000', '25.00000000', NULL, '0', '', 'YPX28ZSESM1X', 0, 0, 0, NULL, '2023-04-17 23:49:08', '2023-04-17 23:49:08'),
(47, 16, 1000, '25.00000000', 'USDT', '0.00000000', '1.00000000', '25.00000000', '[{\"name\":\"trx screenshots\",\"type\":\"file\",\"value\":\"2023\\/04\\/17\\/643da986cb72a1681762694.pdf\"}]', '0', '', 'PHZ55J9WGDHR', 0, 3, 0, 'Unsuccessful', '2023-04-18 00:16:55', '2023-04-18 01:55:43'),
(48, 19, 1000, '400.00000000', 'USDT', '0.00000000', '1.00000000', '400.00000000', NULL, '0', '', 'A71W6377FGQC', 0, 0, 0, NULL, '2023-04-22 12:49:24', '2023-04-22 12:49:24'),
(49, 20, 1000, '50.00000000', 'USDT', '0.00000000', '1.00000000', '50.00000000', NULL, '0', '', '4CUTNNZH9TBS', 0, 0, 0, NULL, '2023-04-22 14:32:22', '2023-04-22 14:32:22'),
(50, 21, 1000, '500.00000000', 'USDT', '0.00000000', '1.00000000', '500.00000000', NULL, '0', '', 'JPZM9DZAH743', 0, 0, 0, NULL, '2023-06-06 13:30:04', '2023-06-06 13:30:04'),
(51, 21, 1001, '500.00000000', 'USDT', '0.00000000', '1.00000000', '500.00000000', NULL, '0', '', 'D4VJKYH9BDFF', 0, 0, 0, NULL, '2023-06-07 07:20:39', '2023-06-07 07:20:39'),
(52, 17, 1001, '300.00000000', 'USDT', '0.00000000', '1.00000000', '300.00000000', NULL, '0', '', 'D9GV42AAQPFK', 0, 0, 0, NULL, '2023-06-07 07:39:15', '2023-06-07 07:39:15');

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcode` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'object',
  `support` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'twak.png', 0, '2019-10-18 23:16:05', '2022-03-22 05:22:24'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.png', '\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\n<div class=\"g-recaptcha\" data-sitekey=\"{{site_key}}\" data-callback=\"verifyCaptcha\"></div>\n<div id=\"g-recaptcha-error\"></div>', '{\"site_key\":{\"title\":\"Site Key\",\"value\":\"\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"\"}}', 'recaptcha.png', 0, '2019-10-18 23:16:05', '2023-02-28 08:49:24'),
(3, 'custom-captcha', 'Custom Captcha', 'Just put any random string', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 0, '2019-10-18 23:16:05', '2023-02-28 08:49:22'),
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{app_key}}\"></script>\r\n                <script>\r\n                  window.dataLayer = window.dataLayer || [];\r\n                  function gtag(){dataLayer.push(arguments);}\r\n                  gtag(\"js\", new Date());\r\n                \r\n                  gtag(\"config\", \"{{app_key}}\");\r\n                </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'ganalytics.png', 0, NULL, '2021-05-04 10:19:12'),
(5, 'fb-comment', 'Facebook Comment ', 'Key location is shown bellow', 'Facebook.png', '<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}', 'fb_com.PNG', 0, NULL, '2022-03-22 05:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `act`, `form_data`, `created_at`, `updated_at`) VALUES
(7, 'kyc', '{\"full_name\":{\"name\":\"Full Name\",\"label\":\"full_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"gender\":{\"name\":\"Gender\",\"label\":\"gender\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Male\",\"Female\",\"Others\"],\"type\":\"select\"},\"you_hobby\":{\"name\":\"You Hobby\",\"label\":\"you_hobby\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Programming\",\"Gardening\",\"Traveling\",\"Others\"],\"type\":\"checkbox\"},\"nid_photo\":{\"name\":\"NID Photo\",\"label\":\"nid_photo\",\"is_required\":\"required\",\"extensions\":\"jpg,png\",\"options\":[],\"type\":\"file\"}}', '2022-03-17 02:56:14', '2022-10-13 06:13:55');

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_keys` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_values` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(39, 'banner.content', '{\"has_image\":\"1\",\"heading\":\"Get 100% payout on as little as 0.1 pip\",\"sub_heading\":\"A trading platform for online trading and investments from the broker Olymp Trade. Start earning money with millions of traders worldwide\",\"button_name\":\"Get Started\",\"button_url\":\"http:\\/\\/localhost\\/highlowNew\\/\",\"background_image\":\"608919b35c94e1619597747.jpg\",\"hero_image\":\"608919c858e481619597768.png\"}', '2021-03-20 06:45:10', '2021-05-04 00:40:22'),
(41, 'banner.element', '{\"has_image\":[\"1\"],\"background_image\":\"60891a5905b791619597913.png\"}', '2021-03-20 07:04:15', '2021-04-28 02:18:33'),
(42, 'banner.element', '{\"has_image\":[\"1\"],\"background_image\":\"60891a4f407e01619597903.png\"}', '2021-03-20 07:04:22', '2021-04-28 02:18:23'),
(43, 'banner.element', '{\"has_image\":[\"1\"],\"background_image\":\"60891a475d57f1619597895.png\"}', '2021-03-20 07:04:25', '2021-04-28 02:18:15'),
(44, 'banner.element', '{\"has_image\":[\"1\"],\"background_image\":\"60891a3fbf2dc1619597887.png\"}', '2021-03-20 07:09:49', '2021-04-28 02:18:07'),
(45, 'trade.content', '{\"heading\":\"Make a Quick Trade\",\"sub_heading\":\"Unfortunately, the idea that this kind of trading is some kind of \\\"get-rich-quick\\\" scheme persists. Some people day trade without sufficient knowledg\",\"trade_tab_1\":\"I\'m a Beginner\",\"trade_tab_2\":\"I\'m an Expert\"}', '2021-03-20 07:18:39', '2021-05-04 00:59:52'),
(46, 'get_started.content', '{\"heading\":\"Get Started Now for instant Cashback\",\"button_name\":\"Get Started\",\"button_url\":\"user\\/register\"}', '2021-03-20 07:26:45', '2023-02-14 09:23:00'),
(48, 'predict.content', '{\"heading\":\"We have differents type of predict\",\"sub_heading\":\"There is a third type of prediction, which is different from the previous two. In the example, we need to have some sort of understanding.\"}', '2021-03-20 23:23:18', '2021-05-04 01:01:13'),
(49, 'predict.element', '{\"title\":\"Turbo Spread\",\"description\":\"Richard McClintock, a Latin scholar from Hampden-Sydney College, is credited with discovering the source behind the ubiquitous filler text. In seeing a sample\",\"icon\":\"<i class=\\\"las la-helicopter\\\"><\\/i>\",\"button_name\":\"Try Quick Demo\",\"button_url\":\"login\"}', '2021-03-20 23:25:10', '2021-05-06 23:29:20'),
(50, 'predict.element', '{\"title\":\"Highlow Options\",\"description\":\"McClintock\'s eye for detail certainly helped narrow the whereabouts of lorem ipsum\'s origin, however, the \\u201chow and when\\u201d still remain something of a mystery, with competing theories and timelines\",\"icon\":\"<i class=\\\"las la-life-ring\\\"><\\/i>\",\"button_name\":\"Try Quick Demo\",\"button_url\":\"login\"}', '2021-03-20 23:27:00', '2021-05-06 23:29:24'),
(51, 'predict.element', '{\"title\":\"Trade\",\"description\":\"McClintock\'s eye for detail certainly helped narrow the whereabouts of lorem ipsum\'s origin, however, the \\u201chow and when\\u201d still remain something of a mystery, with competing theories and timelines\",\"icon\":\"<i class=\\\"lab la-grav\\\"><\\/i>\",\"button_name\":\"Try Quick Demo\",\"button_url\":\"login\"}', '2021-03-20 23:27:53', '2021-05-06 23:29:27'),
(52, 'predict.element', '{\"title\":\"Demo Trade\",\"description\":\"McClintock\'s eye for detail certainly helped narrow the whereabouts of lorem ipsum\'s origin, however, the \\u201chow and when\\u201d still remain something of a mystery, with competing theories and timelines\",\"icon\":\"<i class=\\\"lar la-grin-squint-tears\\\"><\\/i>\",\"button_name\":\"Get Started\",\"button_url\":\"login\"}', '2021-03-20 23:28:25', '2021-05-06 23:29:31'),
(53, 'predict.element', '{\"title\":\"Turbo Spread\",\"description\":\"McClintock\'s eye for detail certainly helped narrow the whereabouts of lorem ipsum\'s origin, however, the \\u201chow and when\\u201d still remain something of a mystery, with competing theories and timelines\",\"icon\":\"<i class=\\\"lar la-futbol\\\"><\\/i>\",\"button_name\":\"Try Quick Demo\",\"button_url\":\"login\"}', '2021-03-20 23:29:08', '2021-05-06 23:29:34'),
(54, 'predict.element', '{\"title\":\"HIGHLOW OPTIONS\",\"description\":\"What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?\",\"icon\":\"<i class=\\\"las la-laugh-beam\\\"><\\/i>\",\"button_name\":\"Try Quick Demo\",\"button_url\":\"login\"}', '2021-03-20 23:29:27', '2021-05-06 23:29:38'),
(55, 'feature.content', '{\"heading\":\"Why Trade with Us\",\"sub_heading\":\"Basic economic concept involving the buying and selling of goods and services, with compensation paid by a buyer to a seller\"}', '2021-03-21 00:17:42', '2021-05-04 00:59:03'),
(56, 'feature.element', '{\"feature_icon\":\"<i class=\\\"las la-hockey-puck\\\"><\\/i>\",\"title\":\"Amazing Support\",\"short_details\":\"Possimus atque magnam autem ad porro, molestias id quaerat, a nihil numquam animi quidem!\"}', '2021-03-21 00:18:51', '2021-03-21 00:18:51'),
(57, 'feature.element', '{\"feature_icon\":\"<i class=\\\"lar la-kiss-wink-heart\\\"><\\/i>\",\"title\":\"Best Payout\",\"short_details\":\"Possimus atque magnam autem ad porro, molestias id quaerat, a nihil numquam animi quidem!\"}', '2021-03-21 00:39:48', '2021-03-21 00:39:48'),
(58, 'feature.element', '{\"feature_icon\":\"<i class=\\\"las la-level-up-alt\\\"><\\/i>\",\"title\":\"Quick Fund Access\",\"short_details\":\"Possimus atque magnam autem ad porro, molestias id quaerat, a nihil numquam animi quidem!\"}', '2021-03-21 00:40:17', '2021-03-21 00:40:17'),
(59, 'feature.element', '{\"feature_icon\":\"<i class=\\\"las la-memory\\\"><\\/i>\",\"title\":\"Cashback Options\",\"short_details\":\"Possimus atque magnam autem ad porro, molestias id quaerat, a nihil numquam animi quidem!\"}', '2021-03-21 00:40:41', '2021-03-21 00:40:41'),
(60, 'feature.element', '{\"feature_icon\":\"<i class=\\\"las la-journal-whills\\\"><\\/i>\",\"title\":\"Best Payout\",\"short_details\":\"Possimus atque magnam autem ad porro, molestias id quaerat, a nihil numquam animi quidem!\"}', '2021-03-21 00:41:03', '2021-03-21 00:41:03'),
(61, 'feature.element', '{\"feature_icon\":\"<i class=\\\"las la-microchip\\\"><\\/i>\",\"title\":\"Best Payout\",\"short_details\":\"Possimus atque magnam autem ad porro, molestias id quaerat, a nihil numquam animi quidem!\"}', '2021-03-21 00:41:27', '2021-03-21 00:41:27'),
(62, 'app.content', '{\"has_image\":\"1\",\"heading\":\"Now It\'s more easy to make a invest by mobile\",\"sub_heading\":\"Numquam sunt dolorum repudiandae commodi culpa ipsam fugit. Facilis, nostrum impedit. Excepturi, delectus nihil? Beatae voluptate earum debitis quas dolorem minus quae! Dolore, voluptas vitae nisi qui, eaque fuga blanditiis vero ratione pariatur error facere consequatur odio quae esse placeat? Assumenda, a ea. Saepe, dolore optio at sunt aliquid dolores minima veniam!\",\"button_one_url\":\"#\",\"button_two_url\":\"#\",\"background_image\":\"6056f1d0ac9261616310736.png\"}', '2021-03-21 01:12:16', '2023-01-07 07:14:55'),
(63, 'blog.content', '{\"heading\":\"Latest News Tips\",\"sub_heading\":\"Quos libero quae fugiat id adipisci error iste beatae eaque incidunt, mollitia similique enim sapiente perferendis alias assumenda\"}', '2021-03-21 01:21:57', '2021-05-04 00:44:14'),
(68, 'footer.content', '{\"heading\":\"Asccusamus illo molestias maiores aut? Provident inventore dolorum minus dolorem ab illum fugiat labore facere porro nesciunt corrupti animi\"}', '2021-03-21 02:03:07', '2021-03-21 02:06:11'),
(69, 'footer.element', '{\"menu\":\"Privacy\",\"description\":\"<div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', '2021-03-21 02:03:38', '2021-05-04 00:45:29'),
(70, 'footer.element', '{\"menu\":\"Terms\",\"description\":\"<div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We claim all authority to dismiss, end, or handicap any help with or without cause per administrator discretion. This is a Complete independent facilitating, on the off chance that you misuse our ticket or Livechat or emotionally supportive network by submitting solicitations or protests we will impair your record. The solitary time you should reach us about the seaward facilitating is if there is an issue with the worker. We have not many substance limitations and everything is as per laws and guidelines. Try not to join on the off chance that you intend to do anything contrary to the guidelines, we do check these things and we will know, don\'t burn through our own and your time by joining on the off chance that you figure you will have the option to sneak by us and break the terms.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Configuration requests - If you have a fully managed dedicated server with us then we offer custom PHP\\/MySQL configurations, firewalls for dedicated IPs, DNS, and httpd configurations.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Software requests - Cpanel Extension Installation will be granted as long as it does not interfere with the security, stability, and performance of other users on the server.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Emergency Support - We do not provide emergency support \\/ Phone Support \\/ LiveChat Support. Support may take some hours sometimes.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Webmaster help - We do not offer any support for webmaster related issues and difficulty including coding, &amp; installs, Error solving. if there is an issue where a library or configuration of the server then we can help you if it\'s possible from our end.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">We Don\'t support any child porn or such material.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No spam-related sites or material, such as email lists, mass mail programs, and scripts, etc.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No harassing material that may cause people to retaliate against you.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No phishing pages.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You may not run any exploitation script from the server. reason can be terminated immediately.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">If Anyone attempting to hack or exploit the server by using your script or hosting, we will terminate your account to keep safe other users.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Malicious Botnets are strictly forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Spam, mass mailing, or email marketing in any way are strictly forbidden here.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Malicious hacking materials, trojans, viruses, &amp; malicious bots running or for download are forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Resource and cronjob abuse is forbidden and will result in suspension or termination.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Php\\/CGI proxies are strictly forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">CGI-IRC is strictly forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No fake or disposal mailers, mass mailing, mail bombers, SMS bombers, etc.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">NO CREDIT OR REFUND will be granted for interruptions of service, due to User Agreement violations.<\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Terms &amp; Conditions for Users<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">Before getting to this site, you are consenting to be limited by these site Terms and Conditions of Use, every single appropriate law, and guidelines, and concur that you are answerable for consistency with any material neighborhood laws. If you disagree with any of these terms, you are restricted from utilizing or getting to this site.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Support<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">Whenever you have downloaded our item, you may get in touch with us for help through email and we will give a valiant effort to determine your issue. We will attempt to answer using the Email for more modest bug fixes, after which we will refresh the center bundle. Content help is offered to confirmed clients by Tickets as it were. Backing demands made by email and Livechat.<\\/p><p class=\\\"my-3 font-18 font-weight-bold\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">On the off chance that your help requires extra adjustment of the System, at that point, you have two alternatives:<\\/p><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Hang tight for additional update discharge.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Or on the other hand, enlist a specialist (We offer customization for extra charges).<\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Ownership<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">You may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All items are property, we created them. Our items are given \\\"with no guarantees\\\" without guarantee of any sort, either communicated or suggested. On no occasion will our juridical individual be subject to any harms including, however not restricted to, immediate, roundabout, extraordinary, accidental, or significant harms or different misfortunes emerging out of the utilization of or powerlessness to utilize our items.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Warranty<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t offer any guarantee or assurance of these Services in any way. When our Services have been modified we can\'t ensure they will work with all outsider plugins, modules, or internet browsers. Program similarity ought to be tried against the show formats on the demo worker. If you don\'t mind guarantee that the programs you use will work with the component, as we can not ensure that our systems will work with all program mixes.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Unauthorized\\/Illegal Usage<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">You may not utilize our things for any illicit or unapproved reason or may you, in the utilization of the stage, disregard any laws in your locale (counting yet not restricted to copyright laws) just as the laws of your nation and International law. Specifically, it is disallowed to utilize the things on our foundation for pages that advance: brutality, illegal intimidation, hard sexual entertainment, bigotry, obscenity content or warez programming joins.<br \\/><br \\/>You can\'t imitate, copy, duplicate, sell, exchange or adventure any of our segment, utilization of the offered on our things, or admittance to the administration without the express composed consent by us or item proprietor.<br \\/><br \\/>Our Members are liable for all substance posted on the discussion and demo and movement that happens under your record.<br \\/><br \\/>We hold the chance of hindering your participation account quickly if we will think about a particularly not allowed conduct.<br \\/><br \\/>If you make a record on our site, you are liable for keeping up the security of your record, and you are completely answerable for all exercises that happen under the record and some other activities taken regarding the record. You should quickly inform us, of any unapproved employments of your record or some other penetrates of security.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Fiverr, Seoclerks Sellers Or Affiliates<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We do NOT ensure full SEO campaign conveyance within 24 hours. We make no assurance for conveyance time by any means. We give our best assessment to orders during the putting in of requests, anyway, these are gauges. We won\'t be considered liable for loss of assets, negative surveys or you being prohibited for late conveyance. If you are selling on a site that requires time touchy outcomes, utilize Our SEO Services at your own risk.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Payment\\/Refund Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">No refund or cash back will be made. After a deposit has been finished, it is extremely unlikely to invert it. You should utilize your equilibrium on requests our administrations, Hosting, SEO campaign. You concur that once you complete a deposit, you won\'t document a debate or a chargeback against us in any way, shape, or form.<br \\/><br \\/>If you document a debate or chargeback against us after a deposit, we claim all authority to end every single future request, prohibit you from our site. False action, for example, utilizing unapproved or taken charge cards will prompt the end of your record. There are no special cases.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Free Balance \\/ Coupon Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We offer numerous approaches to get FREE Balance, Coupons and Deposit offers yet we generally reserve the privilege to audit it and deduct it from your record offset with any explanation we may it is a sort of misuse. If we choose to deduct a few or all of free Balance from your record balance, and your record balance becomes negative, at that point the record will naturally be suspended. If your record is suspended because of a negative Balance you can request to make a custom payment to settle your equilibrium to actuate your record.<\\/p><\\/div>\"}', '2021-03-21 02:04:32', '2021-05-04 00:46:11'),
(71, 'social_icon.element', '{\"social_icon\":\"<i class=\\\"lab la-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\\/\"}', '2021-03-21 02:08:27', '2021-03-21 02:08:27'),
(72, 'social_icon.element', '{\"social_icon\":\"<i class=\\\"lab la-twitter\\\"><\\/i>\",\"url\":\"twitter.com\"}', '2021-03-21 02:09:00', '2021-03-21 02:10:57'),
(73, 'social_icon.element', '{\"social_icon\":\"<i class=\\\"lab la-instagram\\\"><\\/i>\",\"url\":\"instagram.com\"}', '2021-03-21 02:09:20', '2021-03-21 02:11:10'),
(74, 'social_icon.element', '{\"social_icon\":\"<i class=\\\"lab la-linkedin-in\\\"><\\/i>\",\"url\":\"linkedin.com\"}', '2021-03-21 02:09:35', '2021-03-21 02:11:28'),
(75, 'subscribe.content', '{\"heading\":\"Subscribe our newsletter to get regullar news and  tips. we promise we won\'t harass you. Provident inventore dolorum minus\"}', '2021-03-21 02:12:55', '2021-05-04 01:01:57'),
(76, 'contact_us.content', '{\"address\":\"77 St. Road, LAS VEGAS\",\"email\":\"demo@gmail.com\",\"number\":\"1234567890\"}', '2021-03-21 07:15:03', '2023-01-07 08:59:00'),
(77, 'faq.element', '{\"question\":\"Libero ipsam recusandae omnis laudantium cum ratione, voluptates, numquam illum iusto, at repellendus?\",\"answers\":\"lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book\"}', '2021-03-22 01:09:15', '2021-03-22 01:09:15'),
(78, 'faq.element', '{\"question\":\"lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.\",\"answers\":\"lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book\"}', '2021-03-22 01:09:25', '2021-03-22 01:09:25'),
(79, 'faq.element', '{\"question\":\"Libero ipsam recusandae omnis laudantium cum ratione, voluptates, numquam illum iusto, at repellendus?\",\"answers\":\"lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.\"}', '2021-03-22 01:09:33', '2021-03-22 01:09:33'),
(80, 'faq.element', '{\"question\":\"lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.\",\"answers\":\"lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.\"}', '2021-03-22 01:10:04', '2021-03-22 01:10:04'),
(81, 'faq.element', '{\"question\":\"lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.\",\"answers\":\"lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.\"}', '2021-03-22 01:10:23', '2021-03-22 01:10:23'),
(82, 'faq.element', '{\"question\":\"Libero ipsam recusandae omnis laudantium cum ratione, voluptates, numquam illum iusto, at repellendus?\",\"answers\":\"lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.\"}', '2021-03-22 01:10:30', '2021-03-22 01:10:30'),
(83, 'breadcrumb.content', '{\"has_image\":\"1\",\"background_image\":\"605ed645dc0fa1616827973.jpg\"}', '2021-03-27 00:52:53', '2021-03-27 00:52:54'),
(84, 'crypto_price.content', '{\"heading\":\"Today\'s Cryptocurrency Prices\",\"sub_heading\":\"lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have\"}', '2021-03-28 12:51:19', '2021-04-28 01:04:09'),
(85, 'footer.element', '{\"menu\":\"Overview\",\"description\":\"<div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We endeavor to make our clients happy with the item they\'ve bought from us. In case you\'re experiencing difficulty with excellent items or trust it is blemished, or potentially you\'re feeling baffled, at that point please present a pass to our Helpdesk to report your inadequate item and our team will help you at the earliest opportunity. For a harmed content, augmentation or layout, we will demand from you a connection and add a screen capture of the issue to be shipped off our help administration.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Refund Is Not Possible When:<\\/h3><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">The framework turns out great on your side yet includes don\'t match or you may have thought something different.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Your necessities are currently modified and you needn\'t bother with the Script anymore.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You end up discovering some other Software which you believe is better.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You don\'t need a site or administration right now.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Our highlights don\'t address your issues and prerequisites or aren\'t as extensive as you suspected.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You don\'t have such an environment for your worker to run our framework.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">On the off chance that you as of now download our framework.<\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><span style=\\\"font-weight:bolder;\\\">No returns\\/refunds will be offered for digital products except if the product you\\u2019ve purchased is:<\\/span><\\/p><ul><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Completely non-functional \\/ not same as demo.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">If you\\u2019ve opened a support ticket but you didn\'t get any response in 48 hours (2 Business days).<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">The product description was fully misleading.<\\/li><\\/ul><p style=\\\"margin-right:0px;margin-left:0px;\\\"><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><\\/p><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Please also note that:<\\/h3><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Refunds can take up to 45 days (depends on Bank and payment Methods) to reflect in your account.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">We normally charge 20% (4% gateway fee + 9% Dispute Fee + 7% Processing Fee) as Refund Processing fee.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You can cancel your account at any time; no refunds for cancellation.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You will be unable to download or use the item when you claim for refund.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">If you have been downloaded items then no refund allowed.<\\/li><\\/ul><\\/div>\"}', '2021-03-29 02:17:45', '2021-05-04 00:46:47'),
(86, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"forex\",\"Trading platform\",\"Online Trading\",\"Cryptocurrency\",\"Trading tools\",\"Web-based trading\",\"Real-time market data\"],\"description\":\"TradeLab is a unique trading platform. You can make real-time transactions whenever and wherever you like. The platform can be accessed not only from a PC but also from a full-service mobile. It\'s easily installable, controllable through the admin panel, and comes with a responsive design, high security, and interactive User interface. support plugins, LiveChat, Google ReCaptcha, analytics, automatic payment gateway, cards, currencies, and cryptos.\",\"social_title\":\"TradeLab\",\"social_description\":\"TradeLab is a unique trading platform. You can make real-time transactions whenever and wherever you like. The platform can be accessed not only from a PC but also from a full-service mobile. It\'s easily installable, controllable through the admin panel, and comes with a responsive design, high security, and interactive User interface. support plugins, LiveChat, Google ReCaptcha, analytics, automatic payment gateway, cards, currencies, and cryptos.\",\"image\":\"63f339b48607f1676884404.png\"}', '2021-04-28 00:49:34', '2023-02-20 09:15:30'),
(89, 'faq.content', '{\"heading\":\"Frequently Asked Questions\",\"sub_heading\":\"A frequently asked questions (FAQ) forum is often used in articles, websites, email lists, and online forums where common questions tend to recur, for example through\"}', '2021-05-06 22:46:42', '2021-05-06 22:48:27'),
(90, 'kyc_content.content', '{\"unverified_content\":\"Dear User, we need your KYC Data for some action. Don\'t hesitate to provide KYC Data, It\'s so much potential for us too. Don\'t worry,  it\'s very much secure in our system.\",\"pending_content\":\"Dear user, Your submitted KYC Data is currently pending now. Please take us some time to review your Data. Thank you so much for your cooperation.\"}', '2023-01-04 03:57:26', '2023-01-04 03:57:26'),
(92, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"margin-top:-16px;line-height:1.3;\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-size:16px;font-family:Nunito, sans-serif;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">We claim all authority to dismiss, end, or handicap any help with or without cause per administrator discretion. This is a Complete independent facilitating, on the off chance that you misuse our ticket or Livechat or emotionally supportive network by submitting solicitations or protests we will impair your record. The solitary time you should reach us about the seaward facilitating is if there is an issue with the worker. We have not many substance limitations and everything is as per laws and guidelines. Try not to join on the off chance that you intend to do anything contrary to the guidelines, we do check these things and we will know, don\'t burn through our own and your time by joining on the off chance that you figure you will have the option to sneak by us and break the terms.<br \\/><\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-size:16px;font-family:Nunito, sans-serif;\\\"><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Configuration requests - If you have a fully managed dedicated server with us then we offer custom PHP\\/MySQL configurations, firewalls for dedicated IPs, DNS, and httpd configurations.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Software requests - Cpanel Extension Installation will be granted as long as it does not interfere with the security, stability, and performance of other users on the server.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Emergency Support - We do not provide emergency support \\/ Phone Support \\/ LiveChat Support. Support may take some hours sometimes.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Webmaster help - We do not offer any support for webmaster related issues and difficulty including coding, &amp; installs, Error solving. if there is an issue where a library or configuration of the server then we can help you if it\'s possible from our end.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">We Don\'t support any child porn or such material.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No spam-related sites or material, such as email lists, mass mail programs, and scripts, etc.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No harassing material that may cause people to retaliate against you.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No phishing pages.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">You may not run any exploitation script from the server. reason can be terminated immediately.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">If Anyone attempting to hack or exploit the server by using your script or hosting, we will terminate your account to keep safe other users.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Malicious Botnets are strictly forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Spam, mass mailing, or email marketing in any way are strictly forbidden here.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Malicious hacking materials, trojans, viruses, &amp; malicious bots running or for download are forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Resource and cronjob abuse is forbidden and will result in suspension or termination.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Php\\/CGI proxies are strictly forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">CGI-IRC is strictly forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No fake or disposal mailers, mass mailing, mail bombers, SMS bombers, etc.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">NO CREDIT OR REFUND will be granted for interruptions of service, due to User Agreement violations.<\\/font><\\/li><\\/ul><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Terms &amp; Conditions for Users<\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"margin-top:-16px;line-height:1.3;\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-size:16px;font-family:Nunito, sans-serif;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">Before getting to this site, you are consenting to be limited by these site Terms and Conditions of Use, every single appropriate law, and guidelines, and concur that you are answerable for consistency with any material neighborhood laws. If you disagree with any of these terms, you are restricted from utilizing or getting to this site.<\\/font><\\/p><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Support<\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"margin-top:-16px;line-height:1.3;\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-size:16px;font-family:Nunito, sans-serif;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">Whenever you have downloaded our item, you may get in touch with us for help through email and we will give a valiant effort to determine your issue. We will attempt to answer using the Email for more modest bug fixes, after which we will refresh the center bundle. Content help is offered to confirmed clients by Tickets as it were. Backing demands made by email and Livechat.<\\/font><\\/p><p class=\\\"my-3 font-18 font-weight-bold\\\" style=\\\"font-size:18px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">On the off chance that your help requires extra adjustment of the System, at that point, you have two alternatives:<\\/font><\\/p><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Hang tight for additional update discharge.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Or on the other hand, enlist a specialist (We offer customization for extra charges).<\\/font><\\/li><\\/ul><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Ownership<\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"margin-top:-16px;line-height:1.3;\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-size:16px;font-family:Nunito, sans-serif;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">You may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All items are property, we created them. Our items are given \\\"with no guarantees\\\" without guarantee of any sort, either communicated or suggested. On no occasion will our juridical individual be subject to any harms including, however not restricted to, immediate, roundabout, extraordinary, accidental, or significant harms or different misfortunes emerging out of the utilization of or powerlessness to utilize our items.<\\/font><\\/p><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Warranty<\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"margin-top:-16px;line-height:1.3;\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-size:16px;font-family:Nunito, sans-serif;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">We don\'t offer any guarantee or assurance of these Services in any way. When our Services have been modified we can\'t ensure they will work with all outsider plugins, modules, or internet browsers. Program similarity ought to be tried against the show formats on the demo worker. If you don\'t mind guarantee that the programs you use will work with the component, as we can not ensure that our systems will work with all program mixes.<\\/font><\\/p><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Unauthorized\\/Illegal Usage<\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"margin-top:-16px;line-height:1.3;\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-size:16px;font-family:Nunito, sans-serif;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">You may not utilize our things for any illicit or unapproved reason or may you, in the utilization of the stage, disregard any laws in your locale (counting yet not restricted to copyright laws) just as the laws of your nation and International law. Specifically, it is disallowed to utilize the things on our foundation for pages that advance: brutality, illegal intimidation, hard sexual entertainment, bigotry, obscenity content or warez programming joins.<br \\/><br \\/>You can\'t imitate, copy, duplicate, sell, exchange or adventure any of our segments, utilization of the offered on our things, or admittance to the administration without the express composed consent by us or the item proprietor.<br \\/><br \\/>Our Members are liable for all substance posted on the discussion and demo and movement that happens under your record.<br \\/><br \\/>We hold the chance of hindering your participation account quickly if we will think about a particularly not allowed conduct.<br \\/><br \\/>If you make a record on our site, you are liable for keeping up the security of your record, and you are completely answerable for all exercises that happen under the record and some other activities taken regarding the record. You should quickly inform us, of any unapproved employments of your record or some other penetrates of security.<\\/font><\\/p><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"margin-top:-16px;line-height:1.3;\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-size:16px;font-family:Nunito, sans-serif;\\\"><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Payment\\/Refund Policy<\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"margin-top:-16px;line-height:1.3;\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-size:16px;font-family:Nunito, sans-serif;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">No refund or cash back will be made. After a deposit has been finished, it is extremely unlikely to invert it. You should utilize your equilibrium on requests our administrations, Hosting, SEO campaign. You concur that once you complete a deposit, you won\'t document a debate or a chargeback against us in any way, shape, or form.<br \\/><br \\/>If you document a debate or chargeback against us after a deposit, we claim all authority to end every single future request, prohibit you from our site. False action, for example, utilizing unapproved or taken charge cards will prompt the end of your record. There are no special cases.<\\/font><\\/p><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Free Balance \\/ Coupon Policy<\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"margin-top:-16px;line-height:1.3;\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-size:16px;font-family:Nunito, sans-serif;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">We offer numerous approaches to get FREE Balance, Coupons and Deposit offers yet we generally reserve the privilege to audit it and deduct it from your record offset with any explanation we may it is a sort of misuse. If we choose to deduct a few or all of free Balance from your record balance, and your record balance becomes negative, at that point the record will naturally be suspended. If your record is suspended because of a negative Balance you can request to make a custom payment to settle your equilibrium to actuate your record.<\\/font><\\/p><\\/div><\\/div>\"}', '2023-01-07 08:07:32', '2023-02-20 11:09:29');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(94, 'policy_pages.element', '{\"title\":\"Terms Of Service\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">We\\r\\n claim all authority to dismiss, end, or handicap any help with or \\r\\nwithout cause per administrator discretion. This is a Complete \\r\\nindependent facilitating, on the off chance that you misuse our ticket \\r\\nor Livechat or emotionally supportive network by submitting \\r\\nsolicitations or protests we will impair your record. The solitary time \\r\\nyou should reach us about the seaward facilitating is if there is an \\r\\nissue with the worker. We have not many substance limitations and \\r\\neverything is as per laws and guidelines. Try not to join on the off \\r\\nchance that you intend to do anything contrary to the guidelines, we do \\r\\ncheck these things and we will know, don\'t burn through our own and your\\r\\n time by joining on the off chance that you figure you will have the \\r\\noption to sneak by us and break the terms.<br \\/><\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Configuration\\r\\n requests - If you have a fully managed dedicated server with us then we\\r\\n offer custom PHP\\/MySQL configurations, firewalls for dedicated IPs, \\r\\nDNS, and httpd configurations.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Software\\r\\n requests - Cpanel Extension Installation will be granted as long as it \\r\\ndoes not interfere with the security, stability, and performance of \\r\\nother users on the server.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Emergency\\r\\n Support - We do not provide emergency support \\/ Phone Support \\/ \\r\\nLiveChat Support. Support may take some hours sometimes.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Webmaster\\r\\n help - We do not offer any support for webmaster related issues and \\r\\ndifficulty including coding, &amp; installs, Error solving. if there is \\r\\nan issue where a library or configuration of the server then we can help\\r\\n you if it\'s possible from our end.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">We Don\'t support any child porn or such material.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No spam-related sites or material, such as email lists, mass mail programs, and scripts, etc.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No harassing material that may cause people to retaliate against you.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No phishing pages.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">You may not run any exploitation script from the server. reason can be terminated immediately.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">If\\r\\n Anyone attempting to hack or exploit the server by using your script or\\r\\n hosting, we will terminate your account to keep safe other users.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Malicious Botnets are strictly forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Spam, mass mailing, or email marketing in any way are strictly forbidden here.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Malicious hacking materials, trojans, viruses, &amp; malicious bots running or for download are forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Resource and cronjob abuse is forbidden and will result in suspension or termination.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Php\\/CGI proxies are strictly forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">CGI-IRC is strictly forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No fake or disposal mailers, mass mailing, mail bombers, SMS bombers, etc.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">NO CREDIT OR REFUND will be granted for interruptions of service, due to User Agreement violations.<\\/font><\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Terms &amp; Conditions for Users<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">Before\\r\\n getting to this site, you are consenting to be limited by these site \\r\\nTerms and Conditions of Use, every single appropriate law, and \\r\\nguidelines, and concur that you are answerable for consistency with any \\r\\nmaterial neighborhood laws. If you disagree with any of these terms, you\\r\\n are restricted from utilizing or getting to this site.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Support<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">Whenever\\r\\n you have downloaded our item, you may get in touch with us for help \\r\\nthrough email and we will give a valiant effort to determine your issue.\\r\\n We will attempt to answer using the Email for more modest bug fixes, \\r\\nafter which we will refresh the center bundle. Content help is offered \\r\\nto confirmed clients by Tickets as it were. Backing demands made by \\r\\nemail and Livechat.<\\/font><\\/p><p class=\\\"my-3 font-18 font-weight-bold\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">On the off chance that your help requires extra adjustment of the System, at that point, you have two alternatives:<\\/font><\\/p><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Hang tight for additional update discharge.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Or on the other hand, enlist a specialist (We offer customization for extra charges).<\\/font><\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Ownership<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">You\\r\\n may not guarantee scholarly or selective possession of any of our \\r\\nitems, altered or unmodified. All items are property, we created them. \\r\\nOur items are given \\\"with no guarantees\\\" without guarantee of any sort, \\r\\neither communicated or suggested. On no occasion will our juridical \\r\\nindividual be subject to any harms including, however not restricted to,\\r\\n immediate, roundabout, extraordinary, accidental, or significant harms \\r\\nor different misfortunes emerging out of the utilization of or \\r\\npowerlessness to utilize our items.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Warranty<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">We\\r\\n don\'t offer any guarantee or assurance of these Services in any way. \\r\\nWhen our Services have been modified we can\'t ensure they will work with\\r\\n all outsider plugins, modules, or internet browsers. Program similarity\\r\\n ought to be tried against the show formats on the demo worker. If you \\r\\ndon\'t mind guarantee that the programs you use will work with the \\r\\ncomponent, as we can not ensure that our systems will work with all \\r\\nprogram mixes.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Unauthorized\\/Illegal Usage<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">You\\r\\n may not utilize our things for any illicit or unapproved reason or may \\r\\nyou, in the utilization of the stage, disregard any laws in your locale \\r\\n(counting yet not restricted to copyright laws) just as the laws of your\\r\\n nation and International law. Specifically, it is disallowed to utilize\\r\\n the things on our foundation for pages that advance: brutality, illegal\\r\\n intimidation, hard sexual entertainment, bigotry, obscenity content or \\r\\nwarez programming joins.<br \\/><br \\/>You can\'t imitate, copy, duplicate, \\r\\nsell, exchange or adventure any of our segments, utilization of the \\r\\noffered on our things, or admittance to the administration without the \\r\\nexpress composed consent by us or the item proprietor.<br \\/><br \\/>Our Members are liable for all substance posted on the discussion and demo and movement that happens under your record.<br \\/><br \\/>We hold the chance of hindering your participation account quickly if we will think about a particularly not allowed conduct.<br \\/><br \\/>If\\r\\n you make a record on our site, you are liable for keeping up the \\r\\nsecurity of your record, and you are completely answerable for all \\r\\nexercises that happen under the record and some other activities taken \\r\\nregarding the record. You should quickly inform us, of any unapproved \\r\\nemployments of your record or some other penetrates of security.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/h3><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Payment\\/Refund Policy<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">No\\r\\n refund or cash back will be made. After a deposit has been finished, it\\r\\n is extremely unlikely to invert it. You should utilize your equilibrium\\r\\n on requests our administrations, Hosting, SEO campaign. You concur that\\r\\n once you complete a deposit, you won\'t document a debate or a \\r\\nchargeback against us in any way, shape, or form.<br \\/><br \\/>If you document\\r\\n a debate or chargeback against us after a deposit, we claim all \\r\\nauthority to end every single future request, prohibit you from our \\r\\nsite. False action, for example, utilizing unapproved or taken charge \\r\\ncards will prompt the end of your record. There are no special cases.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Free Balance \\/ Coupon Policy<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">We\\r\\n offer numerous approaches to get FREE Balance, Coupons and Deposit \\r\\noffers yet we generally reserve the privilege to audit it and deduct it \\r\\nfrom your record offset with any explanation we may it is a sort of \\r\\nmisuse. If we choose to deduct a few or all of free Balance from your \\r\\nrecord balance, and your record balance becomes negative, at that point \\r\\nthe record will naturally be suspended. If your record is suspended \\r\\nbecause of a negative Balance you can request to make a custom payment \\r\\nto settle your equilibrium to actuate your record.<\\/font><\\/p><\\/div>\"}', '2023-01-07 08:08:25', '2023-01-11 13:52:10'),
(96, 'banned.content', '{\"has_image\":\"1\",\"heading\":\"We are Sorry....\",\"image\":\"63f36aa4acdff1676896932.png\"}', '2023-01-07 10:59:24', '2023-02-20 12:42:12'),
(97, 'maintenance.data', '{\"description\":\"<div class=\\\"mb-3\\\" style=\\\"\\\"><h2 style=\\\"text-align: center;\\\"><font color=\\\"#ffffff\\\" size=\\\"5\\\">We\'re just tuning up a few things.<\\/font><\\/h2><h3 class=\\\"mb-3\\\" style=\\\"text-align: center; font-weight: 600; line-height: 1.3; font-family: Exo, sans-serif;\\\"><p style=\\\"text-align: center; font-family: Poppins, sans-serif;\\\"><font color=\\\"#ffffff\\\" style=\\\"\\\" size=\\\"3\\\">We apologize for the inconvenience but Front is currently undergoing planned maintenance. Thanks for your patience.<\\/font><\\/p><p style=\\\"font-size: 24px; color: rgb(54, 54, 54); font-family: Poppins, sans-serif; text-align: start;\\\"><br><\\/p><\\/h3><\\/div>\",\"image\":\"63b978a1b12951673099425.png\",\"heading\":\"THE SITE IS UNDER MAINTENANCE\"}', '2023-01-07 11:17:07', '2023-02-20 12:39:57'),
(98, 'cookie.data', '{\"short_desc\":\"We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.\",\"description\":\"<div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We\\r\\n gather data from you when you register on our site, submit a request, \\r\\nbuy any services, react to an overview, or round out a structure. At the\\r\\n point when requesting any assistance or enrolling on our site, as \\r\\nsuitable, you might be approached to enter your: name, email address, or\\r\\n telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">All provided delicate\\/credit data is sent through Stripe.<br>After\\r\\n an exchange, your private data (credit cards, social security numbers, \\r\\nfinancials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We\\r\\n don\'t sell, exchange, or in any case move to outside gatherings by and \\r\\nby recognizable data. This does exclude confided in outsiders who help \\r\\nus in working our site, leading our business, or adjusting you, since \\r\\nthose gatherings consent to keep this data private. We may likewise \\r\\ndeliver your data when we accept discharge is suitable to follow the \\r\\nlaw, implement our site strategies, or ensure our own or others\' rights,\\r\\n property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We\\r\\n are consistent with the prerequisites of COPPA (Children\'s Online \\r\\nPrivacy Protection Act), we don\'t gather any data from anybody under 13 \\r\\nyears old. Our site, items, and administrations are completely \\r\\ncoordinated to individuals who are in any event 13 years of age or more \\r\\nestablished.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">At\\r\\n the point when you register for our site, we cycle and keep your \\r\\ninformation we have about you however long you don\'t erase the record or\\r\\n withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We\\r\\n don\'t and will never share, unveil, sell, or in any case give your \\r\\ninformation to different organizations for the promoting of their items \\r\\nor administrations.<\\/p><\\/div>\",\"status\":1}', '2023-01-09 07:21:39', '2023-01-09 07:21:39'),
(99, 'policy_pages.element', '{\"title\":\"Terms of Use\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;font-family:Nunito, sans-serif;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">We claim all authority to dismiss, end, or handicap any help with or without cause per administrator discretion. This is a Complete independent facilitating, on the off chance that you misuse our ticket or Livechat or emotionally supportive network by submitting solicitations or protests we will impair your record. The solitary time you should reach us about the seaward facilitating is if there is an issue with the worker. We have not many substance limitations and everything is as per laws and guidelines. Try not to join on the off chance that you intend to do anything contrary to the guidelines, we do check these things and we will know, don\'t burn through our own and your time by joining on the off chance that you figure you will have the option to sneak by us and break the terms.<br \\/><\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;font-family:Nunito, sans-serif;\\\"><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Configuration requests - If you have a fully managed dedicated server with us then we offer custom PHP\\/MySQL configurations, firewalls for dedicated IPs, DNS, and httpd configurations.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Software requests - Cpanel Extension Installation will be granted as long as it does not interfere with the security, stability, and performance of other users on the server.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Emergency Support - We do not provide emergency support \\/ Phone Support \\/ LiveChat Support. Support may take some hours sometimes.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Webmaster help - We do not offer any support for webmaster related issues and difficulty including coding, &amp; installs, Error solving. if there is an issue where a library or configuration of the server then we can help you if it\'s possible from our end.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">We Don\'t support any child porn or such material.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No spam-related sites or material, such as email lists, mass mail programs, and scripts, etc.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No harassing material that may cause people to retaliate against you.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No phishing pages.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">You may not run any exploitation script from the server. reason can be terminated immediately.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">If Anyone attempting to hack or exploit the server by using your script or hosting, we will terminate your account to keep safe other users.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Malicious Botnets are strictly forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Spam, mass mailing, or email marketing in any way are strictly forbidden here.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Malicious hacking materials, trojans, viruses, &amp; malicious bots running or for download are forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Resource and cronjob abuse is forbidden and will result in suspension or termination.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Php\\/CGI proxies are strictly forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">CGI-IRC is strictly forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No fake or disposal mailers, mass mailing, mail bombers, SMS bombers, etc.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">NO CREDIT OR REFUND will be granted for interruptions of service, due to User Agreement violations.<\\/font><\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Terms &amp; Conditions for Users<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">Before getting to this site, you are consenting to be limited by these site Terms and Conditions of Use, every single appropriate law, and guidelines, and concur that you are answerable for consistency with any material neighborhood laws. If you disagree with any of these terms, you are restricted from utilizing or getting to this site.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Support<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">Whenever you have downloaded our item, you may get in touch with us for help through email and we will give a valiant effort to determine your issue. We will attempt to answer using the Email for more modest bug fixes, after which we will refresh the center bundle. Content help is offered to confirmed clients by Tickets as it were. Backing demands made by email and Livechat.<\\/font><\\/p><p class=\\\"my-3 font-18 font-weight-bold\\\" style=\\\"font-size:18px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">On the off chance that your help requires extra adjustment of the System, at that point, you have two alternatives:<\\/font><\\/p><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Hang tight for additional update discharge.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Or on the other hand, enlist a specialist (We offer customization for extra charges).<\\/font><\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Ownership<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">You may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All items are property, we created them. Our items are given \\\"with no guarantees\\\" without guarantee of any sort, either communicated or suggested. On no occasion will our juridical individual be subject to any harms including, however not restricted to, immediate, roundabout, extraordinary, accidental, or significant harms or different misfortunes emerging out of the utilization of or powerlessness to utilize our items.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Warranty<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">We don\'t offer any guarantee or assurance of these Services in any way. When our Services have been modified we can\'t ensure they will work with all outsider plugins, modules, or internet browsers. Program similarity ought to be tried against the show formats on the demo worker. If you don\'t mind guarantee that the programs you use will work with the component, as we can not ensure that our systems will work with all program mixes.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Unauthorized\\/Illegal Usage<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">You may not utilize our things for any illicit or unapproved reason or may you, in the utilization of the stage, disregard any laws in your locale (counting yet not restricted to copyright laws) just as the laws of your nation and International law. Specifically, it is disallowed to utilize the things on our foundation for pages that advance: brutality, illegal intimidation, hard sexual entertainment, bigotry, obscenity content or warez programming joins.<br \\/><br \\/>You can\'t imitate, copy, duplicate, sell, exchange or adventure any of our segments, utilization of the offered on our things, or admittance to the administration without the express composed consent by us or the item proprietor.<br \\/><br \\/>Our Members are liable for all substance posted on the discussion and demo and movement that happens under your record.<br \\/><br \\/>We hold the chance of hindering your participation account quickly if we will think about a particularly not allowed conduct.<br \\/><br \\/>If you make a record on our site, you are liable for keeping up the security of your record, and you are completely answerable for all exercises that happen under the record and some other activities taken regarding the record. You should quickly inform us, of any unapproved employments of your record or some other penetrates of security.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/h3><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Payment\\/Refund Policy<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">No refund or cash back will be made. After a deposit has been finished, it is extremely unlikely to invert it. You should utilize your equilibrium on requests our administrations, Hosting, SEO campaign. You concur that once you complete a deposit, you won\'t document a debate or a chargeback against us in any way, shape, or form.<br \\/><br \\/>If you document a debate or chargeback against us after a deposit, we claim all authority to end every single future request, prohibit you from our site. False action, for example, utilizing unapproved or taken charge cards will prompt the end of your record. There are no special cases.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Free Balance \\/ Coupon Policy<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">We offer numerous approaches to get FREE Balance, Coupons and Deposit offers yet we generally reserve the privilege to audit it and deduct it from your record offset with any explanation we may it is a sort of misuse. If we choose to deduct a few or all of free Balance from your record balance, and your record balance becomes negative, at that point the record will naturally be suspended. If your record is suspended because of a negative Balance you can request to make a custom payment to settle your equilibrium to actuate your record.<\\/font><\\/p><\\/div>\"}', '2023-01-09 09:03:32', '2023-01-11 13:52:34'),
(100, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"5 Tips to Master Cryptocurrency Trading in 2023\",\"description\":\"<h2 style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:1.75rem;line-height:2rem;margin-bottom:1.5rem;margin-top:1.25rem;\\\"><span style=\\\"font-weight:700;font-size:18px;line-height:1.75rem;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/span><\\/h2><h2 style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:1.75rem;line-height:2rem;margin-bottom:1.5rem;margin-top:1.25rem;\\\"><span style=\\\"font-weight:700;font-size:18px;line-height:1.75rem;\\\"><font color=\\\"#ffffff\\\">For many years, investors have been hooked on traditional financial instruments like stocks, bonds, commodities, and forex for investment purposes. However, cryptocurrency trading has become the new playing field amongst market players, especially day traders.<\\/font><\\/span><\\/h2><h2 style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:1.75rem;line-height:2rem;margin-bottom:1.5rem;margin-top:1.25rem;\\\"><font color=\\\"#ffffff\\\">5 Tips to master cryptocurrency trading\\u00a0<\\/font><\\/h2><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">Short-term traders are usually tempted by the momentum and volatility portrayed by the cryptocurrency market. This volatility has the potential to deliver massive gains over the short run. The beloved digital currency Bitcoin has generated an astonishing return to date, leaving the market participants in awe.<\\/font><\\/p><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">These fast and furious rallies in the crypto space appear enticing. But, it is hard to neglect sharp trend reversals in cryptocurrencies that make trading a bit difficult. Therefore, having a proper trading plan is essential for traders to prevent impulsive, hasty decisions that can result in substantial financial losses.<\\/font><\\/p><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">2021 perhaps turned out to be one of the best years for the cryptocurrency market. Given this backdrop, here are some tips for investors to harness the benefits of cryptocurrency trading:<\\/font><\\/p><h2 style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:1.75rem;line-height:2rem;margin-bottom:1.5rem;margin-top:1.25rem;\\\"><font color=\\\"#ffffff\\\">1. Focus on Liquid Currencies<\\/font><\\/h2><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">While thousands of cryptocurrencies have been created and listed on the crypto exchanges, not all of them are worth trading amidst a lack of liquidity. Liquidity is a key factor that enables short-term traders to enter and exit a position with ease.<\\/font><\\/p><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">The lack of liquidity in some cryptocurrencies hampers the agility of traders. This makes it challenging for them to get in and out of a large position. Liquidity also affects the impact cost, thereby increasing the overall cost of trading. Hence, it is imperative for a trader to trade such cryptocurrencies where a sufficient volume of trading is already taking place.<\\/font><\\/p><h2 style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:1.75rem;line-height:2rem;margin-bottom:1.5rem;margin-top:1.25rem;\\\"><font color=\\\"#ffffff\\\">2. Trade, Do Not Gamble<\\/font><\\/h2><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">One thing that is common between trading and gambling is the uncertainty of the outcome. In both the playing fields, one makes a bet and waits for an outcome. However, what separates a trader from a gambler is risk management. What this means is that buying digital currencies without assessing the risk is equivalent to gambling.<\\/font><\\/p><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">With cryptos being an epitome of volatility, the uncertainty increases manifold than any stable security. Thus, it is even more important for crypto traders to have a robust risk management plan in place. It seems sensible for a trader to use stop-loss orders and just risk an amount he\\/she is comfortable with losing on the trade.<\\/font><\\/p><h4 style=\\\"font-family:Helvetica, Arial, sans-serif;line-height:1.5rem;margin-bottom:0.625rem;margin-top:0.625rem;text-align:center;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/h4><h2 style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:1.75rem;line-height:2rem;margin-bottom:1.5rem;margin-top:1.25rem;\\\"><font color=\\\"#ffffff\\\">3. Buy the Strength, Sell the Weakness<\\/font><\\/h2><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">Unlike other financial assets, cryptocurrencies do not have any intrinsic value attached to them. Therefore, there is practically no such thing as a high price or a low price of a cryptocurrency.<\\/font><\\/p><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">In such scenarios, traders can purchase a strong uptrend and sell a downtrend with a proper risk management plan in place. However, one need not neglect that cryptos also have an uncanny ability to stay in an overbought\\/oversold zone for a long duration of time. Thus, one should execute mean reversion trades with caution during crypto trading.<\\/font><\\/p><h2 style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:1.75rem;line-height:2rem;margin-bottom:1.5rem;margin-top:1.25rem;\\\"><font color=\\\"#ffffff\\\">4. Ensure Due Diligence for Lower-Priced Cryptos<\\/font><\\/h2><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">Lower-priced crypto assets have been gaining immense popularity among the new traders in the crypto space. The sheer gain in the percentage terms takes centre stage when such cryptocurrencies rise. These attractive gains often lure traders who end up buying these assets in heavy quantities without sufficient research.<\\/font><\\/p><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">Traders need to understand that the cheapest crypto is not always the best choice. Hence, it is imperative for a crypto trader to conduct proper due diligence before investing in such assets. Moreover, traders can hunt for crypto assets having real potential for enticing a user base in the future.<\\/font><\\/p><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">Instead of chasing the cheapest currencies, traders can seek trading platforms charging reasonable fees for processing payments to make cost-efficient crypto trading. One can also look for trading platforms that do not penalise much for converting fiat into digital currency.<\\/font><\\/p><h2 style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:1.75rem;line-height:2rem;margin-bottom:1.5rem;margin-top:1.25rem;\\\"><font color=\\\"#ffffff\\\">5. Keep Emotions in Check<\\/font><\\/h2><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">Primary emotions like fear and greed can change the results upside down even with a good trading strategy. Such emotions tend to escalate when a trader experiences large swings in his profit and loss account, which is quite common with crypto holdings amidst their erratic movements.<\\/font><\\/p><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">Working on trading psychology while containing greed and fear seems instrumental for traders to make money in the cryptocurrency market. Moreover, it is imperative for traders to have the discipline to stick with their respective trading plans and understand when to book profits and losses.<\\/font><\\/p><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">While these tips can help crypto traders avoid some common mistakes and cut down their learning curve, they are not a replacement for a rich experience. Thus, it is crucial for traders to keep learning all the way through their investing years to become proficient in crypto trading. Remember, the \\u201cMarket is the best teacher when it comes to investing\\u201d!<\\/font><\\/p>\",\"image\":\"63f33ee17935a1676885729.jpg\"}', '2023-02-20 09:35:29', '2023-02-20 10:21:16');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(101, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Trading vs. Investing\",\"description\":\"<div class=\\\"DematHeading\\\" style=\\\"padding:0px 15px;font-family:Roboto, sans-serif;font-size:14px;\\\"><h2 class=\\\"comp mntl-sc-block finance-sc-block-heading mntl-sc-block-heading\\\" style=\\\"font-size:1.625rem;font-weight:bolder;line-height:1.2;margin-bottom:0.5rem;font-family:\'Cabin-semi-bold\', \'Cabin-fallback\', sans-serif;letter-spacing:0.05px;\\\"><span class=\\\"mntl-sc-block-heading__text\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/span><\\/h2><h2 class=\\\"comp mntl-sc-block finance-sc-block-heading mntl-sc-block-heading\\\" style=\\\"font-size:1.625rem;font-weight:bolder;line-height:1.2;margin-bottom:0.5rem;font-family:\'Cabin-semi-bold\', \'Cabin-fallback\', sans-serif;letter-spacing:0.05px;\\\"><span class=\\\"mntl-sc-block-heading__text\\\"><font color=\\\"#ffffff\\\">Trading<\\/font><\\/span><\\/h2><div><span class=\\\"mntl-sc-block-heading__text\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/span><\\/div><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">Trading involves more frequent transactions, such as the buying and selling of stocks, commodities,\\u00a0or other instruments. The goal is to generate returns that outperform buy-and-hold investing. While investors may be content with of 10% to 15%, traders might seek a 10% return each month. Trading profits are generated by buying at a lower price and selling at a higher price within a relatively short period of time. The reverse also is true: trading profits can be made by selling at a higher price and buying to cover at a lower price to profit in falling markets.<\\/font><\\/p><div class=\\\"comp mntl-sc-block mntl-sc-block-adslot mntl-block\\\" style=\\\"font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><div class=\\\"comp native mntl-native\\\" style=\\\"width:600px;\\\"><\\/div><\\/div><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">While buy-and-hold investors wait out less profitable positions, traders seek to make profits within a specified period of time and often use a protective stop-loss order to automatically close out losing positions at a predetermined price level. Traders often employ technical analysis tools, such as moving averages and stochastic oscillators, to find high-probability trading setups.<\\/font><\\/p><div class=\\\"comp mntl-sc-block mntl-sc-block-adslot mntl-block\\\" style=\\\"font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><\\/div><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">A trader\'s style refers to the timeframe in which stocks, commodities, or other trading instruments are bought and sold. Traders generally fall into one of four categories:<\\/font><\\/p><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><h2 class=\\\"comp mntl-sc-block finance-sc-block-heading mntl-sc-block-heading\\\" style=\\\"font-size:1.625rem;font-weight:bolder;line-height:1.2;margin-bottom:0.5rem;font-family:\'Cabin-semi-bold\', \'Cabin-fallback\', sans-serif;letter-spacing:0.05px;\\\"><span class=\\\"mntl-sc-block-heading__text\\\"><font color=\\\"#ffffff\\\">Investing<\\/font><\\/span><\\/h2><div><span class=\\\"mntl-sc-block-heading__text\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/span><\\/div><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">The goal of investing is to gradually build wealth over an extended period of time through the buying and holding of a portfolio of stocks, baskets of stocks, mutual funds, bonds, and other investment instruments.<\\/font><\\/p><div class=\\\"comp mntl-sc-block mntl-sc-block-adslot mntl-block\\\" style=\\\"font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><\\/div><div class=\\\"comp mntl-sc-block finance-sc-block-callout mntl-block\\\" style=\\\"font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><div class=\\\"comp theme-important mntl-sc-block mntl-sc-block-callout mntl-block\\\" style=\\\"margin:-0.75rem 0px 1rem;padding:0.5rem;border:1px solid rgb(225,226,230);\\\"><div class=\\\"comp mntl-sc-block-callout-body mntl-text-block\\\" style=\\\"padding-right:1.75rem;padding-left:2rem;\\\"><font color=\\\"#ffffff\\\"><span style=\\\"letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">Investments often are held for a period of years, or even decades, taking advantage of perks like interest, dividends, and stock splits along the way. While markets inevitably fluctuate, investors will \\\"ride out\\\" the downtrends with the expectation that prices will rebound and any losses eventually will be recovered. Investors typically are more concerned with market fundamentals, such as price-to-earnings ratios and management forecasts.<\\/font><\\/span><br \\/><\\/font><\\/div><\\/div><\\/div><div class=\\\"comp mntl-sc-block mntl-sc-block-adslot mntl-block\\\" style=\\\"font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><\\/div><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">Anyone who has a 401(k) or an IRA is investing, even if they are not tracking the performance of their holdings on a daily basis. Since the goal is to grow a retirement account over the course of decades, the day-to-day fluctuations of different mutual funds are less important than consistent growth over an extended period.<\\/font><\\/p><\\/div><div style=\\\"color:rgb(51,51,51);font-family:Roboto, sans-serif;font-size:14px;\\\"><div><div class=\\\"panel-collapse collapse in\\\"><div class=\\\"panel-body\\\" style=\\\"padding:0px 10px 20px 0px;border-bottom:1px solid rgb(205,205,205);\\\"><p style=\\\"margin-right:10px;margin-bottom:10px;margin-left:30px;font-size:17px;line-height:30px;color:rgb(74,74,74);\\\">There are several differences between trading and investing, but the most popular differences are the investment approach and the time involved.<\\/p><ul class=\\\"panel-body-li\\\" style=\\\"margin-bottom:20px;margin-left:30px;\\\"><li style=\\\"list-style:none;margin-top:0px;margin-right:0px;margin-left:0px;padding-left:20px;line-height:30px;font-size:17px;\\\"><em style=\\\"width:7px;height:7px;background:rgb(178,207,65);font-size:14px;\\\"><\\/em><strong style=\\\"font-weight:bold;\\\">Investment Approach between Investing and Trading<\\/strong><\\/li><\\/ul><p style=\\\"margin-right:10px;margin-bottom:10px;margin-left:30px;font-size:17px;line-height:30px;color:rgb(74,74,74);\\\">The critical difference between investing and trading is the type of approach involved in both methods. In investing, the investor uses the fundamental analysis of the company, and in trading, it involves technical analysis.<\\/p><p style=\\\"margin-right:10px;margin-bottom:10px;margin-left:30px;font-size:17px;line-height:30px;color:rgb(74,74,74);\\\">Fundamental analysis involves the company\'s financial analysis, previous financial records of the company, analysis of the industry on which the company is based, and the overall performance of the industry based on the macroeconomic situations in the country and the results.<\\/p><p style=\\\"margin-right:10px;margin-bottom:10px;margin-left:30px;font-size:17px;line-height:30px;color:rgb(74,74,74);\\\">Technical analysis is everyday financial trends such as the company\'s performance in numbers based on the uptrends and downtrends in the market every day. It requires the traders to study the company closely and every day as it makes financial decisions and reflects in the charts and numbers in the stock market. This data helps the traders to make significant predictions of the changes and involves studying trends in volume, price, and moving averages.<\\/p><p style=\\\"margin-right:10px;margin-bottom:10px;margin-left:30px;font-size:17px;line-height:30px;color:rgb(74,74,74);\\\">Traders need to act dynamically and buy or sell based on the current trends while investors study the company closely, invest in it and hold it for a longer period to earn profit with lesser risk.<\\/p><em style=\\\"width:7px;height:7px;background:rgb(178,207,65);font-size:14px;\\\"><\\/em><strong style=\\\"font-weight:bold;\\\">Time-Based and Risk-Based differences between Investing and Trading<\\/strong><p style=\\\"margin-right:10px;margin-bottom:10px;margin-left:30px;font-size:17px;line-height:30px;color:rgb(74,74,74);\\\">There is a difference in time involved in both the market-based money investments. Investing involves studying the company closely and holding it for a longer period with the expectation that it will return profits in the long haul; this type of investment involves lesser risk and may incur not huge profits but are relatively safe to the market trends. A classic example of \\\"investing\\\" is mutual funds and involves lesser risk and lesser profit. Other examples are bonds or baskets of stocks for long holding positions. The time frame can range years together and is less dynamic. The trend in the market that lasts for a shorter period does not make any difference to the investors.<\\/p><p style=\\\"margin-right:10px;margin-bottom:10px;margin-left:30px;font-size:17px;line-height:30px;color:rgb(74,74,74);\\\">Trading studies the companies closely with everyday trends to predict the future change on which they could earn better profits. This is a short-term investment and can involve buying and selling within a single day, weeks, or months based on the market situations. It is a high risk-reward ratio as the market is volatile, and one wrong decision can incur huge losses. A classic example of trading is the basis of the stock market, where the trader buys a certain number of stocks when the prices are low and sells them when the prices are high to generate huge profits. This time approach not only allows the traders to make quick transactions but also earn more compared to the long-term investors.<\\/p><p style=\\\"margin-right:10px;margin-bottom:10px;margin-left:30px;font-size:17px;line-height:30px;color:rgb(74,74,74);\\\"><strong style=\\\"font-weight:bold;\\\">Final words<\\/strong><\\/p><p style=\\\"margin-right:10px;margin-bottom:10px;margin-left:30px;font-size:17px;line-height:30px;color:rgb(74,74,74);\\\">The major differences between investing and trading are approaches, risk, and time involved. It is okay to do both, and it depends on the risk-taking ability and patience of the person to choose between either of these or both of these. Investing is long-term and involves lesser risk, while trading is short-term and involves high risk. Both earn profits, but traders frequently earn more profit compared to investors when they make the right decisions, and the market is performing accordingly.<\\/p><\\/div><\\/div><\\/div><\\/div>\",\"image\":\"63f3464cb6a5c1676887628.jpg\"}', '2023-02-20 09:38:10', '2023-02-20 10:20:28'),
(102, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"How to Use Technical Analysis in Trading\",\"description\":\"<h2 style=\\\"margin-bottom:1.25rem;font-weight:700;line-height:1.375;font-family:\'Open Sans\', \'-apple-system\', BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/h2><h2 style=\\\"margin-bottom:1.25rem;font-weight:700;line-height:1.375;font-family:\'Open Sans\', \'-apple-system\', BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif;\\\"><font color=\\\"#ffffff\\\">What is Technical Analysis?<\\/font><\\/h2><p style=\\\"margin-right:0px;margin-bottom:1.5rem;margin-left:0px;font-family:\'Open Sans\', \'-apple-system\', BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif;font-size:18px;\\\"><font color=\\\"#ffffff\\\">Technical analysis is a tool, or\\u00a0, used to predict the probable future price movement of a security \\u2013 such as a\\u00a0or currency pair \\u2013 based on market data.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:1.5rem;margin-left:0px;font-family:\'Open Sans\', \'-apple-system\', BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif;font-size:18px;\\\"><font color=\\\"#ffffff\\\">The theory behind the validity of technical analysis is the notion that the collective actions \\u2013 buying and selling \\u2013 of all the participants in the market accurately reflect all relevant information pertaining to a traded security, and therefore, continually assign a fair market value to the<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:1.5rem;margin-left:0px;font-family:\'Open Sans\', \'-apple-system\', BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif;\\\"><span style=\\\"color:rgb(255,255,255);\\\"><br \\/><\\/span><\\/p><p style=\\\"margin-right:0px;margin-bottom:1.5rem;margin-left:0px;font-family:\'Open Sans\', \'-apple-system\', BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif;\\\"><span style=\\\"color:rgb(255,255,255);\\\">Past Price as an Indicator of Future Performance<\\/span><\\/p><p style=\\\"margin-right:0px;margin-bottom:1.5rem;margin-left:0px;font-family:\'Open Sans\', \'-apple-system\', BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif;font-size:18px;\\\"><font color=\\\"#ffffff\\\">Technical traders believe that current or past price action in the market is the most reliable indicator of future price action.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:1.5rem;margin-left:0px;font-family:\'Open Sans\', \'-apple-system\', BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif;font-size:18px;\\\"><font color=\\\"#ffffff\\\">Technical analysis is not only used by technical traders. Many fundamental traders useto determine whether to buy into a market, but having made that decision, then use technical analysis to pinpoint good, low-risk buy entry price levels.<\\/font><\\/p>\",\"image\":\"63f34173307941676886387.jpg\"}', '2023-02-20 09:46:27', '2023-02-20 10:22:02'),
(103, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"What is Algorithmic Trading and How Does it Work?\",\"description\":\"<h2 class=\\\"comp mntl-sc-block finance-sc-block-heading mntl-sc-block-heading\\\" style=\\\"font-size:1.625rem;font-weight:bolder;line-height:1.2;margin-bottom:0.5rem;font-family:\'Cabin-semi-bold\', \'Cabin-fallback\', sans-serif;letter-spacing:0.05px;\\\"><span class=\\\"mntl-sc-block-heading__text\\\"><font><br \\/><\\/font><\\/span><\\/h2><h2 class=\\\"comp mntl-sc-block finance-sc-block-heading mntl-sc-block-heading\\\" style=\\\"font-size:1.625rem;font-weight:bolder;line-height:1.2;margin-bottom:0.5rem;font-family:\'Cabin-semi-bold\', \'Cabin-fallback\', sans-serif;letter-spacing:0.05px;\\\"><span class=\\\"mntl-sc-block-heading__text\\\"><font color=\\\"#ffffff\\\">What Is Algorithmic Trading?<\\/font><\\/span><\\/h2><div><span class=\\\"mntl-sc-block-heading__text\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/span><\\/div><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">Algorithmic trading\\u00a0(also called automated trading,\\u00a0black-box trading,\\u00a0or\\u00a0algo-trading) uses a computer program that follows a defined set of instructions (an algorithm)\\u00a0to place a trade. The trade, in theory, can generate profits\\u00a0at a speed and frequency that is impossible\\u00a0for a human trader.<\\/font><\\/p><div class=\\\"comp mntl-sc-block mntl-sc-block-adslot mntl-block\\\" style=\\\"font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><\\/div><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">The defined sets of instructions are based on timing, price, quantity, or any mathematical model. Apart from profit opportunities for the trader, algo-trading renders markets more liquid and trading more systematic by ruling out the impact of human emotions\\u00a0on trading activities.<\\/font><\\/p><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><span style=\\\"font-family:\'Cabin-semi-bold\', \'Cabin-fallback\', sans-serif;font-size:1.625rem;font-weight:bolder;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">Advantages and Disadvantages of Algorithmic Trading<\\/font><\\/span><\\/p><h3 class=\\\"comp mntl-sc-block finance-sc-block-subheading mntl-sc-block-subheading\\\" style=\\\"margin-bottom:0.5rem;line-height:1.5;font-family:\'Cabin-semi-bold\', \'Cabin-fallback\', sans-serif;letter-spacing:0.05px;\\\"><span class=\\\"mntl-sc-block-subheading__text\\\"><font color=\\\"#ffffff\\\">Advantages<\\/font><\\/span><\\/h3><div><span class=\\\"mntl-sc-block-subheading__text\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/span><\\/div><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">Algo-trading provides the following advantages:<span class=\\\"mntl-inline-citation mntl-dynamic-tooltip--trigger\\\" style=\\\"vertical-align:baseline;font-size:0.875rem;padding-bottom:0px;margin-left:2px;letter-spacing:0.07em;line-height:1;\\\"><span>1<\\/span><\\/span><\\/font><\\/p><div class=\\\"comp mntl-sc-block mntl-sc-block-adslot mntl-block\\\" style=\\\"font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><\\/div><ul class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;padding-left:1.5rem;list-style-type:disc;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><li><font color=\\\"#ffffff\\\">Best Execution: Trades are often executed at the best possible prices.<\\/font><\\/li><li><font color=\\\"#ffffff\\\">Low Latency: Trade\\u00a0order placement is instant and accurate (there is a high chance of execution at the desired levels). Trades are timed correctly and instantly to avoid significant price changes.<\\/font><\\/li><li><font color=\\\"#ffffff\\\">Reduced transaction costs.<\\/font><\\/li><li><font color=\\\"#ffffff\\\">Simultaneous automated checks on multiple market conditions.<\\/font><\\/li><li><font color=\\\"#ffffff\\\">No Human Error: Reduced risk of manual errors or mistakes when placing trades. Also negates human traders; tendency to be swayed by\\u00a0emotional and psychological factors.<\\/font><\\/li><li><font color=\\\"#ffffff\\\">Backtesting: Algo trading can be\\u00a0using available historical and real-time data<strong style=\\\"font-family:\'Cabin-semi-bold\', \'Cabin-fallback\', sans-serif;\\\">\\u00a0<\\/strong>to see if it is a viable trading strategy.<br \\/><\\/font><\\/li><\\/ul><div class=\\\"comp mntl-sc-block mntl-sc-block-adslot mntl-block\\\" style=\\\"font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><\\/div><h3 class=\\\"comp mntl-sc-block finance-sc-block-subheading mntl-sc-block-subheading\\\" style=\\\"margin-bottom:0.5rem;line-height:1.5;font-family:\'Cabin-semi-bold\', \'Cabin-fallback\', sans-serif;letter-spacing:0.05px;\\\"><span class=\\\"mntl-sc-block-subheading__text\\\"><font color=\\\"#ffffff\\\">Disadvantages<\\/font><\\/span><\\/h3><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">There are also several drawbacks or disadvantages of algorithmic trading to consider:<\\/font><\\/p><div class=\\\"comp mntl-sc-block mntl-sc-block-adslot mntl-block\\\" style=\\\"font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><\\/div><ul class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;padding-left:1.5rem;list-style-type:disc;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><li><font color=\\\"#ffffff\\\">Latency: Algorithmic trading relies on fast execution speeds and low latency, which is the delay in the execution of a trade. If a trade is not executed quickly enough, it may result in missed opportunities or losses.<\\/font><\\/li><li><font color=\\\"#ffffff\\\">Black Swan Events: Algorithmic trading relies on historical data and mathematical models to predict future market movements. However, unforeseen market disruptions, known as black swan events, can occur, which can result in losses for algorithmic traders.<\\/font><\\/li><li><font color=\\\"#ffffff\\\">Dependence on Technology: Algorithmic trading relies on technology, including computer programs and high-speed internet connections. If there are technical issues or failures, it can disrupt the trading process and result in losses.<\\/font><\\/li><li><font color=\\\"#ffffff\\\">Market Impact: Large algorithmic trades can have a significant impact on market prices, which can result in losses for traders who are not able to adjust their trades in response to these changes. Algo trading has also been suspected of increasing market volatility at times, even leading to so-called\\u00a0<\\/font><\\/li><\\/ul><font color=\\\"#ffffff\\\"><span class=\\\"mntl-sc-block-adslot mntl-sc-block-adslot-inline\\\"><\\/span>Regulation: Algorithmic trading is subject to various regulatory requirements and oversight, which can be complex and time-consuming to comply with.High Capital Costs: The development and implementation of algorithmic trading systems can be costly, and traders may need to pay ongoing fees for software and data feeds.Limited Customization: Algorithmic trading systems are based on pre-defined rules and instructions, which can limit the ability of traders to customize their trades to meet their specific needs or preferences.Lack of Human Judgment: Algorithmic trading relies on mathematical models and historical data, which means that it does not take into account the subjective and qualitative factors that can influence market movements. This lack of human judgment can be a disadvantage for traders who prefer a more intuitive or instinctive approach to trading.<\\/font>\",\"image\":\"63f34273c29a21676886643.jpg\"}', '2023-02-20 09:50:43', '2023-02-20 10:22:57'),
(104, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Introduction to Cryptocurrency Trading\",\"description\":\"<p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">Cryptocurrency trading is the act of speculating on cryptocurrency price movements via a CFD trading account, or buying and selling the underlying coins via an exchange.<\\/font><\\/p><h3 class=\\\"heading\\\" style=\\\"font-size:22px;line-height:30px;margin-bottom:5px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">CFD trading on cryptocurrencies<\\/font><\\/h3><p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">CFDs trading are derivatives, which enables you to speculate on cryptocurrency price movements without taking ownership of the underlying coins. You can go long (\\u2018buy\\u2019) if you think a cryptocurrency will rise in value, or short (\\u2018sell\\u2019) if you think it will fall.<\\/font><\\/p><p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">Both are leveraged products, meaning you only need to put up a small deposit \\u2013 known as margin \\u2013 to gain full exposure to the underlying market. Your profit or loss is still calculated according to the full size of your position, so leverage will magnify both profits and losses.<\\/font><\\/p><h3 class=\\\"heading\\\" style=\\\"font-size:22px;line-height:30px;margin-bottom:5px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><span lang=\\\"en-us\\\" xml:lang=\\\"en-us\\\"><font color=\\\"#ffffff\\\">Buying and selling cryptocurrencies via an exchange<\\/font><\\/span><\\/h3><p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">When you buy cryptocurrencies via an exchange, you purchase the coins themselves. You\\u2019ll need to create an exchange account, put up the full value of the asset to open a position and store the cryptocurrency tokens in your own wallet until you\\u2019re ready to sell.<\\/font><\\/p><p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">Exchanges bring their own steep learning curve as you\\u2019ll need to get to grips with the technology involved and learn how to make sense of the data. Many exchanges also have limits on how much you can deposit, while accounts can be very expensive to maintain.<\\/font><\\/p>\",\"image\":\"63f342fde09701676886781.jpg\"}', '2023-02-20 09:53:01', '2023-02-20 10:23:39'),
(105, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Trading for Beginners\",\"description\":\"<font color=\\\"#ffffff\\\"><span style=\\\"font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;font-size:20px;\\\"><font color=\\\"#ffffff\\\">Trading for beginners can be exciting \\u2013 and overwhelming. That\\u2019s why we\\u2019ve outlined everything you need to know for your trading journey, including how to trade stocks and forex trading for beginners.<\\/font><\\/span><br \\/><\\/font><div><span style=\\\"font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;font-size:20px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/span><\\/div><div><p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">When you trade, you\\u2019ll use a platform like ours to access these markets and take a position on whether you think a market\\u2019s price will rise or fall. If your prediction is correct, you\\u2019ll make a profit. If incorrect, you\\u2019ll incur a loss.<\\/font><\\/p><p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">The financial instruments you\\u2019ll use to trade on an asset\\u2019s price movements are known as \\u2018derivatives\\u2019. This simply means that the instrument\\u2019s price is \\u2018derived\\u2019 from the price of the underlying, like a company share or an ounce of gold. As the price of the underlying asset changes, so does the value of the derivative.<\\/font><\\/p><p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">To understand this, let\\u2019s look at an example of speculating on shares. If the price of a share goes up from $100 to $105, the value of the derivative will increase by the same amount. If you bought the derivative at $100, you could now sell it at $105. Although you never own the share itself, your profit or loss will mirror its price movements.<\\/font><\\/p><h4 class=\\\"heading\\\" style=\\\"font-size:20px;line-height:34px;margin-bottom:5px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">So, why use a derivative?<\\/font><\\/h4><p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">With derivatives trading, you can go long or short \\u2013 meaning you can make a profit if that market\\u2019s price rises or falls, as long as you predict it correctly. Contrarily, if the market moved against your speculation, you\\u2019d incur a loss. This is because trading isn\\u2019t owning the actual financial asset. With owning something outright, such as gold for example, you\\u2019ll only make a profit if the gold price climbs.<\\/font><\\/p><p style=\\\"color:rgb(30,26,26);font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><br \\/><\\/p><\\/div>\",\"image\":\"63f345cd2c7101676887501.jpg\"}', '2023-02-20 10:05:01', '2023-02-20 10:14:37');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `code` int(10) DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supported_currencies` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crypto` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `form_id`, `code`, `name`, `alias`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES
(1, 0, 101, 'Paypal', 'Paypal', 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"sb-owud61543012@business.example.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:04:38'),
(2, 0, 102, 'Perfect Money', 'PerfectMoney', 1, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"hR26aw02Q1eEeUPSIfuwNypXX\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:35:33'),
(3, 0, 103, 'Stripe Hosted', 'Stripe', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:48:36'),
(4, 0, 104, 'Skrill', 'Skrill', 1, '{\"pay_to_email\":{\"title\":\"Skrill Email\",\"global\":true,\"value\":\"merchant@skrill.com\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"---\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:30:16'),
(5, 0, 105, 'PayTM', 'Paytm', 1, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"DIY12386817555501617\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"bKMfNxPPf_QdZppa\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"DIYtestingweb\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 03:00:44'),
(6, 0, 106, 'Payeer', 'Payeer', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"866989763\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"7575\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}', 0, '{\"status\":{\"title\": \"Status URL\",\"value\":\"ipn.Payeer\"}}', NULL, '2019-09-14 13:14:22', '2022-08-28 10:11:14'),
(7, 0, 107, 'PayStack', 'Paystack', 1, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"pk_test_cd330608eb47970889bca397ced55c1dd5ad3783\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"sk_test_8a0b1f199362d7acc9c390bff72c4e81f74e2ac3\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n', NULL, '2019-09-14 13:14:22', '2021-05-21 01:49:51'),
(8, 0, 108, 'VoguePay', 'Voguepay', 1, '{\"merchant_id\":{\"title\":\"MERCHANT ID\",\"global\":true,\"value\":\"demo\"}}', '{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:22:38'),
(9, 0, 109, 'Flutterwave', 'Flutterwave', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-06-05 11:37:45'),
(10, 0, 110, 'RazorPay', 'Razorpay', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"rzp_test_kiOtejPbRZU90E\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"osRDebzEqbsE1kbyQJ4y0re7\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:51:32'),
(11, 0, 111, 'Stripe Storefront', 'StripeJs', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:53:10'),
(12, 0, 112, 'Instamojo', 'Instamojo', 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_2241633c3bc44a3de84a3b33969\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"test_279f083f7bebefd35217feef22d\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"19d38908eeff4f58b2ddda2c6d86ca25\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:56:20'),
(13, 0, 501, 'Blockchain', 'Blockchain', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"55529946-05ca-48ff-8710-f279d86b1cc5\"},\"xpub_code\":{\"title\":\"XPUB CODE\",\"global\":true,\"value\":\"xpub6CKQ3xxWyBoFAF83izZCSFUorptEU9AF8TezhtWeMU5oefjX3sFSBw62Lr9iHXPkXmDQJJiHZeTRtD9Vzt8grAYRhvbz4nEvBu3QKELVzFK\"}}', '{\"BTC\":\"BTC\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2022-03-21 07:41:56'),
(15, 0, 503, 'CoinPayments', 'Coinpayments', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"---------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"93a1e014c4ad60a7980b4a7239673cb4\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"USDT.BEP20\":\"Tether USD (BSC Chain)\",\"USDT.ERC20\":\"Tether USD (ERC20)\",\"USDT.TRC20\":\"Tether USD (Tron/TRC20)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:14'),
(16, 0, 504, 'CoinPayments Fiat', 'CoinpaymentsFiat', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"6515561\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:44'),
(17, 0, 505, 'Coingate', 'Coingate', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"6354mwVCEw5kHzRJ6thbGo-N\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-03-30 09:24:57'),
(18, 0, 506, 'Coinbase Commerce', 'CoinbaseCommerce', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"c47cd7df-d8e8-424b-a20a\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"55871878-2c32-4f64-ab66\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}', NULL, '2019-09-14 13:14:22', '2021-05-21 02:02:47'),
(24, 0, 113, 'Paypal Express', 'PaypalSdk', 1, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"Ae0-tixtSV7DvLwIh3Bmu7JvHrjh5EfGdXr_cEklKAVjjezRZ747BxKILiBdzlKKyp-W8W_T7CKH1Ken\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"EOhbvHZgFNO21soQJT1L9Q00M3rK6PIEsdiTgXRBt2gtGtxwRer5JvKnVUGNU5oE63fFnjnYY7hq3HBA\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-20 23:01:08'),
(25, 0, 114, 'Stripe Checkout', 'StripeV3', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"whsec_lUmit1gtxwKTveLnSe88xCSDdnPOt8g5\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}', NULL, '2019-09-14 13:14:22', '2021-05-21 00:58:38'),
(27, 0, 115, 'Mollie', 'Mollie', 1, '{\"mollie_email\":{\"title\":\"Mollie Email \",\"global\":true,\"value\":\"vi@gmail.com\"},\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_cucfwKTWfft9s337qsVfn5CC4vNkrn\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:44:45'),
(30, 0, 116, 'Cashmaal', 'Cashmaal', 1, '{\"web_id\":{\"title\":\"Web Id\",\"global\":true,\"value\":\"3748\"},\"ipn_key\":{\"title\":\"IPN Key\",\"global\":true,\"value\":\"546254628759524554647987\"}}', '{\"PKR\":\"PKR\",\"USD\":\"USD\"}', 0, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.Cashmaal\"}}', NULL, NULL, '2021-06-22 08:05:04'),
(36, 0, 119, 'Mercado Pago', 'MercadoPago', 1, '{\"access_token\":{\"title\":\"Access Token\",\"global\":true,\"value\":\"APP_USR-7924565816849832-082312-21941521997fab717db925cf1ea2c190-1071840315\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2022-09-14 07:41:14'),
(37, 0, 120, 'Authorize.net', 'Authorize', 1, '{\"login_id\":{\"title\":\"Login ID\",\"global\":true,\"value\":\"59e4P9DBcZv\"},\"transaction_key\":{\"title\":\"Transaction Key\",\"global\":true,\"value\":\"47x47TJyLw2E7DbR\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2022-08-28 09:33:06'),
(46, 0, 121, 'NMI', 'NMI', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"2F822Rw39fx762MaV7Yy86jXGTC7sCDy\"}}', '{\"AED\":\"AED\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"RUB\":\"RUB\",\"SEC\":\"SEC\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2023-02-20 07:04:57'),
(55, 0, 122, 'BTCPay', 'BTCPay', 1, '{\"store_id\":{\"title\":\"Store Id\",\"global\":true,\"value\":\"-------\"},\"api_key\":{\"title\":\"Api Key\",\"global\":true,\"value\":\"------\"},\"server_name\":{\"title\":\"Server Name\",\"global\":true,\"value\":\"https:\\/\\/yourbtcpaserver.lndyn.com\"},\"secret_code\":{\"title\":\"Secret Code\",\"global\":true,\"value\":\"----------\"}}', '{\"BTC\":\"Bitcoin\",\"LTC\":\"Litecoin\"}', 1, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.BTCPay\"}}', NULL, NULL, NULL),
(56, 0, 123, 'Now payments hosted', 'NowPaymentsHosted', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"-------------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"--------------\"}}', '{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDT\":\"USDT\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}', 1, '', NULL, NULL, '2023-02-14 04:42:09'),
(57, 0, 509, 'Now payments checkout', 'NowPaymentsCheckout', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"-------------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"--------------\"}}', '{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDT\":\"USDT\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}', 1, '', NULL, NULL, '2023-02-14 04:42:09');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_code` int(10) DEFAULT NULL,
  `gateway_alias` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `max_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_parameter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_text` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'email configuration',
  `sms_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `global_shortcodes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0,
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'mobile verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms notification, 0 - dont send, 1 - send',
  `force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT 0,
  `secure_password` tinyint(1) NOT NULL DEFAULT 0,
  `agree` tinyint(1) NOT NULL DEFAULT 0,
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multi_language` tinyint(1) NOT NULL DEFAULT 1,
  `practice_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trade_profit` decimal(5,2) NOT NULL DEFAULT 0.00,
  `coinmarketcap_api_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_cron_run` timestamp NULL DEFAULT NULL,
  `referral_bonus` decimal(5,2) NOT NULL DEFAULT 0.00,
  `cron_error_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `cur_text`, `cur_sym`, `email_from`, `email_template`, `sms_body`, `sms_from`, `base_color`, `mail_config`, `sms_config`, `global_shortcodes`, `kv`, `ev`, `en`, `sv`, `sn`, `force_ssl`, `maintenance_mode`, `secure_password`, `agree`, `registration`, `active_template`, `system_info`, `multi_language`, `practice_balance`, `trade_profit`, `coinmarketcap_api_key`, `last_cron_run`, `referral_bonus`, `cron_error_message`, `created_at`, `updated_at`) VALUES
(1, 'TradeLab', 'USD', '$', 'info@viserlab.com', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello {{fullname}} ({{username}})</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">{{message}}</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">{{site_name}}</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'hi {{fullname}} ({{username}}), {{message}}', 'ViserAdmin', '2E86DE', '{\"name\":\"php\"}', '{\"name\":\"nexmo\",\"clickatell\":{\"api_key\":\"----------------\"},\"infobip\":{\"username\":\"------------8888888\",\"password\":\"-----------------\"},\"message_bird\":{\"api_key\":\"-------------------\"},\"nexmo\":{\"api_key\":\"----------------------\",\"api_secret\":\"----------------------\"},\"sms_broadcast\":{\"username\":\"----------------------\",\"password\":\"-----------------------------\"},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\"},\"text_magic\":{\"username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\"},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\"],\"value\":[\"test_api 555\"]},\"body\":{\"name\":[\"from_number\"],\"value\":[\"5657545757\"]}}}', '{\n    \"site_name\":\"Name of your site\",\n    \"site_currency\":\"Currency of your site\",\n    \"currency_symbol\":\"Symbol of currency\"\n}', 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 'basic', '[]', 0, '10.00000000', '10.00', NULL, '2023-02-20 11:02:46', '2.00', NULL, NULL, '2023-02-22 03:27:44');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 1, '2020-07-06 03:47:55', '2022-04-09 03:47:04'),
(5, 'Hindi', 'hn', 0, '2020-12-29 02:20:07', '2022-04-09 03:47:04'),
(9, 'Bangla', 'bn', 0, '2021-03-14 04:37:41', '2022-03-30 12:31:55');

-- --------------------------------------------------------

--
-- Table structure for table `notification_logs`
--

CREATE TABLE `notification_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sender` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_to` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subj` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcodes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_status` tinyint(1) NOT NULL DEFAULT 1,
  `sms_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'BAL_ADD', 'Balance - Added', 'Your Account has been Credited', '<div><div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">{{remark}}</span></div>', '{{amount}} {{site_currency}} credited in your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin note is \"{{remark}}\"', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 0, '2021-11-03 12:00:00', '2022-04-03 02:18:28'),
(2, 'BAL_SUB', 'Balance - Subtracted', 'Your Account has been Debited', '<div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been subtracted from your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}</span></font><br><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin Note: {{remark}}</div>', '{{amount}} {{site_currency}} debited from your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin Note is {{remark}}', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:24:11'),
(3, 'DEPOSIT_COMPLETE', 'Deposit - Automated - Successful', 'Deposit Completed Successfully', '<div>Your deposit of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been completed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#000000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Received : {{method_amount}} {{method_currency}}<br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit successfully by {{method_name}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:25:43'),
(4, 'DEPOSIT_APPROVE', 'Deposit - Manual - Approved', 'Your Deposit is Approved', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>is Approved .<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Admin Approve Your {{amount}} {{site_currency}} payment request by {{method_name}} transaction : {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:26:07'),
(5, 'DEPOSIT_REJECT', 'Deposit - Manual - Rejected', 'Your Deposit Request is Rejected', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}} has been rejected</span>.<span style=\"font-weight: bolder;\"><br></span></div><div><br></div><div><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge: {{charge}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number was : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">if you have any queries, feel free to contact us.<br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><br><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">{{rejection_message}}</span><br>', 'Admin Rejected Your {{amount}} {{site_currency}} payment request by {{method_name}}\r\n\r\n{{rejection_message}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"rejection_message\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:45:27'),
(6, 'DEPOSIT_REQUEST', 'Deposit - Manual - Requested', 'Deposit Request Submitted Successfully', '<div>Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>submitted successfully<span style=\"font-weight: bolder;\">&nbsp;.<br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}}<br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit requested by {{method_name}}. Charge: {{charge}} . Trx: {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:29:19'),
(7, 'PASS_RESET_CODE', 'Password - Reset - Code', 'Password Reset', '<div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">{{time}} .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">{{code}}</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div>', 'Your account recovery code is: {{code}}', '{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 0, '2021-11-03 12:00:00', '2022-03-20 20:47:05'),
(8, 'PASS_RESET_DONE', 'Password - Reset - Confirmation', 'You have reset your password', '<p style=\"font-family: Montserrat, sans-serif;\">You have successfully reset your password.</p><p style=\"font-family: Montserrat, sans-serif;\">You changed from&nbsp; IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{time}}</span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><font color=\"#ff0000\">If you did not change that, please contact us as soon as possible.</font></span></p>', 'Your password has been changed successfully', '{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:46:35'),
(9, 'ADMIN_SUPPORT_REPLY', 'Support - Reply', 'Reply Support Ticket', '<div><p><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\">A member from our support team has replied to the following ticket:</span></span></p><p><span style=\"font-weight: bolder;\"><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\"><br></span></span></span></p><p><span style=\"font-weight: bolder;\">[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</span></p><p>----------------------------------------------</p><p>Here is the reply :<br></p><p>{{reply}}<br></p></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', 'Your Ticket#{{ticket_id}} :  {{ticket_subject}} has been replied.', '{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:47:51'),
(10, 'EVER_CODE', 'Verification - Email', 'Please verify your email address', '<br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;{{code}}</span></font></div></div>', '---', '{\"code\":\"Email verification code\"}', 1, 0, '2021-11-03 12:00:00', '2022-04-03 02:32:07'),
(11, 'SVER_CODE', 'Verification - SMS', 'Verify Your Mobile Number', '---', 'Your phone verification code is: {{code}}', '{\"code\":\"SMS Verification Code\"}', 0, 1, '2021-11-03 12:00:00', '2022-03-20 19:24:37'),
(12, 'WITHDRAW_APPROVE', 'Withdraw - Approved', 'Withdraw Request has been Processed and your money is sent', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Processed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Processed Payment :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div>', 'Admin Approve Your {{amount}} {{site_currency}} withdraw request by {{method_name}}. Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"admin_details\":\"Details provided by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:50:16'),
(13, 'WITHDRAW_REJECT', 'Withdraw - Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Rejected.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You should get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">----</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\"><br></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\">{{amount}} {{currency}} has been&nbsp;<span style=\"font-weight: bolder;\">refunded&nbsp;</span>to your account and your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}}</span><span style=\"font-weight: bolder;\">&nbsp;{{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Rejection :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br><br><br></div><div></div><div></div>', 'Admin Rejected Your {{amount}} {{site_currency}} withdraw request. Your Main Balance {{post_balance}}  {{method_name}} , Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this action\",\"admin_details\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:57:46'),
(14, 'WITHDRAW_REQUEST', 'Withdraw - Requested', 'Withdraw Request Submitted Successfully', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been submitted Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>', '{{amount}} {{site_currency}} withdraw requested by {{method_name}}. You will get {{method_amount}} {{method_currency}} Trx: {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-21 04:39:03'),
(15, 'DEFAULT', 'Default Template', '{{subject}}', '{{message}}', '{{message}}', '{\"subject\":\"Subject\",\"message\":\"Message\"}', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(16, 'KYC_APPROVE', 'KYC Approved', 'Your KYC verification is approved!', '<div><br></div><div><span style=\"color: var(--bs-body-color); font-size: 1rem; text-align: var(--bs-body-text-align);\">We are pleased to inform you that your Know Your Customer (KYC) verification has been approved! Thank you for providing all the necessary documents and information for the verification process.</span><br></div><div><br></div><div>This means that you are now fully verified to use our platform and take advantage of all its features. You can now start trading with confidence, knowing that your account is fully compliant with our regulatory requirements.</div><div><br></div><div>If you have any questions or concerns, please don\'t hesitate to contact our customer support team. We are always here to help you.</div><div><br></div><div>Thank you for choosing our platform for your trading needs. We look forward to serving you.</div><div><br></div>', 'We are pleased to inform you that your Know Your Customer (KYC) verification has been approved! Thank you for providing all the necessary documents and information for the verification process.', '[]', 1, 1, NULL, '2023-02-20 09:23:54'),
(17, 'KYC_REJECT', 'KYC Rejected Successfully', 'Your KYC verification has been rejected', '<div>We regret to inform you that your Know Your Customer (KYC) verification has been rejected. We appreciate your effort to provide us with the necessary documents and information for the verification process, but unfortunately, we were unable to approve your application.</div><div><br></div><div>We understand that this may be disappointing news, but we encourage you to reapply for KYC verification by submitting all the required documents and information accurately and completely. Our team will review your application again as soon as possible.</div><div><br></div><div>If you have any questions or need further assistance, please don\'t hesitate to contact our customer support team. We are always ready to help you.</div><div><br></div><div>Thank you for your understanding and cooperation.</div><div><br></div>', 'We regret to inform you that your Know Your Customer (KYC) verification has been rejected. We appreciate your effort to provide us with the necessary documents and information for the verification process, but unfortunately, we were unable to approve your application.', '[]', 1, 1, NULL, '2023-02-20 09:23:42'),
(18, 'COMMISSION_BONUS', 'Withdraw - Requested', 'Referral commission', '<div style=\"\"><span style=\"font-size: 1rem; text-align: var(--bs-body-text-align);\"><font color=\"#212529\">Congratulations, You get&nbsp;</font></span><span style=\"color: rgb(33, 37, 41); font-size: 1rem; text-align: var(--bs-body-text-align);\">{{amount}}&nbsp;</span><span style=\"font-size: 1rem; text-align: var(--bs-body-text-align);\"><font color=\"#212529\">{{site_currency}}</font></span><span style=\"color: rgb(33, 37, 41); font-size: 1rem; text-align: var(--bs-body-text-align);\">&nbsp;referral bonus from user {{full_name}}. Your current balance is&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: 1rem; text-align: var(--bs-body-text-align);\">{{main_balance}}&nbsp;</span><span style=\"font-size: 1rem; text-align: var(--bs-body-text-align);\"><font color=\"#212529\">{{site_currency}}.</font></span><br></div>', 'Congratulations, You get {{amount}} {{site_currency}} referral bonus from user {{full_name}}. Your current balance is {{main_balance}} {{site_currency}}.', '{\"amount\":\"amount\",\"main_balance\":\"Main Balance\",\"trx\":\"Transaction\",\"full_name\":\"From user full name\"}', 1, 1, '2021-11-03 12:00:00', '2023-01-10 13:48:53');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'template name',
  `secs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', '/', 'templates.basic.', '[\"crypto_price\",\"predict\",\"trade\",\"feature\",\"app\",\"blog\",\"faq\"]', 1, '2020-07-11 06:23:58', '2023-01-03 07:00:04'),
(4, 'Blog', 'blog', 'templates.basic.', NULL, 1, '2020-10-22 01:14:43', '2020-10-22 01:14:43'),
(5, 'Contact', 'contact', 'templates.basic.', NULL, 1, '2020-10-22 01:14:53', '2020-10-22 01:14:53'),
(20, 'About', 'about', 'templates.basic.', '[\"predict\",\"feature\",\"app\",\"blog\"]', 0, '2023-01-03 07:10:32', '2023-01-03 07:11:40'),
(21, 'Services', 'services', 'templates.basic.', '[\"feature\",\"predict\"]', 0, '2023-01-03 07:10:40', '2023-01-03 07:12:31'),
(22, 'FAQ', 'faq', 'templates.basic.', '[\"faq\"]', 0, '2023-01-03 07:10:49', '2023-01-03 07:12:50');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('ronnie@gmail.com', '100375', '2020-07-07 05:44:47'),
('user@site.comfff', '988862', '2021-05-07 07:31:28'),
('mosta@gmail.com', '865544', '2021-06-10 09:21:05'),
('user@site.com', '835015', '2023-01-11 10:59:21'),
('raihan@gmail.com', '278123', '2023-02-20 12:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `practice_logs`
--

CREATE TABLE `practice_logs` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `crypto_currency_id` int(10) NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `price_was` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `in_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `high_low` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'High : 1 Low : 2',
  `result` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'win : 1 lose : 2 Draw : 3',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Running : 0 Complete : 1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `practice_logs`
--

INSERT INTO `practice_logs` (`id`, `user_id`, `crypto_currency_id`, `amount`, `price_was`, `in_time`, `profit`, `high_low`, `rig`, `result`, `status`, `created_at`, `updated_at`) VALUES
(1, 7, 1, '100.00000000', '28155.73000000', '2023-04-03 17:18:13', 10, 1, 0, 2, 1, '2023-04-03 17:08:13', '2023-04-22 11:28:19'),
(2, 7, 1, '20.00000000', '28148.37000000', '2023-04-03 17:19:14', 10, 2, 0, 1, 1, '2023-04-03 17:19:10', '2023-04-03 17:19:16'),
(3, 7, 1, '50.00000000', '28145.35000000', '2023-04-03 17:21:16', 10, 1, 0, 2, 1, '2023-04-03 17:21:11', '2023-04-03 17:21:18'),
(4, 7, 1, '25.00000000', '28139.20000000', '2023-04-03 17:21:39', 10, 2, 0, 1, 1, '2023-04-03 17:21:35', '2023-04-03 17:21:41'),
(5, 7, 1, '234.00000000', '28141.54000000', '2023-04-04 18:27:11', 10, 1, 0, 1, 1, '2023-04-04 18:26:12', '2023-04-04 18:27:13'),
(6, 7, 1, '157.00000000', '28367.77000000', '2023-04-10 05:12:38', 10, 1, 0, 1, 1, '2023-04-10 05:11:38', '2023-04-10 05:12:39'),
(7, 17, 1, '30.00000000', '29289.48000000', '2023-04-19 10:22:09', 10, 1, 0, 2, 1, '2023-04-19 10:21:11', '2023-04-19 10:22:13'),
(8, 17, 1, '30.00000000', '29272.61000000', '2023-04-19 10:23:54', 10, 1, 0, 1, 1, '2023-04-19 10:22:55', '2023-04-19 10:23:58'),
(9, 17, 1, '25.00000000', '29244.16000000', '2023-04-19 12:13:44', 10, 2, 0, 2, 1, '2023-04-19 12:11:51', '2023-04-19 12:11:51'),
(10, 17, 1, '25.00000000', '29245.87000000', '2023-04-19 12:14:08', 10, 2, 0, 2, 1, '2023-04-19 12:13:19', '2023-04-19 12:13:19'),
(11, 17, 1, '100.00000000', '29291.28000000', '2023-04-19 18:01:44', 10, 1, 0, 2, 1, '2023-04-19 18:00:46', '2023-04-19 18:00:46'),
(12, 17, 1, '100.00000000', '29279.92000000', '2023-04-19 18:02:31', 10, 1, 0, 2, 1, '2023-04-19 18:01:32', '2023-04-19 18:04:34'),
(13, 17, 8, '100.00000000', '0.08909000', '2023-04-19 18:37:37', 10, 1, 0, 2, 1, '2023-04-19 18:36:41', '2023-04-19 18:37:43'),
(14, 17, 8, '100.00000000', '0.08902000', '2023-04-19 18:39:04', 10, 1, 0, 1, 1, '2023-04-19 18:38:05', '2023-04-19 18:39:07'),
(15, 17, 1, '100.00000000', '28963.65000000', '2023-04-20 17:47:33', 10, 1, 0, 1, 1, '2023-04-20 05:47:35', '2023-04-28 06:28:43'),
(16, 17, 1, '100.00000000', '27931.26000000', '2023-04-21 17:13:05', 10, 1, 0, 1, 1, '2023-04-21 17:12:06', '2023-04-21 17:30:53'),
(17, 20, 3, '50.00000000', '1.00000000', '2023-04-22 14:15:18', 10, 1, 0, 3, 1, '2023-04-22 14:14:19', '2023-04-22 14:16:21'),
(18, 20, 3, '50.00000000', '1.00000000', '2023-04-22 14:18:17', 10, 2, 0, 3, 1, '2023-04-22 14:17:18', '2023-04-24 05:37:07'),
(19, 20, 3, '50.00000000', '1.00000000', '2023-04-22 14:18:29', 10, 2, 0, 3, 1, '2023-04-22 14:17:30', '2023-04-24 05:37:20'),
(20, 20, 3, '50.00000000', '1.00000000', '2023-04-22 14:18:50', 10, 2, 0, 3, 1, '2023-04-22 14:17:50', '2023-04-24 05:37:26'),
(21, 20, 3, '50.00000000', '1.00000000', '2023-04-22 14:19:06', 10, 1, 0, 3, 1, '2023-04-22 14:18:07', '2023-04-24 05:37:31'),
(22, 20, 3, '50.00000000', '1.00000000', '2023-04-22 14:19:14', 10, 2, 0, 3, 1, '2023-04-22 14:18:15', '2023-04-24 05:37:33'),
(23, 17, 2, '100.00000000', '1855.46000000', '2023-04-23 17:08:56', 10, 1, 0, 1, 1, '2023-04-23 17:08:04', '2023-04-23 17:13:25'),
(24, 17, 1, '25.00000000', '27674.39000000', '2023-04-24 05:34:07', 10, 1, 0, 1, 1, '2023-04-24 05:33:22', '2023-04-24 05:35:59'),
(25, 17, 1, '25.00000000', '27675.64000000', '2023-04-24 05:39:25', 10, 1, 2, 1, 1, '2023-04-24 05:38:38', '2023-04-24 06:01:53'),
(26, 17, 1, '30.00000000', '27600.52000000', '2023-04-24 05:44:20', 10, 1, 3, 0, 1, '2023-04-24 05:43:24', '2023-04-24 06:01:44'),
(27, 17, 1, '100.00000000', '27486.16000000', '2023-04-24 06:08:22', 10, 1, 2, 3, 1, '2023-04-24 06:06:35', '2023-04-24 06:09:57'),
(28, 17, 2, '100.00000000', '1840.18000000', '2023-04-24 06:13:39', 10, 1, 2, 1, 1, '2023-04-24 06:11:41', '2023-04-24 06:15:57'),
(29, 17, 1, '100.00000000', '29496.24000000', '2023-04-28 06:24:32', 50, 1, 0, 1, 1, '2023-04-28 06:24:23', '2023-04-28 06:25:07'),
(30, 17, 1, '100.00000000', '29475.93000000', '2023-04-28 06:27:04', 50, 1, 0, 2, 1, '2023-04-28 06:26:55', '2023-04-28 06:27:06'),
(31, 17, 1, '100.00000000', '29479.73000000', '2023-04-28 06:27:32', 50, 2, 0, 1, 1, '2023-04-28 06:27:23', '2023-04-28 06:28:50'),
(32, 17, 1, '100.00000000', '29480.58000000', '2023-04-28 06:28:09', 50, 1, 0, 1, 1, '2023-04-28 06:28:00', '2023-04-28 06:28:15');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_message_id` int(10) UNSIGNED DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) DEFAULT 0,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trade_logs`
--

CREATE TABLE `trade_logs` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `crypto_currency_id` int(10) DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `price_was` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `in_time` timestamp NULL DEFAULT current_timestamp(),
  `profit` int(11) NOT NULL DEFAULT 10,
  `high_low` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'High : 1 Low : 2',
  `rig` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'No rig: 0\r\nRig win: 1\r\nRig draw: 2\r\nRig lose: 3',
  `result` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'win : 1 lose : 2 Draw : 3',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Running : 0 Complete : 1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trade_logs`
--

INSERT INTO `trade_logs` (`id`, `user_id`, `crypto_currency_id`, `amount`, `price_was`, `in_time`, `profit`, `high_low`, `rig`, `result`, `status`, `created_at`, `updated_at`) VALUES
(1, 7, 1, 6.00000000, 27993.87000000, '2023-04-04 12:24:08', 10, 1, 0, 1, 1, '2023-04-04 12:23:09', '2023-04-04 12:24:10'),
(2, 7, 1, 21.00000000, 28509.59000000, '2023-04-05 14:46:06', 10, 1, 0, 1, 1, '2023-04-05 14:45:07', '2023-04-05 14:46:09'),
(3, 7, 1, 12.00000000, 28218.78000000, '2023-04-06 00:40:28', 10, 2, 0, 2, 1, '2023-04-06 00:39:29', '2023-04-06 00:40:30'),
(4, 7, 1, 15.00000000, 28232.73000000, '2023-04-06 00:42:06', 10, 1, 0, 2, 1, '2023-04-06 00:41:07', '2023-04-06 00:42:12'),
(5, 7, 5, 5.00000000, 0.99980000, '2023-04-06 00:44:09', 10, 1, 0, 3, 1, '2023-04-06 00:43:09', '2023-04-06 00:44:11'),
(6, 7, 1, 50.00000000, 28180.08000000, '2023-04-06 01:06:11', 10, 1, 0, 1, 1, '2023-04-06 01:05:12', '2023-04-06 01:06:13'),
(7, 7, 1, 30.00000000, 28162.43000000, '2023-04-06 01:10:27', 10, 1, 0, 2, 1, '2023-04-06 01:09:28', '2023-04-06 01:10:29'),
(8, 7, 1, 100.00000000, 28155.23000000, '2023-04-06 01:11:48', 10, 2, 0, 2, 1, '2023-04-06 01:10:49', '2023-04-06 01:11:50'),
(9, 7, 1, 100.00000000, 28165.33000000, '2023-04-06 01:13:08', 10, 1, 0, 1, 1, '2023-04-06 01:12:09', '2023-04-06 01:13:10'),
(10, 7, 1, 100.00000000, 28196.95000000, '2023-04-06 01:15:13', 10, 1, 0, 1, 1, '2023-04-06 01:14:13', '2023-04-06 01:15:14'),
(11, 7, 1, 200.00000000, 28216.95000000, '2023-04-06 01:19:03', 10, 1, 0, 2, 1, '2023-04-06 01:18:04', '2023-04-06 01:19:05'),
(12, 7, 1, 20.00000000, 28216.69000000, '2023-04-06 01:21:56', 10, 1, 0, 1, 1, '2023-04-06 01:20:56', '2023-04-06 01:21:57'),
(13, 7, 1, 23.00000000, 28217.41000000, '2023-04-06 01:23:20', 10, 1, 0, 2, 1, '2023-04-06 01:22:21', '2023-04-06 01:23:22'),
(14, 7, 1, 27.00000000, 28215.00000000, '2023-04-06 01:24:39', 10, 1, 0, 2, 1, '2023-04-06 01:23:39', '2023-04-06 01:24:40'),
(15, 7, 1, 22.00000000, 28218.84000000, '2023-04-06 01:25:58', 10, 2, 0, 2, 1, '2023-04-06 01:24:59', '2023-04-06 01:26:00'),
(16, 7, 1, 19.00000000, 28216.39000000, '2023-04-06 01:27:32', 10, 1, 0, 2, 1, '2023-04-06 01:26:33', '2023-04-06 01:27:34'),
(17, 7, 1, 261.00000000, 28197.90000000, '2023-04-06 01:30:01', 10, 1, 0, 2, 1, '2023-04-06 01:28:02', '2023-04-06 01:30:03'),
(18, 7, 1, 20.00000000, 27980.50000000, '2023-04-06 16:28:05', 10, 1, 0, 1, 1, '2023-04-06 16:27:06', '2023-04-06 16:28:07'),
(19, 7, 1, 22.00000000, 28023.42000000, '2023-04-06 16:30:07', 10, 1, 0, 1, 1, '2023-04-06 16:29:08', '2023-04-06 16:30:09'),
(20, 7, 1, 100.00000000, 27980.72000000, '2023-04-06 16:32:17', 10, 1, 0, 1, 1, '2023-04-06 16:31:17', '2023-04-06 16:32:18'),
(21, 7, 2, 55.00000000, 1867.77000000, '2023-04-06 16:34:08', 10, 1, 0, 2, 1, '2023-04-06 16:33:08', '2023-04-06 16:34:09'),
(22, 7, 1, 100.00000000, 27933.96000000, '2023-04-06 16:35:37', 10, 1, 0, 1, 1, '2023-04-06 16:34:37', '2023-04-06 16:35:38'),
(23, 7, 1, 122.00000000, 27941.09000000, '2023-04-06 16:37:26', 10, 1, 0, 2, 1, '2023-04-06 16:36:27', '2023-04-06 16:37:28'),
(24, 7, 1, 23.00000000, 28080.72000000, '2023-04-06 21:38:51', 10, 1, 0, 1, 1, '2023-04-06 21:37:52', '2023-04-06 21:38:53'),
(25, 7, 1, 35.00000000, 28068.84000000, '2023-04-06 21:46:46', 10, 1, 0, 2, 1, '2023-04-06 21:45:47', '2023-04-06 21:46:48'),
(26, 7, 10, 21.00000000, 1.15000000, '2023-04-06 21:50:57', 10, 1, 0, 1, 1, '2023-04-06 21:49:58', '2023-04-06 21:50:58'),
(27, 7, 10, 55.00000000, 1.15200000, '2023-04-06 21:54:27', 10, 1, 0, 2, 1, '2023-04-06 21:53:27', '2023-04-06 21:54:28'),
(28, 10, 4, 1.00000000, 311.64000000, '2023-04-08 08:06:45', 10, 1, 0, 1, 1, '2023-04-08 08:04:46', '2023-04-08 08:10:37'),
(29, 7, 1, 100.00000000, 28000.71000000, '2023-04-08 17:18:05', 10, 1, 0, 1, 1, '2023-04-08 17:17:06', '2023-04-08 17:18:07'),
(30, 7, 1, 100.00000000, 28000.61000000, '2023-04-08 17:21:28', 10, 1, 0, 2, 1, '2023-04-08 17:19:29', '2023-04-08 17:21:30'),
(31, 7, 1, 20.00000000, 27961.65000000, '2023-04-09 00:21:11', 10, 1, 0, 2, 1, '2023-04-09 00:20:12', '2023-04-09 00:21:13'),
(32, 7, 1, 120.00000000, 28145.34000000, '2023-04-10 00:09:28', 10, 1, 0, 2, 1, '2023-04-10 00:08:28', '2023-04-10 00:09:30'),
(33, 7, 1, 125.00000000, 28133.38000000, '2023-04-10 00:13:50', 10, 2, 0, 1, 1, '2023-04-10 00:12:51', '2023-04-10 00:13:52'),
(34, 7, 1, 150.00000000, 28136.05000000, '2023-04-10 00:16:11', 10, 2, 0, 2, 1, '2023-04-10 00:15:12', '2023-04-10 00:16:13'),
(35, 7, 1, 200.00000000, 28145.49000000, '2023-04-10 00:17:36', 10, 1, 0, 1, 1, '2023-04-10 00:16:37', '2023-04-10 00:17:38'),
(36, 7, 1, 112.00000000, 28141.99000000, '2023-04-10 00:20:40', 10, 1, 0, 1, 1, '2023-04-10 00:19:41', '2023-04-10 00:20:42'),
(37, 7, 2, 128.00000000, 1854.71000000, '2023-04-10 00:24:24', 10, 1, 0, 2, 1, '2023-04-10 00:23:24', '2023-04-10 00:24:26'),
(38, 7, 1, 150.00000000, 28134.39000000, '2023-04-10 00:27:06', 10, 2, 0, 1, 1, '2023-04-10 00:26:07', '2023-04-10 00:27:08'),
(39, 7, 1, 127.00000000, 28134.62000000, '2023-04-10 00:31:20', 10, 1, 0, 1, 1, '2023-04-10 00:30:21', '2023-04-10 00:35:18'),
(40, 7, 1, 49.00000000, 28149.16000000, '2023-04-10 00:32:12', 10, 1, 0, 2, 1, '2023-04-10 00:31:13', '2023-04-10 00:35:19'),
(41, 7, 1, 62.00000000, 28153.22000000, '2023-04-10 00:32:57', 10, 2, 0, 1, 1, '2023-04-10 00:31:58', '2023-04-10 00:32:59'),
(42, 7, 1, 145.00000000, 28369.24000000, '2023-04-10 05:09:30', 10, 1, 0, 1, 1, '2023-04-10 05:08:31', '2023-04-10 05:09:32'),
(43, 7, 1, 200.00000000, 29176.31000000, '2023-04-11 00:19:48', 10, 1, 0, 2, 1, '2023-04-11 00:18:49', '2023-04-11 00:19:50'),
(44, 7, 1, 200.00000000, 29175.28000000, '2023-04-11 00:21:18', 10, 2, 0, 1, 1, '2023-04-11 00:20:18', '2023-04-11 00:21:20'),
(45, 10, 1, 1.00000000, 30119.25000000, '2023-04-11 15:40:39', 10, 1, 0, 2, 1, '2023-04-11 15:39:40', '2023-04-11 15:40:44'),
(46, 7, 2, 360.00000000, 1903.22000000, '2023-04-11 21:40:00', 10, 2, 0, 2, 1, '2023-04-11 21:39:00', '2023-04-11 21:40:02'),
(47, 7, 2, 231.00000000, 1903.98000000, '2023-04-11 21:41:24', 10, 2, 0, 2, 1, '2023-04-11 21:40:25', '2023-04-11 21:41:26'),
(48, 7, 2, 235.00000000, 1904.29000000, '2023-04-11 21:41:34', 10, 1, 0, 1, 1, '2023-04-11 21:40:35', '2023-04-11 21:45:27'),
(49, 7, 2, 250.00000000, 1904.31000000, '2023-04-11 21:41:48', 10, 1, 0, 1, 1, '2023-04-11 21:40:49', '2023-04-11 21:45:29'),
(50, 7, 1, 200.00000000, 29921.43000000, '2023-04-12 22:54:03', 10, 1, 0, 1, 1, '2023-04-12 22:53:04', '2023-04-12 22:54:06'),
(51, 7, 1, 200.00000000, 30426.95000000, '2023-04-13 21:22:29', 10, 1, 0, 2, 1, '2023-04-13 21:21:30', '2023-04-13 21:22:31'),
(52, 7, 1, 150.00000000, 30414.75000000, '2023-04-13 21:23:52', 10, 2, 0, 1, 1, '2023-04-13 21:22:53', '2023-04-13 21:23:54'),
(53, 7, 1, 500.00000000, 30455.26000000, '2023-04-19 11:26:34', 10, 1, 0, 2, 1, '2023-04-15 11:26:35', '2023-04-19 11:30:23'),
(54, 7, 1, 50.00000000, 30432.73000000, '2023-04-15 19:29:55', 10, 1, 0, 2, 1, '2023-04-15 19:28:55', '2023-04-15 19:30:16'),
(55, 7, 1, 30.00000000, 30296.84000000, '2023-04-16 14:40:55', 10, 1, 0, 1, 1, '2023-04-16 14:39:56', '2023-04-16 14:45:28'),
(56, 7, 2, 60.00000000, 2087.47000000, '2023-04-16 14:41:40', 10, 2, 0, 2, 1, '2023-04-16 14:40:41', '2023-04-16 14:45:28'),
(57, 7, 1, 230.00000000, 29481.10000000, '2023-04-18 01:46:46', 10, 1, 0, 2, 1, '2023-04-18 01:45:46', '2023-04-18 01:50:19'),
(58, 7, 2, 240.00000000, 2077.17000000, '2023-04-18 01:47:18', 10, 2, 0, 2, 1, '2023-04-18 01:46:19', '2023-04-18 01:50:20'),
(59, 17, 1, 1.00000000, 28901.24000000, '2023-04-20 06:39:43', 10, 1, 0, 2, 1, '2023-04-20 06:38:45', '2023-04-22 11:27:45'),
(60, 17, 1, 25.00000000, 28892.70000000, '2023-04-20 18:46:04', 10, 1, 0, 2, 1, '2023-04-20 06:46:06', '2023-04-22 11:27:47'),
(61, 17, 1, 100.00000000, 27872.89000000, '2023-04-21 17:37:42', 10, 1, 0, 1, 1, '2023-04-21 17:36:43', '2023-04-21 17:39:23'),
(62, 18, 1, 20.00000000, 27322.26000000, '2023-04-22 11:33:07', 10, 1, 0, 1, 1, '2023-04-22 11:32:09', '2023-04-22 12:01:14'),
(63, 18, 2, 50.00000000, 1855.25000000, '2023-04-22 11:36:18', 10, 2, 0, 2, 1, '2023-04-22 11:35:19', '2023-04-22 11:37:18'),
(64, 18, 2, 50.00000000, 1856.77000000, '2023-04-29 11:38:35', 10, 1, 1, 0, 0, '2023-04-22 11:38:36', '2023-04-24 06:33:45'),
(65, 18, 1, 50.00000000, 27305.68000000, '2023-04-22 12:28:03', 10, 2, 0, 1, 1, '2023-04-22 12:27:03', '2023-04-22 12:28:56'),
(66, 18, 1, 10.00000000, 27308.23000000, '2023-04-22 12:31:29', 10, 2, 0, 1, 1, '2023-04-22 12:30:30', '2023-04-22 12:58:24'),
(67, 19, 1, 150.00000000, 27291.46000000, '2023-04-22 12:55:34', 10, 1, 0, 2, 1, '2023-04-22 12:54:35', '2023-04-22 12:58:25'),
(68, 19, 1, 100.00000000, 27276.33000000, '2023-04-22 12:57:11', 10, 2, 0, 1, 1, '2023-04-22 12:56:12', '2023-04-22 12:58:26'),
(69, 19, 1, 120.00000000, 27266.83000000, '2023-04-22 13:03:18', 10, 1, 0, 1, 1, '2023-04-22 13:01:18', '2023-04-24 06:32:45'),
(70, 19, 1, 23.00000000, 27284.43000000, '2023-04-22 13:16:56', 10, 2, 0, 1, 1, '2023-04-22 13:15:58', '2023-04-22 13:18:04'),
(71, 19, 2, 145.00000000, 1855.39000000, '2023-04-22 13:27:26', 10, 2, 0, 1, 1, '2023-04-22 13:25:26', '2023-04-24 06:32:46'),
(72, 19, 2, 148.00000000, 1855.71000000, '2023-04-22 13:27:58', 10, 2, 0, 1, 1, '2023-04-22 13:25:59', '2023-04-24 06:32:48'),
(73, 19, 2, 148.00000000, 1856.27000000, '2023-04-22 13:28:19', 10, 2, 0, 1, 1, '2023-04-22 13:26:20', '2023-04-24 06:32:49'),
(74, 19, 2, 148.00000000, 1856.18000000, '2023-04-22 13:28:35', 10, 1, 0, 2, 1, '2023-04-22 13:26:36', '2023-04-24 06:32:50'),
(75, 19, 1, 29.00000000, 27329.21000000, '2023-04-22 13:36:25', 10, 2, 0, 1, 1, '2023-04-22 13:35:26', '2023-04-22 13:37:23'),
(76, 19, 1, 27.00000000, 27329.79000000, '2023-04-22 13:37:43', 10, 1, 3, 2, 1, '2023-04-22 13:35:44', '2023-04-24 06:32:50');

--
-- Indexes for dumped tables
--

-- --------------------------------------------------------

--
-- Table structure for table `trade_settings`
--

CREATE TABLE `trade_settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `time` int(11) DEFAULT NULL,
  `unit` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trade_settings`
--

INSERT INTO `trade_settings` (`id`, `time`, `unit`, `profit`, `created_at`, `updated_at`) VALUES
(1, 60, 'seconds', 10, '2023-04-03 10:13:53', '2023-04-28 06:00:32'),
(2, 120, 'seconds', 10, '2023-04-03 10:14:02', '2023-04-04 11:16:33'),
(3, 12, 'hours', 10, '2023-04-03 10:14:14', '2023-04-04 11:17:03'),
(4, 36, 'hours', 10, '2023-04-04 11:19:19', '2023-04-04 11:19:19'),
(5, 168, 'hours', 10, '2023-04-04 11:20:21', '2023-04-04 11:20:21'),
(6, 96, 'hours', 10, '2023-04-15 05:20:32', '2023-04-15 05:20:32'),
(8, 10, 'seconds', 50, '2023-04-28 06:01:55', '2023-04-28 06:23:43');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `demo_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `kyc_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: KYC Unverified, 2: KYC pending, 1: KYC verified',
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: mobile unverified, 1: mobile verified',
  `profile_complete` tinyint(1) NOT NULL DEFAULT 0,
  `ver_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ban_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `email`, `country_code`, `mobile`, `refCode`, `ref_by`, `balance`, `demo_balance`, `password`, `address`, `status`, `kyc_data`, `kv`, `ev`, `sv`, `profile_complete`, `ver_code`, `ver_code_send_at`, `ts`, `tv`, `tsc`, `ban_reason`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Adeleye', 'Godswill', 'futwk402406', 'adesokanadedeji10@gmail.com', 'NG', '23408065864913', 'oiF8lpAAQR', 0, '0.00000000', '0.00000000', 'A_a3312_$@1!', '{\"country\":\"Nigeria\",\"address\":\"Akure - Ado Ekiti Road\",\"state\":\"Ado Ekiti\",\"zip\":\"360211\",\"city\":\"Ekiti\"}', 1, NULL, 1, 1, 1, 1, '188855', '2023-03-30 02:17:41', 1, 0, NULL, NULL, NULL, '2023-03-30 06:17:40', '2023-06-06 13:22:58'),
(2, 'Ginfinty', 'Institution', 'futwk4536', 'adesokanafdedeji10@gmail.com', 'NG', '2345565864913', 'vb65vfQpeT', 0, '0.00000000', '0.00000000', '$2y$10$tzXRElMSgaY14GSoeZ1jw.rNkQNdEOxspuvjdNtdCCQbx2nSep9gq', '{\"country\":\"Nigeria\",\"address\":\"USA\",\"state\":\"California\",\"zip\":\"90011\",\"city\":\"Lagos\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-03-30 21:52:06', '2023-06-06 13:22:58'),
(3, 'vkvuukjjb', 'lmlml', 'testing', 'admifn@basefex.co1', 'NG', '234097070700707', 'IMBzzUvNPg', 0, '500000.00000000', '0.00000000', '$2y$10$KO2BGAkcog6qxPji2OVdIeKNETVQesEuXjvGtHD91ToK6wVeZU3Qq', '{\"country\":\"Nigeria\",\"address\":\"\'lm\'m\",\"state\":\"lml\",\"zip\":\"lmlm\",\"city\":\"knkn\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, 'bI44STH2yeWtOOMlZsfjMVkL2qfmPtyi0KC5BBPsb61BuFTXjh3ZQPztJKY4', '2023-03-31 15:17:14', '2023-06-06 13:22:58'),
(4, 'admicsdad', 'admin', 'realadmin', 'meredithhitchko@protonm1ail.com', 'NG', '2340808009844321', 'oQesbWUVlu', 0, '0.00000000', '0.00000000', '$2y$10$nPLkxQFTL/IwIuzMZ4Jw8ebw2gCKNynT0UFKzH9RlzPp89cbbJeO6', '{\"country\":\"Nigeria\",\"address\":\"aerfrefe\",\"state\":\"eREeassA3ed\",\"zip\":\"2444325\",\"city\":\"DDwed\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-04-01 14:21:37', '2023-06-06 13:22:59'),
(5, 'izzy', 'sir', 'waters', 'vaveyob888@dogemn.com', 'AE', '971521782856', '3fiE6oYjn2', 0, '0.00000000', '1310.00000000', '$2y$10$mMUMSDj2wY6uCbz0eA8NceB92KZ56V2KvxkoRBDpS.STKRpEL0MjC', '{\"country\":\"United Arab Emirates\",\"address\":\"sonapur\",\"state\":\"dubai\",\"zip\":\"100001\",\"city\":\"dubai\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, 'gZOZiahDes1x2JdbzOThsFEubuSgabyrgoGwMsfMctdfQrZC7i8z6wUyDXVF', '2023-04-02 19:07:35', '2023-06-06 13:22:59'),
(6, 'raymonmaris', 'jerry', 'febxadmin', 'raymondmaris088@gmail.com', 'NG', '2348062153658', 'mrREDyZuFj', 0, '0.00000000', '310.00000000', '$2y$10$lEOL8NGg6j3bNEmv5Nb/euTSxLvjBIN//AMlwJQQDZgWZM9nJsP26', '{\"country\":\"Nigeria\",\"address\":\"24 ijoka Akure\",\"state\":\"Ondo\",\"zip\":\"35110\",\"city\":\"ondo\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, 'P1P7i8VmFdvpRxRtg6AocKBV96K6oj0ZG1kqYSlPvd8mRz5vEIgaAzGifob8', '2023-04-02 19:12:53', '2023-06-06 13:22:59'),
(7, 'Lee', 'Williams', 'lee043', 'ow7950683@gmail.com', 'GB', '447495737890', 'YhcMWgjTDn', 0, '19066.00000000', '1310.00000000', '$2y$10$MKkt1T7CuWc9mu.zupsEy.SU5rqh5wjadsst1EGRtpW7ecTxbywHK', '{\"country\":\"United Kingdom\",\"address\":\"Old Broad street, Tower 42, London wall\",\"state\":\"London\",\"zip\":\"NW\",\"city\":null}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, '8ekU3DhyfnC98pRs2BU1lsvnVnIKJh8ryaheCM9oe9fB8h9lLgJPvzi9U1kq', '2023-04-03 16:36:28', '2023-06-06 13:22:59'),
(8, 'Emeka', 'Emmanuel', 'mekaniz', 'edon4044@gmail.com', 'AE', '971566927367', 'WXV4HvOxjD', 0, '100.00000000', '0.00000000', '$2y$10$dKC2LaA0nHkpx/sYpwuI/OdLYiOR61af6p4rbrxLX470iYdHHc33W', '{\"country\":\"United Arab Emirates\",\"address\":\"Dubai\",\"state\":\"Dubai\",\"zip\":\"4433\",\"city\":\"Deira\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-04-04 00:39:45', '2023-06-06 13:22:59'),
(9, 'Chucho', 'Raph', 'raphael', 'raphaelchucho93@gmail.com', 'NG', '2349110130686', '3liklBxh6Q', 0, '1300.00000000', '0.00000000', '$2y$10$0/0TFrDVxpG661TognYBXeTGjU65/as2XLk0gixrwF6Vzu6hh72j6', '{\"country\":\"Nigeria\",\"address\":\"Lagos\",\"state\":\"Lagos\",\"zip\":null,\"city\":\"Ikeja\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-04-04 14:58:22', '2023-06-06 13:22:59'),
(10, 'Mahamadou', 'Hydara', 'aboumuhamad219', 'aboumuhamad219@gmail.com', 'FR', '330634646640', '974Oe1AR55', 0, '1.00000000', '0.00000000', '$2y$10$I9dfka.qrxYp6M5da.m/9uKgQajKH4uAvwLzDCKHQCPSKoe4gvVCi', '{\"country\":\"France\",\"address\":\"9Rue Davoust, 93500 Pantin, France\",\"state\":\"9Rue Davoust, 93500 Pantin,\",\"zip\":\"93500\",\"city\":\"Pantin\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-04-04 15:59:13', '2023-06-06 13:22:59'),
(11, 'brando', 'brown', 'brandobrown55', 'brandobrown2022@gmail.com', 'PH', '639287611067', 'eo3qqzr4qj', 0, '0.00000000', '0.00000000', '$2y$10$syEUJldZ/ptNas48mE0QxuuR6vjpoXLcoQ7f3DTXZ0OCoTw/G8vQe', '{\"country\":\"Philippines\",\"address\":\"156 Ramon Magsaysay Avenue, corner Emilio Jacinto St, Davao City\",\"state\":\"Davao\",\"zip\":\"8000\",\"city\":\"Barangay 32-D\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-04-05 13:17:23', '2023-06-06 13:22:59'),
(12, 'ehehe', 'teheh', 'refsfsghss', 'admi1hfhn@basefex.co', 'NG', '2340790707070707', 'Y5F0gCH0UO', 0, '76869699696.00000000', '0.00000000', '$2y$10$xiQ3QqtDMsxFUy8hegeAIuVNrFSR1Fb3Tm9QeUvj1uyb/Yx9n4Hpm', '{\"country\":\"Nigeria\",\"address\":\"ehhehe\",\"state\":\"jeejeje\",\"zip\":null,\"city\":\"ejeejeje\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, '0wZO03F7zSJTWD3qawgGRc6dRM1JEhc3fhaf9WLFTljAZOKOBmNc6nNr8ZUR', '2023-04-05 17:00:48', '2023-06-06 13:22:59'),
(13, 'Reply', 'No', 'replyno', 'replyno840@gmail.com', 'NG', '2344444444444', '2ZQEH2tNha', 0, '7000.00000000', '0.00000000', '$2y$10$ba8it.v5/cWeIrFA7rYZ1eRRJc2nfVkHztFj1alxwOE2DfL8eHTcO', '{\"country\":\"Nigeria\",\"address\":\"CRS\",\"state\":\"CRS\",\"zip\":\"500001\",\"city\":\"Calabar\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-04-06 00:45:32', '2023-06-06 13:22:59'),
(14, 'Jose Harold', 'Da Silva gama', 'jose2323', 'joseharoldodasilvagama@gmail.com', 'BR', '5588996967296', 'yAbXgd33CT', 0, '734.00000000', '0.00000000', '$2y$10$JDEqRzGkDRQYGw2R5pVfCebyzkkZMilxAfwfnjFJYUOylBGol0ohC', '{\"country\":\"Brazil\",\"address\":\"Felix 189 estado\",\"state\":\"Rio Grande Do Norte\",\"zip\":\"59622\",\"city\":\"MOSSORO\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, 'pkL0t3ng1oLzXX8bM7xM9NYGnjWVIZJ2S0lDkh9a3QVGayFvHcmMyo121qOg', '2023-04-15 14:00:13', '2023-06-06 13:22:59'),
(15, 'Mikhail', 'Podgornyi', 'mikhail_01', 'nuteki163@yandex.ru', 'RU', '79170361205', 'tN1YgwG1He', 0, '0.00000000', '0.00000000', '$2y$10$abGKOEymHQyMFLfTkLFsJuNt1rsFhq7UTL.3dEJjo43VaoJ5CxwyW', '{\"address\":\"Samara region Chapaevsk city Kutuzova street house 102\",\"state\":null,\"zip\":\"446101\",\"country\":\"Russia\",\"city\":\"Chapaevsk\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-04-16 09:27:28', '2023-06-06 13:22:59'),
(16, 'Olayinka', 'Adeyemi', 'sagex7', 'olayinkaapps@gmail.com', 'NG', '2348140557872', '1QOOfsVMUV', 0, '0.00000000', '0.00000000', '$2y$10$iUqAP.kYiexLhRM5cZn0jeDl.Ba2jokF8XL6ExPF37aEEUXpNQvhq', '{\"country\":\"Switzerland\",\"address\":\"Everywhere\",\"state\":\"Lagos\",\"zip\":\"10001\",\"city\":\"Everywhere\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-04-17 23:46:51', '2023-06-06 13:22:59'),
(17, 'Bot', 'Sage', 'sagebot', 'danzexperiments@gmail.com', 'NG', '2348140557872', '2vl1XaAtpK', 0, '1954.00000000', '1480.00000000', '$2y$10$.38G7XfI1Zq1qiWqj2k6xOlpf8EQOl2pSKYS8Zy3zN1nyEb46UCdm', '{\"country\":\"Nigeria\",\"address\":\"Earth\",\"state\":\"Human\",\"zip\":\"100001\",\"city\":\"Man\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, 'mvaNDJEQ3OUuM23b1E78JsBNIT6VhSrstpJeTPmy1YwdplEjIajpE4ihlD8P', '2023-04-19 10:04:02', '2023-06-06 13:22:59'),
(18, 'Mimi', 'Sir', 'miemie', 'kidakak389@momoshe.com', 'AE', '971521782859', 'kRm6Ga6yIT', 0, '1905.00000000', '1500.00000000', '$2y$10$XtqCXt7BM6B13MEeboAxj.xikL0QuULvie2pmuFS8s.HXcASP1oLm', '{\"country\":\"United Arab Emirates\",\"address\":\"sonen\",\"state\":\"dubai\",\"zip\":\"10001\",\"city\":\"Dubai\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-04-22 11:16:30', '2023-06-06 13:22:59'),
(19, 'Lamia', 'Lam', 'lami042', 'lamonlamai42@gmail.com', 'GB', '447438436445', 'uOmPWVpHdd', 0, '1736.30000000', '1500.00000000', '$2y$10$6vkgalzRgOhfFOX7AdDRXe5eAB.D0mh.YijxFl8WgOlgXwvvMfiRS', '{\"country\":\"United Kingdom\",\"address\":\"0000\",\"state\":\"London\",\"zip\":\"77777\",\"city\":\"L2\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, 'vHrKU5xr9omaAK7FjtfrEwriliMRpW9MCwFHbUjHeaGcBieoph0gaAdsixcO', '2023-04-22 12:42:55', '2023-06-06 13:22:59'),
(20, 'Raphael', 'ChuCho', 'aniimpoto', 'emilyayia99@gmail.com', 'NG', '23409110130686', 'aLkCl9eK3Y', 0, '0.00000000', '1310.00000000', '$2y$10$QOSpRIgUoBnDdsSYK5l3vOCjglvtLzPpJ4ZnBiitTb44hLU22beNy', '{\"country\":\"Nigeria\",\"address\":\"6th street, building 56, Al Barsha South 1\",\"state\":\"Dubai\",\"zip\":\"101101\",\"city\":\"Dubai\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-04-22 13:59:53', '2023-06-06 13:22:59'),
(21, 'Fake', 'Account', 'faker123', 'koko@koko.com', 'AF', '938140667872', 'uyitcSFP4N', 17, '0.00000000', '0.00000000', '$2y$10$w2XwQUCFfUODAR724H.Z1ePS.gXhv4cBQvrUKhb0ea/obqkyYy0gu', '{\"country\":\"Afghanistan\",\"address\":\"123 Op\",\"state\":\"Sidian\",\"zip\":\"102394\",\"city\":\"Lagos\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-06-06 13:28:07', '2023-06-06 13:28:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_ip` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `after_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `withdraw_information` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `admin_feedback` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_limit` decimal(28,8) DEFAULT 0.00000000,
  `max_limit` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `fixed_charge` decimal(28,8) DEFAULT 0.00000000,
  `rate` decimal(28,8) DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) DEFAULT NULL,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crypto_currencies`
--
ALTER TABLE `crypto_currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `name_2` (`name`),
  ADD UNIQUE KEY `symbol` (`symbol`),
  ADD KEY `name_4` (`name`);
ALTER TABLE `crypto_currencies` ADD FULLTEXT KEY `name_3` (`name`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `practice_logs`
--
ALTER TABLE `practice_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trade_logs`
--
ALTER TABLE `trade_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trade_settings`
--
ALTER TABLE `trade_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crypto_currencies`
--
ALTER TABLE `crypto_currencies`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notification_logs`
--
ALTER TABLE `notification_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `practice_logs`
--
ALTER TABLE `practice_logs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trade_logs`
--

--
-- Indexes for table `trade_logs`
--
ALTER TABLE `trade_logs`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `trade_logs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trade_settings`
--
ALTER TABLE `trade_settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`),
  ADD UNIQUE KEY `refCode` (`refCode`);

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
