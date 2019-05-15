-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2019 at 05:39 AM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wellknow`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` enum('SHIPPING','BILLING') COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `is_super_admin` tinyint(4) DEFAULT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'en',
  `image_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `is_super_admin`, `role_id`, `first_name`, `last_name`, `email`, `password`, `language`, `image_path`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'admin', 'user', 'admin@email.com', '$2y$10$bRKPEdKvn2wiK2XPehhU3OKcG89kqQd4ysjqjtAYAYhjMyvWzzQrm', 'en', NULL, NULL, NULL, '2019-05-14 06:08:39', '2019-05-14 06:08:39');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_dropdown_options`
--

CREATE TABLE `attribute_dropdown_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `display_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_dropdown_option_translations`
--

CREATE TABLE `attribute_dropdown_option_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_dropdown_option_id` int(10) UNSIGNED DEFAULT NULL,
  `language_id` int(10) UNSIGNED DEFAULT NULL,
  `display_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_product`
--

CREATE TABLE `attribute_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_translations`
--

CREATE TABLE `attribute_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED DEFAULT NULL,
  `language_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alt_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ENABLED',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `name`, `image_path`, `alt_text`, `url`, `target`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Kitchen Sale', 'uploads/cms/images/b/k/o/TIydVFNLKKJTiqJjUa29LKdVH0sgxadTJGogzGuI.jpeg', 'Kitchen On Sale', 'category/kitchen', NULL, 'ENABLED', 10, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(2, 'Living Room On Sale', 'uploads/cms/images/y/v/u/CqQjp5hSvRFnx0glalLnpTP7F1PLOCGoLAMPtnmc.jpeg', 'Living Room Items on Sale', 'category/living-room', NULL, 'ENABLED', 20, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(3, 'Bedroom Sale', 'uploads/cms/images/n/k/q/txdsemPHuXC9CHvXrXB7vvRVZc4C0YhrOrr4v1Su.jpeg', 'Bedroom On Sale', 'category/bedroom', NULL, 'ENABLED', 30, '2019-05-14 06:07:25', '2019-05-14 06:07:25');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Kitchen', 'kitchen', NULL, NULL, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(2, NULL, 'Bedroom', 'bedroom', NULL, NULL, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(3, NULL, 'Living Room', 'living-room', NULL, NULL, '2019-05-14 06:07:25', '2019-05-14 06:07:25');

-- --------------------------------------------------------

--
-- Table structure for table `category_filters`
--

CREATE TABLE `category_filters` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('ATTRIBUTE','PROPERTY') COLLATE utf8_unicode_ci DEFAULT NULL,
  `filter_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`id`, `category_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, NULL, NULL),
(2, 3, 2, NULL, NULL),
(3, 3, 3, NULL, NULL),
(4, 3, 4, NULL, NULL),
(5, 3, 5, NULL, NULL),
(6, 3, 6, NULL, NULL),
(7, 2, 7, NULL, NULL),
(8, 2, 8, NULL, NULL),
(9, 2, 9, NULL, NULL),
(10, 2, 10, NULL, NULL),
(11, 1, 11, NULL, NULL),
(12, 1, 12, NULL, NULL),
(13, 1, 13, NULL, NULL),
(14, 1, 14, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `language_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `configurations`
--

CREATE TABLE `configurations` (
  `id` int(10) UNSIGNED NOT NULL,
  `configuration_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `configuration_value` varchar(999) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `configurations`
--

INSERT INTO `configurations` (`id`, `configuration_key`, `configuration_value`, `created_at`, `updated_at`) VALUES
(1, 'general_site_currency', '1', '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(2, 'tax_default_country', '160', '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(3, 'tax_enabled', '1', '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(4, 'tax_percentage', '15', '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(5, 'general_site_title', 'AvoRed an Laravel Ecommerce', '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(6, 'general_site_description', 'AvoRed is a free open-source e-commerce application development platform written in PHP based on Laravel. Its an ingenuous and modular e-commerce that is easily customizable according to your needs, with a modern responsive mobile friendly interface as default', '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(7, 'general_site_description', 'AvoRed Laravel Ecommerce\n        ', '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(8, 'general_home_page', '1', '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(9, 'shipping_free_shipping_enabled', '1', '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(10, 'payment_pickup_enabled', '1', '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(11, 'general_term_condition_page', '2', '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(12, 'active_theme_identifier', 'avored-default', '2019-05-14 06:07:31', '2019-05-14 06:07:31'),
(13, 'active_theme_path', 'G:\\xampp\\htdocs\\wecom\\laravel-ecommerce\\themes\\avored\\default', '2019-05-14 06:07:31', '2019-05-14 06:07:31'),
(14, 'avored_catalog_no_of_product_category_page', '9', '2019-05-14 06:07:31', '2019-05-14 06:07:31'),
(15, 'avored_catalog_cart_page_display_taxamount', 'yes', '2019-05-14 06:07:31', '2019-05-14 06:07:31'),
(16, 'avored_tax_class_percentage_of_tax', '15', '2019-05-14 06:07:31', '2019-05-14 06:07:31');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`, `phone_code`, `currency_code`, `currency_symbol`, `lang_code`, `created_at`, `updated_at`) VALUES
(1, 'af', 'Afghanistan', '93', 'AFN', '؋', 'Pashto', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(2, 'ax', 'Åland Islands', '358', 'EUR', '€', 'Swedish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(3, 'al', 'Albania', '355', 'ALL', 'L', 'Albanian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(4, 'dz', 'Algeria', '213', 'DZD', 'د.ج', 'Arabic', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(5, 'as', 'American Samoa', '1684', 'USD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(6, 'ad', 'Andorra', '376', 'EUR', '€', 'Catalan', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(7, 'ao', 'Angola', '244', 'AOA', 'Kz', 'Portuguese', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(8, 'ai', 'Anguilla', '1264', 'XCD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(9, 'aq', 'Antarctica', '672', 'AUD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(10, 'ag', 'Antigua and Barbuda', '1268', 'XCD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(11, 'ar', 'Argentina', '54', 'ARS', '$', 'Spanish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(12, 'am', 'Armenia', '374', 'AMD', NULL, 'Armenian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(13, 'aw', 'Aruba', '297', 'AWG', 'ƒ', 'Dutch', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(14, 'au', 'Australia', '61', 'AUD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(15, 'at', 'Austria', '43', 'EUR', '€', 'German', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(16, 'az', 'Azerbaijan', '994', 'AZN', NULL, 'Azerbaijani', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(17, 'bs', 'Bahamas', '1242', 'BSD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(18, 'bh', 'Bahrain', '973', 'BHD', '.د.ب', 'Arabic', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(19, 'bd', 'Bangladesh', '880', 'BDT', '৳', 'Bengali', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(20, 'bb', 'Barbados', '1246', 'BBD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(21, 'by', 'Belarus', '375', 'BYN', 'Br', 'Belarusian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(22, 'be', 'Belgium', '32', 'EUR', '€', 'Dutch', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(23, 'bz', 'Belize', '501', 'BZD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(24, 'bj', 'Benin', '229', 'XOF', 'Fr', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(25, 'bm', 'Bermuda', '1441', 'BMD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(26, 'bt', 'Bhutan', '975', 'BTN', 'Nu.', 'Dzongkha', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(27, 'bo', 'Bolivia (Plurinational State of)', '591', 'BOB', 'Bs.', 'Spanish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(28, 'bq', 'Bonaire, Sint Eustatius and Saba', '5997', 'USD', '$', 'Dutch', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(29, 'ba', 'Bosnia and Herzegovina', '387', 'BAM', NULL, 'Bosnian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(30, 'bw', 'Botswana', '267', 'BWP', 'P', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(31, 'bv', 'Bouvet Island', '', 'NOK', 'kr', 'Norwegian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(32, 'br', 'Brazil', '55', 'BRL', 'R$', 'Portuguese', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(33, 'io', 'British Indian Ocean Territory', '246', 'USD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(34, 'um', 'United States Minor Outlying Islands', '', 'USD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(35, 'vg', 'Virgin Islands (British)', '1284', NULL, '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(36, 'vi', 'Virgin Islands (U.S.)', '1 340', 'USD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(37, 'bn', 'Brunei Darussalam', '673', 'BND', '$', 'Malay', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(38, 'bg', 'Bulgaria', '359', 'BGN', 'лв', 'Bulgarian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(39, 'bf', 'Burkina Faso', '226', 'XOF', 'Fr', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(40, 'bi', 'Burundi', '257', 'BIF', 'Fr', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(41, 'kh', 'Cambodia', '855', 'KHR', '៛', 'Khmer', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(42, 'cm', 'Cameroon', '237', 'XAF', 'Fr', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(43, 'ca', 'Canada', '1', 'CAD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(44, 'cv', 'Cabo Verde', '238', 'CVE', 'Esc', 'Portuguese', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(45, 'ky', 'Cayman Islands', '1345', 'KYD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(46, 'cf', 'Central African Republic', '236', 'XAF', 'Fr', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(47, 'td', 'Chad', '235', 'XAF', 'Fr', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(48, 'cl', 'Chile', '56', 'CLP', '$', 'Spanish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(49, 'cn', 'China', '86', 'CNY', '¥', 'Chinese', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(50, 'cx', 'Christmas Island', '61', 'AUD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(51, 'cc', 'Cocos (Keeling) Islands', '61', 'AUD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(52, 'co', 'Colombia', '57', 'COP', '$', 'Spanish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(53, 'km', 'Comoros', '269', 'KMF', 'Fr', 'Arabic', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(54, 'cg', 'Congo', '242', 'XAF', 'Fr', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(55, 'cd', 'Congo (Democratic Republic of the)', '243', 'CDF', 'Fr', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(56, 'ck', 'Cook Islands', '682', 'NZD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(57, 'cr', 'Costa Rica', '506', 'CRC', '₡', 'Spanish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(58, 'hr', 'Croatia', '385', 'HRK', 'kn', 'Croatian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(59, 'cu', 'Cuba', '53', 'CUC', '$', 'Spanish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(60, 'cw', 'Curaçao', '599', 'ANG', 'ƒ', 'Dutch', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(61, 'cy', 'Cyprus', '357', 'EUR', '€', 'Greek (modern)', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(62, 'cz', 'Czech Republic', '420', 'CZK', 'Kč', 'Czech', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(63, 'dk', 'Denmark', '45', 'DKK', 'kr', 'Danish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(64, 'dj', 'Djibouti', '253', 'DJF', 'Fr', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(65, 'dm', 'Dominica', '1767', 'XCD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(66, 'do', 'Dominican Republic', '1809', 'DOP', '$', 'Spanish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(67, 'ec', 'Ecuador', '593', 'USD', '$', 'Spanish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(68, 'eg', 'Egypt', '20', 'EGP', '£', 'Arabic', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(69, 'sv', 'El Salvador', '503', 'USD', '$', 'Spanish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(70, 'gq', 'Equatorial Guinea', '240', 'XAF', 'Fr', 'Spanish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(71, 'er', 'Eritrea', '291', 'ERN', 'Nfk', 'Tigrinya', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(72, 'ee', 'Estonia', '372', 'EUR', '€', 'Estonian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(73, 'et', 'Ethiopia', '251', 'ETB', 'Br', 'Amharic', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(74, 'fk', 'Falkland Islands (Malvinas)', '500', 'FKP', '£', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(75, 'fo', 'Faroe Islands', '298', 'DKK', 'kr', 'Faroese', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(76, 'fj', 'Fiji', '679', 'FJD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(77, 'fi', 'Finland', '358', 'EUR', '€', 'Finnish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(78, 'fr', 'France', '33', 'EUR', '€', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(79, 'gf', 'French Guiana', '594', 'EUR', '€', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(80, 'pf', 'French Polynesia', '689', 'XPF', 'Fr', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(81, 'tf', 'French Southern Territories', '', 'EUR', '€', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(82, 'ga', 'Gabon', '241', 'XAF', 'Fr', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(83, 'gm', 'Gambia', '220', 'GMD', 'D', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(84, 'ge', 'Georgia', '995', 'GEL', 'ლ', 'Georgian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(85, 'de', 'Germany', '49', 'EUR', '€', 'German', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(86, 'gh', 'Ghana', '233', 'GHS', '₵', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(87, 'gi', 'Gibraltar', '350', 'GIP', '£', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(88, 'gr', 'Greece', '30', 'EUR', '€', 'Greek (modern)', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(89, 'gl', 'Greenland', '299', 'DKK', 'kr', 'Kalaallisut', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(90, 'gd', 'Grenada', '1473', 'XCD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(91, 'gp', 'Guadeloupe', '590', 'EUR', '€', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(92, 'gu', 'Guam', '1671', 'USD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(93, 'gt', 'Guatemala', '502', 'GTQ', 'Q', 'Spanish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(94, 'gg', 'Guernsey', '44', 'GBP', '£', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(95, 'gn', 'Guinea', '224', 'GNF', 'Fr', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(96, 'gw', 'Guinea-Bissau', '245', 'XOF', 'Fr', 'Portuguese', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(97, 'gy', 'Guyana', '592', 'GYD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(98, 'ht', 'Haiti', '509', 'HTG', 'G', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(99, 'hm', 'Heard Island and McDonald Islands', '', 'AUD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(100, 'va', 'Holy See', '379', 'EUR', '€', 'Latin', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(101, 'hn', 'Honduras', '504', 'HNL', 'L', 'Spanish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(102, 'hk', 'Hong Kong', '852', 'HKD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(103, 'hu', 'Hungary', '36', 'HUF', 'Ft', 'Hungarian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(104, 'is', 'Iceland', '354', 'ISK', 'kr', 'Icelandic', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(105, 'in', 'India', '91', 'INR', '₹', 'Hindi', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(106, 'id', 'Indonesia', '62', 'IDR', 'Rp', 'Indonesian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(107, 'ci', 'Côte d\'Ivoire', '225', 'XOF', 'Fr', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(108, 'ir', 'Iran (Islamic Republic of)', '98', 'IRR', '﷼', 'Persian (Farsi)', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(109, 'iq', 'Iraq', '964', 'IQD', 'ع.د', 'Arabic', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(110, 'ie', 'Ireland', '353', 'EUR', '€', 'Irish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(111, 'im', 'Isle of Man', '44', 'GBP', '£', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(112, 'il', 'Israel', '972', 'ILS', '₪', 'Hebrew (modern)', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(113, 'it', 'Italy', '39', 'EUR', '€', 'Italian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(114, 'jm', 'Jamaica', '1876', 'JMD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(115, 'jp', 'Japan', '81', 'JPY', '¥', 'Japanese', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(116, 'je', 'Jersey', '44', 'GBP', '£', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(117, 'jo', 'Jordan', '962', 'JOD', 'د.ا', 'Arabic', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(118, 'kz', 'Kazakhstan', '76', 'KZT', NULL, 'Kazakh', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(119, 'ke', 'Kenya', '254', 'KES', 'Sh', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(120, 'ki', 'Kiribati', '686', 'AUD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(121, 'kw', 'Kuwait', '965', 'KWD', 'د.ك', 'Arabic', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(122, 'kg', 'Kyrgyzstan', '996', 'KGS', 'с', 'Kyrgyz', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(123, 'la', 'Lao People\'s Democratic Republic', '856', 'LAK', '₭', 'Lao', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(124, 'lv', 'Latvia', '371', 'EUR', '€', 'Latvian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(125, 'lb', 'Lebanon', '961', 'LBP', 'ل.ل', 'Arabic', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(126, 'ls', 'Lesotho', '266', 'LSL', 'L', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(127, 'lr', 'Liberia', '231', 'LRD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(128, 'ly', 'Libya', '218', 'LYD', 'ل.د', 'Arabic', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(129, 'li', 'Liechtenstein', '423', 'CHF', 'Fr', 'German', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(130, 'lt', 'Lithuania', '370', 'EUR', '€', 'Lithuanian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(131, 'lu', 'Luxembourg', '352', 'EUR', '€', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(132, 'mo', 'Macao', '853', 'MOP', 'P', 'Chinese', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(133, 'mk', 'Macedonia (the former Yugoslav Republic of)', '389', 'MKD', 'ден', 'Macedonian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(134, 'mg', 'Madagascar', '261', 'MGA', 'Ar', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(135, 'mw', 'Malawi', '265', 'MWK', 'MK', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(136, 'my', 'Malaysia', '60', 'MYR', 'RM', 'Malaysian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(137, 'mv', 'Maldives', '960', 'MVR', '.ރ', 'Divehi', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(138, 'ml', 'Mali', '223', 'XOF', 'Fr', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(139, 'mt', 'Malta', '356', 'EUR', '€', 'Maltese', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(140, 'mh', 'Marshall Islands', '692', 'USD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(141, 'mq', 'Martinique', '596', 'EUR', '€', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(142, 'mr', 'Mauritania', '222', 'MRO', 'UM', 'Arabic', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(143, 'mu', 'Mauritius', '230', 'MUR', '₨', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(144, 'yt', 'Mayotte', '262', 'EUR', '€', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(145, 'mx', 'Mexico', '52', 'MXN', '$', 'Spanish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(146, 'fm', 'Micronesia (Federated States of)', '691', NULL, '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(147, 'md', 'Moldova (Republic of)', '373', 'MDL', 'L', 'Romanian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(148, 'mc', 'Monaco', '377', 'EUR', '€', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(149, 'mn', 'Mongolia', '976', 'MNT', '₮', 'Mongolian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(150, 'me', 'Montenegro', '382', 'EUR', '€', 'Serbian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(151, 'ms', 'Montserrat', '1664', 'XCD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(152, 'ma', 'Morocco', '212', 'MAD', 'د.م.', 'Arabic', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(153, 'mz', 'Mozambique', '258', 'MZN', 'MT', 'Portuguese', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(154, 'mm', 'Myanmar', '95', 'MMK', 'Ks', 'Burmese', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(155, 'na', 'Namibia', '264', 'NAD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(156, 'nr', 'Nauru', '674', 'AUD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(157, 'np', 'Nepal', '977', 'NPR', '₨', 'Nepali', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(158, 'nl', 'Netherlands', '31', 'EUR', '€', 'Dutch', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(159, 'nc', 'New Caledonia', '687', 'XPF', 'Fr', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(160, 'nz', 'New Zealand', '64', 'NZD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(161, 'ni', 'Nicaragua', '505', 'NIO', 'C$', 'Spanish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(162, 'ne', 'Niger', '227', 'XOF', 'Fr', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(163, 'ng', 'Nigeria', '234', 'NGN', '₦', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(164, 'nu', 'Niue', '683', 'NZD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(165, 'nf', 'Norfolk Island', '672', 'AUD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(166, 'kp', 'Korea (Democratic People\'s Republic of)', '850', 'KPW', '₩', 'Korean', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(167, 'mp', 'Northern Mariana Islands', '1670', 'USD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(168, 'no', 'Norway', '47', 'NOK', 'kr', 'Norwegian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(169, 'om', 'Oman', '968', 'OMR', 'ر.ع.', 'Arabic', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(170, 'pk', 'Pakistan', '92', 'PKR', '₨', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(171, 'pw', 'Palau', '680', '(none)', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(172, 'ps', 'Palestine, State of', '970', 'ILS', '₪', 'Arabic', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(173, 'pa', 'Panama', '507', 'PAB', 'B/.', 'Spanish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(174, 'pg', 'Papua New Guinea', '675', 'PGK', 'K', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(175, 'py', 'Paraguay', '595', 'PYG', '₲', 'Spanish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(176, 'pe', 'Peru', '51', 'PEN', 'S/.', 'Spanish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(177, 'ph', 'Philippines', '63', 'PHP', '₱', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(178, 'pn', 'Pitcairn', '64', 'NZD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(179, 'pl', 'Poland', '48', 'PLN', 'zł', 'Polish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(180, 'pt', 'Portugal', '351', 'EUR', '€', 'Portuguese', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(181, 'pr', 'Puerto Rico', '1787', 'USD', '$', 'Spanish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(182, 'qa', 'Qatar', '974', 'QAR', 'ر.ق', 'Arabic', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(183, 'xk', 'Republic of Kosovo', '383', 'EUR', '€', 'Albanian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(184, 're', 'Réunion', '262', 'EUR', '€', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(185, 'ro', 'Romania', '40', 'RON', 'lei', 'Romanian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(186, 'ru', 'Russian Federation', '7', 'RUB', '₽', 'Russian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(187, 'rw', 'Rwanda', '250', 'RWF', 'Fr', 'Kinyarwanda', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(188, 'bl', 'Saint Barthélemy', '590', 'EUR', '€', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(189, 'sh', 'Saint Helena, Ascension and Tristan da Cunha', '290', 'SHP', '£', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(190, 'kn', 'Saint Kitts and Nevis', '1869', 'XCD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(191, 'lc', 'Saint Lucia', '1758', 'XCD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(192, 'mf', 'Saint Martin (French part)', '590', 'EUR', '€', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(193, 'pm', 'Saint Pierre and Miquelon', '508', 'EUR', '€', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(194, 'vc', 'Saint Vincent and the Grenadines', '1784', 'XCD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(195, 'ws', 'Samoa', '685', 'WST', 'T', 'Samoan', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(196, 'sm', 'San Marino', '378', 'EUR', '€', 'Italian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(197, 'st', 'Sao Tome and Principe', '239', 'STD', 'Db', 'Portuguese', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(198, 'sa', 'Saudi Arabia', '966', 'SAR', 'ر.س', 'Arabic', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(199, 'sn', 'Senegal', '221', 'XOF', 'Fr', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(200, 'rs', 'Serbia', '381', 'RSD', 'дин.', 'Serbian', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(201, 'sc', 'Seychelles', '248', 'SCR', '₨', 'French', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(202, 'sl', 'Sierra Leone', '232', 'SLL', 'Le', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(203, 'sg', 'Singapore', '65', 'BND', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(204, 'sx', 'Sint Maarten (Dutch part)', '1721', 'ANG', 'ƒ', 'Dutch', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(205, 'sk', 'Slovakia', '421', 'EUR', '€', 'Slovak', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(206, 'si', 'Slovenia', '386', 'EUR', '€', 'Slovene', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(207, 'sb', 'Solomon Islands', '677', 'SBD', '$', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(208, 'so', 'Somalia', '252', 'SOS', 'Sh', 'Somali', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(209, 'za', 'South Africa', '27', 'ZAR', 'R', 'Afrikaans', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(210, 'gs', 'South Georgia and the South Sandwich Islands', '500', 'GBP', '£', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(211, 'kr', 'Korea (Republic of)', '82', 'KRW', '₩', 'Korean', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(212, 'ss', 'South Sudan', '211', 'SSP', '£', 'English', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(213, 'es', 'Spain', '34', 'EUR', '€', 'Spanish', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(214, 'lk', 'Sri Lanka', '94', 'LKR', 'Rs', 'Sinhalese', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(215, 'sd', 'Sudan', '249', 'SDG', 'ج.س.', 'Arabic', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(216, 'sr', 'Suriname', '597', 'SRD', '$', 'Dutch', '2019-05-14 06:07:22', '2019-05-14 06:07:22'),
(217, 'sj', 'Svalbard and Jan Mayen', '4779', 'NOK', 'kr', 'Norwegian', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(218, 'sz', 'Swaziland', '268', 'SZL', 'L', 'English', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(219, 'se', 'Sweden', '46', 'SEK', 'kr', 'Swedish', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(220, 'ch', 'Switzerland', '41', 'CHF', 'Fr', 'German', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(221, 'sy', 'Syrian Arab Republic', '963', 'SYP', '£', 'Arabic', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(222, 'tw', 'Taiwan', '886', 'TWD', '$', 'Chinese', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(223, 'tj', 'Tajikistan', '992', 'TJS', 'ЅМ', 'Tajik', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(224, 'tz', 'Tanzania, United Republic of', '255', 'TZS', 'Sh', 'Swahili', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(225, 'th', 'Thailand', '66', 'THB', '฿', 'Thai', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(226, 'tl', 'Timor-Leste', '670', 'USD', '$', 'Portuguese', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(227, 'tg', 'Togo', '228', 'XOF', 'Fr', 'French', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(228, 'tk', 'Tokelau', '690', 'NZD', '$', 'English', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(229, 'to', 'Tonga', '676', 'TOP', 'T$', 'English', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(230, 'tt', 'Trinidad and Tobago', '1868', 'TTD', '$', 'English', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(231, 'tn', 'Tunisia', '216', 'TND', 'د.ت', 'Arabic', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(232, 'tr', 'Turkey', '90', 'TRY', NULL, 'Turkish', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(233, 'tm', 'Turkmenistan', '993', 'TMT', 'm', 'Turkmen', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(234, 'tc', 'Turks and Caicos Islands', '1649', 'USD', '$', 'English', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(235, 'tv', 'Tuvalu', '688', 'AUD', '$', 'English', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(236, 'ug', 'Uganda', '256', 'UGX', 'Sh', 'English', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(237, 'ua', 'Ukraine', '380', 'UAH', '₴', 'Ukrainian', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(238, 'ae', 'United Arab Emirates', '971', 'AED', 'د.إ', 'Arabic', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(239, 'gb', 'United Kingdom of Great Britain and Northern Ireland', '44', 'GBP', '£', 'English', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(240, 'us', 'United States of America', '1', 'USD', '$', 'English', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(241, 'uy', 'Uruguay', '598', 'UYU', '$', 'Spanish', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(242, 'uz', 'Uzbekistan', '998', 'UZS', NULL, 'Uzbek', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(243, 'vu', 'Vanuatu', '678', 'VUV', 'Vt', 'Bislama', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(244, 've', 'Venezuela (Bolivarian Republic of)', '58', 'VEF', 'Bs F', 'Spanish', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(245, 'vn', 'Viet Nam', '84', 'VND', '₫', 'Vietnamese', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(246, 'wf', 'Wallis and Futuna', '681', 'XPF', 'Fr', 'French', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(247, 'eh', 'Western Sahara', '212', 'MAD', 'د.م.', 'Spanish', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(248, 'ye', 'Yemen', '967', 'YER', '﷼', 'Arabic', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(249, 'zm', 'Zambia', '260', 'ZMW', 'ZK', 'English', '2019-05-14 06:07:23', '2019-05-14 06:07:23'),
(250, 'zw', 'Zimbabwe', '263', 'BWP', 'P', 'English', '2019-05-14 06:07:23', '2019-05-14 06:07:23');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 1, '2019-05-14 06:07:31', '2019-05-14 06:07:31');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_group_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_group_id`, `parent_id`, `name`, `route`, `params`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Account Overview', 'my-account.home', NULL, 0, '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(2, 1, NULL, 'Edit Account', 'my-account.edit', NULL, 0, '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(3, 1, NULL, 'Upload Image', 'my-account.upload-image', NULL, 0, '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(4, 1, NULL, 'My Orders', 'my-account.order.list', NULL, 0, '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(5, 1, NULL, 'My Addresses', 'my-account.address.index', NULL, 0, '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(6, 1, NULL, 'My Wishlist', 'my-account.wishlist.list', NULL, 0, '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(7, 1, NULL, 'Change Password', 'my-account.change-password', NULL, 0, '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(8, 1, NULL, 'Logout', 'logout', NULL, 0, '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(9, 2, NULL, 'My Account', 'my-account.home', NULL, 0, '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(10, 2, NULL, 'Cart', 'cart.view', NULL, 0, '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(11, 2, NULL, 'Checkout', 'checkout.index', NULL, 0, '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(12, 2, NULL, 'Kitchen', 'category.view', 'kitchen', 100, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(13, 2, NULL, 'Bedroom', 'category.view', 'bedroom', 200, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(14, 2, NULL, 'Living Room', 'category.view', 'living-room', 300, '2019-05-14 06:07:25', '2019-05-14 06:07:25');

-- --------------------------------------------------------

--
-- Table structure for table `menu_groups`
--

CREATE TABLE `menu_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menu_groups`
--

INSERT INTO `menu_groups` (`id`, `name`, `identifier`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'My Account', 'my-account', 0, '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(2, 'Main Menu', 'main-menu', 1, '2019-05-14 06:07:24', '2019-05-14 06:07:24');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_03_29_000000_avored_framework_schema', 1),
(2, '2017_03_29_000001_avored_banner_schema', 1),
(3, '2017_03_29_000001_avored_brand_schema', 1),
(4, '2017_03_29_000001_avored_featured_schema', 1),
(5, '2017_03_29_000001_avored_promotion_schema', 1),
(6, '2017_03_29_000001_avored_related_schema', 1),
(7, '2017_03_29_000001_avored_review_schema', 1),
(8, '2017_03_29_000001_avored_subscribe_schema', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'AvoRed E commerce Personal Access Client', 'Ext9hL2TP4pZJAI1vPWyF3LYN0ZDWpUHqAIBce1L', 'http://localhost', 1, 0, 0, '2019-05-14 06:07:29', '2019-05-14 06:07:29'),
(2, NULL, 'AvoRed E commerce Password Grant Client', 'mdsGTD76DSSDkhwf0dwolMjYn6B6AzFvuG0d5Gxf', 'http://localhost', 0, 1, 0, '2019-05-14 06:07:29', '2019-05-14 06:07:29'),
(3, 1, 'admin user', 'GNCHIZAR9GFO0JrxFUnh2q1XSoh5GeayiwuiTKvk', 'http://localhost/', 0, 1, 0, '2019-05-14 06:08:39', '2019-05-14 06:08:39');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-05-14 06:07:29', '2019-05-14 06:07:29');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `shipping_option` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_option` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_status_id` int(10) UNSIGNED NOT NULL,
  `currency_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `shipping_address_id` int(10) UNSIGNED DEFAULT NULL,
  `billing_address_id` int(10) UNSIGNED DEFAULT NULL,
  `track_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_histories`
--

CREATE TABLE `order_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `order_status_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(11,6) NOT NULL,
  `tax_amount` decimal(11,6) NOT NULL,
  `product_info` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_product_variations`
--

CREATE TABLE `order_product_variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `attribute_dropdown_option_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_return_products`
--

CREATE TABLE `order_return_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_return_request_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `reason` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_return_requests`
--

CREATE TABLE `order_return_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('PENDING','IN_PROGRESSS','APPROVED','REJECTED') COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

CREATE TABLE `order_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_statuses`
--

INSERT INTO `order_statuses` (`id`, `name`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'New', 1, NULL, NULL),
(2, 'Pending Payment', 0, NULL, NULL),
(3, 'Processing', 0, NULL, NULL),
(4, 'Shipped', 0, NULL, NULL),
(5, 'Delivered', 0, NULL, NULL),
(6, 'Canceled', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `content`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Home Page', 'home-page', '\n%%% avored-banner %%%\n\n##### HOME PAGE FOR AvoRed E COMMERCE LARAVEL OPEN SOURCE SHOPPING CART\n\nPlease star us on [https://github.com/avored/laravel-ecommerce](https://github.com/avored/laravel-ecommerce)\nLike us on Facebook : [https://www.facebook.com/avored](https://www.facebook.com/avored)\nFollow us on Twitter:  [https://twitter.com/avoredecommerce](https://twitter.com/avoredecommerce)\n\n%%% avored-featured %%%\n            ', 'Home Page - AvoRed E commerce', NULL, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(2, 'Term & Condition', 'term-condition', 'Nihil aliquid et dignissimos ea repudiandae. Voluptas possimus doloremque qui officia enim id et. Tenetur dolore eaque sit quia. Quos quasi recusandae et rerum.', 'Term & Condition - AvoRed E commerce', NULL, '2019-05-14 06:07:25', '2019-05-14 06:07:25');

-- --------------------------------------------------------

--
-- Table structure for table `page_translations`
--

CREATE TABLE `page_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` int(10) UNSIGNED DEFAULT NULL,
  `language_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('BASIC','VARIATION','DOWNLOADABLE','VARIABLE_PRODUCT') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'BASIC',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) DEFAULT NULL,
  `in_stock` tinyint(4) DEFAULT NULL,
  `track_stock` tinyint(4) DEFAULT NULL,
  `qty` decimal(10,6) DEFAULT NULL,
  `is_taxable` tinyint(4) DEFAULT NULL,
  `price` decimal(10,6) DEFAULT NULL,
  `cost_price` decimal(10,6) DEFAULT NULL,
  `weight` double(8,2) DEFAULT NULL,
  `width` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `length` double(8,2) DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `type`, `name`, `slug`, `sku`, `description`, `status`, `in_stock`, `track_stock`, `qty`, `is_taxable`, `price`, `cost_price`, `weight`, `width`, `height`, `length`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 'BASIC', 'Flower Pot', 'flower-pot', 'flower-pot', 'But here, to Alice\'s side as she could see her after the others. \'We must burn the house opened, and a large one, but it did not quite know what a Gryphon is, look at all a pity. I said \"What for?\"\' \'She boxed the Queen\'s hedgehog just now, only it ran away when it had grown in the distance, and she thought it would be four thousand miles down, I think--\' (she was rather glad there WAS no one else seemed inclined to say anything. \'Why,\' said the Dormouse, after thinking a minute or two to think that will be much the same tone, exactly as if it wasn\'t trouble enough hatching the eggs,\' said the others. \'Are their heads downward! The Antipathies, I think--\' (for, you see, Alice had been to her, though, as they came nearer, Alice could bear: she got to the croquet-ground. The other side of the pack, she could see it again, but it puzzled her a good opportunity for repeating his remark, with variations. \'I shall do nothing of the birds and animals that had made the whole pack rose up.', 1, 1, 1, '495.000000', 1, '40.700000', '21.571000', NULL, NULL, NULL, NULL, '', '', '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(2, 'BASIC', 'Classic TV Stand', 'classic-tv-stand', 'classic-tv-stand', 'I\'m a hatter.\' Here the other two were using it as to the door, and knocked. \'There\'s no sort of thing that would be so easily offended, you know!\' The Mouse did not get dry very soon. \'Ahem!\' said the Gryphon. \'It\'s all her riper years, the simple rules their friends had taught them: such as, \'Sure, I don\'t believe you do lessons?\' said Alice, \'because I\'m not Ada,\' she said, by way of keeping up the chimney, has he?\' said Alice a good deal frightened by this very sudden change, but very glad she had felt quite unhappy at the door-- Pray, what is the same thing a bit!\' said the Duchess, \'as pigs have to beat time when she got back to the table, but it was certainly English. \'I don\'t see,\' said the Lory hastily. \'I thought you did,\' said the Caterpillar. Here was another long passage, and the other guinea-pig cheered, and was gone across to the little creature down, and nobody spoke for some way, and then turned to the Dormouse, and repeated her question. \'Why did you ever see such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let me hear the very middle of one! There ought to have lessons to learn! No, I\'ve made up my mind about it; and the Hatter said, tossing his head contemptuously. \'I dare say you\'re wondering why I don\'t keep the same words as before, \'It\'s all about for some time after the rest of the house!\' (Which was very uncomfortable, and, as they lay sprawling about, reminding her very earnestly, \'Now, Dinah, tell me your history, you know,\' said the Duchess, digging her sharp little chin. \'I\'ve a right to think,\' said Alice aloud, addressing nobody in particular. \'She\'d soon fetch it here, lad!--Here, put \'em up at this moment Alice appeared, she was appealed to by all three dates on their hands and feet at once, with a sigh. \'I only took the hookah out of their wits!\' So she began: \'O Mouse, do you know the song, she kept fanning herself all the party were placed along the course, here and there. There was a long argument with the birds and animals that had slipped in like herself. \'Would it be of any good reason, and as it was out of the baby, and not to make herself useful, and looking anxiously about her. \'Oh, do let me hear the very tones of the Nile On every golden scale! \'How cheerfully he seems to grin, How neatly spread his claws, And welcome little fishes in With gently smiling jaws!\' \'I\'m sure those are.', 1, 1, 1, '33.000000', 1, '50.200000', '28.112000', NULL, NULL, NULL, NULL, '', '', '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(3, 'BASIC', 'Classic Vintage Curtain', 'classic-vintage-curtain', 'classic-vintage-curtain', 'Alice had not attended to this last remark that had made the whole party look so grave and anxious.) Alice could speak again. In a little bird as soon as look at a king,\' said Alice. \'You did,\' said the others. \'We must burn the house if it please your Majesty?\' he asked. \'Begin at the moment, \'My dear! I wish I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, upon the other side. The further off from England the nearer is to do it?\' \'In my youth,\' Father William replied to his son, \'I feared it might appear to others that what you had been (Before she had brought herself down to them, they were nice grand words to say.) Presently she began again. \'I should like to see what was coming. It was all ridges and furrows; the balls were live hedgehogs, the mallets live flamingoes, and the pool was getting quite crowded with the Queen ordering off her unfortunate guests to execution--once more the shriek of the others looked round also, and all the way to fly up into the court, she said to herself, \'whenever I eat one of the Gryphon, and the beak-- Pray how did you do lessons?\' said Alice, who felt ready to make herself useful, and looking at the Queen, but she was terribly frightened all the time they were nowhere to be sure, this generally happens when one eats cake, but Alice had no reason to be ashamed of yourself,\' said Alice, and her eyes immediately met those of a well--\' \'What did they live at the Duchess said in a confused way, \'Prizes! Prizes!\' Alice had no reason to be ashamed of yourself,\' said Alice, \'but I must be getting somewhere near the right size, that it made no mark; but he could think of any that do,\' Alice said very politely, feeling quite pleased to find her in such a dreadful time.\' So Alice got up very carefully, remarking, \'I really must be collected at once took up the conversation dropped, and the Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of a treacle-well--eh, stupid?\' \'But they were nowhere to be done, I wonder?\' As she said this last remark, \'it\'s a vegetable. It doesn\'t look like it?\' he said, \'on and off, for days and days.\' \'But what am I to do with this creature when I got up this morning? I almost wish I\'d gone to see if he doesn\'t begin.\' But she waited for a great hurry; \'and their names were Elsie, Lacie, and Tillie; and they walked off together. Alice laughed so much already, that it made Alice quite hungry to look through into the garden. Then she went nearer to make it stop. \'Well, I\'d hardly finished the first question, you know.\' \'And what are they made of?\' Alice asked in a deep sigh, \'I was a dispute going on within--a constant howling and sneezing, and every now and then, and holding it to the tarts on the Duchess\'s cook. She carried the pepper-box in her hands, wondering if anything would EVER happen in a shrill, loud voice, and see how the Dodo said, \'EVERYBODY has won, and all the rest were.', 1, 1, 1, '157.000000', 1, '90.500000', '54.300000', NULL, NULL, NULL, NULL, '', '', '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(4, 'BASIC', 'Comfirtable Couch', 'comfirtable-couch', 'comfirtable-couch', 'I\'ll have you got in as well,\' the Hatter with a table set out under a tree in the pictures of him), while the rest of the right-hand bit to try the first verse,\' said the Hatter. \'Does YOUR watch tell you my adventures--beginning from this morning,\' said Alice indignantly. \'Ah! then yours wasn\'t a really good school,\' said the King. (The jury all wrote down all three dates on their slates, \'SHE doesn\'t believe there\'s an atom of meaning in them, after all. I needn\'t be afraid of them!\' \'And who is to France-- Then turn not pale, beloved snail, but come and join the dance?\"\' \'Thank you, sir, for your interesting story,\' but she did so, and were resting in the wood,\' continued the Hatter, with an M?\' said Alice. \'Come, let\'s try Geography. London is the reason they\'re called lessons,\' the Gryphon went on, turning to Alice, they all spoke at once, in a low, trembling voice. \'There\'s more evidence to come out among the leaves, which she found a little of it?\' said the Gryphon, and, taking Alice by the whole window!\' \'Sure, it does, yer honour: but it\'s an arm for all that.\' \'With extras?\' asked the Gryphon, and the Queen.', 1, 1, 1, '726.000000', 1, '20.600000', '10.918000', NULL, NULL, NULL, NULL, '', '', '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(5, 'BASIC', 'Delicate Brown Curtain', 'delicate-brown-curtain', 'delicate-brown-curtain', 'Dormouse; \'VERY ill.\' Alice tried to beat time when I grow at a king,\' said Alice. \'Oh, don\'t talk about wasting IT. It\'s HIM.\' \'I don\'t think--\' \'Then you may nurse it a little girl she\'ll think me for asking! No, it\'ll never do to ask: perhaps I shall fall right THROUGH the earth! How funny it\'ll seem to be\"--or if you\'d like it put more simply--\"Never imagine yourself not to her, still it was a little shriek and a bright brass plate with the Mouse to Alice an excellent opportunity for repeating his remark, with variations. \'I shall sit here,\' the Footman went on talking: \'Dear, dear! How queer everything is to-day! And yesterday things went on to himself as he spoke, and then raised himself upon tiptoe, put his mouth close to her very much confused, \'I don\'t much care where--\' said Alice. \'Come, let\'s try Geography. London is the reason is--\' here the Mock Turtle in a low, weak voice. \'Now, I give you fair warning,\' shouted the Gryphon, \'you first form into a tidy little room with a melancholy tone: \'it doesn\'t seem to put everything upon Bill! I wouldn\'t be in before the trial\'s begun.\' \'They\'re putting down their names,\' the Gryphon went on. \'Would you tell me,\' said Alice, as she said to herself, and shouted out, \'You\'d better not do that again!\' which produced another dead silence. Alice was too small, but at any rate it would like the largest telescope that ever was! Good-bye, feet!\' (for when she was about a foot high: then she noticed that one of the Lobster Quadrille, that she was not much surprised at her hands, and began:-- \'You are old,\' said the King. \'When did you manage on the stairs. Alice knew it was very likely to eat or drink something or other; but the tops of the deepest contempt. \'I\'ve seen hatters before,\' she said to herself; \'his eyes are so VERY much out of the Rabbit\'s voice; and Alice guessed who it was, even before she got up, and reduced the answer to it?\' said the King, who had got to the Hatter. He came in sight of the hall; but, alas! the little door, so she took up the chimney, and said to the Mock Turtle. \'Hold your tongue!\' said the White Rabbit, jumping up and saying, \'Thank you, sir, for your walk!\" \"Coming in a low, hurried tone. He looked anxiously over his shoulder with some difficulty, as it spoke. \'As wet as ever,\' said Alice as he spoke, and the baby with some surprise that the cause of this sort in her brother\'s Latin Grammar, \'A mouse--of a mouse--to a mouse--a mouse--O mouse!\') The Mouse gave a sudden leap out of the Nile On every golden scale! \'How cheerfully he seems to suit them!\' \'I haven\'t.', 1, 1, 1, '820.000000', 1, '20.400000', '12.240000', NULL, NULL, NULL, NULL, '', '', '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(6, 'BASIC', 'Medium White Couch', 'medium-white-couch', 'medium-white-couch', 'I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go on. \'And so these three weeks!\' \'I\'m very sorry you\'ve been annoyed,\' said Alice, feeling very glad to find my way into a butterfly, I should understand that better,\' Alice said very humbly; \'I won\'t indeed!\' said the voice. \'Fetch me my gloves this moment!\' Then came a little now and then, \'we went to the game. CHAPTER IX. The Mock Turtle went on. \'Would you like to hear it say, as it was too late to wish that! She went on just as well. The twelve jurors were writing down \'stupid things!\' on their slates, \'SHE doesn\'t believe there\'s an atom of meaning in it,\' said Alice in a shrill, loud voice, and the words \'DRINK ME,\' but nevertheless she uncorked it and put it into one of the day; and this Alice thought she might as well to introduce some other subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse did not come the same thing as \"I sleep when I was thinking I should have liked teaching it tricks very much, if--if I\'d only been the right size for going through the little door about fifteen inches high: she tried the little magic bottle had now had its full effect, and she trembled till she too began dreaming after a fashion, and this was the King; and the baby joined):-- \'Wow! wow! wow!\' \'Here! you may stand down,\' continued the Pigeon, raising its voice to its children, \'Come away, my dears! It\'s high time to begin with,\' the Mock Turtle at last, more calmly, though still sobbing a little bit of stick, and made believe to worry it; then Alice, thinking it was perfectly round, she came upon a neat little house, on the door of the lefthand bit. * * * * * * * * * * * * * * * * * * * * * \'Come, my head\'s free at last!\' said Alice doubtfully: \'it means--to--make--anything--prettier.\' \'Well, then,\' the Cat said, waving its tail when I\'m pleased, and wag my tail when it\'s angry, and wags its tail about in the pool, and the Queen said to the jury. They were indeed a queer-looking party that assembled on the floor, and a crash of broken glass, from which she had expected: before she got up in great fear lest she should chance to be a great thistle, to keep back the wandering hair that WOULD always get into her eyes; and once again the tiny hands were clasped upon her arm, and timidly said \'Consider, my dear: she is of finding morals in things!\' Alice began in a frightened tone. \'The Queen will hear you! You see, she came in with the Queen never left off quarrelling with the lobsters to the door, staring stupidly up into the garden door. Poor Alice!.', 1, 1, 1, '366.000000', 1, '90.700000', '53.513000', NULL, NULL, NULL, NULL, '', '', '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(7, 'BASIC', 'Comfirtable Gray Bed', 'comfirtable-gray-bed', 'comfirtable-gray-bed', 'Queen, but she was saying, and the White Rabbit, \'but it sounds uncommon nonsense.\' Alice said very politely, feeling quite pleased to find herself talking familiarly with them, as if a fish came to the table for it, while the rest of the Nile On every golden scale! \'How cheerfully he seems to grin, How neatly spread his claws, And welcome little fishes in With gently smiling jaws!\' \'I\'m sure those are not the smallest notice of her age knew the name \'W. RABBIT\' engraved upon it. She went in search of her knowledge. \'Just think of nothing else to do, and perhaps after all it might tell her something about the games now.\' CHAPTER X. The Lobster Quadrille The Mock Turtle sighed deeply, and drew the back of one flapper across his eyes. \'I wasn\'t asleep,\' he said to herself, \'after such a dreadful time.\' So Alice got up and said, \'That\'s right, Five! Always lay the blame on others!\' \'YOU\'D better not do that again!\' which produced another dead silence. Alice was thoroughly puzzled. \'Does the boots and shoes!\' she repeated in a sorrowful tone, \'I\'m afraid I am, sir,\' said Alice; \'all I know I have none, Why, I do it again and again.\' \'You are old,\' said the King; and the Queen, \'and take this child away with me,\' thought Alice, \'it\'ll never do to ask: perhaps I shall see it pop down a large pool all round her, calling out in a trembling voice, \'--and I hadn\'t cried so much!\' said Alice, always ready to ask his neighbour to tell its age, there was no \'One, two, three, and away,\' but they all crowded together at one corner of it: for she was out of sight: then it chuckled. \'What fun!\' said the Cat, \'if you don\'t explain it is you hate--C and D,\' she added aloud. \'Do you mean that you.', 1, 1, 1, '96.000000', 1, '70.100000', '36.452000', NULL, NULL, NULL, NULL, '', '', '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(8, 'BASIC', 'Cute Teddy Bear', 'cute-teddy-bear', 'cute-teddy-bear', 'Dodo, pointing to the shore, and then sat upon it.) \'I\'m glad I\'ve seen that done,\' thought Alice. \'I\'m glad I\'ve seen that done,\' thought Alice. One of the court. All this time the Mouse had changed his mind, and was coming back to the Knave of Hearts, and I shall think nothing of the cupboards as she had been anxiously looking across the garden, and I had our Dinah here, I know THAT well enough; and what does it to be executed for having missed their turns, and she felt that this could not tell whether they were all in bed!\' On various pretexts they all spoke at once, and ran off, thinking while she was quite surprised to find her in an offended tone, \'so I should like to be otherwise.\"\' \'I think I can reach the key; and if the Queen to-day?\' \'I should like to have the experiment tried. \'Very true,\' said the Hatter: \'let\'s all move one place on.\' He moved on as he found it so VERY much out of a candle is like after the candle is like after the rest were quite dry again, the cook till his eyes were getting so far off). \'Oh, my poor hands, how is it directed to?\' said the Hatter, \'you wouldn\'t talk about wasting IT. It\'s HIM.\' \'I don\'t even know what \"it\" means.\' \'I know what it was as much right,\' said the Hatter. \'Nor I,\' said the King, going up to the shore. CHAPTER III. A Caucus-Race and a piece of bread-and-butter in the last concert!\' on which the cook was.', 1, 1, 1, '843.000000', 1, '40.200000', '22.512000', NULL, NULL, NULL, NULL, '', '', '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(9, 'BASIC', 'Minimalist Ceramic Lamp', 'minimalist-ceramic-lamp', 'minimalist-ceramic-lamp', 'Alice caught the baby joined):-- \'Wow! wow! wow!\' While the Duchess said to herself, \'Why, they\'re only a pack of cards, after all. \"--SAID I COULD NOT SWIM--\" you can\'t be Mabel, for I know I do!\' said Alice indignantly. \'Let me alone!\' \'Serpent, I say again!\' repeated the Pigeon, raising its voice to a farmer, you know, with oh, such long ringlets, and mine doesn\'t go in at once.\' And in she went. Once more she found she could do to hold it. As soon as it left no mark on the door as you say it.\' \'That\'s nothing to do.\" Said the mouse doesn\'t get out.\" Only I don\'t understand. Where did they live at the stick, and tumbled head over heels in its hurry to change the subject. \'Ten hours the first question, you know.\' \'Who is it I can\'t take LESS,\' said the King. The next thing was waving its right ear and left off staring at the bottom of the e--e--evening, Beautiful, beautiful Soup! \'Beautiful Soup! Who cares for you?\' said Alice, rather doubtfully, as she could not be denied, so she set the little passage: and THEN--she found herself lying on their slates, \'SHE doesn\'t believe there\'s an atom of meaning in them, after all. I needn\'t be so kind,\' Alice replied, rather shyly, \'I--I hardly know, sir, just at present--at least I know I do!\' said Alice to herself, \'to be going messages for a dunce? Go on!\' \'I\'m a poor man, your Majesty,\' he began. \'You\'re a very melancholy voice. \'Repeat, \"YOU ARE OLD, FATHER WILLIAM,\' to the end: then stop.\' These were the cook, and a great hurry to get dry very soon. \'Ahem!\' said the Caterpillar. \'Well, perhaps you haven\'t found it made no mark; but he now hastily began again, using the ink, that was sitting on the other side of the court,\" and I had not a moment to be executed for having cheated herself in Wonderland, though she looked down at her as she picked up a little animal (she couldn\'t guess of what sort it was) scratching and scrambling about in a very good advice, (though she very good-naturedly began hunting about for some time busily writing in his confusion he bit a large arm-chair at one corner of it: \'No room! No room!\' they cried out when they arrived, with a T!\' said the Duchess, the Duchess! Oh! won\'t she be savage if I\'ve kept her eyes to see what was on the other side. The further off from England the nearer is to do that,\' said the Dormouse: \'not in that poky little house, and the m--\' But here, to Alice\'s side as she went nearer to make SOME change in my size; and as he found it advisable--\"\' \'Found WHAT?\' said the King, who had meanwhile been examining the roses. \'Off with her head!\' Alice glanced rather anxiously at the door--I do wish they WOULD not remember ever having heard of \"Uglification,\"\' Alice ventured to ask. \'Suppose we change the subject,\' the March Hare. Alice was not going to leave the room, when her eye fell upon a time there were three little sisters--they were learning to draw, you know--\' She had already.', 1, 1, 1, '295.000000', 1, '40.600000', '20.300000', NULL, NULL, NULL, NULL, '', '', '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(10, 'BASIC', 'Wooden Bunk Bed', 'wooden-bunk-bed', 'wooden-bunk-bed', 'There are no mice in the newspapers, at the end of the March Hare. \'I didn\'t know it to her feet in a tone of great surprise. \'Of course it was,\' said the Queen, pointing to the law, And argued each case with MINE,\' said the Duchess, it had gone. \'Well! I\'ve often seen them at last, and they sat down, and nobody spoke for some time without interrupting it. \'They were obliged to have changed since her swim in the long hall, and wander about among those beds of bright flowers and those cool fountains, but she remembered that she was near enough to drive one crazy!\' The Footman seemed to have been changed for Mabel! I\'ll try and repeat something now. Tell her to begin.\' He looked anxiously at the thought that it might not escape again, and all dripping wet, cross, and uncomfortable. The first thing I\'ve got to grow up any more if you\'d rather not.\' \'We indeed!\' cried the Mouse, turning to Alice. \'What IS a long argument with the strange creatures of her little sister\'s dream. The long grass rustled at her as she could. \'The game\'s going on between the executioner, the King, \'that saves a world of trouble, you know, upon the other players, and shouting \'Off with his tea spoon at the door as you might catch a bad cold if she were looking up into the book her sister sat still and said to the jury, of course--\"I GAVE HER ONE, THEY GAVE HIM TWO--\" why, that must be shutting up like telescopes: this time she went on in these words: \'Yes, we went to school every day--\' \'I\'VE been to the waving of the window, and some \'unimportant.\' Alice could only hear whispers now and then sat upon it.) \'I\'m glad I\'ve seen that done,\' thought Alice. \'I\'ve read that in about half no time! Take your choice!\' The Duchess took no notice of her voice. Nobody moved. \'Who cares for fish, Game, or any other dish? Who would not open any of them. \'I\'m sure I\'m not Ada,\' she said, \'for her hair goes in such a thing before, and he went on at last, with a sigh: \'he taught Laughing and Grief, they used to come once a week: HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, Alice could think of nothing else to say \'creatures,\' you see, because some of YOUR business, Two!\' said Seven. \'Yes, it IS his business!\' said Five, \'and I\'ll tell you how the Dodo solemnly, rising to its children, \'Come away, my dears! It\'s high time you were INSIDE, you might do something better with the Queen,\' and she tried to look at a reasonable pace,\' said the Hatter. \'It isn\'t mine,\' said the Mouse, turning to the porpoise, \"Keep.', 1, 1, 1, '470.000000', 1, '60.700000', '35.813000', NULL, NULL, NULL, NULL, '', '', '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(11, 'BASIC', 'Cooktail Mixed', 'cooktail-mixed', 'cooktail-mixed', 'Stigand, the patriotic archbishop of Canterbury, found it made Alice quite jumped; but she ran off at once took up the little passage: and THEN--she found herself falling down a jar from one end to the jury. \'Not yet, not yet!\' the Rabbit actually TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and looked into its eyes were getting so used to queer things happening. While she was peering about anxiously among the trees, a little startled by seeing the Cheshire Cat, she was talking. Alice could see her after the others. \'We must burn the house till she shook the house, and have next to no toys to play croquet.\' Then they all moved off, and found quite a large plate came skimming out, straight at the top of it. Presently the Rabbit asked. \'No, I didn\'t,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Hatter, it woke up again with a large pigeon had flown into her eyes--and still as she stood looking at them with the other paw, \'lives a Hatter: and in another moment, when she had nothing yet,\' Alice replied in an offended tone, \'Hm! No accounting for tastes! Sing her \"Turtle Soup,\" will you, won\'t you, will you, won\'t you, won\'t you join the dance. Would not, could not, would not, could not, would not, could not, would not, could not, would not, could not, would not, could not, would not allow without knowing how old it was, even before she gave a little irritated at the righthand bit again, and did not at all a pity. I said \"What for?\"\' \'She boxed the Queen\'s hedgehog just now, only it ran away when it grunted again, so that altogether, for the Dormouse,\' thought Alice; but she got up in spite of all her wonderful Adventures, till she got to do,\' said the Gryphon whispered in a sort of thing that would be four thousand miles down, I think--\' (for, you see, Miss, this here ought to eat her up in great disgust, and walked two and two, as the door and found in it a minute or two, looking for it, you know.\' \'Who is this?\' She said it to be two people! Why, there\'s hardly enough of it in asking riddles that have no sort of chance of getting her hands up to her great disappointment it was done. They had not the right way to hear his history. I must be a footman in livery, with a large fan in the sea, though you mayn\'t believe it--\' \'I never went to school in the common way. So she began thinking over other children she knew that were of the reeds--the rattling teacups would change to dull reality--the grass would be wasting our breath.\" \"I\'ll be judge, I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the first witness,\' said the cook. \'Treacle,\' said a timid voice at her hands, and was just going to remark myself.\' \'Have you guessed the riddle yet?\' the Hatter added as an explanation. \'Oh, you\'re sure to do.', 1, 1, 1, '616.000000', 1, '80.300000', '40.150000', NULL, NULL, NULL, NULL, '', '', '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(12, 'BASIC', 'Coffee Making Machine', 'coffee-making-machine', 'coffee-making-machine', 'But I\'ve got to go among mad people,\' Alice remarked. \'Right, as usual,\' said the Caterpillar. \'I\'m afraid I don\'t want to go! Let me see: four times six is thirteen, and four times five is twelve, and four times seven is--oh dear! I shall have to go on. \'And so these three weeks!\' \'I\'m very sorry you\'ve been annoyed,\' said Alice, \'a great girl like you,\' (she might well say that \"I see what was coming. It was all very well as pigs, and was going to turn into a line along the sea-shore--\' \'Two lines!\' cried the Gryphon, with a little of it?\' said the Queen, turning purple. \'I won\'t!\' said Alice. \'Nothing WHATEVER?\' persisted the King. \'Nothing whatever,\' said Alice. \'Then you keep moving round, I suppose?\' said Alice. \'You did,\' said the Dodo, \'the best way you have just been picked up.\' \'What\'s in it?\' said the Queen, \'Really, my dear, YOU must cross-examine the next thing was to find that she ought not to lie down upon their faces. There was exactly three inches high). \'But I\'m NOT a serpent!\' said Alice in a melancholy tone. \'Nobody seems to suit them!\' \'I haven\'t the least idea what a Gryphon is, look at a king,\' said Alice. \'It goes on, you know,\' said the King; and as the door between us. For instance, suppose it doesn\'t matter a bit,\' said the King. \'Then it wasn\'t trouble enough hatching the eggs,\' said the Mock Turtle, who looked at Alice, as the Lory positively refused to tell you--all I know all the right words,\' said poor Alice, \'when one wasn\'t always growing larger and smaller, and being ordered about in all directions, \'just like a candle. I wonder what I should frighten them out with trying, the poor animal\'s feelings. \'I quite forgot how to set them free, Exactly as we needn\'t try to find herself talking familiarly with them, as if she did not venture to ask them what the flame of a muchness\"--did you ever saw. How she longed to change the subject. \'Go on with the lobsters to the Dormouse, and repeated her question. \'Why did you manage to do this, so that her flamingo was gone in a melancholy air, and, after waiting till she was always ready to talk about trouble!\' said the King. Here one of the baby?\' said the Cat. \'--so long as you can--\' \'Swim after them!\' screamed the Queen. \'Sentence first--verdict afterwards.\' \'Stuff and nonsense!\' said Alice indignantly. \'Let me alone!\' \'Serpent, I say again!\' repeated the Pigeon, but in a day or.', 1, 1, 1, '921.000000', 1, '50.900000', '25.959000', NULL, NULL, NULL, NULL, '', '', '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(13, 'BASIC', 'Luxury Cooking Utensil', 'luxury-cooking-utensil', 'luxury-cooking-utensil', 'Magpie began wrapping itself up and saying, \'Thank you, sir, for your interesting story,\' but she felt that it was good manners for her to wink with one eye, How the Owl had the door and went on: \'--that begins with an anxious look at the righthand bit again, and did not dare to laugh; and, as they used to come before that!\' \'Call the next moment she appeared on the top of its mouth again, and we won\'t talk about her any more HERE.\' \'But then,\' thought Alice, \'it\'ll never do to come out among the leaves, which she found this a good deal on where you want to see you again, you dear old thing!\' said Alice, who was a large flower-pot that stood near the door, and tried to get dry very soon. \'Ahem!\' said the Caterpillar; and it put more simply--\"Never imagine yourself not to be no use denying it. I suppose I ought to go from here?\' \'That depends a good thing!\' she said to live. \'I\'ve seen hatters before,\' she said this, she came upon a time she heard a little scream of laughter. \'Oh, hush!\' the Rabbit asked. \'No, I didn\'t,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the King. \'It began with the end of his great wig.\' The judge, by the Hatter, and he poured a little timidly, \'why you are painting those roses?\' Five and Seven said nothing, but looked at Alice, and her eyes anxiously fixed on it, for she felt sure she would have done that?\' she thought. \'I must be kind to them,\' thought Alice, \'shall I NEVER get any older than you, and listen to me! When I used to read fairy-tales, I fancied that.', 1, 1, 1, '328.000000', 1, '70.200000', '37.908000', NULL, NULL, NULL, NULL, '', '', '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(14, 'BASIC', 'Vintage Toaste', 'vintage-toaste', 'vintage-toaste', 'But the snail replied \"Too far, too far!\" and gave a little nervous about this; \'for it might tell her something about the games now.\' CHAPTER X. The Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'You are,\' said the Mock Turtle: \'why, if a dish or kettle had been jumping about like that!\' \'I couldn\'t help it,\' said the Duchess, as she could, for the Dormouse,\' thought Alice; \'only, as it\'s asleep, I suppose you\'ll be asleep again before it\'s done.\' \'Once upon a time she saw maps and pictures hung upon pegs. She took down a good deal frightened by this time?\' she said this, she came up to her head, she tried the roots of trees, and I\'ve tried hedges,\' the Pigeon went on, taking first one side and then she remembered having seen in her brother\'s Latin Grammar, \'A mouse--of a mouse--to a mouse--a mouse--O mouse!\') The Mouse gave a little feeble, squeaking voice, (\'That\'s Bill,\' thought Alice,) \'Well, I shan\'t grow any more--As it is, I suppose?\' said Alice. \'Well, I should like it very nice, (it had, in fact, a sort of idea that they would call after her: the last word two or three of her sharp little chin into Alice\'s shoulder as he spoke. \'UNimportant, of course, Alice could hardly hear the Rabbit actually TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and looked at the mushroom for a minute or two, which gave the Pigeon the opportunity of adding, \'You\'re looking for it, she found that it was very fond of pretending to be otherwise.\"\' \'I think you can find out the answer to it?\' said the Caterpillar decidedly, and he poured a little pattering of feet in a low voice. \'Not at all,\' said Alice: \'she\'s so extremely--\' Just then she heard it before,\' said the Gryphon interrupted in a day did you ever eat a bat?\' when suddenly, thump! thump! down she came rather late, and the happy summer days. THE.', 1, 1, 1, '980.000000', 1, '40.900000', '20.450000', NULL, NULL, NULL, NULL, '', '', '2019-05-14 06:07:25', '2019-05-14 06:07:25');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute_integer_values`
--

CREATE TABLE `product_attribute_integer_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `value` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_downloadable_urls`
--

CREATE TABLE `product_downloadable_urls` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `demo_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `main_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `path` text COLLATE utf8_unicode_ci NOT NULL,
  `is_main_image` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `path`, `is_main_image`, `created_at`, `updated_at`) VALUES
(1, 1, 'uploads/catalog/images/f/h/2/flower-pot.jpg', 1, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(2, 2, 'uploads/catalog/images/d/0/c/classic-tv-stand.jpg', 1, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(3, 3, 'uploads/catalog/images/y/f/r/textiles-2.jpg', 1, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(4, 4, 'uploads/catalog/images/1/k/0/-Single-Panel-New-Pastoral-Linen-Blending-Embroidered-Living-Room-font-b-Curtain-b-font-font.jpg', 1, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(5, 5, 'uploads/catalog/images/q/o/m/comfortable-leather-chair-published-under-the-most-comfortable-couch-group.jpg', 1, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(6, 6, 'uploads/catalog/images/s/e/j/ff815ea7756de71d6c5edb5566330df6.jpg', 1, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(7, 7, 'uploads/catalog/images/v/t/x/bed-bedding-comfortable-platform-with-smooth-gray-also-are-beds-and-headboard-plus-small-.jpg', 1, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(8, 8, 'uploads/catalog/images/z/c/u/d5d710257f2cf7cf2576f4a43dc40430.jpg', 1, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(9, 9, 'uploads/catalog/images/m/2/z/b594a5c88e527b467508aa9fa3b01228.jpg', 1, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(10, 10, 'uploads/catalog/images/4/5/n/il_570xN.262261571.jpg', 1, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(11, 11, 'uploads/catalog/images/n/y/n/CC2600.jpg', 1, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(12, 12, 'uploads/catalog/images/t/b/n/20121018143846738.jpg', 1, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(13, 13, 'uploads/catalog/images/l/i/k/coffee-maker-20.jpg', 1, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(14, 14, 'uploads/catalog/images/0/y/4/tsf02crsa.jpg', 1, '2019-05-14 06:07:25', '2019-05-14 06:07:25');

-- --------------------------------------------------------

--
-- Table structure for table `product_property`
--

CREATE TABLE `product_property` (
  `id` int(10) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_property_boolean_values`
--

CREATE TABLE `product_property_boolean_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `value` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_property_datetime_values`
--

CREATE TABLE `product_property_datetime_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `value` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_property_decimal_values`
--

CREATE TABLE `product_property_decimal_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `value` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_property_integer_values`
--

CREATE TABLE `product_property_integer_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `value` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_property_integer_values`
--

INSERT INTO `product_property_integer_values` (`id`, `property_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 2, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(2, 2, 13, 2, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(3, 2, 14, 2, '2019-05-14 06:07:25', '2019-05-14 06:07:25'),
(4, 2, 11, 2, '2019-05-14 06:07:25', '2019-05-14 06:07:25');

-- --------------------------------------------------------

--
-- Table structure for table `product_property_text_values`
--

CREATE TABLE `product_property_text_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_property_varchar_values`
--

CREATE TABLE `product_property_varchar_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `star` double(2,1) DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `status` enum('APPROVED','PENDING') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `discount_type` enum('PERCENTAGE','FIXED') COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data_type` enum('INTEGER','DECIMAL','DATETIME','VARCHAR','BOOLEAN','TEXT') COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` enum('TEXT','TEXTAREA','CKEDITOR','SELECT','FILE','DATETIME','CHECKBOX','RADIO','SWITCH') COLLATE utf8_unicode_ci NOT NULL,
  `use_for_all_products` tinyint(4) NOT NULL DEFAULT '0',
  `is_visible_frontend` tinyint(4) DEFAULT '1',
  `sort_order` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `name`, `identifier`, `data_type`, `field_type`, `use_for_all_products`, `is_visible_frontend`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Brand', 'avored-brand', 'INTEGER', 'SELECT', 1, 1, 200, '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(2, 'Is Featured', 'avored-is-featured', 'INTEGER', 'SELECT', 1, 1, 100, '2019-05-14 06:07:24', '2019-05-14 06:07:24');

-- --------------------------------------------------------

--
-- Table structure for table `property_dropdown_options`
--

CREATE TABLE `property_dropdown_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `display_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `property_dropdown_options`
--

INSERT INTO `property_dropdown_options` (`id`, `property_id`, `display_text`, `created_at`, `updated_at`) VALUES
(1, 1, 'Test Brand Name', '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(2, 2, 'Yes', '2019-05-14 06:07:24', '2019-05-14 06:07:24'),
(3, 2, 'No', '2019-05-14 06:07:24', '2019-05-14 06:07:24');

-- --------------------------------------------------------

--
-- Table structure for table `property_dropdown_option_translations`
--

CREATE TABLE `property_dropdown_option_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `property_dropdown_option_id` int(10) UNSIGNED DEFAULT NULL,
  `language_id` int(10) UNSIGNED DEFAULT NULL,
  `display_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property_translations`
--

CREATE TABLE `property_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED DEFAULT NULL,
  `language_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `related_products`
--

CREATE TABLE `related_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `related_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'administrator', 'Administrator Role has all access', '2019-05-14 06:08:39', '2019-05-14 06:08:39');

-- --------------------------------------------------------

--
-- Table structure for table `site_currencies`
--

CREATE TABLE `site_currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `conversion_rate` double(8,2) NOT NULL,
  `status` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `site_currencies`
--

INSERT INTO `site_currencies` (`id`, `code`, `symbol`, `name`, `conversion_rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'NZD', '$', 'NZ Dollars', 1.00, 'ENABLED', '2019-05-14 06:07:24', '2019-05-14 06:07:24');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribes`
--

CREATE TABLE `subscribes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_groups`
--

CREATE TABLE `tax_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate` double(10,6) NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `state_id` int(10) UNSIGNED DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `rate_type` enum('PERCENTAGE','FIXED') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PERCENTAGE',
  `applied_with` enum('SHIPPING','BILLING','STORE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SHIPPING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('GUEST','LIVE','DELETE_IN_PROGRESS') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'LIVE',
  `tax_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `delete_due_date` timestamp NULL DEFAULT NULL,
  `registered_channel` enum('WEBSITE','FACEBOOK','TWITTER','GOOGLE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'WEBSITE',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_user_group`
--

CREATE TABLE `user_user_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`),
  ADD KEY `addresses_country_id_foreign` (`country_id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`),
  ADD KEY `admin_password_resets_token_index` (`token`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_email_unique` (`email`),
  ADD KEY `admin_users_role_id_foreign` (`role_id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attributes_identifier_unique` (`identifier`);

--
-- Indexes for table `attribute_dropdown_options`
--
ALTER TABLE `attribute_dropdown_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_dropdown_options_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `attribute_dropdown_option_translations`
--
ALTER TABLE `attribute_dropdown_option_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adt` (`attribute_dropdown_option_id`),
  ADD KEY `attribute_dropdown_option_translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_product_attribute_id_foreign` (`attribute_id`),
  ADD KEY `attribute_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_translations_attribute_id_foreign` (`attribute_id`),
  ADD KEY `attribute_translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_filters`
--
ALTER TABLE `category_filters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_filters_category_id_foreign` (`category_id`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_product_product_id_foreign` (`product_id`),
  ADD KEY `category_product_category_id_foreign` (`category_id`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_translations_category_id_foreign` (`category_id`),
  ADD KEY `category_translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menus_menu_group_id_foreign` (`menu_group_id`);

--
-- Indexes for table `menu_groups`
--
ALTER TABLE `menu_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_order_status_id_foreign` (`order_status_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_address_id_foreign` (`shipping_address_id`),
  ADD KEY `orders_billing_address_id_foreign` (`billing_address_id`);

--
-- Indexes for table `order_histories`
--
ALTER TABLE `order_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_histories_order_status_id_foreign` (`order_status_id`),
  ADD KEY `order_histories_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_order_id_foreign` (`order_id`),
  ADD KEY `order_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `order_product_variations`
--
ALTER TABLE `order_product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_variations_order_id_foreign` (`order_id`),
  ADD KEY `order_product_variations_product_id_foreign` (`product_id`),
  ADD KEY `order_product_variations_attribute_id_foreign` (`attribute_id`),
  ADD KEY `order_product_variations_attribute_dropdown_option_id_foreign` (`attribute_dropdown_option_id`);

--
-- Indexes for table `order_return_products`
--
ALTER TABLE `order_return_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_return_products_order_return_request_id_foreign` (`order_return_request_id`),
  ADD KEY `order_return_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `order_return_requests`
--
ALTER TABLE `order_return_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_return_requests_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_translations_slug_unique` (`slug`),
  ADD KEY `page_translations_page_id_foreign` (`page_id`),
  ADD KEY `page_translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_attribute_integer_values`
--
ALTER TABLE `product_attribute_integer_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attribute_integer_values_attribute_id_foreign` (`attribute_id`),
  ADD KEY `product_attribute_integer_values_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_downloadable_urls`
--
ALTER TABLE `product_downloadable_urls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_downloadable_urls_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_property`
--
ALTER TABLE `product_property`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_property_property_id_foreign` (`property_id`),
  ADD KEY `product_property_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_property_boolean_values`
--
ALTER TABLE `product_property_boolean_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_property_boolean_values_property_id_foreign` (`property_id`),
  ADD KEY `product_property_boolean_values_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_property_datetime_values`
--
ALTER TABLE `product_property_datetime_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_property_datetime_values_property_id_foreign` (`property_id`),
  ADD KEY `product_property_datetime_values_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_property_decimal_values`
--
ALTER TABLE `product_property_decimal_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_property_decimal_values_property_id_foreign` (`property_id`),
  ADD KEY `product_property_decimal_values_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_property_integer_values`
--
ALTER TABLE `product_property_integer_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_property_integer_values_property_id_foreign` (`property_id`),
  ADD KEY `product_property_integer_values_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_property_text_values`
--
ALTER TABLE `product_property_text_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_property_text_values_property_id_foreign` (`property_id`),
  ADD KEY `product_property_text_values_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_property_varchar_values`
--
ALTER TABLE `product_property_varchar_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_property_varchar_values_property_id_foreign` (`property_id`),
  ADD KEY `product_property_varchar_values_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_variation_id_foreign` (`variation_id`),
  ADD KEY `product_variations_product_id_foreign` (`product_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `properties_identifier_unique` (`identifier`);

--
-- Indexes for table `property_dropdown_options`
--
ALTER TABLE `property_dropdown_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_dropdown_options_property_id_foreign` (`property_id`);

--
-- Indexes for table `property_dropdown_option_translations`
--
ALTER TABLE `property_dropdown_option_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pdt` (`property_dropdown_option_id`),
  ADD KEY `property_dropdown_option_translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `property_translations`
--
ALTER TABLE `property_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `property_translations_identifier_unique` (`identifier`),
  ADD KEY `property_translations_property_id_foreign` (`property_id`),
  ADD KEY `property_translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `related_products`
--
ALTER TABLE `related_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `related_products_product_id_foreign` (`product_id`),
  ADD KEY `related_products_related_id_foreign` (`related_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_currencies`
--
ALTER TABLE `site_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `states_country_id_foreign` (`country_id`);

--
-- Indexes for table `subscribes`
--
ALTER TABLE `subscribes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_groups`
--
ALTER TABLE `tax_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_user_group`
--
ALTER TABLE `user_user_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_user_group_user_id_foreign` (`user_id`),
  ADD KEY `user_user_group_user_group_id_foreign` (`user_group_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_dropdown_options`
--
ALTER TABLE `attribute_dropdown_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_dropdown_option_translations`
--
ALTER TABLE `attribute_dropdown_option_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_product`
--
ALTER TABLE `attribute_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category_filters`
--
ALTER TABLE `category_filters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `configurations`
--
ALTER TABLE `configurations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `menu_groups`
--
ALTER TABLE `menu_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_histories`
--
ALTER TABLE `order_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_product_variations`
--
ALTER TABLE `order_product_variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_return_products`
--
ALTER TABLE `order_return_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_return_requests`
--
ALTER TABLE `order_return_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_statuses`
--
ALTER TABLE `order_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `page_translations`
--
ALTER TABLE `page_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_attribute_integer_values`
--
ALTER TABLE `product_attribute_integer_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_downloadable_urls`
--
ALTER TABLE `product_downloadable_urls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_property`
--
ALTER TABLE `product_property`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_property_boolean_values`
--
ALTER TABLE `product_property_boolean_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_property_datetime_values`
--
ALTER TABLE `product_property_datetime_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_property_decimal_values`
--
ALTER TABLE `product_property_decimal_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_property_integer_values`
--
ALTER TABLE `product_property_integer_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_property_text_values`
--
ALTER TABLE `product_property_text_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_property_varchar_values`
--
ALTER TABLE `product_property_varchar_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `property_dropdown_options`
--
ALTER TABLE `property_dropdown_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `property_dropdown_option_translations`
--
ALTER TABLE `property_dropdown_option_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_translations`
--
ALTER TABLE `property_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `related_products`
--
ALTER TABLE `related_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `site_currencies`
--
ALTER TABLE `site_currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribes`
--
ALTER TABLE `subscribes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_groups`
--
ALTER TABLE `tax_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_user_group`
--
ALTER TABLE `user_user_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD CONSTRAINT `admin_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_dropdown_options`
--
ALTER TABLE `attribute_dropdown_options`
  ADD CONSTRAINT `attribute_dropdown_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_dropdown_option_translations`
--
ALTER TABLE `attribute_dropdown_option_translations`
  ADD CONSTRAINT `adt` FOREIGN KEY (`attribute_dropdown_option_id`) REFERENCES `attribute_dropdown_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_dropdown_option_translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD CONSTRAINT `attribute_product_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  ADD CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_filters`
--
ALTER TABLE `category_filters`
  ADD CONSTRAINT `category_filters_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_menu_group_id_foreign` FOREIGN KEY (`menu_group_id`) REFERENCES `menu_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_billing_address_id_foreign` FOREIGN KEY (`billing_address_id`) REFERENCES `addresses` (`id`),
  ADD CONSTRAINT `orders_order_status_id_foreign` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`),
  ADD CONSTRAINT `orders_shipping_address_id_foreign` FOREIGN KEY (`shipping_address_id`) REFERENCES `addresses` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_histories`
--
ALTER TABLE `order_histories`
  ADD CONSTRAINT `order_histories_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_histories_order_status_id_foreign` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`);

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_product_variations`
--
ALTER TABLE `order_product_variations`
  ADD CONSTRAINT `order_product_variations_attribute_dropdown_option_id_foreign` FOREIGN KEY (`attribute_dropdown_option_id`) REFERENCES `attribute_dropdown_options` (`id`),
  ADD CONSTRAINT `order_product_variations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  ADD CONSTRAINT `order_product_variations_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_return_products`
--
ALTER TABLE `order_return_products`
  ADD CONSTRAINT `order_return_products_order_return_request_id_foreign` FOREIGN KEY (`order_return_request_id`) REFERENCES `order_return_requests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_return_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_return_requests`
--
ALTER TABLE `order_return_requests`
  ADD CONSTRAINT `order_return_requests_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD CONSTRAINT `page_translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attribute_integer_values`
--
ALTER TABLE `product_attribute_integer_values`
  ADD CONSTRAINT `product_attribute_integer_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attribute_integer_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_downloadable_urls`
--
ALTER TABLE `product_downloadable_urls`
  ADD CONSTRAINT `product_downloadable_urls_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_property`
--
ALTER TABLE `product_property`
  ADD CONSTRAINT `product_property_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_property_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_property_boolean_values`
--
ALTER TABLE `product_property_boolean_values`
  ADD CONSTRAINT `product_property_boolean_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_property_boolean_values_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_property_datetime_values`
--
ALTER TABLE `product_property_datetime_values`
  ADD CONSTRAINT `product_property_datetime_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_property_datetime_values_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_property_decimal_values`
--
ALTER TABLE `product_property_decimal_values`
  ADD CONSTRAINT `product_property_decimal_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_property_decimal_values_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_property_integer_values`
--
ALTER TABLE `product_property_integer_values`
  ADD CONSTRAINT `product_property_integer_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_property_integer_values_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_property_text_values`
--
ALTER TABLE `product_property_text_values`
  ADD CONSTRAINT `product_property_text_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_property_text_values_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_property_varchar_values`
--
ALTER TABLE `product_property_varchar_values`
  ADD CONSTRAINT `product_property_varchar_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_property_varchar_values_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variations_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `property_dropdown_options`
--
ALTER TABLE `property_dropdown_options`
  ADD CONSTRAINT `property_dropdown_options_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `property_dropdown_option_translations`
--
ALTER TABLE `property_dropdown_option_translations`
  ADD CONSTRAINT `pdt` FOREIGN KEY (`property_dropdown_option_id`) REFERENCES `property_dropdown_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `property_dropdown_option_translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `property_translations`
--
ALTER TABLE `property_translations`
  ADD CONSTRAINT `property_translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `property_translations_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `related_products`
--
ALTER TABLE `related_products`
  ADD CONSTRAINT `related_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `related_products_related_id_foreign` FOREIGN KEY (`related_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_user_group`
--
ALTER TABLE `user_user_group`
  ADD CONSTRAINT `user_user_group_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_user_group_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
