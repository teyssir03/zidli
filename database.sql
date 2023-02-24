-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 20, 2022 at 06:39 PM
-- Server version: 10.3.34-MariaDB-0ubuntu0.20.04.1
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `psw_psw_psw_psw_psw`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(225) DEFAULT NULL,
  `password` text NOT NULL,
  `register_date` datetime NOT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_ip` varchar(225) DEFAULT NULL,
  `client_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF',
  `access` enum('{"admin_access":"1","users":"1","orders":"1","subscriptions":"1","dripfeed":"1","services":"1","payments":"1","tickets":"1","reports":"1","general_settings":"1","pages":"1","payments_settings":"1","bank_accounts":"1","payments_bonus":"1","alert_settings":"1","providers":"1","themes":"1","child-panels":"1","language":"1","meta":"1","twice":"1","proxy":"1","kuponlar":"1","admins":"1"}') DEFAULT '{"admin_access":"1","users":"1","orders":"1","subscriptions":"1","dripfeed":"1","services":"1","payments":"1","tickets":"1","reports":"1","general_settings":"1","pages":"1","payments_settings":"1","bank_accounts":"1","payments_bonus":"1","alert_settings":"1","providers":"1","themes":"1","child-panels":"1","language":"1","meta":"1","twice":"1","proxy":"1","kuponlar":"1","admins":"1"}',
  `currency` int(11) NOT NULL,
  `admin_type` varchar(225) NOT NULL,
  `users` text NOT NULL,
  `services` text NOT NULL,
  `orders` text NOT NULL,
  `payments` text NOT NULL,
  `tickets` text NOT NULL,
  `logs_report` text NOT NULL,
  `additional` text NOT NULL,
  `appearance` text NOT NULL,
  `settings` text NOT NULL,
  `broadcast` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `password`, `register_date`, `login_date`, `login_ip`, `client_type`, `access`, `currency`, `admin_type`, `users`, `services`, `orders`, `payments`, `tickets`, `logs_report`, `additional`, `appearance`, `settings`, `broadcast`) VALUES
(1, 'pswcom', '1234567890', '0000-00-00 00:00:00', '2022-09-20 21:52:33', '93.176.138.94', '2', '{\"admin_access\":\"1\",\"users\":\"1\",\"orders\":\"1\",\"subscriptions\":\"1\",\"dripfeed\":\"1\",\"services\":\"1\",\"payments\":\"1\",\"tickets\":\"1\",\"reports\":\"1\",\"general_settings\":\"1\",\"pages\":\"1\",\"payments_settings\":\"1\",\"bank_accounts\":\"1\",\"payments_bonus\":\"1\",\"alert_settings\":\"1\",\"providers\":\"1\",\"themes\":\"1\",\"child-panels\":\"1\",\"language\":\"1\",\"meta\":\"1\",\"twice\":\"1\",\"proxy\":\"1\",\"kuponlar\":\"1\",\"admins\":\"1\"}', 1, 'psw', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime DEFAULT NULL,
  `image_file` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `bank_name` varchar(225) NOT NULL,
  `bank_sube` varchar(225) NOT NULL,
  `bank_hesap` varchar(225) NOT NULL,
  `bank_iban` text NOT NULL,
  `bank_alici` varchar(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime NOT NULL,
  `image_file` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `blog_get` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` text COLLATE utf8mb4_bin NOT NULL,
  `category_line` double NOT NULL,
  `category_type` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '2',
  `category_secret` enum('1','2') COLLATE utf8mb4_bin NOT NULL DEFAULT '2',
  `category_icon` text COLLATE utf8mb4_bin NOT NULL,
  `is_refill` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_line`, `category_type`, `category_secret`, `category_icon`, `is_refill`) VALUES
(1, 'psw', 1, '2', '2', 'generalannouncement', '');

-- --------------------------------------------------------

--
-- Table structure for table `childpanels`
--

CREATE TABLE `childpanels` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `domain` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `child_username` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `child_password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `charge` double NOT NULL,
  `status` enum('Pending','Active','Frozen','Suspended') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending',
  `renewal_date` date NOT NULL,
  `date_created` datetime NOT NULL,
  `dreampanel_id` int(11) NOT NULL,
  `keyc` varchar(225) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `name` varchar(225) DEFAULT NULL,
  `email` varchar(225) NOT NULL,
  `username` varchar(225) DEFAULT NULL,
  `admin_type` enum('1','2') NOT NULL DEFAULT '2',
  `password` text NOT NULL,
  `telephone` varchar(225) DEFAULT NULL,
  `balance` decimal(21,4) NOT NULL,
  `balance_type` enum('1','2') NOT NULL DEFAULT '2',
  `debit_limit` double DEFAULT NULL,
  `spent` decimal(21,4) NOT NULL,
  `register_date` datetime NOT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_ip` varchar(225) DEFAULT NULL,
  `apikey` text NOT NULL,
  `tel_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `email_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `client_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF',
  `access` text DEFAULT NULL,
  `lang` varchar(255) NOT NULL DEFAULT 'tr',
  `timezone` double NOT NULL DEFAULT 0,
  `currency_type` enum('INR','USD') NOT NULL DEFAULT 'USD',
  `ref_code` text NOT NULL,
  `ref_by` text DEFAULT NULL,
  `change_email` enum('1','2') NOT NULL DEFAULT '2',
  `resend_max` int(11) NOT NULL,
  `currency` varchar(225) NOT NULL DEFAULT '1',
  `passwordreset_token` varchar(225) NOT NULL,
  `coustm_rate` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`client_id`, `name`, `email`, `username`, `admin_type`, `password`, `telephone`, `balance`, `balance_type`, `debit_limit`, `spent`, `register_date`, `login_date`, `login_ip`, `apikey`, `tel_type`, `email_type`, `client_type`, `access`, `lang`, `timezone`, `currency_type`, `ref_code`, `ref_by`, `change_email`, `resend_max`, `currency`, `passwordreset_token`, `coustm_rate`) VALUES
(1, 'Afiq Sam', 'afiqnazeer919@gmail.com', 'afiqsam', '2', 'c040cd4b93f326ba632961c2a400d5fe', '', '0.0000', '2', NULL, '0.0000', '2022-08-17 13:09:07', NULL, NULL, 'ddd0fce97a9a26f3fe6493ef0acd64ab', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', 'dea955', NULL, '2', 0, '1', '', 0),
(2, 'Sagor', 'smsagor371@gmail.com', 'Misme', '2', '97d89ab1e79cc64b7b59dad1f026c66d', '', '0.0000', '2', NULL, '0.0000', '2022-08-18 15:14:20', NULL, NULL, 'a2387e098a81467fe7136e6d3749fdd8', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', '7ea0e7', NULL, '2', 0, '1', '', 0),
(3, 'Deepak', 'pitladeepak1746@gmail.com', 'Deepak1746', '2', 'f5b7f8b0a19e8c75d03dcaedbb731099', '', '0.0000', '2', NULL, '0.0000', '2022-08-19 15:26:23', NULL, NULL, '51b8b00e5b682ed301efbf5f36fb5900', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', '772650', NULL, '2', 0, '1', '', 0),
(4, 'Jahid D&#39;cruz', 'ahmedsohan517a@gmail.com', 'Jahiddcruz', '2', '3583a27cd3eca968b1f9057d48022aa1', '', '0.0000', '2', NULL, '0.0000', '2022-08-19 20:27:36', NULL, NULL, 'fbfbcc08ae9d62b90f027d0cfdf0233d', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', 'ebbbb7', NULL, '2', 0, '1', '', 0),
(5, 'Suresh ', 'mvanaraja581@gmail.com', 'Suresh0000', '2', 'da064e0780dde0dfdedc704b92eef3ce', '', '0.0000', '2', NULL, '0.0000', '2022-08-20 14:15:12', '2022-09-01 16:49:13', '223.181.240.85', '2b1cfc77a5f51d244ceb82c6e4e2ed38', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', 'dae328', NULL, '2', 0, '1', '', 0),
(6, 'Junaid Shaheen', 'jbharwana34@gmail.com', 'Junaid69', '2', 'fadf08ea0a9275b8ee9f24b61d3ffc77', '', '0.0000', '2', NULL, '0.0000', '2022-08-20 22:53:56', NULL, NULL, '913c20d208f2551104d5331cfa343c9d', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', '1c5c56', NULL, '2', 0, '1', '', 0),
(7, 'Amitbhati', 'amitbhatijsm@gmail.com', 'amitbhatijsm', '2', '69005bb62e9622ee1de61958aacf0f63', '', '0.0000', '2', NULL, '0.0000', '2022-08-22 22:06:01', NULL, NULL, '233a5e84950af966d31b43986a9a0707', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', '1e2f5e', NULL, '2', 0, '1', '', 0),
(8, 'Sharukh ', 'sharukh.ali32@gmail.com', 'Shahrukhalikhan', '2', '1b9edc9afe9550b8907640cff275d5ed', '', '0.0000', '2', NULL, '0.0000', '2022-08-25 04:00:13', NULL, NULL, '0004f205ad97279625508098fb05fcf2', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', '4d3ce6', NULL, '2', 0, '1', '', 0),
(9, 'Usman raza', 'wwwusmanraza6@gmail.com', 'Usman787', '2', '2b1364087d81cad8de461b3e7728f7e3', '', '0.0000', '2', NULL, '0.0000', '2022-08-25 15:35:30', NULL, NULL, '608fa77383f519a15981df63117c0d4d', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', '37f489', NULL, '2', 0, '1', '', 0),
(10, 'affan', 'affankhan7896@gmail.com', 'affa01', '2', 'eab0c89ab582cccf4f7670de5e1f5bf7', '', '0.0000', '2', NULL, '0.0000', '2022-08-26 13:42:11', NULL, NULL, '427ad284ab3dd5385b733b3bf8c0410a', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', '8eb305', NULL, '2', 0, '1', '', 0),
(11, 'Prashant Sharma', 'dssr7222@gmail.com', 'prashantsharma123', '2', 'd2da1e9f79c6ca6d5d60c7a2b8673c5a', '', '0.0000', '2', NULL, '0.0000', '2022-08-26 13:49:29', NULL, NULL, '1245bab97d3302bed0a51174cd7baa32', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', '03f39e', NULL, '2', 0, '1', '', 0),
(12, 'Anil kumar doot', 'anilkumardoot3@gmail.com', 'anilkumardoot', '2', '5956795b0098febf16d461224bf8368d', '', '0.0000', '2', NULL, '0.0000', '2022-08-26 21:00:20', NULL, NULL, '050340807dc498a76ee38cfe5eb5ac67', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', 'b6b673', NULL, '2', 0, '1', '', 0),
(13, 'Samshad', 'sonababuvlogs80@gmail.com', 'Rahmani', '2', 'b93e6e741bcd994ede247fc4aa49e67f', '', '0.0000', '2', NULL, '0.0000', '2022-08-27 08:50:33', NULL, NULL, '60e04d9506db4a38c3d416a26163594e', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', 'ff360b', NULL, '2', 0, '1', '', 0),
(14, 'affan', 'affankhan1845@gmail.com', 'affan01', '2', 'fe884cd7c85cd5527f807abca6eb5d54', '', '0.0000', '2', NULL, '0.0000', '2022-08-27 14:07:37', NULL, NULL, '4cce9a8f6573b95223b9aec8914589d6', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', 'c0b427', NULL, '2', 0, '1', '', 0),
(15, 'ABBESS', 'ahmed.zaki2002xc@gmail.com', 'abbasseakrim', '2', 'b39887ea4d3d3f194d429ea677277210', '', '0.0000', '2', NULL, '0.0000', '2022-08-28 22:41:45', NULL, NULL, '19b91d77dd143a2a81a97f3c1cbc826e', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', '6e508c', NULL, '2', 0, '1', '', 0),
(16, 'Carlos James', 'jokere401p@gmail.com', 'topac', '2', 'c8e84cbbc22b642c78b83f470b9e1018', '', '0.0000', '2', NULL, '0.0000', '2022-08-29 03:44:04', NULL, NULL, 'b350a988a57d00da5893d44dbc42502c', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', '0510b0', NULL, '2', 0, '1', '', 0),
(17, 'tanuj', 'tanujbhugra9@gmail.com', 'tanujbhugra', '2', 'bfe5a80cb26bf6db05f7b1ee4dd1a95d', '', '0.0000', '2', NULL, '0.0000', '2022-08-29 22:55:33', NULL, NULL, '37a9cfdd200f73d7d765cfcd220b1d1a', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', '11a3e3', NULL, '2', 0, '1', '', 0),
(18, 'Vidit Vaswani', 'viditvaswani18@gmail.com', 'mibproduction7', '2', '0df3afb5e40704cedc1ad5e12bd0bf2c', '', '0.0000', '2', NULL, '0.0000', '2022-08-30 01:19:57', NULL, NULL, 'c7ba48f732761c3263df9360b93c8cc6', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', '1ec579', NULL, '2', 0, '1', '', 0),
(19, 'PEFECTSMMWORLD', 'yashv7275@gmail.com', 'PEFECTSMMWORLD', '2', '63338af1144d4858df7adcd7982229e5', '', '0.0000', '2', NULL, '0.0000', '2022-08-30 03:09:41', NULL, NULL, 'b04a83e14285163eb5809d16a207b136', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', '281c8e', NULL, '2', 0, '1', '', 0),
(20, 'Zahra', 'zahra008rezvani@gmail.com', 'Mehtngff', '2', '53b67d93b40dac4c305887aa890a51d0', '', '0.0000', '2', NULL, '0.0000', '2022-08-30 04:21:57', NULL, NULL, '4e905fb660986c2910b568b62f590489', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', 'eab9e2', NULL, '2', 0, '1', '', 0),
(21, 'Alexander Grayson', 'alexandergrayson1107@gmail.com', 'Alexander1107', '2', 'f1ca361a6f8601472b769b90fb674c98', '', '0.0000', '2', NULL, '0.0000', '2022-08-30 17:59:18', NULL, NULL, '8dd24241bfa061a193b6f45f367c09d5', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', '5c929d', NULL, '2', 0, '1', '', 0),
(22, 'alyona fastpanel', 'edmmofps@gmail.com', 'fastpanel', '2', '1ec054a3abd17a617d922d47a691868f', '', '0.0000', '2', NULL, '0.0000', '2022-09-07 00:35:58', NULL, NULL, '986569bb7db67196e40b56a4550d03a2', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', '5a7538', NULL, '2', 0, '1', '', 0),
(23, 'Ashwin', 'ashwinbhatt56@gmail.com', 'ashizzB', '2', '9123fa89669bf7d20b18f6c383acfaee', '', '0.0000', '2', NULL, '0.0000', '2022-09-08 18:23:17', NULL, NULL, '3e6314e7e8704ad64089cad938c56928', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', '769dcb', NULL, '2', 0, '1', '', 0),
(24, 'BoostX (Social Media Growth)', 'boostxin@gmail.com', 'boostx', '2', 'e15c8a2ba5b03446c86d72d5804f5a48', '', '0.0000', '2', NULL, '0.0000', '2022-09-08 22:31:34', NULL, NULL, '37854bc70a5a5db5dba7b71f4ba25fca', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', 'ec3a46', NULL, '2', 0, '1', '', 0),
(25, 'Hyper', 'hypergamingrh@gmail.com', 'HyperGamingR', '2', '979c7605d8415d48243c7b587058c11b', '', '0.0000', '2', NULL, '0.0000', '2022-09-20 10:43:29', NULL, NULL, '85c807aefc98ba25f1923271d9c4aefb', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', '7693e7', NULL, '2', 0, '1', '', 0),
(26, 'Hostify Philippines', 'hostifyphilippines@gmail.com', 'hostify', '2', '7ddc96c218ca5f6a9325c40c114f2312', '', '1000.0000', '2', NULL, '0.0000', '2022-09-20 21:25:28', NULL, NULL, '89743e4f4645032d28a375514407a2e5', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', '3801d6', NULL, '2', 0, '1', '', 0),
(27, 'Yakob', 'yjin86701@gmail.com', 'Yakob123', '2', '47750851209b70bdbbe0549c04271b00', '', '0.0000', '2', NULL, '0.0000', '2022-09-20 21:41:54', NULL, NULL, '5230d7dd2cb4578a1d5c7e9975f26dd1', '1', '2', '2', 'PSW_THEME_COLOUR_10.0', 'en', 0, 'USD', 'cfd774', NULL, '2', 0, '3', '', 0),
(28, 'Sumit', 'sumitsoniphalodo@gmail.com', 'Sumit', '2', 'f73261d624d4a2d81544aec9ad8500a6', '', '0.0000', '2', NULL, '0.0000', '2022-09-20 22:04:45', NULL, NULL, 'cd1b90185f15f551b7c4d20ab13cea37', '1', '2', '2', 'PSW_THEME_COLOUR_1.0', 'en', 0, 'USD', 'acb258', NULL, '2', 0, '1', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `clients_category`
--

CREATE TABLE `clients_category` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clients_price`
--

CREATE TABLE `clients_price` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_price` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clients_service`
--

CREATE TABLE `clients_service` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client_report`
--

CREATE TABLE `client_report` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `action` text NOT NULL,
  `report_ip` varchar(225) NOT NULL,
  `report_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client_report`
--

INSERT INTO `client_report` (`id`, `client_id`, `action`, `report_ip`, `report_date`) VALUES
(1, 1, '\r\n    User registered.', '169.149.192.221', '2022-08-17 13:09:07'),
(2, 2, '\r\n    User registered.', '8.29.105.42', '2022-08-18 15:14:20'),
(3, 3, '\r\n    User registered.', '223.238.38.23', '2022-08-19 15:26:23'),
(4, 4, '\r\n    User registered.', '103.107.135.136', '2022-08-19 20:27:36'),
(5, 5, '\r\n    User registered.', '106.195.42.50', '2022-08-20 14:15:12'),
(6, 6, '\r\n    User registered.', '111.119.187.59', '2022-08-20 22:53:56'),
(7, 7, '\r\n    User registered.', '49.36.235.249', '2022-08-22 22:06:01'),
(8, 8, '\r\n    User registered.', '42.106.237.21', '2022-08-25 04:00:13'),
(9, 8, '0 TL tutarında yeni sipariş geçildi #.', '42.106.237.21', '2022-08-25 04:00:30'),
(10, 9, '\r\n    User registered.', '157.38.22.115', '2022-08-25 15:35:30'),
(11, 9, '0 TL tutarında yeni sipariş geçildi #.', '157.38.22.115', '2022-08-25 15:35:53'),
(12, 10, '\r\n    User registered.', '103.150.207.138', '2022-08-26 13:42:11'),
(13, 10, 'API Key changed', '103.150.207.138', '2022-08-26 13:43:24'),
(14, 11, '\r\n    User registered.', '59.95.153.145', '2022-08-26 13:49:29'),
(15, 12, '\r\n    User registered.', '171.79.153.9', '2022-08-26 21:00:20'),
(16, 13, '\r\n    User registered.', '223.230.149.155', '2022-08-27 08:50:33'),
(17, 14, '\r\n    User registered.', '111.119.187.34', '2022-08-27 14:07:37'),
(18, 14, 'API Key changed', '111.119.187.34', '2022-08-27 14:08:09'),
(19, 15, '\r\n    User registered.', '105.68.251.7', '2022-08-28 22:41:45'),
(20, 16, '\r\n    User registered.', '196.75.204.52', '2022-08-29 03:44:04'),
(21, 17, '\r\n    User registered.', '223.178.208.192', '2022-08-29 22:55:33'),
(22, 18, '\r\n    User registered.', '42.108.196.249', '2022-08-30 01:19:57'),
(23, 19, '\r\n    User registered.', '223.225.240.200', '2022-08-30 03:09:41'),
(24, 20, '\r\n    User registered.', '188.229.61.231', '2022-08-30 04:21:57'),
(25, 20, '0 TL tutarında yeni sipariş geçildi #.', '188.229.61.231', '2022-08-30 04:22:13'),
(26, 21, '\r\n    User registered.', '175.176.28.52', '2022-08-30 17:59:18'),
(27, 5, 'Member logged in.', '223.181.240.85', '2022-09-01 16:49:13'),
(28, 22, '\r\n    User registered.', '94.241.208.105', '2022-09-07 00:35:58'),
(29, 23, '\r\n    User registered.', '103.171.189.130', '2022-09-08 18:23:17'),
(30, 23, 'API Key changed', '103.171.189.130', '2022-09-08 18:24:28'),
(31, 23, 'API Key changed', '103.171.189.130', '2022-09-08 18:26:20'),
(32, 24, '\r\n    User registered.', '106.195.71.224', '2022-09-08 22:31:34'),
(33, 25, '\r\n    User registered.', '223.228.233.82', '2022-09-20 10:43:29'),
(34, 26, '\r\n    User registered.', '49.145.109.148', '2022-09-20 21:25:28'),
(35, 27, '\r\n    User registered.', '136.158.41.238', '2022-09-20 21:41:54'),
(36, 26, '0 TL tutarında yeni sipariş geçildi #57.', '49.145.109.148', '2022-09-20 21:44:15'),
(37, 26, 'API Key changed', '49.145.109.148', '2022-09-20 21:55:54'),
(38, 26, 'API Key changed', '49.145.109.148', '2022-09-20 22:02:02'),
(39, 26, 'API Key changed', '49.145.109.148', '2022-09-20 22:02:35'),
(40, 28, '\r\n    User registered.', '157.38.93.122', '2022-09-20 22:04:45');

-- --------------------------------------------------------

--
-- Table structure for table `crons`
--

CREATE TABLE `crons` (
  `cron_id` int(11) NOT NULL,
  `cron_name` varchar(50) NOT NULL,
  `cron_operation` varchar(200) NOT NULL,
  `cron_updefault` int(11) NOT NULL DEFAULT 1,
  `cron_endup` int(11) NOT NULL,
  `cron_date_update` timestamp NOT NULL DEFAULT current_timestamp(),
  `cron_status` int(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `crons`
--

INSERT INTO `crons` (`cron_id`, `cron_name`, `cron_operation`, `cron_updefault`, `cron_endup`, `cron_date_update`, `cron_status`) VALUES
(1, 'psw.php', '', 1, 0, '2022-08-15 18:39:06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `symbol` text DEFAULT NULL,
  `value` double DEFAULT NULL,
  `name` varchar(225) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1',
  `default` enum('2','1') NOT NULL DEFAULT '2',
  `nouse` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `symbol`, `value`, `name`, `status`, `default`, `nouse`) VALUES
(1, '$', 1, 'USD', '1', '1', '1'),
(3, '₹', 79.39, 'INR', '1', '2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `decoration`
--

CREATE TABLE `decoration` (
  `id` int(11) NOT NULL,
  `snow_effect` int(3) NOT NULL,
  `snow_colour` text NOT NULL,
  `diwali_lights` int(3) NOT NULL,
  `video_link` text NOT NULL,
  `christmas_deco` varchar(5000) NOT NULL,
  `action_link` text NOT NULL,
  `pop_noti` int(2) NOT NULL,
  `pop_title` text NOT NULL,
  `pop_desc` text NOT NULL,
  `action_text` varchar(10) NOT NULL,
  `action_button` int(2) NOT NULL,
  `snow_fall` varchar(500) DEFAULT NULL,
  `garlands` text DEFAULT NULL,
  `fire_works` text DEFAULT NULL,
  `toys` text DEFAULT NULL,
  `snowflakes` int(10) NOT NULL,
  `snow_speed` int(20) NOT NULL,
  `gar_shape` text NOT NULL,
  `gar_style` text NOT NULL,
  `fire_size` varchar(100) NOT NULL,
  `fire_speed` text NOT NULL,
  `toy_size` int(20) NOT NULL,
  `toy_quantity` int(50) NOT NULL,
  `toy_speed` int(10) NOT NULL,
  `toy_launch` varchar(100) NOT NULL,
  `toy_a` varchar(50) NOT NULL,
  `toy_b` varchar(50) NOT NULL,
  `toy_c` varchar(50) NOT NULL,
  `toy_d` varchar(50) NOT NULL,
  `toy_e` varchar(50) NOT NULL,
  `toy_f` varchar(50) NOT NULL,
  `toy_g` varchar(50) NOT NULL,
  `toy_h` varchar(50) NOT NULL,
  `toy_i` varchar(50) NOT NULL,
  `toy_j` varchar(50) NOT NULL,
  `toy_k` varchar(50) NOT NULL,
  `psw_license` text NOT NULL,
  `toy_l` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `decoration`
--

INSERT INTO `decoration` (`id`, `snow_effect`, `snow_colour`, `diwali_lights`, `video_link`, `christmas_deco`, `action_link`, `pop_noti`, `pop_title`, `pop_desc`, `action_text`, `action_button`, `snow_fall`, `garlands`, `fire_works`, `toys`, `snowflakes`, `snow_speed`, `gar_shape`, `gar_style`, `fire_size`, `fire_speed`, `toy_size`, `toy_quantity`, `toy_speed`, `toy_launch`, `toy_a`, `toy_b`, `toy_c`, `toy_d`, `toy_e`, `toy_f`, `toy_g`, `toy_h`, `toy_i`, `toy_j`, `toy_k`, `psw_license`, `toy_l`) VALUES
(1, 0, 'rsj', 0, 'https://www.youtube.com/embed/zoOgbpQprRI', '\r\n\r\n<style>.particle-snow{position:fixed;top:0;left:0;width:100%;height:100%;z-index:1;pointer-events:none}.particle-snow canvas{position:fixed;top:0;left:0;width:100%;height:100%;pointer-events:none}.christmas-garland{text-align:center;white-space:nowrap;overflow:hidden;position:absolute;z-index:1;padding:0;pointer-events:none;width:100%;height:85px}.christmas-garland .christmas-garland__item{position:relative;width:28px;height:28px;border-radius:50%;display:inline-block;margin-left:20px}.christmas-garland .christmas-garland__item .shape{-webkit-animation-fill-mode:both;animation-fill-mode:both;-webkit-animation-iteration-count:infinite;animation-iteration-count:infinite;-webkit-animation-name:flash-1;animation-name:flash-1;-webkit-animation-duration:2s;animation-duration:2s}.christmas-garland .christmas-garland__item .apple{width:22px;height:22px;border-radius:50%;margin-left:auto;margin-right:auto;margin-top:8px}.christmas-garland .christmas-garland__item .pear{width:12px;height:28px;border-radius:50%;margin-left:auto;margin-right:auto;margin-top:6px}.christmas-garland .christmas-garland__item:nth-child(2n+1) .shape{-webkit-animation-name:flash-2;animation-name:flash-2;-webkit-animation-duration:.4s;animation-duration:.4s}.christmas-garland .christmas-garland__item:nth-child(4n+2) .shape{-webkit-animation-name:flash-3;animation-name:flash-3;-webkit-animation-duration:1.1s;animation-duration:1.1s}.christmas-garland .christmas-garland__item:nth-child(odd) .shape{-webkit-animation-duration:1.8s;animation-duration:1.8s}.christmas-garland .christmas-garland__item:nth-child(3n+1) .shape{-webkit-animation-duration:1.4s;animation-duration:1.4s}.christmas-garland .christmas-garland__item:before{content:\"\";position:absolute;background:#222;width:10px;height:10px;border-radius:3px;top:-1px;left:9px}.christmas-garland .christmas-garland__item:after{content:\"\";top:-9px;left:14px;position:absolute;width:52px;height:18px;border-bottom:solid #222 2px;border-radius:50%}.christmas-garland .christmas-garland__item:last-child:after{content:none}.christmas-garland .christmas-garland__item:first-child{margin-left:-40px}</style>\r\n<!-- developed by Raj Patel-->\r\n      \r\n<!-- developed by Raj Patel-->  \r\n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/libs/jquery/1.12.4/jquery.min.js\">\r\n          </script>\r\n    \r\n<!-- developed by Raj Patel-->\r\n        \r\n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/global/flpbonhmkq9tsp29.js\">\r\n          </script>\r\n    \r\n        \r\n<!-- developed by Raj Patel-->\r\n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/global/a4kdpfesx15uh7ae.js\">\r\n          </script>\r\n    \r\n<!-- developed by Raj Patel-->\r\n        \r\n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/global/596z6ya3isgxcipy.js\">\r\n          </script>\r\n    \r\n        \r\n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/global/39j8e9yrxs283d1x.js\">\r\n          </script>\r\n    \r\n        \r\n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/global/33srijdbqcgk6lsz.js\">\r\n          </script>\r\n    \r\n<!-- developed by Raj Patel-->\r\n<!-- developed by Raj Patel-->\r\n        \r\n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/52pp7z/wxbh27w4jdzpslxn.js\">\r\n          </script>\r\n    \r\n<!-- developed by Raj Patel-->\r\n<!-- developed by Raj Patel-->\r\n        \r\n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/52pp7z/angedasgma230hxr.js\">\r\n          </script>\r\n    \r\n        \r\n<!-- developed by Raj Patel-->\r\n<!-- developed by Raj Patel-->\r\n    <script type=\"text/javascript\" >\r\n       window.modules.layouts = {\"theme_id\":1,\"auth\":0,\"live\":true};     </script>\r\n    \r\n        \r\n    <script type=\"text/javascript\" >\r\n       window.modules.signin = [];     </script>\r\n    \r\n<!-- developed by Raj Patel-->\r\n<!-- developed by Raj Patel-->\r\n<!-- developed by Raj Patel-->\r\n        \r\n    <script type=\"text/javascript\" >\r\n       document.addEventListener(\'DOMContentLoaded\', function() { \r\nvar newYearEvent = new window.NewYearEvent({\"snow\":{\"init\":true,\"options\":{\"particles\":{\"move\":{\"speed\":3,\"bounce\":false,\"enable\":true,\"random\":false,\"attract\":{\"enable\":false,\"rotateX\":600,\"rotateY\":1200},\"out_mode\":\"out\",\"straight\":false,\"direction\":\"bottom\"},\"size\":{\"anim\":{\"sync\":false,\"speed\":40,\"enable\":false,\"size_min\":0.1},\"value\":5,\"random\":true},\"color\":{\"value\":\"#fff\"},\"number\":{\"value\":100,\"density\":{\"enable\":true,\"value_area\":650}},\"opacity\":{\"anim\":{\"sync\":false,\"speed\":1,\"enable\":true,\"opacity_min\":0.9},\"value\":0.9,\"random\":true},\"line_linked\":{\"color\":\"#ffffff\",\"width\":1,\"enable\":false,\"opacity\":0.8,\"distance\":500}},\"interactivity\":{\"modes\":{\"bubble\":{\"size\":4,\"speed\":3,\"opacity\":1,\"distance\":400,\"duration\":0.3},\"repulse\":{\"speed\":3,\"distance\":200,\"duration\":0.4}},\"events\":{\"resize\":true,\"onclick\":{\"mode\":\"repulse\",\"enable\":true},\"onhover\":{\"mode\":\"bubble\",\"enable\":false}},\"detect_on\":\"window\"},\"retina_detect\":true}},\"toys\"', '', 0, 'NEED THIS SCRIPT?', 'MESSAGE US ON TELEGRAM ', 'Telegram ', 0, 'true', 'true', 'true', 'true', 50, 10, 'apple', 'style3', '1.02', 'fast', 50, 40, 1, 'infinite', '1', '', '', '1', '1', '1', '', '1', '', '', '', 'perfectsmmworld.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `earn`
--

CREATE TABLE `earn` (
  `earn_id` int(255) NOT NULL,
  `client_id` int(255) NOT NULL,
  `link` text NOT NULL,
  `earn_note` text NOT NULL,
  `status` enum('Pending','Under Review','Funds Granted','Rejected','Not Eligible') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `link` text DEFAULT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `link`, `date`) VALUES
(2, 'https://thesmm.xyz/img/files/15fbfa984042716f4bece7abc47a43e5.jpg', '2022-08-11 19:06:07');

-- --------------------------------------------------------

--
-- Table structure for table `General_options`
--

CREATE TABLE `General_options` (
  `id` int(11) NOT NULL,
  `coupon_status` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `updates_show` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `panel_status` enum('Pending','Active','Frozen','Suspended') COLLATE utf8_unicode_ci NOT NULL,
  `panel_orders` int(11) NOT NULL,
  `panel_thismonthorders` int(11) NOT NULL,
  `massorder` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '2',
  `balance_format` enum('0.0','0.00','0.000','0.0000') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  `currency_format` enum('0','2','3','4') COLLATE utf8_unicode_ci NOT NULL DEFAULT '3',
  `ticket_system` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `General_options`
--

INSERT INTO `General_options` (`id`, `coupon_status`, `updates_show`, `panel_status`, `panel_orders`, `panel_thismonthorders`, `massorder`, `balance_format`, `currency_format`, `ticket_system`) VALUES
(1, '', '2', 'Active', 1024, 20, '1', '', '4', '2');

-- --------------------------------------------------------

--
-- Table structure for table `integrations`
--

CREATE TABLE `integrations` (
  `id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `description` varchar(225) NOT NULL,
  `icon_url` varchar(225) NOT NULL,
  `code` text NOT NULL,
  `visibility` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `integrations`
--

INSERT INTO `integrations` (`id`, `name`, `description`, `icon_url`, `code`, `visibility`, `status`) VALUES
(1, 'Beamer', 'Announce updates and get feedback with in-app notification center, widgets and changelog', '/img/integrations/Beamer.svg', '', 1, 2),
(2, 'Getsitecontrol', 'It helps you prevent website visitors from leaving your website without taking any action.', '/img/integrations/Getsitecontrol.svg', '', 1, 1),
(3, 'Google Analytics', 'Statistics and basic analytical tools for search engine optimization (SEO) and marketing purposes', '/img/integrations/Google%20Analytics.svg', '', 1, 1),
(4, 'Google Tag manager', 'Manage all your website tags without editing the code using simple tag management solutions', '/img/integrations/Google%20Tag%20manager.svg', '', 1, 1),
(5, 'JivoChat', 'All-in-one business messenger to talk to customers: live chat, phone, email and social', '/img/integrations/JivoChat.svg', '', 1, 1),
(6, 'Onesignal', 'Leader in customer engagement, empowers mobile push, web push, email, in-app messages', '/img/integrations/Onesignal.svg', '', 1, 1),
(7, 'Push alert', 'Increase reach, revenue, retarget users with Push Notifications on desktop and mobile', '/img/integrations/Push%20alert.svg', '', 1, 1),
(8, 'Smartsupp', 'Live chat, email inbox and Facebook Messenger in one customer messaging platform', '/img/integrations/Smartsupp.svg', '', 1, 1),
(9, 'Tawk.to', 'Track and chat with visitors on your website, mobile app or a free customizable page', '/img/integrations/Tawk.to.svg', '', 1, 1),
(10, 'Tidio', 'Communicator for businesses that keep live chat, chatbots, Messenger and email in one place', '/img/integrations/Tidio.svg', '', 1, 1),
(11, 'Zendesk Chat', 'Helps respond quickly to customer questions, reduce wait times and increase sales', '/img/integrations/Zendesk%20Chat.svg', '', 1, 1),
(12, 'Getbutton.io', 'Chat with website visitors through popular messaging apps. Whatsapp, messenger etc. contact button.', '/img/integrations/Getbutton.svg', '', 1, 1),
(13, 'Google reCAPTCHA v2', 'It uses an advanced risk analysis engine and adaptive challenges to prevent malware from engaging in abusive activities on your website.', '/img/integrations/reCAPTCHA.svg', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kuponlar`
--

CREATE TABLE `kuponlar` (
  `id` int(11) NOT NULL,
  `kuponadi` varchar(255) NOT NULL,
  `adet` int(11) NOT NULL,
  `tutar` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kupon_kullananlar`
--

CREATE TABLE `kupon_kullananlar` (
  `id` int(11) NOT NULL,
  `uye_id` int(11) NOT NULL,
  `kuponadi` varchar(255) NOT NULL,
  `tutar` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language_name` varchar(225) NOT NULL,
  `language_code` varchar(225) NOT NULL,
  `language_type` enum('2','1') NOT NULL DEFAULT '2',
  `default_language` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language_name`, `language_code`, `language_type`, `default_language`) VALUES
(1, 'Türkçe', 'tr', '1', '0'),
(2, 'English', 'en', '2', '1');

-- --------------------------------------------------------

--
-- Table structure for table `Mailforms`
--

CREATE TABLE `Mailforms` (
  `id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `message` varchar(225) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1',
  `header` varchar(225) NOT NULL,
  `footer` varchar(225) NOT NULL,
  `type` enum('Admins','Users') NOT NULL DEFAULT 'Users'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_bin NOT NULL,
  `menu_line` double NOT NULL,
  `type` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '2',
  `slug` varchar(225) COLLATE utf8mb4_bin NOT NULL DEFAULT '2',
  `icon` varchar(225) COLLATE utf8mb4_bin DEFAULT NULL,
  `menu_status` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '1',
  `visible` enum('Internal','External') COLLATE utf8mb4_bin NOT NULL DEFAULT 'Internal',
  `active` varchar(225) COLLATE utf8mb4_bin NOT NULL,
  `tiptext` varchar(225) COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `menu_line`, `type`, `slug`, `icon`, `menu_status`, `visible`, `active`, `tiptext`) VALUES
(1, 'New Order', 1, '2', '/', 'fas fa-cart-arrow-down', '1', 'Internal', 'neworder', ''),
(2, 'Mass Order', 2, '1', '/massorder', 'fas fa-cart-plus', '1', 'Internal', 'massorder', 'Shown only if Mass Order system enabled for use'),
(3, 'Orders ', 3, '2', '/orders', 'fas fa-server', '1', 'Internal', 'orders', ''),
(4, 'Refill', 4, '2', '/refill', 'fas fa-recycle', '1', 'Internal', 'refill', 'Shown only if user have at least one refill task'),
(5, 'Login', 1, '2', '/', 'fas fa-address-card fa-spin', '1', 'External', 'login', ''),
(6, 'Services', 5, '2', '/services', 'fas fa-cogs', '1', 'Internal', 'services', ''),
(7, 'Add Funds', 6, '2', '/addfunds', 'fas fa-credit-card', '1', 'Internal', 'addfunds', ''),
(8, 'Api', 8, '2', '/api', 'fas fa-code', '1', 'Internal', 'api', ''),
(9, 'Tickets ', 7, '2', '/tickets', 'fas fa-headset', '1', 'Internal', 'tickets', ''),
(10, 'Child Panels', 9, '2', '/child-panels', 'fas fa-child', '1', 'Internal', 'child-panels', 'Shown only if child panels selling enabled'),
(11, 'Refer & Earn', 10, '2', '/refer', 'fas fa-bezier-curve', '1', 'Internal', 'refer', 'Shown only if affiliate system enabled for use'),
(13, 'Terms', 11, '2', '/terms', 'fas fa-exclamation-triangle', '1', 'Internal', 'terms', ''),
(14, 'Signup ', 2, '2', '/signup', 'fas fa-arrow-right', '1', 'External', 'signup', 'Shown only if Signup system enabled for use'),
(15, 'Api', 4, '2', '/api', 'fas fa-code', '1', 'External', 'api', ''),
(17, 'Updates', 12, '2', '/updates', 'fas fa-bell', '1', 'Internal', '', 'Shown only if Updates System enabled'),
(18, 'Terms', 3, '2', '/terms', 'fas fa-exclamation-triangle', '1', 'External', 'terms', ''),
(29, 'Services', 14, '2', '/service/USD', 'fas fa-clipboard-list', '1', 'External', '', ''),
(30, 'About Us', 15, '2', '/about-us', 'fa-thin fa-user-secret', '1', 'External', 'about-us', ''),
(41, 'Theme', 16, '2', '/psw_theme', 'fas fa-child', '1', 'Internal', 'psw_theme', '');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `news_icon` varchar(225) NOT NULL,
  `news_title` varchar(225) NOT NULL,
  `news_content` varchar(225) NOT NULL,
  `news_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notifications_popup`
--

CREATE TABLE `notifications_popup` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `action_link` text NOT NULL,
  `isAllPage` enum('0','1') NOT NULL DEFAULT '0',
  `isAllUser` enum('1','0') NOT NULL DEFAULT '0',
  `expiry_date` date NOT NULL,
  `status` enum('1','2','0') NOT NULL DEFAULT '1',
  `allPages` varchar(225) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `image_file` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `api_orderid` int(11) NOT NULL DEFAULT 0,
  `order_error` text NOT NULL,
  `order_detail` text DEFAULT NULL,
  `order_api` int(11) NOT NULL DEFAULT 0,
  `api_serviceid` int(11) NOT NULL DEFAULT 0,
  `api_charge` double NOT NULL DEFAULT 0,
  `api_currencycharge` double DEFAULT 1,
  `order_profit` double NOT NULL,
  `order_quantity` double NOT NULL,
  `order_extras` text NOT NULL,
  `order_charge` double NOT NULL,
  `dripfeed` enum('1','2','3') DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_id` double NOT NULL DEFAULT 0,
  `subscriptions_id` double NOT NULL DEFAULT 0,
  `subscriptions_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_totalcharges` double DEFAULT NULL,
  `dripfeed_runs` double DEFAULT NULL,
  `dripfeed_delivery` double NOT NULL DEFAULT 0,
  `dripfeed_interval` double DEFAULT NULL,
  `dripfeed_totalquantity` double DEFAULT NULL,
  `dripfeed_status` enum('active','completed','canceled') NOT NULL DEFAULT 'active',
  `order_url` text NOT NULL,
  `order_start` double NOT NULL DEFAULT 0,
  `order_finish` double NOT NULL DEFAULT 0,
  `order_remains` double NOT NULL DEFAULT 0,
  `order_create` datetime NOT NULL,
  `order_status` enum('pending','inprogress','completed','partial','processing','psw','canceled') NOT NULL DEFAULT 'pending',
  `subscriptions_status` enum('active','paused','completed','canceled','expired','limit') NOT NULL DEFAULT 'active',
  `subscriptions_username` text DEFAULT NULL,
  `subscriptions_posts` double DEFAULT NULL,
  `subscriptions_delivery` double NOT NULL DEFAULT 0,
  `subscriptions_delay` double DEFAULT NULL,
  `subscriptions_min` double DEFAULT NULL,
  `subscriptions_max` double DEFAULT NULL,
  `subscriptions_expiry` date DEFAULT NULL,
  `last_check` datetime NOT NULL,
  `order_where` enum('site','api') NOT NULL DEFAULT 'site',
  `refill_status` enum('Pending','Refilling','Completed','Rejected','Error') NOT NULL DEFAULT 'Pending',
  `is_refill` enum('1','2') NOT NULL DEFAULT '1',
  `refill` varchar(225) NOT NULL DEFAULT '1',
  `cancelbutton` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 -> ON, 2 -> OFF',
  `show_refill` enum('true','false') NOT NULL DEFAULT 'true',
  `api_refillid` double NOT NULL DEFAULT 0,
  `avg_done` enum('0','1') NOT NULL DEFAULT '1',
  `order_increase` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `client_id`, `service_id`, `api_orderid`, `order_error`, `order_detail`, `order_api`, `api_serviceid`, `api_charge`, `api_currencycharge`, `order_profit`, `order_quantity`, `order_extras`, `order_charge`, `dripfeed`, `dripfeed_id`, `subscriptions_id`, `subscriptions_type`, `dripfeed_totalcharges`, `dripfeed_runs`, `dripfeed_delivery`, `dripfeed_interval`, `dripfeed_totalquantity`, `dripfeed_status`, `order_url`, `order_start`, `order_finish`, `order_remains`, `order_create`, `order_status`, `subscriptions_status`, `subscriptions_username`, `subscriptions_posts`, `subscriptions_delivery`, `subscriptions_delay`, `subscriptions_min`, `subscriptions_max`, `subscriptions_expiry`, `last_check`, `order_where`, `refill_status`, `is_refill`, `refill`, `cancelbutton`, `show_refill`, `api_refillid`, `avg_done`, `order_increase`) VALUES
(25, 1, 1, 0, '-', NULL, 0, 0, 0, 1, 0.1, 100, '', 0.1, '1', 0, 0, '1', NULL, NULL, 0, NULL, NULL, 'active', 'https://youtu.be/eNLOCzPeJn0', 0, 0, 0, '2022-08-16 12:42:10', 'pending', 'active', NULL, NULL, 0, NULL, NULL, NULL, NULL, '2022-08-16 12:42:10', 'site', 'Pending', '1', '1', '1', 'true', 0, '1', 0),
(26, 1, 1, 0, '-', NULL, 0, 0, 0, 1, 0.001, 1, '', 0.001, '1', 0, 0, '1', NULL, NULL, 0, NULL, NULL, 'active', 'https://youtu.be/eNLOCzPeJn0', 0, 0, 0, '2022-08-16 12:43:50', 'pending', 'active', NULL, NULL, 0, NULL, NULL, NULL, NULL, '2022-08-16 12:43:50', 'site', 'Pending', '1', '1', '1', 'true', 0, '1', 0),
(57, 26, 1, 0, '-', NULL, 0, 0, 0, 1, 0, 200, '', 0, '1', 0, 0, '1', NULL, NULL, 0, NULL, NULL, 'active', 'Jwisks', 0, 0, 0, '2022-09-20 21:44:15', 'completed', 'active', NULL, NULL, 0, NULL, NULL, NULL, NULL, '2022-09-20 21:44:45', 'site', 'Pending', '1', '1', '1', 'true', 0, '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `page_name` varchar(225) NOT NULL,
  `page_get` varchar(225) NOT NULL,
  `page_content` text NOT NULL,
  `page_status` enum('1','2') NOT NULL DEFAULT '1',
  `active` enum('1','2') NOT NULL DEFAULT '1',
  `seo_title` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `seo_keywords` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `seo_description` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `last_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `page_name`, `page_get`, `page_content`, `page_status`, `active`, `seo_title`, `seo_keywords`, `seo_description`, `last_modified`) VALUES
(2, 'Add funds', 'addfunds', '', '2', '1', 'ADD FUNDS', 'Best Smm Panel, Cheapest Smm Panel, Smm Panel India, Cheap Smm Panel, Fastest SMM Panel, Fastest SMM Reseller Panel, Targeted SMM panel, Cheapest & the Best SMM Panel, SOCIAL MEDIA MARKETING PANEL, The World Cheapest SMM Rese', 'Best Smm Panel, Cheapest Smm Panel, Smm Panel India, Cheap Smm Panel, Fastest SMM Panel, Fastest SMM Reseller Panel, Targeted SMM panel, Cheapest & the Best SMM Panel, SOCIAL MEDIA MARKETING PANEL, The World Cheapest SMM Rese', '2022-04-25 09:25:01'),
(3, 'Affiliates', 'refer', '', '2', '1', 'REFER AND EARN', 'Best Smm Panel, Cheapest Smm Panel, Smm Panel India, Cheap Smm Panel, Fastest SMM Panel, Fastest SMM Reseller Panel, Targeted SMM panel, Cheapest & the Best SMM Panel, SOCIAL MEDIA MARKETING PANEL, The World Cheapest SMM Rese', 'Best Smm Panel, Cheapest Smm Panel, Smm Panel India, Cheap Smm Panel, Fastest SMM Panel, Fastest SMM Reseller Panel, Targeted SMM panel, Cheapest & the Best SMM Panel, SOCIAL MEDIA MARKETING PANEL, The World Cheapest SMM Rese', '2022-04-25 09:25:28'),
(4, 'Api', 'api', '', '2', '1', '', '', '', '0000-00-00 00:00:00'),
(5, 'Blog', 'blog', '', '2', '1', '', '', '', '0000-00-00 00:00:00'),
(6, 'Login', 'auth', '', '2', '1', '', '', '', '0000-00-00 00:00:00'),
(7, 'Child Panels', 'child-panels', '', '2', '1', '', '', '', '0000-00-00 00:00:00'),
(8, 'Mass Order', 'massorder', '', '2', '1', '', '', '', '0000-00-00 00:00:00'),
(9, 'New Order', 'neworder', '<p><span style=\"font-family: &quot;Comic Sans MS&quot;;\">﻿</span><span style=\"font-family: &quot;Comic Sans MS&quot;;\">This Is Psw V3 Built By Psw</span><br></p>', '1', '1', 'PSW NEW-ORDER   perfectsmmworld.com', 'Best Smm Panel, Cheapest Smm Panel, Smm Panel India, Cheap Smm Panel, Fastest SMM Panel, Fastest SMM Reseller Panel, Targeted SMM panel, Cheapest & the Best SMM Panel, SOCIAL MEDIA MARKETING PANEL, The World Cheapest SMM Rese', 'Best Smm Panel, Cheapest Smm Panel, Smm Panel India, Cheap Smm Panel, Fastest SMM Panel, Fastest SMM Reseller Panel, Targeted SMM panel, Cheapest & the Best SMM Panel, SOCIAL MEDIA MARKETING PANEL, The World Cheapest SMM Rese', '2022-07-14 08:15:18'),
(10, 'Orders', 'orders', '', '2', '1', '', '', '', '0000-00-00 00:00:00'),
(11, 'Refill', 'refill', '', '2', '1', '', '', '', '0000-00-00 00:00:00'),
(12, 'Services', 'services', '', '1', '1', '', '', '', '0000-00-00 00:00:00'),
(13, 'Sign Up', 'signup', '', '2', '1', '', '', '', '0000-00-00 00:00:00'),
(14, 'Terms', 'terms', '<ol style=\"margin-bottom: 1rem; color: rgb(51, 78, 110); font-family: Barlow, sans-serif;\"><li>By placing an order with our panel, you automatically accept all the below-listed terms of service weather you read them or not.</li><li>We reserve the right to change these Terms of Service without notice. You are expected to read all terms of service before placing every order to ensure you are up to date with any changes or any future changes.</li><li>You will only use the our website in a manner which follows all agreements made with all the social media websites on their individual Terms of Service page.</li><li>Our rates are subject to change at any time without notice. The terms stay in effect in the case of rate changes.</li><li>We do not guarantee a delivery time for any services. We offer our best estimation for when the order will be delivered. This is only an estimation and we will not refund orders that are processing if you feel they are taking too long.</li><li>We are trying hard to deliver exactly what is expected from us by our re-sellers. In this case, we reserve the right to change a service type if we believe it necessary to complete an order.</li></ol>', '1', '1', '', '', '', '2022-04-27 09:22:05'),
(784, 'About Us', 'about-us', '<h1 class=\"banner-text\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: \"open sans\", sans-serif; font-weight: 600; line-height: 1.2; color: rgb(0, 0, 0); font-size: 2.5rem; background-color: rgb(242, 242, 242);\">Hi! We\'re Members Of <br style=\"margin: 0px; padding: 0px;\">PSWV3 DEV. TEAM!</h1><br style=\"margin: 0px; padding: 0px; color: rgb(31, 35, 36); font-family: \"open sans\", sans-serif; background-color: rgb(242, 242, 242);\"><p class=\"banner-text\" style=\"margin-bottom: 0px; padding: 0px; line-height: 24px; font-family: \"source sans pro\", sans-serif; background-color: rgb(242, 242, 242);\">We are a #1 global Social Media Marketing panel, helping businesses and individuals gain followers and likes, increase their reach and engagement, and even go viral in the wide world of social media!<br style=\"margin: 0px; padding: 0px;\"><br style=\"margin: 0px; padding: 0px;\">We\'re passionate about all things social media and have a team of incredibly skilled SMM experts to bring you the best quality services in helping you reach your social media goals.<br style=\"margin: 0px; padding: 0px;\"><br style=\"margin: 0px; padding: 0px;\">Our mission is to make everyone\'s voice heard online.</p>', '1', '1', '', '', '', '2022-07-03 03:44:52'),
(785, 'Theme', 'psw_theme', '<p>PSW V3 COLOUR CHANGE</p><p><br></p>', '1', '1', '', '', '', '2022-08-03 12:14:36');

-- --------------------------------------------------------

--
-- Table structure for table `panel_info`
--

CREATE TABLE `panel_info` (
  `panel_id` int(11) NOT NULL,
  `psw_id` int(11) NOT NULL,
  `panel_domain` text COLLATE utf8_unicode_ci NOT NULL,
  `panel_plan` text COLLATE utf8_unicode_ci NOT NULL,
  `panel_status` text COLLATE utf8_unicode_ci NOT NULL,
  `panel_limit_order` int(11) NOT NULL,
  `panel_orders` int(11) NOT NULL,
  `panel_thismonthorders` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `api_key` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `renewal_date` date NOT NULL,
  `panel_type` enum('Child','Main') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Main'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `panel_info`
--

INSERT INTO `panel_info` (`panel_id`, `psw_id`, `panel_domain`, `panel_plan`, `panel_status`, `panel_limit_order`, `panel_orders`, `panel_thismonthorders`, `date_created`, `api_key`, `renewal_date`, `panel_type`) VALUES
(1, 1, '', '', 'active', 2147483647, 0, 0, '2022-08-07 12:18:56', '', '2029-09-03', 'Main');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `client_balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment_amount` decimal(15,4) NOT NULL,
  `payment_privatecode` double DEFAULT NULL,
  `payment_method` int(11) NOT NULL,
  `payment_status` enum('1','2','3') NOT NULL DEFAULT '1',
  `payment_delivery` enum('1','2') NOT NULL DEFAULT '1',
  `payment_note` varchar(255) NOT NULL DEFAULT 'No',
  `payment_mode` enum('Manuel','Otomatik','Auto') NOT NULL DEFAULT 'Otomatik',
  `payment_create_date` datetime NOT NULL,
  `payment_update_date` datetime NOT NULL,
  `payment_ip` varchar(225) NOT NULL,
  `payment_extra` text NOT NULL,
  `payment_bank` int(11) NOT NULL,
  `t_id` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `client_id`, `client_balance`, `payment_amount`, `payment_privatecode`, `payment_method`, `payment_status`, `payment_delivery`, `payment_note`, `payment_mode`, `payment_create_date`, `payment_update_date`, `payment_ip`, `payment_extra`, `payment_bank`, `t_id`) VALUES
(1, 26, '0.00', '1000.0000', NULL, 1, '3', '2', '', 'Manuel', '2022-09-20 21:42:22', '2022-09-20 21:42:22', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments_bonus`
--

CREATE TABLE `payments_bonus` (
  `bonus_id` int(11) NOT NULL,
  `bonus_method` int(11) NOT NULL,
  `bonus_from` double NOT NULL,
  `bonus_amount` double NOT NULL,
  `bonus_type` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `method_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `method_get` varchar(225) NOT NULL,
  `method_min` double NOT NULL,
  `method_max` double NOT NULL,
  `method_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF	',
  `method_extras` text NOT NULL,
  `method_line` double NOT NULL,
  `nouse` enum('1','2') NOT NULL DEFAULT '2',
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `method_name`, `method_get`, `method_min`, `method_max`, `method_type`, `method_extras`, `method_line`, `nouse`, `content`) VALUES
(1, 'Paypal', 'paypal', 10, 10000, '1', '{\"method_type\":\"2\",\"name\":\"Paypal ( USD ) ( International Payments ) [ 10% Charge ]\",\"min\":\"10\",\"max\":\"10000\",\"client_id\":\"AR3wtI3dxA0qU2dme-kQdC6csRL4whF8SNWzJ2jilchyZvQsBJ7URF4UqktveDp67guIenYYX-e0zuCz\",\"client_secret\":\"EMFtatHjrBMf9EYcec0WZqKwGwO2aum03w62b9tZZWPB2G__WoFuBMkMu0z97NR8ooRJNXR0FqrtagrD\",\"fee\":\"10\"}', 1, '2', 'hello'),
(2, 'Stripe', 'stripe', 1, 100, '1', '{\"method_type\":\"2\",\"name\":\"Stripe\",\"min\":\"1\",\"max\":\"100\",\"stripe_publishable_key\":\"pk_live_51HiUnRLjkQAtcIW0F983imoO8qhftSSMSj7oB9xTjGHB51su6vnuDmGNs5l2NNZz1XE1Ogf1svxqjtdasRYr3atk00wEAHHKNT\",\"stripe_secret_key\":\"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\",\"stripe_webhooks_secret\":\"whsec_gSvhMz0eOIOTk5S9uzzzDgpHeclOmiDe\",\"fee\":\"10\",\"currency\":\"USD\"}', 8, '2', ''),
(3, 'Shopier', 'shopier', 5, 0, '1', '{\"method_type\":\"1\",\"name\":\"Kredi \\/ Banka Kart\\u0131 ile \\u00d6de\",\"min\":\"5\",\"max\":\"0\",\"apiKey\":\"\",\"apiSecret\":\"\",\"website_index\":\"1\",\"processing_fee\":\"1\",\"fee\":\"10\",\"currency\":\"USD\"}', 9, '2', ''),
(5, 'Paywant', 'paywant', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Paywant\",\"min\":\"1\",\"max\":\"0\",\"apiKey\":\"\",\"apiSecret\":\"\",\"fee\":\"0\",\"currency\":\"USD\",\"commissionType\":\"2\",\"payment_type\":[\"1\",\"2\",\"3\"]}', 10, '2', ''),
(7, 'PayTR', 'paytr', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Paytr\",\"min\":\"1\",\"max\":\"0\",\"merchant_id\":\"\",\"merchant_key\":\"\",\"merchant_salt\":\"\",\"fee\":\"0\",\"currency\":\"USD\"}', 11, '2', ''),
(8, 'Coinpayments', 'coinpayments', 10, 0, '1', '{\"method_type\":\"2\",\"name\":\"CoinPayments ( Cryptocurrency )\",\"min\":\"10\",\"max\":\"0\",\"coinpayments_public_key\":\"5a6f3154ddf28c2017df7ad00ce5c1f2b872822beb1ed32f52e0009a2425ecfd\",\"coinpayments_private_key\":\"da16CB5D8Ce6d90eD7181b5907F2103739ef0D5dbF591Ddf22d8f93649170E2F\",\"coinpayments_currency\":\"BTC\",\"merchant_id\":\"db74662404abc41263c87ed221718ce3\",\"ipn_secret\":\"5566\",\"fee\":\"0\",\"currency\":\"USD\"}', 6, '2', ''),
(9, '2checkout', '2checkout', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"2checkout\",\"min\":\"1\",\"max\":\"0\",\"seller_id\":\"\",\"private_key\":\"\",\"fee\":\"1\",\"currency\":\"USD\"}', 12, '2', ''),
(10, 'Payoneer', 'payoneer', 1, 0, '1', '{\"method_type\":\"2\",\"name\":\"Payoneer\",\"email\":\"fazilakbulut@outlook.com\"}', 13, '2', ''),
(11, 'Mollie', 'mollie', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Mollie\",\"min\":\"1\",\"max\":\"0\",\"live_api_key\":\"\",\"fee\":\"0\",\"currency\":\"USD\"}', 14, '2', ''),
(12, 'PayTM', 'paytm', 10, 100000, '1', '{\"method_type\":\"2\",\"name\":\"PayTM ( INR )( UPI \\/ NET BANKING \\/ DEBIT \\/ CREDIT CARD)\",\"min\":\"10\",\"max\":\"100000\",\"merchant_key\":\"IR6iRT5L0tOxBte4\",\"merchant_mid\":\"gVkWqH50536759745964\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\",\"currency\":\"\"}', 1, '2', ''),
(13, 'Instamojo', 'instamojo', 0, 0, '1', '{\"method_type\":\"2\",\"name\":\"Instamojo\",\"min\":\"0\",\"max\":\"0\",\"api_key\":\"a2bdf5035c16ad6db389caeb5ceb5273\",\"live_auth_token_key\":\"81ef2affdc5ecfde9b88b13e1cd67cd8\",\"fee\":\"0\",\"currency\":\"INR\"}', 15, '2', ''),
(14, 'Paytm Business', 'paytmqr', 10, 1000000, '2', '{\"method_type\":\"2\",\"name\":\"Paytm Qr \\/ Phonepe  \\/ Gpay\",\"min\":\"10\",\"max\":\"1000000\",\"merchant_key\":\"https:\\/\\/i.imgur.com\\/mlAI1qX.png\",\"merchant_mid\":\"SLNZmv45651596021154\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\"}', 2, '2', ''),
(15, 'Razorpay', 'razorpay', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Razorpay\",\"min\":\"1\",\"max\":\"0\",\"api_key\":\"0\",\"api_secret_key\":\"0\",\"fee\":\"0\",\"currency\":\"INR\"}', 16, '2', ''),
(16, 'Iyzico', 'iyzico', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Iyzico\",\"min\":\"1\",\"max\":\"0\",\"api_key\":\"0\",\"api_secret_key\":\"0\",\"fee\":\"0\",\"currency\":\"USD\"}', 17, '2', ''),
(17, 'Authorize.net', 'authorize-net', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Authorize.net\",\"min\":\"1\",\"max\":\"0\",\"api_login_id\":\"0\",\"secret_transaction_key\":\"0\",\"fee\":\"0\",\"currency\":\"USD\"}', 18, '2', ''),
(20, 'Ravepay', 'ravepay', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Ravepay\",\"min\":\"1\",\"max\":\"0\",\"public_api_key\":\"0\",\"secret_api_key\":\"0\",\"fee\":\"0\",\"currency\":\"USD\"}', 20, '2', ''),
(21, 'Pagseguro', 'pagseguro', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Pagseguro\",\"min\":\"1\",\"max\":\"0\",\"email_id\":\"0\",\"live_production_token\":\"0\",\"fee\":\"0\",\"currency\":\"USD\"}', 21, '2', ''),
(22, 'Cashmaal', 'Cashmaal', 10, 10000, '1', '{\"method_type\":\"2\",\"name\":\"CashMaal (USD)(JAZZCASH)(EASYPAISA)\",\"min\":\"10\",\"max\":\"10000\",\"web_id\":\"5396\",\"fee\":\"0\",\"currency\":\"USD\"}', 7, '2', ''),
(25, 'Refer & earn', 'refer', 0, 0, '1', '{\"method_type\":\"2\",\"name\":\"Do Not Use\",\"min\":\"1\",\"max\":\"10000\",\"merchant_key\":\"P#n%aKfB3&DRAMqH\",\"merchant_mid\":\"DBWvgX98800736620578\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\",\"currency\":\"\"}', 25, '1', ''),
(26, 'payumoney', 'payumoney', 1, 100000, '1', '{\"method_type\":\"2\",\"name\":\"Payumoney\",\"min\":\"1\",\"max\":\"100000\",\"merchant_key\":\"9G585p\",\"salt_key\":\"kdIKldPstvQIDB2uO0SgptbtTHCUfPLX\",\"fee\":\"10\",\"currency\":\"INR\"}', 19, '2', ''),
(30, 'Freebalance', 'Freebalance', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Freebalance\",\"min\":\"1\",\"max\":\"0\",\"merchant_id\":\"\",\"merchant_key\":\"\",\"merchant_salt\":\"\",\"fee\":\"0\"}', 30, '1', ''),
(31, 'Perfect Money', 'perfectmoney', 5, 0, '1', '{\"method_type\":\"2\",\"name\":\"Perfect Money ( USD ) (MIN 5)\",\"min\":\"5\",\"max\":\"0\",\"passphrase\":\"Manbir25@\",\"usd\":\"U31731375\",\"merchant_website\":\"Viralsmmpanel.com\",\"fee\":\"0\"}', 2, '2', ''),
(32, 'Coinbase', 'Coinbase', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Coinbase ( Cryptocurrency )\",\"min\":\"1\",\"max\":\"0\",\"api_key\":\"\",\"webhook_api\":\"\",\"fee\":\"0\"}', 22, '2', ''),
(33, 'Webmoney', 'Webmoney', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Webmoney\",\"min\":\"1\",\"max\":\"0\",\"wmid\":\"\",\"purse\":\"\",\"fee\":\"0\"}', 23, '2', ''),
(34, 'UnitPay', 'UnityPay', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"UnitPay\",\"min\":\"1\",\"max\":\"0\",\"secret_key\":\"\",\"reg_email\":\"\",\"fee\":\"0\"}', 24, '2', ''),
(35, 'Payeer', 'payeer', 10, 0, '1', '{\"method_type\":\"2\",\"name\":\"Payeer ( Paypal + Cryptocurrency + Skrill + Debit\\/Credit Cards + Bank + and more)\",\"min\":\"10\",\"max\":\"0\",\"client_secret\":\"NmjYQjAhbv0SFvoj\",\"m_shop\":\"1600076082\"}', 3, '2', '');

-- --------------------------------------------------------

--
-- Table structure for table `referral`
--

CREATE TABLE `referral` (
  `referral_id` int(11) NOT NULL,
  `referral_client_id` int(11) NOT NULL,
  `referral_clicks` double NOT NULL DEFAULT 0,
  `referral_sign_up` double NOT NULL DEFAULT 0,
  `referral_totalFunds_byReffered` double NOT NULL DEFAULT 0,
  `referral_earned_commision` double DEFAULT 0,
  `referral_requested_commision` varchar(225) DEFAULT '0',
  `referral_total_commision` double DEFAULT 0,
  `referral_status` enum('1','2') NOT NULL DEFAULT '1',
  `referral_code` text NOT NULL,
  `referral_rejected_commision` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `referral`
--

INSERT INTO `referral` (`referral_id`, `referral_client_id`, `referral_clicks`, `referral_sign_up`, `referral_totalFunds_byReffered`, `referral_earned_commision`, `referral_requested_commision`, `referral_total_commision`, `referral_status`, `referral_code`, `referral_rejected_commision`) VALUES
(1, 1, 0, 0, 0, 0, '0', 0, '1', 'dea955', 0),
(2, 2, 0, 0, 0, 0, '0', 0, '1', '7ea0e7', 0),
(3, 3, 0, 0, 0, 0, '0', 0, '1', '772650', 0),
(4, 4, 0, 0, 0, 0, '0', 0, '1', 'ebbbb7', 0),
(5, 5, 0, 0, 0, 0, '0', 0, '1', 'dae328', 0),
(6, 6, 0, 0, 0, 0, '0', 0, '1', '1c5c56', 0),
(7, 7, 0, 0, 0, 0, '0', 0, '1', '1e2f5e', 0),
(8, 8, 0, 0, 0, 0, '0', 0, '1', '4d3ce6', 0),
(9, 9, 0, 0, 0, 0, '0', 0, '1', '37f489', 0),
(10, 10, 0, 0, 0, 0, '0', 0, '1', '8eb305', 0),
(11, 11, 0, 0, 0, 0, '0', 0, '1', '03f39e', 0),
(12, 12, 0, 0, 0, 0, '0', 0, '1', 'b6b673', 0),
(13, 13, 0, 0, 0, 0, '0', 0, '1', 'ff360b', 0),
(14, 14, 0, 0, 0, 0, '0', 0, '1', 'c0b427', 0),
(15, 15, 0, 0, 0, 0, '0', 0, '1', '6e508c', 0),
(16, 16, 0, 0, 0, 0, '0', 0, '1', '0510b0', 0),
(17, 17, 0, 0, 0, 0, '0', 0, '1', '11a3e3', 0),
(18, 18, 0, 0, 0, 0, '0', 0, '1', '1ec579', 0),
(19, 19, 0, 0, 0, 0, '0', 0, '1', '281c8e', 0),
(20, 20, 0, 0, 0, 0, '0', 0, '1', 'eab9e2', 0),
(21, 21, 0, 0, 0, 0, '0', 0, '1', '5c929d', 0),
(22, 22, 0, 0, 0, 0, '0', 0, '1', '5a7538', 0),
(23, 23, 0, 0, 0, 0, '0', 0, '1', '769dcb', 0),
(24, 24, 0, 0, 0, 0, '0', 0, '1', 'ec3a46', 0),
(25, 25, 0, 0, 0, 0, '0', 0, '1', '7693e7', 0),
(26, 26, 0, 0, 0, 0, '0', 0, '1', '3801d6', 0),
(27, 27, 0, 0, 0, 0, '0', 0, '1', 'cfd774', 0),
(28, 28, 0, 0, 0, 0, '0', 0, '1', 'acb258', 0);

-- --------------------------------------------------------

--
-- Table structure for table `referral_payouts`
--

CREATE TABLE `referral_payouts` (
  `r_p_id` int(11) NOT NULL,
  `r_p_code` text NOT NULL,
  `r_p_status` enum('1','2','3','4','0') NOT NULL DEFAULT '0',
  `r_p_amount_requested` double NOT NULL,
  `r_p_requested_at` datetime NOT NULL,
  `r_p_updated_at` datetime NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `referral_payouts`
--

INSERT INTO `referral_payouts` (`r_p_id`, `r_p_code`, `r_p_status`, `r_p_amount_requested`, `r_p_requested_at`, `r_p_updated_at`, `client_id`) VALUES
(1, '1ec579', '0', 0, '2022-08-30 01:22:18', '2022-08-30 01:22:18', 0);

-- --------------------------------------------------------

--
-- Table structure for table `refill_status`
--

CREATE TABLE `refill_status` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `refill_apiid` int(11) DEFAULT NULL,
  `order_url` text NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  `ending_date` date DEFAULT NULL,
  `service_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `refill_status` enum('Pending','Refilling','Completed','Rejected','Error') DEFAULT 'Pending',
  `order_apiid` int(11) DEFAULT 0,
  `refill_response` text DEFAULT NULL,
  `refill_where` enum('site','api') DEFAULT 'site'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `serviceapi_alert`
--

CREATE TABLE `serviceapi_alert` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `serviceapi_alert` text NOT NULL,
  `servicealert_extra` text NOT NULL,
  `servicealert_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_api` int(11) NOT NULL DEFAULT 0,
  `api_service` int(11) NOT NULL DEFAULT 0,
  `api_servicetype` enum('1','2') NOT NULL DEFAULT '2',
  `api_detail` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `service_line` double NOT NULL,
  `service_type` enum('1','2') NOT NULL DEFAULT '2',
  `service_package` enum('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17') NOT NULL,
  `service_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `service_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `service_price` varchar(225) NOT NULL,
  `service_min` double NOT NULL,
  `service_max` double NOT NULL,
  `service_dripfeed` enum('1','2') NOT NULL DEFAULT '1',
  `service_autotime` double NOT NULL DEFAULT 0,
  `service_autopost` double NOT NULL DEFAULT 0,
  `service_speed` enum('1','2','3','4') NOT NULL,
  `want_username` enum('1','2') NOT NULL DEFAULT '1',
  `service_secret` enum('1','2') NOT NULL DEFAULT '2',
  `price_type` enum('normal','percent','amount') NOT NULL DEFAULT 'normal',
  `price_cal` text DEFAULT NULL,
  `instagram_second` enum('1','2') NOT NULL DEFAULT '2',
  `start_count` enum('none','instagram_follower','instagram_photo','') NOT NULL,
  `instagram_private` enum('1','2') NOT NULL,
  `name_lang` varchar(225) DEFAULT 'en',
  `description_lang` text DEFAULT NULL,
  `time_lang` varchar(225) NOT NULL DEFAULT 'Not enough data',
  `time` varchar(225) NOT NULL DEFAULT 'Not enough data',
  `cancelbutton` enum('1','2') NOT NULL DEFAULT '2' COMMENT '1 -> ON, 2 -> OFF',
  `show_refill` enum('true','false') NOT NULL DEFAULT 'false',
  `service_profit` varchar(225) NOT NULL,
  `refill_days` varchar(225) NOT NULL DEFAULT '30',
  `refill_hours` varchar(225) NOT NULL DEFAULT '24',
  `avg_days` int(11) NOT NULL,
  `avg_hours` int(11) NOT NULL,
  `avg_minutes` int(11) NOT NULL,
  `avg_many` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_api`, `api_service`, `api_servicetype`, `api_detail`, `category_id`, `service_line`, `service_type`, `service_package`, `service_name`, `service_description`, `service_price`, `service_min`, `service_max`, `service_dripfeed`, `service_autotime`, `service_autopost`, `service_speed`, `want_username`, `service_secret`, `price_type`, `price_cal`, `instagram_second`, `start_count`, `instagram_private`, `name_lang`, `description_lang`, `time_lang`, `time`, `cancelbutton`, `show_refill`, `service_profit`, `refill_days`, `refill_hours`, `avg_days`, `avg_hours`, `avg_minutes`, `avg_many`) VALUES
(1, 0, 0, '2', '', 1, 1, '2', '1', 'psw', NULL, '0', 1, 200, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"psw\"}', NULL, 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0),
(2, 0, 0, '2', '', 1, 2, '2', '1', 'Oo', NULL, '12', 123, 10000, '1', 0, 0, '4', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Oo\"}', NULL, 'Not enough data', 'Not enough data', '1', 'true', '', '30', '24', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `service_api`
--

CREATE TABLE `service_api` (
  `id` int(11) NOT NULL,
  `api_name` varchar(225) NOT NULL,
  `api_url` text NOT NULL,
  `api_key` varchar(225) NOT NULL,
  `api_type` int(11) NOT NULL,
  `api_limit` double NOT NULL DEFAULT 0,
  `currency` enum('INR','USD') DEFAULT NULL,
  `api_alert` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> Gönder, 1 -> Gönderildi',
  `status` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `site_seo` text NOT NULL,
  `site_title` text DEFAULT NULL,
  `site_description` text DEFAULT NULL,
  `site_keywords` text DEFAULT NULL,
  `site_logo` text DEFAULT NULL,
  `site_name` text DEFAULT NULL,
  `site_currency` varchar(2555) NOT NULL DEFAULT 'try',
  `favicon` text DEFAULT NULL,
  `site_language` varchar(225) NOT NULL DEFAULT 'tr',
  `site_theme` text NOT NULL,
  `site_theme_alt` text DEFAULT NULL,
  `recaptcha` enum('1','2') NOT NULL DEFAULT '1',
  `recaptcha_key` text DEFAULT NULL,
  `recaptcha_secret` text DEFAULT NULL,
  `custom_header` text DEFAULT NULL,
  `custom_footer` text DEFAULT NULL,
  `ticket_system` enum('1','2') NOT NULL DEFAULT '2',
  `register_page` enum('1','2') NOT NULL DEFAULT '2',
  `service_speed` enum('1','2') NOT NULL,
  `service_list` enum('1','2') NOT NULL,
  `dolar_charge` double NOT NULL,
  `euro_charge` double NOT NULL,
  `smtp_user` text NOT NULL,
  `smtp_pass` text NOT NULL,
  `smtp_server` text NOT NULL,
  `smtp_port` varchar(225) NOT NULL,
  `smtp_protocol` enum('0','ssl','tls') NOT NULL,
  `alert_type` enum('1','2','3') NOT NULL,
  `alert_apimail` enum('1','2') NOT NULL,
  `alert_newmanuelservice` enum('1','2') NOT NULL,
  `alert_newticket` enum('1','2') NOT NULL,
  `alert_apibalance` enum('1','2') NOT NULL,
  `alert_serviceapialert` enum('1','2') NOT NULL,
  `sms_provider` varchar(225) NOT NULL,
  `sms_title` varchar(225) NOT NULL,
  `sms_user` varchar(225) NOT NULL,
  `sms_pass` varchar(225) NOT NULL,
  `sms_validate` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1 -> OK, 0 -> NO',
  `admin_mail` varchar(225) NOT NULL,
  `admin_telephone` varchar(225) NOT NULL,
  `resetpass_page` enum('1','2') NOT NULL,
  `resetpass_sms` enum('1','2') NOT NULL,
  `resetpass_email` enum('1','2') NOT NULL,
  `site_maintenance` enum('1','2') NOT NULL DEFAULT '2',
  `servis_siralama` varchar(255) NOT NULL,
  `bronz_statu` int(11) NOT NULL,
  `silver_statu` int(11) NOT NULL,
  `gold_statu` int(11) NOT NULL,
  `bayi_statu` int(11) NOT NULL,
  `ns1` varchar(191) DEFAULT NULL,
  `ns2` varchar(191) DEFAULT NULL,
  `childpanel_price` double DEFAULT NULL,
  `snow_effect` enum('1','2') NOT NULL DEFAULT '2',
  `snow_colour` text NOT NULL,
  `promotion` enum('1','2') DEFAULT '2',
  `referral_commision` double NOT NULL,
  `referral_payout` double NOT NULL,
  `referral_status` enum('1','2') NOT NULL DEFAULT '1',
  `childpanel_selling` enum('1','2') NOT NULL DEFAULT '1',
  `tickets_per_user` double NOT NULL DEFAULT 5,
  `name_fileds` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 -> ON, 2 -> NO',
  `skype_feilds` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 -> ON, 2 -> NO',
  `csymbol` text NOT NULL,
  `inr_symbol` text NOT NULL,
  `inr_value` double NOT NULL DEFAULT 0,
  `usd_symbol` text NOT NULL,
  `inr_convert` double NOT NULL DEFAULT 0,
  `otp_login` enum('1','2','0') NOT NULL DEFAULT '0',
  `auto_deactivate_payment` enum('1','2') NOT NULL DEFAULT '1',
  `service_avg_time` enum('1','0') NOT NULL DEFAULT '0',
  `alert_orderfail` enum('1','2') NOT NULL DEFAULT '2',
  `alert_welcomemail` enum('1','2') NOT NULL DEFAULT '2',
  `freebalance` enum('1','2') NOT NULL DEFAULT '1',
  `freeamount` double DEFAULT 0,
  `alert_newmessage` enum('1','2') NOT NULL DEFAULT '1',
  `email_confirmation` enum('1','2') NOT NULL DEFAULT '2',
  `psw_license` text NOT NULL,
  `licence_id` text NOT NULL,
  `psw_orders` text DEFAULT NULL,
  `resend_max` int(11) NOT NULL,
  `whatsappbutton` text NOT NULL,
  `whatsappnumber` text NOT NULL,
  `whatsappcolour` text NOT NULL,
  `theme_bg_img` text NOT NULL,
  `whatsappposition` text NOT NULL,
  `telegrambutton` text NOT NULL,
  `telegramusername` text NOT NULL,
  `telegramposition` text NOT NULL,
  `panel_status` text NOT NULL,
  `fake_order_min` int(11) NOT NULL,
  `fake_order_max` int(11) NOT NULL,
  `fake_order_after` int(11) NOT NULL,
  `fake_order` int(11) NOT NULL,
  `fake_order_fix` int(11) NOT NULL,
  `fake_ticket_min` int(11) NOT NULL,
  `fake_ticket_max` int(11) NOT NULL,
  `fake_ticket_after` int(11) NOT NULL,
  `fake_ticket` int(11) NOT NULL,
  `fake_ticket_fix` int(11) NOT NULL,
  `panel_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_seo`, `site_title`, `site_description`, `site_keywords`, `site_logo`, `site_name`, `site_currency`, `favicon`, `site_language`, `site_theme`, `site_theme_alt`, `recaptcha`, `recaptcha_key`, `recaptcha_secret`, `custom_header`, `custom_footer`, `ticket_system`, `register_page`, `service_speed`, `service_list`, `dolar_charge`, `euro_charge`, `smtp_user`, `smtp_pass`, `smtp_server`, `smtp_port`, `smtp_protocol`, `alert_type`, `alert_apimail`, `alert_newmanuelservice`, `alert_newticket`, `alert_apibalance`, `alert_serviceapialert`, `sms_provider`, `sms_title`, `sms_user`, `sms_pass`, `sms_validate`, `admin_mail`, `admin_telephone`, `resetpass_page`, `resetpass_sms`, `resetpass_email`, `site_maintenance`, `servis_siralama`, `bronz_statu`, `silver_statu`, `gold_statu`, `bayi_statu`, `ns1`, `ns2`, `childpanel_price`, `snow_effect`, `snow_colour`, `promotion`, `referral_commision`, `referral_payout`, `referral_status`, `childpanel_selling`, `tickets_per_user`, `name_fileds`, `skype_feilds`, `csymbol`, `inr_symbol`, `inr_value`, `usd_symbol`, `inr_convert`, `otp_login`, `auto_deactivate_payment`, `service_avg_time`, `alert_orderfail`, `alert_welcomemail`, `freebalance`, `freeamount`, `alert_newmessage`, `email_confirmation`, `psw_license`, `licence_id`, `psw_orders`, `resend_max`, `whatsappbutton`, `whatsappnumber`, `whatsappcolour`, `theme_bg_img`, `whatsappposition`, `telegrambutton`, `telegramusername`, `telegramposition`, `panel_status`, `fake_order_min`, `fake_order_max`, `fake_order_after`, `fake_order`, `fake_order_fix`, `fake_ticket_min`, `fake_ticket_max`, `fake_ticket_after`, `fake_ticket`, `fake_ticket_fix`, `panel_order`) VALUES
(1, 'PSW V3', 'PSW V3', 'Best Smm Panel, Cheapest Smm Panel, Smm Panel India, Cheap Smm Panel, Fastest SMM Panel, Fastest SMM Reseller Panel, Targeted SMM panel, Cheapest & the Best SMM Panel, SOCIAL MEDIA MARKETING PANEL, The World Cheapest SMM Reseller Panel, Cheapest SMM panel in India, Paytm SMM Panel, Unique YouTube Views, Best Smm panel for YouTube subscribe, Cheap SMM Panel For Snapchat Followers, Buy Instagram Followers, How to increase your social media followers, Buy and Increase Snapchat Friends Or Followers, How to Grow Your Business Using Social Media, How to promote your YouTube channel, Get Free Tik Tok Followers And Views Likes Comments, Buy Instagram story views, Buy Instagram followers, Buy Instagram likes, Buy Instagram views, Buy Instagram reel likes, Buy Instagram reel views, Buy Instagram Arab followers, Buy Instagram Arab likes, Buy Arab Instagram followers, Buy YouTube Views to Get Targeted Traffic, Buy YouTube Custom Comments, Buy Instagram Save And Reach, Buy Tiktok Real Likes, Buy Twitter Retweets, Where to buy Twitter followers, Buy Twitter followers, Buy Facebook Followers For Page Benefits, Buy Twitter Re tweets, Smm panel US, Best Smm Panel US, USA Smm Panel, US Smm Panel, Best Smm Panel in US, Best Smm Panel in USA, Smm Panel Usa, Smm panel Indonesia, Smmpanels, Smm panel Australia, Smm panel Aus, wholesale smm panel, Cheapest SMM Panel For Reseller, Smm reseller panel, Best Smm reseller panel, Cheapest PayTM Panel, Smm panel canada, Smm panel Croatia, Smm panel Qatar, Best smm panel Qatar, Smm panel Ukraine, Best smm panel Ukraine, Smm panel New Zealand, Best Smm panel New Zealand , YouTube Worldwide Social Shares, YouTube India Shares, YouTube Social Shares from Facebook, Twitter, Reddit, Pinterest, Tumbler, Smm Panel Brazil, Smm Panel Thailand, Smm Panel Vietnam, Smm Panel Philippines, Smm Panel Taiwan, Buy Telegram Members, Views and Vote likes, Buy Telegram Post views, Buy Twitch Livestream Views, Buy Linkedin likes followers love, Buy Spotify free plays, Buy Spotify premium plays, Spotify Saves, Buy Spotify followers, Buy Soundcloud plays followers comments, Buy Shazam views and plays, Buy Deezer Likes Followers fans, Buy Audiomack likes followers plays and reposts, Buy Viemo video views, Buy SEO Social Signals, Buy Quora views comments followers upvotes, Buy Onlyfans likes and Subscribers, buy website traffic, buy instagram followers india, smmpanel, Indian smm panel, Cheapsmmpanel, Indiansmm, smart panel, Smm panel script, Indiansmartpanel, Indian smm, Smm panels, Buy smm panel, Buy indian instagram followers, Smm services, Smm reseller panel, Buy facebook Likes india, Resellerspanel, Indian facebook likes, Buy instagram followers by paytm, Paytmsmm, free smm panel, Buy facebook page likes india, Smm india, Buy indian facebook likes Indian discord server, Pubg mobile discord server India, Pubg mobile official discord server, Discord server names, Pubg discord server, Discord server rules, How to join a discord server, How to delete a discord server, Discord server status', 'Best Smm Panel, Cheapest Smm Panel, Smm Panel India, Cheap Smm Panel, Fastest SMM Panel, Fastest SMM Reseller Panel, Targeted SMM panel, Cheapest & the Best SMM Panel, SOCIAL MEDIA MARKETING PANEL, The World Cheapest SMM Reseller Panel, Cheapest SMM panel in India, Paytm SMM Panel, Unique YouTube Views, Best Smm panel for YouTube subscribe, Cheap SMM Panel For Snapchat Followers, Buy Instagram Followers, How to increase your social media followers, Buy and Increase Snapchat Friends Or Followers, How to Grow Your Business Using Social Media, How to promote your YouTube channel, Get Free Tik Tok Followers And Views Likes Comments, Buy Instagram story views, Buy Instagram followers, Buy Instagram likes, Buy Instagram views, Buy Instagram reel likes, Buy Instagram reel views, Buy Instagram Arab followers, Buy Instagram Arab likes, Buy Arab Instagram followers, Buy YouTube Views to Get Targeted Traffic, Buy YouTube Custom Comments, Buy Instagram Save And Reach, Buy Tiktok Real Likes, Buy Twitter Retweets, Where to buy Twitter followers, Buy Twitter followers, Buy Facebook Followers For Page Benefits, Buy Twitter Re tweets, Smm panel US, Best Smm Panel US, USA Smm Panel, US Smm Panel, Best Smm Panel in US, Best Smm Panel in USA, Smm Panel Usa, Smm panel Indonesia, Smmpanels, Smm panel Australia, Smm panel Aus, wholesale smm panel, Cheapest SMM Panel For Reseller, Smm reseller panel, Best Smm reseller panel, Cheapest PayTM Panel, Smm panel canada, Smm panel Croatia, Smm panel Qatar, Best smm panel Qatar, Smm panel Ukraine, Best smm panel Ukraine, Smm panel New Zealand, Best Smm panel New Zealand , YouTube Worldwide Social Shares, YouTube India Shares, YouTube Social Shares from Facebook, Twitter, Reddit, Pinterest, Tumbler, Smm Panel Brazil, Smm Panel Thailand, Smm Panel Vietnam, Smm Panel Philippines, Smm Panel Taiwan, Buy Telegram Members, Views and Vote likes, Buy Telegram Post views, Buy Twitch Livestream Views, Buy Linkedin likes followers love, Buy Spotify free plays, Buy Spotify premium plays, Spotify Saves, Buy Spotify followers, Buy Soundcloud plays followers comments, Buy Shazam views and plays, Buy Deezer Likes Followers fans, Buy Audiomack likes followers plays and reposts, Buy Viemo video views, Buy SEO Social Signals, Buy Quora views comments followers upvotes, Buy Onlyfans likes and Subscribers, buy website traffic, buy instagram followers india, smmpanel, Indian smm panel, Cheapsmmpanel, Indiansmm, smart panel, Smm panel script, Indiansmartpanel, Indian smm, Smm panels, Buy smm panel, Buy indian instagram followers, Smm services, Smm reseller panel, Buy facebook Likes india, Resellerspanel, Indian facebook likes, Buy instagram followers by paytm, Paytmsmm, free smm panel, Buy facebook page likes india, Smm india, Buy indian facebook likes Indian discord server, Pubg mobile discord server India, Pubg mobile official discord server, Discord server names, Pubg discord server, Discord server rules, How to join a discord server, How to delete a discord server, Discord server status', '', 'jf', 'USD', 'public/images/339e2ebc99d2a81e7786a466b5cbb9f8b3b81377.png', 'en', '0C8t2cUp9wzh2tWfUWiDhRzHlRjKBeyWA7rG', 'PSW_THEME_COLOUR_2.0', '1', '', '', '', '', '1', '2', '1', '2', 79.39, 0, '', '121345', '', '465', 'ssl', '2', '2', '2', '2', '1', '2', 'bizimsms', 'PSw', '', '', '1', '', '', '2', '2', '2', '2', 'asc', 0, 0, 0, 0, 'dns1.host-dns.co', 'dns2.host-dnd.co', 1, '2', '#fb0704', '2', 0, 0, '2', '2', 9999999999, '1', '2', '$', '₹', 80, '$', 0.013, '0', '1', '1', '2', '2', '1', 0, '2', '2', '', '$', '101', 3, '1', '919565676128', 'This Is PSW V3', 'https://i.postimg.cc/XvqcjLD3/june-aye-8l3lp-Q4-Hs-Og-unsplash.jpg', 'right', '1', 'iampsw', 'left', '2', 1, 5, 3, 2, 0, 1, 5, 3, 1, 0, 57);

-- --------------------------------------------------------

--
-- Table structure for table `sync_logs`
--

CREATE TABLE `sync_logs` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `action` varchar(225) NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(225) NOT NULL,
  `api_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `theme_name` text NOT NULL,
  `theme_dirname` text NOT NULL,
  `theme_extras` text NOT NULL,
  `last_modified` datetime NOT NULL,
  `psw_img` text NOT NULL,
  `newpage` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `theme_name`, `theme_dirname`, `theme_extras`, `last_modified`, `psw_img`, `newpage`) VALUES
(8, 'PSW 1.0 Support Colour Change', '0C8t2cUp9wzh2tWfUWiDhRzHlRjKBeyWA7rG', '', '2022-08-16 12:41:25', '1/', '{% include \'header.twig\' %} <div class=\"wrapper-content\">     <div class=\"wrapper-content__header\">           </div>     <div class=\"wrapper-content__body\">       <!-- Main variables *content* -->       <div id=\"block_93\">     <div class=\"new_order-block \">         <div class=\"bg\"></div>         <div class=\"divider-top\"></div>         <div class=\"divider-bottom\"></div>         <div class=\"container\">             <div class=\"row new-order-form\">                 <div class=\"col-lg-8\">                    <div class=\"component_form_group component_card component_radio_button\">                       <div class=\"card \">     <div class=\"col-md-12\">         {{ contentText }}       </div>     </div>   </div>  </div>  </div> </div> </div> </div>   </div> </div>  {% include \'footer.twig\' %}'),
(16, 'PSW 2.0 Support Colour Change', 'Eternity', '  {\"stylesheets\":[\"public/Eternity/bootstrap.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\",\"public\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https:\\/\\/code.jquery.com\\/jquery-3.3.1.min.js\",\"public/Eternity/js/script.js\",\"public/Eternity/js/snowfall.min.js\",\"public/Eternity/js/bundle.js\",\"public/Eternity/js/main.js\",\"public/ajax.js\",\"public\\/datepicker\\/js\\/bootstrap-datepicker.min.js\"]}', '2022-08-12 10:35:06', '2/', '{% include \'header.twig\' %} <div class=\"wrapper-content\">     <div class=\"wrapper-content__header\">           </div>     <div class=\"wrapper-content__body\">       <!-- Main variables *content* -->       <div id=\"block_93\">     <div class=\"new_order-block \">         <div class=\"bg\"></div>         <div class=\"divider-top\"></div>         <div class=\"divider-bottom\"></div>         <div class=\"container\">             <div class=\"row new-order-form\">                 <div class=\"col-lg-8\">                    <div class=\"component_form_group component_card component_radio_button\">                       <div class=\"card \">     <div class=\"col-md-12\">         {{ contentText }}       </div>     </div>   </div>  </div>  </div> </div> </div> </div>   </div> </div>  {% include \'footer.twig\' %}'),
(32, 'PSW 3.0', 'psw', '', '2022-08-12 01:45:14', '3/', '{% include \'header.twig\' %} <div class=\"wrapper-content\">     <div class=\"wrapper-content__header\">           </div>     <div class=\"wrapper-content__body\">       <!-- Main variables *content* -->       <div id=\"block_93\">     <div class=\"new_order-block \">         <div class=\"bg\"></div>         <div class=\"divider-top\"></div>         <div class=\"divider-bottom\"></div>         <div class=\"container\">             <div class=\"row new-order-form\">                 <div class=\"col-lg-8\">                    <div class=\"component_form_group component_card component_radio_button\">                       <div class=\"card \">     <div class=\"col-md-12\">         {{ contentText }}       </div>     </div>   </div>  </div>  </div> </div> </div> </div>   </div> </div>  {% include \'footer.twig\' %}');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `time` datetime NOT NULL,
  `lastupdate_time` datetime NOT NULL,
  `client_new` enum('1','2') NOT NULL DEFAULT '2',
  `status` enum('pending','answered','closed') NOT NULL DEFAULT 'pending',
  `support_new` enum('1','2') NOT NULL DEFAULT '1',
  `canmessage` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_reply`
--

CREATE TABLE `ticket_reply` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `support` enum('1','2') NOT NULL DEFAULT '1',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `readed` enum('1','2') NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_subjects`
--

CREATE TABLE `ticket_subjects` (
  `subject_id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `content` text DEFAULT NULL,
  `auto_reply` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `units_per_page`
--

CREATE TABLE `units_per_page` (
  `id` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `page` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `units_per_page`
--

INSERT INTO `units_per_page` (`id`, `unit`, `page`) VALUES
(1, 50, 'clients'),
(2, 50, 'orders'),
(3, 50, 'payments'),
(4, 50, 'refill');

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `u_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `action` varchar(225) NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `childpanels`
--
ALTER TABLE `childpanels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `clients_category`
--
ALTER TABLE `clients_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients_price`
--
ALTER TABLE `clients_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients_service`
--
ALTER TABLE `clients_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_report`
--
ALTER TABLE `client_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crons`
--
ALTER TABLE `crons`
  ADD PRIMARY KEY (`cron_id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `decoration`
--
ALTER TABLE `decoration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `earn`
--
ALTER TABLE `earn`
  ADD PRIMARY KEY (`earn_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `General_options`
--
ALTER TABLE `General_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `integrations`
--
ALTER TABLE `integrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kuponlar`
--
ALTER TABLE `kuponlar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kupon_kullananlar`
--
ALTER TABLE `kupon_kullananlar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Mailforms`
--
ALTER TABLE `Mailforms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications_popup`
--
ALTER TABLE `notifications_popup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`) USING BTREE;

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `panel_info`
--
ALTER TABLE `panel_info`
  ADD PRIMARY KEY (`panel_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `payments_bonus`
--
ALTER TABLE `payments_bonus`
  ADD PRIMARY KEY (`bonus_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral`
--
ALTER TABLE `referral`
  ADD PRIMARY KEY (`referral_id`);

--
-- Indexes for table `referral_payouts`
--
ALTER TABLE `referral_payouts`
  ADD PRIMARY KEY (`r_p_id`);

--
-- Indexes for table `refill_status`
--
ALTER TABLE `refill_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `service_api`
--
ALTER TABLE `service_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sync_logs`
--
ALTER TABLE `sync_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_subjects`
--
ALTER TABLE `ticket_subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `units_per_page`
--
ALTER TABLE `units_per_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `childpanels`
--
ALTER TABLE `childpanels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `clients_category`
--
ALTER TABLE `clients_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients_price`
--
ALTER TABLE `clients_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients_service`
--
ALTER TABLE `clients_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_report`
--
ALTER TABLE `client_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `crons`
--
ALTER TABLE `crons`
  MODIFY `cron_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `decoration`
--
ALTER TABLE `decoration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `earn`
--
ALTER TABLE `earn`
  MODIFY `earn_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `General_options`
--
ALTER TABLE `General_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `integrations`
--
ALTER TABLE `integrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `kuponlar`
--
ALTER TABLE `kuponlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kupon_kullananlar`
--
ALTER TABLE `kupon_kullananlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Mailforms`
--
ALTER TABLE `Mailforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications_popup`
--
ALTER TABLE `notifications_popup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=786;

--
-- AUTO_INCREMENT for table `panel_info`
--
ALTER TABLE `panel_info`
  MODIFY `panel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments_bonus`
--
ALTER TABLE `payments_bonus`
  MODIFY `bonus_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `referral`
--
ALTER TABLE `referral`
  MODIFY `referral_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `referral_payouts`
--
ALTER TABLE `referral_payouts`
  MODIFY `r_p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `refill_status`
--
ALTER TABLE `refill_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service_api`
--
ALTER TABLE `service_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sync_logs`
--
ALTER TABLE `sync_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_subjects`
--
ALTER TABLE `ticket_subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units_per_page`
--
ALTER TABLE `units_per_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
