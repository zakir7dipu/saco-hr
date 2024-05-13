-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 23, 2024 at 05:40 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hrm`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_lists`
--

CREATE TABLE `account_lists` (
  `id` bigint UNSIGNED NOT NULL,
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_balance` double(25,2) NOT NULL DEFAULT '0.00',
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_branch` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `allowances`
--

CREATE TABLE `allowances` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` int NOT NULL,
  `allowance_option` int NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,2) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `allowance_options`
--

CREATE TABLE `allowance_options` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `branch_id` int NOT NULL,
  `department_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_employees`
--

CREATE TABLE `announcement_employees` (
  `id` bigint UNSIGNED NOT NULL,
  `announcement_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appraisals`
--

CREATE TABLE `appraisals` (
  `id` bigint UNSIGNED NOT NULL,
  `branch` int NOT NULL DEFAULT '0',
  `employee` int NOT NULL DEFAULT '0',
  `rating` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appraisal_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_experience` int NOT NULL DEFAULT '0',
  `marketing` int NOT NULL DEFAULT '0',
  `administration` int NOT NULL DEFAULT '0',
  `professionalism` int NOT NULL DEFAULT '0',
  `integrity` int NOT NULL DEFAULT '0',
  `attendance` int NOT NULL DEFAULT '0',
  `remark` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_date` date NOT NULL,
  `supported_date` date NOT NULL,
  `amount` double(25,2) NOT NULL DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_employees`
--

CREATE TABLE `attendance_employees` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` int NOT NULL,
  `date` date NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clock_in` time NOT NULL,
  `clock_out` time NOT NULL,
  `late` time NOT NULL,
  `early_leaving` time NOT NULL,
  `overtime` time NOT NULL,
  `total_rest` time NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` int NOT NULL,
  `award_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `gift` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `award_types`
--

CREATE TABLE `award_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ch_favorites`
--

CREATE TABLE `ch_favorites` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `favorite_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ch_messages`
--

CREATE TABLE `ch_messages` (
  `id` bigint NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint NOT NULL,
  `to_id` bigint NOT NULL,
  `body` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` int NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,2) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_policies`
--

CREATE TABLE `company_policies` (
  `id` bigint UNSIGNED NOT NULL,
  `branch` int NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `competencies`
--

CREATE TABLE `competencies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` bigint UNSIGNED NOT NULL,
  `complaint_from` int NOT NULL,
  `complaint_against` int NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complaint_date` date NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `id` bigint UNSIGNED NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_name` int NOT NULL,
  `value` double(15,2) DEFAULT NULL,
  `type` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `contract_description` longtext COLLATE utf8mb4_unicode_ci,
  `employee_signature` longtext COLLATE utf8mb4_unicode_ci,
  `company_signature` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_attechments`
--

CREATE TABLE `contract_attechments` (
  `id` bigint UNSIGNED NOT NULL,
  `contract_id` bigint UNSIGNED NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `files` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_comments`
--

CREATE TABLE `contract_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `contract_id` bigint UNSIGNED NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_notes`
--

CREATE TABLE `contract_notes` (
  `id` bigint UNSIGNED NOT NULL,
  `contract_id` int NOT NULL,
  `user_id` int NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_types`
--

CREATE TABLE `contract_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_questions`
--

CREATE TABLE `custom_questions` (
  `id` bigint UNSIGNED NOT NULL,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deduction_options`
--

CREATE TABLE `deduction_options` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint UNSIGNED NOT NULL,
  `account_id` int NOT NULL,
  `amount` double(15,2) NOT NULL,
  `date` date NOT NULL,
  `income_category_id` int NOT NULL,
  `payer_id` int NOT NULL,
  `payment_type_id` int NOT NULL,
  `referal_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint UNSIGNED NOT NULL,
  `department_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ducument_uploads`
--

CREATE TABLE `ducument_uploads` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `from`, `slug`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'New User', NULL, 'new_user', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(2, 'New Employee', NULL, 'new_employee', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(3, 'New Payroll', NULL, 'new_payroll', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(4, 'New Ticket', NULL, 'new_ticket', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(5, 'New Award', NULL, 'new_award', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(6, 'Employee Transfer', NULL, 'employee_transfer', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(7, 'Employee Resignation', NULL, 'employee_resignation', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(8, 'Employee Trip', NULL, 'employee_trip', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(9, 'Employee Promotion', NULL, 'employee_promotion', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(10, 'Employee Complaints', NULL, 'employee_complaints', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(11, 'Employee Warning', NULL, 'employee_warning', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(12, 'Employee Termination', NULL, 'employee_termination', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(13, 'Leave Status', NULL, 'leave_status', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(14, 'contract', NULL, 'contract', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16');

-- --------------------------------------------------------

--
-- Table structure for table `email_template_langs`
--

CREATE TABLE `email_template_langs` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` int NOT NULL,
  `lang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_template_langs`
--

INSERT INTO `email_template_langs` (`id`, `parent_id`, `lang`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'ar', 'New User', '<p>مرحبا,</p>\r\n                    <p>مرحبا بك في { app_name }.</p>\r\n                    <p>.. أنت الآن مستعمل</p>\r\n                    <p>البريد الالكتروني : { mail } كلمة السرية : { password }</p>\r\n                    <p>{ app_url }</p>\r\n                    <p>شكرا</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(2, 1, 'da', 'New User', '<p>Hej,</p>\r\n                    <p>velkommen til { app_name }.</p>\r\n                    <p>Du er nu bruger ..</p>\r\n                    <p>E-mail: { email }</p>\r\n                    <p>kodeord: { password }</p>\r\n                    <p>{ app_url }</p>\r\n                    <p>Tak.</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(3, 1, 'de', 'New User', '<p>Hallo,</p>\r\n                    <p>Willkommen bei {app_name}.</p>\r\n                    <p>Sie sind jetzt Benutzer.</p>\r\n                    <p><strong>E-Mail: {email} </strong></p>\r\n                    <p><strong>Kennwort: {password}</strong></p>\r\n                    <p>{app_url}</p>\r\n                    <p>Danke,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(4, 1, 'en', 'New User', '<p>Hello,&nbsp;<br />Welcome to {app_name}.</p>\r\n                    <p><strong>You are now user..</strong></p>\r\n                    <p><strong>Email </strong>: {email}<br /><strong>Password</strong> : {password}</p>\r\n                    <p>{app_url}</p>\r\n                    <p>Thanks,<br />{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(5, 1, 'es', 'New User', '<p>Hola,</p>\r\n                    <p>Bienvenido a {app_name}.</p>\r\n                    <p>Ahora es usuario ..</p>\r\n                    <p><strong>Correo electr&oacute;nico: {email}</strong></p>\r\n                    <p><strong> Contrase&ntilde;a: {password}</strong></p>\r\n                    <p>{app_url}</p>\r\n                    <p>Gracias,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(6, 1, 'fr', 'New User', '<p>Bonjour,</p>\r\n                    <p>Bienvenue dans { app_name }.</p>\r\n                    <p>Vous &ecirc;tes maintenant utilisateur.</p>\r\n                    <p><strong>E-mail: { email } </strong></p>\r\n                    <p><strong>Mot de passe: { password }</strong></p>\r\n                    <p>{ adresse_url }</p>\r\n                    <p>Merci,</p>\r\n                    <p>{ nom_app }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(7, 1, 'it', 'New User', '<p>Ciao,</p>\r\n                    <p>Benvenuti in {app_name}.</p>\r\n                    <p>Ora sei utente ..</p>\r\n                    <p><strong>Email: {email} </strong></p>\r\n                    <p><strong>Password: {password}</strong></p>\r\n                    <p>{app_url}</p>\r\n                    <p>Grazie,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(8, 1, 'ja', 'New User', '<p>こんにちは、</p>\r\n                    <p>{app_name}へようこそ。</p>\r\n                    <p>これで、ユーザーは</p>\r\n                    <p><strong>E メール : {email}</strong></p>\r\n                    <p><strong> パスワード : {password}</strong></p>\r\n                    <p>{app_url}</p>\r\n                    <p>ありがとう。</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(9, 1, 'nl', 'New User', '<p>Hallo,</p>\r\n                    <p>Welkom bij { app_name }.</p>\r\n                    <p>U bent nu gebruiker ..</p>\r\n                    <p><strong>E-mail: { email }</strong></p>\r\n                    <p><strong> Wachtwoord: { password }</strong></p>\r\n                    <p>{ app_url }</p>\r\n                    <p>Bedankt.</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(10, 1, 'pl', 'New User', '<p>Witaj,</p>\r\n                    <p>Witamy w aplikacji {app_name }.</p>\r\n                    <p>Jesteś teraz użytkownikiem ..</p>\r\n                    <p><strong>E-mail</strong>: {email }</p>\r\n                    <p><strong>Hasło</strong>: {password }</p>\r\n                    <p>{app_url }</p>\r\n                    <p>Dziękuję,</p>\r\n                    <p>{app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(11, 1, 'ru', 'New User', '<p>Здравствуйте,</p>\r\n                    <p>Добро пожаловать в { app_name }.</p>\r\n                    <p>Вы теперь пользователь ..</p>\r\n                    <p><strong>Адрес электронной почты</strong>: { email }</p>\r\n                    <p><strong> Пароль</strong>: { password }</p>\r\n                    <p>{ app_url }</p>\r\n                    <p>Спасибо.</p>\r\n                    <p>{ app_name&nbsp;}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(12, 1, 'pt', 'New User', '<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Ol&aacute;, </span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Bem-vindo a {app_name}.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Voc&ecirc; agora &eacute; usu&aacute;rio ..</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\"><strong>E-mail</strong>: {email}</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\"><strong> Senha</strong>: {senha}</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_url}</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(13, 1, 'tr', 'New User', '<p>Merhaba,&nbsp;<br />Hoşgeldiniz {app_name}.</p>\r\n                    <p><strong>artık kullanıcısın..</strong></p>\r\n                    <p><strong>E-posta </strong>: {email}<br /><strong>Şifre</strong> : {password}</p>\r\n                    <p>{app_url}</p>\r\n                    <p>Teşekkürler,<br />{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(14, 1, 'zh', 'New User', '<p>你好,&nbsp;<br />欢迎来到 {app_name}.</p>\r\n                    <p><strong>您现在是用户..</strong></p>\r\n                    <p><strong>电子邮件 </strong>: {email}<br /><strong>密码</strong> : {password}</p>\r\n                    <p>{app_url}</p>\r\n                    <p>谢谢,<br />{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(15, 1, 'he', 'New User', '<p>שלום,&nbsp;<br />ברוך הבא ל {app_name}.</p>\r\n                    <p><strong>אתה כעת משתמש..</strong></p>\r\n                    <p><strong>אימייל </strong>: {email}<br /><strong>סיסמה</strong> : {password}</p>\r\n                    <p>{app_url}</p>\r\n                    <p>תודה,<br />{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(16, 1, 'pt-br', 'New User', '<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Ol&aacute;, </span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Bem-vindo a {app_name}.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Voc&ecirc; agora &eacute; usu&aacute;rio ..</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\"><strong>E-mail</strong>: {email}</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\"><strong> Senha</strong>: {senha}</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_url}</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(17, 2, 'ar', 'New Employee', '<p>مرحبا { employe_name } ،</p>\r\n                    <p>مرحبا بك في { app_name }.</p>\r\n                    <p>أنت الآن موظف</p>\r\n                    <p>البريد الالكتروني : { employe_email }</p>\r\n                    <p>كلمة السرية : { employe_password }</p>\r\n                    <p>{ app_url }</p>\r\n                    <p>شكرا</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(18, 2, 'da', 'New Employee', '<p>Hej { employee_name },</p>\r\n                    <p>velkommen til { app_name }.</p>\r\n                    <p>Du er nu ansat ...</p>\r\n                    <p>E-mail: { employee_email }</p>\r\n                    <p>Kodeord: { employee_kodeord }</p>\r\n                    <p>{ app_url }</p>\r\n                    <p>Tak.</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(19, 2, 'de', 'New Employee', '<p>Hello {employee_name},</p>\r\n                    <p>Willkommen bei {app_name}.</p>\r\n                    <p>Sie sind jetzt Mitarbeiter.</p>\r\n                    <p>E-Mail: {employee_email}</p>\r\n                    <p>Kennwort: {employee_password}</p>\r\n                    <p>{app_url}</p>\r\n                    <p>Danke,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(20, 2, 'en', 'New Employee', '<p>Hello {employee_name},&nbsp;<br />Welcome to {app_name}.</p>\r\n                    <p>You are now Employee..</p>\r\n                    <p><strong>Email </strong>: {employee_email}</p>\r\n                    <p><strong>Password</strong> : {employee_password}</p>\r\n                    <p>{app_url}</p>\r\n                    <p>Thanks,<br />{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(21, 2, 'es', 'New Employee', '<p style=\"line-height: 28px;\">Hello {employee_name},</p>\r\n                    <p style=\"line-height: 28px;\">Bienvenido a {app_name}.</p>\r\n                    <p style=\"line-height: 28px;\">Ahora es Empleado.</p>\r\n                    <p style=\"line-height: 28px;\">Correo electr&oacute;nico: {employee_email}</p>\r\n                    <p style=\"line-height: 28px;\">Contrase&ntilde;a: {employee_password}</p>\r\n                    <p style=\"line-height: 28px;\">{app_url}</p>\r\n                    <p style=\"line-height: 28px;\">Gracias,</p>\r\n                    <p style=\"line-height: 28px;\">{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(22, 2, 'fr', 'New Employee', '<p style=\"line-height: 28px;\">Hello { employee_name },</p>\r\n                    <p style=\"line-height: 28px;\">Bienvenue dans { app_name }.</p>\r\n                    <p style=\"line-height: 28px;\">Vous &ecirc;tes maintenant Employ&eacute; ..</p>\r\n                    <p style=\"line-height: 28px;\">Adresse &eacute;lectronique: { employee_email }</p>\r\n                    <p style=\"line-height: 28px;\">Mot de passe: { employee_password }</p>\r\n                    <p style=\"line-height: 28px;\">{ adresse_url }</p>\r\n                    <p style=\"line-height: 28px;\">Merci,</p>\r\n                    <p style=\"line-height: 28px;\">{ nom_app }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(23, 2, 'it', 'New Employee', '<p style=\"line-height: 28px;\">Hello {employee_name},</p>\r\n                    <p style=\"line-height: 28px;\">Benvenuti in {app_name}.</p>\r\n                    <p style=\"line-height: 28px;\">Ora sei Dipendente ..</p>\r\n                    <p style=\"line-height: 28px;\">Email: {employee_email}</p>\r\n                    <p style=\"line-height: 28px;\">Password: {employee_password}</p>\r\n                    <p style=\"line-height: 28px;\">{app_url}</p>\r\n                    <p style=\"line-height: 28px;\">Grazie,</p>\r\n                    <p style=\"line-height: 28px;\">{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(24, 2, 'ja', 'New Employee', '<p>{ employee_name} にようこそ、</p>\r\n                    <p>{app_name}へようこそ。</p>\r\n                    <p>今は従業員です。</p>\r\n                    <p>E メール : {employee_email}</p>\r\n                    <p>パスワード : {employee_password}</p>\r\n                    <p>{app_url}</p>\r\n                    <p>ありがとう。</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(25, 2, 'nl', 'New Employee', '<p style=\"line-height: 28px;\">Hallo { employee_name },</p>\r\n                    <p style=\"line-height: 28px;\">Welkom bij { app_name }.</p>\r\n                    <p style=\"line-height: 28px;\">U bent nu werknemer ..</p>\r\n                    <p style=\"line-height: 28px;\">E-mail: { employee_email }</p>\r\n                    <p style=\"line-height: 28px;\">Wachtwoord: { employee_password }</p>\r\n                    <p style=\"line-height: 28px;\">{ app_url }</p>\r\n                    <p style=\"line-height: 28px;\">Bedankt.</p>\r\n                    <p style=\"line-height: 28px;\">{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(26, 2, 'pl', 'New Employee', '<p style=\"line-height: 28px;\">Witaj {employee_name },</p>\r\n                    <p style=\"line-height: 28px;\">Witamy w aplikacji {app_name }.</p>\r\n                    <p style=\"line-height: 28px;\">Jesteś teraz Pracownik ..</p>\r\n                    <p style=\"line-height: 28px;\">E-mail: {employee_email }</p>\r\n                    <p style=\"line-height: 28px;\">Hasło: {employee_password }</p>\r\n                    <p style=\"line-height: 28px;\">{app_url }</p>\r\n                    <p style=\"line-height: 28px;\">Dziękuję,</p>\r\n                    <p style=\"line-height: 28px;\">{app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(27, 2, 'ru', 'New Employee', '<p style=\"line-height: 28px;\">Здравствуйте, { employee_name },</p>\r\n                    <p style=\"line-height: 28px;\">Добро пожаловать в { app_name }.</p>\r\n                    <p style=\"line-height: 28px;\">Вы теперь-сотрудник ...</p>\r\n                    <p style=\"line-height: 28px;\">Электронная почта: { employee_email }</p>\r\n                    <p style=\"line-height: 28px;\">Пароль: { employee_password }</p>\r\n                    <p style=\"line-height: 28px;\">{ app_url }</p>\r\n                    <p style=\"line-height: 28px;\">Спасибо.</p>\r\n                    <p style=\"line-height: 28px;\">{ имя_программы }</p> ', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(28, 2, 'pt', 'New Employee', '<p>Ol&aacute; {employee_name},</p>\r\n                    <p>Bem-vindo a {app_name}.</p>\r\n                    <p>Voc&ecirc; &eacute; agora Funcion&aacute;rio ..</p>\r\n                    <p>E-mail: {employee_email}</p>\r\n                    <p>Senha: {employee_password}</p>\r\n                    <p>{app_url}</p>\r\n                    <p>Obrigado,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(29, 2, 'tr', 'New Employee', '<p>Merhaba {employee_name},&nbsp;<br />Hoşgeldiniz {app_name}.</p>\r\n                    <p>Artık Çalışansın..</p>\r\n                    <p><strong>E-posta </strong>: {employee_email}</p>\r\n                    <p><strong>Şifre</strong> : {employee_password}</p>\r\n                    <p>{app_url}</p>\r\n                    <p>Teşekkürler,<br />{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(30, 2, 'zh', 'New Employee', '<p>你好 {employee_name},&nbsp;<br />欢迎来到 {app_name}.</p>\r\n                    <p>您现在是员工..</p>\r\n                    <p><strong>电子邮件 </strong>: {employee_email}</p>\r\n                    <p><strong>密码</strong> : {employee_password}</p>\r\n                    <p>{app_url}</p>\r\n                    <p>谢谢,<br />{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(31, 2, 'he', 'New Employee', '<p>שלום {employee_name},&nbsp;<br />ברוך הבא ל {app_name}.</p>\r\n                    <p>אתה עכשיו עובד..</p>\r\n                    <p><strong>אימייל </strong>: {employee_email}</p>\r\n                    <p><strong>סיסמה</strong> : {employee_password}</p>\r\n                    <p>{app_url}</p>\r\n                    <p>תודה,<br />{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(32, 2, 'pt-br', 'New Employee', '<p>Ol&aacute; {employee_name},</p>\r\n                    <p>Bem-vindo a {app_name}.</p>\r\n                    <p>Voc&ecirc; &eacute; agora Funcion&aacute;rio ..</p>\r\n                    <p>E-mail: {employee_email}</p>\r\n                    <p>Senha: {employee_password}</p>\r\n                    <p>{app_url}</p>\r\n                    <p>Obrigado,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(33, 3, 'ar', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Subject :-إدارة الموارد البشرية / الشركة المعنية بإرسال المدفوعات عن طريق البريد الإلكتروني في وقت تأكيد الدفع.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">مرحبا { name } ،</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">أتمنى أن يجدك هذا البريد الإلكتروني جيدا برجاء الرجوع الى الدفع المتصل الى { salary_month&nbsp;}.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">اضغط ببساطة على الاختيار بأسفل</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">كشوف المرتبات</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">شكرا لك</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Regards,</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">إدارة الموارد البشرية ،</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_name }</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(34, 3, 'da', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Om: HR-departementet / Kompagniet til at sende l&oslash;nsedler via e-mail p&aring; tidspunktet for bekr&aelig;ftelsen af l&oslash;nsedlerne</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hej { name },</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">H&aring;ber denne e-mail finder dig godt! Se vedh&aelig;ftet payseddel for { salary_month }.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">klik bare p&aring; knappen nedenfor</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">L&oslash;nseddel</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Tak.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Med venlig hilsen</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">HR-afdelingen,</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_name }</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(35, 3, 'de', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Betrifft: -Personalabteilung/Firma, um Payslips per E-Mail zum Zeitpunkt der Best&auml;tigung des Auszahlungsscheins zu senden</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hi {name},</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hoffe, diese E-Mail findet dich gut! Bitte sehen Sie den angeh&auml;ngten payslip f&uuml;r {salary_month}.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Klicken Sie einfach auf den Button unten</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Payslip</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Danke.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Betrachtet,</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Personalabteilung,</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(36, 3, 'en', 'New Payroll', '<p><strong>Subject</strong>:-HR department/Company to send payslips by email at time of confirmation of payslip</p>\r\n                    <p>Hi {name},</p>\r\n                    <p>Hope this email ﬁnds you well! Please see attached payslip for {salary_month}.</p>\r\n                    <p style=\"text-align: center;\" align=\"center\"><strong>simply click on the button below </strong></p>\r\n                    <p style=\"text-align: center;\" align=\"center\"><span style=\"font-size: 18pt;\"><a style=\"background: #6676ef; color: #ffffff; font-family: \"Open Sans\", Helvetica, Arial, sans-serif; font-weight: normal; line-height: 120%; margin: 0px; text-decoration: none; text-transform: none;\" href=\"{url}\" target=\"_blank\" rel=\"noopener\"> <strong style=\"color: white; font-weight: bold; text: white;\">Payslip</strong> </a></span></p>\r\n                    <p style=\"text-align: left;\" align=\"center\">Feel free to reach out if you have any questions.</p>\r\n                    <p>Thank you</p>\r\n                    <p><strong>Regards,</strong></p>\r\n                    <p><strong>HR Department,</strong></p>\r\n                    <p><span style=\"color: #000000; font-family: \"Open Sans\", sans-serif; font-size: 14px; background-color: #ffffff;\">{<strong>app_name</strong>}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(37, 3, 'es', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Asunto: -Departamento de RRHH/Empresa para enviar n&oacute;minas por correo electr&oacute;nico en el momento de la confirmaci&oacute;n del pago</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hi {name},</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">&iexcl;Espero que este email le encuentre bien! Consulte la ficha de pago adjunta para {salary_month}.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">simplemente haga clic en el bot&oacute;n de abajo</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Payslip</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">&iexcl;Gracias!</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Considerando,</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Departamento de Recursos Humanos,</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(38, 3, 'fr', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Objet: -Ressources humaines / Entreprise pour envoyer des feuillets de paie par courriel au moment de la confirmation du paiement</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Salut { name },</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Jesp&egrave;re que ce courriel vous trouve bien ! Veuillez consulter le bordereau de paie ci-joint pour { salary_month }.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Il suffit de cliquer sur le bouton ci-dessous</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Feuillet de paiement</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Je vous remercie</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Regards,</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">D&eacute;partement des RH,</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_name }</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(39, 3, 'it', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Oggetto: - Dipartimento HR / Societ&agrave; per inviare busta paga via email al momento della conferma della busta paga</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Ciao {name},</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Spero che questa email ti trovi bene! Si prega di consultare la busta paga per {salary_month}.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">semplicemente clicca sul pulsante sottostante</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Busta paga</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Sentiti libero di raggiungere se hai domande.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Grazie</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Riguardo,</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Dipartimento HR,</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(40, 3, 'ja', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">件名:-HR 部門/企業は、給与明細書の確認時に電子メールで支払いを送信します。</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">こんにちは {name}、</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">この E メールでよくご確認ください。 {salary_month}の添付された payslip を参照してください。</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">下のボタンをクリックするだけで</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">給与明細書</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">質問がある場合は、自由に連絡してください。</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">ありがとう</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">よろしく</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">HR 部門</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(41, 3, 'nl', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Betreft: -HR-afdeling/Bedrijf om te betalen payslips per e-mail op het moment van bevestiging van de payslip</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hallo { name },</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hoop dat deze e-mail je goed vindt! Zie bijgevoegde payslip voor { salary_month }.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">gewoon klikken op de knop hieronder</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Loonstrook</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Voel je vrij om uit te reiken als je vragen hebt.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Dank u wel</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Betreft:</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">HR-afdeling,</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_name }</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(42, 3, 'pl', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Temat:-Dział HR/Firma do wysyłania payslip&oacute;w drogą mailową w czasie potwierdzania payslipa</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Witaj {name },</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Mam nadzieję, że ta wiadomość znajdzie Cię dobrze! Patrz załączony payslip dla {salary_month }.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">po prostu kliknij na przycisk poniżej</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Payslip</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Czuj się swobodnie, jeśli masz jakieś pytania.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Dziękujemy</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">W odniesieniu do</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Dział HR,</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_name }</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(43, 3, 'ru', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Тема: -HR отдел/Компания для отправки паузу по электронной почте во время подтверждения паузли</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Привет { name },</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Надеюсь, это электронное письмо найдет вас хорошо! См. вложенный раздел для { salary_month }.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">просто нажмите на кнопку внизу</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Паушлип</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Не стеснитесь, если у вас есть вопросы.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Спасибо.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">С уважением,</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Отдел кадров,</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_name }</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(44, 3, 'pt', 'New Payroll', '<p>Assunto:-Departamento de RH / Empresa para enviar payslips por e-mail no momento da confirma&ccedil;&atilde;o do payslip</p>\r\n                    <p>Oi {name},</p>\r\n                    <p>Espero que este e-mail encontre voc&ecirc; bem! Por favor, consulte o payslip anexado por {salary_month}.</p>\r\n                    <p>basta clicar no bot&atilde;o abaixo</p>\r\n                    <p>Payslip</p>\r\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\r\n                    <p>Obrigado</p>\r\n                    <p>Considera,</p>\r\n                    <p>Departamento de RH,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(45, 3, 'tr', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Konu:-İK departmanı/Şirket, maaş bordrosunun onaylanması sırasında e-posta ile maaş bordrolarını gönderecek</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Merhaba { name },</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Umarım bu e-posta sizi iyi bulur! Lütfen ekteki maaş bordrosuna bakınız { salary_month }.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">sadece aşağıdaki butona tıklayın</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">maaş bordrosu</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Herhangi bir sorunuz varsa ulaşmaktan çekinmeyin.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Teşekkür ederim.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Saygılarımızla,</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">İK Departmanı,</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_name }</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(46, 3, 'zh', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">主题：-人力资源部门/公司将在工资审批期间通过电子邮件发送工资单</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">你好 { name },</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">我希望你能收到这封电子邮件！请参阅随附的工资单 { salary_month }.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">只需点击下面的按钮</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">工资单</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">如果您有任何疑问，请随时与我们联系.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">谢谢.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">问候,</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">人事部,</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_name }</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(47, 3, 'he', 'New Payroll', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">נושא:- משאבי אנוש/חברה ישלחו באימייל תלוש שכר במהלך אישור השכר</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">שלום { name },</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">אני מקווה שתקבל את המייל הזה! נא ראה תלוש שכר מצורף { salary_month }.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">פשוט לחץ על הכפתור למטה</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">גִלְיוֹן שָׂכָר</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">אם יש לך שאלות, אנא אל תהסס לפנות אלינו.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">תודה.</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">בְּרָכָה,</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">מחלקת כוח אדם,</span></p>\r\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_name }</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(48, 3, 'pt-br', 'New Payroll', '<p>Assunto:-Departamento de RH / Empresa para enviar payslips por e-mail no momento da confirma&ccedil;&atilde;o do payslip</p>\r\n                    <p>Oi {name},</p>\r\n                    <p>Espero que este e-mail encontre voc&ecirc; bem! Por favor, consulte o payslip anexado por {salary_month}.</p>\r\n                    <p>basta clicar no bot&atilde;o abaixo</p>\r\n                    <p>Payslip</p>\r\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\r\n                    <p>Obrigado</p>\r\n                    <p>Considera,</p>\r\n                    <p>Departamento de RH,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(49, 4, 'ar', 'New Ticket', '<p>Subject : -HR ادارة / شركة لارسال ticket ل ـ { ticket_title }</p>\r\n                    <p>مرحبا { ticket_name }</p>\r\n                    <p>آمل أن يقوم هذا البريد الالكتروني بايجادك جيدا ! ، كود التذكرة الخاص بك هو { ticket_code }.</p>\r\n                    <p>{ ticket_description } ،</p>\r\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\r\n                    <p>شكرا لك</p>\r\n                    <p>Regards,</p>\r\n                    <p>إدارة الموارد البشرية ،</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(50, 4, 'da', 'New Ticket', '<p>Emne:-HR-afdeling / Kompagni til at sende ticket for { ticket_title }</p>\r\n                    <p>Hej { ticket_name },</p>\r\n                    <p>H&aring;ber denne e-mail finder dig godt, din ticket-kode er { ticket_code }.</p>\r\n                    <p>{ ticket_description },</p>\r\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\r\n                    <p>Tak.</p>\r\n                    <p>Med venlig hilsen</p>\r\n                    <p>HR-afdelingen,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(51, 4, 'de', 'New Ticket', '<p>Betreff: -Personalabteilung/Firma zum Senden von Ticket f&uuml;r {ticket_title}</p>\r\n                    <p>Hi {ticket_name},</p>\r\n                    <p>Hoffen Sie, diese E-Mail findet Sie gut!, Ihr Ticketcode ist {ticket_code}.</p>\r\n                    <p>{ticket_description},</p>\r\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\r\n                    <p>Danke.</p>\r\n                    <p>Betrachtet,</p>\r\n                    <p>Personalabteilung,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(52, 4, 'en', 'New Ticket', '<p ><b>Subject:-HR department/Company to send ticket for {ticket_title}</b></p>\r\n                    <p ><b>Hi {ticket_name},</b></p>\r\n                    <p >Hope this email ﬁnds you well! , Your ticket code is {ticket_code}. </p></br>\r\n                    {ticket_description},\r\n                    <p >Feel free to reach out if you have any questions.</p></br>\r\n                    <p><b>Thank you</b></p>\r\n                    <p><b>Regards,</b></p>\r\n                    <p><b>HR Department,</b></p>\r\n                    <p><b>{app_name}</b></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(53, 4, 'es', 'New Ticket', '<p>Asunto: -Departamento de RR.HH./Empresa para enviar el ticket de {ticket_title}</p>\r\n                    <p>Hi {ticket_name},</p>\r\n                    <p>&iexcl;Espero que este correo electr&oacute;nico te encuentre bien!, Tu c&oacute;digo de entrada es {ticket_code}.</p>\r\n                    <p>{ticket_description},</p>\r\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\r\n                    <p>&iexcl;Gracias!</p>\r\n                    <p>Considerando,</p>\r\n                    <p>Departamento de Recursos Humanos,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(54, 4, 'fr', 'New Ticket', '<p>Objet: -HR department / Company to send ticket for { ticket_title }</p>\r\n                    <p>Hi { ticket_name },</p>\r\n                    <p>Hope this email vous trouve bien !, Votre code de ticket est { ticket_code }.</p>\r\n                    <p>{ ticket_description },</p>\r\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\r\n                    <p>Je vous remercie</p>\r\n                    <p>Regards,</p>\r\n                    <p>D&eacute;partement des RH,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(55, 4, 'it', 'New Ticket', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare ticket per {ticket_title}</p>\r\n                    <p>Ciao {ticket_name},</p>\r\n                    <p>Spero che questa email ti trovi bene!, Il tuo codice del biglietto &egrave; {ticket_code}.</p>\r\n                    <p>{ticket_description},</p>\r\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\r\n                    <p>Grazie</p>\r\n                    <p>Riguardo,</p>\r\n                    <p>Dipartimento HR,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(56, 4, 'ja', 'New Ticket', '<p>件名:-HR 部門/企業は、 {ticket_title} のチケットを送信します</p>\r\n                    <p>こんにちは {ticket_name}</p>\r\n                    <p>この E メールが適切に検出されることを希望しています。チケット・コードは {ticket_code}です。</p>\r\n                    <p>{ticket_description }</p>\r\n                    <p>質問がある場合は、自由に連絡してください。</p>\r\n                    <p>ありがとう</p>\r\n                    <p>よろしく</p>\r\n                    <p>HR 部門</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(57, 4, 'nl', 'New Ticket', '<p>Betreft: -HR-afdeling/Bedrijf voor het verzenden van ticket voor { ticket_title }</p>\r\n                    <p>Hallo { ticket_name },</p>\r\n                    <p>Hoop dat deze e-mail u goed vindt!, Uw ticket code is { ticket_code }.</p>\r\n                    <p>{ ticket_description},</p>\r\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\r\n                    <p>Dank u wel</p>\r\n                    <p>Betreft:</p>\r\n                    <p>HR-afdeling,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(58, 4, 'pl', 'New Ticket', '<p>Temat:-Dział HR/Firma do wysyłki biletu dla {ticket_title }</p>\r\n                    <p>Witaj {ticket_name },</p>\r\n                    <p>Mam nadzieję, że ta wiadomość e-mail znajduje się dobrze!, Tw&oacute;j kod zgłoszenia to {ticket_code }.</p>\r\n                    <p>{ticket_description },</p>\r\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\r\n                    <p>Dziękujemy</p>\r\n                    <p>W odniesieniu do</p>\r\n                    <p>Dział HR,</p>\r\n                    <p>{app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(59, 4, 'ru', 'New Ticket', '<p>Тема: -HR отдел/Компания для отправки билета для { ticket_title }</p>\r\n                    <p>Hi { ticket_name },</p>\r\n                    <p>Надеюсь, что это письмо найдет вас хорошо!, Ваш код паспорта-{ ticket_code }.</p>\r\n                    <p>{ ticket_description },</p>\r\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\r\n                    <p>Спасибо.</p>\r\n                    <p>С уважением,</p>\r\n                    <p>Отдел кадров,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(60, 4, 'pt', 'New Ticket', '<p>Assunto:-Departamento de RH / Empresa para enviar ingresso para {ticket_title}</p>\r\n                    <p>Oi {ticket_name},</p>\r\n                    <p>Espero que este e-mail te encontre bem!, Seu c&oacute;digo de bilhete &eacute; {ticket_code}.</p>\r\n                    <p>{ticket_description},</p>\r\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\r\n                    <p>Obrigado</p>\r\n                    <p>Considera,</p>\r\n                    <p>Departamento de RH,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16');
INSERT INTO `email_template_langs` (`id`, `parent_id`, `lang`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(61, 4, 'tr', 'New Ticket', '<p ><b>Konu:-Bilet gönderilecek İK departmanı/Şirket {ticket_title}</b></p>\r\n                    <p ><b>MERHABA {ticket_name},</b></p>\r\n                    <p >Umarım bu e-posta sizi iyi bulur! , Bilet kodunuz {ticket_code}. </p></br>\r\n                    {ticket_description},\r\n                    <p >Herhangi bir sorunuz varsa çekinmeden bize ulaşın.</p></br>\r\n                    <p><b>Teşekkür ederim</b></p>\r\n                    <p><b>Saygılarımızla,</b></p>\r\n                    <p><b>İK Departmanı,</b></p>\r\n                    <p><b>{app_name}</b></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(62, 4, 'zh', 'New Ticket', '<p ><b>主题：-向其发送票据的人力资源部门/公司 {ticket_title}</b></p>\r\n                    <p ><b>你好 {ticket_name},</b></p>\r\n                    <p >希望这封电子邮件能让您满意！ , 您的机票代码是 {ticket_code}. </p></br>\r\n                    {ticket_description},\r\n                    <p >如果您有任何疑问，请随时与我们联系.</p></br>\r\n                    <p><b>谢谢</b></p>\r\n                    <p><b>问候,</b></p>\r\n                    <p><b>人事部,</b></p>\r\n                    <p><b>{app_name}</b></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(63, 4, 'he', 'New Ticket', '<p ><b>נושא:-מחלקת משאבי אנוש/חברה לשליחת כרטיס עבורה {ticket_title}</b></p>\r\n                    <p ><b>היי {ticket_name},</b></p>\r\n                    <p >מקווה שהמייל הזה ימצא אותך טוב! , קוד הכרטיס שלך הוא {ticket_code}. </p></br>\r\n                    {ticket_description},\r\n                    <p >אל תהסס לפנות אם יש לך שאלות.</p></br>\r\n                    <p><b>תודה</b></p>\r\n                    <p><b>בברכה,</b></p>\r\n                    <p><b>מחלקת משאבי אנוש,</b></p>\r\n                    <p><b>{app_name}</b></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(64, 4, 'pt-br', 'New Ticket', '<p>Assunto:-Departamento de RH / Empresa para enviar ingresso para {ticket_title}</p>\r\n                    <p>Oi {ticket_name},</p>\r\n                    <p>Espero que este e-mail te encontre bem!, Seu c&oacute;digo de bilhete &eacute; {ticket_code}.</p>\r\n                    <p>{ticket_description},</p>\r\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\r\n                    <p>Obrigado</p>\r\n                    <p>Considera,</p>\r\n                    <p>Departamento de RH,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(65, 5, 'ar', 'New Award', '<p>Subject :-إدارة الموارد البشرية / الشركة المعنية بإرسال خطاب تحكيم للاعتراف بموظف</p>\r\n                    <p>مرحبا { award_name },</p>\r\n                    <p>ويسرني كثيرا أن أرشحها { award_name }</p>\r\n                    <p>وإنني مقتنع بأن (هي / هي) هي أفضل موظفة للحصول على الجائزة. وقد أدركت أنها شخصية موجهة نحو تحقيق الأهداف ، وتتسم بالكفاءة والفعالية في التقيد بالمواعيد. إنها دائما على استعداد لمشاركة معرفتها بالتفاصيل</p>\r\n                    <p>وبالإضافة إلى ذلك ، قامت (هي / هي) أحيانا بحل النزاعات والحالات الصعبة خلال ساعات العمل. (هي / هي) حصلت على بعض الجوائز من المنظمة غير الحكومية داخل البلد ؛ وكان ذلك بسبب المشاركة في أنشطة خيرية لمساعدة المحتاجين.</p>\r\n                    <p>وأعتقد أن هذه الصفات والصفات يجب أن تكون موضع تقدير. ولذلك ، فإن (هي / هي) تستحق أن تمنحها الجائزة بالتالي.</p>\r\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\r\n                    <p>شكرا لك</p>\r\n                    <p>Regards,</p>\r\n                    <p>إدارة الموارد البشرية ،</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(66, 5, 'da', 'New Award', '<p>Om: HR-afdelingen / Kompagniet for at sende prisuddeling for at kunne genkende en medarbejder</p>\r\n                    <p>Hej { award_name },</p>\r\n                    <p>Jeg er meget glad for at nominere {award_name&nbsp;}</p>\r\n                    <p>Jeg er tilfreds med, at (hun) er den bedste medarbejder for prisen. Jeg har indset, at hun er en m&aring;lbevidst person, effektiv og meget punktlig. Hun er altid klar til at dele sin viden om detaljer.</p>\r\n                    <p>Desuden har (he/she) lejlighedsvist l&oslash;st konflikter og vanskelige situationer inden for arbejdstiden. (/hun) har modtaget nogle priser fra den ikkestatslige organisation i landet. Dette skyldes, at der skal v&aelig;re en del i velg&oslash;renhedsaktiviteter for at hj&aelig;lpe de tr&aelig;ngende.</p>\r\n                    <p>Jeg mener, at disse kvaliteter og egenskaber skal v&aelig;rds&aelig;tte. Derfor fortjener denne pris, at hun nominerer hende.</p>\r\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\r\n                    <p>Tak.</p>\r\n                    <p>Med venlig hilsen</p>\r\n                    <p>HR-afdelingen,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(67, 5, 'de', 'New Award', '<p>Betrifft: -Personalabteilung/Firma zum Versenden von Pr&auml;mienschreiben, um einen Mitarbeiter zu erkennen</p>\r\n                    <p>Hi {award_name},</p>\r\n                    <p>Ich freue mich sehr, {award_name} zu nominieren.</p>\r\n                    <p>Ich bin zufrieden, dass (he/she) der beste Mitarbeiter f&uuml;r die Auszeichnung ist. Ich habe erkannt, dass sie eine gottorientierte Person ist, effizient und sehr p&uuml;nktlich. Sie ist immer bereit, ihr Wissen &uuml;ber Details zu teilen.</p>\r\n                    <p>Dar&uuml;ber hinaus hat (he/she) gelegentlich Konflikte und schwierige Situationen innerhalb der Arbeitszeiten gel&ouml;st. (he/she) hat einige Auszeichnungen von der Nichtregierungsorganisation innerhalb des Landes erhalten; dies war wegen der Teilnahme an Wohlt&auml;tigkeitsaktivit&auml;ten, um den Bed&uuml;rftigen zu helfen.</p>\r\n                    <p>Ich glaube, diese Eigenschaften und Eigenschaften m&uuml;ssen gew&uuml;rdigt werden. Daher verdient (he/she) die Auszeichnung, die sie deshalb nominiert.</p>\r\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\r\n                    <p>Danke.</p>\r\n                    <p>Betrachtet,</p>\r\n                    <p>Personalabteilung,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(68, 5, 'en', 'New Award', '<p ><b>Subject:-HR department/Company to send award letter to recognize an employee</b></p>\r\n                    <p ><b>Hi {award_name},</b></p>\r\n                    <p >I am much pleased to nominate {award_name}  </p>\r\n                    <p >I am satisfied that (he/she) is the best employee for the award. I have realized that she is a goal-oriented person, efficient and very punctual. She is always ready to share her knowledge of details.</p>\r\n                    <p>Additionally, (he/she) has occasionally solved conflicts and difficult situations within working hours. (he/she) has received some awards from the non-governmental organization within the country; this was because of taking part in charity activities to help the needy.</p>\r\n                    <p>I believe these qualities and characteristics need to be appreciated. Therefore, (he/she) deserves the award hence nominating her.</p>\r\n                    <p>Feel free to reach out if you have any questions.</p>\r\n                    <p><b>Thank you</b></p>\r\n                    <p><b>Regards,</b></p>\r\n                    <p><b>HR Department,</b></p>\r\n                    <p><b>{app_name}</b></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(69, 5, 'es', 'New Award', '<p>Asunto: -Departamento de RRHH/Empresa para enviar carta de premios para reconocer a un empleado</p>\r\n                    <p>Hi {award_name},</p>\r\n                    <p>Estoy muy satisfecho de nominar {award_name}</p>\r\n                    <p>Estoy satisfecho de que (ella) sea el mejor empleado para el premio. Me he dado cuenta de que es una persona orientada al objetivo, eficiente y muy puntual. Ella siempre est&aacute; lista para compartir su conocimiento de los detalles.</p>\r\n                    <p>Adicionalmente, (he/ella) ocasionalmente ha resuelto conflictos y situaciones dif&iacute;ciles dentro de las horas de trabajo. (h/ella) ha recibido algunos premios de la organizaci&oacute;n no gubernamental dentro del pa&iacute;s; esto fue debido a participar en actividades de caridad para ayudar a los necesitados.</p>\r\n                    <p>Creo que estas cualidades y caracter&iacute;sticas deben ser apreciadas. Por lo tanto, (h/ella) merece el premio por lo tanto nominarla.</p>\r\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\r\n                    <p>&iexcl;Gracias!</p>\r\n                    <p>Considerando,</p>\r\n                    <p>Departamento de Recursos Humanos,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(70, 5, 'fr', 'New Award', '<p>Objet: -Minist&egrave;re des RH / Soci&eacute;t&eacute; denvoi dune lettre dattribution pour reconna&icirc;tre un employ&eacute;</p>\r\n                    <p>Hi { award_name },</p>\r\n                    <p>Je suis tr&egrave;s heureux de nommer { award_name }</p>\r\n                    <p>Je suis convaincu que (he/elle) est le meilleur employ&eacute; pour ce prix. Jai r&eacute;alis&eacute; quelle est une personne orient&eacute;e vers lobjectif, efficace et tr&egrave;s ponctuelle. Elle est toujours pr&ecirc;te &agrave; partager sa connaissance des d&eacute;tails.</p>\r\n                    <p>De plus, (he/elle) a parfois r&eacute;solu des conflits et des situations difficiles dans les heures de travail. (he/elle) a re&ccedil;u des prix de lorganisation non gouvernementale &agrave; lint&eacute;rieur du pays, parce quelle a particip&eacute; &agrave; des activit&eacute;s de bienfaisance pour aider les n&eacute;cessiteux.</p>\r\n                    <p>Je crois que ces qualit&eacute;s et ces caract&eacute;ristiques doivent &ecirc;tre appr&eacute;ci&eacute;es. Par cons&eacute;quent, (he/elle) m&eacute;rite le prix donc nomin&eacute;.</p>\r\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\r\n                    <p>Je vous remercie</p>\r\n                    <p>Regards,</p>\r\n                    <p>D&eacute;partement des RH,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(71, 5, 'it', 'New Award', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di premiazione per riconoscere un dipendente</p>\r\n                    <p>Ciao {award_name},</p>\r\n                    <p>Sono molto lieto di nominare {award_name}</p>\r\n                    <p>Sono soddisfatto che (he/lei) sia il miglior dipendente per il premio. Ho capito che &egrave; una persona orientata al goal-oriented, efficiente e molto puntuale. &Egrave; sempre pronta a condividere la sua conoscenza dei dettagli.</p>\r\n                    <p>Inoltre, (he/lei) ha occasionalmente risolto conflitti e situazioni difficili allinterno delle ore di lavoro. (he/lei) ha ricevuto alcuni premi dallorganizzazione non governativa allinterno del paese; questo perch&eacute; di prendere parte alle attivit&agrave; di beneficenza per aiutare i bisognosi.</p>\r\n                    <p>Credo che queste qualit&agrave; e caratteristiche debbano essere apprezzate. Pertanto, (he/lei) merita il premio da qui la nomina.</p>\r\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\r\n                    <p>Grazie</p>\r\n                    <p>Riguardo,</p>\r\n                    <p>Dipartimento HR,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(72, 5, 'ja', 'New Award', '<p>件名: 従業員を認識するための表彰書を送信するための、人事部門/ 会社</p>\r\n                    <p>やあ {award_name }</p>\r\n                    <p>{award_name }をノミネートしたいと考えています。</p>\r\n                    <p>私は ( 彼女が ) 賞のための最高の従業員だと満足している。 私は彼女が、自分が目標指向の人間であり、効率的で、非常に時間厳守であることに気付きました。 彼女はいつも詳細についての知識を共有する準備ができている。</p>\r\n                    <p>また、時には労働時間内に紛争や困難な状況を解決することがある。 ( 彼女は ) 国内の非政府組織からいくつかの賞を受賞している。このことは、慈善活動に参加して、貧窮者を助けるためのものだった。</p>\r\n                    <p>これらの特性と特徴を評価する必要があると思います。 そのため、 ( 相続人は ) 賞に値するので彼女を指名することになる。</p>\r\n                    <p>質問がある場合は、自由に連絡してください。</p>\r\n                    <p>ありがとう</p>\r\n                    <p>よろしく</p>\r\n                    <p>HR 部門</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(73, 5, 'nl', 'New Award', '<p>Betreft: -HR-afdeling/Bedrijf om een gunningsbrief te sturen om een werknemer te herkennen</p>\r\n                    <p>Hallo { award_name },</p>\r\n                    <p>Ik ben erg blij om { award_name } te nomineren</p>\r\n                    <p>Ik ben tevreden dat (he/zij) de beste werknemer voor de prijs is. Ik heb me gerealiseerd dat ze een doelgericht persoon is, effici&euml;nt en punctueel. Ze is altijd klaar om haar kennis van details te delen.</p>\r\n                    <p>Daarnaast heeft (he/she) af en toe conflicten en moeilijke situaties binnen de werkuren opgelost. (he/zij) heeft een aantal prijzen ontvangen van de niet-gouvernementele organisatie binnen het land; dit was vanwege het deelnemen aan liefdadigheidsactiviteiten om de behoeftigen te helpen.</p>\r\n                    <p>Ik ben van mening dat deze kwaliteiten en eigenschappen moeten worden gewaardeerd. Daarom, (he/she) verdient de award dus nomineren haar.</p>\r\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\r\n                    <p>Dank u wel</p>\r\n                    <p>Betreft:</p>\r\n                    <p>HR-afdeling,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(74, 5, 'pl', 'New Award', '<p>Temat:-Dział HR/Firma do wysyłania list&oacute;w wyr&oacute;żnienia do rozpoznania pracownika</p>\r\n                    <p>Witaj {award_name },</p>\r\n                    <p>Jestem bardzo zadowolony z nominacji {award_name }</p>\r\n                    <p>Jestem zadowolony, że (he/she) jest najlepszym pracownikiem do nagrody. Zdałem sobie sprawę, że jest osobą zorientowaną na goły, sprawną i bardzo punktualną. Zawsze jest gotowa podzielić się swoją wiedzą na temat szczeg&oacute;ł&oacute;w.</p>\r\n                    <p>Dodatkowo, (he/she) od czasu do czasu rozwiązuje konflikty i trudne sytuacje w godzinach pracy. (he/she) otrzymała kilka nagr&oacute;d od organizacji pozarządowej w obrębie kraju; to z powodu wzięcia udziału w akcji charytatywnych, aby pom&oacute;c potrzebującym.</p>\r\n                    <p>Uważam, że te cechy i cechy muszą być docenione. Dlatego też, (he/she) zasługuje na nagrodę, stąd nominowanie jej.</p>\r\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\r\n                    <p>Dziękujemy</p>\r\n                    <p>W odniesieniu do</p>\r\n                    <p>Dział HR,</p>\r\n                    <p>{app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(75, 5, 'ru', 'New Award', '<p>Тема: -HR отдел/Компания отправить награда письмо о признании сотрудника</p>\r\n                    <p>Здравствуйте, { award_name },</p>\r\n                    <p>Мне очень приятно номинировать { award_name }</p>\r\n                    <p>Я удовлетворена тем, что (х/она) является лучшим работником премии. Я понял, что она ориентированная на цель человек, эффективная и очень пунктуальная. Она всегда готова поделиться своими знаниями о деталях.</p>\r\n                    <p>Кроме того, время от времени решались конфликты и сложные ситуации в рабочее время. (она) получила некоторые награды от неправительственной организации в стране; это было связано с тем, что они приняли участие в благотворительной деятельности, чтобы помочь нуждающимся.</p>\r\n                    <p>Я считаю, что эти качества и характеристики заслуживают высокой оценки. Таким образом, она заслуживает того, чтобы наградить ее таким образом.</p>\r\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\r\n                    <p>Спасибо.</p>\r\n                    <p>С уважением,</p>\r\n                    <p>Отдел кадров,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(76, 5, 'pt', 'New Award', '<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de premia&ccedil;&atilde;o para reconhecer um funcion&aacute;rio</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Oi {award_name},</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Estou muito satisfeito em nomear {award_name}</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Estou satisfeito que (he/she) &eacute; o melhor funcion&aacute;rio para o pr&ecirc;mio. Eu percebi que ela &eacute; uma pessoa orientada a goal, eficiente e muito pontual. Ela est&aacute; sempre pronta para compartilhar seu conhecimento de detalhes.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Adicionalmente, (he/she) tem, ocasionalmente, resolvido conflitos e situa&ccedil;&otilde;es dif&iacute;ceis dentro do hor&aacute;rio de trabalho. (he/she) recebeu alguns pr&ecirc;mios da organiza&ccedil;&atilde;o n&atilde;o governamental dentro do pa&iacute;s; isso foi por ter participado de atividades de caridade para ajudar os necessitados.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Eu acredito que essas qualidades e caracter&iacute;sticas precisam ser apreciadas. Por isso, (he/she) merece o pr&ecirc;mio da&iacute; nomeando-a.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(77, 5, 'tr', 'New Award', '<p ><b>Konu:-İK departmanı/Şirket, bir çalışanı takdir etmek için ödül mektubu gönderecek</b></p>\r\n                    <p ><b>MERHABA {award_name},</b></p>\r\n                    <p >aday göstermekten çok memnunum {award_name}  </p>\r\n                    <p >(Onun) ödül için en iyi çalışan olduğuna memnunum. Hedef odaklı, verimli ve çok dakik biri olduğunu fark ettim. Ayrıntılarla ilgili bilgisini paylaşmaya her zaman hazırdır.</p>\r\n                    <p>Ayrıca, (o) zaman zaman çalışma saatleri içinde çatışmaları ve zor durumları çözmüştür. (kendisi) yurt içinde sivil toplum kuruluşlarından bazı ödüller almıştır; bunun nedeni, muhtaçlara yardım etmek için hayır faaliyetlerinde yer almaktı.</p>\r\n                    <p>Bu niteliklerin ve özelliklerin takdir edilmesi gerektiğine inanıyorum. Bu nedenle (o) ödülü hak ediyor ve onu aday gösteriyor.</p>\r\n                    <p>Herhangi bir sorunuz varsa çekinmeden bize ulaşın.</p>\r\n                    <p><b>Teşekkür ederim</b></p>\r\n                    <p><b>Saygılarımızla,</b></p>\r\n                    <p><b>İK Departmanı,</b></p>\r\n                    <p><b>{app_name}</b></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(78, 5, 'zh', 'New Award', '<p ><b>主题：-人力资源部门/公司发送奖励信以表彰员工</b></p>\r\n                    <p ><b>你好 {award_name},</b></p>\r\n                    <p >我很高兴能提名 {award_name}  </p>\r\n                    <p >我很满意（他/她）是获得该奖项的最佳员工。我发现她是一个目标明确的人，办事效率高，而且非常准时。她随时准备分享她的细节知识.</p>\r\n                    <p>另外，偶尔也会在工作时间内解决一些矛盾和困难。 （他/她）获得过国内非政府组织颁发的一些奖项；这是因为参加了帮助有需要的人的慈善活动.</p>\r\n                    <p>我相信这些品质和特征需要得到重视。因此，（他/她）值得获奖，因此提名她.</p>\r\n                    <p>如果您有任何疑问，请随时与我们联系.</p>\r\n                    <p><b>谢谢</b></p>\r\n                    <p><b>问候,</b></p>\r\n                    <p><b>人事部,</b></p>\r\n                    <p><b>{app_name}</b></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(79, 5, 'he', 'New Award', '<p ><b>נושא:-מחלקת משאבי אנוש/חברה לשלוח מכתב פרס כדי להכיר בעובד</b></p>\r\n                    <p ><b>היי {award_name},</b></p>\r\n                    <p >אני מאוד שמח למנות {award_name}  </p>\r\n                    <p >אני מרוצה ש(הוא/היא) הוא העובד הטוב ביותר עבור הפרס. הבנתי שהיא אדם ממוקד מטרה, יעילה ומאוד דייקנית. היא תמיד מוכנה לחלוק את הידע שלה בפרטים.</p>\r\n                    <p>בנוסף, (הוא/היא) פתר מדי פעם קונפליקטים ומצבים קשים בתוך שעות העבודה. (הוא/היא) קיבל כמה פרסים מהארגון הלא ממשלתי במדינה; זה היה בגלל השתתפות בפעילויות צדקה כדי לעזור לנזקקים.</p>\r\n                    <p>אני מאמין שצריך להעריך את התכונות והמאפיינים האלה. לכן, (הוא/היא) ראוי לפרס ומכאן שמינו אותה.</p>\r\n                    <p>אל תהסס לפנות אם יש לך שאלות.</p>\r\n                    <p><b>תודה</b></p>\r\n                    <p><b>בברכה,</b></p>\r\n                    <p><b>מחלקת משאבי אנוש,</b></p>\r\n                    <p><b>{app_name}</b></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(80, 5, 'pt-br', 'New Award', '<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de premia&ccedil;&atilde;o para reconhecer um funcion&aacute;rio</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Oi {award_name},</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Estou muito satisfeito em nomear {award_name}</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Estou satisfeito que (he/she) &eacute; o melhor funcion&aacute;rio para o pr&ecirc;mio. Eu percebi que ela &eacute; uma pessoa orientada a goal, eficiente e muito pontual. Ela est&aacute; sempre pronta para compartilhar seu conhecimento de detalhes.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Adicionalmente, (he/she) tem, ocasionalmente, resolvido conflitos e situa&ccedil;&otilde;es dif&iacute;ceis dentro do hor&aacute;rio de trabalho. (he/she) recebeu alguns pr&ecirc;mios da organiza&ccedil;&atilde;o n&atilde;o governamental dentro do pa&iacute;s; isso foi por ter participado de atividades de caridade para ajudar os necessitados.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Eu acredito que essas qualidades e caracter&iacute;sticas precisam ser apreciadas. Por isso, (he/she) merece o pr&ecirc;mio da&iacute; nomeando-a.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(81, 6, 'ar', 'Employee Transfer', '<p>Subject : -HR ادارة / شركة لارسال خطاب نقل الى موظف من مكان الى آخر.</p>\r\n                    <p>عزيزي { transfer_name },</p>\r\n                    <p>وفقا لتوجيهات الادارة ، يتم نقل الخدمات الخاصة بك w.e.f. { transfer_date }.</p>\r\n                    <p>مكان الادخال الجديد الخاص بك هو { transfer_department } قسم من فرع { transfer_branch } وتاريخ التحويل { transfer_date }.</p>\r\n                    <p>{ transfer_description }.</p>\r\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\r\n                    <p>شكرا لك</p>\r\n                    <p>Regards,</p>\r\n                    <p>إدارة الموارد البشرية ،</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(82, 6, 'da', 'Employee Transfer', '<p>Emne:-HR-afdelingen / kompagniet om at sende overf&oslash;rsels brev til en medarbejder fra den ene lokalitet til den anden.</p>\r\n                    <p>K&aelig;re { transfer_name },</p>\r\n                    <p>Som Styring af direktiver overf&oslash;res dine serviceydelser w.e.f. { transfer_date }.</p>\r\n                    <p>Dit nye sted for postering er { transfer_departement } afdeling af { transfer_branch } gren og dato for overf&oslash;rsel { transfer_date }.</p>\r\n                    <p>{ transfer_description }.</p>\r\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\r\n                    <p>Tak.</p>\r\n                    <p>Med venlig hilsen</p>\r\n                    <p>HR-afdelingen,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(83, 6, 'de', 'Employee Transfer', '<p>Betreff: -Personalabteilung/Unternehmen, um einen &Uuml;berweisungsschreiben an einen Mitarbeiter von einem Standort an einen anderen zu senden.</p>\r\n                    <p>Sehr geehrter {transfer_name},</p>\r\n                    <p>Wie pro Management-Direktiven werden Ihre Dienste &uuml;ber w.e.f. {transfer_date} &uuml;bertragen.</p>\r\n                    <p>Ihr neuer Ort der Entsendung ist {transfer_department} Abteilung von {transfer_branch} Niederlassung und Datum der &Uuml;bertragung {transfer_date}.</p>\r\n                    <p>{transfer_description}.</p>\r\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\r\n                    <p>Danke.</p>\r\n                    <p>Betrachtet,</p>\r\n                    <p>Personalabteilung,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(84, 6, 'en', 'Employee Transfer', '<p ><b>Subject:-HR department/Company to send transfer letter to be issued to an employee from one location to another.</b></p>\r\n                    <p ><b>Dear {transfer_name},</b></p>\r\n                    <p >As per Management directives, your services are being transferred w.e.f.{transfer_date}. </p>\r\n                    <p >Your new place of posting is {transfer_department} department of {transfer_branch} branch and date of transfer {transfer_date}. </p>\r\n                    {transfer_description}.\r\n                    <p>Feel free to reach out if you have any questions.</p>\r\n                    <p><b>Thank you</b></p>\r\n                    <p><b>Regards,</b></p>\r\n                    <p><b>HR Department,</b></p>\r\n                    <p><b>{app_name}</b></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(85, 6, 'es', 'Employee Transfer', '<p>Asunto: -Departamento de RR.HH./Empresa para enviar carta de transferencia a un empleado de un lugar a otro.</p>\r\n                    <p>Estimado {transfer_name},</p>\r\n                    <p>Seg&uacute;n las directivas de gesti&oacute;n, los servicios se transfieren w.e.f. {transfer_date}.</p>\r\n                    <p>El nuevo lugar de publicaci&oacute;n es el departamento {transfer_department} de la rama {transfer_branch} y la fecha de transferencia {transfer_date}.</p>\r\n                    <p>{transfer_description}.</p>\r\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\r\n                    <p>&iexcl;Gracias!</p>\r\n                    <p>Considerando,</p>\r\n                    <p>Departamento de Recursos Humanos,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(86, 6, 'fr', 'Employee Transfer', '<p>Objet: -Minist&egrave;re des RH / Soci&eacute;t&eacute; denvoi dune lettre de transfert &agrave; un employ&eacute; dun endroit &agrave; un autre.</p>\r\n                    <p>Cher { transfer_name },</p>\r\n                    <p>Selon les directives de gestion, vos services sont transf&eacute;r&eacute;s dans w.e.f. { transfer_date }.</p>\r\n                    <p>Votre nouveau lieu daffectation est le d&eacute;partement { transfer_department } de la branche { transfer_branch } et la date de transfert { transfer_date }.</p>\r\n                    <p>{ description_transfert }.</p>\r\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\r\n                    <p>Je vous remercie</p>\r\n                    <p>Regards,</p>\r\n                    <p>D&eacute;partement des RH,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(87, 6, 'it', 'Employee Transfer', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di trasferimento da rilasciare a un dipendente da una localit&agrave; allaltra.</p>\r\n                    <p>Caro {transfer_name},</p>\r\n                    <p>Come per le direttive di Management, i tuoi servizi vengono trasferiti w.e.f. {transfer_date}.</p>\r\n                    <p>Il tuo nuovo luogo di distacco &egrave; {transfer_department} dipartimento di {transfer_branch} ramo e data di trasferimento {transfer_date}.</p>\r\n                    <p>{transfer_description}.</p>\r\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\r\n                    <p>Grazie</p>\r\n                    <p>Riguardo,</p>\r\n                    <p>Dipartimento HR,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(88, 6, 'ja', 'Employee Transfer', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di trasferimento da rilasciare a un dipendente da una localit&agrave; allaltra.</p>\r\n                    <p>Caro {transfer_name},</p>\r\n                    <p>Come per le direttive di Management, i tuoi servizi vengono trasferiti w.e.f. {transfer_date}.</p>\r\n                    <p>Il tuo nuovo luogo di distacco &egrave; {transfer_department} dipartimento di {transfer_branch} ramo e data di trasferimento {transfer_date}.</p>\r\n                    <p>{transfer_description}.</p>\r\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\r\n                    <p>Grazie</p>\r\n                    <p>Riguardo,</p>\r\n                    <p>Dipartimento HR,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(89, 6, 'nl', 'Employee Transfer', '<p>Betreft: -HR-afdeling/Bedrijf voor verzending van overdrachtsbrief aan een werknemer van de ene plaats naar de andere.</p>\r\n                    <p>Geachte { transfer_name },</p>\r\n                    <p>Als per beheerinstructie worden uw services overgebracht w.e.f. { transfer_date }.</p>\r\n                    <p>Uw nieuwe plaats van post is { transfer_department } van de afdeling { transfer_branch } en datum van overdracht { transfer_date }.</p>\r\n                    <p>{ transfer_description }.</p>\r\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\r\n                    <p>Dank u wel</p>\r\n                    <p>Betreft:</p>\r\n                    <p>HR-afdeling,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(90, 6, 'pl', 'Employee Transfer', '<p>Temat:-Dział HR/Firma do wysyłania listu przelewowego, kt&oacute;ry ma być wydany pracownikowi z jednego miejsca do drugiego.</p>\r\n                    <p>Droga {transfer_name },</p>\r\n                    <p>Zgodnie z dyrektywami zarządzania, Twoje usługi są przesyłane w.e.f. {transfer_date }.</p>\r\n                    <p>Twoje nowe miejsce delegowania to {transfer_department } dział {transfer_branch } gałąź i data transferu {transfer_date }.</p>\r\n                    <p>{transfer_description }.</p>\r\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\r\n                    <p>Dziękujemy</p>\r\n                    <p>W odniesieniu do</p>\r\n                    <p>Dział HR,</p>\r\n                    <p>{app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(91, 6, 'ru', 'Employee Transfer', '<p>Тема: -HR отдел/Компания для отправки трансферного письма сотруднику из одного места в другое.</p>\r\n                    <p>Уважаемый { transfer_name },</p>\r\n                    <p>В соответствии с директивами управления ваши службы передаются .ef. { transfer_date }.</p>\r\n                    <p>Новое место разноски: { transfer_department} подразделение { transfer_branch } и дата передачи { transfer_date }.</p>\r\n                    <p>{ transfer_description }.</p>\r\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\r\n                    <p>Спасибо.</p>\r\n                    <p>С уважением,</p>\r\n                    <p>Отдел кадров,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(92, 6, 'pt', 'Employee Transfer', '<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de transfer&ecirc;ncia para ser emitida para um funcion&aacute;rio de um local para outro.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Querido {transfer_name},</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Conforme diretivas de Gerenciamento, seus servi&ccedil;os est&atilde;o sendo transferidos w.e.f. {transfer_date}.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">O seu novo local de postagem &eacute; {transfer_departamento} departamento de {transfer_branch} ramo e data de transfer&ecirc;ncia {transfer_date}.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{transfer_description}.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(93, 6, 'tr', 'Employee Transfer', '<p ><b>Konu:-İK departmanı/Şirket, bir çalışana bir konumdan diğerine verilecek transfer mektubunu göndermek için.</b></p>\r\n                    <p ><b>Sayın {transfer_name},</b></p>\r\n                    <p >Yönetim direktifleri uyarınca, hizmetleriniz w.e.f.{transfer_date}. </p>\r\n                    <p >Yeni gönderi yeriniz {transfer_department} Bölümü {transfer_branch} şube ve devir tarihi {transfer_date}. </p>\r\n                    {transfer_description}.\r\n                    <p>Herhangi bir sorunuz varsa çekinmeden bize ulaşın.</p>\r\n                    <p><b>Teşekkür ederim</b></p>\r\n                    <p><b>Saygılarımızla,</b></p>\r\n                    <p><b>İK Departmanı,</b></p>\r\n                    <p><b>{app_name}</b></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(94, 6, 'zh', 'Employee Transfer', '<p ><b>主题：-人力资源部门/公司将发给员工的调动信从一个地点发送到另一个地点.</b></p>\r\n                    <p ><b>亲爱的 {transfer_name},</b></p>\r\n                    <p >根据管理层指令，您的服务将在即日起转移。{transfer_date}. </p>\r\n                    <p >您的新发帖地点是 {transfer_department} 部门 {transfer_branch} 分支机构和转移日期 {transfer_date}. </p>\r\n                    {transfer_description}.\r\n                    <p>如果您有任何疑问，请随时与我们联系.</p>\r\n                    <p><b>谢谢</b></p>\r\n                    <p><b>问候,</b></p>\r\n                    <p><b>人事部,</b></p>\r\n                    <p><b>{app_name}</b></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(95, 6, 'he', 'Employee Transfer', '<p ><b>נושא:-מחלקת משאבי אנוש/חברה לשלוח מכתב העברה שיונפק לעובד ממקום אחד למשנהו.</b></p>\r\n                    <p ><b>יָקָר {transfer_name},</b></p>\r\n                    <p >בהתאם להנחיות ההנהלה, השירותים שלך מועברים w.e.f.{transfer_date}. </p>\r\n                    <p >מקום הפרסום החדש שלך הוא {transfer_department} מחלקת ה {transfer_branch} סניף ותאריך העברה {transfer_date}. </p>\r\n                    {transfer_description}.\r\n                    <p>אל תהסס לפנות אם יש לך שאלות.</p>\r\n                    <p><b>תודה</b></p>\r\n                    <p><b>בברכה,</b></p>\r\n                    <p><b>מחלקת משאבי אנוש,</b></p>\r\n                    <p><b>{app_name}</b></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(96, 6, 'pt-br', 'Employee Transfer', '<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de transfer&ecirc;ncia para ser emitida para um funcion&aacute;rio de um local para outro.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Querido {transfer_name},</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Conforme diretivas de Gerenciamento, seus servi&ccedil;os est&atilde;o sendo transferidos w.e.f. {transfer_date}.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">O seu novo local de postagem &eacute; {transfer_departamento} departamento de {transfer_branch} ramo e data de transfer&ecirc;ncia {transfer_date}.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{transfer_description}.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(97, 7, 'ar', 'Employee Resignation', '<p>Subject :-قسم الموارد البشرية / الشركة لإرسال خطاب استقالته.</p>\r\n                    <p>عزيزي { assign_user } ،</p>\r\n                    <p>إنه لمن دواعي الأسف الشديد أن أعترف رسميا باستلام إشعار استقالتك في { notice_date } الى { resignation_date } هو اليوم الأخير لعملك.</p>\r\n                    <p>لقد كان من دواعي سروري العمل معكم ، وبالنيابة عن الفريق ، أود أن أتمنى لكم أفضل جدا في جميع مساعيكم في المستقبل. ومن خلال هذه الرسالة ، يرجى العثور على حزمة معلومات تتضمن معلومات مفصلة عن عملية الاستقالة.</p>\r\n                    <p>شكرا لكم مرة أخرى على موقفكم الإيجابي والعمل الجاد كل هذه السنوات.</p>\r\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\r\n                    <p>شكرا لك</p>\r\n                    <p>Regards,</p>\r\n                    <p>إدارة الموارد البشرية ،</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(98, 7, 'da', 'Employee Resignation', '<p>Om: HR-afdelingen / Kompagniet, for at sende en opsigelse.</p>\r\n                    <p>K&aelig;re { assign_user },</p>\r\n                    <p>Det er med stor beklagelse, at jeg formelt anerkender modtagelsen af din opsigelsesmeddelelse p&aring; { notice_date } til { resignation_date } er din sidste arbejdsdag</p>\r\n                    <p>Det har v&aelig;ret en forn&oslash;jelse at arbejde sammen med Dem, og p&aring; vegne af teamet vil jeg &oslash;nske Dem det bedste i alle Deres fremtidige bestr&aelig;belser. Med dette brev kan du finde en informationspakke med detaljerede oplysninger om tilbagetr&aelig;delsesprocessen.</p>\r\n                    <p>Endnu en gang tak for Deres positive holdning og h&aring;rde arbejde i alle disse &aring;r.</p>\r\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\r\n                    <p>Tak.</p>\r\n                    <p>Med venlig hilsen</p>\r\n                    <p>HR-afdelingen,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(99, 7, 'de', 'Employee Resignation', '<p>Betreff: -Personalabteilung/Firma, um R&uuml;ckmeldungsschreiben zu senden.</p>\r\n                    <p>Sehr geehrter {assign_user},</p>\r\n                    <p>Es ist mit gro&szlig;em Bedauern, dass ich den Eingang Ihrer R&uuml;cktrittshinweis auf {notice_date} an {resignation_date} offiziell best&auml;tige, ist Ihr letzter Arbeitstag.</p>\r\n                    <p>Es war eine Freude, mit Ihnen zu arbeiten, und im Namen des Teams m&ouml;chte ich Ihnen w&uuml;nschen, dass Sie in allen Ihren zuk&uuml;nftigen Bem&uuml;hungen am besten sind. In diesem Brief finden Sie ein Informationspaket mit detaillierten Informationen zum R&uuml;cktrittsprozess.</p>\r\n                    <p>Vielen Dank noch einmal f&uuml;r Ihre positive Einstellung und harte Arbeit all die Jahre.</p>\r\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\r\n                    <p>Danke.</p>\r\n                    <p>Betrachtet,</p>\r\n                    <p>Personalabteilung,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(100, 7, 'en', 'Employee Resignation', '<p ><b>Subject:-HR department/Company to send resignation letter .</b></p>\r\n                    <p ><b>Dear {assign_user},</b></p>\r\n                    <p >It is with great regret that I formally acknowledge receipt of your resignation notice on {notice_date} to {resignation_date} is your final day of work. </p>\r\n                    <p >It has been a pleasure working with you, and on behalf of the team, I would like to wish you the very best in all your future endeavors. Included with this letter, please find an information packet with detailed information on the resignation process. </p>\r\n                    <p>Thank you again for your positive attitude and hard work all these years.</p>\r\n                    <p>Feel free to reach out if you have any questions.</p>\r\n                    <p>Thank you</p>\r\n                    <p><b>Regards,</b></p>\r\n                    <p><b>HR Department,</b></p>\r\n                    <p><b>{app_name}</b></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(101, 7, 'es', 'Employee Resignation', '<p>Asunto: -Departamento de RRHH/Empresa para enviar carta de renuncia.</p>\r\n                    <p>Estimado {assign_user},</p>\r\n                    <p>Es con gran pesar que recibo formalmente la recepci&oacute;n de su aviso de renuncia en {notice_date} a {resignation_date} es su &uacute;ltimo d&iacute;a de trabajo.</p>\r\n                    <p>Ha sido un placer trabajar con usted, y en nombre del equipo, me gustar&iacute;a desearle lo mejor en todos sus esfuerzos futuros. Incluido con esta carta, por favor encuentre un paquete de informaci&oacute;n con informaci&oacute;n detallada sobre el proceso de renuncia.</p>\r\n                    <p>Gracias de nuevo por su actitud positiva y trabajo duro todos estos a&ntilde;os.</p>\r\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\r\n                    <p>&iexcl;Gracias!</p>\r\n                    <p>Considerando,</p>\r\n                    <p>Departamento de Recursos Humanos,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(102, 7, 'fr', 'Employee Resignation', '<p>Objet: -D&eacute;partement RH / Soci&eacute;t&eacute; denvoi dune lettre de d&eacute;mission.</p>\r\n                    <p>Cher { assign_user },</p>\r\n                    <p>Cest avec grand regret que je reconnais officiellement la r&eacute;ception de votre avis de d&eacute;mission sur { notice_date } &agrave; { resignation_date } est votre dernier jour de travail.</p>\r\n                    <p>Cest un plaisir de travailler avec vous, et au nom de l&eacute;quipe, jaimerais vous souhaiter le meilleur dans toutes vos activit&eacute;s futures. Inclus avec cette lettre, veuillez trouver un paquet dinformation contenant des informations d&eacute;taill&eacute;es sur le processus de d&eacute;mission.</p>\r\n                    <p>Je vous remercie encore de votre attitude positive et de votre travail acharne durant toutes ces ann&eacute;es.</p>\r\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\r\n                    <p>Je vous remercie</p>\r\n                    <p>Regards,</p>\r\n                    <p>D&eacute;partement des RH,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(103, 7, 'it', 'Employee Resignation', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di dimissioni.</p>\r\n                    <p>Caro {assign_user},</p>\r\n                    <p>&Egrave; con grande dispiacere che riconosca formalmente la ricezione del tuo avviso di dimissioni su {notice_date} a {resignation_date} &egrave; la tua giornata di lavoro finale.</p>\r\n                    <p>&Egrave; stato un piacere lavorare con voi, e a nome della squadra, vorrei augurarvi il massimo in tutti i vostri futuri sforzi. Incluso con questa lettera, si prega di trovare un pacchetto informativo con informazioni dettagliate sul processo di dimissioni.</p>\r\n                    <p>Grazie ancora per il vostro atteggiamento positivo e duro lavoro in tutti questi anni.</p>\r\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\r\n                    <p>Grazie</p>\r\n                    <p>Riguardo,</p>\r\n                    <p>Dipartimento HR,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(104, 7, 'ja', 'Employee Resignation', '<p>件名:-HR 部門/企業は辞表を送信します。</p>\r\n                    <p>{assign_user} の認証を解除します。</p>\r\n                    <p>{ notice_date} に対するあなたの辞任通知を { resignation_date} に正式に受理することを正式に確認することは、非常に残念です。</p>\r\n                    <p>あなたと一緒に仕事をしていて、チームのために、あなたの将来の努力において、あなたのことを最高のものにしたいと思っています。 このレターには、辞任プロセスに関する詳細な情報が記載されている情報パケットをご覧ください。</p>\r\n                    <p>これらの長年の前向きな姿勢と努力を重ねて感謝します。</p>\r\n                    <p>質問がある場合は、自由に連絡してください。</p>\r\n                    <p>ありがとう</p>\r\n                    <p>よろしく</p>\r\n                    <p>HR 部門</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(105, 7, 'nl', 'Employee Resignation', '<p>Betreft: -HR-afdeling/Bedrijf om ontslagbrief te sturen.</p>\r\n                    <p>Geachte { assign_user },</p>\r\n                    <p>Het is met grote spijt dat ik de ontvangst van uw ontslagbrief op { notice_date } tot { resignation_date } formeel de ontvangst van uw laatste dag van het werk bevestigt.</p>\r\n                    <p>Het was een genoegen om met u samen te werken, en namens het team zou ik u het allerbeste willen wensen in al uw toekomstige inspanningen. Vermeld bij deze brief een informatiepakket met gedetailleerde informatie over het ontslagproces.</p>\r\n                    <p>Nogmaals bedankt voor uw positieve houding en hard werken al die jaren.</p>\r\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\r\n                    <p>Dank u wel</p>\r\n                    <p>Betreft:</p>\r\n                    <p>HR-afdeling,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(106, 7, 'pl', 'Employee Resignation', '<p>Temat: -Dział HR/Firma do wysyłania listu rezygnacyjnego.</p>\r\n                    <p>Drogi użytkownika {assign_user },</p>\r\n                    <p>Z wielkim żalem, że oficjalnie potwierdzam otrzymanie powiadomienia o rezygnacji w dniu {notice_date } to {resignation_date } to tw&oacute;j ostatni dzień pracy.</p>\r\n                    <p>Z przyjemnością wsp&oacute;łpracujemy z Tobą, a w imieniu zespołu chciałbym życzyć Wam wszystkiego najlepszego we wszystkich swoich przyszłych przedsięwzięciu. Dołączone do tego listu prosimy o znalezienie pakietu informacyjnego ze szczeg&oacute;łowymi informacjami na temat procesu dymisji.</p>\r\n                    <p>Jeszcze raz dziękuję za pozytywne nastawienie i ciężką pracę przez te wszystkie lata.</p>\r\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\r\n                    <p>Dziękujemy</p>\r\n                    <p>W odniesieniu do</p>\r\n                    <p>Dział HR,</p>\r\n                    <p>{app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16');
INSERT INTO `email_template_langs` (`id`, `parent_id`, `lang`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(107, 7, 'ru', 'Employee Resignation', '<p>Тема: -HR отдел/Компания отправить письмо об отставке.</p>\r\n                    <p>Уважаемый пользователь { assign_user },</p>\r\n                    <p>С большим сожалением я официально подтверждаю получение вашего уведомления об отставке { notice_date } в { resignation_date }-это ваш последний день работы.</p>\r\n                    <p>С Вами было приятно работать, и от имени команды я хотел бы по# желать вам самого лучшего во всех ваших будущих начинаниях. В этом письме Вы можете найти информационный пакет с подробной информацией об отставке.</p>\r\n                    <p>Еще раз спасибо за ваше позитивное отношение и трудолюбие все эти годы.</p>\r\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\r\n                    <p>Спасибо.</p>\r\n                    <p>С уважением,</p>\r\n                    <p>Отдел кадров,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(108, 7, 'pt', 'Employee Resignation', '<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de demiss&atilde;o.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Querido {assign_user},</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">&Eacute; com grande pesar que reconhe&ccedil;o formalmente o recebimento do seu aviso de demiss&atilde;o em {notice_date} a {resignation_date} &eacute; o seu dia final de trabalho.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Foi um prazer trabalhar com voc&ecirc;, e em nome da equipe, gostaria de desej&aacute;-lo o melhor em todos os seus futuros empreendimentos. Inclu&iacute;dos com esta carta, por favor, encontre um pacote de informa&ccedil;&otilde;es com informa&ccedil;&otilde;es detalhadas sobre o processo de demiss&atilde;o.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado novamente por sua atitude positiva e trabalho duro todos esses anos.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(109, 7, 'tr', 'Employee Resignation', '<p ><b>Konu:-İstifa mektubu gönderilecek İK departmanı/Şirket.</b></p>\r\n                    <p ><b>Sayın {assign_user},</b></p>\r\n                    <p >İstifa bildiriminizi aldığımı büyük bir üzüntüyle resmen kabul ediyorum {notice_date} ile {resignation_date} işin son günü. </p>\r\n                    <p >Sizinle çalışmak bir zevkti ve ekip adına, gelecekteki tüm çabalarınızda size en iyisini diliyorum. Bu mektuba ek olarak, lütfen istifa süreci hakkında ayrıntılı bilgi içeren bir bilgi paketi bulun. </p>\r\n                    <p>Tüm bu yıllar boyunca olumlu tutumunuz ve sıkı çalışmanız için tekrar teşekkür ederiz.</p>\r\n                    <p>Herhangi bir sorunuz varsa ulaşmaktan çekinmeyin.</p>\r\n                    <p>Teşekkür ederim</p>\r\n                    <p><b>Saygılarımızla,</b></p>\r\n                    <p><b>İK Departmanı,</b></p>\r\n                    <p><b>{app_name}</b></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(110, 7, 'zh', 'Employee Resignation', '<p ><b>主题：-人力资源部/公司发送辞职信 .</b></p>\r\n                    <p ><b>亲爱的 {assign_user},</b></p>\r\n                    <p >我非常遗憾地正式确认收到您的辞职通知 {notice_date} 到 {resignation_date} 是你最后一天的工作. </p>\r\n                    <p >与您合作非常愉快，我谨代表团队祝愿您在未来的工作中一切顺利。请在这封信中找到一个信息包，其中包含有关辞职流程的详细信息. </p>\r\n                    <p>再次感谢您这些年来的积极态度和努力.</p>\r\n                    <p>如果您有任何疑问，请随时与我们联系.</p>\r\n                    <p>谢谢</p>\r\n                    <p><b>问候,</b></p>\r\n                    <p><b>人事部,</b></p>\r\n                    <p><b>{app_name}</b></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(111, 7, 'he', 'Employee Resignation', '<p ><b>נושא:-מחלקת משאבי אנוש/חברה לשלוח מכתב התפטרות .</b></p>\r\n                    <p ><b>יָקָר {assign_user},</b></p>\r\n                    <p >בצער רב אני מאשר רשמית את קבלת הודעת ההתפטרות שלך ביום {notice_date} ל {resignation_date} הוא היום האחרון לעבודה שלך. </p>\r\n                    <p >היה לי תענוג לעבוד איתך, ובשם הצוות, אני רוצה לאחל לך את הטוב ביותר בכל העשייה העתידית שלך. מצורף למכתב זה, נא למצוא חבילת מידע עם מידע מפורט על תהליך ההתפטרות. </p>\r\n                    <p>שוב תודה לך על הגישה החיובית והעבודה הקשה כל השנים.</p>\r\n                    <p>אל תהסס לפנות אם יש לך שאלות.</p>\r\n                    <p>תודה</p>\r\n                    <p><b>בברכה,</b></p>\r\n                    <p><b>מחלקת משאבי אנוש,</b></p>\r\n                    <p><b>{app_name}</b></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(112, 7, 'pt-br', 'Employee Resignation', '<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de demiss&atilde;o.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Querido {assign_user},</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">&Eacute; com grande pesar que reconhe&ccedil;o formalmente o recebimento do seu aviso de demiss&atilde;o em {notice_date} a {resignation_date} &eacute; o seu dia final de trabalho.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Foi um prazer trabalhar com voc&ecirc;, e em nome da equipe, gostaria de desej&aacute;-lo o melhor em todos os seus futuros empreendimentos. Inclu&iacute;dos com esta carta, por favor, encontre um pacote de informa&ccedil;&otilde;es com informa&ccedil;&otilde;es detalhadas sobre o processo de demiss&atilde;o.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado novamente por sua atitude positiva e trabalho duro todos esses anos.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(113, 8, 'ar', 'Employee Trip', '<p>Subject : -HR ادارة / شركة لارسال رسالة رحلة.</p>\r\n                    <p>عزيزي { employee_trip_name },</p>\r\n                    <p>قمة الصباح إليك ! أكتب إلى مكتب إدارتكم بطلب متواضع للسفر من أجل زيارة إلى الخارج عن قصد.</p>\r\n                    <p>وسيكون هذا المنتدى هو المنتدى الرئيسي لأعمال المناخ في العام ، وقد كان محظوظا بما فيه الكفاية لكي يرشح لتمثيل شركتنا والمنطقة خلال الحلقة الدراسية.</p>\r\n                    <p>إن عضويتي التي دامت ثلاث سنوات كجزء من المجموعة والمساهمات التي قدمتها إلى الشركة ، ونتيجة لذلك ، كانت مفيدة من الناحية التكافلية. وفي هذا الصدد ، فإنني أطلب منكم بصفتي الرئيس المباشر لي أن يسمح لي بالحضور.</p>\r\n                    <p>مزيد من التفاصيل عن الرحلة :&nbsp;</p>\r\n                    <p>مدة الرحلة : { start_date } الى { end_date }</p>\r\n                    <p>الغرض من الزيارة : { purpose_of_visit }</p>\r\n                    <p>مكان الزيارة : { place_of_visit }</p>\r\n                    <p>الوصف : { trip_description }</p>\r\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\r\n                    <p>شكرا لك</p>\r\n                    <p>Regards,</p>\r\n                    <p>إدارة الموارد البشرية ،</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(114, 8, 'da', 'Employee Trip', '<p>Om: HR-afdelingen / Kompagniet, der skal sende udflugten.</p>\r\n                    <p>K&aelig;re { employee_trip_name },</p>\r\n                    <p>Godmorgen til dig! Jeg skriver til dit kontor med en ydmyg anmodning om at rejse for en { purpose_of_visit } i udlandet.</p>\r\n                    <p>Det ville v&aelig;re &aring;rets f&oslash;rende klimaforum, og det ville v&aelig;re heldigt nok at blive nomineret til at repr&aelig;sentere vores virksomhed og regionen under seminaret.</p>\r\n                    <p>Mit tre&aring;rige medlemskab som en del af den gruppe og de bidrag, jeg har givet til virksomheden, har som f&oslash;lge heraf v&aelig;ret symbiotisk fordelagtigt. I den henseende anmoder jeg om, at De som min n&aelig;rmeste overordnede giver mig lov til at deltage.</p>\r\n                    <p>Flere oplysninger om turen:</p>\r\n                    <p>Trip Duration: { start_date } til { end_date }</p>\r\n                    <p>Form&aring;let med Bes&oslash;g: { purpose_of_visit }</p>\r\n                    <p>Plads af bes&oslash;g: { place_of_visit }</p>\r\n                    <p>Beskrivelse: { trip_description }</p>\r\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\r\n                    <p>Tak.</p>\r\n                    <p>Med venlig hilsen</p>\r\n                    <p>HR-afdelingen,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(115, 8, 'de', 'Employee Trip', '<p>Betreff: -Personalabteilung/Firma, um Reisebrief zu schicken.</p>\r\n                    <p>Sehr geehrter {employee_trip_name},</p>\r\n                    <p>Top of the morning to you! Ich schreibe an Ihre Dienststelle mit dem&uuml;tiger Bitte um eine Reise nach einem {purpose_of_visit} im Ausland.</p>\r\n                    <p>Es w&auml;re das f&uuml;hrende Klima-Business-Forum des Jahres und hatte das Gl&uuml;ck, nominiert zu werden, um unser Unternehmen und die Region w&auml;hrend des Seminars zu vertreten.</p>\r\n                    <p>Meine dreij&auml;hrige Mitgliedschaft als Teil der Gruppe und die Beitr&auml;ge, die ich an das Unternehmen gemacht habe, sind dadurch symbiotisch vorteilhaft gewesen. In diesem Zusammenhang ersuche ich Sie als meinen unmittelbaren Vorgesetzten, mir zu gestatten, zu besuchen.</p>\r\n                    <p>Mehr Details zu Reise:</p>\r\n                    <p>Dauer der Fahrt: {start_date} bis {end_date}</p>\r\n                    <p>Zweck des Besuchs: {purpose_of_visit}</p>\r\n                    <p>Ort des Besuchs: {place_of_visit}</p>\r\n                    <p>Beschreibung: {trip_description}</p>\r\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\r\n                    <p>Danke.</p>\r\n                    <p>Betrachtet,</p>\r\n                    <p>Personalabteilung,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(116, 8, 'en', 'Employee Trip', '<p><strong>Subject:-HR department/Company to send trip letter .</strong></p>\r\n                    <p><strong>Dear {employee_trip_name},</strong></p>\r\n                    <p>Top of the morning to you! I am writing to your department office with a humble request to travel for a {purpose_of_visit} abroad.</p>\r\n                    <p>It would be the leading climate business forum of the year and have been lucky enough to be nominated to represent our company and the region during the seminar.</p>\r\n                    <p>My three-year membership as part of the group and contributions I have made to the company, as a result, have been symbiotically beneficial. In that regard, I am requesting you as my immediate superior to permit me to attend.</p>\r\n                    <p>More detail about trip:{start_date} to {end_date}</p>\r\n                    <p>Trip Duration:{start_date} to {end_date}</p>\r\n                    <p>Purpose of Visit:{purpose_of_visit}</p>\r\n                    <p>Place of Visit:{place_of_visit}</p>\r\n                    <p>Description:{trip_description}</p>\r\n                    <p>Feel free to reach out if you have any questions.</p>\r\n                    <p>Thank you</p>\r\n                    <p><strong>Regards,</strong></p>\r\n                    <p><strong>HR Department,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(117, 8, 'es', 'Employee Trip', '<p>Asunto: -Departamento de RRHH/Empresa para enviar carta de viaje.</p>\r\n                    <p>Estimado {employee_trip_name},</p>\r\n                    <p>&iexcl;Top de la ma&ntilde;ana para ti! Estoy escribiendo a su oficina del departamento con una humilde petici&oacute;n de viajar para un {purpose_of_visit} en el extranjero.</p>\r\n                    <p>Ser&iacute;a el principal foro de negocios clim&aacute;ticos del a&ntilde;o y han tenido la suerte de ser nominados para representar a nuestra compa&ntilde;&iacute;a y a la regi&oacute;n durante el seminario.</p>\r\n                    <p>Mi membres&iacute;a de tres a&ntilde;os como parte del grupo y las contribuciones que he hecho a la compa&ntilde;&iacute;a, como resultado, han sido simb&oacute;ticamente beneficiosos. En ese sentido, le estoy solicitando como mi superior inmediato que me permita asistir.</p>\r\n                    <p>M&aacute;s detalles sobre el viaje:&nbsp;</p>\r\n                    <p>Duraci&oacute;n del viaje: {start_date} a {end_date}</p>\r\n                    <p>Finalidad de la visita: {purpose_of_visit}</p>\r\n                    <p>Lugar de visita: {place_of_visit}</p>\r\n                    <p>Descripci&oacute;n: {trip_description}</p>\r\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\r\n                    <p>&iexcl;Gracias!</p>\r\n                    <p>Considerando,</p>\r\n                    <p>Departamento de Recursos Humanos,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(118, 8, 'fr', 'Employee Trip', '<p>Objet: -Service des RH / Compagnie pour envoyer une lettre de voyage.</p>\r\n                    <p>Cher { employee_trip_name },</p>\r\n                    <p>Top of the morning to you ! J&eacute;crai au bureau de votre minist&egrave;re avec une humble demande de voyage pour une {purpose_of_visit } &agrave; l&eacute;tranger.</p>\r\n                    <p>Il sagit du principal forum sur le climat de lann&eacute;e et a eu la chance d&ecirc;tre d&eacute;sign&eacute; pour repr&eacute;senter notre entreprise et la r&eacute;gion au cours du s&eacute;minaire.</p>\r\n                    <p>Mon adh&eacute;sion de trois ans au groupe et les contributions que jai faites &agrave; lentreprise, en cons&eacute;quence, ont &eacute;t&eacute; b&eacute;n&eacute;fiques sur le plan symbiotique. &Agrave; cet &eacute;gard, je vous demande d&ecirc;tre mon sup&eacute;rieur imm&eacute;diat pour me permettre dy assister.</p>\r\n                    <p>Plus de d&eacute;tails sur le voyage:</p>\r\n                    <p>Dur&eacute;e du voyage: { start_date } &agrave; { end_date }</p>\r\n                    <p>Objet de la visite: { purpose_of_visit}</p>\r\n                    <p>Lieu de visite: { place_of_visit }</p>\r\n                    <p>Description: { trip_description }</p>\r\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\r\n                    <p>Je vous remercie</p>\r\n                    <p>Regards,</p>\r\n                    <p>D&eacute;partement des RH,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(119, 8, 'it', 'Employee Trip', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di viaggio.</p>\r\n                    <p>Caro {employee_trip_name},</p>\r\n                    <p>In cima al mattino a te! Scrivo al tuo ufficio dipartimento con umile richiesta di viaggio per un {purpose_of_visit} allestero.</p>\r\n                    <p>Sarebbe il forum aziendale sul clima leader dellanno e sono stati abbastanza fortunati da essere nominati per rappresentare la nostra azienda e la regione durante il seminario.</p>\r\n                    <p>La mia adesione triennale come parte del gruppo e i contributi che ho apportato allazienda, di conseguenza, sono stati simbioticamente vantaggiosi. A tal proposito, vi chiedo come mio immediato superiore per consentirmi di partecipare.</p>\r\n                    <p>Pi&ugrave; dettagli sul viaggio:</p>\r\n                    <p>Trip Duration: {start_date} a {end_date}</p>\r\n                    <p>Finalit&agrave; di Visita: {purpose_of_visit}</p>\r\n                    <p>Luogo di Visita: {place_of_visit}</p>\r\n                    <p>Descrizione: {trip_description}</p>\r\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\r\n                    <p>Grazie</p>\r\n                    <p>Riguardo,</p>\r\n                    <p>Dipartimento HR,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(120, 8, 'ja', 'Employee Trip', '<p>件名:-HR 部門/会社は出張レターを送信します。</p>\r\n                    <p>{ employee_trip_name} に出庫します。</p>\r\n                    <p>朝のトップだ ! 海外で {purpose_of_visit} をお願いしたいという謙虚な要求をもって、私はあなたの部署に手紙を書いています。</p>\r\n                    <p>これは、今年の主要な気候ビジネス・フォーラムとなり、セミナーの開催中に当社と地域を代表する候補になるほど幸運にも恵まれています。</p>\r\n                    <p>私が会社に対して行った 3 年間のメンバーシップは、その結果として、共生的に有益なものでした。 その点では、私は、私が出席することを許可することを、私の即座の上司として</p>\r\n                    <p>トリップについての詳細 :</p>\r\n                    <p>トリップ期間:{start_date} を {end_date} に設定します</p>\r\n                    <p>アクセスの目的 :{purpose_of_visit}</p>\r\n                    <p>訪問の場所 :{place_of_visit}</p>\r\n                    <p>説明:{trip_description}</p>\r\n                    <p>質問がある場合は、自由に連絡してください。</p>\r\n                    <p>ありがとう</p>\r\n                    <p>よろしく</p>\r\n                    <p>HR 部門</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(121, 8, 'nl', 'Employee Trip', '<p>Betreft: -HR-afdeling/Bedrijf om reisbrief te sturen.</p>\r\n                    <p>Geachte { employee_trip_name },</p>\r\n                    <p>Top van de ochtend aan u! Ik schrijf uw afdelingsbureau met een bescheiden verzoek om een { purpose_of_visit } in het buitenland te bezoeken.</p>\r\n                    <p>Het zou het toonaangevende klimaatforum van het jaar zijn en hebben het geluk gehad om genomineerd te worden om ons bedrijf en de regio te vertegenwoordigen tijdens het seminar.</p>\r\n                    <p>Mijn driejarige lidmaatschap als onderdeel van de groep en bijdragen die ik heb geleverd aan het bedrijf, als gevolg daarvan, zijn symbiotisch gunstig geweest. Wat dat betreft, verzoek ik u als mijn directe chef mij in staat te stellen aanwezig te zijn.</p>\r\n                    <p>Meer details over reis:</p>\r\n                    <p>Duur van reis: { start_date } tot { end_date }</p>\r\n                    <p>Doel van bezoek: { purpose_of_visit }</p>\r\n                    <p>Plaats van bezoek: { place_of_visit }</p>\r\n                    <p>Beschrijving: { trip_description }</p>\r\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\r\n                    <p>Dank u we</p>\r\n                    <p>Betreft:</p>\r\n                    <p>HR-afdeling,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(122, 8, 'pl', 'Employee Trip', '<p>Temat:-Dział HR/Firma do wysyłania listu podr&oacute;ży.</p>\r\n                    <p>Szanowny {employee_trip_name },</p>\r\n                    <p>Od samego rana do Ciebie! Piszę do twojego biura, z pokornym prośbą o wyjazd na {purpose_of_visit&nbsp;} za granicą.</p>\r\n                    <p>Byłoby to wiodącym forum biznesowym w tym roku i miało szczęście być nominowane do reprezentowania naszej firmy i regionu podczas seminarium.</p>\r\n                    <p>Moje trzyletnie członkostwo w grupie i składkach, kt&oacute;re uczyniłem w firmie, w rezultacie, były symbiotycznie korzystne. W tym względzie, zwracam się do pana o m&oacute;j bezpośredni przełożony, kt&oacute;ry pozwoli mi na udział w tej sprawie.</p>\r\n                    <p>Więcej szczeg&oacute;ł&oacute;w na temat wyjazdu:</p>\r\n                    <p>Czas trwania rejsu: {start_date } do {end_date }</p>\r\n                    <p>Cel wizyty: {purpose_of_visit }</p>\r\n                    <p>Miejsce wizyty: {place_of_visit }</p>\r\n                    <p>Opis: {trip_description }</p>\r\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\r\n                    <p>Dziękujemy</p>\r\n                    <p>W odniesieniu do</p>\r\n                    <p>Dział HR,</p>\r\n                    <p>{app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(123, 8, 'ru', 'Employee Trip', '<p>Тема: -HR отдел/Компания для отправки письма на поездку.</p>\r\n                    <p>Уважаемый { employee_trip_name },</p>\r\n                    <p>С утра до тебя! Я пишу в ваш отдел с смиренным запросом на поездку за границу.</p>\r\n                    <p>Это был бы ведущий климатический бизнес-форум года и по везло, что в ходе семинара он будет представлять нашу компанию и регион.</p>\r\n                    <p>Мое трехлетнее членство в составе группы и взносы, которые я внес в компанию, в результате, были симбиотически выгодны. В этой связи я прошу вас как моего непосредственного начальника разрешить мне присутствовать.</p>\r\n                    <p>Подробнее о поездке:</p>\r\n                    <p>Длительность поездки: { start_date } в { end_date }</p>\r\n                    <p>Цель посещения: { purpose_of_visit }</p>\r\n                    <p>Место посещения: { place_of_visit }</p>\r\n                    <p>Описание: { trip_description }</p>\r\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\r\n                    <p>Спасибо.</p>\r\n                    <p>С уважением,</p>\r\n                    <p>Отдел кадров,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(124, 8, 'pt', 'Employee Trip', '<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de viagem.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Querido {employee_trip_name},</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Topo da manh&atilde; para voc&ecirc;! Estou escrevendo para o seu departamento de departamento com um humilde pedido para viajar por um {purpose_of_visit} no exterior.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Seria o principal f&oacute;rum de neg&oacute;cios clim&aacute;tico do ano e teve a sorte de ser indicado para representar nossa empresa e a regi&atilde;o durante o semin&aacute;rio.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">A minha filia&ccedil;&atilde;o de tr&ecirc;s anos como parte do grupo e contribui&ccedil;&otilde;es que fiz &agrave; empresa, como resultado, foram simbioticamente ben&eacute;fico. A esse respeito, solicito que voc&ecirc; seja meu superior imediato para me permitir comparecer.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Mais detalhes sobre viagem:</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Trip Dura&ccedil;&atilde;o: {start_date} a {end_date}</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Objetivo da Visita: {purpose_of_visit}</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Local de Visita: {place_of_visit}</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Descri&ccedil;&atilde;o: {trip_description}</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(125, 8, 'tr', 'Employee Trip', '<p><strong>Konu:-İK departmanı/Şirket gezi mektubu gönderecek .</strong></p>\r\n                    <p><strong>Sayın {employee_trip_name},</strong></p>\r\n                    <p>Size sabahın en iyisi! Mütevazi bir seyahat talebiyle departman ofisinize yazıyorum {purpose_of_visit} yurt dışı.</p>\r\n                    <p>Yılın önde gelen iklim iş forumu olacaktı ve seminer sırasında şirketimizi ve bölgeyi temsil edecek kadar şanslıydık.</p>\r\n                    <p>Grubun bir parçası olarak üç yıllık üyeliğim ve bunun sonucunda şirkete yaptığım katkılar simbiyotik olarak faydalı oldu. Bu bağlamda, acil amirim olarak katılmama izin vermenizi rica ediyorum.</p>\r\n                    <p>Gezi hakkında daha fazla detay:{start_date} ile {end_date}</p>\r\n                    <p>Yolculuk Süresi:{start_date} ile {end_date}</p>\r\n                    <p>Ziyaret amacı:{purpose_of_visit}</p>\r\n                    <p>Ziyaret Yeri:{place_of_visit}</p>\r\n                    <p>Tanım:{trip_description}</p>\r\n                    <p>Herhangi bir sorunuz varsa ulaşmaktan çekinmeyin.</p>\r\n                    <p>Teşekkür ederim</p>\r\n                    <p><strong>Saygılarımızla,</strong></p>\r\n                    <p><strong>İK Departmanı,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(126, 8, 'zh', 'Employee Trip', '<p><strong>主题：-HR部门/公司发送出差函 .</strong></p>\r\n                    <p><strong>亲爱的 {employee_trip_name},</strong></p>\r\n                    <p>早上好！我写信给你们的部门办公室，提出一个小小的旅行请求 {purpose_of_visit} 国外.</p>\r\n                    <p>这将是今年领先的气候商业论坛，我们很幸运能够被提名在研讨会上代表我们公司和该地区.</p>\r\n                    <p>我作为团队成员的三年会员身份以及我对公司做出的贡献是共生有益的。在这方面，我请求你作为我的直接上级允许我参加.</p>\r\n                    <p>有关行程的更多详细信息:{start_date} 到 {end_date}</p>\r\n                    <p>行程持续时间:{start_date} 到 {end_date}</p>\r\n                    <p>参观的目的:{purpose_of_visit}</p>\r\n                    <p>参观地点:{place_of_visit}</p>\r\n                    <p>描述:{trip_description}</p>\r\n                    <p>如果您有任何疑问，请随时与我们联系.</p>\r\n                    <p>谢谢</p>\r\n                    <p><strong>问候,</strong></p>\r\n                    <p><strong>人事部,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(127, 8, 'he', 'Employee Trip', '<p><strong>נושא:-מחלקת משאבי אנוש/חברה לשלוח מכתב טיול .</strong></p>\r\n                    <p><strong>יָקָר {employee_trip_name},</strong></p>\r\n                    <p>שיא הבוקר לך! אני כותב למשרד המחלקה שלך עם בקשה צנועה לנסוע לא {purpose_of_visit} מחוץ לארץ.</p>\r\n                    <p>זה יהיה פורום עסקי האקלים המוביל של השנה והתמזל מזלי להיות מועמד לייצג את החברה שלנו ואת האזור במהלך הסמינר.</p>\r\n                    <p>חברותי בת שלוש שנים כחלק מהקבוצה והתרומות שתרמתי לחברה, כתוצאה מכך, הועילו באופן סימביוטי. בהקשר זה, אני מבקש ממך כמפקד הישיר שלי להתיר לי להשתתף.</p>\r\n                    <p>פרטים נוספים על הטיול:{start_date} ל {end_date}</p>\r\n                    <p>משך הטיול:{start_date} ל {end_date}</p>\r\n                    <p>מטרת הביקור:{purpose_of_visit}</p>\r\n                    <p>מקום ביקור:{place_of_visit}</p>\r\n                    <p>תיאור:{trip_description}</p>\r\n                    <p>אל תהסס לפנות אם יש לך שאלות.</p>\r\n                    <p>תודה</p>\r\n                    <p><strong>בברכה,</strong></p>\r\n                    <p><strong>מחלקת משאבי אנוש,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(128, 8, 'pt-br', 'Employee Trip', '<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de viagem.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Querido {employee_trip_name},</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Topo da manh&atilde; para voc&ecirc;! Estou escrevendo para o seu departamento de departamento com um humilde pedido para viajar por um {purpose_of_visit} no exterior.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Seria o principal f&oacute;rum de neg&oacute;cios clim&aacute;tico do ano e teve a sorte de ser indicado para representar nossa empresa e a regi&atilde;o durante o semin&aacute;rio.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">A minha filia&ccedil;&atilde;o de tr&ecirc;s anos como parte do grupo e contribui&ccedil;&otilde;es que fiz &agrave; empresa, como resultado, foram simbioticamente ben&eacute;fico. A esse respeito, solicito que voc&ecirc; seja meu superior imediato para me permitir comparecer.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Mais detalhes sobre viagem:</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Trip Dura&ccedil;&atilde;o: {start_date} a {end_date}</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Objetivo da Visita: {purpose_of_visit}</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Local de Visita: {place_of_visit}</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Descri&ccedil;&atilde;o: {trip_description}</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(129, 9, 'ar', 'Employee Promotion', '<p>Subject : -HR القسم / الشركة لارسال رسالة تهنئة الى العمل للتهنئة بالعمل.</p>\r\n                    <p>عزيزي { employee_promotion_name },</p>\r\n                    <p>تهاني على ترقيتك الى { promotion_designation } { promotion_title } الفعال { promotion_date }.</p>\r\n                    <p>وسنواصل توقع تحقيق الاتساق وتحقيق نتائج عظيمة منكم في دوركم الجديد. ونأمل أن تكون قدوة للموظفين الآخرين في المنظمة.</p>\r\n                    <p>ونتمنى لكم التوفيق في أداءكم في المستقبل ، وتهانينا !</p>\r\n                    <p>ومرة أخرى ، تهانئي على الموقف الجديد.</p>\r\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\r\n                    <p>شكرا لك</p>\r\n                    <p>Regards,</p>\r\n                    <p>إدارة الموارد البشرية ،</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(130, 9, 'da', 'Employee Promotion', '<p>Om: HR-afdelingen / Virksomheden om at sende en lyk&oslash;nskning til jobfremst&oslash;d.</p>\r\n                    <p>K&aelig;re { employee_promotion_name },</p>\r\n                    <p>Tillykke med din forfremmelse til { promotion_designation } { promotion_title } effektiv { promotion_date }.</p>\r\n                    <p>Vi vil fortsat forvente konsekvens og store resultater fra Dem i Deres nye rolle. Vi h&aring;ber, at De vil foreg&aring; med et godt eksempel for de &oslash;vrige ansatte i organisationen.</p>\r\n                    <p>Vi &oslash;nsker Dem held og lykke med Deres fremtidige optr&aelig;den, og tillykke!</p>\r\n                    <p>Endnu en gang tillykke med den nye holdning.</p>\r\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\r\n                    <p>Tak.</p>\r\n                    <p>Med venlig hilsen</p>\r\n                    <p>HR-afdelingen,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(131, 9, 'de', 'Employee Promotion', '<p>Betrifft: -Personalabteilung/Unternehmen, um einen Gl&uuml;ckwunschschreiben zu senden.</p>\r\n                    <p>Sehr geehrter {employee_promotion_name},</p>\r\n                    <p>Herzlichen Gl&uuml;ckwunsch zu Ihrer Werbeaktion an {promotion_designation} {promotion_title} wirksam {promotion_date}.</p>\r\n                    <p>Wir werden von Ihnen in Ihrer neuen Rolle weiterhin Konsistenz und gro&szlig;e Ergebnisse erwarten. Wir hoffen, dass Sie ein Beispiel f&uuml;r die anderen Mitarbeiter der Organisation setzen werden.</p>\r\n                    <p>Wir w&uuml;nschen Ihnen viel Gl&uuml;ck f&uuml;r Ihre zuk&uuml;nftige Leistung, und gratulieren!</p>\r\n                    <p>Nochmals herzlichen Gl&uuml;ckwunsch zu der neuen Position.</p>\r\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\r\n                    <p>Danke.</p>\r\n                    <p>Betrachtet,</p>\r\n                    <p>Personalabteilung,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(132, 9, 'en', 'Employee Promotion', '<p>&nbsp;</p>\r\n                    <p><strong>Subject:-HR department/Company to send job promotion congratulation letter.</strong></p>\r\n                    <p><strong>Dear {employee_promotion_name},</strong></p>\r\n                    <p>Congratulations on your promotion to {promotion_designation} {promotion_title} effective {promotion_date}.</p>\r\n                    <p>We shall continue to expect consistency and great results from you in your new role. We hope that you will set an example for the other employees of the organization.</p>\r\n                    <p>We wish you luck for your future performance, and congratulations!.</p>\r\n                    <p>Again, congratulations on the new position.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Feel free to reach out if you have any questions.</p>\r\n                    <p>Thank you</p>\r\n                    <p><strong>Regards,</strong></p>\r\n                    <p><strong>HR Department,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(133, 9, 'es', 'Employee Promotion', '<p>Asunto: -Departamento de RRHH/Empresa para enviar carta de felicitaci&oacute;n de promoci&oacute;n de empleo.</p>\r\n                    <p>Estimado {employee_promotion_name},</p>\r\n                    <p>Felicidades por su promoci&oacute;n a {promotion_designation} {promotion_title} efectiva {promotion_date}.</p>\r\n                    <p>Seguiremos esperando la coherencia y los grandes resultados de ustedes en su nuevo papel. Esperamos que usted ponga un ejemplo para los otros empleados de la organizaci&oacute;n.</p>\r\n                    <p>Le deseamos suerte para su futuro rendimiento, y felicitaciones!.</p>\r\n                    <p>Una vez m&aacute;s, felicidades por la nueva posici&oacute;n.</p>\r\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\r\n                    <p>&iexcl;Gracias!</p>\r\n                    <p>Considerando,</p>\r\n                    <p>Departamento de Recursos Humanos,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(134, 9, 'fr', 'Employee Promotion', '<p>Objet: -D&eacute;partement RH / Soci&eacute;t&eacute; denvoi dune lettre de f&eacute;licitations pour la promotion de lemploi.</p>\r\n                    <p>Cher { employee_promotion_name },</p>\r\n                    <p>F&eacute;licitations pour votre promotion &agrave; { promotion_d&eacute;signation } { promotion_title } effective { promotion_date }.</p>\r\n                    <p>Nous continuerons &agrave; vous attendre &agrave; une coh&eacute;rence et &agrave; de grands r&eacute;sultats de votre part dans votre nouveau r&ocirc;le. Nous esp&eacute;rons que vous trouverez un exemple pour les autres employ&eacute;s de lorganisation.</p>\r\n                    <p>Nous vous souhaitons bonne chance pour vos performances futures et f&eacute;licitations !</p>\r\n                    <p>Encore une fois, f&eacute;licitations pour le nouveau poste.</p>\r\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\r\n                    <p>Je vous remercie</p>\r\n                    <p>Regards,</p>\r\n                    <p>D&eacute;partement des RH,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(135, 9, 'it', 'Employee Promotion', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare la lettera di congratulazioni alla promozione del lavoro.</p>\r\n                    <p>Caro {employee_promotion_name},</p>\r\n                    <p>Complimenti per la tua promozione a {promotion_designation} {promotion_title} efficace {promotion_date}.</p>\r\n                    <p>Continueremo ad aspettarci coerenza e grandi risultati da te nel tuo nuovo ruolo. Ci auguriamo di impostare un esempio per gli altri dipendenti dellorganizzazione.</p>\r\n                    <p>Ti auguriamo fortuna per le tue prestazioni future, e complimenti!.</p>\r\n                    <p>Ancora, complimenti per la nuova posizione.</p>\r\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\r\n                    <p>Grazie</p>\r\n                    <p>Riguardo,</p>\r\n                    <p>Dipartimento HR,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(136, 9, 'ja', 'Employee Promotion', '<p>件名:-HR 部門/企業は、求人広告の祝賀状を送信します。</p>\r\n                    <p>{ employee_promotion_name} に出庫します。</p>\r\n                    <p>{promotion_designation } { promotion_title} {promotion_date} 販促に対するお祝いのお祝いがあります。</p>\r\n                    <p>今後とも、お客様の新しい役割において一貫性と大きな成果を期待します。 組織の他の従業員の例を設定したいと考えています。</p>\r\n                    <p>あなたの未来のパフォーマンスをお祈りします。おめでとうございます。</p>\r\n                    <p>また、新しい地位について祝意を表する。</p>\r\n                    <p>質問がある場合は、自由に連絡してください。</p>\r\n                    <p>ありがとう</p>\r\n                    <p>よろしく</p>\r\n                    <p>HR 部門</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(137, 9, 'nl', 'Employee Promotion', '<p>Betreft: -HR-afdeling/Bedrijf voor het versturen van de aanbevelingsbrief voor taakpromotie.</p>\r\n                    <p>Geachte { employee_promotion_name },</p>\r\n                    <p>Gefeliciteerd met uw promotie voor { promotion_designation } { promotion_title } effective { promotion_date }.</p>\r\n                    <p>Wij zullen de consistentie en de grote resultaten van u in uw nieuwe rol blijven verwachten. Wij hopen dat u een voorbeeld zult stellen voor de andere medewerkers van de organisatie.</p>\r\n                    <p>Wij wensen u geluk voor uw toekomstige prestaties, en gefeliciteerd!.</p>\r\n                    <p>Nogmaals, gefeliciteerd met de nieuwe positie.</p>\r\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\r\n                    <p>Dank u wel</p>\r\n                    <p>Betreft:</p>\r\n                    <p>HR-afdeling,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(138, 9, 'pl', 'Employee Promotion', '<p>Temat: -Dział kadr/Firma w celu wysłania listu gratulacyjnego dla promocji zatrudnienia.</p>\r\n                    <p>Szanowny {employee_promotion_name },</p>\r\n                    <p>Gratulacje dla awansowania do {promotion_designation } {promotion_title } efektywnej {promotion_date }.</p>\r\n                    <p>W dalszym ciągu oczekujemy konsekwencji i wspaniałych wynik&oacute;w w Twojej nowej roli. Mamy nadzieję, że postawicie na przykład dla pozostałych pracownik&oacute;w organizacji.</p>\r\n                    <p>Życzymy powodzenia dla przyszłych wynik&oacute;w, gratulujemy!.</p>\r\n                    <p>Jeszcze raz gratulacje na nowej pozycji.</p>\r\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\r\n                    <p>Dziękujemy</p>\r\n                    <p>W odniesieniu do</p>\r\n                    <p>Dział HR,</p>\r\n                    <p>{app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(139, 9, 'ru', 'Employee Promotion', '<p>Тема: -HR отдел/Компания для отправки письма с поздравлением.</p>\r\n                    <p>Уважаемый { employee_promotion_name },</p>\r\n                    <p>Поздравляем вас с продвижением в { promotion_designation } { promotion_title } эффективная { promotion_date }.</p>\r\n                    <p>Мы будем и впредь ожидать от вас соответствия и больших результатов в вашей новой роли. Мы надеемся, что вы станете примером для других сотрудников организации.</p>\r\n                    <p>Желаем вам удачи и поздравлений!</p>\r\n                    <p>Еще раз поздравляю с новой позицией.</p>\r\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\r\n                    <p>Спасибо.</p>\r\n                    <p>С уважением,</p>\r\n                    <p>Отдел кадров,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(140, 9, 'pt', 'Employee Promotion', '<p style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de felicita&ccedil;&atilde;o de promo&ccedil;&atilde;o de emprego.</p>\r\n                    <p style=\"font-size: 14.4px;\">Querido {employee_promotion_name},</p>\r\n                    <p style=\"font-size: 14.4px;\">Parab&eacute;ns pela sua promo&ccedil;&atilde;o para {promotion_designation} {promotion_title} efetivo {promotion_date}.</p>\r\n                    <p style=\"font-size: 14.4px;\">Continuaremos a esperar consist&ecirc;ncia e grandes resultados a partir de voc&ecirc; em seu novo papel. Esperamos que voc&ecirc; defina um exemplo para os demais funcion&aacute;rios da organiza&ccedil;&atilde;o.</p>\r\n                    <p style=\"font-size: 14.4px;\">Desejamos sorte para o seu desempenho futuro, e parab&eacute;ns!.</p>\r\n                    <p style=\"font-size: 14.4px;\">Novamente, parab&eacute;ns pela nova posi&ccedil;&atilde;o.</p>\r\n                    <p style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\r\n                    <p style=\"font-size: 14.4px;\">Obrigado</p>\r\n                    <p style=\"font-size: 14.4px;\">Considera,</p>\r\n                    <p style=\"font-size: 14.4px;\">Departamento de RH,</p>\r\n                    <p style=\"font-size: 14.4px;\">{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(141, 9, 'tr', 'Employee Promotion', '<p><strong>Konu:-İş promosyonu tebrik mektubu gönderilecek İK departmanı/Şirket.</strong></p>\r\n                    <p><strong>Sayın {employee_promotion_name},</strong></p>\r\n                    <p>terfi ettiğiniz için tebrikler {promotion_designation} {promotion_title} etkili {promotion_date}.</p>\r\n                    <p>Sizden yeni görevinizde tutarlılık ve harika sonuçlar beklemeye devam edeceğiz. Kurumun diğer çalışanlarına da örnek olmanızı temenni ederiz.</p>\r\n                    <p>Gelecekteki performansınız için size bol şans diliyor, tebrikler!.</p>\r\n                    <p>Yeni pozisyon için tekrar tebrikler.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Herhangi bir sorunuz varsa ulaşmaktan çekinmeyin.</p>\r\n                    <p>Teşekkür ederim</p>\r\n                    <p><strong>Saygılarımızla,</strong></p>\r\n                    <p><strong>İK Departmanı,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(142, 9, 'zh', 'Employee Promotion', '<p>&nbsp;</p>\r\n                    <p><strong>主题：-HR部门/公司发送职位晋升祝贺信.</strong></p>\r\n                    <p><strong>亲爱的{employee_promotion_name},</strong></p>\r\n                    <p>恭喜您晋升为 {promotion_designation} {promotion_title} 有效的 {promotion_date}.</p>\r\n                    <p>我们将继续期待您在新岗位上保持稳定并取得出色的成果。我们希望您能为组织的其他员工树立榜样.</p>\r\n                    <p>我们祝愿您未来的表现一切顺利，并表示祝贺！.</p>\r\n                    <p>再次祝贺您就任新职位.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>如果您有任何疑问，请随时与我们联系.</p>\r\n                    <p>谢谢</p>\r\n                    <p><strong>问候,</strong></p>\r\n                    <p><strong>人事部,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(143, 9, 'he', 'Employee Promotion', '<p>&nbsp;</p>\r\n                    <p><strong>נושא:-מחלקת משאבי אנוש/חברה לשלוח מכתב ברכה לקידום בעבודה.</strong></p>\r\n                    <p><strong>יָקָר {employee_promotion_name},</strong></p>\r\n                    <p>ברכות על הקידום שלך ל{promotion_designation} {promotion_title} יָעִיל {promotion_date}.</p>\r\n                    <p>נמשיך לצפות לעקביות ולתוצאות נהדרות ממך בתפקידך החדש. אנו מקווים שתהווה דוגמה לעובדי הארגון האחרים.</p>\r\n                    <p>אנו מאחלים לך בהצלחה בביצועים העתידיים שלך, ומזל טוב!.</p>\r\n                    <p>שוב, ברכות על התפקיד החדש.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>אל תהסס לפנות אם יש לך שאלות.</p>\r\n                    <p>תודה</p>\r\n                    <p><strong>בברכה,</strong></p>\r\n                    <p><strong>מחלקת משאבי אנוש,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(144, 9, 'pt-br', 'Employee Promotion', '<p style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de felicita&ccedil;&atilde;o de promo&ccedil;&atilde;o de emprego.</p>\r\n                    <p style=\"font-size: 14.4px;\">Querido {employee_promotion_name},</p>\r\n                    <p style=\"font-size: 14.4px;\">Parab&eacute;ns pela sua promo&ccedil;&atilde;o para {promotion_designation} {promotion_title} efetivo {promotion_date}.</p>\r\n                    <p style=\"font-size: 14.4px;\">Continuaremos a esperar consist&ecirc;ncia e grandes resultados a partir de voc&ecirc; em seu novo papel. Esperamos que voc&ecirc; defina um exemplo para os demais funcion&aacute;rios da organiza&ccedil;&atilde;o.</p>\r\n                    <p style=\"font-size: 14.4px;\">Desejamos sorte para o seu desempenho futuro, e parab&eacute;ns!.</p>\r\n                    <p style=\"font-size: 14.4px;\">Novamente, parab&eacute;ns pela nova posi&ccedil;&atilde;o.</p>\r\n                    <p style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\r\n                    <p style=\"font-size: 14.4px;\">Obrigado</p>\r\n                    <p style=\"font-size: 14.4px;\">Considera,</p>\r\n                    <p style=\"font-size: 14.4px;\">Departamento de RH,</p>\r\n                    <p style=\"font-size: 14.4px;\">{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(145, 10, 'ar', 'Employee Complaints', '<p>Subject :-قسم الموارد البشرية / الشركة لإرسال رسالة شكوى.</p>\r\n                    <p>عزيزي { employee_complaints_name },</p>\r\n                    <p>وأود أن أبلغ عن صراعا بينكم وبين الشخص الآخر. فقد وقعت عدة حوادث خلال الأيام القليلة الماضية ، وأشعر أن الوقت قد حان لتقديم شكوى رسمية ضده / لها.</p>\r\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\r\n                    <p>شكرا لك</p>\r\n                    <p>Regards,</p>\r\n                    <p>إدارة الموارد البشرية ،</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16');
INSERT INTO `email_template_langs` (`id`, `parent_id`, `lang`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(146, 10, 'da', 'Employee Complaints', '<p>Om: HR-departementet / Kompagniet for at sende klager.</p>\r\n                    <p>K&aelig;re { employee_complaints_name },</p>\r\n                    <p>Jeg vil gerne anmelde en konflikt mellem Dem og den anden person, og der er sket flere episoder i de seneste dage, og jeg mener, at det er p&aring; tide at anmelde en formel klage over for ham.</p>\r\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\r\n                    <p>Tak.</p>\r\n                    <p>Med venlig hilsen</p>\r\n                    <p>HR-afdelingen,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(147, 10, 'de', 'Employee Complaints', '<p>Betrifft: -Personalabteilung/Unternehmen zum Senden von Beschwerden.</p>\r\n                    <p>Sehr geehrter {employee_complaints_name},</p>\r\n                    <p>Ich m&ouml;chte einen Konflikt zwischen Ihnen und der anderen Person melden. Es hat in den letzten Tagen mehrere Zwischenf&auml;lle gegeben, und ich glaube, es ist an der Zeit, eine formelle Beschwerde gegen ihn zu erstatten.</p>\r\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\r\n                    <p>Danke.</p>\r\n                    <p>Betrachtet,</p>\r\n                    <p>Personalabteilung,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(148, 10, 'en', 'Employee Complaints', '<p><strong>Subject:-HR department/Company to send complaints letter.</strong></p>\r\n                    <p><strong>Dear {employee_complaints_name},</strong></p>\r\n                    <p>I would like to report a conflict between you and the other person.There have been several incidents over the last few days, and I feel that it is time to report a formal complaint against him/her.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Feel free to reach out if you have any questions.</p>\r\n                    <p>Thank you</p>\r\n                    <p><strong>Regards,</strong></p>\r\n                    <p><strong>HR Department,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(149, 10, 'es', 'Employee Complaints', '<p>Asunto: -Departamento de RRHH/Empresa para enviar carta de quejas.</p>\r\n                    <p>Estimado {employee_complaints_name},</p>\r\n                    <p>Me gustar&iacute;a informar de un conflicto entre usted y la otra persona. Ha habido varios incidentes en los &uacute;ltimos d&iacute;as, y creo que es hora de denunciar una queja formal contra &eacute;l.</p>\r\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\r\n                    <p>&iexcl;Gracias!</p>\r\n                    <p>Considerando,</p>\r\n                    <p>Departamento de Recursos Humanos,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(150, 10, 'fr', 'Employee Complaints', '<p>Objet: -Service des ressources humaines / Compagnie pour envoyer une lettre de plainte.</p>\r\n                    <p>Cher { employee_complaints_name },</p>\r\n                    <p>Je voudrais signaler un conflit entre vous et lautre personne. Il y a eu plusieurs incidents au cours des derniers jours, et je pense quil est temps de signaler une plainte officielle contre lui.</p>\r\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\r\n                    <p>Je vous remercie</p>\r\n                    <p>Regards,</p>\r\n                    <p>D&eacute;partement des RH,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(151, 10, 'it', 'Employee Complaints', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di reclamo.</p>\r\n                    <p>Caro {employee_complaints_name},</p>\r\n                    <p>Vorrei segnalare un conflitto tra lei e laltra persona Ci sono stati diversi incidenti negli ultimi giorni, e sento che &egrave; il momento di denunciare una denuncia formale contro di lui.</p>\r\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\r\n                    <p>Grazie</p>\r\n                    <p>Riguardo,</p>\r\n                    <p>Dipartimento HR,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(152, 10, 'ja', 'Employee Complaints', '<p>件名:-HR 部門/会社は、クレーム・レターを送信します。</p>\r\n                    <p>{ employee_complaints_name} の Dear&nbsp;</p>\r\n                    <p>あなたと他の人との間の葛藤を報告したいと思いますこの数日間でいくつかの事件が発生しています彼女に対する正式な申し立てをする時だと感じています</p>\r\n                    <p>質問がある場合は、自由に連絡してください。</p>\r\n                    <p>ありがとう</p>\r\n                    <p>よろしく</p>\r\n                    <p>HR 部門</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(153, 10, 'nl', 'Employee Complaints', '<p>Betreft: -HR-afdeling/Bedrijf voor het verzenden van klachtenbrief.</p>\r\n                    <p>Geachte { employee_complaints_name},</p>\r\n                    <p>Ik zou een conflict willen melden tussen u en de andere persoon. Er zijn de afgelopen dagen verschillende incidenten geweest en ik denk dat het tijd is om een formele klacht tegen hem/haar in te dienen.</p>\r\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\r\n                    <p>Dank u wel</p>\r\n                    <p>Betreft:</p>\r\n                    <p>HR-afdeling,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(154, 10, 'pl', 'Employee Complaints', '<p>Temat:-Dział HR/Firma do wysyłania listu reklamowego.</p>\r\n                    <p>Szanowna {employee_complaints_name },</p>\r\n                    <p>Chciałbym zgłosić konflikt między tobą a drugą osobą. W ciągu ostatnich kilku dni było kilka incydent&oacute;w i czuję, że nadszedł czas, aby zgłosić oficjalną skargę przeciwko niej.</p>\r\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\r\n                    <p>Dziękujemy</p>\r\n                    <p>W odniesieniu do</p>\r\n                    <p>Dział HR,</p>\r\n                    <p>{app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(155, 10, 'ru', 'Employee Complaints', '<p>Тема: -HR отдел/Компания отправить письмо с жалобами.</p>\r\n                    <p>Уважаемый { employee_complaints_name }</p>\r\n                    <p>Я хотел бы сообщить о конфликте между вами и другим человеком. За последние несколько дней произошло несколько инцидентов, и я считаю, что пришло время сообщить о своей официальной жалобе.</p>\r\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\r\n                    <p>Спасибо.</p>\r\n                    <p>С уважением,</p>\r\n                    <p>Отдел кадров,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(156, 10, 'pt', 'Employee Complaints', '<p>Assunto:-Departamento de RH / Empresa para enviar carta de reclama&ccedil;&otilde;es.</p>\r\n                    <p>Querido {employee_complaints_name},</p>\r\n                    <p>Eu gostaria de relatar um conflito entre voc&ecirc; e a outra pessoa. Houve v&aacute;rios incidentes ao longo dos &uacute;ltimos dias, e eu sinto que &eacute; hora de relatar uma den&uacute;ncia formal contra him/her.</p>\r\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\r\n                    <p>Obrigado</p>\r\n                    <p>Considera,</p>\r\n                    <p>Departamento de RH,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(157, 10, 'tr', 'Employee Complaints', '<p><strong>Konu:-Şikayet mektubu gönderilecek İK departmanı/Şirket.</strong></p>\r\n                    <p><strong>Sayın {employee_complaints_name},</strong></p>\r\n                    <p>Diğer kişiyle aranızdaki bir anlaşmazlığı bildirmek istiyorum. Son birkaç gün içinde birkaç olay oldu ve bu kişi hakkında resmi bir şikayette bulunmanın zamanının geldiğini düşünüyorum.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Herhangi bir sorunuz varsa ulaşmaktan çekinmeyin.</p>\r\n                    <p>Teşekkür ederim</p>\r\n                    <p><strong>Saygılarımızla,</strong></p>\r\n                    <p><strong>İK Departmanı,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(158, 10, 'zh', 'Employee Complaints', '<p><strong>主题：-HR部门/公司发送投诉信.</strong></p>\r\n                    <p><strong>亲爱的 {employee_complaints_name},</strong></p>\r\n                    <p>我想举报您和对方之间的冲突。过去几天发生了几起事件，我觉得是时候对他/她提出正式投诉了.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>如果您有任何疑问，请随时与我们联系.</p>\r\n                    <p>谢谢</p>\r\n                    <p><strong>问候,</strong></p>\r\n                    <p><strong>人事部,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(159, 10, 'he', 'Employee Complaints', '<p><strong>נושא:-מחלקת משאבי אנוש/חברה לשלוח מכתב תלונות.</strong></p>\r\n                    <p><strong>יָקָר {employee_complaints_name},</strong></p>\r\n                    <p>ברצוני לדווח על סכסוך בינך לבין האדם השני. היו מספר תקריות במהלך הימים האחרונים, ואני מרגיש שהגיע הזמן לדווח על תלונה רשמית נגדו/ה.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>אל תהסס לפנות אם יש לך שאלות.</p>\r\n                    <p>תודה</p>\r\n                    <p><strong>בברכה,</strong></p>\r\n                    <p><strong>מחלקת משאבי אנוש,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(160, 10, 'pt-br', 'Employee Complaints', '<p>Assunto:-Departamento de RH / Empresa para enviar carta de reclama&ccedil;&otilde;es.</p>\r\n                    <p>Querido {employee_complaints_name},</p>\r\n                    <p>Eu gostaria de relatar um conflito entre voc&ecirc; e a outra pessoa. Houve v&aacute;rios incidentes ao longo dos &uacute;ltimos dias, e eu sinto que &eacute; hora de relatar uma den&uacute;ncia formal contra him/her.</p>\r\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\r\n                    <p>Obrigado</p>\r\n                    <p>Considera,</p>\r\n                    <p>Departamento de RH,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(161, 11, 'ar', 'Employee Warning', '<p style=\"text-align: left;\"><span style=\"font-size: 12pt;\"><span style=\"color: #222222;\"><span style=\"white-space: pre-wrap;\">Subject : -HR ادارة / شركة لارسال رسالة تحذير. عزيزي { employe_warning_name }, { warning_subject } { warning_description } إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة. شكرا لك Regards, إدارة الموارد البشرية ، { app_name }</span></span></span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(162, 11, 'da', 'Employee Warning', '<p>Om: HR-afdelingen / kompagniet for at sende advarselsbrev.</p>\r\n                    <p>K&aelig;re { employee_warning_name },</p>\r\n                    <p>{ warning_subject }</p>\r\n                    <p>{ warning_description }</p>\r\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\r\n                    <p>Tak.</p>\r\n                    <p>Med venlig hilsen</p>\r\n                    <p>HR-afdelingen,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(163, 11, 'de', 'Employee Warning', '<p>Betreff: -Personalabteilung/Unternehmen zum Senden von Warnschreiben.</p>\r\n                    <p>Sehr geehrter {employee_warning_name},</p>\r\n                    <p>{warning_subject}</p>\r\n                    <p>{warning_description}</p>\r\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\r\n                    <p>Danke.</p>\r\n                    <p>Betrachtet,</p>\r\n                    <p>Personalabteilung,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(164, 11, 'en', 'Employee Warning', '<p><strong>Subject:-HR department/Company to send warning letter.</strong></p>\r\n                    <p><strong>Dear {employee_warning_name},</strong></p>\r\n                    <p>{warning_subject}</p>\r\n                    <p>{warning_description}</p>\r\n                    <p>Feel free to reach out if you have any questions.</p>\r\n                    <p>Thank you</p>\r\n                    <p><strong>Regards,</strong></p>\r\n                    <p><strong>HR Department,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(165, 11, 'es', 'Employee Warning', '<p>Asunto: -Departamento de RR.HH./Empresa para enviar carta de advertencia.</p>\r\n                    <p>Estimado {employee_warning_name},</p>\r\n                    <p>{warning_subject}</p>\r\n                    <p>{warning_description}</p>\r\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\r\n                    <p>&iexcl;Gracias!</p>\r\n                    <p>Considerando,</p>\r\n                    <p>Departamento de Recursos Humanos,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(166, 11, 'fr', 'Employee Warning', '<p>Objet: -HR department / Company to send warning letter.</p>\r\n                    <p>Cher { employee_warning_name },</p>\r\n                    <p>{ warning_subject }</p>\r\n                    <p>{ warning_description }</p>\r\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\r\n                    <p>Je vous remercie</p>\r\n                    <p>Regards,</p>\r\n                    <p>D&eacute;partement des RH,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(167, 11, 'it', 'Employee Warning', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di avvertimento.</p>\r\n                    <p>Caro {employee_warning_name},</p>\r\n                    <p>{warning_subject}</p>\r\n                    <p>{warning_description}</p>\r\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\r\n                    <p>Grazie</p>\r\n                    <p>Riguardo,</p>\r\n                    <p>Dipartimento HR,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(168, 11, 'ja', 'Employee Warning', '<p><span style=\"font-size: 12pt;\"><span style=\"color: #222222;\"><span style=\"white-space: pre-wrap;\">件名:-HR 部門/企業は警告レターを送信します。 { employee_warning_name} を出庫します。 {warning_subject} {warning_description} 質問がある場合は、自由に連絡してください。 ありがとう よろしく HR 部門 {app_name}</span></span></span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(169, 11, 'nl', 'Employee Warning', '<p>Betreft: -HR-afdeling/bedrijf om een waarschuwingsbrief te sturen.</p>\r\n                    <p>Geachte { employee_warning_name },</p>\r\n                    <p>{ warning_subject }</p>\r\n                    <p>{ warning_description }</p>\r\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\r\n                    <p>Dank u wel</p>\r\n                    <p>Betreft:</p>\r\n                    <p>HR-afdeling,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(170, 11, 'pl', 'Employee Warning', '<p>Temat: -Dział HR/Firma do wysyłania listu ostrzegawczego.</p>\r\n                    <p>Szanowny {employee_warning_name },</p>\r\n                    <p>{warning_subject }</p>\r\n                    <p>{warning_description }</p>\r\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\r\n                    <p>Dziękujemy</p>\r\n                    <p>W odniesieniu do</p>\r\n                    <p>Dział HR,</p>\r\n                    <p>{app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(171, 11, 'ru', 'Employee Warning', '<p>Тема: -HR отдел/Компания для отправки предупреждающего письма.</p>\r\n                    <p>Уважаемый { employee_warning_name },</p>\r\n                    <p>{ warning_subject }</p>\r\n                    <p>{ warning_description }</p>\r\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\r\n                    <p>Спасибо.</p>\r\n                    <p>С уважением,</p>\r\n                    <p>Отдел кадров,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(172, 11, 'pt', 'Employee Warning', '<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de advert&ecirc;ncia.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Querido {employee_warning_name},</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{warning_subject}</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{warning_description}</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(173, 11, 'tr', 'Employee Warning', '<p><strong>Konu:-İK departmanı/Şirket uyarı mektubu gönderecek.</strong></p>\r\n                    <p><strong>Sayın {employee_warning_name},</strong></p>\r\n                    <p>{warning_subject}</p>\r\n                    <p>{warning_description}</p>\r\n                    <p>Herhangi bir sorunuz varsa ulaşmaktan çekinmeyin.</p>\r\n                    <p>Teşekkür ederim</p>\r\n                    <p><strong>Saygılarımızla,</strong></p>\r\n                    <p><strong>İK Departmanı,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(174, 11, 'zh', 'Employee Warning', '<p><strong>主题：-人力资源部门/公司发送警告信.</strong></p>\r\n                    <p><strong>亲爱的{employee_warning_name},</strong></p>\r\n                    <p>{warning_subject}</p>\r\n                    <p>{warning_description}</p>\r\n                    <p>如果您有任何疑问，请随时与我们联系.</p>\r\n                    <p>谢谢</p>\r\n                    <p><strong>问候,</strong></p>\r\n                    <p><strong>人事部,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(175, 11, 'he', 'Employee Warning', '<p><strong>נושא:-מחלקת משאבי אנוש/חברה לשלוח מכתב אזהרה.</strong></p>\r\n                    <p><strong>יָקָר {employee_warning_name},</strong></p>\r\n                    <p>{warning_subject}</p>\r\n                    <p>{warning_description}</p>\r\n                    <p>אל תהסס לפנות אם יש לך שאלות.</p>\r\n                    <p>תודה</p>\r\n                    <p><strong>בברכה,</strong></p>\r\n                    <p><strong>מחלקת משאבי אנוש,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(176, 11, 'pt-br', 'Employee Warning', '<p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de advert&ecirc;ncia.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Querido {employee_warning_name},</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{warning_subject}</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{warning_description}</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Obrigado</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Considera,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">Departamento de RH,</span></p>\r\n                    <p style=\"font-size: 14.4px;\"><span style=\"font-size: 14.4px;\">{app_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(177, 12, 'ar', 'Employee Termination', '<p style=\"text-align: left;\"><span style=\"font-size: 12pt;\"><span style=\"color: #222222;\"><span style=\"white-space: pre-wrap;\"><span style=\"font-size: 12pt; white-space: pre-wrap;\">Subject :-ادارة / شركة HR لارسال رسالة انهاء. عزيزي { </span><span style=\"white-space: pre-wrap;\">employee_termination_name</span><span style=\"font-size: 12pt; white-space: pre-wrap;\"> } ، هذه الرسالة مكتوبة لإعلامك بأن عملك مع شركتنا قد تم إنهاؤه مزيد من التفاصيل عن الانهاء : تاريخ الاشعار : { </span><span style=\"white-space: pre-wrap;\">notice_date</span><span style=\"font-size: 12pt; white-space: pre-wrap;\"> } تاريخ الانهاء : { </span><span style=\"white-space: pre-wrap;\">termination_date</span><span style=\"font-size: 12pt; white-space: pre-wrap;\"> } نوع الانهاء : { termination_type } إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة. شكرا لك Regards, إدارة الموارد البشرية ، { app_name }</span></span></span></span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(178, 12, 'da', 'Employee Termination', '<p>Emne:-HR-afdelingen / Virksomheden om at sende afslutningstskrivelse.</p>\r\n                    <p>K&aelig;re { employee_termination_name },</p>\r\n                    <p>Dette brev er skrevet for at meddele dig, at dit arbejde med vores virksomhed er afsluttet.</p>\r\n                    <p>Flere oplysninger om oph&aelig;velse:</p>\r\n                    <p>Adviseringsdato: { notifice_date }</p>\r\n                    <p>Opsigelsesdato: { termination_date }</p>\r\n                    <p>Opsigelsestype: { termination_type }</p>\r\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\r\n                    <p>Tak.</p>\r\n                    <p>Med venlig hilsen</p>\r\n                    <p>HR-afdelingen,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(179, 12, 'de', 'Employee Termination', '<p>Betreff: -Personalabteilung/Firma zum Versenden von K&uuml;ndigungsschreiben.</p>\r\n                    <p>Sehr geehrter {employee_termination_name},</p>\r\n                    <p>Dieser Brief wird Ihnen schriftlich mitgeteilt, dass Ihre Besch&auml;ftigung mit unserem Unternehmen beendet ist.</p>\r\n                    <p>Weitere Details zur K&uuml;ndigung:</p>\r\n                    <p>K&uuml;ndigungsdatum: {notice_date}</p>\r\n                    <p>Beendigungsdatum: {termination_date}</p>\r\n                    <p>Abbruchstyp: {termination_type}</p>\r\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\r\n                    <p>Danke.</p>\r\n                    <p>Betrachtet,</p>\r\n                    <p>Personalabteilung,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(180, 12, 'en', 'Employee Termination', '<p><strong>Subject:-HR department/Company to send termination letter.</strong></p>\r\n                    <p><strong>Dear {employee_termination_name},</strong></p>\r\n                    <p>This letter is written to notify you that your employment with our company is terminated.</p>\r\n                    <p>More detail about termination:</p>\r\n                    <p>Notice Date :{notice_date}</p>\r\n                    <p>Termination Date:{termination_date}</p>\r\n                    <p>Termination Type:{termination_type}</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Feel free to reach out if you have any questions.</p>\r\n                    <p>Thank you</p>\r\n                    <p><strong>Regards,</strong></p>\r\n                    <p><strong>HR Department,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(181, 12, 'es', 'Employee Termination', '<p>Asunto: -Departamento de RRHH/Empresa para enviar carta de rescisi&oacute;n.</p>\r\n                    <p>Estimado {employee_termination_name},</p>\r\n                    <p>Esta carta est&aacute; escrita para notificarle que su empleo con nuestra empresa ha terminado.</p>\r\n                    <p>M&aacute;s detalles sobre la terminaci&oacute;n:</p>\r\n                    <p>Fecha de aviso: {notice_date}</p>\r\n                    <p>Fecha de terminaci&oacute;n: {termination_date}</p>\r\n                    <p>Tipo de terminaci&oacute;n: {termination_type}</p>\r\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\r\n                    <p>&iexcl;Gracias!</p>\r\n                    <p>Considerando,</p>\r\n                    <p>Departamento de Recursos Humanos,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(182, 12, 'fr', 'Employee Termination', '<p>Objet: -HR department / Company to send termination letter.</p>\r\n                    <p>Cher { employee_termination_name },</p>\r\n                    <p>Cette lettre est r&eacute;dig&eacute;e pour vous aviser que votre emploi aupr&egrave;s de notre entreprise prend fin.</p>\r\n                    <p>Plus de d&eacute;tails sur larr&ecirc;t:</p>\r\n                    <p>Date de lavis: { notice_date }</p>\r\n                    <p>Date de fin: { termination_date}</p>\r\n                    <p>Type de terminaison: { termination_type }</p>\r\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\r\n                    <p>Je vous remercie</p>\r\n                    <p>Regards,</p>\r\n                    <p>D&eacute;partement des RH,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(183, 12, 'it', 'Employee Termination', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di terminazione.</p>\r\n                    <p>Caro {employee_termination_name},</p>\r\n                    <p>Questa lettera &egrave; scritta per comunicarti che la tua occupazione con la nostra azienda &egrave; terminata.</p>\r\n                    <p>Pi&ugrave; dettagli sulla cessazione:</p>\r\n                    <p>Data avviso: {notice_data}</p>\r\n                    <p>Data di chiusura: {termination_date}</p>\r\n                    <p>Tipo di terminazione: {termination_type}</p>\r\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\r\n                    <p>Grazie</p>\r\n                    <p>Riguardo,</p>\r\n                    <p>Dipartimento HR,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(184, 12, 'ja', 'Employee Termination', '<p>件名:-HR 部門/企業は終了文字を送信します。</p>\r\n                    <p>{ employee_termination_name} を終了します。</p>\r\n                    <p>この手紙は、当社の雇用が終了していることをあなたに通知するために書かれています。</p>\r\n                    <p>終了についての詳細 :</p>\r\n                    <p>通知日 :{notice_date}</p>\r\n                    <p>終了日:{termination_date}</p>\r\n                    <p>終了タイプ:{termination_type}</p>\r\n                    <p>質問がある場合は、自由に連絡してください。</p>\r\n                    <p>ありがとう</p>\r\n                    <p>よろしく</p>\r\n                    <p>HR 部門</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(185, 12, 'nl', 'Employee Termination', '<p>Betreft: -HR-afdeling/Bedrijf voor verzending van afgiftebrief.</p>\r\n                    <p>Geachte { employee_termination_name },</p>\r\n                    <p>Deze brief is geschreven om u te melden dat uw werk met ons bedrijf wordt be&euml;indigd.</p>\r\n                    <p>Meer details over be&euml;indiging:</p>\r\n                    <p>Datum kennisgeving: { notice_date }</p>\r\n                    <p>Be&euml;indigingsdatum: { termination_date }</p>\r\n                    <p>Be&euml;indigingstype: { termination_type }</p>\r\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\r\n                    <p>Dank u wel</p>\r\n                    <p>Betreft:</p>\r\n                    <p>HR-afdeling,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(186, 12, 'pl', 'Employee Termination', '<p>Temat: -Dział kadr/Firma do wysyłania listu zakańczego.</p>\r\n                    <p>Droga {employee_termination_name },</p>\r\n                    <p>Ten list jest napisany, aby poinformować Cię, że Twoje zatrudnienie z naszą firmą zostaje zakończone.</p>\r\n                    <p>Więcej szczeg&oacute;ł&oacute;w na temat zakończenia pracy:</p>\r\n                    <p>Data ogłoszenia: {notice_date }</p>\r\n                    <p>Data zakończenia: {termination_date }</p>\r\n                    <p>Typ zakończenia: {termination_type }</p>\r\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\r\n                    <p>Dziękujemy</p>\r\n                    <p>W odniesieniu do</p>\r\n                    <p>Dział HR,</p>\r\n                    <p>{app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(187, 12, 'ru', 'Employee Termination', '<p>Тема: -HR отдел/Компания отправить письмо о прекращении.</p>\r\n                    <p>Уважаемый { employee_termination_name },</p>\r\n                    <p>Это письмо написано, чтобы уведомить вас о том, что ваше трудоустройство с нашей компанией прекратилось.</p>\r\n                    <p>Более подробная информация о завершении:</p>\r\n                    <p>Дата уведомления: { notice_date }</p>\r\n                    <p>Дата завершения: { termination_date }</p>\r\n                    <p>Тип завершения: { termination_type }</p>\r\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\r\n                    <p>Спасибо.</p>\r\n                    <p>С уважением,</p>\r\n                    <p>Отдел кадров,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(188, 12, 'pt', 'Employee Termination', '<p style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de rescis&atilde;o.</p>\r\n                    <p style=\"font-size: 14.4px;\">Querido {employee_termination_name},</p>\r\n                    <p style=\"font-size: 14.4px;\">Esta carta &eacute; escrita para notific&aacute;-lo de que seu emprego com a nossa empresa est&aacute; finalizado.</p>\r\n                    <p style=\"font-size: 14.4px;\">Mais detalhes sobre a finaliza&ccedil;&atilde;o:</p>\r\n                    <p style=\"font-size: 14.4px;\">Data de Aviso: {notice_date}</p>\r\n                    <p style=\"font-size: 14.4px;\">Data de Finaliza&ccedil;&atilde;o: {termination_date}</p>\r\n                    <p style=\"font-size: 14.4px;\">Tipo de Rescis&atilde;o: {termination_type}</p>\r\n                    <p style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\r\n                    <p style=\"font-size: 14.4px;\">Obrigado</p>\r\n                    <p style=\"font-size: 14.4px;\">Considera,</p>\r\n                    <p style=\"font-size: 14.4px;\">Departamento de RH,</p>\r\n                    <p style=\"font-size: 14.4px;\">{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(189, 12, 'tr', 'Employee Termination', '<p><strong>Konu:-İK departmanı/Şirket fesih mektubu gönderecek.</strong></p>\r\n                    <p><strong>Sayın {employee_termination_name},</strong></p>\r\n                    <p>Bu mektup, şirketimizle olan işinize son verildiğini size bildirmek için yazılmıştır.</p>\r\n                    <p>Sonlandırma hakkında daha fazla ayrıntı:</p>\r\n                    <p>Bildirim Tarihi :{notice_date}</p>\r\n                    <p>Bitiş tarihi:{termination_date}</p>\r\n                    <p>Sonlandırma Türü:{termination_type}</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Herhangi bir sorunuz varsa ulaşmaktan çekinmeyin.</p>\r\n                    <p>Teşekkür ederim</p>\r\n                    <p><strong>Saygılarımızla,</strong></p>\r\n                    <p><strong>İK Departmanı,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(190, 12, 'zh', 'Employee Termination', '<p><strong>主题：-人力资源部门/公司发送终止函.</strong></p>\r\n                    <p><strong>亲爱的 {employee_termination_name},</strong></p>\r\n                    <p>这封信旨在通知您，您与我们公司的雇佣关系已终止.</p>\r\n                    <p>有关终止的更多详细信息:</p>\r\n                    <p>通知日期 :{notice_date}</p>\r\n                    <p>终止日期:{termination_date}</p>\r\n                    <p>端接类型:{termination_type}</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>如果您有任何疑问，请随时与我们联系.</p>\r\n                    <p>谢谢</p>\r\n                    <p><strong>问候,</strong></p>\r\n                    <p><strong>人事部,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(191, 12, 'he', 'Employee Termination', '<p><strong>נושא:-מחלקת משאבי אנוש/חברה לשלוח מכתב סיום.</strong></p>\r\n                    <p><strong>יָקָר {employee_termination_name},</strong></p>\r\n                    <p>מכתב זה נכתב כדי להודיע ​​לך על סיום העסקתך בחברה שלנו.</p>\r\n                    <p>פרטים נוספים על סיום:</p>\r\n                    <p>תאריך הודעה :{notice_date}</p>\r\n                    <p>תאריך סיום:{termination_date}</p>\r\n                    <p>סוג סיום:{termination_type}</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>אל תהסס לפנות אם יש לך שאלות.</p>\r\n                    <p>תודה</p>\r\n                    <p><strong>בברכה,</strong></p>\r\n                    <p><strong>מחלקת משאבי אנוש,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(192, 12, 'pt-br', 'Employee Termination', '<p style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de rescis&atilde;o.</p>\r\n                    <p style=\"font-size: 14.4px;\">Querido {employee_termination_name},</p>\r\n                    <p style=\"font-size: 14.4px;\">Esta carta &eacute; escrita para notific&aacute;-lo de que seu emprego com a nossa empresa est&aacute; finalizado.</p>\r\n                    <p style=\"font-size: 14.4px;\">Mais detalhes sobre a finaliza&ccedil;&atilde;o:</p>\r\n                    <p style=\"font-size: 14.4px;\">Data de Aviso: {notice_date}</p>\r\n                    <p style=\"font-size: 14.4px;\">Data de Finaliza&ccedil;&atilde;o: {termination_date}</p>\r\n                    <p style=\"font-size: 14.4px;\">Tipo de Rescis&atilde;o: {termination_type}</p>\r\n                    <p style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\r\n                    <p style=\"font-size: 14.4px;\">Obrigado</p>\r\n                    <p style=\"font-size: 14.4px;\">Considera,</p>\r\n                    <p style=\"font-size: 14.4px;\">Departamento de RH,</p>\r\n                    <p style=\"font-size: 14.4px;\">{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(193, 13, 'ar', 'Leave Status', '<p style=\"text-align: left;\">Subject : -HR ادارة / شركة لارسال رسالة الموافقة الى { leave_status } اجازة أو ترك.</p>\r\n                    <p style=\"text-align: left;\">عزيزي { leave_status_name } ،</p>\r\n                    <p style=\"text-align: left;\">لدي { leave_status } طلب الخروج الخاص بك الى { leave_reason } من { leave_start_date } الى { leave_end_date }.</p>\r\n                    <p style=\"text-align: left;\">{ total_leave_days } أيام لدي { leave_status } طلب الخروج الخاص بك ل ـ { leave_reason }.</p>\r\n                    <p style=\"text-align: left;\">ونحن نطلب منكم أن تكملوا كل أعمالكم المعلقة أو أي قضية مهمة أخرى حتى لا تواجه الشركة أي خسارة أو مشكلة أثناء غيابكم. نحن نقدر لك مصداقيتك لإبلاغنا بوقت كاف مقدما</p>\r\n                    <p style=\"text-align: left;\">إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\r\n                    <p style=\"text-align: left;\">شكرا لك</p>\r\n                    <p style=\"text-align: left;\">Regards,</p>\r\n                    <p style=\"text-align: left;\">إدارة الموارد البشرية ،</p>\r\n                    <p style=\"text-align: left;\">{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(194, 13, 'da', 'Leave Status', '<p>Emne:-HR-afdelingen / Kompagniet for at sende godkendelsesbrev til { leave_status } en ferie eller orlov.</p>\r\n                    <p>K&aelig;re { leave_status_name },</p>\r\n                    <p>Jeg har { leave_status } din orlov-anmodning for { leave_reason } fra { leave_start_date } til { leave_end_date }.</p>\r\n                    <p>{ total_leave_days } dage Jeg har { leave_status } din anmodning om { leave_reason } for { leave_reason }.</p>\r\n                    <p>Vi beder dig om at f&aelig;rdigg&oslash;re alt dit udest&aring;ende arbejde eller andet vigtigt sp&oslash;rgsm&aring;l, s&aring; virksomheden ikke st&aring;r over for nogen tab eller problemer under dit frav&aelig;r. Vi s&aelig;tter pris p&aring; din bet&aelig;nksomhed at informere os godt p&aring; forh&aring;nd</p>\r\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\r\n                    <p>Tak.</p>\r\n                    <p>Med venlig hilsen</p>\r\n                    <p>HR-afdelingen,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(195, 13, 'de', 'Leave Status', '<p>Betreff: -Personalabteilung/Firma, um den Genehmigungsschreiben an {leave_status} einen Urlaub oder Urlaub zu schicken.</p>\r\n                    <p>Sehr geehrter {leave_status_name},</p>\r\n                    <p>Ich habe {leave_status} Ihre Urlaubsanforderung f&uuml;r {leave_reason} von {leave_start_date} bis {leave_end_date}.</p>\r\n                    <p>{total_leave_days} Tage Ich habe {leave_status} Ihre Urlaubs-Anfrage f&uuml;r {leave_reason}.</p>\r\n                    <p>Wir bitten Sie, Ihre gesamte anstehende Arbeit oder ein anderes wichtiges Thema abzuschlie&szlig;en, so dass das Unternehmen w&auml;hrend Ihrer Abwesenheit keinen Verlust oder kein Problem zu Gesicht bekommen hat. Wir sch&auml;tzen Ihre Nachdenklichkeit, um uns im Vorfeld gut zu informieren</p>\r\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\r\n                    <p>Danke.</p>\r\n                    <p>Betrachtet,</p>\r\n                    <p>Personalabteilung,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(196, 13, 'en', 'Leave Status', '<p><strong>Subject:-HR department/Company to send approval letter to {leave_status} a vacation or leave.</strong></p>\r\n                    <p><strong>Dear {leave_status_name},</strong></p>\r\n                    <p>I have {leave_status} your leave request for {leave_reason} from {leave_start_date} to {leave_end_date}.</p>\r\n                    <p>{total_leave_days} days I have {leave_status}&nbsp; your leave request for {leave_reason}.</p>\r\n                    <p>We request you to complete all your pending work or any other important issue so that the company does not face any loss or problem during your absence. We appreciate your thoughtfulness to inform us well in advance</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Feel free to reach out if you have any questions.</p>\r\n                    <p>Thank you</p>\r\n                    <p><strong>Regards,</strong></p>\r\n                    <p><strong>HR Department,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(197, 13, 'es', 'Leave Status', '<p>Asunto: -Departamento de RR.HH./Empresa para enviar la carta de aprobaci&oacute;n a {leave_status} unas vacaciones o permisos.</p>\r\n                    <p>Estimado {leave_status_name},</p>\r\n                    <p>Tengo {leave_status} la solicitud de licencia para {leave_reason} de {leave_start_date} a {leave_end_date}.</p>\r\n                    <p>{total_leave_days} d&iacute;as tengo {leave_status} la solicitud de licencia para {leave_reason}.</p>\r\n                    <p>Le solicitamos que complete todos sus trabajos pendientes o cualquier otro asunto importante para que la empresa no se enfrente a ninguna p&eacute;rdida o problema durante su ausencia. Agradecemos su atenci&oacute;n para informarnos con mucha antelaci&oacute;n</p>\r\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\r\n                    <p>&iexcl;Gracias!</p>\r\n                    <p>Considerando,</p>\r\n                    <p>Departamento de Recursos Humanos,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(198, 13, 'fr', 'Leave Status', '<p>Objet: -HR department / Company to send approval letter to { leave_status } a vacances or leave.</p>\r\n                    <p>Cher { leave_status_name },</p>\r\n                    <p>Jai { leave_statut } votre demande de cong&eacute; pour { leave_reason } de { leave_start_date } &agrave; { leave_date_fin }.</p>\r\n                    <p>{ total_leave_days } jours I have { leave_status } your leave request for { leave_reason }.</p>\r\n                    <p>Nous vous demandons de remplir tous vos travaux en cours ou toute autre question importante afin que lentreprise ne soit pas confront&eacute;e &agrave; une perte ou &agrave; un probl&egrave;me pendant votre absence. Nous appr&eacute;cions votre attention pour nous informer longtemps &agrave; lavance</p>\r\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\r\n                    <p>Je vous remercie</p>\r\n                    <p>Regards,</p>\r\n                    <p>D&eacute;partement des RH,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(199, 13, 'it', 'Leave Status', '<p>Oggetto: - Dipartimento HR / Societ&agrave; per inviare lettera di approvazione a {leave_status} una vacanza o un congedo.</p>\r\n                    <p>Caro {leave_status_name},</p>\r\n                    <p>Ho {leave_status} la tua richiesta di permesso per {leave_reason} da {leave_start_date} a {leave_end_date}.</p>\r\n                    <p>{total_leave_days} giorni I ho {leave_status} la tua richiesta di permesso per {leave_reason}.</p>\r\n                    <p>Ti richiediamo di completare tutte le tue lavorazioni in sospeso o qualsiasi altra questione importante in modo che lazienda non faccia alcuna perdita o problema durante la tua assenza. Apprezziamo la vostra premura per informarci bene in anticipo</p>\r\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\r\n                    <p>Grazie</p>\r\n                    <p>Riguardo,</p>\r\n                    <p>Dipartimento HR,</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(200, 13, 'ja', 'Leave Status', '<p>件名: 承認レターを { leave_status} に送信するには、 -HR 部門/会社が休暇または休暇を入力します。</p>\r\n                    <p>{leave_status_name} を終了します。</p>\r\n                    <p>{ leave_reason } の { leave_start_date} から {leave_end_date}までの { leave_status} の終了要求を { leave_status} しています。</p>\r\n                    <p>{total_leave_days} 日に { leave_reason}{ leave_status} に対するあなたの休暇要求があります。</p>\r\n                    <p>お客様は、お客様の不在中に損失や問題が発生しないように、保留中のすべての作業またはその他の重要な問題を完了するよう要求します。 私たちは、前もってお知らせすることに感謝しています。</p>\r\n                    <p>質問がある場合は、自由に連絡してください。</p>\r\n                    <p>ありがとう</p>\r\n                    <p>よろしく</p>\r\n                    <p>HR 部門</p>\r\n                    <p>{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(201, 13, 'nl', 'Leave Status', '<p>Betreft: -HR-afdeling/Bedrijf voor het verzenden van een goedkeuringsbrief aan { leave_status } een vakantie of verlof.</p>\r\n                    <p>Geachte { leave_status_name },</p>\r\n                    <p>Ik heb { leave_status } uw verzoek om verlof voor { leave_reason } van { leave_start_date } tot { leave_end_date }.</p>\r\n                    <p>{ total_leave_days } dagen Ik heb { leave_status } uw verzoek om verlof voor { leave_reason }.</p>\r\n                    <p>Wij vragen u om al uw lopende werk of een andere belangrijke kwestie, zodat het bedrijf geen verlies of probleem tijdens uw afwezigheid geconfronteerd. We waarderen uw bedachtzaamheid om ons van tevoren goed te informeren.</p>\r\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\r\n                    <p>Dank u wel</p>\r\n                    <p>Betreft:</p>\r\n                    <p>HR-afdeling,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(202, 13, 'pl', 'Leave Status', '<p>Temat: -Dział kadr/Firma wysyłająca list zatwierdzający do {leave_status } wakacji lub urlop&oacute;w.</p>\r\n                    <p>Drogi {leave_status_name },</p>\r\n                    <p>Mam {leave_status } żądanie pozostania dla {leave_reason } od {leave_start_date } do {leave_end_date }.</p>\r\n                    <p>{total_leave_days } dni Mam {leave_status } Twoje żądanie opuszczenia dla {leave_reason }.</p>\r\n                    <p>Prosimy o wypełnienie wszystkich oczekujących prac lub innych ważnych kwestii, tak aby firma nie borykała się z żadną stratą lub problemem w czasie Twojej nieobecności. Doceniamy Twoją przemyślność, aby poinformować nas dobrze z wyprzedzeniem</p>\r\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\r\n                    <p>Dziękujemy</p>\r\n                    <p>W odniesieniu do</p>\r\n                    <p>Dział HR,</p>\r\n                    <p>{app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(203, 13, 'ru', 'Leave Status', '<p>Тема: -HR отдел/Компания отправить письмо с утверждением на { leave_status } отпуск или отпуск.</p>\r\n                    <p>Уважаемый { leave_status_name },</p>\r\n                    <p>У меня { leave_status } ваш запрос на отпуск для { leave_reason } из { leave_start_date } в { leave_end_date }.</p>\r\n                    <p>{ total_leave_days } дней { leave_status } ваш запрос на отпуск для { leave_reason }.</p>\r\n                    <p>Мы просим вас завершить все ваши ожидающие работы или любой другой важный вопрос, чтобы компания не сталкивалась с потерей или проблемой во время вашего отсутствия. Мы ценим вашу задумчивость, чтобы заблаговременно информировать нас о</p>\r\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\r\n                    <p>Спасибо.</p>\r\n                    <p>С уважением,</p>\r\n                    <p>Отдел кадров,</p>\r\n                    <p>{ app_name }</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(204, 13, 'pt', 'Leave Status', '<p style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de aprova&ccedil;&atilde;o para {leave_status} f&eacute;rias ou licen&ccedil;a.</p>\r\n                    <p style=\"font-size: 14.4px;\">Querido {leave_status_name},</p>\r\n                    <p style=\"font-size: 14.4px;\">Eu tenho {leave_status} sua solicita&ccedil;&atilde;o de licen&ccedil;a para {leave_reason} de {leave_start_date} para {leave_end_date}.</p>\r\n                    <p style=\"font-size: 14.4px;\">{total_leave_days} dias eu tenho {leave_status} o seu pedido de licen&ccedil;a para {leave_reason}.</p>\r\n                    <p style=\"font-size: 14.4px;\">Solicitamos que voc&ecirc; complete todo o seu trabalho pendente ou qualquer outra quest&atilde;o importante para que a empresa n&atilde;o enfrente qualquer perda ou problema durante a sua aus&ecirc;ncia. Agradecemos a sua atenciosidade para nos informar com bastante anteced&ecirc;ncia</p>\r\n                    <p style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\r\n                    <p style=\"font-size: 14.4px;\">Obrigado</p>\r\n                    <p style=\"font-size: 14.4px;\">Considera,</p>\r\n                    <p style=\"font-size: 14.4px;\">Departamento de RH,</p>\r\n                    <p style=\"font-size: 14.4px;\">{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16');
INSERT INTO `email_template_langs` (`id`, `parent_id`, `lang`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(205, 13, 'tr', 'Leave Status', '<p><strong>Konu:-Onay yazısının gönderileceği İK departmanı/Şirket {leave_status} tatil ya da izin.</strong></p>\r\n                    <p><strong>Sayın {leave_status_name},</strong></p>\r\n                    <p>Sahibim {leave_status} için izin talebiniz {leave_reason} itibaren {leave_start_date} ile {leave_end_date}.</p>\r\n                    <p>{total_leave_days} sahip olduğum günler {leave_status}&nbsp; için izin talebiniz {leave_reason}.</p>\r\n                    <p>Şirketin yokluğunuz sırasında herhangi bir kayıp veya sorunla karşılaşmaması için bekleyen tüm işlerinizi veya diğer önemli hususlarınızı tamamlamanızı rica ederiz. Bizi önceden bilgilendirme konusundaki düşünceniz için teşekkür ederiz</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Herhangi bir sorunuz varsa ulaşmaktan çekinmeyin.</p>\r\n                    <p>Teşekkür ederim</p>\r\n                    <p><strong>Saygılarımızla,</strong></p>\r\n                    <p><strong>İK Departmanı,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(206, 13, 'zh', 'Leave Status', '<p><strong>主题：-人力资源部门/公司发送批准函 {leave_status} 休假或请假.</strong></p>\r\n                    <p><strong>亲爱的 {leave_status_name},</strong></p>\r\n                    <p>我有 {leave_status} 您的请假申请 {leave_reason} 从 {leave_start_date} 到 {leave_end_date}.</p>\r\n                    <p>{total_leave_days} 我有的日子 {leave_status}&nbsp; 您的请假申请 {leave_reason}.</p>\r\n                    <p>我们要求您完成所有未完成的工作或任何其他重要问题，以便公司在您缺席期间不会面临任何损失或问题。感谢您的周到提前通知我们</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>如果您有任何疑问，请随时与我们联系.</p>\r\n                    <p>谢谢</p>\r\n                    <p><strong>问候,</strong></p>\r\n                    <p><strong>人事部,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(207, 13, 'he', 'Leave Status', '<p><strong>Subject:-מחלקת משאבי אנוש/חברה לשלוח אליה מכתב אישור {leave_status} חופשה או חופשה.</strong></p>\r\n                    <p><strong>יָקָר {leave_status_name},</strong></p>\r\n                    <p>יש לי {leave_status} בקשת החופשה שלך עבור {leave_reason} מ {leave_start_date} ל {leave_end_date}.</p>\r\n                    <p>{total_leave_days} ימים שיש לי {leave_status}&nbsp; בקשת החופשה שלך עבור {leave_reason}.</p>\r\n                    <p>אנו מבקשים מכם להשלים את כל העבודה הממתינה או כל נושא חשוב אחר על מנת שהחברה לא תעמוד בפני כל אובדן או בעיה במהלך היעדרותכם. אנו מעריכים את התחשבותך להודיע ​​לנו זמן רב מראש</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>אל תהסס לפנות אם יש לך שאלות.</p>\r\n                    <p>תודה</p>\r\n                    <p><strong>בברכה,</strong></p>\r\n                    <p><strong>מחלקת משאבי אנוש,</strong></p>\r\n                    <p><strong>{app_name}</strong></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(208, 13, 'pt-br', 'Leave Status', '<p style=\"font-size: 14.4px;\">Assunto:-Departamento de RH / Empresa para enviar carta de aprova&ccedil;&atilde;o para {leave_status} f&eacute;rias ou licen&ccedil;a.</p>\r\n                    <p style=\"font-size: 14.4px;\">Querido {leave_status_name},</p>\r\n                    <p style=\"font-size: 14.4px;\">Eu tenho {leave_status} sua solicita&ccedil;&atilde;o de licen&ccedil;a para {leave_reason} de {leave_start_date} para {leave_end_date}.</p>\r\n                    <p style=\"font-size: 14.4px;\">{total_leave_days} dias eu tenho {leave_status} o seu pedido de licen&ccedil;a para {leave_reason}.</p>\r\n                    <p style=\"font-size: 14.4px;\">Solicitamos que voc&ecirc; complete todo o seu trabalho pendente ou qualquer outra quest&atilde;o importante para que a empresa n&atilde;o enfrente qualquer perda ou problema durante a sua aus&ecirc;ncia. Agradecemos a sua atenciosidade para nos informar com bastante anteced&ecirc;ncia</p>\r\n                    <p style=\"font-size: 14.4px;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\r\n                    <p style=\"font-size: 14.4px;\">Obrigado</p>\r\n                    <p style=\"font-size: 14.4px;\">Considera,</p>\r\n                    <p style=\"font-size: 14.4px;\">Departamento de RH,</p>\r\n                    <p style=\"font-size: 14.4px;\">{app_name}</p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(209, 14, 'ar', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong>مرحبا </strong>{ contract_employee } </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong><strong>العقد :</strong> </strong>{ contract_subject } </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>تاريخ البدء</strong>: { contract_start_date } </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>تاريخ الانتهاء</strong>: { contract_end_date } </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\">اتطلع للسمع منك. </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">Regards Regards ، </span></strong></p>\r\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(210, 14, 'da', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong>Hej </strong>{ contract_employee } </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Aftaleemne:</strong> { contract_subject } </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>tart-dato</strong>: { contract_start_date } </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Slutdato</strong>: { contract_end_date } </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\">Ser frem til at høre fra dig. </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">Kærlig hilsen </span></strong></p>\r\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(211, 14, 'de', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong><strong> </strong></strong>{contract_employee} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Vertragssubjekt:</strong> {contract_subject} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>tart-Datum</strong>: {contract_start_date} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Sluttdato </strong>:{contract_end_date} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\">Freuen Sie sich auf die von Ihnen zu h&ouml;renden Informationen. </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">-Regards, </span></span></strong></p>\r\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(212, 14, 'en', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong>Hi </strong>{contract_employee} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Contract Subject:</strong> {contract_subject} </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>tart Date</strong>: {contract_start_date} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>End Date</strong>: {contract_end_date} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\">Looking forward to hear from you. </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">Kind Regards, </span></strong></p>\r\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(213, 14, 'es', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong><strong>Hi </strong></strong>{contract_employee} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong><strong>de contrato:</strong> </strong>{contract_subject} </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">S</span></span></strong><span style=\"font-family: sans-serif;\"><strong>tart Date</strong>: {contract_start_date} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Fecha de finalizaci&oacute;n</strong>: {contract_end_date} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\">Con ganas de escuchar de usted. </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Regards de tipo, </span></span></strong></p>\r\n                    <p><span style=\"font-family: sans-serif;\">{contract_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(214, 14, 'fr', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong><strong> </strong></strong>{ contract_employee } </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Objet du contrat:</strong> { contract_subject } </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>Date de d&eacute;but</strong>: { contract_start_date } </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Date de fin</strong>: { contract_end_date } </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\">Vous avez h&acirc;te de vous entendre. </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">Kind Regards </span> </strong></p>\r\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(215, 14, 'it', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong>Ciao </strong>{contract_employee} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Oggetto Contratto:</strong> {contract_subject} </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>Data tarte</strong>: {contract_start_date} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Data di fine</strong>: {contract_end_date} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\">Non vedo lora di sentire da te. </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">Kind indipendentemente, </span></strong></p>\r\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(216, 14, 'ja', 'Contract', '<p><span style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\"><strong>ハイ </strong>{contract_employee} </span></span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>契約件名:</strong> {契約対象} </span></p>\r\n                    <p><strong><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>tart Date</strong>: </span></strong><span style=\"font-family: sans-serif;\">{contract_start_date}</span><span style=\"font-family: sans-serif;\"> </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>終了日</strong>: {contract_end_date} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\">お客様から連絡をお待ちしています。 </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">クインド・レード </span></span></strong></p>\r\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(217, 14, 'nl', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong>Hi </strong>{ contract_employee } </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Contractonderwerp:</strong> { contract_subject } </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>tart Date</strong>: { contract_start_date } </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Einddatum</strong>: { contract_end_date } </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\">Ik kijk ernaar uit om van u te horen. </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">Soort Regards, </span></strong></p>\r\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(218, 14, 'pl', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong>Hi </strong>{contract_employee}</span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Temat umowy:</strong> {contract_subject} </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">S</span></span></strong><span style=\"font-family: sans-serif;\"><strong>data tartu</strong>: {contract_start_date} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Data zakończenia</strong>: {contract_end_date} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\">Nie można się doczekać, aby usłyszeć od użytkownika. </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">Regaty typu, </span></strong></p>\r\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(219, 14, 'ru', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong>Привет </strong>{ contract_employee } </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Тема договора:</strong> { contract_subject } </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>дата запуска</strong>: { contract_start_date } </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Дата окончания</strong>: { contract_end_date } </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\">С нетерпением ожидаю услышать от вас. </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">Карты вида, </span></strong></p>\r\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(220, 14, 'pt', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong>Oi </strong>{contract_employee} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Assunto do Contrato:</strong> {contract_subject} </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>tart Date</strong>: {contract_start_date} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Data de término</strong>: {contract_end_date} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\">Olhando para a frente para ouvir de você. </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">Kind Considerar, </span></strong></p>\r\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(221, 14, 'tr', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong>MERHABA </strong>{contract_employee} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Sözleşme Konusu:</strong> {contract_subject} </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>Başlangıç ​​tarihi</strong>: {contract_start_date} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Bitiş tarihi</strong>: {contract_end_date} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\">senden haber bekliyorum. </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">Saygılarımla, </span></strong></p>\r\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(222, 14, 'zh', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong>你好 </strong>{contract_employee} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>合同主体:</strong> {contract_subject} </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\"></span></strong><span style=\"font-family: sans-serif;\"><strong>开始日期</strong>: {contract_start_date} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>结束日期</strong>: {contract_end_date} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\">期待着听到您的意见. </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">亲切的问候, </span></strong></p>\r\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(223, 14, 'he', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong>היי </strong>{contract_employee} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>נושא החוזה:</strong> {contract_subject} </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\"></span></strong><span style=\"font-family: sans-serif;\"><strong>תאריך התחלה</strong>: {contract_start_date} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>תאריך סיום</strong>: {contract_end_date} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\">מצפה לשמוע ממך. </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">בברכה, </span></strong></p>\r\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(224, 14, 'pt-br', 'Contract', '<p><span style=\"font-family: sans-serif;\"><strong>Oi </strong>{contract_employee} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Assunto do Contrato:</strong> {contract_subject} </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">S</span></strong><span style=\"font-family: sans-serif;\"><strong>tart Date</strong>: {contract_start_date} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\"><strong>Data de término</strong>: {contract_end_date} </span></p>\r\n                    <p><span style=\"font-family: sans-serif;\">Olhando para a frente para ouvir de você. </span></p>\r\n                    <p><strong><span style=\"font-family: sans-serif;\">Kind Considerar, </span></strong></p>\r\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>', '2024-04-17 02:53:16', '2024-04-17 02:53:16');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_id` int NOT NULL,
  `department_id` int NOT NULL,
  `designation_id` int NOT NULL,
  `company_doj` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `documents` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_identifier_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_payer_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary_type` int DEFAULT NULL,
  `account_type` int DEFAULT NULL,
  `salary` double(25,2) DEFAULT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_documents`
--

CREATE TABLE `employee_documents` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` int NOT NULL,
  `document_id` int NOT NULL,
  `document_value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` int NOT NULL,
  `department_id` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_employees`
--

CREATE TABLE `event_employees` (
  `id` bigint UNSIGNED NOT NULL,
  `event_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint UNSIGNED NOT NULL,
  `account_id` int NOT NULL,
  `amount` double(15,2) NOT NULL,
  `date` date NOT NULL,
  `expense_category_id` int NOT NULL,
  `payee_id` int NOT NULL,
  `payment_type_id` int NOT NULL,
  `referal_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_types`
--

CREATE TABLE `expense_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `experience_certificates`
--

CREATE TABLE `experience_certificates` (
  `id` bigint UNSIGNED NOT NULL,
  `lang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `experience_certificates`
--

INSERT INTO `experience_certificates` (`id`, `lang`, `content`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'ar', '<h3 style=\"text-align: center;\">بريد إلكتروني تجربة</h3>\r\n            \r\n            \r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>إلي من يهمه الامر</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>مدة الخدمة {duration} في {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>الادوار والمسؤوليات</p>\r\n            \r\n            \r\n            \r\n            <p>وصف موجز لمسار عمل الموظف وبيان إيجابي من المدير أو المشرف.</p>\r\n            \r\n            \r\n            \r\n            <p>بإخلاص،</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>التوقيع</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(2, 'da', '<h3 style=\"text-align: center;\">Erfaringsbrev</h3>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>TIL HVEM DET M&Aring;TTE VEDR&Oslash;RE</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Tjenesteperiode {duration} i {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Roller og ansvar</p>\r\n            \r\n            \r\n            \r\n            <p>Kort beskrivelse af medarbejderens ans&aelig;ttelsesforl&oslash;b og positiv udtalelse fra leder eller arbejdsleder.</p>\r\n            \r\n            \r\n            \r\n            <p>Med venlig hilsen</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Underskrift</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(3, 'de', '<h3 style=\"text-align: center;\">Erfahrungsbrief</h3>\r\n            \r\n            \r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>WEN ES ANGEHT</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Dienstzeit {duration} in {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Rollen und Verantwortlichkeiten</p>\r\n            \r\n            \r\n            \r\n            <p>Kurze Beschreibung des beruflichen Werdegangs des Mitarbeiters und eine positive Stellungnahme des Vorgesetzten oder Vorgesetzten.</p>\r\n            \r\n            \r\n            \r\n            <p>Aufrichtig,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Unterschrift</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(4, 'en', '<p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: center;\" align=\"center\"><span style=\"font-size: 18pt;\"><strong>Experience Letter</strong></span></p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">&nbsp;</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{app_name}</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">TO WHOM IT MAY CONCERN</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{date}</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{employee_name}</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">Tenure of Service {duration} in {app_name}.</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{designation}</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{payroll}</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">Roles and Responsibilities</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">&nbsp;</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">Brief description of the employee&rsquo;s course of employment and a positive statement from the manager or supervisor.</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">&nbsp;</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">Sincerely,</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{employee_name}</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{designation}</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">Signature</p>\r\n            <p lang=\"en-IN\" style=\"margin-bottom: 0cm; direction: ltr; line-height: 2; text-align: left;\" align=\"center\">{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(5, 'es', '<h3 style=\"text-align: center;\">Carta de experiencia</h3>\r\n            \r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>A QUIEN LE INTERESE</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Duraci&oacute;n del servicio {duration} en {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Funciones y responsabilidades</p>\r\n            \r\n            \r\n            \r\n            <p>Breve descripci&oacute;n del curso de empleo del empleado y una declaraci&oacute;n positiva del gerente o supervisor.</p>\r\n            \r\n            \r\n            \r\n            <p>Sinceramente,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Firma</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(6, 'fr', '<h3 style=\"text-align: center;\">Lettre dexp&eacute;rience</h3>\r\n            \r\n            \r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>&Agrave; QUI DE DROIT</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Dur&eacute;e du service {duration} dans {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>R&ocirc;les et responsabilit&eacute;s</p>\r\n            \r\n            \r\n            \r\n            <p>Br&egrave;ve description de l&eacute;volution de lemploi de lemploy&eacute; et une d&eacute;claration positive du gestionnaire ou du superviseur.</p>\r\n            \r\n            \r\n            \r\n            <p>Sinc&egrave;rement,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Signature</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(7, 'id', '<h3 style=\"text-align: center;\">Surat Pengalaman</h3>\r\n            \r\n            \r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>UNTUK PERHATIAN</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Jangka Waktu Layanan {duration} di {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Peran dan Tanggung Jawab</p>\r\n            \r\n            \r\n            \r\n            <p>Deskripsi singkat tentang pekerjaan karyawan dan pernyataan positif dari manajer atau supervisor.</p>\r\n            \r\n            \r\n            \r\n            <p>Sungguh-sungguh,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Tanda tangan</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(8, 'it', '<h3 style=\"text-align: center;\">Lettera di esperienza</h3>\r\n            \r\n            \r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>PER CHI &Egrave; COINVOLTO</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Durata del servizio {duration} in {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Ruoli e responsabilit&agrave;</p>\r\n            \r\n            \r\n            \r\n            <p>Breve descrizione del percorso lavorativo del dipendente e dichiarazione positiva del manager o supervisore.</p>\r\n            \r\n            \r\n            \r\n            <p>Cordiali saluti,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Firma</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(9, 'ja', '\r\n            <h3 style=\"text-align: center;\">体験談</h3>\r\n            \r\n            \r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>ご担当者様</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{app_name} のサービス {duration} の保有期間。</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>役割と責任</p>\r\n            \r\n            \r\n            \r\n            <p>従業員の雇用コースの簡単な説明と、マネージャーまたはスーパーバイザーからの肯定的な声明。</p>\r\n            \r\n            \r\n            \r\n            <p>心から、</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>サイン</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(10, 'nl', '<h3 style=\"text-align: center;\">Ervaringsbrief</h3>\r\n            \r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>VOOR WIE HET AANGAAT</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Diensttijd {duration} in {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Rollen en verantwoordelijkheden</p>\r\n            \r\n            \r\n            \r\n            <p>Korte omschrijving van het dienstverband van de medewerker en een positieve verklaring van de leidinggevende of leidinggevende.</p>\r\n            \r\n            \r\n            \r\n            <p>Eerlijk,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Handtekening</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(11, 'pl', '<h3 style=\"text-align: center;\">Doświadczenie List</h3>\r\n            \r\n            \r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>DO TYCH KT&Oacute;RYCH MOŻE TO DOTYCZYĆ</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Okres świadczenia usług {duration} w aplikacji {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Role i obowiązki</p>\r\n            \r\n            \r\n            \r\n            <p>Kr&oacute;tki opis przebiegu zatrudnienia pracownika oraz pozytywna opinia kierownika lub przełożonego.</p>\r\n            \r\n            \r\n            \r\n            <p>Z poważaniem,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Podpis</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(12, 'pt', '<h3 style=\"text-align: center;\">Carta de Experi&ecirc;ncia</h3>\r\n            \r\n            \r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>A QUEM POSSA INTERESSAR</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Tempo de servi&ccedil;o {duration} em {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Pap&eacute;is e responsabilidades</p>\r\n            \r\n            \r\n            \r\n            <p>Breve descri&ccedil;&atilde;o do curso de emprego do funcion&aacute;rio e uma declara&ccedil;&atilde;o positiva do gerente ou supervisor.</p>\r\n            \r\n            \r\n            \r\n            <p>Sinceramente,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Assinatura</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(13, 'ru', '<h3 style=\"text-align: center;\">Письмо об опыте</h3>\r\n            \r\n            \r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>ДЛЯ ПРЕДЪЯВЛЕНИЯ ПО МЕСТУ ТРЕБОВАНИЯ</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Срок службы {duration} в {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Роли и обязанности</p>\r\n            \r\n            \r\n            \r\n            <p>Краткое описание трудового стажа работника и положительное заключение руководителя или руководителя.</p>\r\n            \r\n            \r\n            \r\n            <p>Искренне,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Подпись</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(14, 'tr', '<h3 style=\"text-align: center;\">Tecrübe mektubu</h3>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>İLGİLİ MAKAMA</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Hizmet süresi {duration} içinde {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Görev ve Sorumluluklar</p>\r\n            \r\n            <p>Çalışanların istihdam sürecinin kısa açıklaması ve yönetici veya amirden olumlu bir açıklama.</p>\r\n            \r\n            <p>Samimi olarak,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>İmza</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(15, 'zh', '<h3 style=\"text-align: center;\">经验信</h3>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>敬启者</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>服务期限 {duration} 在 {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>角色和责任</p>\r\n            \r\n            <p>员工就业历程的简要描述以及经理或主管的积极声明.</p>\r\n            \r\n            <p>真挚地,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>签名</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(16, 'he', '<h3 style=\"text-align: center;\">מכתב ניסיון</h3>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>לכל מאן דבעי</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>כהונת שירות {duration} ב {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>תפקידים ואחריות</p>\r\n            \r\n            <p>תיאור קצר של מהלך העסקת העובדים והצהרה חיובית מהמנהל או הממונה.</p>\r\n            \r\n            <p>בכנות,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>חֲתִימָה</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(17, 'pt-br', '<h3 style=\"text-align: center;\">Carta de Experi&ecirc;ncia</h3>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>A QUEM POSSA INTERESSAR</p>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>Tempo de servi&ccedil;o {duration} em {app_name}.</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>{payroll}</p>\r\n            \r\n            <p>Pap&eacute;is e responsabilidades</p>\r\n            \r\n            <p>Breve descri&ccedil;&atilde;o do curso de emprego do funcion&aacute;rio e uma declara&ccedil;&atilde;o positiva do gerente ou supervisor.</p>\r\n            \r\n            <p>Sinceramente,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Assinatura</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `generate_offer_letters`
--

CREATE TABLE `generate_offer_letters` (
  `id` bigint UNSIGNED NOT NULL,
  `lang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generate_offer_letters`
--

INSERT INTO `generate_offer_letters` (`id`, `lang`, `content`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'ar', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>رسالة عرض</strong></span></p>\r\n                    \r\n                    \r\n                    <p>عزيزي {applicationant_name} ،</p>\r\n                    \r\n                    \r\n                    <p>{app_name} متحمس لاصطحابك على متن الطائرة بصفتك {job_title}.</p>\r\n                    \r\n                    <p>كنت على بعد خطوات قليلة من الشروع في العمل. يرجى أخذ الوقت الكافي لمراجعة عرضنا الرسمي. يتضمن تفاصيل مهمة حول راتبك ومزاياك وبنود وشروط عملك المتوقع مع {app_name}.</p>\r\n                    \r\n                    \r\n                    <p>{app_name} يقدم {job_type}. المنصب بالنسبة لك كـ {job_title} ، تقديم التقارير إلى [المدير المباشر / المشرف] بدءًا من {start_date} في {workplace_location}. ساعات العمل المتوقعة هي {days_of_week}.</p>\r\n                    \r\n                    \r\n                    <p>في هذا المنصب ، يعرض عليك {app_name}&nbsp; {salary}أن تبدأ لك بمعدل دفع {salary_type} لكل {salary_duration}. سوف يتم الدفع لك على أساس.</p>\r\n                    \r\n                    \r\n                    <p>كجزء من تعويضك ، إذا كان ذلك ممكنًا ، ستصف مكافأتك ومشاركة الأرباح وهيكل العمولة وخيارات الأسهم وقواعد لجنة التعويضات هنا.</p>\r\n                    \r\n                    \r\n                    <p>بصفتك موظفًا في {app_name} ، ستكون مؤهلاً للحصول على مزايا الاسم المختصر ، مثل التأمين الصحي ، وخطة الأسهم ، والتأمين على الأسنان ، وما إلى ذلك.</p>\r\n                    \r\n                    \r\n                    <p>الرجاء توضيح موافقتك على هذه البنود وقبول هذا العرض عن طريق التوقيع على هذه الاتفاقية وتأريخها في أو قبل {offer_expiration_date}.</p>\r\n                    \r\n                    <p>بإخلاص،</p>\r\n                    \r\n                    <p>{app_name}</p>\r\n                    ', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(2, 'da', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Tilbudsbrev</strong></span></p>\r\n                    \r\n                    <p>K&aelig;re {applicant_name}</p>\r\n                    \r\n                    <p>{app_name} er glade for at f&aring; dig med som {job_title}.</p>\r\n                    \r\n                    <p>Der var kun et par formaliteter fra at komme p&aring; arbejde. Tag dig tid til at gennemg&aring; vores formelle tilbud. Den indeholder vigtige oplysninger om din kompensation, fordele og vilk&aring;rene og betingelserne for din forventede ans&aelig;ttelse hos {app_name}.</p>\r\n                    \r\n                    <p>{app_name} tilbyder en {job_type}. stilling til dig som {job_title}, der rapporterer til [n&aelig;rmeste leder/supervisor] fra og med {start_date} p&aring;{workplace_location}. Forventet arbejdstid er {days_of_week}.</p>\r\n                    \r\n                    \r\n                    <p>I denne stilling tilbyder {app_name} at starte dig med en l&oslash;nsats p&aring; {salary} pr. {salary_type}. Du vil blive betalt p&aring; {salary_duration}-basis.</p>\r\n                    \r\n                    <p>Som en del af din kompensation, du ogs&aring; tilbyder, hvis det er relevant, vil du beskrive din bonus, overskudsdeling, kommissionsstruktur, aktieoptioner og regler for kompensationsudvalget her.</p>\r\n                    \r\n                    \r\n                    <p>Som ansat hos {app_name} vil du v&aelig;re berettiget til kort navnefordele, s&aring;som sundhedsforsikring, aktieplan, tandforsikring osv.</p>\r\n                    \r\n                    <p>Angiv venligst din accept af disse vilk&aring;r og accepter dette tilbud ved at underskrive og datere denne aftale p&aring; eller f&oslash;r {offer_expiration_date}.</p>\r\n                    \r\n                    <p>Med venlig hilsen</p>\r\n                    \r\n                    <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(3, 'de', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Angebotsschreiben</strong></span></p>\r\n                    \r\n                    \r\n                    <p>Sehr geehrter {applicant_name},</p>\r\n                    \r\n                    \r\n                    <p>{app_name} freut sich, Sie als {job_title} an Bord zu holen.</p>\r\n                    \r\n                    \r\n                    <p>Nur noch wenige Formalit&auml;ten bis zur Arbeit. Bitte nehmen Sie sich die Zeit, unser formelles Angebot zu pr&uuml;fen. Es enth&auml;lt wichtige Details zu Ihrer Verg&uuml;tung, Ihren Leistungen und den Bedingungen Ihrer voraussichtlichen Anstellung bei {app_name}.</p>\r\n                    \r\n                    \r\n                    <p>{app_name} bietet einen {job_type} an. Position f&uuml;r Sie als {job_title}, ab {start_date} am {workplace_location} unterstellt an unmittelbarer Manager/Vorgesetzter. Erwartete Arbeitszeiten sind {days_of_week}.</p>\r\n                    \r\n                    \r\n                    <p>In dieser Position bietet {app_name} Ihnen an, mit einem Gehaltssatz von {salary} pro {salary_type} zu beginnen. Sie werden auf Basis von {salary_duration} bezahlt.</p>\r\n                    \r\n                    \r\n                    <p>Als Teil Ihrer Verg&uuml;tung, die Sie gegebenenfalls auch anbieten, beschreiben Sie hier Ihren Bonus, Ihre Gewinnbeteiligung, Ihre Provisionsstruktur, Ihre Aktienoptionen und die Regeln des Verg&uuml;tungsausschusses.</p>\r\n                    \r\n                    \r\n                    <p>Als Mitarbeiter von {app_name} haben Sie Anspruch auf Kurznamenvorteile wie Krankenversicherung, Aktienplan, Zahnversicherung usw.</p>\r\n                    \r\n                    \r\n                    \r\n                    <p>Bitte erkl&auml;ren Sie Ihr Einverst&auml;ndnis mit diesen Bedingungen und nehmen Sie dieses Angebot an, indem Sie diese Vereinbarung am oder vor dem {offer_expiration_date} unterzeichnen und datieren.</p>\r\n                    \r\n                    \r\n                    <p>Aufrichtig,</p>\r\n                    \r\n                    <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(4, 'en', '<p style=\"text-align: center;\"><strong>Offer Letter</strong></p>\r\n                    \r\n                    <p>Dear {applicant_name},</p>\r\n                    \r\n                    <p>{app_name} is excited to bring you on board as {job_title}.</p>\r\n                    \r\n                    <p>Were just a few formalities away from getting down to work. Please take the time to review our formal offer. It includes important details about your compensation, benefits, and the terms and conditions of your anticipated employment with {app_name}.</p>\r\n                    \r\n                    <p>{app_name} is offering a {job_type}. position for you as {job_title}, reporting to [immediate manager/supervisor] starting on {start_date} at{workplace_location}. Expected hours of work are{days_of_week}.</p>\r\n                    \r\n                    <p>In this position, {app_name} is offering to start you at a pay rate of {salary} per {salary_type}. You will be paid on a{salary_duration} basis.&nbsp;</p>\r\n                    \r\n                    <p>As part of your compensation, were also offering [if applicable, youll describe your bonus, profit sharing, commission structure, stock options, and compensation committee rules here].</p>\r\n                    \r\n                    <p>As an employee of {app_name} , you will be eligible for briefly name benefits, such as health insurance, stock plan, dental insurance, etc.</p>\r\n                    \r\n                    <p>Please indicate your agreement with these terms and accept this offer by signing and dating this agreement on or before {offer_expiration_date}.</p>\r\n                    \r\n                    <p>Sincerely,</p>\r\n                    <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(5, 'es', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Carta de oferta</strong></span></p>\r\n                    \r\n                    \r\n                    <p>Estimado {applicant_name},</p>\r\n                    \r\n                    <p>{app_name} se complace en incorporarlo como {job_title}.</p>\r\n                    \r\n                    \r\n                    <p>Faltaban s&oacute;lo unos tr&aacute;mites para ponerse manos a la obra. T&oacute;mese el tiempo para revisar nuestra oferta formal. Incluye detalles importantes sobre su compensaci&oacute;n, beneficios y los t&eacute;rminos y condiciones de su empleo anticipado con {app_name}.</p>\r\n                    \r\n                    \r\n                    <p>{app_name} est&aacute; ofreciendo {job_type}. posici&oacute;n para usted como {job_title}, reportando al gerente/supervisor inmediato a partir del {start_date} en {workplace_location}. Las horas de trabajo esperadas son {days_of_week}.</p>\r\n                    \r\n                    \r\n                    <p>En este puesto, {app_name} te ofrece comenzar con una tarifa de pago de {salary} por {salary_type}. Se le pagar&aacute; sobre la base de {salary_duration}.</p>\r\n                    \r\n                    \r\n                    <p>Como parte de su compensaci&oacute;n, tambi&eacute;n ofrecemos, si corresponde, aqu&iacute; describir&aacute; su bonificaci&oacute;n, participaci&oacute;n en las ganancias, estructura de comisiones, opciones sobre acciones y reglas del comit&eacute; de compensaci&oacute;n.</p>\r\n                    \r\n                    \r\n                    <p>Como empleado de {app_name}, ser&aacute; elegible para beneficios de nombre breve, como seguro m&eacute;dico, plan de acciones, seguro dental, etc.</p>\r\n                    \r\n                    \r\n                    <p>Indique su acuerdo con estos t&eacute;rminos y acepte esta oferta firmando y fechando este acuerdo el {offer_expiration_date} o antes.</p>\r\n                    \r\n                    \r\n                    <p>Sinceramente,</p>\r\n                    \r\n                    <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(6, 'fr', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Lettre doffre</strong></span></p>\r\n                    \r\n                    \r\n                    <p>Cher {applicant_name},</p>\r\n                    \r\n                    \r\n                    <p>{app_name} est ravi de vous accueillir en tant que {job_title}.</p>\r\n                    \r\n                    \r\n                    <p>&Eacute;taient juste quelques formalit&eacute;s loin de se mettre au travail. Veuillez prendre le temps dexaminer notre offre formelle. Il comprend des d&eacute;tails importants sur votre r&eacute;mun&eacute;ration, vos avantages et les termes et conditions de votre emploi pr&eacute;vu avec {app_name}.</p>\r\n                    \r\n                    \r\n                    <p>{app_name} propose un {job_type}. poste pour vous en tant que {job_title}, relevant du directeur/superviseur imm&eacute;diat &agrave; partir du {start_date} &agrave; {workplace_location}. Les heures de travail pr&eacute;vues sont de {days_of_week}.</p>\r\n                    \r\n                    \r\n                    <p>&Agrave; ce poste, {app_name} vous propose de commencer avec un taux de r&eacute;mun&eacute;ration de {salary} par {salary_type}. Vous serez pay&eacute; sur une base de {salary_duration}.</p>\r\n                    \r\n                    \r\n                    <p>Dans le cadre de votre r&eacute;mun&eacute;ration, le cas &eacute;ch&eacute;ant, vous d&eacute;crivez ici votre bonus, votre participation aux b&eacute;n&eacute;fices, votre structure de commission, vos options sur actions et les r&egrave;gles du comit&eacute; de r&eacute;mun&eacute;ration.</p>\r\n                    \r\n                    \r\n                    <p>En tant quemploy&eacute; de {app_name}, vous aurez droit &agrave; des avantages bri&egrave;vement nomm&eacute;s, tels que lassurance maladie, le plan dactionnariat, lassurance dentaire, etc.</p>\r\n                    \r\n                    \r\n                    <p>Veuillez indiquer votre accord avec ces conditions et accepter cette offre en signant et en datant cet accord au plus tard le {offer_expiration_date}.</p>\r\n                    \r\n                    \r\n                    <p>Sinc&egrave;rement,</p>\r\n                    <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(7, 'id', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Surat penawaran</strong></span></p>\r\n                    \r\n                    \r\n                    <p>{applicant_name} yang terhormat,</p>\r\n                    \r\n                    \r\n                    <p>{app_name} dengan senang hati membawa Anda sebagai {job_title}.</p>\r\n                    \r\n                    \r\n                    <p>Tinggal beberapa formalitas lagi untuk mulai bekerja. Harap luangkan waktu untuk meninjau penawaran resmi kami. Ini mencakup detail penting tentang kompensasi, tunjangan, serta persyaratan dan ketentuan pekerjaan yang Anda harapkan dengan {app_name}.</p>\r\n                    \r\n                    \r\n                    <p>{app_name} menawarkan {job_type}. posisi untuk Anda sebagai {job_title}, melapor ke manajer/penyelia langsung mulai {start_date} di{workplace_location}. Jam kerja yang diharapkan adalah{days_of_week}.</p>\r\n                    \r\n                    \r\n                    <p>Di posisi ini, {app_name} menawarkan untuk memulai Anda dengan tarif pembayaran {salary} per {salary_type}. Anda akan dibayar berdasarkan {salary_duration}.</p>\r\n                    \r\n                    \r\n                    <p>Sebagai bagian dari kompensasi Anda, yang juga ditawarkan jika berlaku, Anda akan menjelaskan bonus, pembagian keuntungan, struktur komisi, opsi saham, dan aturan komite kompensasi Anda di sini.</p>\r\n                    \r\n                    \r\n                    <p>Sebagai karyawan {app_name} , Anda akan memenuhi syarat untuk mendapatkan manfaat singkat, seperti asuransi kesehatan, paket saham, asuransi gigi, dll.</p>\r\n                    \r\n                    \r\n                    <p>Harap tunjukkan persetujuan Anda dengan persyaratan ini dan terima penawaran ini dengan menandatangani dan memberi tanggal pada perjanjian ini pada atau sebelum {offer_expiration_date}.</p>\r\n                    \r\n                    \r\n                    <p>Sungguh-sungguh,</p>\r\n                    \r\n                    <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(8, 'it', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Lettera di offerta</strong></span></p>\r\n                    \r\n                    \r\n                    <p>Gentile {nome_richiedente},</p>\r\n                    \r\n                    \r\n                    <p>{app_name} &egrave; entusiasta di portarti a bordo come {job_title}.</p>\r\n                    \r\n                    \r\n                    <p>Mancavano solo poche formalit&agrave; per mettersi al lavoro. Per favore, prenditi del tempo per rivedere la nostra offerta formale. Include dettagli importanti sul compenso, i vantaggi e i termini e le condizioni del tuo impiego previsto con {app_name}.</p>\r\n                    \r\n                    \r\n                    <p>{app_name} offre un {job_type}. posizione per te come {job_title}, riportando al manager/supervisore immediato a partire da {start_date} a {workplace_location}. Lorario di lavoro previsto &egrave; di {days_of_week}.</p>\r\n                    \r\n                    \r\n                    <p>In questa posizione, {app_name} ti offre di iniziare con una paga di {salary} per {salary_type}. Sarai pagato su base {salary_duration}.</p>\r\n                    \r\n                    \r\n                    <p>Come parte del tuo compenso, se applicabile, descrivi anche il tuo bonus, la partecipazione agli utili, la struttura delle commissioni, le stock option e le regole del comitato di compensazione qui.</p>\r\n                    \r\n                    \r\n                    <p>In qualit&agrave; di dipendente di {app_name} , avrai diritto a vantaggi per nomi brevi, come assicurazione sanitaria, piano azionario, assicurazione dentale, ecc.</p>\r\n                    \r\n                    \r\n                    <p>Indica il tuo accordo con questi termini e accetta questa offerta firmando e datando questo accordo entro il {offer_expiration_date}.</p>\r\n                    \r\n                    \r\n                    <p>Cordiali saluti,</p>\r\n                    \r\n                    <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(9, 'ja', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>内定通知</strong></span></p>\r\n                    \r\n                    \r\n                    <p>{applicant_name} 様</p>\r\n                    \r\n                    <p>{app_name} は、あなたを {job_title} として迎えることに興奮しています。</p>\r\n                    \r\n                    <p>仕事に取り掛かる前に、ほんの少しの手続きがありました。時間をかけて正式なオファーを確認してください。これには、あなたの報酬、福利厚生、および {app_name} での予想される雇用条件に関する重要な詳細が含まれています。</p>\r\n                    \r\n                    <p>{app_name} が {job_type} を提供しています。 {job_title} として、{start_date} から {workplace_location} の直属のマネージャー/スーパーバイザーに報告します。予想される勤務時間は {days_of_week} です。</p>\r\n                    \r\n                    <p>このポジションでは、{app_name} は、{salary_type} あたり {salary} の賃金率であなたをスタートさせることを提案しています。 {salary_duration} 単位で支払われます。</p>\r\n                    \r\n                    <p>報酬の一部として、該当する場合は提供もしていました。ボーナス、利益分配、手数料体系、ストック オプション、および報酬委員会の規則についてここに説明します。</p>\r\n                    \r\n                    <p>{app_name} の従業員として、健康保険、ストック プラン、歯科保険などの簡単な名前の特典を受ける資格があります。</p>\r\n                    \r\n                    <p>{offer_expiration_date} 日までに本契約に署名し日付を記入して、これらの条件に同意し、このオファーを受け入れてください。</p>\r\n                    \r\n                    <p>心から、</p>\r\n                    \r\n                    <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(10, 'nl', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Aanbiedingsbrief</strong></span></p>\r\n                    \r\n                    \r\n                    \r\n                    <p>Beste {applicant_name},</p>\r\n                    \r\n                    \r\n                    \r\n                    <p>{app_name} is verheugd je aan boord te mogen verwelkomen als {job_title}.</p>\r\n                    \r\n                    \r\n                    \r\n                    <p>Waren slechts een paar formaliteiten verwijderd om aan het werk te gaan. Neem de tijd om ons formele aanbod te bekijken. Het bevat belangrijke details over uw vergoeding, voordelen en de voorwaarden van uw verwachte dienstverband bij {app_name}.</p>\r\n                    \r\n                    \r\n                    \r\n                    <p>{app_name} biedt een {job_type} aan. functie voor jou als {job_title}, rapporterend aan directe manager/supervisor vanaf {start_date} op {workplace_location}. De verwachte werkuren zijn {days_of_week}.</p>\r\n                    \r\n                    \r\n                    \r\n                    <p>In deze functie biedt {app_name} aan om je te starten tegen een salaris van {salary} per {salary_type}. U wordt betaald op basis van {salary_duration}.</p>\r\n                    \r\n                    \r\n                    \r\n                    <p>Als onderdeel van uw vergoeding, die u, indien van toepassing, ook aanbiedt, beschrijft u hier uw bonus, winstdeling, commissiestructuur, aandelenopties en regels van het vergoedingscomit&eacute;.</p>\r\n                    \r\n                    \r\n                    \r\n                    <p>Als medewerker van {app_name} kom je in aanmerking voor korte naamvoordelen, zoals een ziektekostenverzekering, aandelenplan, tandartsverzekering, enz.</p>\r\n                    \r\n                    \r\n                    \r\n                    <p>Geef aan dat u akkoord gaat met deze voorwaarden en accepteer deze aanbieding door deze overeenkomst op of v&oacute;&oacute;r {offer_expiration_date} te ondertekenen en te dateren.</p>\r\n                    \r\n                    \r\n                    \r\n                    <p>Eerlijk,</p>\r\n                    \r\n                    <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(11, 'pl', '<p style=\"text-align: center;\"><strong><span style=\"font-size: 18pt;\">List ofertowy</span></strong></p>\r\n                    \r\n                    <p>Drogi {applicant_name},</p>\r\n                    \r\n                    <p>{app_name} z radością zaprasza Cię do wsp&oacute;łpracy jako {job_title}.</p>\r\n                    \r\n                    <p>Od rozpoczęcia pracy dzieliło mnie tylko kilka formalności. Prosimy o poświęcenie czasu na zapoznanie się z naszą oficjalną ofertą. Zawiera ważne szczeg&oacute;ły dotyczące Twojego wynagrodzenia, świadczeń oraz warunk&oacute;w Twojego przewidywanego zatrudnienia w {app_name}.</p>\r\n                    \r\n                    \r\n                    <p>{app_name} oferuje {job_type}. stanowisko dla Ciebie jako {job_title}, raportowanie do bezpośredniego przełożonego/przełożonego począwszy od {start_date} w {workplace_location}. Przewidywane godziny pracy to {days_of_week}.</p>\r\n                    \r\n                    \r\n                    <p>Na tym stanowisku {app_name} oferuje Ci rozpoczęcie pracy za stawkę {salary} za {salary_type}. Otrzymasz zapłatę na podstawie {salary_duration}.</p>\r\n                    \r\n                    \r\n                    <p>W ramach wynagrodzenia, kt&oacute;re oferowaliśmy, jeśli dotyczy, opiszesz tutaj swoją premię, podział zysk&oacute;w, strukturę prowizji, opcje na akcje i zasady komitetu ds. Wynagrodzeń.</p>\r\n                    \r\n                    \r\n                    <p>Jako pracownik {app_name} będziesz mieć prawo do kr&oacute;tkich imiennych świadczeń, takich jak ubezpieczenie zdrowotne, plan akcji, ubezpieczenie dentystyczne itp.</p>\r\n                    \r\n                    <p>Zaznacz, że zgadzasz się z tymi warunkami i zaakceptuj tę ofertę, podpisując i datując tę ​​umowę w dniu {offer_expiration_date} lub wcześniej.</p>\r\n                    \r\n                    <p>Z poważaniem,</p>\r\n                    \r\n                    <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(12, 'pt', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Carta de oferta</strong></span></p>\r\n                    \r\n                    \r\n                    <p>Prezado {applicant_name},</p>\r\n                    \r\n                    \r\n                    <p>{app_name} tem o prazer de trazer voc&ecirc; a bordo como {job_title}.</p>\r\n                    \r\n                    \r\n                    <p>Faltavam apenas algumas formalidades para come&ccedil;ar a trabalhar. Por favor, reserve um tempo para revisar nossa oferta formal. Ele inclui detalhes importantes sobre sua remunera&ccedil;&atilde;o, benef&iacute;cios e os termos e condi&ccedil;&otilde;es de seu emprego previsto com {app_name}.</p>\r\n                    \r\n                    \r\n                    <p>{app_name} est&aacute; oferecendo um {job_type}. posi&ccedil;&atilde;o para voc&ecirc; como {job_title}, reportando-se ao gerente/supervisor imediato a partir de {start_date} em {workplace_location}. As horas de trabalho previstas s&atilde;o {days_of_week}.</p>\r\n                    \r\n                    \r\n                    <p>Nesta posi&ccedil;&atilde;o, {app_name} est&aacute; oferecendo para voc&ecirc; come&ccedil;ar com uma taxa de pagamento de {salary} por {salary_type}. Voc&ecirc; ser&aacute; pago em uma base de {salary_duration}.</p>\r\n                    \r\n                    \r\n                    <p>Como parte de sua remunera&ccedil;&atilde;o, tamb&eacute;m oferecida, se aplic&aacute;vel, voc&ecirc; descrever&aacute; seu b&ocirc;nus, participa&ccedil;&atilde;o nos lucros, estrutura de comiss&otilde;es, op&ccedil;&otilde;es de a&ccedil;&otilde;es e regras do comit&ecirc; de remunera&ccedil;&atilde;o aqui.</p>\r\n                    \r\n                    \r\n                    <p>Como funcion&aacute;rio de {app_name} , voc&ecirc; se qualificar&aacute; para benef&iacute;cios de nome breve, como seguro sa&uacute;de, plano de a&ccedil;&otilde;es, seguro odontol&oacute;gico etc.</p>\r\n                    \r\n                    \r\n                    <p>Indique sua concord&acirc;ncia com estes termos e aceite esta oferta assinando e datando este contrato em ou antes de {offer_expiration_date}.</p>\r\n                    \r\n                    \r\n                    <p>Sinceramente,</p>\r\n                    \r\n                    <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(13, 'ru', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Письмо с предложением</strong></span></p>\r\n                    \r\n                    \r\n                    <p>Уважаемый {applicant_name!</p>\r\n                    \r\n                    \r\n                    <p>{app_name} рад предложить вам присоединиться к нам в качестве {job_title}.</p>\r\n                    \r\n                    \r\n                    <p>Осталось всего несколько формальностей, чтобы приступить к работе. Пожалуйста, найдите время, чтобы ознакомиться с нашим официальным предложением. В нем содержится важная информация о вашем вознаграждении, льготах и ​​условиях вашего предполагаемого трудоустройства в {app_name}.</p>\r\n                    \r\n                    \r\n                    <p>{app_name} предлагает {job_type}. должность для вас как {job_title}, подчинение непосредственному руководителю/руководителю начиная с {start_date} в {workplace_location}. Ожидаемое рабочее время: {days_of_week}.</p>\r\n                    \r\n                    \r\n                    <p>На этой должности {app_name} предлагает вам начать работу со ставкой заработной платы {salary} за {salary_type}. Вам будут платить на основе {salary_duration}.</p>\r\n                    \r\n                    \r\n                    <p>В рамках вашего вознаграждения мы также предлагаем, если это применимо, вы описываете свой бонус, распределение прибыли, структуру комиссионных, опционы на акции и правила компенсационного комитета здесь.</p>\r\n                    \r\n                    \r\n                    <p>Как сотрудник {app_name}, вы будете иметь право на краткосрочные льготы, такие как медицинская страховка, план акций, стоматологическая страховка и т. д.</p>\r\n                    \r\n                    \r\n                    <p>Пожалуйста, подтвердите свое согласие с этими условиями и примите это предложение, подписав и датировав это соглашение не позднее {offer_expiration_date}.</p>\r\n                    \r\n                    \r\n                    <p>Искренне,</p>\r\n                    <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(14, 'tr', '<p style=\"text-align: center;\"><strong>Teklif mektubu</strong></p>\r\n                    \r\n                    <p>Canım {applicant_name},</p>\r\n                    \r\n                    <p>{app_name} olarak sizi gemiye getirmekten heyecan duyuyor {job_title}.</p>\r\n                    \r\n                    <p>İşe başlamaktan sadece birkaç formalite uzaktaydı. Lütfen resmi teklifimizi incelemek için zaman ayırın. Tazminatınız, sosyal yardımlarınız ve sizin için öngörülen istihdamınızın hüküm ve koşulları hakkında önemli ayrıntıları içerir. {app_name}.</p>\r\n                    \r\n                    <p>{app_name} teklif ediyor {job_type}. senin için pozisyon {job_title}, [acil yöneticiye/denetçiye] raporlama, şu tarihten itibaren {start_date} de{workplace_location}. Beklenen çalışma saatleri{days_of_week}.</p>\r\n                    \r\n                    <p>Bu pozisyonda, {app_name} size bir ödeme oranıyla başlamayı teklif ediyor {salary} başına {salary_type}. size bir ödeme yapılacak{salary_duration} temel.&nbsp;</p>\r\n                    \r\n                    <p>Tazminatınızın bir parçası olarak [varsa, ikramiyenizi, kâr paylaşımınızı, komisyon yapınızı, hisse senedi opsiyonlarınızı ve ücret komitesi kurallarınızı burada açıklayacaksınız].</p>\r\n                    \r\n                    <p>çalışanı olarak {app_name} , sağlık sigortası, stok planı, diş sigortası vb. gibi kısaca isim haklarına hak kazanacaksınız.</p>\r\n                    \r\n                    <p>Lütfen bu şartları kabul ettiğinizi belirtin ve bu sözleşmeyi tarihinde veya daha önce imzalayarak ve tarih atarak bu teklifi kabul edin {offer_expiration_date}.</p>\r\n                    \r\n                    <p>Samimi olarak,</p>\r\n                    <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(15, 'zh', '<p style=\"text-align: center;\"><strong>录取通知书</strong></p>\r\n                    \r\n                    <p>亲爱的 {applicant_name},</p>\r\n                    \r\n                    <p>{app_name} 很高兴邀请您加入 {job_title}.</p>\r\n                    \r\n                    <p>只需要办理一些手续就可以开始工作了。请花时间查看我们的正式报价。它包括有关您的薪酬、福利以及您预期就业的条款和条件的重要详细信息 {app_name}.</p>\r\n                    \r\n                    <p>{app_name} 正在提供 {job_type}. 为您定位为 {job_title}, 向[直接经理/主管]汇报工作开始 {start_date} 在{workplace_location}. 预计工作时间为{days_of_week}.</p>\r\n                    \r\n                    <p>在这个位置, {app_name} 提供给你的起始工资为 {salary} 每 {salary_type}. 您将获得报酬{salary_duration} 基础.&nbsp;</p>\r\n                    \r\n                    <p>作为薪酬的一部分，我们还提供[如果适用，您将在此处描述您的奖金、利润分享、佣金结构、股票期权和薪酬委员会规则].</p>\r\n                    \r\n                    <p>作为一名员工 {app_name} , 您将有资格获得简单的福利，例如健康保险、股票计划、牙科保险等.</p>\r\n                    \r\n                    <p>请在以下日期或之前签署本协议并注明日期，以表明您同意这些条款并接受本要约 {offer_expiration_date}.</p>\r\n                    \r\n                    <p>真挚地,</p>\r\n                    <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(16, 'he', '<p style=\"text-align: center;\"><strong>מכתב הצעה</strong></p>\r\n                    \r\n                    <p>יָקָר {applicant_name},</p>\r\n                    \r\n                    <p>{app_name} נרגש להעלות אותך לסיפון {job_title}.</p>\r\n                    \r\n                    <p>היו רק כמה הליכים פורמליים מלהגיע לעבודה. אנא הקדישו זמן לעיון בהצעה הרשמית שלנו. הוא כולל פרטים חשובים על התגמול שלך, ההטבות והתנאים וההגבלות של העסקה הצפויה שלך {app_name}.</p>\r\n                    \r\n                    <p>{app_name} מציעה א {job_type}. עמדה עבורך כ {job_title}, דיווח ל[מנהל/מפקח מיידי] החל מהיום {start_date} בְּ-{workplace_location}. שעות העבודה הצפויות הן{days_of_week}.</p>\r\n                    \r\n                    <p>בתפקיד הזה, {app_name} מציעה להתחיל אותך בשיעור שכר של {salary} לְכָל {salary_type}. תשולם לך על א{salary_duration} בָּסִיס.&nbsp;</p>\r\n                    \r\n                    <p>כחלק מהתגמול שלך, הוצעו גם [אם רלוונטי, תתאר את הבונוס שלך, חלוקת הרווחים, מבנה העמלות, אופציות למניות וכללי ועדת התגמול שלך כאן].</p>\r\n                    \r\n                    <p>בתור עובד של {app_name} , אתה תהיה זכאי להטבות עם שם קצר, כגון ביטוח בריאות, תוכנית מניות, ביטוח שיניים וכו.</p>\r\n                    \r\n                    <p>אנא ציין את הסכמתך לתנאים אלה וקבל הצעה זו על ידי חתימה ותיארוך על הסכם זה או לפני כן {offer_expiration_date}.</p>\r\n                    \r\n                    <p>בכנות,</p>\r\n                    <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(17, 'pt-br', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>Carta de oferta</strong></span></p>\r\n                    \r\n                    <p>Prezado {applicant_name},</p>\r\n                    \r\n                    <p>{app_name} tem o prazer de trazer voc&ecirc; a bordo como {job_title}.</p>\r\n                    \r\n                    <p>Faltavam apenas algumas formalidades para come&ccedil;ar a trabalhar. Por favor, reserve um tempo para revisar nossa oferta formal. Ele inclui detalhes importantes sobre sua remunera&ccedil;&atilde;o, benef&iacute;cios e os termos e condi&ccedil;&otilde;es de seu emprego previsto com {app_name}.</p>\r\n                    \r\n                    <p>{app_name} est&aacute; oferecendo um {job_type}. posi&ccedil;&atilde;o para voc&ecirc; como {job_title}, reportando-se ao gerente/supervisor imediato a partir de {start_date} em {workplace_location}. As horas de trabalho previstas s&atilde;o {days_of_week}.</p>\r\n                    \r\n                    <p>Nesta posi&ccedil;&atilde;o, {app_name} est&aacute; oferecendo para voc&ecirc; come&ccedil;ar com uma taxa de pagamento de {salary} por {salary_type}. Voc&ecirc; ser&aacute; pago em uma base de {salary_duration}.</p>\r\n                    \r\n                    <p>Como parte de sua remunera&ccedil;&atilde;o, tamb&eacute;m oferecida, se aplic&aacute;vel, voc&ecirc; descrever&aacute; seu b&ocirc;nus, participa&ccedil;&atilde;o nos lucros, estrutura de comiss&otilde;es, op&ccedil;&otilde;es de a&ccedil;&otilde;es e regras do comit&ecirc; de remunera&ccedil;&atilde;o aqui.</p>\r\n                    \r\n                    <p>Como funcion&aacute;rio de {app_name} , voc&ecirc; se qualificar&aacute; para benef&iacute;cios de nome breve, como seguro sa&uacute;de, plano de a&ccedil;&otilde;es, seguro odontol&oacute;gico etc.</p>\r\n                    \r\n                    <p>Indique sua concord&acirc;ncia com estes termos e aceite esta oferta assinando e datando este contrato em ou antes de {offer_expiration_date}.</p>\r\n                    \r\n                    <p>Sinceramente,</p>\r\n                    \r\n                    <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15');

-- --------------------------------------------------------

--
-- Table structure for table `genrate_payslip_options`
--

CREATE TABLE `genrate_payslip_options` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goal_trackings`
--

CREATE TABLE `goal_trackings` (
  `id` bigint UNSIGNED NOT NULL,
  `branch` int NOT NULL,
  `goal_type` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_achievement` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '0',
  `progress` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goal_types`
--

CREATE TABLE `goal_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `occasion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income_types`
--

CREATE TABLE `income_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indicators`
--

CREATE TABLE `indicators` (
  `id` bigint UNSIGNED NOT NULL,
  `branch` int NOT NULL DEFAULT '0',
  `department` int NOT NULL DEFAULT '0',
  `designation` int NOT NULL DEFAULT '0',
  `rating` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_experience` int NOT NULL DEFAULT '0',
  `marketing` int NOT NULL DEFAULT '0',
  `administration` int NOT NULL DEFAULT '0',
  `professionalism` int NOT NULL DEFAULT '0',
  `integrity` int NOT NULL DEFAULT '0',
  `attendance` int NOT NULL DEFAULT '0',
  `created_user` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interview_schedules`
--

CREATE TABLE `interview_schedules` (
  `id` bigint UNSIGNED NOT NULL,
  `candidate` int NOT NULL,
  `employee` int NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `time` time NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `employee_response` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ip_restricts`
--

CREATE TABLE `ip_restricts` (
  `id` bigint UNSIGNED NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `requirement` text COLLATE utf8mb4_unicode_ci,
  `branch` int NOT NULL DEFAULT '0',
  `category` int NOT NULL DEFAULT '0',
  `skill` text COLLATE utf8mb4_unicode_ci,
  `position` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applicant` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_question` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` bigint UNSIGNED NOT NULL,
  `job` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resume` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_letter` text COLLATE utf8mb4_unicode_ci,
  `dob` date DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stage` int NOT NULL DEFAULT '1',
  `order` int NOT NULL DEFAULT '0',
  `skill` text COLLATE utf8mb4_unicode_ci,
  `rating` int NOT NULL DEFAULT '0',
  `is_archive` int NOT NULL DEFAULT '0',
  `custom_question` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_application_notes`
--

CREATE TABLE `job_application_notes` (
  `id` bigint UNSIGNED NOT NULL,
  `application_id` int NOT NULL DEFAULT '0',
  `note_created` int NOT NULL DEFAULT '0',
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_categories`
--

CREATE TABLE `job_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_on_boards`
--

CREATE TABLE `job_on_boards` (
  `id` bigint UNSIGNED NOT NULL,
  `application` int NOT NULL,
  `joining_date` date DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `days_of_week` int DEFAULT NULL,
  `salary` double(15,2) DEFAULT NULL,
  `salary_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary_duration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `convert_to_employee` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_stages`
--

CREATE TABLE `job_stages` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_stages`
--

INSERT INTO `job_stages` (`id`, `title`, `order`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Applied', 0, 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(2, 'Phone Screen', 0, 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(3, 'Interview', 0, 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(4, 'Hired', 0, 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(5, 'Rejected', 0, 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15');

-- --------------------------------------------------------

--
-- Table structure for table `joining_letters`
--

CREATE TABLE `joining_letters` (
  `id` bigint UNSIGNED NOT NULL,
  `lang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `joining_letters`
--

INSERT INTO `joining_letters` (`id`, `lang`, `content`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'ar', '<h2 style=\"text-align: center;\"><strong>خطاب الانضمام</strong></h2>\r\n            <p>{date}</p>\r\n            <p>{employee_name}</p>\r\n            <p>{address}</p>\r\n            <p>الموضوع: موعد لوظيفة {designation}</p>\r\n            <p>عزيزي {employee_name} ،</p>\r\n            <p>يسعدنا أن نقدم لك منصب {designation} مع {app_name} \"الشركة\" وفقًا للشروط التالية و</p>\r\n            <p>الظروف:</p>\r\n            <p>1. بدء العمل</p>\r\n            <p>سيصبح عملك ساريًا اعتبارًا من {start_date}</p>\r\n            <p>2. المسمى الوظيفي</p>\r\n            <p>سيكون المسمى الوظيفي الخاص بك هو {designation}.</p>\r\n            <p>3. الراتب</p>\r\n            <p>سيكون راتبك والمزايا الأخرى على النحو المبين في الجدول 1 ، طيه.</p>\r\n            <p>4. مكان الإرسال</p>\r\n            <p>سيتم إرسالك إلى {branch}. ومع ذلك ، قد يُطلب منك العمل في أي مكان عمل تمتلكه الشركة ، أو</p>\r\n            <p>قد تحصل لاحقًا.</p>\r\n            <p>5. ساعات العمل</p>\r\n            <p>أيام العمل العادية هي من الاثنين إلى الجمعة. سيُطلب منك العمل لساعات حسب الضرورة لـ</p>\r\n            <p>أداء واجباتك على النحو الصحيح تجاه الشركة. ساعات العمل العادية من {start_time} إلى {end_time} وأنت</p>\r\n            <p>من المتوقع أن يعمل ما لا يقل عن {total_hours} ساعة كل أسبوع ، وإذا لزم الأمر لساعات إضافية اعتمادًا على</p>\r\n            <p>المسؤوليات.</p>\r\n            <p>6. الإجازة / العطل</p>\r\n            <p>6.1 يحق لك الحصول على إجازة غير رسمية مدتها 12 يومًا.</p>\r\n            <p>6.2 يحق لك الحصول على إجازة مرضية مدفوعة الأجر لمدة 12 يوم عمل.</p>\r\n            <p>6.3 تخطر الشركة بقائمة الإجازات المعلنة في بداية كل عام.</p>\r\n            <p>7. طبيعة الواجبات</p>\r\n            <p>ستقوم بأداء أفضل ما لديك من واجبات متأصلة في منصبك ومهام إضافية مثل الشركة</p>\r\n            <p>قد يدعوك لأداء ، من وقت لآخر. واجباتك المحددة منصوص عليها في الجدول الثاني بهذه الرسالة.</p>\r\n            <p>8. ممتلكات الشركة</p>\r\n            <p>ستحافظ دائمًا على ممتلكات الشركة في حالة جيدة ، والتي قد يتم تكليفك بها للاستخدام الرسمي خلال فترة عملها</p>\r\n            <p>عملك ، ويجب أن تعيد جميع هذه الممتلكات إلى الشركة قبل التخلي عن الرسوم الخاصة بك ، وإلا فإن التكلفة</p>\r\n            <p>نفس الشيء سوف تسترده منك الشركة.</p>\r\n            <p>9. الاقتراض / قبول الهدايا</p>\r\n            <p>لن تقترض أو تقبل أي أموال أو هدية أو مكافأة أو تعويض مقابل مكاسبك الشخصية من أو تضع نفسك بأي طريقة أخرى</p>\r\n            <p>بموجب التزام مالي تجاه أي شخص / عميل قد تكون لديك تعاملات رسمية معه.</p>\r\n            <p>10. الإنهاء</p>\r\n            <p>10.1 يمكن للشركة إنهاء موعدك ، دون أي سبب ، من خلال إعطائك ما لا يقل عن [إشعار] قبل أشهر</p>\r\n            <p>إشعار خطي أو راتب بدلاً منه. لغرض هذا البند ، يقصد بالراتب المرتب الأساسي.</p>\r\n            <p>10.2 إنهاء عملك مع الشركة ، دون أي سبب ، من خلال تقديم ما لا يقل عن إشعار الموظف</p>\r\n            <p>أشهر الإخطار أو الراتب عن الفترة غير المحفوظة ، المتبقية بعد تعديل الإجازات المعلقة ، كما في التاريخ.</p>\r\n            <p>10.3 تحتفظ الشركة بالحق في إنهاء عملك بإيجاز دون أي فترة إشعار أو مدفوعات إنهاء</p>\r\n            <p>إذا كان لديه سبب معقول للاعتقاد بأنك مذنب بسوء السلوك أو الإهمال ، أو ارتكبت أي خرق جوهري لـ</p>\r\n            <p>العقد ، أو تسبب في أي خسارة للشركة.</p>\r\n            <p>10. 4 عند إنهاء عملك لأي سبب من الأسباب ، ستعيد إلى الشركة جميع ممتلكاتك ؛ المستندات و</p>\r\n            <p>الأوراق الأصلية ونسخها ، بما في ذلك أي عينات ، وأدبيات ، وعقود ، وسجلات ، وقوائم ، ورسومات ، ومخططات ،</p>\r\n            <p>الرسائل والملاحظات والبيانات وما شابه ذلك ؛ والمعلومات السرية التي بحوزتك أو تحت سيطرتك والمتعلقة بك</p>\r\n            <p>التوظيف أو الشؤون التجارية للعملاء.</p>\r\n            <p>11. المعلومات السرية</p>\r\n            <p>11. 1 أثناء عملك في الشركة ، سوف تكرس وقتك واهتمامك ومهارتك كلها بأفضل ما لديك من قدرات</p>\r\n            <p>عملها. لا يجوز لك ، بشكل مباشر أو غير مباشر ، الانخراط أو الارتباط بنفسك ، أو الارتباط به ، أو القلق ، أو التوظيف ، أو</p>\r\n            <p>الوقت أو متابعة أي دورة دراسية على الإطلاق ، دون الحصول على إذن مسبق من الشركة أو الانخراط في أي عمل آخر أو</p>\r\n            <p>الأنشطة أو أي وظيفة أخرى أو العمل بدوام جزئي أو متابعة أي دورة دراسية على الإطلاق ، دون إذن مسبق من</p>\r\n            <p>شركة.</p>\r\n            <p>11. المعلومات السرية</p>\r\n            <p>11. 1 أثناء عملك في الشركة ، سوف تكرس وقتك واهتمامك ومهارتك كلها بأفضل ما لديك من قدرات</p>\r\n            <p>عملها. لا يجوز لك ، بشكل مباشر أو غير مباشر ، الانخراط أو الارتباط بنفسك ، أو الارتباط به ، أو القلق ، أو التوظيف ، أو</p>\r\n            <p>الوقت أو متابعة أي دورة دراسية على الإطلاق ، دون الحصول على إذن مسبق من الشركة أو الانخراط في أي عمل آخر أو</p>\r\n            <p>الأنشطة أو أي وظيفة أخرى أو العمل بدوام جزئي أو متابعة أي دورة دراسية على الإطلاق ، دون إذن مسبق من</p>\r\n            <p>شركة.</p>\r\n            <p>11.2 يجب عليك دائمًا الحفاظ على أعلى درجة من السرية والحفاظ على سرية السجلات والوثائق وغيرها</p>\r\n            <p>المعلومات السرية المتعلقة بأعمال الشركة والتي قد تكون معروفة لك أو مخولة لك بأي وسيلة</p>\r\n            <p>ولن تستخدم هذه السجلات والمستندات والمعلومات إلا بالطريقة المصرح بها حسب الأصول لصالح الشركة. إلى عن على</p>\r\n            <p>أغراض هذا البند \"المعلومات السرية\" تعني المعلومات المتعلقة بأعمال الشركة وعملائها</p>\r\n            <p>التي لا تتوفر لعامة الناس والتي قد تتعلمها أثناء عملك. هذا يشمل،</p>\r\n            <p>على سبيل المثال لا الحصر ، المعلومات المتعلقة بالمنظمة وقوائم العملاء وسياسات التوظيف والموظفين والمعلومات</p>\r\n            <p>حول منتجات الشركة وعملياتها بما في ذلك الأفكار والمفاهيم والإسقاطات والتكنولوجيا والكتيبات والرسم والتصاميم ،</p>\r\n            <p>المواصفات وجميع الأوراق والسير الذاتية والسجلات والمستندات الأخرى التي تحتوي على هذه المعلومات السرية.</p>\r\n            <p>11.3 لن تقوم في أي وقت بإزالة أي معلومات سرية من المكتب دون إذن.</p>\r\n            \r\n            <p>11.4 واجبك في الحماية وعدم الإفشاء</p>\r\n            \r\n            <p>تظل المعلومات السرية سارية بعد انتهاء أو إنهاء هذه الاتفاقية و / أو عملك مع الشركة.</p>\r\n            \r\n            <p>11.5 سوف يجعلك خرق شروط هذا البند عرضة للفصل بإجراءات موجزة بموجب الفقرة أعلاه بالإضافة إلى أي</p>\r\n            \r\n            <p>أي تعويض آخر قد يكون للشركة ضدك في القانون.</p>\r\n            \r\n            <p>12. الإخطارات</p>\r\n            \r\n            <p>يجوز لك إرسال إخطارات إلى الشركة على عنوان مكتبها المسجل. يمكن أن ترسل لك الشركة إشعارات على</p>\r\n            \r\n            <p>العنوان الذي أشرت إليه في السجلات الرسمية.</p>\r\n            \r\n            \r\n            \r\n            <p>13. تطبيق سياسة الشركة</p>\r\n            \r\n            <p>يحق للشركة تقديم إعلانات السياسة من وقت لآخر فيما يتعلق بمسائل مثل استحقاق الإجازة والأمومة</p>\r\n            \r\n            <p>الإجازة ، ومزايا الموظفين ، وساعات العمل ، وسياسات النقل ، وما إلى ذلك ، ويمكن تغييرها من وقت لآخر وفقًا لتقديرها الخاص.</p>\r\n            \r\n            <p>جميع قرارات سياسة الشركة هذه ملزمة لك ويجب أن تلغي هذه الاتفاقية إلى هذا الحد.</p>\r\n            \r\n            \r\n            \r\n            <p>14. القانون الحاكم / الاختصاص القضائي</p>\r\n            \r\n            <p>يخضع عملك في الشركة لقوانين الدولة. تخضع جميع النزاعات للاختصاص القضائي للمحكمة العليا</p>\r\n            \r\n            <p>غوجارات فقط.</p>\r\n            \r\n            \r\n            \r\n            <p>15. قبول عرضنا</p>\r\n            \r\n            <p>يرجى تأكيد قبولك لعقد العمل هذا من خلال التوقيع وإعادة النسخة المكررة.</p>\r\n            \r\n            \r\n            \r\n            <p>نرحب بكم ونتطلع إلى تلقي موافقتكم والعمل معكم.</p>\r\n            \r\n            \r\n            \r\n            <p>تفضلوا بقبول فائق الاحترام،</p>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>{date}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(2, 'da', '<h3 style=\"text-align: center;\"><strong>Tilslutningsbrev</strong></h3>\r\n            \r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{address}</p>\r\n            \r\n            <p>Emne: Udn&aelig;vnelse til stillingen som {designation}</p>\r\n            \r\n            \r\n            \r\n            \r\n            \r\n            \r\n            \r\n            <p>K&aelig;re {employee_name}</p>\r\n            \r\n            \r\n            \r\n            <p>Vi er glade for at kunne tilbyde dig stillingen som {designation} hos {app_name} \"Virksomheden\" p&aring; f&oslash;lgende vilk&aring;r og</p>\r\n            \r\n            <p>betingelser:</p>\r\n            \r\n            \r\n            <p>1. P&aring;begyndelse af ans&aelig;ttelse</p>\r\n            \r\n            <p>Din ans&aelig;ttelse tr&aelig;der i kraft fra {start_date}</p>\r\n            \r\n            \r\n            \r\n            <p>2. Jobtitel</p>\r\n            \r\n            \r\n            <p>Din jobtitel vil v&aelig;re {designation}.</p>\r\n            \r\n            \r\n            \r\n            <p>3. L&oslash;n</p>\r\n            \r\n            <p>Din l&oslash;n og andre goder vil v&aelig;re som angivet i skema 1, hertil.</p>\r\n            \r\n            \r\n            \r\n            <p>4. Udstationeringssted</p>\r\n            \r\n            <p>Du vil blive sl&aring;et op p&aring; {branch}. Du kan dog blive bedt om at arbejde p&aring; ethvert forretningssted, som virksomheden har, eller</p>\r\n            \r\n            <p>senere kan erhverve.</p>\r\n            \r\n            \r\n            <p>5. Arbejdstimer</p>\r\n            \r\n            <p>De normale arbejdsdage er mandag til fredag. Du vil blive forpligtet til at arbejde i de timer, som er n&oslash;dvendige for</p>\r\n            \r\n            <p>beh&oslash;rig varetagelse af dine pligter over for virksomheden. Den normale arbejdstid er fra {start_time} til {end_time}, og det er du</p>\r\n            \r\n            <p>forventes at arbejde ikke mindre end {total_hours} timer hver uge, og om n&oslash;dvendigt yderligere timer afh&aelig;ngigt af din</p>\r\n            \r\n            <p>ansvar.</p>\r\n            \r\n            \r\n            \r\n            <p>6. Orlov/Ferie</p>\r\n            \r\n            <p>6.1 Du har ret til tilf&aelig;ldig ferie p&aring; 12 dage.</p>\r\n            \r\n            <p>6.2 Du har ret til 12 arbejdsdages sygefrav&aelig;r med l&oslash;n.</p>\r\n            \r\n            <p>6.3 Virksomheden skal meddele en liste over erkl&aelig;rede helligdage i begyndelsen af ​​hvert &aring;r.</p>\r\n            \r\n            \r\n            \r\n            <p>7. Arbejdsopgavernes art</p>\r\n            \r\n            <p>Du vil efter bedste evne udf&oslash;re alle de opgaver, der er iboende i din stilling og s&aring;danne yderligere opgaver som virksomheden</p>\r\n            \r\n            <p>kan opfordre dig til at optr&aelig;de, fra tid til anden. Dine specifikke pligter er beskrevet i skema II hertil.</p>\r\n            \r\n            \r\n            <p>8. Firmaejendom</p>\r\n            \r\n            <p>Du vil altid vedligeholde virksomhedens ejendom i god stand, som kan blive overdraget til dig til officiel brug i l&oslash;bet af</p>\r\n            \r\n            <p>din ans&aelig;ttelse, og skal returnere al s&aring;dan ejendom til virksomheden, f&oslash;r du opgiver din afgift, i modsat fald vil omkostningerne</p>\r\n            \r\n            <p>af samme vil blive inddrevet fra dig af virksomheden.</p>\r\n            \r\n            \r\n            \r\n            <p>9. L&aring;n/modtagelse af gaver</p>\r\n            \r\n            <p>Du vil ikke l&aring;ne eller acceptere nogen penge, gave, bel&oslash;nning eller kompensation for dine personlige gevinster fra eller p&aring; anden m&aring;de placere dig selv</p>\r\n            \r\n            <p>under en &oslash;konomisk forpligtelse over for enhver person/kunde, som du m&aring;tte have officielle forbindelser med.</p>\r\n            \r\n            <p>10. Opsigelse</p>\r\n            \r\n            <p>10.1 Din ans&aelig;ttelse kan opsiges af virksomheden uden nogen grund ved at give dig mindst [varsel] m&aring;neder f&oslash;r</p>\r\n            \r\n            <p>skriftligt varsel eller l&oslash;n i stedet herfor. Ved l&oslash;n forst&aring;s i denne paragraf grundl&oslash;n.</p>\r\n            \r\n            <p>10.2 Du kan opsige dit ans&aelig;ttelsesforhold i virksomheden uden nogen grund ved at give mindst [Medarbejdermeddelelse]</p>\r\n            \r\n            <p>m&aring;neders forudg&aring;ende varsel eller l&oslash;n for den ikke-opsparede periode, tilbage efter regulering af afventende orlov, som p&aring; dato.</p>\r\n            \r\n            <p>10.3 Virksomheden forbeholder sig retten til at opsige dit ans&aelig;ttelsesforhold midlertidigt uden opsigelsesfrist eller opsigelsesbetaling</p>\r\n            \r\n            <p>hvis den har rimelig grund til at tro, at du er skyldig i forseelse eller uagtsomhed, eller har beg&aring;et et grundl&aelig;ggende brud p&aring;</p>\r\n            \r\n            <p>kontrakt, eller for&aring;rsaget tab for virksomheden.</p>\r\n            \r\n            <p>10. 4 Ved oph&oslash;r af din ans&aelig;ttelse uanset &aring;rsag, vil du returnere al ejendom til virksomheden; dokumenter, og</p>\r\n            \r\n            <p>papir, b&aring;de originale og kopier heraf, inklusive pr&oslash;ver, litteratur, kontrakter, optegnelser, lister, tegninger, tegninger,</p>\r\n            \r\n            <p>breve, notater, data og lignende; og fortrolige oplysninger, i din besiddelse eller under din kontrol vedr&oslash;rende din</p>\r\n            \r\n            <p>ans&aelig;ttelse eller til kunders forretningsforhold.</p>\r\n            <p>11. Fortrolige oplysninger</p>\r\n            \r\n            <p>11. 1 Under din ans&aelig;ttelse i virksomheden vil du bruge al din tid, opm&aelig;rksomhed og dygtighed efter bedste evne til</p>\r\n            \r\n            <p>sin virksomhed. Du m&aring; ikke, direkte eller indirekte, engagere eller associere dig med, v&aelig;re forbundet med, bekymret, ansat eller</p>\r\n            \r\n            <p>tid eller forf&oslash;lge et hvilket som helst studieforl&oslash;b uden forudg&aring;ende tilladelse fra virksomheden. involveret i anden virksomhed eller</p>\r\n            \r\n            <p>aktiviteter eller enhver anden stilling eller arbejde p&aring; deltid eller forf&oslash;lge ethvert studieforl&oslash;b uden forudg&aring;ende tilladelse fra</p>\r\n            \r\n            <p>Selskab.</p>\r\n            <p>11.2 Du skal altid opretholde den h&oslash;jeste grad af fortrolighed og opbevare optegnelser, dokumenter og andre fortrolige oplysninger.</p>\r\n            \r\n            <p>Fortrolige oplysninger vedr&oslash;rende virksomhedens virksomhed, som kan v&aelig;re kendt af dig eller betroet dig p&aring; nogen m&aring;de</p>\r\n            \r\n            <p>og du vil kun bruge s&aring;danne optegnelser, dokumenter og oplysninger p&aring; en beh&oslash;rigt autoriseret m&aring;de i virksomhedens interesse. Til</p>\r\n            \r\n            <p>form&aring;lene med denne paragraf \"Fortrolige oplysninger\" betyder oplysninger om virksomhedens og dets kunders forretning</p>\r\n            \r\n            <p>som ikke er tilg&aelig;ngelig for offentligheden, og som du kan l&aelig;re i l&oslash;bet af din ans&aelig;ttelse. Dette inkluderer,</p>\r\n            \r\n            <p>men er ikke begr&aelig;nset til information vedr&oslash;rende organisationen, dens kundelister, ans&aelig;ttelsespolitikker, personale og information</p>\r\n            \r\n            <p>om virksomhedens produkter, processer, herunder ideer, koncepter, projektioner, teknologi, manualer, tegning, design,</p>\r\n            \r\n            <p>specifikationer og alle papirer, CVer, optegnelser og andre dokumenter, der indeholder s&aring;danne fortrolige oplysninger.</p>\r\n            \r\n            <p>11.3 Du vil p&aring; intet tidspunkt fjerne fortrolige oplysninger fra kontoret uden tilladelse.</p>\r\n            \r\n            <p>11.4 Din pligt til at beskytte og ikke oplyse</p>\r\n            \r\n            <p>e Fortrolige oplysninger vil overleve udl&oslash;bet eller opsigelsen af ​​denne aftale og/eller din ans&aelig;ttelse hos virksomheden.</p>\r\n            \r\n            <p>11.5 Overtr&aelig;delse af betingelserne i denne klausul vil g&oslash;re dig ansvarlig for midlertidig afskedigelse i henhold til klausulen ovenfor ud over evt.</p>\r\n            \r\n            <p>andre retsmidler, som virksomheden m&aring;tte have mod dig i henhold til loven.</p>\r\n            <p>12. Meddelelser</p>\r\n            \r\n            <p>Meddelelser kan gives af dig til virksomheden p&aring; dets registrerede kontoradresse. Meddelelser kan gives af virksomheden til dig p&aring;</p>\r\n            \r\n            <p>den adresse, du har angivet i de officielle optegnelser.</p>\r\n            \r\n            \r\n            \r\n            <p>13. Anvendelse af virksomhedens politik</p>\r\n            \r\n            <p>Virksomheden er berettiget til fra tid til anden at afgive politiske erkl&aelig;ringer vedr&oslash;rende sager som ret til orlov, barsel</p>\r\n            \r\n            <p>orlov, ansattes ydelser, arbejdstider, overf&oslash;rselspolitikker osv., og kan &aelig;ndre det samme fra tid til anden efter eget sk&oslash;n.</p>\r\n            \r\n            <p>Alle s&aring;danne politiske beslutninger fra virksomheden er bindende for dig og tilsides&aelig;tter denne aftale i det omfang.</p>\r\n            \r\n            \r\n            \r\n            <p>14. G&aelig;ldende lov/Jurisdiktion</p>\r\n            \r\n            <p>Din ans&aelig;ttelse hos virksomheden er underlagt landets love. Alle tvister er underlagt High Courts jurisdiktion</p>\r\n            \r\n            <p>Kun Gujarat.</p>\r\n            \r\n            \r\n            \r\n            <p>15. Accept af vores tilbud</p>\r\n            \r\n            <p>Bekr&aelig;ft venligst din accept af denne ans&aelig;ttelseskontrakt ved at underskrive og returnere kopien.</p>\r\n            \r\n            \r\n            \r\n            <p>Vi byder dig velkommen og ser frem til at modtage din accept og til at arbejde sammen med dig.</p>\r\n            \r\n            \r\n            \r\n            <p>Venlig hilsen,</p>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>{date}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(3, 'de', '<h3 style=\"text-align: center;\"><strong>Beitrittsbrief</strong></h3>\r\n            \r\n            <p>{date}</p>\r\n            <p>{employee_name}</p>\r\n            <p>{address}</p>\r\n            \r\n            \r\n            \r\n            <p>Betreff: Ernennung f&uuml;r die Stelle von {designation}</p>\r\n            \r\n            \r\n            \r\n            \r\n            \r\n            \r\n            \r\n            <p>Sehr geehrter {employee_name},</p>\r\n            \r\n            \r\n            \r\n            <p>Wir freuen uns, Ihnen die Position von {designation} bei {app_name} dem &bdquo;Unternehmen&ldquo; zu den folgenden Bedingungen anbieten zu k&ouml;nnen</p>\r\n            \r\n            <p>Bedingungen:</p>\r\n            \r\n            \r\n            <p>1. Aufnahme des Arbeitsverh&auml;ltnisses</p>\r\n            \r\n            <p>Ihre Anstellung gilt ab dem {start_date}</p>\r\n            \r\n            \r\n            <p>2. Berufsbezeichnung</p>\r\n            \r\n            <p>Ihre Berufsbezeichnung lautet {designation}.</p>\r\n            \r\n            \r\n            <p>3. Gehalt</p>\r\n            \r\n            <p>Ihr Gehalt und andere Leistungen sind in Anhang 1 zu diesem Dokument aufgef&uuml;hrt.</p>\r\n            \r\n            \r\n            <p>4. Postort</p>\r\n            \r\n            <p>Sie werden bei {branch} eingestellt. Es kann jedoch erforderlich sein, dass Sie an jedem Gesch&auml;ftssitz arbeiten, den das Unternehmen hat, oder</p>\r\n            \r\n            <p>sp&auml;ter erwerben kann.</p>\r\n            \r\n            \r\n            <p>5. Arbeitszeit</p>\r\n            <p>Die normalen Arbeitstage sind Montag bis Freitag. Sie m&uuml;ssen so viele Stunden arbeiten, wie es f&uuml;r die erforderlich ist</p>\r\n            <p>ordnungsgem&auml;&szlig;e Erf&uuml;llung Ihrer Pflichten gegen&uuml;ber dem Unternehmen. Die normalen Arbeitszeiten sind von {start_time} bis {end_time} und Sie sind es</p>\r\n            <p>voraussichtlich nicht weniger als {total_hours} Stunden pro Woche arbeiten, und falls erforderlich, abh&auml;ngig von Ihren zus&auml;tzlichen Stunden</p>\r\n            <p>Verantwortlichkeiten.</p>\r\n            \r\n            \r\n            \r\n            <p>6. Urlaub/Urlaub</p>\r\n            \r\n            <p>6.1 Sie haben Anspruch auf Freizeiturlaub von 12 Tagen.</p>\r\n            \r\n            <p>6.2 Sie haben Anspruch auf 12 Arbeitstage bezahlten Krankenurlaub.</p>\r\n            \r\n            <p>6.3 Das Unternehmen teilt zu Beginn jedes Jahres eine Liste der erkl&auml;rten Feiertage mit.</p>\r\n            \r\n            \r\n            \r\n            <p>7. Art der Pflichten</p>\r\n            \r\n            <p>Sie werden alle Aufgaben, die mit Ihrer Funktion verbunden sind, sowie alle zus&auml;tzlichen Aufgaben als Unternehmen nach besten Kr&auml;ften erf&uuml;llen</p>\r\n            \r\n            <p>kann Sie von Zeit zu Zeit zur Leistung auffordern. Ihre spezifischen Pflichten sind in Anhang II zu diesem Dokument aufgef&uuml;hrt.</p>\r\n            \r\n            \r\n            \r\n            <p>8. Firmeneigentum</p>\r\n            \r\n            <p>Sie werden das Firmeneigentum, das Ihnen im Laufe der Zeit f&uuml;r offizielle Zwecke anvertraut werden kann, stets in gutem Zustand halten</p>\r\n            \r\n            <p>Ihrer Anstellung und muss all dieses Eigentum an das Unternehmen zur&uuml;ckgeben, bevor Sie Ihre Geb&uuml;hr aufgeben, andernfalls die Kosten</p>\r\n            \r\n            <p>derselben werden von der Gesellschaft von Ihnen zur&uuml;ckgefordert.</p>\r\n            \r\n            \r\n            \r\n            <p>9. Leihen/Annehmen von Geschenken</p>\r\n            \r\n            <p>Sie werden kein Geld, Geschenk, keine Belohnung oder Entsch&auml;digung f&uuml;r Ihre pers&ouml;nlichen Gewinne von sich leihen oder annehmen oder sich anderweitig platzieren</p>\r\n            \r\n            <p>unter finanzieller Verpflichtung gegen&uuml;ber Personen/Kunden, mit denen Sie m&ouml;glicherweise dienstliche Beziehungen unterhalten.</p>\r\n            \r\n            <p>10. K&uuml;ndigung</p>\r\n            \r\n            <p>10.1 Ihre Ernennung kann vom Unternehmen ohne Angabe von Gr&uuml;nden gek&uuml;ndigt werden, indem es Ihnen mindestens [K&uuml;ndigung] Monate im Voraus mitteilt</p>\r\n            \r\n            <p>schriftliche K&uuml;ndigung oder Gehalt statt dessen. Gehalt im Sinne dieser Klausel bedeutet Grundgehalt.</p>\r\n            \r\n            <p>10.2 Sie k&ouml;nnen Ihre Anstellung beim Unternehmen ohne Angabe von Gr&uuml;nden k&uuml;ndigen, indem Sie mindestens [Mitarbeitermitteilung]</p>\r\n            \r\n            <p>K&uuml;ndigungsfrist von Monaten oder Gehalt f&uuml;r den nicht angesparten Zeitraum, der nach Anpassung der anstehenden Urlaubstage &uuml;brig bleibt, zum Stichtag.</p>\r\n            \r\n            <p>10.3 Das Unternehmen beh&auml;lt sich das Recht vor, Ihr Arbeitsverh&auml;ltnis ohne K&uuml;ndigungsfrist oder Abfindungszahlung fristlos zu k&uuml;ndigen</p>\r\n            \r\n            <p>wenn es begr&uuml;ndeten Anlass zu der Annahme gibt, dass Sie sich eines Fehlverhaltens oder einer Fahrl&auml;ssigkeit schuldig gemacht haben oder einen wesentlichen Versto&szlig; begangen haben</p>\r\n            \r\n            <p>oder dem Unternehmen Verluste verursacht haben.</p>\r\n            \r\n            <p>10. 4 Bei Beendigung Ihres Besch&auml;ftigungsverh&auml;ltnisses, aus welchem ​​Grund auch immer, werden Sie s&auml;mtliches Eigentum an das Unternehmen zur&uuml;ckgeben; Dokumente und</p>\r\n            \r\n            <p>Papier, sowohl Original als auch Kopien davon, einschlie&szlig;lich aller Muster, Literatur, Vertr&auml;ge, Aufzeichnungen, Listen, Zeichnungen, Blaupausen,</p>\r\n            \r\n            <p>Briefe, Notizen, Daten und dergleichen; und vertrauliche Informationen, die sich in Ihrem Besitz oder unter Ihrer Kontrolle befinden und sich auf Sie beziehen</p>\r\n            \r\n            <p>Besch&auml;ftigung oder f&uuml;r die gesch&auml;ftlichen Angelegenheiten der Kunden.</p>\r\n            \r\n            <p>11. Confidential Information</p>\r\n            \r\n            <p>11. 1 During your employment with the Company you will devote your whole time, attention, and skill to the best of your ability for</p>\r\n            \r\n            <p>its business. You shall not, directly or indirectly, engage or associate yourself with, be connected with, concerned, employed, or</p>\r\n            \r\n            <p>time or pursue any course of study whatsoever, without the prior permission of the Company.engaged in any other business or</p>\r\n            \r\n            <p>activities or any other post or work part-time or pursue any course of study whatsoever, without the prior permission of the</p>\r\n            \r\n            <p>Company.</p>\r\n            \r\n            <p>11.2 You must always maintain the highest degree of confidentiality and keep as confidential the records, documents, and other&nbsp;</p>\r\n            \r\n            <p>Confidential Information relating to the business of the Company which may be known to you or confided in you by any means</p>\r\n            \r\n            <p>and you will use such records, documents and information only in a duly authorized manner in the interest of the Company. For</p>\r\n            \r\n            <p>the purposes of this clause &lsquo;Confidential Information&rsquo; means information about the Company&rsquo;s business and that of its customers</p>\r\n            \r\n            <p>which is not available to the general public and which may be learned by you in the course of your employment. This includes,</p>\r\n            \r\n            <p>but is not limited to, information relating to the organization, its customer lists, employment policies, personnel, and information</p>\r\n            \r\n            <p>about the Company&rsquo;s products, processes including ideas, concepts, projections, technology, manuals, drawing, designs,&nbsp;</p>\r\n            \r\n            <p>specifications, and all papers, resumes, records and other documents containing such Confidential Information.</p>\r\n            \r\n            <p>11.3 At no time, will you remove any Confidential Information from the office without permission.</p>\r\n            \r\n            <p>11.4 Your duty to safeguard and not disclos</p>\r\n            \r\n            <p>e Confidential Information will survive the expiration or termination of this Agreement and/or your employment with the Company.</p>\r\n            \r\n            <p>11.5 Breach of the conditions of this clause will render you liable to summary dismissal under the clause above in addition to any</p>\r\n            \r\n            <p>other remedy the Company may have against you in law.</p>\r\n            <p>12. Notices</p>\r\n            \r\n            <p>Notices may be given by you to the Company at its registered office address. Notices may be given by the Company to you at</p>\r\n            \r\n            <p>the address intimated by you in the official records.</p>\r\n            \r\n            \r\n            \r\n            <p>13. Applicability of Company Policy</p>\r\n            \r\n            <p>The Company shall be entitled to make policy declarations from time to time pertaining to matters like leave entitlement,maternity</p>\r\n            \r\n            <p>leave, employees&rsquo; benefits, working hours, transfer policies, etc., and may alter the same from time to time at its sole discretion.</p>\r\n            \r\n            <p>All such policy decisions of the Company shall be binding on you and shall override this Agreement to that&nbsp; extent.</p>\r\n            \r\n            \r\n            \r\n            <p>14. Governing Law/Jurisdiction</p>\r\n            \r\n            <p>Your employment with the Company is subject to Country laws. All disputes shall be subject to the jurisdiction of High Court</p>\r\n            \r\n            <p>Gujarat only.</p>\r\n            \r\n            \r\n            \r\n            <p>15. Acceptance of our offer</p>\r\n            \r\n            <p>Please confirm your acceptance of this Contract of Employment by signing and returning the duplicate copy.</p>\r\n            \r\n            \r\n            \r\n            <p>We welcome you and look forward to receiving your acceptance and to working with you.</p>\r\n            \r\n            \r\n            \r\n            <p>Yours Sincerely,</p>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>{date}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(4, 'en', '<h3 style=\"text-align: center;\">Joining Letter</h3>\r\n            <p>{date}</p>\r\n            <p>{employee_name}</p>\r\n            <p>{address}</p>\r\n            <p>Subject: Appointment for the post of {designation}</p>\r\n            <p>Dear {employee_name},</p>\r\n            <p>We are pleased to offer you the position of {designation} with {app_name} theCompany on the following terms and</p>\r\n            <p>conditions:</p>\r\n            <p>1. Commencement of employment</p>\r\n            <p>Your employment will be effective, as of {start_date}</p>\r\n            <p>2. Job title</p>\r\n            <p>Your job title will be{designation}.</p>\r\n            <p>3. Salary</p>\r\n            <p>Your salary and other benefits will be as set out in Schedule 1, hereto.</p>\r\n            <p>4. Place of posting</p>\r\n            <p>You will be posted at {branch}. You may however be required to work at any place of business which the Company has, or</p>\r\n            <p>may later acquire.</p>\r\n            <p>5. Hours of Work</p>\r\n            <p>The normal working days are Monday through Friday. You will be required to work for such hours as necessary for the</p>\r\n            <p>proper discharge of your duties to the Company. The normal working hours are from {start_time} to {end_time} and you are</p>\r\n            <p>expected to work not less than {total_hours} hours each week, and if necessary for additional hours depending on your</p>\r\n            <p>responsibilities.</p>\r\n            <p>6. Leave/Holidays</p>\r\n            <p>6.1 You are entitled to casual leave of 12 days.</p>\r\n            <p>6.2 You are entitled to 12 working days of paid sick leave.</p>\r\n            <p>6.3 The Company shall notify a list of declared holidays at the beginning of each year.</p>\r\n            <p>7. Nature of duties</p>\r\n            <p>You will perform to the best of your ability all the duties as are inherent in your post and such additional duties as the company</p>\r\n            <p>may call upon you to perform, from time to time. Your specific duties are set out in Schedule II hereto.</p>\r\n            <p>8. Company property</p>\r\n            <p>You will always maintain in good condition Company property, which may be entrusted to you for official use during the course of</p>\r\n            <p>your employment, and shall return all such property to the Company prior to relinquishment of your charge, failing which the cost</p>\r\n            <p>of the same will be recovered from you by the Company.</p>\r\n            <p>9. Borrowing/accepting gifts</p>\r\n            <p>You will not borrow or accept any money, gift, reward, or compensation for your personal gains from or otherwise place yourself</p>\r\n            <p>under pecuniary obligation to any person/client with whom you may be having official dealings.</p>\r\n            <p>10. Termination</p>\r\n            <p>10.1 Your appointment can be terminated by the Company, without any reason, by giving you not less than [Notice] months prior</p>\r\n            <p>notice in writing or salary in lieu thereof. For the purpose of this clause, salary shall mean basic salary.</p>\r\n            <p>10.2 You may terminate your employment with the Company, without any cause, by giving no less than [Employee Notice]</p>\r\n            <p>months prior notice or salary for the unsaved period, left after adjustment of pending leaves, as on date.</p>\r\n            <p>10.3 The Company reserves the right to terminate your employment summarily without any notice period or termination payment</p>\r\n            <p>if it has reasonable ground to believe you are guilty of misconduct or negligence, or have committed any fundamental breach of</p>\r\n            <p>contract, or caused any loss to the Company.</p>\r\n            <p>10. 4 On the termination of your employment for whatever reason, you will return to the Company all property; documents, and</p>\r\n            <p>paper, both original and copies thereof, including any samples, literature, contracts, records, lists, drawings, blueprints,</p>\r\n            <p>letters, notes, data and the like; and Confidential Information, in your possession or under your control relating to your</p>\r\n            <p>employment or to clients business affairs.</p>\r\n            <p>11. Confidential Information</p>\r\n            <p>11. 1 During your employment with the Company you will devote your whole time, attention, and skill to the best of your ability for</p>\r\n            <p>its business. You shall not, directly or indirectly, engage or associate yourself with, be connected with, concerned, employed, or</p>\r\n            <p>time or pursue any course of study whatsoever, without the prior permission of the Company.engaged in any other business or</p>\r\n            <p>activities or any other post or work part-time or pursue any course of study whatsoever, without the prior permission of the</p>\r\n            <p>Company.</p>\r\n            <p>11.2 You must always maintain the highest degree of confidentiality and keep as confidential the records, documents, and other</p>\r\n            <p>Confidential Information relating to the business of the Company which may be known to you or confided in you by any means</p>\r\n            <p>and you will use such records, documents and information only in a duly authorized manner in the interest of the Company. For</p>\r\n            <p>the purposes of this clauseConfidential Information means information about the Companys business and that of its customers</p>\r\n            <p>which is not available to the general public and which may be learned by you in the course of your employment. This includes,</p>\r\n            <p>but is not limited to, information relating to the organization, its customer lists, employment policies, personnel, and information</p>\r\n            <p>about the Companys products, processes including ideas, concepts, projections, technology, manuals, drawing, designs,</p>\r\n            <p>specifications, and all papers, resumes, records and other documents containing such Confidential Information.</p>\r\n            <p>11.3 At no time, will you remove any Confidential Information from the office without permission.</p>\r\n            <p>11.4 Your duty to safeguard and not disclos</p>\r\n            <p>e Confidential Information will survive the expiration or termination of this Agreement and/or your employment with the Company.</p>\r\n            <p>11.5 Breach of the conditions of this clause will render you liable to summary dismissal under the clause above in addition to any</p>\r\n            <p>other remedy the Company may have against you in law.</p>\r\n            <p>12. Notices</p>\r\n            <p>Notices may be given by you to the Company at its registered office address. Notices may be given by the Company to you at</p>\r\n            <p>the address intimated by you in the official records.</p>\r\n            <p>13. Applicability of Company Policy</p>\r\n            <p>The Company shall be entitled to make policy declarations from time to time pertaining to matters like leave entitlement,maternity</p>\r\n            <p>leave, employees benefits, working hours, transfer policies, etc., and may alter the same from time to time at its sole discretion.</p>\r\n            <p>All such policy decisions of the Company shall be binding on you and shall override this Agreement to that extent.</p>\r\n            <p>14. Governing Law/Jurisdiction</p>\r\n            <p>Your employment with the Company is subject to Country laws. All disputes shall be subject to the jurisdiction of High Court</p>\r\n            <p>Gujarat only.</p>\r\n            <p>15. Acceptance of our offer</p>\r\n            <p>Please confirm your acceptance of this Contract of Employment by signing and returning the duplicate copy.</p>\r\n            <p>We welcome you and look forward to receiving your acceptance and to working with you.</p>\r\n            <p>Yours Sincerely,</p>\r\n            <p>{app_name}</p>\r\n            <p>{date}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(5, 'es', '<h3 style=\"text-align: center;\"><strong>Carta de uni&oacute;n</strong></h3>\r\n            \r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{address}</p>\r\n            \r\n            \r\n            \r\n            <p>Asunto: Nombramiento para el puesto de {designation}</p>\r\n            \r\n            \r\n            \r\n            <p>Estimado {employee_name},</p>\r\n            \r\n            <p>Nos complace ofrecerle el puesto de {designation} con {app_name}, la Compa&ntilde;&iacute;a en los siguientes t&eacute;rminos y</p>\r\n            \r\n            <p>condiciones:</p>\r\n            \r\n            \r\n            <p>1. Comienzo del empleo</p>\r\n            \r\n            <p>Su empleo ser&aacute; efectivo a partir del {start_date}</p>\r\n            \r\n            \r\n            <p>2. T&iacute;tulo del trabajo</p>\r\n            <p>El t&iacute;tulo de su trabajo ser&aacute; {designation}.</p>\r\n            \r\n            <p>3. Salario</p>\r\n            \r\n            <p>Su salario y otros beneficios ser&aacute;n los establecidos en el Anexo 1 del presente.</p>\r\n            \r\n            \r\n            <p>4. Lugar de destino</p>\r\n            <p>Se le publicar&aacute; en {branch}. Sin embargo, es posible que deba trabajar en cualquier lugar de negocios que tenga la Compa&ntilde;&iacute;a, o</p>\r\n            \r\n            <p>puede adquirir posteriormente.</p>\r\n            \r\n            \r\n            \r\n            <p>5. Horas de trabajo</p>\r\n            \r\n            <p>Los d&iacute;as normales de trabajo son de lunes a viernes. Se le pedir&aacute; que trabaje las horas que sean necesarias para el</p>\r\n            \r\n            <p>cumplimiento adecuado de sus deberes para con la Compa&ntilde;&iacute;a. El horario normal de trabajo es de {start_time} a {end_time} y usted est&aacute;</p>\r\n            \r\n            <p>se espera que trabaje no menos de {total_hours} horas cada semana y, si es necesario, horas adicionales dependiendo de su</p>\r\n            \r\n            <p>responsabilidades.</p>\r\n            \r\n            \r\n            \r\n            <p>6. Licencia/Vacaciones</p>\r\n            \r\n            <p>6.1 Tiene derecho a un permiso eventual de 12 d&iacute;as.</p>\r\n            \r\n            <p>6.2 Tiene derecho a 12 d&iacute;as laborables de baja por enfermedad remunerada.</p>\r\n            \r\n            <p>6.3 La Compa&ntilde;&iacute;a deber&aacute; notificar una lista de d&iacute;as festivos declarados al comienzo de cada a&ntilde;o.</p>\r\n            \r\n            \r\n            \r\n            <p>7. Naturaleza de los deberes</p>\r\n            \r\n            <p>Desempe&ntilde;ar&aacute; lo mejor que pueda todas las funciones inherentes a su puesto y aquellas funciones adicionales que la empresa</p>\r\n            \r\n            <p>puede pedirte que act&uacute;es, de vez en cuando. Sus deberes espec&iacute;ficos se establecen en el Anexo II del presente.</p>\r\n            \r\n            \r\n            \r\n            <p>8. Propiedad de la empresa</p>\r\n            \r\n            <p>Siempre mantendr&aacute; en buenas condiciones la propiedad de la Compa&ntilde;&iacute;a, que se le puede confiar para uso oficial durante el curso de</p>\r\n            \r\n            <p>su empleo, y devolver&aacute; todos esos bienes a la Compa&ntilde;&iacute;a antes de renunciar a su cargo, en caso contrario, el costo</p>\r\n            \r\n            <p>de la misma ser&aacute; recuperada de usted por la Compa&ntilde;&iacute;a.</p>\r\n            \r\n            \r\n            \r\n            <p>9. Tomar prestado/aceptar regalos</p>\r\n            \r\n            <p>No pedir&aacute; prestado ni aceptar&aacute; dinero, obsequios, recompensas o compensaciones por sus ganancias personales o se colocar&aacute; de otra manera</p>\r\n            \r\n            <p>bajo obligaci&oacute;n pecuniaria a cualquier persona/cliente con quien pueda tener tratos oficiales.</p>\r\n            <p>10. Terminaci&oacute;n</p>\r\n            \r\n            <p>10.1 Su nombramiento puede ser rescindido por la Compa&ntilde;&iacute;a, sin ning&uacute;n motivo, al darle no menos de [Aviso] meses antes</p>\r\n            \r\n            <p>aviso por escrito o salario en su lugar. Para los efectos de esta cl&aacute;usula, se entender&aacute; por salario el salario base.</p>\r\n            \r\n            <p>10.2 Puede rescindir su empleo con la Compa&ntilde;&iacute;a, sin ninguna causa, dando no menos de [Aviso al empleado]</p>\r\n            \r\n            <p>meses de preaviso o salario por el per&iacute;odo no ahorrado, remanente despu&eacute;s del ajuste de licencias pendientes, a la fecha.</p>\r\n            \r\n            <p>10.3 La Compa&ntilde;&iacute;a se reserva el derecho de rescindir su empleo sumariamente sin ning&uacute;n per&iacute;odo de preaviso o pago por rescisi&oacute;n</p>\r\n            \r\n            <p>si tiene motivos razonables para creer que usted es culpable de mala conducta o negligencia, o ha cometido una violaci&oacute;n fundamental de</p>\r\n            \r\n            <p>contrato, o causado cualquier p&eacute;rdida a la Compa&ntilde;&iacute;a.</p>\r\n            \r\n            <p>10. 4 A la terminaci&oacute;n de su empleo por cualquier motivo, devolver&aacute; a la Compa&ntilde;&iacute;a todos los bienes; documentos, y</p>\r\n            \r\n            <p>papel, tanto en original como en copia del mismo, incluyendo cualquier muestra, literatura, contratos, registros, listas, dibujos, planos,</p>\r\n            \r\n            <p>cartas, notas, datos y similares; e Informaci&oacute;n confidencial, en su posesi&oacute;n o bajo su control en relaci&oacute;n con su</p>\r\n            \r\n            <p>empleo o a los asuntos comerciales de los clientes.</p>\r\n            <p>11. Informaci&oacute;n confidencial</p>\r\n            \r\n            <p>11. 1 Durante su empleo en la Compa&ntilde;&iacute;a, dedicar&aacute; todo su tiempo, atenci&oacute;n y habilidad lo mejor que pueda para</p>\r\n            \r\n            <p>son negocios. Usted no deber&aacute;, directa o indirectamente, comprometerse o asociarse con, estar conectado, interesado, empleado o</p>\r\n            \r\n            <p>tiempo o seguir cualquier curso de estudio, sin el permiso previo de la Compa&ntilde;&iacute;a. participar en cualquier otro negocio o</p>\r\n            \r\n            <p>actividades o cualquier otro puesto o trabajo a tiempo parcial o seguir cualquier curso de estudio, sin el permiso previo de la</p>\r\n            \r\n            <p>Compa&ntilde;&iacute;a.</p>\r\n            \r\n            <p>11.2 Siempre debe mantener el m&aacute;s alto grado de confidencialidad y mantener como confidenciales los registros, documentos y otros</p>\r\n            \r\n            <p>Informaci&oacute;n confidencial relacionada con el negocio de la Compa&ntilde;&iacute;a que usted pueda conocer o confiarle por cualquier medio</p>\r\n            \r\n            <p>y utilizar&aacute; dichos registros, documentos e informaci&oacute;n solo de manera debidamente autorizada en inter&eacute;s de la Compa&ntilde;&iacute;a. Para</p>\r\n            \r\n            <p>A los efectos de esta cl&aacute;usula, \"Informaci&oacute;n confidencial\" significa informaci&oacute;n sobre el negocio de la Compa&ntilde;&iacute;a y el de sus clientes.</p>\r\n            \r\n            <p>que no est&aacute; disponible para el p&uacute;blico en general y que usted puede aprender en el curso de su empleo. Esto incluye,</p>\r\n            \r\n            <p>pero no se limita a, informaci&oacute;n relacionada con la organizaci&oacute;n, sus listas de clientes, pol&iacute;ticas de empleo, personal e informaci&oacute;n</p>\r\n            \r\n            <p>sobre los productos de la Compa&ntilde;&iacute;a, procesos que incluyen ideas, conceptos, proyecciones, tecnolog&iacute;a, manuales, dibujos, dise&ntilde;os,</p>\r\n            \r\n            <p>especificaciones, y todos los papeles, curr&iacute;culos, registros y otros documentos que contengan dicha Informaci&oacute;n Confidencial.</p>\r\n            \r\n            <p>11.3 En ning&uacute;n momento, sacar&aacute; ninguna Informaci&oacute;n Confidencial de la oficina sin permiso.</p>\r\n            \r\n            <p>11.4 Su deber de salvaguardar y no divulgar</p>\r\n            \r\n            <p>La Informaci&oacute;n Confidencial sobrevivir&aacute; a la expiraci&oacute;n o terminaci&oacute;n de este Acuerdo y/o su empleo con la Compa&ntilde;&iacute;a.</p>\r\n            \r\n            <p>11.5 El incumplimiento de las condiciones de esta cl&aacute;usula le har&aacute; pasible de despido sumario en virtud de la cl&aacute;usula anterior adem&aacute;s de cualquier</p>\r\n            \r\n            <p>otro recurso que la Compa&ntilde;&iacute;a pueda tener contra usted por ley.</p>\r\n            <p>12. Avisos</p>\r\n            \r\n            <p>Usted puede enviar notificaciones a la Compa&ntilde;&iacute;a a su domicilio social. La Compa&ntilde;&iacute;a puede enviarle notificaciones a usted en</p>\r\n            \r\n            <p>la direcci&oacute;n indicada por usted en los registros oficiales.</p>\r\n            \r\n            \r\n            \r\n            <p>13. Aplicabilidad de la pol&iacute;tica de la empresa</p>\r\n            \r\n            <p>La Compa&ntilde;&iacute;a tendr&aacute; derecho a hacer declaraciones de pol&iacute;tica de vez en cuando relacionadas con asuntos como el derecho a licencia, maternidad</p>\r\n            \r\n            <p>licencia, beneficios de los empleados, horas de trabajo, pol&iacute;ticas de transferencia, etc., y puede modificarlas de vez en cuando a su sola discreci&oacute;n.</p>\r\n            \r\n            <p>Todas las decisiones pol&iacute;ticas de la Compa&ntilde;&iacute;a ser&aacute;n vinculantes para usted y anular&aacute;n este Acuerdo en esa medida.</p>\r\n            \r\n            \r\n            \r\n            <p>14. Ley aplicable/Jurisdicci&oacute;n</p>\r\n            \r\n            <p>Su empleo con la Compa&ntilde;&iacute;a est&aacute; sujeto a las leyes del Pa&iacute;s. Todas las disputas estar&aacute;n sujetas a la jurisdicci&oacute;n del Tribunal Superior</p>\r\n            \r\n            <p>S&oacute;lo Gujarat.</p>\r\n            \r\n            \r\n            \r\n            <p>15. Aceptaci&oacute;n de nuestra oferta</p>\r\n            \r\n            <p>Por favor, confirme su aceptaci&oacute;n de este Contrato de Empleo firmando y devolviendo el duplicado.</p>\r\n            \r\n            \r\n            \r\n            <p>Le damos la bienvenida y esperamos recibir su aceptaci&oacute;n y trabajar con usted.</p>\r\n            \r\n            \r\n            \r\n            <p>Tuyo sinceramente,</p>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>{date}</p>\r\n            ', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15');
INSERT INTO `joining_letters` (`id`, `lang`, `content`, `created_by`, `created_at`, `updated_at`) VALUES
(6, 'fr', '<h3 style=\"text-align: center;\">Lettre dadh&eacute;sion</h3>\r\n            \r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            <p>{address}</p>\r\n            \r\n            \r\n            <p>Objet : Nomination pour le poste de {designation}</p>\r\n            \r\n            \r\n            \r\n            <p>Cher {employee_name},</p>\r\n            \r\n            \r\n            <p>Nous sommes heureux de vous proposer le poste de {designation} avec {app_name} la \"Soci&eacute;t&eacute;\" selon les conditions suivantes et</p>\r\n            \r\n            <p>les conditions:</p>\r\n            \r\n            <p>1. Entr&eacute;e en fonction</p>\r\n            \r\n            <p>Votre emploi sera effectif &agrave; partir du {start_date}</p>\r\n            \r\n            \r\n            \r\n            <p>2. Intitul&eacute; du poste</p>\r\n            \r\n            <p>Votre titre de poste sera {designation}.</p>\r\n            \r\n            \r\n            \r\n            <p>3. Salaire</p>\r\n            \r\n            <p>Votre salaire et vos autres avantages seront tels quindiqu&eacute;s &agrave; lannexe 1 ci-jointe.</p>\r\n            \r\n            \r\n            <p>4. Lieu de d&eacute;tachement</p>\r\n            <p>Vous serez affect&eacute; &agrave; {branch}. Vous pouvez cependant &ecirc;tre tenu de travailler dans nimporte quel lieu daffaires que la Soci&eacute;t&eacute; a, ou</p>\r\n            \r\n            <p>pourra acqu&eacute;rir plus tard.</p>\r\n            \r\n            \r\n            \r\n            <p>5. Heures de travail</p>\r\n            \r\n            <p>Les jours ouvrables normaux sont du lundi au vendredi. Vous devrez travailler les heures n&eacute;cessaires &agrave; la</p>\r\n            \r\n            <p>lexercice correct de vos fonctions envers la Soci&eacute;t&eacute;. Les heures normales de travail vont de {start_time} &agrave; {end_time} et vous &ecirc;tes</p>\r\n            \r\n            <p>devrait travailler au moins {total_hours} heures par semaine, et si n&eacute;cessaire des heures suppl&eacute;mentaires en fonction de votre</p>\r\n            \r\n            <p>responsabilit&eacute;s.</p>\r\n            \r\n            <p>6. Cong&eacute;s/Vacances</p>\r\n            \r\n            <p>6.1 Vous avez droit &agrave; un cong&eacute; occasionnel de 12 jours.</p>\r\n            \r\n            <p>6.2 Vous avez droit &agrave; 12 jours ouvrables de cong&eacute; de maladie pay&eacute;.</p>\r\n            \r\n            <p>6.3 La Soci&eacute;t&eacute; communiquera une liste des jours f&eacute;ri&eacute;s d&eacute;clar&eacute;s au d&eacute;but de chaque ann&eacute;e.</p>\r\n            \r\n            \r\n            \r\n            <p>7. Nature des fonctions</p>\r\n            \r\n            <p>Vous ex&eacute;cuterez au mieux de vos capacit&eacute;s toutes les t&acirc;ches inh&eacute;rentes &agrave; votre poste et les t&acirc;ches suppl&eacute;mentaires que lentreprise</p>\r\n            \r\n            <p>peut faire appel &agrave; vous pour effectuer, de temps &agrave; autre. Vos fonctions sp&eacute;cifiques sont &eacute;nonc&eacute;es &agrave; lannexe II ci-jointe.</p>\r\n            \r\n            \r\n            \r\n            <p>8. Biens sociaux</p>\r\n            \r\n            <p>Vous maintiendrez toujours en bon &eacute;tat les biens de la Soci&eacute;t&eacute;, qui peuvent vous &ecirc;tre confi&eacute;s pour un usage officiel au cours de votre</p>\r\n            \r\n            <p>votre emploi, et doit restituer tous ces biens &agrave; la Soci&eacute;t&eacute; avant labandon de votre charge, &agrave; d&eacute;faut de quoi le co&ucirc;t</p>\r\n            \r\n            <p>de m&ecirc;me seront r&eacute;cup&eacute;r&eacute;s aupr&egrave;s de vous par la Soci&eacute;t&eacute;.</p>\r\n            \r\n            \r\n            \r\n            <p>9. Emprunter/accepter des cadeaux</p>\r\n            \r\n            <p>Vous nemprunterez ni naccepterez dargent, de cadeau, de r&eacute;compense ou de compensation pour vos gains personnels ou vous placerez autrement</p>\r\n            \r\n            <p>sous obligation p&eacute;cuniaire envers toute personne/client avec qui vous pourriez avoir des relations officielles.</p>\r\n            <p>10. R&eacute;siliation</p>\r\n            \r\n            <p>10.1 Votre nomination peut &ecirc;tre r&eacute;sili&eacute;e par la Soci&eacute;t&eacute;, sans aucune raison, en vous donnant au moins [Pr&eacute;avis] mois avant</p>\r\n            \r\n            <p>un pr&eacute;avis &eacute;crit ou un salaire en tenant lieu. Aux fins de la pr&eacute;sente clause, salaire sentend du salaire de base.</p>\r\n            \r\n            <p>10.2 Vous pouvez r&eacute;silier votre emploi au sein de la Soci&eacute;t&eacute;, sans motif, en donnant au moins [Avis &agrave; lemploy&eacute;]</p>\r\n            \r\n            <p>mois de pr&eacute;avis ou de salaire pour la p&eacute;riode non &eacute;pargn&eacute;e, restant apr&egrave;s r&eacute;gularisation des cong&eacute;s en attente, &agrave; la date.</p>\r\n            \r\n            <p>10.3 La Soci&eacute;t&eacute; se r&eacute;serve le droit de r&eacute;silier votre emploi sans pr&eacute;avis ni indemnit&eacute; de licenciement.</p>\r\n            \r\n            <p>sil a des motifs raisonnables de croire que vous &ecirc;tes coupable dinconduite ou de n&eacute;gligence, ou que vous avez commis une violation fondamentale de</p>\r\n            \r\n            <p>contrat, ou caus&eacute; une perte &agrave; la Soci&eacute;t&eacute;.</p>\r\n            \r\n            <p>10. 4 &Agrave; la fin de votre emploi pour quelque raison que ce soit, vous restituerez &agrave; la Soci&eacute;t&eacute; tous les biens ; document, et</p>\r\n            \r\n            <p>papier, &agrave; la fois loriginal et les copies de celui-ci, y compris les &eacute;chantillons, la litt&eacute;rature, les contrats, les dossiers, les listes, les dessins, les plans,</p>\r\n            \r\n            <p>lettres, notes, donn&eacute;es et similaires; et Informations confidentielles, en votre possession ou sous votre contr&ocirc;le relatives &agrave; votre</p>\r\n            \r\n            <p>lemploi ou aux affaires commerciales des clients.</p>\r\n            <p>11. Informations confidentielles</p>\r\n            \r\n            <p>11. 1 Au cours de votre emploi au sein de la Soci&eacute;t&eacute;, vous consacrerez tout votre temps, votre attention et vos comp&eacute;tences au mieux de vos capacit&eacute;s pour</p>\r\n            \r\n            <p>son affaire. Vous ne devez pas, directement ou indirectement, vous engager ou vous associer &agrave;, &ecirc;tre li&eacute; &agrave;, concern&eacute;, employ&eacute; ou</p>\r\n            \r\n            <p>temps ou poursuivre quelque programme d&eacute;tudes que ce soit, sans lautorisation pr&eacute;alable de la Soci&eacute;t&eacute;. engag&eacute; dans toute autre entreprise ou</p>\r\n            \r\n            <p>activit&eacute;s ou tout autre poste ou travail &agrave; temps partiel ou poursuivre des &eacute;tudes quelconques, sans lautorisation pr&eacute;alable du</p>\r\n            \r\n            <p>Compagnie.</p>\r\n            \r\n            <p>11.2 Vous devez toujours maintenir le plus haut degr&eacute; de confidentialit&eacute; et garder confidentiels les dossiers, documents et autres</p>\r\n            \r\n            <p>Informations confidentielles relatives &agrave; lactivit&eacute; de la Soci&eacute;t&eacute; dont vous pourriez avoir connaissance ou qui vous seraient confi&eacute;es par tout moyen</p>\r\n            \r\n            <p>et vous nutiliserez ces registres, documents et informations que dune mani&egrave;re d&ucirc;ment autoris&eacute;e dans lint&eacute;r&ecirc;t de la Soci&eacute;t&eacute;. Pour</p>\r\n            \r\n            <p>aux fins de la pr&eacute;sente clause &laquo; Informations confidentielles &raquo; d&eacute;signe les informations sur les activit&eacute;s de la Soci&eacute;t&eacute; et celles de ses clients</p>\r\n            \r\n            <p>qui nest pas accessible au grand public et dont vous pourriez avoir connaissance dans le cadre de votre emploi. Ceci comprend,</p>\r\n            \r\n            <p>mais sans sy limiter, les informations relatives &agrave; lorganisation, ses listes de clients, ses politiques demploi, son personnel et les informations</p>\r\n            \r\n            <p>sur les produits, les processus de la Soci&eacute;t&eacute;, y compris les id&eacute;es, les concepts, les projections, la technologie, les manuels, les dessins, les conceptions,</p>\r\n            \r\n            <p>sp&eacute;cifications, et tous les papiers, curriculum vitae, dossiers et autres documents contenant de telles informations confidentielles.</p>\r\n            \r\n            <p>11.3 &Agrave; aucun moment, vous ne retirerez des informations confidentielles du bureau sans autorisation.</p>\r\n            \r\n            <p>11.4 Votre devoir de prot&eacute;ger et de ne pas divulguer</p>\r\n            \r\n            <p>Les Informations confidentielles survivront &agrave; lexpiration ou &agrave; la r&eacute;siliation du pr&eacute;sent Contrat et/ou &agrave; votre emploi au sein de la Soci&eacute;t&eacute;.</p>\r\n            \r\n            <p>11.5 La violation des conditions de cette clause vous rendra passible dun renvoi sans pr&eacute;avis en vertu de la clause ci-dessus en plus de tout</p>\r\n            \r\n            <p>autre recours que la Soci&eacute;t&eacute; peut avoir contre vous en droit.</p>\r\n            <p>12. Avis</p>\r\n            \r\n            <p>Des avis peuvent &ecirc;tre donn&eacute;s par vous &agrave; la Soci&eacute;t&eacute; &agrave; ladresse de son si&egrave;ge social. Des avis peuvent vous &ecirc;tre donn&eacute;s par la Soci&eacute;t&eacute; &agrave;</p>\r\n            \r\n            <p>ladresse que vous avez indiqu&eacute;e dans les registres officiels.</p>\r\n            \r\n            \r\n            \r\n            <p>13. Applicabilit&eacute; de la politique de lentreprise</p>\r\n            \r\n            <p>La Soci&eacute;t&eacute; est autoris&eacute;e &agrave; faire des d&eacute;clarations de politique de temps &agrave; autre concernant des questions telles que le droit aux cong&eacute;s, la maternit&eacute;</p>\r\n            \r\n            <p>les cong&eacute;s, les avantages sociaux des employ&eacute;s, les heures de travail, les politiques de transfert, etc., et peut les modifier de temps &agrave; autre &agrave; sa seule discr&eacute;tion.</p>\r\n            \r\n            <p>Toutes ces d&eacute;cisions politiques de la Soci&eacute;t&eacute; vous lieront et pr&eacute;vaudront sur le pr&eacute;sent Contrat dans cette mesure.</p>\r\n            \r\n            \r\n            \r\n            <p>14. Droit applicable/juridiction</p>\r\n            \r\n            <p>Votre emploi au sein de la Soci&eacute;t&eacute; est soumis aux lois du pays. Tous les litiges seront soumis &agrave; la comp&eacute;tence du tribunal de grande instance</p>\r\n            \r\n            <p>Gujarat uniquement.</p>\r\n            \r\n            \r\n            \r\n            <p>15. Acceptation de notre offre</p>\r\n            \r\n            <p>Veuillez confirmer votre acceptation de ce contrat de travail en signant et en renvoyant le duplicata.</p>\r\n            \r\n            \r\n            \r\n            <p>Nous vous souhaitons la bienvenue et nous nous r&eacute;jouissons de recevoir votre acceptation et de travailler avec vous.</p>\r\n            \r\n            \r\n            \r\n            <p>Cordialement,</p>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>{date}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(7, 'id', '<h3 style=\"text-align: center;\">Surat Bergabung</h3>\r\n            \r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{address}</p>\r\n            \r\n            \r\n            \r\n            <p>Perihal: Pengangkatan untuk jabatan {designation}</p>\r\n            \r\n            \r\n            <p>{employee_name} yang terhormat,</p>\r\n            \r\n            <p>Kami dengan senang hati menawarkan kepada Anda, posisi {designation} dengan {app_name} sebagai Perusahaan dengan persyaratan dan</p>\r\n            \r\n            <p>kondisi:</p>\r\n            \r\n            \r\n            \r\n            <p>1. Mulai bekerja</p>\r\n            \r\n            <p>Pekerjaan Anda akan efektif, mulai {start_date}</p>\r\n            \r\n            \r\n            <p>2. Jabatan</p>\r\n            <p>Jabatan Anda adalah {designation}.</p>\r\n            \r\n            <p>3. Gaji</p>\r\n            <p>Gaji Anda dan tunjangan lainnya akan diatur dalam Jadwal 1, di sini.</p>\r\n            \r\n            \r\n            <p>4. Tempat posting</p>\r\n            \r\n            <p>Anda akan diposkan di {branch}. Namun Anda mungkin diminta untuk bekerja di tempat bisnis mana pun yang dimiliki Perusahaan, atau</p>\r\n            \r\n            <p>nantinya dapat memperoleh.</p>\r\n            \r\n            \r\n            \r\n            <p>5. Jam Kerja</p>\r\n            \r\n            <p>Hari kerja normal adalah Senin sampai Jumat. Anda akan diminta untuk bekerja selama jam-jam yang diperlukan untuk</p>\r\n            \r\n            <p>pelaksanaan tugas Anda dengan benar di Perusahaan. Jam kerja normal adalah dari {start_time} hingga {end_time} dan Anda</p>\r\n            \r\n            <p>diharapkan bekerja tidak kurang dari {total_hours} jam setiap minggu, dan jika perlu untuk jam tambahan tergantung pada</p>\r\n            \r\n            <p>tanggung jawab.</p>\r\n            \r\n            \r\n            \r\n            <p>6. Cuti/Libur</p>\r\n            \r\n            <p>6.1 Anda berhak atas cuti biasa selama 12 hari.</p>\r\n            \r\n            <p>6.2 Anda berhak atas 12 hari kerja cuti sakit berbayar.</p>\r\n            \r\n            <p>6.3 Perusahaan akan memberitahukan daftar hari libur yang diumumkan pada awal setiap tahun.</p>\r\n            \r\n            \r\n            \r\n            <p>7. Sifat tugas</p>\r\n            \r\n            <p>Anda akan melakukan yang terbaik dari kemampuan Anda semua tugas yang melekat pada jabatan Anda dan tugas tambahan seperti perusahaan</p>\r\n            \r\n            <p>dapat memanggil Anda untuk tampil, dari waktu ke waktu. Tugas khusus Anda ditetapkan dalam Jadwal II di sini.</p>\r\n            \r\n            \r\n            \r\n            <p>8. Properti perusahaan</p>\r\n            \r\n            <p>Anda akan selalu menjaga properti Perusahaan dalam kondisi baik, yang dapat dipercayakan kepada Anda untuk penggunaan resmi selama</p>\r\n            \r\n            <p>pekerjaan Anda, dan akan mengembalikan semua properti tersebut kepada Perusahaan sebelum melepaskan biaya Anda, jika tidak ada biayanya</p>\r\n            \r\n            <p>yang sama akan dipulihkan dari Anda oleh Perusahaan.</p>\r\n            \r\n            \r\n            \r\n            <p>9. Meminjam/menerima hadiah</p>\r\n            \r\n            <p>Anda tidak akan meminjam atau menerima uang, hadiah, hadiah, atau kompensasi apa pun untuk keuntungan pribadi Anda dari atau dengan cara lain menempatkan diri Anda sendiri</p>\r\n            \r\n            <p>di bawah kewajiban uang kepada setiap orang/klien dengan siapa Anda mungkin memiliki hubungan resmi.</p>\r\n            <p>10. Penghentian</p>\r\n            \r\n            <p>10.1 Penunjukan Anda dapat diakhiri oleh Perusahaan, tanpa alasan apa pun, dengan memberi Anda tidak kurang dari [Pemberitahuan] bulan sebelumnya</p>\r\n            \r\n            <p>pemberitahuan secara tertulis atau gaji sebagai penggantinya. Untuk maksud pasal ini, gaji berarti gaji pokok.</p>\r\n            \r\n            <p>10.2 Anda dapat memutuskan hubungan kerja Anda dengan Perusahaan, tanpa alasan apa pun, dengan memberikan tidak kurang dari [Pemberitahuan Karyawan]</p>\r\n            \r\n            <p>pemberitahuan atau gaji bulan sebelumnya untuk periode yang belum disimpan, yang tersisa setelah penyesuaian cuti yang tertunda, pada tanggal.</p>\r\n            \r\n            <p>10.3 Perusahaan berhak untuk mengakhiri hubungan kerja Anda dengan segera tanpa pemberitahuan jangka waktu atau pembayaran pemutusan hubungan kerja</p>\r\n            \r\n            <p>jika memiliki alasan yang masuk akal untuk meyakini bahwa Anda bersalah atas kesalahan atau kelalaian, atau telah melakukan pelanggaran mendasar apa pun terhadap</p>\r\n            \r\n            <p>kontrak, atau menyebabkan kerugian bagi Perusahaan.</p>\r\n            \r\n            <p>10. 4 Pada pemutusan hubungan kerja Anda karena alasan apa pun, Anda akan mengembalikan semua properti kepada Perusahaan; dokumen, dan</p>\r\n            \r\n            <p>kertas, baik asli maupun salinannya, termasuk contoh, literatur, kontrak, catatan, daftar, gambar, cetak biru,</p>\r\n            \r\n            <p>surat, catatan, data dan sejenisnya; dan Informasi Rahasia, yang Anda miliki atau di bawah kendali Anda terkait dengan</p>\r\n            \r\n            <p>pekerjaan atau untuk urusan bisnis klien.</p>\r\n            <p>11. Informasi Rahasia</p>\r\n            \r\n            <p>11. 1 Selama bekerja di Perusahaan, Anda akan mencurahkan seluruh waktu, perhatian, dan keterampilan Anda sebaik mungkin untuk</p>\r\n            \r\n            <p>bisnisnya. Anda tidak boleh, secara langsung atau tidak langsung, terlibat atau mengasosiasikan diri Anda dengan, terhubung dengan, terkait, dipekerjakan, atau</p>\r\n            \r\n            <p>waktu atau mengikuti program studi apapun, tanpa izin sebelumnya dari Perusahaan.terlibat dalam bisnis lain atau</p>\r\n            \r\n            <p>kegiatan atau pos atau pekerjaan paruh waktu lainnya atau mengejar program studi apa pun, tanpa izin sebelumnya dari</p>\r\n            \r\n            <p>Perusahaan.</p>\r\n            \r\n            <p>11.2 Anda harus selalu menjaga tingkat kerahasiaan tertinggi dan merahasiakan catatan, dokumen, dan lainnya</p>\r\n            \r\n            <p>Informasi Rahasia yang berkaitan dengan bisnis Perusahaan yang mungkin Anda ketahui atau rahasiakan kepada Anda dengan cara apa pun</p>\r\n            \r\n            <p>dan Anda akan menggunakan catatan, dokumen, dan informasi tersebut hanya dengan cara yang sah untuk kepentingan Perusahaan. Untuk</p>\r\n            \r\n            <p>tujuan klausul ini Informasi Rahasia berarti informasi tentang bisnis Perusahaan dan pelanggannya</p>\r\n            \r\n            <p>yang tidak tersedia untuk masyarakat umum dan yang mungkin Anda pelajari selama masa kerja Anda. Ini termasuk,</p>\r\n            \r\n            <p>tetapi tidak terbatas pada, informasi yang berkaitan dengan organisasi, daftar pelanggannya, kebijakan ketenagakerjaan, personel, dan informasi</p>\r\n            \r\n            <p>tentang produk Perusahaan, proses termasuk ide, konsep, proyeksi, teknologi, manual, gambar, desain,</p>\r\n            \r\n            <p>spesifikasi, dan semua makalah, resume, catatan dan dokumen lain yang berisi Informasi Rahasia tersebut.</p>\r\n            \r\n            <p>11.3 Kapan pun Anda akan menghapus Informasi Rahasia apa pun dari kantor tanpa izin.</p>\r\n            \r\n            <p>11.4 Kewajiban Anda untuk melindungi dan tidak mengungkapkan</p>\r\n            \r\n            <p>e Informasi Rahasia akan tetap berlaku setelah berakhirnya atau pengakhiran Perjanjian ini dan/atau hubungan kerja Anda dengan Perusahaan.</p>\r\n            \r\n            <p>11.5 Pelanggaran terhadap ketentuan klausul ini akan membuat Anda bertanggung jawab atas pemecatan singkat berdasarkan klausul di atas selain dari:</p>\r\n            \r\n            <p>upaya hukum lain yang mungkin dimiliki Perusahaan terhadap Anda secara hukum.</p>\r\n            <p>12. Pemberitahuan</p>\r\n            \r\n            <p>Pemberitahuan dapat diberikan oleh Anda kepada Perusahaan di alamat kantor terdaftarnya. Pemberitahuan dapat diberikan oleh Perusahaan kepada Anda di</p>\r\n            \r\n            <p>alamat yang diberitahukan oleh Anda dalam catatan resmi.</p>\r\n            \r\n            \r\n            \r\n            <p>13. Keberlakuan Kebijakan Perusahaan</p>\r\n            \r\n            <p>Perusahaan berhak untuk membuat pernyataan kebijakan dari waktu ke waktu berkaitan dengan hal-hal seperti hak cuti, persalinan</p>\r\n            \r\n            <p>cuti, tunjangan karyawan, jam kerja, kebijakan transfer, dll., dan dapat mengubahnya dari waktu ke waktu atas kebijakannya sendiri.</p>\r\n            \r\n            <p>Semua keputusan kebijakan Perusahaan tersebut akan mengikat Anda dan akan mengesampingkan Perjanjian ini sejauh itu.</p>\r\n            \r\n            \r\n            \r\n            <p>14. Hukum/Yurisdiksi yang Mengatur</p>\r\n            \r\n            <p>Pekerjaan Anda dengan Perusahaan tunduk pada undang-undang Negara. Semua perselisihan akan tunduk pada yurisdiksi Pengadilan Tinggi</p>\r\n            \r\n            <p>Gujarat saja.</p>\r\n            \r\n            \r\n            \r\n            <p>15. Penerimaan penawaran kami</p>\r\n            \r\n            <p>Harap konfirmasikan penerimaan Anda atas Kontrak Kerja ini dengan menandatangani dan mengembalikan salinan duplikatnya.</p>\r\n            \r\n            \r\n            \r\n            <p>Kami menyambut Anda dan berharap untuk menerima penerimaan Anda dan bekerja sama dengan Anda.</p>\r\n            \r\n            \r\n            \r\n            <p>Dengan hormat,</p>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>{date}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(8, 'it', '<h3 style=\"text-align: center;\">Lettera di adesione</h3>\r\n            \r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{address}</p>\r\n            \r\n            <p>Oggetto: Appuntamento alla carica di {designation}</p>\r\n            \r\n            \r\n            <p>Gentile {employee_name},</p>\r\n            \r\n            <p>Siamo lieti di offrirti la posizione di {designation} con {app_name} la \"Societ&agrave;\" alle seguenti condizioni e</p>\r\n            \r\n            <p>condizioni:</p>\r\n            \r\n            \r\n            <p>1. Inizio del rapporto di lavoro</p>\r\n            \r\n            <p>Il tuo impiego sar&agrave; effettivo a partire da {start_date}</p>\r\n            \r\n            \r\n            \r\n            <p>2. Titolo di lavoro</p>\r\n            \r\n            <p>Il tuo titolo di lavoro sar&agrave; {designation}.</p>\r\n            \r\n            <p>3. Stipendio</p>\r\n            \r\n            <p>Il tuo stipendio e altri benefici saranno come indicato nellAllegato 1, qui di seguito.</p>\r\n            \r\n            \r\n            \r\n            <p>4. Luogo di invio</p>\r\n            \r\n            <p>Sarai inviato a {branch}. Tuttavia, potrebbe essere richiesto di lavorare in qualsiasi luogo di attivit&agrave; che la Societ&agrave; ha, o</p>\r\n            \r\n            <p>potr&agrave; successivamente acquisire.</p>\r\n            \r\n            \r\n            \r\n            <p>5. Orario di lavoro</p>\r\n            \r\n            <p>I normali giorni lavorativi sono dal luned&igrave; al venerd&igrave;. Ti verr&agrave; richiesto di lavorare per le ore necessarie per il</p>\r\n            \r\n            <p>corretto adempimento dei propri doveri nei confronti della Societ&agrave;. Lorario di lavoro normale va da {start_time} a {end_time} e tu lo sei</p>\r\n            \r\n            <p>dovrebbe lavorare non meno di {total_hours} ore ogni settimana e, se necessario, per ore aggiuntive a seconda del tuo</p>\r\n            \r\n            <p>responsabilit&agrave;.</p>\r\n            \r\n            \r\n            \r\n            <p>6. Permessi/Festivit&agrave;</p>\r\n            \r\n            <p>6.1 Hai diritto a un congedo occasionale di 12 giorni.</p>\r\n            \r\n            <p>6.2 Hai diritto a 12 giorni lavorativi di congedo per malattia retribuito.</p>\r\n            \r\n            <p>6.3 La Societ&agrave; comunica allinizio di ogni anno un elenco delle festivit&agrave; dichiarate.</p>\r\n            \r\n            \r\n            \r\n            <p>7. Natura degli incarichi</p>\r\n            \r\n            <p>Eseguirai al meglio delle tue capacit&agrave; tutti i compiti inerenti al tuo incarico e compiti aggiuntivi come lazienda</p>\r\n            \r\n            <p>pu&ograve; invitarti a esibirti, di tanto in tanto. I tuoi doveri specifici sono stabiliti nellAllegato II del presente documento.</p>\r\n            \r\n            \r\n            \r\n            <p>8. Propriet&agrave; aziendale</p>\r\n            \r\n            <p>Manterrete sempre in buono stato i beni dellAzienda, che nel corso dellanno potrebbero esservi affidati per uso ufficiale</p>\r\n            \r\n            <p>il tuo impiego, e restituir&agrave; tutte queste propriet&agrave; alla Societ&agrave; prima della rinuncia al tuo addebito, in caso contrario il costo</p>\r\n            \r\n            <p>degli stessi saranno da voi recuperati dalla Societ&agrave;.</p>\r\n            \r\n            \r\n            \r\n            <p>9. Prendere in prestito/accettare regali</p>\r\n            \r\n            <p>Non prenderai in prestito n&eacute; accetterai denaro, dono, ricompensa o compenso per i tuoi guadagni personali da o altrimenti collocato te stesso</p>\r\n            \r\n            <p>sotto obbligazione pecuniaria nei confronti di qualsiasi persona/cliente con cui potresti avere rapporti ufficiali.</p>\r\n            <p>10. Cessazione</p>\r\n            \r\n            <p>10.1 Il tuo incarico pu&ograve; essere risolto dalla Societ&agrave;, senza alcun motivo, dandoti non meno di [Avviso] mesi prima</p>\r\n            \r\n            <p>avviso scritto o stipendio in sostituzione di esso. Ai fini della presente clausola, per stipendio si intende lo stipendio base.</p>\r\n            \r\n            <p>10.2 &Egrave; possibile terminare il proprio rapporto di lavoro con la Societ&agrave;, senza alcuna causa, fornendo non meno di [Avviso per il dipendente]</p>\r\n            \r\n            <p>mesi di preavviso o stipendio per il periodo non risparmiato, lasciato dopo ladeguamento delle ferie pendenti, come alla data.</p>\r\n            \r\n            <p>10.3 La Societ&agrave; si riserva il diritto di terminare il rapporto di lavoro sommariamente senza alcun periodo di preavviso o pagamento di cessazione</p>\r\n            \r\n            <p>se ha fondati motivi per ritenere che tu sia colpevole di cattiva condotta o negligenza, o abbia commesso una violazione fondamentale</p>\r\n            \r\n            <p>contratto, o ha causato danni alla Societ&agrave;.</p>\r\n            \r\n            <p>10. 4 Alla cessazione del rapporto di lavoro per qualsiasi motivo, restituirete alla Societ&agrave; tutti i beni; documenti, e</p>\r\n            \r\n            <p>carta, sia in originale che in copia, inclusi eventuali campioni, letteratura, contratti, registrazioni, elenchi, disegni, progetti,</p>\r\n            \r\n            <p>lettere, note, dati e simili; e Informazioni Riservate, in tuo possesso o sotto il tuo controllo, relative alla tua</p>\r\n            \r\n            <p>lavoro o agli affari dei clienti.</p>\r\n            <p>11. Confidential Information</p>\r\n            \r\n            <p>11. 1 During your employment with the Company you will devote your whole time, attention, and skill to the best of your ability for</p>\r\n            \r\n            <p>its business. You shall not, directly or indirectly, engage or associate yourself with, be connected with, concerned, employed, or</p>\r\n            \r\n            <p>time or pursue any course of study whatsoever, without the prior permission of the Company.engaged in any other business or</p>\r\n            \r\n            <p>activities or any other post or work part-time or pursue any course of study whatsoever, without the prior permission of the</p>\r\n            \r\n            <p>Company.</p>\r\n            \r\n            <p>11.2 You must always maintain the highest degree of confidentiality and keep as confidential the records, documents, and other&nbsp;</p>\r\n            \r\n            <p>Confidential Information relating to the business of the Company which may be known to you or confided in you by any means</p>\r\n            \r\n            <p>and you will use such records, documents and information only in a duly authorized manner in the interest of the Company. For</p>\r\n            \r\n            <p>the purposes of this clause &lsquo;Confidential Information&rsquo; means information about the Company&rsquo;s business and that of its customers</p>\r\n            \r\n            <p>which is not available to the general public and which may be learned by you in the course of your employment. This includes,</p>\r\n            \r\n            <p>but is not limited to, information relating to the organization, its customer lists, employment policies, personnel, and information</p>\r\n            \r\n            <p>about the Company&rsquo;s products, processes including ideas, concepts, projections, technology, manuals, drawing, designs,&nbsp;</p>\r\n            \r\n            <p>specifications, and all papers, resumes, records and other documents containing such Confidential Information.</p>\r\n            \r\n            <p>11.3 At no time, will you remove any Confidential Information from the office without permission.</p>\r\n            \r\n            <p>11.4 Your duty to safeguard and not disclos</p>\r\n            \r\n            <p>e Confidential Information will survive the expiration or termination of this Agreement and/or your employment with the Company.</p>\r\n            \r\n            <p>11.5 Breach of the conditions of this clause will render you liable to summary dismissal under the clause above in addition to any</p>\r\n            \r\n            <p>other remedy the Company may have against you in law.</p>\r\n            <p>12. Notices</p>\r\n            \r\n            <p>Notices may be given by you to the Company at its registered office address. Notices may be given by the Company to you at</p>\r\n            \r\n            <p>the address intimated by you in the official records.</p>\r\n            \r\n            \r\n            \r\n            <p>13. Applicability of Company Policy</p>\r\n            \r\n            <p>The Company shall be entitled to make policy declarations from time to time pertaining to matters like leave entitlement,maternity</p>\r\n            \r\n            <p>leave, employees&rsquo; benefits, working hours, transfer policies, etc., and may alter the same from time to time at its sole discretion.</p>\r\n            \r\n            <p>All such policy decisions of the Company shall be binding on you and shall override this Agreement to that&nbsp; extent.</p>\r\n            \r\n            \r\n            \r\n            <p>14. Governing Law/Jurisdiction</p>\r\n            \r\n            <p>Your employment with the Company is subject to Country laws. All disputes shall be subject to the jurisdiction of High Court</p>\r\n            \r\n            <p>Gujarat only.</p>\r\n            \r\n            \r\n            \r\n            <p>15. Acceptance of our offer</p>\r\n            \r\n            <p>Please confirm your acceptance of this Contract of Employment by signing and returning the duplicate copy.</p>\r\n            \r\n            \r\n            \r\n            <p>We welcome you and look forward to receiving your acceptance and to working with you.</p>\r\n            \r\n            \r\n            \r\n            <p>Yours Sincerely,</p>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>{date}</p>\r\n            ', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(9, 'ja', '<h3 style=\"text-align: center;\">入会の手紙</h3>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{address}</p>\r\n            \r\n            \r\n            \r\n            <p>件名: {designation} の役職への任命</p>\r\n            \r\n            \r\n            \r\n            <p>{employee_name} 様</p>\r\n            \r\n            \r\n            <p>{app_name} の {designation} の地位を以下の条件で「会社」として提供できることをうれしく思います。</p>\r\n            \r\n            <p>条件：</p>\r\n            \r\n            \r\n            <p>1. 雇用開始</p>\r\n            \r\n            <p>あなたの雇用は {start_date} から有効になります</p>\r\n            \r\n            \r\n            <p>2. 役職</p>\r\n            \r\n            <p>あなたの役職は{designation}になります。</p>\r\n            \r\n            \r\n            <p>3. 給与</p>\r\n            \r\n            <p>あなたの給与およびその他の福利厚生は、本明細書のスケジュール 1 に記載されているとおりです。</p>\r\n            \r\n            \r\n            <p>4. 掲示場所</p>\r\n            \r\n            <p>{branch} に掲載されます。ただし、会社が所有する事業所で働く必要がある場合があります。</p>\r\n            \r\n            <p>後で取得する場合があります。</p>\r\n            \r\n            \r\n            \r\n            <p>5. 労働時間</p>\r\n            \r\n            <p>通常の営業日は月曜日から金曜日です。あなたは、そのために必要な時間働く必要があります。</p>\r\n            \r\n            <p>会社に対するあなたの義務の適切な遂行。通常の勤務時間は {start_time} から {end_time} までで、あなたは</p>\r\n            \r\n            <p>毎週 {total_hours} 時間以上の勤務が期待される</p>\r\n            \r\n            <p>責任。</p>\r\n            \r\n            \r\n            \r\n            <p>6.休暇・休日</p>\r\n            \r\n            <p>6.1 12 日間の臨時休暇を取得する権利があります。</p>\r\n            \r\n            <p>6.2 12 日間の有給病気休暇を取る権利があります。</p>\r\n            \r\n            <p>6.3 当社は、毎年の初めに宣言された休日のリストを通知するものとします。</p>\r\n            \r\n            \r\n            \r\n            <p>7. 職務内容</p>\r\n            \r\n            <p>あなたは、自分のポストに固有のすべての義務と、会社としての追加の義務を最大限に遂行します。</p>\r\n            \r\n            <p>時々あなたに演奏を依頼するかもしれません。あなたの特定の義務は、本明細書のスケジュール II に記載されています。</p>\r\n            \r\n            \r\n            \r\n            <p>8. 会社財産</p>\r\n            \r\n            <p>あなたは、会社の所有物を常に良好な状態に維持するものとします。</p>\r\n            \r\n            <p>あなたの雇用を放棄し、あなたの料金を放棄する前に、そのようなすべての財産を会社に返還するものとします。</p>\r\n            \r\n            <p>同じのは、会社によってあなたから回収されます。</p>\r\n            \r\n            \r\n            \r\n            <p>9. 貸出・贈答品の受け取り</p>\r\n            \r\n            <p>あなたは、あなた自身から、または他の方法であなた自身の場所から個人的な利益を得るための金銭、贈り物、報酬、または補償を借りたり、受け取ったりしません。</p>\r\n            \r\n            <p>あなたが公式の取引をしている可能性のある人物/クライアントに対する金銭的義務の下で。</p>\r\n            <p>10. 終了</p>\r\n            \r\n            <p>10.1 少なくとも [通知] か月前に通知することにより、理由のいかんを問わず、会社はあなたの任命を終了することができます。</p>\r\n            \r\n            <p>書面による通知またはその代わりの給与。この条項の目的上、給与とは基本給を意味するものとします。</p>\r\n            \r\n            <p>10.2 あなたは、少なくとも [従業員通知] を提出することにより、理由のいかんを問わず、会社での雇用を終了することができます。</p>\r\n            \r\n            <p>保留中の休暇の調整後に残された、保存されていない期間の数か月前の通知または給与は、日付のとおりです。</p>\r\n            \r\n            <p>10.3 当社は、通知期間や解雇補償金なしに、あなたの雇用を即座に終了させる権利を留保します。</p>\r\n            \r\n            <p>あなたが不正行為または過失で有罪であると信じる合理的な根拠がある場合、または基本的な違反を犯した場合</p>\r\n            \r\n            <p>契約、または当社に損害を与えた。</p>\r\n            \r\n            <p>10. 4 何らかの理由で雇用が終了した場合、あなたは会社にすべての財産を返還するものとします。ドキュメント、および</p>\r\n            \r\n            <p>サンプル、文献、契約書、記録、リスト、図面、青写真を含む、原本とコピーの両方の紙、</p>\r\n            \r\n            <p>手紙、メモ、データなど。あなたが所有する、またはあなたの管理下にある機密情報。</p>\r\n            \r\n            <p>雇用またはクライアントの業務に。</p>\r\n            <p>11. 機密情報</p>\r\n            \r\n            <p>11. 1 当社での雇用期間中、あなたは自分の全時間、注意、およびスキルを、自分の能力の限りを尽くして捧げます。</p>\r\n            \r\n            <p>そのビジネス。あなたは、直接的または間接的に、関与したり、関連付けたり、接続したり、関係したり、雇用したり、または</p>\r\n            \r\n            <p>会社の事前の許可なしに、時間や学習コースを追求すること。他のビジネスに従事すること、または</p>\r\n            \r\n            <p>の事前の許可なしに、活動またはその他の投稿またはアルバイトをしたり、何らかの研究コースを追求したりすること。</p>\r\n            \r\n            <p>会社。</p>\r\n            \r\n            <p>11.2 常に最高度の機密性を維持し、記録、文書、およびその他の情報を機密として保持する必要があります。</p>\r\n            \r\n            <p>お客様が知っている、または何らかの方法でお客様に内密にされている可能性がある、当社の事業に関連する機密情報</p>\r\n            \r\n            <p>また、あなたは、会社の利益のために正当に承認された方法でのみ、そのような記録、文書、および情報を使用するものとします。為に</p>\r\n            \r\n            <p>この条項の目的 「機密情報」とは、会社の事業および顧客の事業に関する情報を意味します。</p>\r\n            \r\n            <p>これは一般には公開されておらず、雇用の過程で学習する可能性があります。これも、</p>\r\n            \r\n            <p>組織、その顧客リスト、雇用方針、人事、および情報に関連する情報に限定されません</p>\r\n            \r\n            <p>当社の製品、アイデアを含むプロセス、コンセプト、予測、技術、マニュアル、図面、デザイン、</p>\r\n            \r\n            <p>仕様、およびそのような機密情報を含むすべての書類、履歴書、記録、およびその他の文書。</p>\r\n            \r\n            <p>11.3 いかなる時も、許可なくオフィスから機密情報を削除しないでください。</p>\r\n            \r\n            <p>11.4 保護し、開示しないというあなたの義務</p>\r\n            \r\n            <p>e 機密情報は、本契約および/または当社との雇用の満了または終了後も存続します。</p>\r\n            \r\n            <p>11.5 この条項の条件に違反した場合、上記の条項に基づく略式解雇の対象となります。</p>\r\n            \r\n            <p>会社が法律であなたに対して持つことができるその他の救済。</p>\r\n            <p>12. 通知</p>\r\n            \r\n            <p>通知は、登録された事務所の住所で会社に提出することができます。通知は、当社からお客様に提供される場合があります。</p>\r\n            \r\n            <p>公式記録であなたがほのめかした住所。</p>\r\n            \r\n            \r\n            \r\n            <p>13. 会社方針の適用性</p>\r\n            \r\n            <p>会社は、休暇の資格、出産などの事項に関して、随時方針を宣言する権利を有するものとします。</p>\r\n            \r\n            <p>休暇、従業員の福利厚生、勤務時間、異動ポリシーなどであり、独自の裁量により随時変更される場合があります。</p>\r\n            \r\n            <p>当社のそのようなポリシー決定はすべて、あなたを拘束し、その範囲で本契約を無効にするものとします。</p>\r\n            \r\n            \r\n            \r\n            <p>14. 準拠法・裁判管轄</p>\r\n            \r\n            <p>当社でのあなたの雇用は、国の法律の対象となります。すべての紛争は、高等裁判所の管轄に服するものとします</p>\r\n            \r\n            <p>グジャラートのみ。</p>\r\n            \r\n            \r\n            \r\n            <p>15. オファーの受諾</p>\r\n            \r\n            <p>副本に署名して返送することにより、この雇用契約に同意したことを確認してください。</p>\r\n            \r\n            \r\n            \r\n            <p>私たちはあなたを歓迎し、あなたの受け入れを受け取り、あなたと一緒に働くことを楽しみにしています.</p>\r\n            \r\n            \r\n            \r\n            <p>敬具、</p>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>{date}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(10, 'nl', '<h3 style=\"text-align: center;\">Deelnemende brief</h3>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{employee}</p>\r\n            \r\n            <p>{address}</p>\r\n            \r\n            <p>Onderwerp: Benoeming voor de functie van {designation}</p>\r\n            \r\n            <p>Beste {employee_name},</p>\r\n            \r\n            <p>We zijn verheugd u de positie van {designation} bij {app_name} het Bedrijf aan te bieden onder de volgende voorwaarden en</p>\r\n            \r\n            <p>conditie:</p>\r\n            \r\n            \r\n            <p>1. Indiensttreding</p>\r\n            <p>Uw dienstverband gaat in op {start_date}</p>\r\n            \r\n            \r\n            <p>2. Functietitel</p>\r\n            \r\n            <p>Uw functietitel wordt {designation}.</p>\r\n            \r\n            <p>3. Salaris</p>\r\n            \r\n            <p>Uw salaris en andere voordelen zijn zoals uiteengezet in Schema 1 hierbij.</p>\r\n            \r\n            <p>4. Plaats van detachering</p>\r\n            \r\n            <p>Je wordt geplaatst op {branch}. Het kan echter zijn dat u moet werken op een bedrijfslocatie die het Bedrijf heeft, of</p>\r\n            \r\n            <p>later kan verwerven.</p>\r\n            \r\n            \r\n            \r\n            <p>5. Werkuren</p>\r\n            \r\n            <p>De normale werkdagen zijn van maandag tot en met vrijdag. Je zal de uren moeten werken die nodig zijn voor de</p>\r\n            \r\n            <p>correcte uitvoering van uw taken jegens het bedrijf. De normale werkuren zijn van {start_time} tot {end_time} en jij bent</p>\r\n            \r\n            <p>naar verwachting niet minder dan {total_hours} uur per week werken, en indien nodig voor extra uren, afhankelijk van uw</p>\r\n            \r\n            <p>verantwoordelijkheden.</p>\r\n            \r\n            \r\n            \r\n            <p>6. Verlof/Vakantie</p>\r\n            \r\n            <p>6.1 Je hebt recht op tijdelijk verlof van 12 dagen.</p>\r\n            \r\n            <p>6.2 U heeft recht op 12 werkdagen betaald ziekteverlof.</p>\r\n            \r\n            <p>6.3 De Maatschappij stelt aan het begin van elk jaar een lijst van verklaarde feestdagen op.</p>\r\n            \r\n            \r\n            \r\n            <p>7. Aard van de taken</p>\r\n            \r\n            <p>Je voert alle taken die inherent zijn aan je functie en bijkomende taken zoals het bedrijf naar beste vermogen uit;</p>\r\n            \r\n            <p>kan van tijd tot tijd een beroep op u doen om op te treden. Uw specifieke taken zijn uiteengezet in Bijlage II hierbij.</p>\r\n            \r\n            \r\n            \r\n            <p>8. Bedrijfseigendommen</p>\r\n            \r\n            <p>U onderhoudt bedrijfseigendommen, die u in de loop van</p>\r\n            \r\n            <p>uw dienstverband, en zal al deze eigendommen aan het Bedrijf teruggeven voordat afstand wordt gedaan van uw kosten, bij gebreke waarvan de kosten</p>\r\n            \r\n            <p>hiervan zal door het Bedrijf van u worden verhaald.</p>\r\n            \r\n            \r\n            \r\n            <p>9. Geschenken lenen/aannemen</p>\r\n            \r\n            <p>U zult geen geld, geschenken, beloningen of vergoedingen voor uw persoonlijk gewin lenen of accepteren van uzelf of uzelf op een andere manier plaatsen</p>\r\n            \r\n            <p>onder geldelijke verplichting jegens een persoon/klant met wie u mogelijk offici&euml;le betrekkingen heeft.</p>\r\n            <p>10. Be&euml;indiging</p>\r\n            \r\n            <p>10.1 Uw aanstelling kan door het Bedrijf zonder opgaaf van reden worden be&euml;indigd door u minimaal [Opzegging] maanden van tevoren</p>\r\n            \r\n            <p>schriftelijke opzegging of daarvoor in de plaats komend salaris. In dit artikel wordt onder salaris verstaan ​​het basissalaris.</p>\r\n            \r\n            <p>10.2 U kunt uw dienstverband bij het Bedrijf be&euml;indigen, zonder enige reden, door niet minder dan [Mededeling van de werknemer]</p>\r\n            \r\n            <p>maanden opzegtermijn of salaris voor de niet gespaarde periode, overgebleven na aanpassing van hangende verlofdagen, zoals op datum.</p>\r\n            \r\n            <p>10.3 Het bedrijf behoudt zich het recht voor om uw dienstverband op staande voet te be&euml;indigen zonder enige opzegtermijn of be&euml;indigingsvergoeding</p>\r\n            \r\n            <p>als het redelijke grond heeft om aan te nemen dat u zich schuldig heeft gemaakt aan wangedrag of nalatigheid, of een fundamentele schending van</p>\r\n            \r\n            <p>contract, of enig verlies voor het Bedrijf veroorzaakt.</p>\r\n            \r\n            <p>10. 4 Bij be&euml;indiging van uw dienstverband om welke reden dan ook, geeft u alle eigendommen terug aan het Bedrijf; documenten, en</p>\r\n            \r\n            <p>papier, zowel origineel als kopie&euml;n daarvan, inclusief eventuele monsters, literatuur, contracten, bescheiden, lijsten, tekeningen, blauwdrukken,</p>\r\n            \r\n            <p>brieven, notities, gegevens en dergelijke; en Vertrouwelijke informatie, in uw bezit of onder uw controle met betrekking tot uw</p>\r\n            \r\n            <p>werkgelegenheid of de zakelijke aangelegenheden van klanten.</p>\r\n            <p>11. Vertrouwelijke informatie</p>\r\n            \r\n            <p>11. 1 Tijdens uw dienstverband bij het Bedrijf besteedt u al uw tijd, aandacht en vaardigheden naar uw beste vermogen aan:</p>\r\n            \r\n            <p>zijn zaken. U mag zich niet, direct of indirect, inlaten met of verbonden zijn met, betrokken zijn bij, betrokken zijn bij, in dienst zijn van of</p>\r\n            \r\n            <p>tijd doorbrengen of een studie volgen, zonder voorafgaande toestemming van het bedrijf.bezig met een ander bedrijf of</p>\r\n            \r\n            <p>werkzaamheden of enige andere functie of werk in deeltijd of het volgen van welke opleiding dan ook, zonder voorafgaande toestemming van de</p>\r\n            \r\n            <p>Bedrijf.</p>\r\n            \r\n            <p>11.2 U moet altijd de hoogste graad van vertrouwelijkheid handhaven en de records, documenten en andere</p>\r\n            \r\n            <p>Vertrouwelijke informatie met betrekking tot het bedrijf van het bedrijf die u op enigerlei wijze bekend is of in vertrouwen is genomen</p>\r\n            \r\n            <p>en u zult dergelijke records, documenten en informatie alleen gebruiken op een naar behoren gemachtigde manier in het belang van het bedrijf. Voor</p>\r\n            \r\n            <p>de doeleinden van deze clausule Vertrouwelijke informatiebetekent informatie over het bedrijf van het bedrijf en dat van zijn klanten</p>\r\n            \r\n            <p>die niet beschikbaar is voor het grote publiek en die u tijdens uw dienstverband kunt leren. Dit bevat,</p>\r\n            \r\n            <p>maar is niet beperkt tot informatie met betrekking tot de organisatie, haar klantenlijsten, werkgelegenheidsbeleid, personeel en informatie</p>\r\n            \r\n            <p>over de producten, processen van het bedrijf, inclusief idee&euml;n, concepten, projecties, technologie, handleidingen, tekeningen, ontwerpen,</p>\r\n            \r\n            <p>specificaties, en alle papieren, cvs, dossiers en andere documenten die dergelijke vertrouwelijke informatie bevatten.</p>\r\n            \r\n            <p>11.3 U verwijdert nooit vertrouwelijke informatie van het kantoor zonder toestemming.</p>\r\n            \r\n            <p>11.4 Uw plicht om te beschermen en niet openbaar te maken</p>\r\n            \r\n            <p>e Vertrouwelijke informatie blijft van kracht na het verstrijken of be&euml;indigen van deze Overeenkomst en/of uw dienstverband bij het Bedrijf.</p>\r\n            \r\n            <p>11.5 Schending van de voorwaarden van deze clausule maakt u aansprakelijk voor ontslag op staande voet op grond van de bovenstaande clausule, naast eventuele:</p>\r\n            \r\n            <p>ander rechtsmiddel dat het Bedrijf volgens de wet tegen u heeft.</p>\r\n            <p>12. Kennisgevingen</p>\r\n            \r\n            <p>Kennisgevingen kunnen door u aan het Bedrijf worden gedaan op het adres van de maatschappelijke zetel. Kennisgevingen kunnen door het bedrijf aan u worden gedaan op:</p>\r\n            \r\n            <p>het door u opgegeven adres in de offici&euml;le administratie.</p>\r\n            \r\n            \r\n            \r\n            <p>13. Toepasselijkheid van het bedrijfsbeleid</p>\r\n            \r\n            <p>Het bedrijf heeft het recht om van tijd tot tijd beleidsverklaringen af ​​te leggen met betrekking tot zaken als verlofrecht, moederschap</p>\r\n            \r\n            <p>verlof, werknemersvoordelen, werkuren, transferbeleid, enz., en kan deze van tijd tot tijd naar eigen goeddunken wijzigen.</p>\r\n            \r\n            <p>Al dergelijke beleidsbeslissingen van het Bedrijf zijn bindend voor u en hebben voorrang op deze Overeenkomst in die mate.</p>\r\n            \r\n            \r\n            \r\n            <p>14. Toepasselijk recht/jurisdictie</p>\r\n            \r\n            <p>Uw dienstverband bij het bedrijf is onderworpen aan de landelijke wetgeving. Alle geschillen zijn onderworpen aan de jurisdictie van de High Court</p>\r\n            \r\n            <p>Alleen Gujarat.</p>\r\n            \r\n            \r\n            \r\n            <p>15. Aanvaarding van ons aanbod</p>\r\n            \r\n            <p>Bevestig uw aanvaarding van deze arbeidsovereenkomst door het duplicaat te ondertekenen en terug te sturen.</p>\r\n            \r\n            \r\n            \r\n            <p>Wij heten u van harte welkom en kijken ernaar uit uw acceptatie te ontvangen en met u samen te werken.</p>\r\n            \r\n            \r\n            \r\n            <p>Hoogachtend,</p>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>{date}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15');
INSERT INTO `joining_letters` (`id`, `lang`, `content`, `created_by`, `created_at`, `updated_at`) VALUES
(11, 'pl', '<h3 style=\"text-align: center;\">Dołączanie listu</h3>\r\n            \r\n            <p>{date }</p>\r\n            \r\n            <p>{employee_name }</p>\r\n            \r\n            <p>{address }</p>\r\n            \r\n            \r\n            <p>Dotyczy: mianowania na stanowisko {designation}</p>\r\n            \r\n            <p>Szanowny {employee_name },</p>\r\n            \r\n            <p>Mamy przyjemność zaoferować Państwu, stanowisko {designation} z {app_name } \"Sp&oacute;łka\" na poniższych warunkach i</p>\r\n            <p>warunki:</p>\r\n            \r\n            <p>1. Rozpoczęcie pracy</p>\r\n            \r\n            <p>Twoje zatrudnienie będzie skuteczne, jak na {start_date }</p>\r\n            \r\n            <p>2. Tytuł zadania</p>\r\n            <p>Tw&oacute;j tytuł pracy to {designation}.</p>\r\n            \r\n            <p>3. Salary</p>\r\n            \r\n            <p>Twoje wynagrodzenie i inne świadczenia będą określone w Zestawieniu 1, do niniejszego rozporządzenia.</p>\r\n            \r\n            \r\n            <p>4. Miejsce delegowania</p>\r\n            <p>Użytkownik zostanie opublikowany w {branch }. Użytkownik może jednak być zobowiązany do pracy w dowolnym miejscu prowadzenia działalności, kt&oacute;re Sp&oacute;łka posiada, lub może p&oacute;źniej nabyć.</p>\r\n            \r\n            <p>5. Godziny pracy</p>\r\n            <p>Normalne dni robocze są od poniedziałku do piątku. Będziesz zobowiązany do pracy na takie godziny, jakie są niezbędne do prawidłowego wywiązania się ze swoich obowiązk&oacute;w wobec Sp&oacute;łki. Normalne godziny pracy to {start_time } do {end_time }, a użytkownik oczekuje, że będzie pracować nie mniej niż {total_hours } godzin tygodniowo, a jeśli to konieczne, przez dodatkowe godziny w zależności od Twojego</p>\r\n            <p>odpowiedzialności.</p>\r\n            \r\n            <p>6. Urlop/Wakacje</p>\r\n            \r\n            <p>6.1 Przysługuje prawo do urlopu dorywczego w ciągu 12 dni.</p>\r\n            \r\n            <p>6.2 Użytkownik ma prawo do 12 dni roboczych od wypłatnego zwolnienia chorobowego.</p>\r\n            \r\n            <p>6.3 Sp&oacute;łka powiadamia na początku każdego roku wykaz ogłoszonych świąt.&nbsp;</p>\r\n            \r\n            \r\n            \r\n            <p>7. Rodzaj obowiązk&oacute;w</p>\r\n            \r\n            <p>Będziesz wykonywać na najlepsze ze swojej zdolności wszystkie obowiązki, jak są one nieodłączne w swoim poście i takie dodatkowe obowiązki, jak firma może zadzwonić do wykonania, od czasu do czasu. Państwa szczeg&oacute;lne obowiązki są określone w załączniku II do niniejszego rozporządzenia.</p>\r\n            \r\n            \r\n            \r\n            <p>8. Właściwość przedsiębiorstwa</p>\r\n            \r\n            <p>Zawsze będziesz utrzymywać w dobrej kondycji Firmy, kt&oacute;ra może być powierzona do użytku służbowego w trakcie trwania</p>\r\n            \r\n            <p>Twoje zatrudnienie, i zwr&oacute;ci wszystkie takie nieruchomości do Sp&oacute;łki przed zrzeczeniem się opłaty, w przeciwnym razie koszty te same będą odzyskane od Ciebie przez Sp&oacute;łkę.</p>\r\n            \r\n            <p>9. Wypożyczanie/akceptowanie prezent&oacute;w</p>\r\n            \r\n            <p>Nie będziesz pożyczał ani nie akceptować żadnych pieniędzy, dar&oacute;w, nagrody lub odszkodowania za swoje osobiste zyski z lub w inny spos&oacute;b złożyć się w ramach zobowiązania pieniężnego do jakiejkolwiek osoby/klienta, z kt&oacute;rym może być posiadanie oficjalne relacje.</p>\r\n            <p>10. Zakończenie</p>\r\n            \r\n            <p>10.1 Powołanie może zostać wypowiedziane przez Sp&oacute;łkę, bez względu na przyczynę, poprzez podanie nie mniej niż [ Zawiadomienie] miesięcy uprzedniego wypowiedzenia na piśmie lub wynagrodzenia w miejsce jego wystąpienia. Dla cel&oacute;w niniejszej klauzuli, wynagrodzenie oznacza wynagrodzenie podstawowe.</p>\r\n            \r\n            <p>10.2 Użytkownik może rozwiązać umowę o pracę ze Sp&oacute;łką, bez jakiejkolwiek przyczyny, podając nie mniej niż [ ogłoszenie o pracowniku] miesiące przed powiadomieniem lub wynagrodzeniem za niezaoszczędzony okres, pozostawiony po skorygowaniu oczekujących liści, jak na dzień.</p>\r\n            \r\n            <p>10.3 Sp&oacute;łka zastrzega sobie prawo do wypowiedzenia umowy o pracę bez okresu wypowiedzenia lub wypłaty z tytułu rozwiązania umowy, jeżeli ma on uzasadnione podstawy, aby sądzić, że jesteś winny wykroczenia lub niedbalstwa, lub popełnił jakiekolwiek istotne naruszenie umowy lub spowodował jakiekolwiek straty w Sp&oacute;łce.&nbsp;</p>\r\n            \r\n            <p>10. 4 W sprawie rozwiązania stosunku pracy z jakiegokolwiek powodu, powr&oacute;cisz do Sp&oacute;łki wszystkie nieruchomości; dokumenty, i&nbsp;</p>\r\n            \r\n            <p>papieru, zar&oacute;wno oryginału, jak i jego kopii, w tym wszelkich pr&oacute;bek, literatury, um&oacute;w, zapis&oacute;w, wykaz&oacute;w, rysunk&oacute;w, konspekt&oacute;w,</p>\r\n            \r\n            <p>listy, notatki, dane i podobne; informacje poufne, znajdujące się w posiadaniu lub pod Twoją kontrolą związane z zatrudnieniem lub sprawami biznesowymi klient&oacute;w.&nbsp; &nbsp;</p>\r\n            \r\n            \r\n            \r\n            <p>11. Informacje poufne</p>\r\n            \r\n            <p>11. 1 Podczas swojego zatrudnienia z Firmą poświęcisz cały czas, uwagę i umiejętności na najlepszą z Twoich możliwości</p>\r\n            \r\n            <p>swojej działalności gospodarczej. Użytkownik nie może, bezpośrednio lub pośrednio, prowadzić lub wiązać się z, być związany z, dotyka, zatrudniony lub czas lub prowadzić jakikolwiek kierunek studi&oacute;w, bez uprzedniej zgody Company.zaangażował się w innej działalności gospodarczej lub działalności lub jakikolwiek inny post lub pracy w niepełnym wymiarze czasu lub prowadzić jakikolwiek kierunek studi&oacute;w, bez uprzedniej zgody</p>\r\n            \r\n            <p>Firma.</p>\r\n            \r\n            <p>11.2 Zawsze musisz zachować najwyższy stopień poufności i zachować jako poufny akt, dokumenty, i inne&nbsp;</p>\r\n            \r\n            <p>Informacje poufne dotyczące działalności Sp&oacute;łki, kt&oacute;re mogą być znane Państwu lub w dowolny spos&oacute;b zwierzyny, a Użytkownik będzie posługiwać się takimi zapisami, dokumentami i informacjami tylko w spos&oacute;b należycie autoryzowany w interesie Sp&oacute;łki. Do cel&oacute;w niniejszej klauzuli \"Informacje poufne\" oznaczają informacje o działalności Sp&oacute;łki oraz o jej klientach, kt&oacute;re nie są dostępne dla og&oacute;łu społeczeństwa i kt&oacute;re mogą być przez Państwa w trakcie zatrudnienia dowiedzione przez Państwa. Obejmuje to,</p>\r\n            \r\n            <p>ale nie ogranicza się do informacji związanych z organizacją, jej listami klient&oacute;w, politykami zatrudnienia, personelem oraz informacjami o produktach firmy, procesach, w tym pomysłach, koncepcjach, projekcjach, technikach, podręcznikach, rysunkach, projektach,&nbsp;</p>\r\n            \r\n            <p>specyfikacje, a także wszystkie dokumenty, życiorysy, zapisy i inne dokumenty zawierające takie informacje poufne.</p>\r\n            \r\n            <p>11.3 W żadnym momencie nie usunie Pan żadnych Informacji Poufnych z urzędu bez zezwolenia.</p>\r\n            \r\n            <p>11.4 Tw&oacute;j obowiązek ochrony a nie disclos</p>\r\n            \r\n            <p>Informacje poufne przetrwają wygaśnięcie lub rozwiązanie niniejszej Umowy i/lub Twoje zatrudnienie w Sp&oacute;łce.</p>\r\n            \r\n            <p>11.5 Naruszenie warunk&oacute;w niniejszej klauzuli spowoduje, że Użytkownik będzie zobowiązany do skr&oacute;conej umowy w ramach klauzuli powyżej, opr&oacute;cz wszelkich innych środk&oacute;w zaradcze, jakie Sp&oacute;łka może mieć przeciwko Państwu w prawie.</p>\r\n            \r\n            \r\n            \r\n            <p>12. Uwagi</p>\r\n            \r\n            <p>Ogłoszenia mogą być podane przez Państwa do Sp&oacute;łki pod adresem jej siedziby. Ogłoszenia mogą być podane przez Sp&oacute;łkę do Państwa na adres intymniony przez Państwa w ewidencji urzędowej.</p>\r\n            \r\n            \r\n            \r\n            <p>13. Stosowność polityki firmy</p>\r\n            \r\n            <p>Sp&oacute;łka jest uprawniona do składania deklaracji politycznych od czasu do czasu dotyczących spraw takich jak prawo do urlopu macierzyńskiego, macierzyństwo</p>\r\n            \r\n            <p>urlop&oacute;w, świadczeń pracowniczych, godzin pracy, polityki transferowej itp., a także mogą zmieniać to samo od czasu do czasu według własnego uznania.</p>\r\n            \r\n            <p>Wszystkie takie decyzje polityczne Sp&oacute;łki są wiążące dla Państwa i przesłaniają niniejszą Umowę w tym zakresie.</p>\r\n            \r\n            \r\n            \r\n            <p>14. Prawo właściwe/jurysdykcja</p>\r\n            \r\n            <p>Twoje zatrudnienie ze Sp&oacute;łką podlega prawu krajowi. Wszelkie spory podlegają właściwości Sądu Najwyższego</p>\r\n            \r\n            <p>Tylko Gujarat.</p>\r\n            \r\n            \r\n            \r\n            <p>15. Akceptacja naszej oferty</p>\r\n            \r\n            <p>Prosimy o potwierdzenie przyjęcia niniejszej Umowy o pracę poprzez podpisanie i zwr&oacute;cenie duplikatu.</p>\r\n            \r\n            \r\n            \r\n            <p>Zapraszamy Państwa i czekamy na Państwa przyjęcie i wsp&oacute;łpracę z Tobą.</p>\r\n            \r\n            \r\n            \r\n            <p>Z Państwa Sincerely,</p>\r\n            \r\n            <p>{app_name }</p>\r\n            \r\n            <p>{date }</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(12, 'pt', '<h3 style=\"text-align: center;\">Carta De Ades&atilde;o</h3>\r\n            \r\n            <p>{data}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{address}</p>\r\n            \r\n            \r\n            <p>Assunto: Nomea&ccedil;&atilde;o para o cargo de {designation}</p>\r\n            \r\n            <p>Querido {employee_name},</p>\r\n            \r\n            \r\n            <p>Temos o prazer de oferec&ecirc;-lo, a posi&ccedil;&atilde;o de {designation} com {app_name} a Empresa nos seguintes termos e</p>\r\n            <p>condi&ccedil;&otilde;es:</p>\r\n            \r\n            \r\n            <p>1. Comentamento do emprego</p>\r\n            \r\n            <p>Seu emprego ser&aacute; efetivo, a partir de {start_date}</p>\r\n            \r\n            \r\n            <p>2. T&iacute;tulo do emprego</p>\r\n            \r\n            <p>Seu cargo de trabalho ser&aacute; {designation}.</p>\r\n            \r\n            <p>3. Sal&aacute;rio</p>\r\n            \r\n            <p>Seu sal&aacute;rio e outros benef&iacute;cios ser&atilde;o conforme estabelecido no Planejamento 1, hereto.</p>\r\n            \r\n            <p>4. Local de postagem</p>\r\n            \r\n            <p>Voc&ecirc; ser&aacute; postado em {branch}. Voc&ecirc; pode, no entanto, ser obrigado a trabalhar em qualquer local de neg&oacute;cios que a Empresa tenha, ou possa posteriormente adquirir.</p>\r\n            \r\n            <p>5. Horas de Trabalho</p>\r\n            \r\n            <p>Os dias normais de trabalho s&atilde;o de segunda a sexta-feira. Voc&ecirc; ser&aacute; obrigado a trabalhar por tais horas, conforme necess&aacute;rio para a quita&ccedil;&atilde;o adequada de suas fun&ccedil;&otilde;es para a Companhia. As horas de trabalho normais s&atilde;o de {start_time} para {end_time} e voc&ecirc; deve trabalhar n&atilde;o menos de {total_horas} horas semanais, e se necess&aacute;rio para horas adicionais dependendo do seu</p>\r\n            <p>responsabilidades.</p>\r\n            \r\n            <p>6. Leave / Holidays</p>\r\n            \r\n            <p>6,1 Voc&ecirc; tem direito a licen&ccedil;a casual de 12 dias.</p>\r\n            \r\n            <p>6,2 Voc&ecirc; tem direito a 12 dias &uacute;teis de licen&ccedil;a remunerada remunerada.</p>\r\n            \r\n            <p>6,3 Companhia notificar&aacute; uma lista de feriados declarados no in&iacute;cio de cada ano.&nbsp;</p>\r\n            \r\n            \r\n            \r\n            <p>7. Natureza dos deveres</p>\r\n            \r\n            <p>Voc&ecirc; ir&aacute; executar ao melhor da sua habilidade todos os deveres como s&atilde;o inerentes ao seu cargo e tais deveres adicionais como a empresa pode ligar sobre voc&ecirc; para executar, de tempos em tempos. Os seus deveres espec&iacute;ficos s&atilde;o estabelecidos no Hereto do Planejamento II.</p>\r\n            \r\n            \r\n            \r\n            <p>8. Propriedade da empresa</p>\r\n            \r\n            <p>Voc&ecirc; sempre manter&aacute; em bom estado propriedade Empresa, que poder&aacute; ser confiada a voc&ecirc; para uso oficial durante o curso de</p>\r\n            \r\n            <p>o seu emprego, e devolver&aacute; toda essa propriedade &agrave; Companhia antes de abdicar de sua acusa&ccedil;&atilde;o, falhando qual o custo do mesmo ser&aacute; recuperado de voc&ecirc; pela Companhia.</p>\r\n            \r\n            \r\n            \r\n            <p>9. Borremir / aceitar presentes</p>\r\n            \r\n            <p>Voc&ecirc; n&atilde;o vai pedir empr&eacute;stimo ou aceitar qualquer dinheiro, presente, recompensa ou indeniza&ccedil;&atilde;o por seus ganhos pessoais de ou de outra forma colocar-se sob obriga&ccedil;&atilde;o pecuni&aacute;ria a qualquer pessoa / cliente com quem voc&ecirc; pode estar tendo rela&ccedil;&otilde;es oficiais.</p>\r\n            \r\n            \r\n            \r\n            <p>10. Termina&ccedil;&atilde;o</p>\r\n            \r\n            <p>10,1 Sua nomea&ccedil;&atilde;o pode ser rescindida pela Companhia, sem qualquer raz&atilde;o, dando-lhe n&atilde;o menos do que [aviso] meses de aviso pr&eacute;vio por escrito ou de sal&aacute;rio em lieu deste. Para efeito da presente cl&aacute;usula, o sal&aacute;rio deve significar sal&aacute;rio base.</p>\r\n            \r\n            <p>10,2 Voc&ecirc; pode rescindir seu emprego com a Companhia, sem qualquer causa, ao dar nada menos que [Aviso de contrata&ccedil;&atilde;o] meses de aviso pr&eacute;vio ou sal&aacute;rio para o per&iacute;odo n&atilde;o salvo, deixado ap&oacute;s ajuste de folhas pendentes, conforme data de encontro.</p>\r\n            \r\n            <p>10,3 Empresa reserva-se o direito de rescindir o seu emprego sumariamente sem qualquer prazo de aviso ou de rescis&atilde;o se tiver terreno razo&aacute;vel para acreditar que voc&ecirc; &eacute; culpado de m&aacute; conduta ou neglig&ecirc;ncia, ou tenha cometido qualquer viola&ccedil;&atilde;o fundamental de contrato, ou tenha causado qualquer perda para a Empresa.&nbsp;</p>\r\n            \r\n            <p>10. 4 Sobre a rescis&atilde;o do seu emprego por qualquer motivo, voc&ecirc; retornar&aacute; para a Empresa todos os bens; documentos e&nbsp;</p>\r\n            \r\n            <p>papel, tanto originais como c&oacute;pias dos mesmos, incluindo quaisquer amostras, literatura, contratos, registros, listas, desenhos, plantas,</p>\r\n            \r\n            <p>cartas, notas, dados e semelhantes; e Informa&ccedil;&otilde;es Confidenciais, em sua posse ou sob seu controle relacionado ao seu emprego ou aos neg&oacute;cios de neg&oacute;cios dos clientes.&nbsp; &nbsp;</p>\r\n            \r\n            \r\n            \r\n            <p>11. Informa&ccedil;&otilde;es Confidenciais</p>\r\n            \r\n            <p>11. 1 Durante o seu emprego com a Companhia voc&ecirc; ir&aacute; dedicar todo o seu tempo, aten&ccedil;&atilde;o e habilidade para o melhor de sua capacidade de</p>\r\n            \r\n            <p>o seu neg&oacute;cio. Voc&ecirc; n&atilde;o deve, direta ou indiretamente, se envolver ou associar-se com, estar conectado com, preocupado, empregado, ou tempo ou prosseguir qualquer curso de estudo, sem a permiss&atilde;o pr&eacute;via do Company.engajado em qualquer outro neg&oacute;cio ou atividades ou qualquer outro cargo ou trabalho parcial ou prosseguir qualquer curso de estudo, sem a permiss&atilde;o pr&eacute;via do</p>\r\n            \r\n            <p>Empresa.</p>\r\n            \r\n            <p>11,2 &Eacute; preciso manter sempre o mais alto grau de confidencialidade e manter como confidenciais os registros, documentos e outros&nbsp;</p>\r\n            \r\n            <p>Informa&ccedil;&otilde;es confidenciais relativas ao neg&oacute;cio da Companhia que possam ser conhecidas por voc&ecirc; ou confiadas em voc&ecirc; por qualquer meio e utilizar&atilde;o tais registros, documentos e informa&ccedil;&otilde;es apenas de forma devidamente autorizada no interesse da Companhia. Para efeitos da presente cl&aacute;usula \"Informa&ccedil;&otilde;es confidenciais\" significa informa&ccedil;&atilde;o sobre os neg&oacute;cios da Companhia e a dos seus clientes que n&atilde;o est&aacute; dispon&iacute;vel para o p&uacute;blico em geral e que poder&aacute; ser aprendida por voc&ecirc; no curso do seu emprego. Isso inclui,</p>\r\n            \r\n            <p>mas n&atilde;o se limita a, informa&ccedil;&otilde;es relativas &agrave; organiza&ccedil;&atilde;o, suas listas de clientes, pol&iacute;ticas de emprego, pessoal, e informa&ccedil;&otilde;es sobre os produtos da Companhia, processos incluindo ideias, conceitos, proje&ccedil;&otilde;es, tecnologia, manuais, desenho, desenhos,&nbsp;</p>\r\n            \r\n            <p>especifica&ccedil;&otilde;es, e todos os pap&eacute;is, curr&iacute;culos, registros e outros documentos que contenham tais Informa&ccedil;&otilde;es Confidenciais.</p>\r\n            \r\n            <p>11,3 Em nenhum momento, voc&ecirc; remover&aacute; quaisquer Informa&ccedil;&otilde;es Confidenciais do escrit&oacute;rio sem permiss&atilde;o.</p>\r\n            \r\n            <p>11,4 O seu dever de salvaguardar e n&atilde;o os desclos</p>\r\n            \r\n            <p>Informa&ccedil;&otilde;es Confidenciais sobreviver&atilde;o &agrave; expira&ccedil;&atilde;o ou &agrave; rescis&atilde;o deste Contrato e / ou do seu emprego com a Companhia.</p>\r\n            \r\n            <p>11,5 Viola&ccedil;&atilde;o das condi&ccedil;&otilde;es desta cl&aacute;usula ir&aacute; torn&aacute;-lo sujeito a demiss&atilde;o sum&aacute;ria sob a cl&aacute;usula acima, al&eacute;m de qualquer outro rem&eacute;dio que a Companhia possa ter contra voc&ecirc; em lei.</p>\r\n            \r\n            \r\n            \r\n            <p>12. Notices</p>\r\n            \r\n            <p>Os avisos podem ser conferidos por voc&ecirc; &agrave; Empresa em seu endere&ccedil;o de escrit&oacute;rio registrado. Os avisos podem ser conferidos pela Companhia a voc&ecirc; no endere&ccedil;o intimado por voc&ecirc; nos registros oficiais.</p>\r\n            \r\n            \r\n            \r\n            <p>13. Aplicabilidade da Pol&iacute;tica da Empresa</p>\r\n            \r\n            <p>A Companhia tem direito a fazer declara&ccedil;&otilde;es de pol&iacute;tica de tempos em tempos relativos a mat&eacute;rias como licen&ccedil;a de licen&ccedil;a, maternidade</p>\r\n            \r\n            <p>sair, benef&iacute;cios dos empregados, horas de trabalho, pol&iacute;ticas de transfer&ecirc;ncia, etc., e pode alterar o mesmo de vez em quando a seu exclusivo crit&eacute;rio.</p>\r\n            \r\n            <p>Todas essas decis&otilde;es de pol&iacute;tica da Companhia devem ser vinculativas para si e substituir&atilde;o este Acordo nessa medida.</p>\r\n            \r\n            \r\n            \r\n            <p>14. Direito / Jurisdi&ccedil;&atilde;o</p>\r\n            \r\n            <p>Seu emprego com a Companhia est&aacute; sujeito &agrave;s leis do Pa&iacute;s. Todas as disputas est&atilde;o sujeitas &agrave; jurisdi&ccedil;&atilde;o do Tribunal Superior</p>\r\n            \r\n            <p>Gujarat apenas.</p>\r\n            \r\n            \r\n            \r\n            <p>15. Aceita&ccedil;&atilde;o da nossa oferta</p>\r\n            \r\n            <p>Por favor, confirme sua aceita&ccedil;&atilde;o deste Contrato de Emprego assinando e retornando a c&oacute;pia duplicada.</p>\r\n            \r\n            \r\n            \r\n            <p>N&oacute;s acolhemos voc&ecirc; e estamos ansiosos para receber sua aceita&ccedil;&atilde;o e para trabalhar com voc&ecirc;.</p>\r\n            \r\n            \r\n            \r\n            <p>Seu Sinceramente,</p>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>{data}</p>\r\n            ', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(13, 'ru', '<h3 style=\"text-align: center;\">Присоединение к письму</h3>\r\n            \r\n            <p>{date}</p>\r\n            \r\n            <p>{ employee_name }</p>\r\n            <p>{address}</p>\r\n            \r\n            <p>Тема: Назначение на должность {designation}</p>\r\n            \r\n            <p>Уважаемый { employee_name },</p>\r\n            \r\n            <p>Мы рады предложить Вам, позицию {designation} с { app_name } Компания на следующих условиях и</p>\r\n            \r\n            <p>условия:</p>\r\n            \r\n            \r\n            <p>1. Начало работы</p>\r\n            \r\n            <p>Ваше трудоустройство будет эффективным, начиная с { start_date }</p>\r\n            \r\n            \r\n            <p>2. Название должности</p>\r\n            <p>Ваш заголовок задания будет {designation}.</p>\r\n            \r\n            <p>3. Зарплата</p>\r\n            <p>Ваши оклады и другие пособия будут установлены в соответствии с расписанием, изложенным в приложении 1 к настоящему.</p>\r\n            \r\n            <p>4. Место размещения</p>\r\n            <p>Вы будете работать в { branch }. Вы, однако, можете работать в любом месте, которое компания имеет или может впоследствии приобрести.</p>\r\n            \r\n            \r\n            \r\n            <p>5. Часы работы</p>\r\n            <p>Обычные рабочие дни-с понедельника по пятницу. Вы должны будете работать в течение таких часов, как это необходимо для надлежащего выполнения Ваших обязанностей перед компанией. Обычные рабочие часы-от { start_time } до { end_time }, и вы, как ожидается, будут работать не менее { total_hours } часов каждую неделю, и при необходимости в течение дополнительных часов в зависимости от вашего</p>\r\n            <p>ответственности.</p>\r\n            <p>6. Отпуск/Праздники</p>\r\n            \r\n            <p>6.1 Вы имеете право на случайный отпуск продолжительностью 12 дней.</p>\r\n            \r\n            <p>6.2 Вы имеете право на 12 рабочих дней оплачиваемого отпуска по болезни.</p>\r\n            \r\n            <p>6.3 Компания в начале каждого года уведомляет об объявленных праздниках.&nbsp;</p>\r\n            \r\n            \r\n            \r\n            <p>7. Характер обязанностей</p>\r\n            \r\n            <p>Вы будете выполнять все обязанности, присующие вам, и такие дополнительные обязанности, которые компания может призвать к вам, время от времени. Ваши конкретные обязанности изложены в приложении II к настоящему.</p>\r\n            \r\n            \r\n            \r\n            <p>8. Свойство компании</p>\r\n            \r\n            <p>Вы всегда будете поддерживать в хорошем состоянии имущество Компании, которое может быть доверено Вам для служебного пользования в течение</p>\r\n            \r\n            <p>вашей занятости, и возвратит все это имущество Компании до отказа от вашего заряда, при отсутствии которого стоимость одного и того же имущества будет взыскана с Вас компанией.</p>\r\n            \r\n            \r\n            \r\n            <p>9. Боровить/принять подарки</p>\r\n            \r\n            <p>Вы не будете брать взаймы или принимать какие-либо деньги, подарки, вознаграждение или компенсацию за ваши личные доходы от или в ином месте под денежный долг любому лицу/клиенту, с которым у вас могут быть официальные сделки.</p>\r\n            \r\n            \r\n            \r\n            <p>10. Прекращение</p>\r\n            \r\n            <p>10.1 Ваше назначение может быть прекращено компанией без каких бы то ни было оснований, предоставляя Вам не менее [ Уведомление] месяцев, предшея уведомлению в письменной форме или окладе вместо них. Для целей этого положения заработная плата означает базовый оклад.</p>\r\n            \r\n            <p>10.2 Вы можете прекратить свою трудовую деятельность с компанией без каких-либо причин, предоставляя не меньше, чем [ Employee Notice] months  предварительное уведомление или оклад за несохраненный период, оставатся после корректировки отложенных листьев, как на сегодняшний день.</p>\r\n            \r\n            <p>10.3 Компания оставляет за собой право прекратить вашу работу в суммарном порядке без какого-либо уведомления о сроке или увольнении, если у нее есть достаточные основания полагать, что вы виновны в проступке или халатности, или совершили какое-либо существенное нарушение договора, или причинило убытки Компании.&nbsp;</p>\r\n            \r\n            <p>10. 4 О прекращении вашей работы по какой бы то ни было причине вы вернетесь в Компании все имущество; документы, а&nbsp;</p>\r\n            \r\n            <p>бумаги, как оригинальные, так и их копии, включая любые образцы, литературу, контракты, записи, списки, чертежи, чертежи,</p>\r\n            \r\n            <p>письма, заметки, данные и тому подобное; и Конфиденциальная информация, в вашем распоряжении или под вашим контролем, связанным с вашей работой или деловыми делами клиентов.&nbsp; &nbsp;</p>\r\n            \r\n            \r\n            \r\n            <p>11. Конфиденциальная информация</p>\r\n            \r\n            <p>11. 1 Во время вашего трудоустройства с компанией Вы посвяте все свое время, внимание, умение максимально</p>\r\n            \r\n            <p>Его бизнес. Вы не должны, прямо или косвенно, заниматься или ассоциировать себя с заинтересованными, занятым, занятым, или временем, или продолжать любой курс обучения, без предварительного разрешения Компани.заниматься каким-либо другим бизнесом или деятельностью или любой другой пост или работать неполный рабочий день или заниматься какой бы то ни было исследованием, без предварительного разрешения</p>\r\n            \r\n            <p>Компания.</p>\r\n            \r\n            <p>11.2 Вы всегда должны сохранять наивысшую степень конфиденциальности и хранить в качестве конфиденциальной записи, документы и другие&nbsp;</p>\r\n            \r\n            <p>Конфиденциальная информация, касающаяся бизнеса Компании, которая может быть вам известна или конфиденциальна любым способом, и Вы будете использовать такие записи, документы и информацию только в установленном порядке в интересах Компании. Для целей настоящей статьи \"Конфиденциальная информация\" означает информацию о бизнесе Компании и о ее клиентах, которая недоступна для широкой общественности и которая может быть изучилась Вами в ходе вашей работы. Это включает в себя:</p>\r\n            \r\n            <p>но не ограничивается информацией, касающейся организации, ее списков клиентов, политики в области занятости, персонала и информации о продуктах Компании, процессах, включая идеи, концепции, прогнозы, технологии, руководства, чертеж, чертеж,&nbsp;</p>\r\n            \r\n            <p>спецификации, и все бумаги, резюме, записи и другие документы, содержащие такую Конфиденциальную Информацию.</p>\r\n            \r\n            <p>11.3 В любое время вы не будете удалять конфиденциальную информацию из офиса без разрешения.</p>\r\n            \r\n            <p>11.4 Ваш долг защищать и не отсосать</p>\r\n            \r\n            <p>e Конфиденциальная информация выдержит срок действия или прекращения действия настоящего Соглашения и/или вашей работы с компанией.</p>\r\n            \r\n            <p>11.5 Нарушение условий, изложенных в настоящем положении, приведет к тому, что в дополнение к любым другим средствам правовой защиты, которые компания может иметь против вас, в соответствии с вышеприведенным положением, вы можете получить краткое увольнение в соответствии с этим положением.</p>\r\n            \r\n            \r\n            \r\n            <p>12. Замечания</p>\r\n            \r\n            <p>Уведомления могут быть даны Вами Компании по адресу ее зарегистрированного офиса. Извещения могут быть даны компанией Вам по адресу, с которым вы в официальных отчетах.</p>\r\n            \r\n            \r\n            \r\n            <p>13. Применимость политики компании</p>\r\n            \r\n            <p>Компания вправе время от времени делать политические заявления по таким вопросам, как право на отпуск, материнство</p>\r\n            \r\n            <p>отпуска, пособия для работников, продолжительность рабочего дня, трансферная политика и т.д. и время от времени могут изменяться исключительно по своему усмотрению.</p>\r\n            \r\n            <p>Все такие принципиальные решения Компании являются обязательными для Вас и переопределяют это Соглашение в такой степени.</p>\r\n            \r\n            \r\n            \r\n            <p>14. Регулирующий Право/юрисдикция</p>\r\n            \r\n            <p>Ваше трудоустройство с компанией подпадает под действие законов страны. Все споры подлежат юрисдикции Высокого суда</p>\r\n            \r\n            <p>Только Гуджарат.</p>\r\n            \r\n            \r\n            \r\n            <p>15. Принятие нашего предложения</p>\r\n            \r\n            <p>Пожалуйста, подтвердите свое согласие с этим Договором о занятости, подписав и возвращая дубликат копии.</p>\r\n            \r\n            \r\n            \r\n            <p>Мы приветствуем Вас и надеемся на то, что Вы принимаете свое согласие и работаете с Вами.</p>\r\n            \r\n            \r\n            \r\n            <p>Искренне Ваш,</p>\r\n            \r\n            <p>{ app_name }</p>\r\n            \r\n            <p>{date}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(14, 'tr', '<h3 style=\"text-align: center;\">Katılma Mektubu</h3>\r\n            <p>{date}</p>\r\n            <p>{employee_name}</p>\r\n            <p>{address}</p>\r\n            <p>Konu: Kadroya randevu {designation}</p>\r\n            <p>Canım {employee_name},</p>\r\n            <p>konumunu size sunmaktan mutluluk duyuyoruz {designation} ile {app_name} Şirket aşağıdaki şartlarla ve</p>\r\n            <p>koşullar:</p>\r\n            <p>1. işe başlama</p>\r\n            <p>İşe alımınız şu tarihten itibaren etkili olacaktır {start_date}</p>\r\n            <p>2. İş unvanı</p>\r\n            <p>İş unvanınız olacak{designation}.</p>\r\n            <p>3. Maaş</p>\r\n            <p>Maaşınız ve diğer menfaatleriniz Programda belirtildiği gibi olacaktır 1, buraya.</p>\r\n            <p>4. Gönderme Yeri</p>\r\n            <p>adresinde yayınlanacaksınız {branch}. Ancak Şirketin sahip olduğu herhangi bir işyerinde çalışmanız gerekebilir veya</p>\r\n            <p>daha sonra edinebilir.</p>\r\n            <p>5. Çalışma saati</p>\r\n            <p>Normal çalışma günleri Pazartesiden Cumaya kadardır. için gerekli olan saatlerde çalışmanız istenecektir</p>\r\n            <p>Şirkete karşı görevlerinizi uygun şekilde yerine getirmek. Normal çalışma saatleri, {start_time} ile {end_time} ve sen</p>\r\n            <p>daha az çalışması beklenmiyor {total_hours} her hafta saat ve gerekirse, durumunuza bağlı olarak ek saatler</p>\r\n            <p>sorumluluklar.</p>\r\n            <p>6. İzin/Tatiller</p>\r\n            <p>6.1 12 gün izin hakkınız var.</p>\r\n            <p>6.2 12 iş günü ücretli hastalık izni hakkınız var.</p>\r\n            <p>6.3 Şirket, her yılın başında ilan edilen tatillerin bir listesini bildirecektir.</p>\r\n            <p>7. görevlerin niteliği</p>\r\n            <p>Görevinizin doğasında bulunan tüm görevleri ve şirket olarak bu tür ek görevleri elinizden gelen en iyi şekilde yerine getireceksiniz</p>\r\n            <p>zaman zaman performans göstermeniz için sizi çağırabilir. Özel görevleriniz, burada Çizelge IIde belirtilmiştir.</p>\r\n            <p>8. Şirket mülkiyeti</p>\r\n            <p>Görev süresince resmi kullanım için size emanet edilmiş olabilecek Şirket mallarını her zaman iyi durumda tutacaksınız</p>\r\n            <p>istihdamınızdan feragat etmeden önce bu tür tüm mülkleri Şirkete iade edecektir, aksi takdirde maliyet</p>\r\n            <p>aynı tutar Şirket tarafından sizden tahsil edilecektir.</p>\r\n            <p>9. Ödünç alma/hediye kabul etme</p>\r\n            <p>Kişisel kazançlarınız için kendinizden herhangi bir para, hediye, ödül veya tazminat ödünç almayacak veya kabul etmeyeceksiniz</p>\r\n            <p>resmi ilişkiler içinde olabileceğiniz herhangi bir kişiye/müşteriye karşı maddi yükümlülük altında.</p>\r\n            <p>10. Sonlandırma</p>\r\n            <p>10.1 Randevunuz Şirket tarafından size en az [Bildirim] ay öncesinden bildirimde bulunularak herhangi bir sebep göstermeksizin feshedilebilir</p>\r\n            <p>yazılı bildirim veya bunun yerine maaş. Bu maddenin amaçları doğrultusunda maaş, temel maaş anlamına gelir.</p>\r\n            <p>10.2 [Çalışan Bildirimi]nden daha az olmamak kaydıyla, Şirketteki çalışmanızı herhangi bir sebep göstermeden feshedebilirsiniz</p>\r\n            <p>ay önceden ihbar veya kaydedilmemiş dönem için maaş, tarih itibariyle bekleyen izinlerin ayarlanmasından sonra kalan.</p>\r\n            <p>10.3 Şirket, herhangi bir ihbar süresi veya fesih ödemesi olmaksızın iş akdinizi aniden feshetme hakkını saklı tutar</p>\r\n            <p>suiistimal veya ihmalden suçlu olduğunuza veya herhangi bir temel ihlalde bulunduğunuza inanmak için makul bir gerekçesi varsa</p>\r\n            <p>sözleşmeye veya Şirkete herhangi bir zarara neden oldu.</p>\r\n            <p>10. 4 Herhangi bir nedenle işinize son verildiğinde, tüm mal varlığınızı Şirkete iade edeceksiniz; belgeler ve</p>\r\n            <p>tüm numuneler, literatür, sözleşmeler, kayıtlar, listeler, çizimler, planlar dahil olmak üzere kağıt, hem orijinali hem de kopyaları,</p>\r\n            <p>mektuplar, notlar, veriler ve benzerleri; ve Gizli Bilgiler, sizin mülkiyetinizde veya kontrolünüz altında</p>\r\n            <p>İstihdam veya müşterilerin iş ilişkilerine.</p>\r\n            <p>11. Kesin bilgi</p>\r\n            <p>11. 1 Şirkette çalıştığınız süre boyunca tüm zamanınızı, dikkatinizi ve becerinizi elinizden gelenin en iyisini yapmaya adayacaksınız</p>\r\n            <p>onun işi. Doğrudan veya dolaylı olarak kendinizle ilişki kurmamalı veya ilişkilendirmemeli, bunlarla bağlantı kurmamalı, ilgilenmemeli, istihdam edilmemeli veya</p>\r\n            <p>Şirketin önceden izni olmaksızın herhangi bir eğitim kursuna devam etmeyin veya herhangi bir kursa devam etmeyin</p>\r\n            <p>faaliyetleri veya diğer herhangi bir görev veya yarı zamanlı çalışma veya önceden izin almaksızın herhangi bir eğitim kursuna devam etme</p>\r\n            <p>Şirket.</p>\r\n            <p>11.2 Her zaman en yüksek derecede gizliliği korumalı ve kayıtları, belgeleri ve diğer bilgileri gizli tutmalısınız.</p>\r\n            <p>Sizin tarafınızdan bilinebilecek veya herhangi bir şekilde size güvenilebilecek Şirketin işleriyle ilgili Gizli Bilgiler</p>\r\n            <p>ve bu tür kayıtları, belgeleri ve bilgileri yalnızca usulüne uygun olarak Şirketin çıkarları doğrultusunda kullanacaksınız. İçin</p>\r\n            <p>bu maddenin amaçları Gizli Bilgiler, Şirketin ve müşterilerinin işleri hakkında bilgi anlamına gelir</p>\r\n            <p>halka açık olmayan ve istihdamınız sırasında sizin tarafınızdan öğrenilebilecek olan. Bu içerir,</p>\r\n            <p>ancak bunlarla sınırlı olmamak üzere, kuruluşa ilişkin bilgiler, müşteri listeleri, istihdam politikaları, personel ve bilgiler</p>\r\n            <p>fikirler, kavramlar, projeksiyonlar, teknoloji, kılavuzlar, çizimler, tasarımlar dahil olmak üzere Şirketin ürünleri, süreçleri hakkında,</p>\r\n            <p>spesifikasyonlar ve bu tür Gizli Bilgileri içeren tüm belgeler, özgeçmişler, kayıtlar ve diğer belgeler.</p>\r\n            <p>11.3 Gizli Bilgileri hiçbir zaman izinsiz olarak ofisten çıkarmayacak mısınız?.</p>\r\n            <p>11.4 Koruma ve açıklamama göreviniz</p>\r\n            <p>e Gizli Bilgiler, bu Sözleşmenin sona ermesinden veya feshedilmesinden ve/veya Şirketteki istihdamınızdan sonra da geçerliliğini koruyacaktır.</p>\r\n            <p>11.5 Bu maddenin koşullarının ihlali, sizi herhangi bir ek olarak yukarıdaki madde uyarınca derhal işten çıkarmaya yükümlü kılacaktır</p>\r\n            <p>Şirketin kanunen size karşı sahip olabileceği diğer çareler.</p>\r\n            <p>12. Bildirimler</p>\r\n            <p>Tebligatlar tarafınızca Şirket in kayıtlı ofis adresine gönderilebilir. Bildirimler Şirket tarafından size şu adreste verilebilir</p>\r\n            <p>tResmi kayıtlarda sizin tarafınızdan bildirilen adres.</p>\r\n            <p>13. Şirket Politikasının Uygulanabilirliği</p>\r\n            <p>Şirket, izin hakkı, analık gibi konularda zaman zaman poliçe beyanı yapmaya yetkilidir</p>\r\n            <p>izinler, çalışanlara sağlanan faydalar, çalışma saatleri, transfer politikaları vb. ve tamamen kendi takdirine bağlı olarak zaman zaman değiştirebilir.</p>\r\n            <p>Şirketin tüm bu tür politika kararları sizin için bağlayıcı olacak ve bu Sözleşmeyi o ölçüde geçersiz kılacaktır.</p>\r\n            <p>14. Geçerli Yasa/Yargı Yetkisi</p>\r\n            <p>Şirkette istihdamınız Ülke yasalarına tabidir. Tüm ihtilaflar Yüksek Mahkemenin yargı yetkisine tabi olacaktır.</p>\r\n            <p>sadece Gujarat.</p>\r\n            <p>15. teklifimizin kabulü</p>\r\n            <p>Lütfen bu İş Sözleşmesini kabul ettiğinizi imzalayarak ve kopya kopyayı geri göndererek onaylayın.</p>\r\n            <p>Size hoş geldiniz diyor ve kabulünüzü almayı ve sizinle çalışmayı sabırsızlıkla bekliyoruz.</p>\r\n            <p>Saygılarımla,</p>\r\n            <p>{app_name}</p>\r\n            <p>{date}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(15, 'zh', '<h3 style=\"text-align: center;\">加盟信</h3>\r\n            <p>{date}</p>\r\n            <p>{employee_name}</p>\r\n            <p>{address}</p>\r\n            <p>主题：任命 {designation}</p>\r\n            <p>亲爱的 {employee_name},</p>\r\n            <p>我们很高兴为您提供以下职位： {designation} 和 {app_name} 公司按照以下条款和</p>\r\n            <p>状况:</p>\r\n            <p>1. 开始就业</p>\r\n            <p>您的雇佣关系将在以下日期生效 {start_date}</p>\r\n            <p>2. 职称</p>\r\n            <p>您的职位名称将是{designation}.</p>\r\n            <p>3. 薪水</p>\r\n            <p>您的工资和其他福利将在附表 1 中列出，此处为.</p>\r\n            <p>4. 发帖地点</p>\r\n            <p>您将被发布在 {branch}. 但是，您可能需要在公司拥有的任何营业地点工作，或者</p>\r\n            <p>以后可能会获得.</p>\r\n            <p>5. 几小时的工作</p>\r\n            <p>正常工作日为周一至周五。您将需要在必要的时间内工作</p>\r\n            <p>正确履行您对公司的职责。正常工作时间是从 {start_time} 到 {end_time} 而你是</p>\r\n            <p>预计工作不少于 {total_hours} 每周几个小时，如有必要，根据您的情况还可以增加几个小时</p>\r\n            <p>责任.</p>\r\n            <p>6. 休假/节假日</p>\r\n            <p>6.1 您有权享受 12 天的事假.</p>\r\n            <p>6.2 您有权享受 12 个工作日的带薪病假.</p>\r\n            <p>6.3 公司应在每年年初公布已宣布的假期清单.</p>\r\n            <p>7. 职责性质</p>\r\n            <p>您将尽最大努力履行您职位固有的所有职责以及公司的其他职责</p>\r\n            <p>可能会不时要求您表演。您的具体职责在附表 II 中列出，以便.</p>\r\n            <p>8. 公司财产</p>\r\n            <p>您将始终保持公司财产的良好状态，这些财产可能会在工作期间委托给您用于正式使用</p>\r\n            <p>您的工作，并应在放弃您的职责之前将所有此类财产归还给公司，否则费用</p>\r\n            <p>公司将向您追回相同的费用.</p>\r\n            <p>9. 借用/接受礼物</p>\r\n            <p>您不会借用或接受任何金钱、礼物、奖励或补偿来获取个人利益或以其他方式安置自己</p>\r\n            <p>对可能与您有正式往来的任何人/客户承担金钱义务.</p>\r\n            <p>10. 终止</p>\r\n            <p>10.1 公司可以在至少 [通知] 个月之前向您发出无任何理由的终止您的任命</p>\r\n            <p>书面通知或工资代替。本条所称工资是指基本工资.</p>\r\n            <p>10.2 您可以无任何理由地终止与公司的雇佣关系，只需发出不少于[员工通知]</p>\r\n            <p>提前几个月通知或未保存期间的工资，在待休假调整后剩余，截至日期.</p>\r\n            <p>10.3 公司保留立即终止雇佣关系的权利，无需任何通知期或终止付款</p>\r\n            <p>如果有合理的理由相信您犯有不当行为或疏忽，或犯有任何根本违反</p>\r\n            <p>合同，或给公司造成任何损失.</p>\r\n            <p>10. 4 无论出于何种原因终止雇佣关系，您都应将所有财产归还给公司；文件，以及</p>\r\n            <p>纸张，原件和复印件，包括任何样品、文献、合同、记录、清单、图纸、蓝图,</p>\r\n            <p>信件、笔记、数据等；您拥有或控制下的与您的相关的机密信息</p>\r\n            <p>就业或客户商务事务.</p>\r\n            <p>11. 机密信息</p>\r\n            <p>11. 1 在您受雇于公司期间，您将尽最大努力投入全部时间、注意力和技能，</p>\r\n            <p>它的业务。您不得直接或间接地参与、联系、涉及、雇用或参与</p>\r\n            <p>未经公司事先许可，花时间或进行任何学习课程。从事任何其他业务或</p>\r\n            <p>未经雇主事先许可，从事任何活动或任何其他职位或兼职工作或进行任何学习课程</p>\r\n            <p>公司.</p>\r\n            <p>11.2 您必须始终保持最高程度的机密性，并对记录、文件和其他内容保密</p>\r\n            <p>您可能知道或通过任何方式向您透露的与公司业务相关的机密信息</p>\r\n            <p>您只能以符合公司利益的正式授权方式使用此类记录、文件和信息。为了</p>\r\n            <p>本条款的目的机密信息是指有关公司业务及其客户业务的信息</p>\r\n            <p>这是一般公众无法获得的，但您可以在工作过程中了解到。这包括,</p>\r\n            <p>但不限于与组织、其客户名单、雇佣政策、人员和信息有关的信息</p>\r\n            <p>关于公司的产品、流程，包括想法、概念、预测、技术、手册、绘图、设计,</p>\r\n            <p>规范以及包含此类机密信息的所有文件、简历、记录和其他文件.</p>\r\n            <p>11.3 未经许可，您不得在任何时候从办公室删除任何机密信息.</p>\r\n            <p>11.4 您有责任保护且不泄露</p>\r\n            <p>e 机密信息在本协议到期或终止和/或您与公司的雇佣关系到期或终止后仍然有效.</p>\r\n            <p>11.5 违反本条款的条件将使您根据上述条款承担立即解雇的责任，此外，</p>\r\n            <p>公司可能在法律上对您采取的其他补救措施.</p>\r\n            <p>12. 通知</p>\r\n            <p>您可以通过公司的注册办公地址向公司发出通知。公司可能会向您发出通知，地址为：</p>\r\n            <p>您在正式记录中透露的地址.</p>\r\n            <p>13. 公司政策的适用性</p>\r\n            <p>公司有权不时就休假、生育等事宜作出政策声明</p>\r\n            <p>休假、员工福利、工作时间、调动政策等，并可自行决定不时更改.</p>\r\n            <p>公司的所有此类政策决定均对您具有约束力，并在一定程度上优先于本协议.</p>\r\n            <p>14. 适用法律/司法管辖区</p>\r\n            <p>您在公司的雇佣关系须遵守国家/地区法律。所有争议均受高等法院管辖</p>\r\n            <p>仅限古吉拉特邦.</p>\r\n            <p>15. 接受我们的报价</p>\r\n            <p>请签署并返回副本以确认您接受本雇佣合同.</p>\r\n            <p>我们欢迎您并期待得到您的认可并与您合作.</p>\r\n            <p>此致,</p>\r\n            <p>{app_name}</p>\r\n            <p>{date}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(16, 'he', '<h3 style=\"text-align: center;\">מכתב הצטרפות</h3>\r\n            <p>{date}</p>\r\n            <p>{employee_name}</p>\r\n            <p>{address}</p>\r\n            <p>נושא: מינוי לתפקיד של {designation}</p>\r\n            <p>יָקָר {employee_name},</p>\r\n            <p>אנו שמחים להציע לך את התפקיד של {designation} עם {app_name} החברה בתנאים הבאים ו</p>\r\n            <p>תנאים:</p>\r\n            <p>1. תחילת עבודה</p>\r\n            <p>העסקתך תהיה אפקטיבית, החל מהיום {start_date}</p>\r\n            <p>2. הגדרת תפקיד</p>\r\n            <p>שם התפקיד שלך יהיה{designation}.</p>\r\n            <p>3. שכר</p>\r\n            <p>השכר וההטבות האחרות שלך יהיו כמפורט בנספח 1, כאן ל.</p>\r\n            <p>4. מקום הפרסום</p>\r\n            <p>אתה תפורסם ב {branch}. עם זאת, ייתכן שתידרש לעבוד בכל מקום עסק שיש לחברה, או</p>\r\n            <p>עשוי לרכוש מאוחר יותר.</p>\r\n            <p>5. שעות עבודה</p>\r\n            <p>ימי העבודה הרגילים הם שני עד שישי. תידרש לעבוד במשך שעות הדרושות לצורך</p>\r\n            <p>מילוי נאות של חובותיך כלפי החברה. שעות העבודה הרגילות הן מ {start_time} ל {end_time} ואתה</p>\r\n            <p>צפוי לעבוד לא פחות מ {total_hours} שעות בכל שבוע, ובמידת הצורך לשעות נוספות בהתאם לבחירתך</p>\r\n            <p>אחריות.</p>\r\n            <p>6. עזיבה/חגים</p>\r\n            <p>6.1 אתה זכאי לחופשה מזדמנת של 12 ימים.</p>\r\n            <p>6.2 אתה זכאי ל-12 ימי עבודה של חופשת מחלה בתשלום.</p>\r\n            <p>6.3 החברה תודיע על רשימת חגים מוכרזים בתחילת כל שנה.</p>\r\n            <p>7. אופי התפקידים</p>\r\n            <p>תבצע כמיטב יכולתך את כל התפקידים הגלומים בתפקידך וחובות נוספות כמו החברה</p>\r\n            <p>עשוי לקרוא לך להופיע, מעת לעת. החובות הספציפיות שלך מפורטות בלוח הזמנים II כאן כדי.</p>\r\n            <p>8. רכוש החברה</p>\r\n            <p>תמיד תשמור על רכוש החברה במצב טוב, אשר עשוי להיות מופקד בידיך לשימוש רשמי במהלך</p>\r\n            <p>העסקתך, ותחזיר את כל הרכוש כאמור לחברה לפני ויתור על החיוב שלך, אם לא העלות</p>\r\n            <p>ממנו יגבו ממך על ידי החברה.</p>\r\n            <p>9. השאלת/קבלת מתנות</p>\r\n            <p>לא תלווה או תקבל שום כסף, מתנה, תגמול או פיצוי עבור הרווחים האישיים שלך או תציב את עצמך בדרך אחרת.</p>\r\n            <p>תחת התחייבות כספית לכל אדם/לקוח שעמו אתה עשוי לנהל עסקאות רשמיות.</p>\r\n            <p>10. סיום</p>\r\n            <p>10.1 ניתן לסיים את מינויך על ידי החברה, ללא כל סיבה, על ידי מתן הודעה לא פחות מ[הודעה] חודשים לפני כן.</p>\r\n            <p>הודעה בכתב או משכורת במקומה. לעניין סעיף זה, שכר משמעו שכר יסוד.</p>\r\n            <p>10.2 אתה רשאי לסיים את העסקתך בחברה, ללא כל סיבה, על ידי מתן לא פחות מ[הודעת עובד]</p>\r\n            <p>חודשי הודעה מוקדמת או משכורת לתקופה שלא נחסכה, שנותרה לאחר התאמת חופשות ממתינות, לפי התאריך.</p>\r\n            <p>10.3 החברה שומרת לעצמה את הזכות לסיים את העסקתך באופן סופי ללא כל תקופת הודעה מוקדמת או תשלום פיטורין</p>\r\n            <p>אם יש לו יסוד סביר להאמין שאתה אשם בהתנהגות בלתי הולמת או ברשלנות, או שביצעת הפרה יסודית כלשהי של</p>\r\n            <p>חוזה, או גרם להפסד כלשהו לחברה.</p>\r\n            <p>10. 4 עם סיום העסקתך מכל סיבה שהיא, תחזיר לחברה את כל הרכוש; מסמכים, ו</p>\r\n            <p>נייר, הן מקור והעתקים שלו, לרבות כל דוגמאות, ספרות, חוזים, רשומות, רשימות, שרטוטים, שרטוטים,</p>\r\n            <p>מכתבים, הערות, נתונים וכדומה; ומידע סודי, הנמצא ברשותך או בשליטתך, המתייחס לרשותך</p>\r\n            <p>תעסוקה או עניינים עסקיים של לקוחות.</p>\r\n            <p>11. מידע מסווג</p>\r\n            <p>11. 1 במהלך עבודתך בחברה תקדיש את כל זמנך, תשומת הלב והמיומנות שלך כמיטב יכולתך למען</p>\r\n            <p>העסק שלה. אין, במישרין או בעקיפין, לעסוק או לקשר את עצמך, להיות קשור, מודאג, מועסק, או</p>\r\n            <p>זמן או להמשיך כל מסלול לימודים שהוא, ללא אישור מראש של החברה. העוסקת בכל עסק אחר או</p>\r\n            <p>פעילות או כל משרה אחרת או עבודה במשרה חלקית או להמשיך בכל מסלול לימודים שהוא, ללא אישור מראש של</p>\r\n            <p>חֶברָה.</p>\r\n            <p>11.2 עליך תמיד לשמור על רמת הסודיות הגבוהה ביותר ולשמור בסודיות את הרשומות, המסמכים ועוד.</p>\r\n            <p>מידע סודי המתייחס לעסקים של החברה אשר עשוי להיות ידוע לך או נסתר לך בכל אמצעי</p>\r\n            <p>ואתה תשתמש ברשומות, במסמכים ובמידע כאמור רק באופן מורשה כדין לטובת החברה. ל</p>\r\n            <p>המטרות של סעיף זה מידע סודי פירושו מידע על עסקי החברה ושל לקוחותיה</p>\r\n            <p>שאינו זמין לציבור הרחב ואשר עשוי להילמד על ידך במהלך העסקתך. זה כולל,</p>\r\n            <p>אך לא מוגבל למידע הנוגע לארגון, רשימות הלקוחות שלו, מדיניות העסקה, כוח אדם ומידע</p>\r\n            <p>על מוצרי החברה, תהליכים כולל רעיונות, קונספטים, תחזיות, טכנולוגיה, מדריכים, ציור, עיצובים,</p>\r\n            <p>מפרטים, וכל הניירות, קורות החיים, הרשומות ומסמכים אחרים המכילים מידע סודי כאמור.</p>\r\n            <p>11.3 בשום זמן לא תסיר כל מידע סודי מהמשרד ללא רשות.</p>\r\n            <p>11.4 חובתך לשמור ולא לחשוף</p>\r\n            <p>מידע סודי ישרוד את תפוגה או סיומו של הסכם זה ו/או העסקתך בחברה.</p>\r\n            <p>11.5 הפרת תנאי סעיף זה תגרום לך לדין לפיטורים על הסף על פי הסעיף לעיל בנוסף לכל</p>\r\n            <p>סעד אחר שייתכן שיש לחברה נגדך בחוק.</p>\r\n            <p>12. הודעות</p>\r\n            <p>הודעות עשויות להימסר על ידך לחברה בכתובת משרדה הרשום. ייתכן שהחברה תמסור לך הודעות בכתובת</p>\r\n            <p>הכתובת שצוינה על ידך ברישומים הרשמיים.</p>\r\n            <p>13. תחולת מדיניות החברה</p>\r\n            <p>החברה תהיה רשאית להצהיר מעת לעת הצהרות מדיניות הנוגעות לעניינים כמו זכאות לחופשה, לידה</p>\r\n            <p>חופשה, הטבות לעובדים, שעות עבודה, פוליסות העברה וכו, ועשויות לשנות אותן מעת לעת לפי שיקול דעתה הבלעדי.</p>\r\n            <p>כל החלטות מדיניות כאלה של החברה יחייבו אותך ויעקפו את הסכם זה במידה זו.</p>\r\n            <p>14. חוק / סמכות שיפוט</p>\r\n            <p>העסקתך בחברה כפופה לחוקי המדינה. כל המחלוקות יהיו כפופות לסמכותו של בית המשפט העליון</p>\r\n            <p>גוג אראט בלבד.</p>\r\n            <p>15. קבלת ההצעה שלנו</p>\r\n            <p>אנא אשר את הסכמתך לחוזה העסקה זה על ידי חתימה והחזרת העותק הכפול.</p>\r\n            <p>אנו מברכים אותך ומצפים לקבל את קבלתך ולעבוד איתך.</p>\r\n            <p>בכבוד רב,</p>\r\n            <p>{app_name}</p>\r\n            <p>{date}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15');
INSERT INTO `joining_letters` (`id`, `lang`, `content`, `created_by`, `created_at`, `updated_at`) VALUES
(17, 'pt-br', '<h3 style=\"text-align: center;\">Carta De Ades&atilde;o</h3>\r\n            \r\n            <p>{data}</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{address}</p>\r\n            \r\n            <p>Assunto: Nomea&ccedil;&atilde;o para o cargo de {designation}</p>\r\n            \r\n            <p>Querido {employee_name},</p>\r\n            \r\n            <p>Temos o prazer de oferec&ecirc;-lo, a posi&ccedil;&atilde;o de {designation} com {app_name} a Empresa nos seguintes termos e</p>\r\n            <p>condi&ccedil;&otilde;es:</p>\r\n            \r\n            <p>1. Comentamento do emprego</p>\r\n            \r\n            <p>Seu emprego ser&aacute; efetivo, a partir de {start_date}</p>\r\n            \r\n            <p>2. T&iacute;tulo do emprego</p>\r\n            \r\n            <p>Seu cargo de trabalho ser&aacute; {designation}.</p>\r\n            \r\n            <p>3. Sal&aacute;rio</p>\r\n            \r\n            <p>Seu sal&aacute;rio e outros benef&iacute;cios ser&atilde;o conforme estabelecido no Planejamento 1, hereto.</p>\r\n            \r\n            <p>4. Local de postagem</p>\r\n            \r\n            <p>Voc&ecirc; ser&aacute; postado em {branch}. Voc&ecirc; pode, no entanto, ser obrigado a trabalhar em qualquer local de neg&oacute;cios que a Empresa tenha, ou possa posteriormente adquirir.</p>\r\n            \r\n            <p>5. Horas de Trabalho</p>\r\n            \r\n            <p>Os dias normais de trabalho s&atilde;o de segunda a sexta-feira. Voc&ecirc; ser&aacute; obrigado a trabalhar por tais horas, conforme necess&aacute;rio para a quita&ccedil;&atilde;o adequada de suas fun&ccedil;&otilde;es para a Companhia. As horas de trabalho normais s&atilde;o de {start_time} para {end_time} e voc&ecirc; deve trabalhar n&atilde;o menos de {total_horas} horas semanais, e se necess&aacute;rio para horas adicionais dependendo do seu</p>\r\n            <p>responsabilidades.</p>\r\n            \r\n            <p>6. Leave / Holidays</p>\r\n            \r\n            <p>6,1 Voc&ecirc; tem direito a licen&ccedil;a casual de 12 dias.</p>\r\n            \r\n            <p>6,2 Voc&ecirc; tem direito a 12 dias &uacute;teis de licen&ccedil;a remunerada remunerada.</p>\r\n            \r\n            <p>6,3 Companhia notificar&aacute; uma lista de feriados declarados no in&iacute;cio de cada ano.&nbsp;</p>\r\n            \r\n            <p>7. Natureza dos deveres</p>\r\n            \r\n            <p>Voc&ecirc; ir&aacute; executar ao melhor da sua habilidade todos os deveres como s&atilde;o inerentes ao seu cargo e tais deveres adicionais como a empresa pode ligar sobre voc&ecirc; para executar, de tempos em tempos. Os seus deveres espec&iacute;ficos s&atilde;o estabelecidos no Hereto do Planejamento II.</p>\r\n            \r\n            <p>8. Propriedade da empresa</p>\r\n            \r\n            <p>Voc&ecirc; sempre manter&aacute; em bom estado propriedade Empresa, que poder&aacute; ser confiada a voc&ecirc; para uso oficial durante o curso de</p>\r\n            \r\n            <p>o seu emprego, e devolver&aacute; toda essa propriedade &agrave; Companhia antes de abdicar de sua acusa&ccedil;&atilde;o, falhando qual o custo do mesmo ser&aacute; recuperado de voc&ecirc; pela Companhia.</p>\r\n            \r\n            <p>9. Borremir / aceitar presentes</p>\r\n            \r\n            <p>Voc&ecirc; n&atilde;o vai pedir empr&eacute;stimo ou aceitar qualquer dinheiro, presente, recompensa ou indeniza&ccedil;&atilde;o por seus ganhos pessoais de ou de outra forma colocar-se sob obriga&ccedil;&atilde;o pecuni&aacute;ria a qualquer pessoa / cliente com quem voc&ecirc; pode estar tendo rela&ccedil;&otilde;es oficiais.</p>\r\n            \r\n            <p>10. Termina&ccedil;&atilde;o</p>\r\n            \r\n            <p>10,1 Sua nomea&ccedil;&atilde;o pode ser rescindida pela Companhia, sem qualquer raz&atilde;o, dando-lhe n&atilde;o menos do que [aviso] meses de aviso pr&eacute;vio por escrito ou de sal&aacute;rio em lieu deste. Para efeito da presente cl&aacute;usula, o sal&aacute;rio deve significar sal&aacute;rio base.</p>\r\n            \r\n            <p>10,2 Voc&ecirc; pode rescindir seu emprego com a Companhia, sem qualquer causa, ao dar nada menos que [Aviso de contrata&ccedil;&atilde;o] meses de aviso pr&eacute;vio ou sal&aacute;rio para o per&iacute;odo n&atilde;o salvo, deixado ap&oacute;s ajuste de folhas pendentes, conforme data de encontro.</p>\r\n            \r\n            <p>10,3 Empresa reserva-se o direito de rescindir o seu emprego sumariamente sem qualquer prazo de aviso ou de rescis&atilde;o se tiver terreno razo&aacute;vel para acreditar que voc&ecirc; &eacute; culpado de m&aacute; conduta ou neglig&ecirc;ncia, ou tenha cometido qualquer viola&ccedil;&atilde;o fundamental de contrato, ou tenha causado qualquer perda para a Empresa.&nbsp;</p>\r\n            \r\n            <p>10. 4 Sobre a rescis&atilde;o do seu emprego por qualquer motivo, voc&ecirc; retornar&aacute; para a Empresa todos os bens; documentos e&nbsp;</p>\r\n            \r\n            <p>papel, tanto originais como c&oacute;pias dos mesmos, incluindo quaisquer amostras, literatura, contratos, registros, listas, desenhos, plantas,</p>\r\n            \r\n            <p>cartas, notas, dados e semelhantes; e Informa&ccedil;&otilde;es Confidenciais, em sua posse ou sob seu controle relacionado ao seu emprego ou aos neg&oacute;cios de neg&oacute;cios dos clientes.&nbsp; &nbsp;</p>\r\n            \r\n            <p>11. Informa&ccedil;&otilde;es Confidenciais</p>\r\n            \r\n            <p>11. 1 Durante o seu emprego com a Companhia voc&ecirc; ir&aacute; dedicar todo o seu tempo, aten&ccedil;&atilde;o e habilidade para o melhor de sua capacidade de</p>\r\n            \r\n            <p>o seu neg&oacute;cio. Voc&ecirc; n&atilde;o deve, direta ou indiretamente, se envolver ou associar-se com, estar conectado com, preocupado, empregado, ou tempo ou prosseguir qualquer curso de estudo, sem a permiss&atilde;o pr&eacute;via do Company.engajado em qualquer outro neg&oacute;cio ou atividades ou qualquer outro cargo ou trabalho parcial ou prosseguir qualquer curso de estudo, sem a permiss&atilde;o pr&eacute;via do</p>\r\n            \r\n            <p>Empresa.</p>\r\n            \r\n            <p>11,2 &Eacute; preciso manter sempre o mais alto grau de confidencialidade e manter como confidenciais os registros, documentos e outros&nbsp;</p>\r\n            \r\n            <p>Informa&ccedil;&otilde;es confidenciais relativas ao neg&oacute;cio da Companhia que possam ser conhecidas por voc&ecirc; ou confiadas em voc&ecirc; por qualquer meio e utilizar&atilde;o tais registros, documentos e informa&ccedil;&otilde;es apenas de forma devidamente autorizada no interesse da Companhia. Para efeitos da presente cl&aacute;usula \"Informa&ccedil;&otilde;es confidenciais\" significa informa&ccedil;&atilde;o sobre os neg&oacute;cios da Companhia e a dos seus clientes que n&atilde;o est&aacute; dispon&iacute;vel para o p&uacute;blico em geral e que poder&aacute; ser aprendida por voc&ecirc; no curso do seu emprego. Isso inclui,</p>\r\n            \r\n            <p>mas n&atilde;o se limita a, informa&ccedil;&otilde;es relativas &agrave; organiza&ccedil;&atilde;o, suas listas de clientes, pol&iacute;ticas de emprego, pessoal, e informa&ccedil;&otilde;es sobre os produtos da Companhia, processos incluindo ideias, conceitos, proje&ccedil;&otilde;es, tecnologia, manuais, desenho, desenhos,&nbsp;</p>\r\n            \r\n            <p>especifica&ccedil;&otilde;es, e todos os pap&eacute;is, curr&iacute;culos, registros e outros documentos que contenham tais Informa&ccedil;&otilde;es Confidenciais.</p>\r\n            \r\n            <p>11,3 Em nenhum momento, voc&ecirc; remover&aacute; quaisquer Informa&ccedil;&otilde;es Confidenciais do escrit&oacute;rio sem permiss&atilde;o.</p>\r\n            \r\n            <p>11,4 O seu dever de salvaguardar e n&atilde;o os desclos</p>\r\n            \r\n            <p>Informa&ccedil;&otilde;es Confidenciais sobreviver&atilde;o &agrave; expira&ccedil;&atilde;o ou &agrave; rescis&atilde;o deste Contrato e / ou do seu emprego com a Companhia.</p>\r\n            \r\n            <p>11,5 Viola&ccedil;&atilde;o das condi&ccedil;&otilde;es desta cl&aacute;usula ir&aacute; torn&aacute;-lo sujeito a demiss&atilde;o sum&aacute;ria sob a cl&aacute;usula acima, al&eacute;m de qualquer outro rem&eacute;dio que a Companhia possa ter contra voc&ecirc; em lei.</p>\r\n            \r\n            <p>12. Notices</p>\r\n            \r\n            <p>Os avisos podem ser conferidos por voc&ecirc; &agrave; Empresa em seu endere&ccedil;o de escrit&oacute;rio registrado. Os avisos podem ser conferidos pela Companhia a voc&ecirc; no endere&ccedil;o intimado por voc&ecirc; nos registros oficiais.</p>\r\n            \r\n            <p>13. Aplicabilidade da Pol&iacute;tica da Empresa</p>\r\n            \r\n            <p>A Companhia tem direito a fazer declara&ccedil;&otilde;es de pol&iacute;tica de tempos em tempos relativos a mat&eacute;rias como licen&ccedil;a de licen&ccedil;a, maternidade</p>\r\n            \r\n            <p>sair, benef&iacute;cios dos empregados, horas de trabalho, pol&iacute;ticas de transfer&ecirc;ncia, etc., e pode alterar o mesmo de vez em quando a seu exclusivo crit&eacute;rio.</p>\r\n            \r\n            <p>Todas essas decis&otilde;es de pol&iacute;tica da Companhia devem ser vinculativas para si e substituir&atilde;o este Acordo nessa medida.</p>\r\n                \r\n            <p>14. Direito / Jurisdi&ccedil;&atilde;o</p>\r\n            \r\n            <p>Seu emprego com a Companhia est&aacute; sujeito &agrave;s leis do Pa&iacute;s. Todas as disputas est&atilde;o sujeitas &agrave; jurisdi&ccedil;&atilde;o do Tribunal Superior</p>\r\n            \r\n            <p>Gujarat apenas.</p>\r\n            \r\n            <p>15. Aceita&ccedil;&atilde;o da nossa oferta</p>\r\n            \r\n            <p>Por favor, confirme sua aceita&ccedil;&atilde;o deste Contrato de Emprego assinando e retornando a c&oacute;pia duplicada.</p>\r\n            \r\n            <p>N&oacute;s acolhemos voc&ecirc; e estamos ansiosos para receber sua aceita&ccedil;&atilde;o e para trabalhar com voc&ecirc;.</p>\r\n        \r\n            <p>Seu Sinceramente,</p>\r\n            \r\n            <p>{app_name}</p>\r\n            \r\n            <p>{data}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15');

-- --------------------------------------------------------

--
-- Table structure for table `join_us`
--

CREATE TABLE `join_us` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `landing_page_sections`
--

CREATE TABLE `landing_page_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `section_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_order` int NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci,
  `section_type` enum('section-1','section-2','section-3','section-4','section-5','section-6','section-7','section-8','section-9','section-10','section-plan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_demo_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_blade_file_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `landing_page_settings`
--

CREATE TABLE `landing_page_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `landing_page_settings`
--

INSERT INTO `landing_page_settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'topbar_status', 'on', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(2, 'topbar_notification_msg', '70% Special Offer. Don’t Miss it. The offer ends in 72 hours.', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(3, 'menubar_status', 'on', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(4, 'menubar_page', '[{\"menubar_page_name\": \"About Us\",\"template_name\": \"page_content\",\"page_url\": \"\",\"menubar_page_contant\": \"Welcome to the HRMGo website. By accessing this website, you agree to comply with and be bound by the following terms and conditions of use. If you disagree with any part of these terms, please do not use our website. The content of the pages of this website is for your general information and use only. It is subject to change without notice. This website uses cookies to monitor browsing preferences. If you do allow cookies to be used, personal information may be stored by us for use by third parties. Neither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness, or suitability of the information and materials found or offered on this website for any particular purpose. You acknowledge that such information and materials may contain inaccuracies or errors, and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law. Your use of any information or materials on this website is entirely at your own risk, for which we shall not be liable. It shall be your own responsibility to ensure that any products, services, or information available through this website meet your specific requirements. This website contains material that is owned by or licensed to us. This material includes, but is not limited to, the design, layout, look, appearance, and graphics. Reproduction is prohibited other than in accordance with the copyright notice, which forms part of these terms and conditions. Unauthorized use of this website may give rise to a claim for damages and\\/or be a criminal offense. From time to time, this website may also include links to other websites. These links are provided for your convenience to provide further information. They do not signify that we endorse the website(s). We have no responsibility for the content of the linked website(s\",\"page_slug\": \"about_us\",\"header\": \"on\",\"footer\": \"on\",\"login\": \"on\"},{\"menubar_page_name\": \"Terms and Conditions\",\"template_name\": \"page_content\",\"page_url\": \"\",\"menubar_page_contant\": \"Welcome to the HRMGo website. By accessing this website, you agree to comply with and be bound by the following terms and conditions of use. If you disagree with any part of these terms, please do not use our website.\\r\\n\\r\\nThe content of the pages of this website is for your general information and use only. It is subject to change without notice.\\r\\n\\r\\nThis website uses cookies to monitor browsing preferences. If you do allow cookies to be used, personal information may be stored by us for use by third parties.\\r\\n\\r\\nNeither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness, or suitability of the information and materials found or offered on this website for any particular purpose. You acknowledge that such information and materials may contain inaccuracies or errors, and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law.\\r\\n\\r\\nYour use of any information or materials on this website is entirely at your own risk, for which we shall not be liable. It shall be your own responsibility to ensure that any products, services, or information available through this website meet your specific requirements.\\r\\n\\r\\nThis website contains material that is owned by or licensed to us. This material includes, but is not limited to, the design, layout, look, appearance, and graphics. Reproduction is prohibited other than in accordance with the copyright notice, which forms part of these terms and conditions.\\r\\n\\r\\nUnauthorized use of this website may give rise to a claim for damages and\\/or be a criminal offense.\\r\\n\\r\\nFrom time to time, this website may also include links to other websites. These links are provided for your convenience to provide further information. They do not signify that we endorse the website(s). We have no responsibility for the content of the linked website(s).\",\"page_slug\": \"terms_and_conditions\",\"header\": \"off\",\"footer\": \"on\",\"login\": \"on\"},{\"menubar_page_name\": \"Privacy Policy\",\"template_name\": \"page_content\",\"page_url\": \"\",\"menubar_page_contant\": \"Introduction: An overview of the privacy policy, including the purpose and scope of the policy. Information Collection: Details about the types of information collected from users\\/customers, such as personal information (name, address, email), device information, usage data, and any other relevant data. Data Usage: An explanation of how the collected data will be used, including providing services, improving products, personalization, analytics, and any other legitimate business purposes. Data Sharing: Information about whether and how the company shares user data with third parties, such as partners, service providers, or affiliates, along with the purposes of such sharing. Data Security: Details about the measures taken to protect user data from unauthorized access, loss, or misuse, including encryption, secure protocols, access controls, and data breach notification procedures. User Choices: Information on the choices available to users regarding the collection, use, and sharing of their personal data, including opt-out mechanisms and account settings. Cookies and Tracking Technologies: Explanation of the use of cookies, web beacons, and similar technologies for tracking user activity and collecting information for analytics and advertising purposes. Third-Party Links: Clarification that the companys website or services may contain links to third-party websites or services and that the privacy policy does not extend to those external sites. Data Retention: Details about the retention period for user data and how long it will be stored by the company. Legal Basis and Compliance: Information about the legal basis for processing personal data, compliance with applicable data protection laws, and the rights of users under relevant privacy regulations (e.g., GDPR, CCPA). Updates to the Privacy Policy: Notification that the privacy policy may be updated from time to time, and how users will be informed of any material changes. Contact Information: How users can contact the company regarding privacy-related concerns or inquiries.\",\"page_slug\": \"privacy_policy\",\"header\": \"off\",\"footer\": \"on\",\"login\": \"on\"}]', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(5, 'site_logo', 'site_logo.png', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(6, 'site_description', 'We build modern web tools to help you jump-start your daily business work.', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(7, 'home_status', 'on', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(8, 'home_offer_text', '70% Special Offer', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(9, 'home_title', 'Home', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(10, 'home_heading', 'HRMGo - HRM and Payroll Tool', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(11, 'home_description', 'Use these awesome forms to login or create new account in your project for free.', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(12, 'home_trusted_by', '1000+ Customer', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(13, 'home_live_demo_link', 'https://demo.rajodiya.com/hrmgo/login', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(14, 'home_buy_now_link', 'https://codecanyon.net/item/hrmgo-hrm-and-payroll-tool/25982864', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(15, 'home_banner', 'home_banner.png', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(16, 'home_logo', 'home_logo.png,home_logo.png,home_logo.png,home_logo.png,home_logo.png,home_logo.png,home_logo.png', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(17, 'feature_status', 'on', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(18, 'feature_title', 'Features', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(19, 'feature_heading', 'All In One Place CRM System', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(20, 'feature_description', 'Use these awesome forms to login or create new account in your project for free. Use these awesome forms to login or create new account in your project for free.', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(21, 'feature_buy_now_link', 'https://codecanyon.net/item/hrmgo-hrm-and-payroll-tool/25982864', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(22, 'feature_of_features', '[{\"feature_logo\":\"1686575690-feature_logo.png\",\"feature_heading\":\"Feature\",\"feature_description\":\"<p>Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.<\\/p>\"},{\"feature_logo\":\"1686545757-feature_logo.png\",\"feature_heading\":\"Support\",\"feature_description\":\"Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.\"},{\"feature_logo\":\"1686546152-feature_logo.png\",\"feature_heading\":\"Integration\",\"feature_description\":\"Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.\"}]', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(23, 'highlight_feature_heading', 'HRMGo - HRM and Payroll Tool', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(24, 'highlight_feature_description', 'Use these awesome forms to login or create new account in your project for free.', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(25, 'highlight_feature_image', 'highlight_feature_image.png', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(26, 'other_features', '[{\"other_features_image\":\"1688375380-other_features_image.png\",\"other_features_heading\":\"HRMGo - HRM and Payroll Tool\",\"other_featured_description\":\"<p>Use these awesome forms to login or create new account in your project for free.<\\/p>\",\"other_feature_buy_now_link\":\"https:\\/\\/codecanyon.net\\/item\\/hrmgo-hrm-and-payroll-tool\\/25982864\"},{\"other_features_image\":\"1688375397-other_features_image.png\",\"other_features_heading\":\"HRMGo - HRM and Payroll Tool\",\"other_featured_description\":\"<p>Use these awesome forms to login or create new account in your project for free.<\\/p>\",\"other_feature_buy_now_link\":\"https:\\/\\/codecanyon.net\\/item\\/hrmgo-hrm-and-payroll-tool\\/25982864\"},{\"other_features_image\":\"1688375413-other_features_image.png\",\"other_features_heading\":\"HRMGo - HRM and Payroll Tool\",\"other_featured_description\":\"<p>Use these awesome forms to login or create new account in your project for free.<\\/p>\",\"other_feature_buy_now_link\":\"https:\\/\\/codecanyon.net\\/item\\/hrmgo-hrm-and-payroll-tool\\/25982864\"},{\"other_features_image\":\"1688375429-other_features_image.png\",\"other_features_heading\":\"HRMGo - HRM and Payroll Tool\",\"other_featured_description\":\"<p>Use these awesome forms to login or create new account in your project for free.<\\/p>\",\"other_feature_buy_now_link\":\"https:\\/\\/codecanyon.net\\/item\\/hrmgo-hrm-and-payroll-tool\\/25982864\"}]', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(27, 'discover_status', 'on', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(28, 'discover_heading', 'HRMGo - HRM and Payroll Tool', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(29, 'discover_description', 'Use these awesome forms to login or create new account in your project for free.', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(30, 'discover_live_demo_link', 'https://demo.rajodiya.com/hrmgo/login', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(31, 'discover_buy_now_link', 'https://codecanyon.net/item/hrmgo-hrm-and-payroll-tool/25982864', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(32, 'discover_of_features', '[{\"discover_logo\":\"1686575797-discover_logo.png\",\"discover_heading\":\"Feature\",\"discover_description\":\"<p>Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.<\\/p>\"},{\"discover_logo\":\"1686547242-discover_logo.png\",\"discover_heading\":\"Feature\",\"discover_description\":\"Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.\"},{\"discover_logo\":\"1686547625-discover_logo.png\",\"discover_heading\":\"Feature\",\"discover_description\":\"Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.\"},{\"discover_logo\":\"1686547638-discover_logo.png\",\"discover_heading\":\"Feature\",\"discover_description\":\"Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.\"},{\"discover_logo\":\"1686547653-discover_logo.png\",\"discover_heading\":\"Feature\",\"discover_description\":\"Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.\"},{\"discover_logo\":\"1686547662-discover_logo.png\",\"discover_heading\":\"Feature\",\"discover_description\":\"Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.\"},{\"discover_logo\":\"1686547709-discover_logo.png\",\"discover_heading\":\"Feature\",\"discover_description\":\"Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.\"},{\"discover_logo\":\"1686547717-discover_logo.png\",\"discover_heading\":\"Feature\",\"discover_description\":\"Use these awesome forms to login or create new account in your project for free.Use these awesome forms to login or create new account in your project for free.\"}]', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(33, 'screenshots_status', 'on', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(34, 'screenshots_heading', 'HRMGo - HRM and Payroll Tool', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(35, 'screenshots_description', 'Use these awesome forms to login or create new account in your project for free.', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(36, 'screenshots', '[{\"screenshots\":\"1688375477-screenshots.png\",\"screenshots_heading\":\"HRM Dashboard\"},{\"screenshots\":\"1688451632-screenshots.png\",\"screenshots_heading\":\"User Roles\"},{\"screenshots\":\"1688451623-screenshots.png\",\"screenshots_heading\":\"Profile Overview\"},{\"screenshots\":\"1688375508-screenshots.png\",\"screenshots_heading\":\"HRM Users\"},{\"screenshots\":\"1688451675-screenshots.png\",\"screenshots_heading\":\"Contract Page\"},{\"screenshots\":\"1688451692-screenshots.png\",\"screenshots_heading\":\"Job Career\"}]', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(37, 'faq_status', 'on', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(38, 'faq_title', 'Faq', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(39, 'faq_heading', 'HRMGo - HRM and Payroll Tool', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(40, 'faq_description', 'Use these awesome forms to login or create new account in your project for free.', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(41, 'faqs', '[{\"faq_questions\":\"#What does \\\"Theme\\/Package Installation\\\" mean?\",\"faq_answer\":\"For an easy-to-install theme\\/package, we have included step-by-step detailed documentation (in English). However, if it is not done perfectly, please feel free to contact the support team at support@workdo.io\"},{\"faq_questions\":\"#What does \\\"Theme\\/Package Installation\\\" mean?\",\"faq_answer\":\"For an easy-to-install theme\\/package, we have included step-by-step detailed documentation (in English). However, if it is not done perfectly, please feel free to contact the support team at support@workdo.io\"},{\"faq_questions\":\"#What does \\\"Lifetime updates\\\" mean?\",\"faq_answer\":\"For an easy-to-install theme\\/package, we have included step-by-step detailed documentation (in English). However, if it is not done perfectly, please feel free to contact the support team at support@workdo.io\"},{\"faq_questions\":\"#What does \\\"Lifetime updates\\\" mean?\",\"faq_answer\":\"For an easy-to-install theme\\/package, we have included step-by-step detailed documentation (in English). However, if it is not done perfectly, please feel free to contact the support team at support@workdo.io\"},{\"faq_questions\":\"# What does \\\"6 months of support\\\" mean?\",\"faq_answer\":\"Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa\\r\\n                                    nesciunt\\r\\n                                    laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt\\r\\n                                    sapiente ea\\r\\n                                    proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven heard of them accusamus labore sustainable VHS.\"},{\"faq_questions\":\"# What does \\\"6 months of support\\\" mean?\",\"faq_answer\":\"Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa\\r\\n                                    nesciunt\\r\\n                                    laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt\\r\\n                                    sapiente ea\\r\\n                                    proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven heard of them accusamus labore sustainable VHS.\"}]', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(42, 'testimonials_status', 'on', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(43, 'testimonials_heading', 'From our Clients', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(44, 'testimonials_description', 'Use these awesome forms to login or create new account in your project for free.', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(45, 'testimonials_long_description', 'WorkDo seCommerce package offers you a “sales-ready.”secure online store. The package puts all the key pieces together, from design to payment processing. This gives you a headstart in your eCommerce venture. Every store is built using a reliable PHP framework -laravel. Thisspeeds up the development process while increasing the store’s security and performance.Additionally, thanks to the accompanying mobile app, you and your team can manage the store on the go. What’s more, because the app works both for you and your customers, you can use it to reach a wider audience.And, unlike popular eCommerce platforms, it doesn’t bind you to any terms and conditions or recurring fees. You get to choose where you host it or which payment gateway you use. Lastly, you getcomplete control over the looks of the store. And if it lacks any functionalities that you need, just reach out, and let’s discuss customization possibilities', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(46, 'testimonials', '[{\"testimonials_user_avtar\":\"1686634418-testimonials_user_avtar.jpg\",\"testimonials_title\":\"Tbistone\",\"testimonials_description\":\"Very quick customer support, installing this application on my machine locally, within 5 minutes of creating a ticket, the developer was able to fix the issue I had within 10 minutes. EXCELLENT! Thank you very much\",\"testimonials_user\":\"Chordsnstrings\",\"testimonials_designation\":\"from codecanyon\",\"testimonials_star\":\"5\"},{\"testimonials_user_avtar\":\"1686634425-testimonials_user_avtar.jpg\",\"testimonials_title\":\"Tbistone\",\"testimonials_description\":\"Very quick customer support, installing this application on my machine locally, within 5 minutes of creating a ticket, the developer was able to fix the issue I had within 10 minutes. EXCELLENT! Thank you very much\",\"testimonials_user\":\"Chordsnstrings\",\"testimonials_designation\":\"from codecanyon\",\"testimonials_star\":\"5\"},{\"testimonials_user_avtar\":\"1686634432-testimonials_user_avtar.jpg\",\"testimonials_title\":\"Tbistone\",\"testimonials_description\":\"Very quick customer support, installing this application on my machine locally, within 5 minutes of creating a ticket, the developer was able to fix the issue I had within 10 minutes. EXCELLENT! Thank you very much\",\"testimonials_user\":\"Chordsnstrings\",\"testimonials_designation\":\"from codecanyon\",\"testimonials_star\":\"5\"}]', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(47, 'footer_status', 'on', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(48, 'joinus_status', 'on', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(49, 'joinus_heading', 'Join Our Community', '2024-04-17 01:46:40', '2024-04-17 01:46:40'),
(50, 'joinus_description', 'We build modern web tools to help you jump-start your daily business work.', '2024-04-17 01:46:40', '2024-04-17 01:46:40');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `fullName`, `created_at`, `updated_at`) VALUES
(1, 'ar', 'Arabic', '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(2, 'zh', 'Chinese', '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(3, 'da', 'Danish', '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(4, 'de', 'German', '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(5, 'en', 'English', '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(6, 'es', 'Spanish', '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(7, 'fr', 'French', '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(8, 'he', 'Hebrew', '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(9, 'it', 'Italian', '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(10, 'ja', 'Japanese', '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(11, 'nl', 'Dutch', '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(12, 'pl', 'Polish', '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(13, 'pt', 'Portuguese', '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(14, 'ru', 'Russian', '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(15, 'tr', 'Turkish', '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(16, 'pt-br', 'Portuguese(Brazil)', '2024-04-17 02:53:15', '2024-04-17 02:53:15');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` int NOT NULL,
  `leave_type_id` int NOT NULL,
  `applied_on` date NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_leave_days` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leave_reason` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `days` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` int NOT NULL,
  `loan_option` int NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,2) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_options`
--

CREATE TABLE `loan_options` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_details`
--

CREATE TABLE `login_details` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login_details`
--

INSERT INTO `login_details` (`id`, `user_id`, `ip`, `date`, `Details`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '2', '127.0.0.1', '2024-04-22 06:50:58', '{\"status\":\"fail\",\"message\":\"reserved range\",\"query\":\"127.0.0.1\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 1, '2024-04-22 00:50:58', '2024-04-22 00:50:58');

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` int NOT NULL,
  `department_id` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meeting_employees`
--

CREATE TABLE `meeting_employees` (
  `id` bigint UNSIGNED NOT NULL,
  `meeting_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_09_28_102009_create_settings_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2019_12_26_101754_create_departments_table', 1),
(7, '2019_12_26_101814_create_designations_table', 1),
(8, '2019_12_26_105721_create_documents_table', 1),
(9, '2019_12_27_083751_create_branches_table', 1),
(10, '2019_12_27_090831_create_employees_table', 1),
(11, '2019_12_27_112922_create_employee_documents_table', 1),
(12, '2019_12_28_050508_create_awards_table', 1),
(13, '2019_12_28_050919_create_award_types_table', 1),
(14, '2019_12_31_060916_create_termination_types_table', 1),
(15, '2019_12_31_062259_create_terminations_table', 1),
(16, '2019_12_31_070521_create_resignations_table', 1),
(17, '2019_12_31_072252_create_travels_table', 1),
(18, '2019_12_31_090637_create_promotions_table', 1),
(19, '2019_12_31_092838_create_transfers_table', 1),
(20, '2019_12_31_100319_create_warnings_table', 1),
(21, '2019_12_31_103019_create_complaints_table', 1),
(22, '2020_01_02_090837_create_payslip_types_table', 1),
(23, '2020_01_02_093331_create_allowance_options_table', 1),
(24, '2020_01_02_102558_create_loan_options_table', 1),
(25, '2020_01_02_103822_create_deduction_options_table', 1),
(26, '2020_01_02_110828_create_genrate_payslip_options_table', 1),
(27, '2020_01_02_111807_create_set_salaries_table', 1),
(28, '2020_01_03_084302_create_allowances_table', 1),
(29, '2020_01_03_101735_create_commissions_table', 1),
(30, '2020_01_03_105019_create_loans_table', 1),
(31, '2020_01_03_105046_create_saturation_deductions_table', 1),
(32, '2020_01_03_105100_create_other_payments_table', 1),
(33, '2020_01_03_105111_create_overtimes_table', 1),
(34, '2020_01_04_072527_create_pay_slips_table', 1),
(35, '2020_01_06_045425_create_account_lists_table', 1),
(36, '2020_01_06_062213_create_payees_table', 1),
(37, '2020_01_06_070037_create_payers_table', 1),
(38, '2020_01_06_072939_create_income_types_table', 1),
(39, '2020_01_06_073055_create_expense_types_table', 1),
(40, '2020_01_06_085218_create_deposits_table', 1),
(41, '2020_01_06_090709_create_payment_types_table', 1),
(42, '2020_01_06_121442_create_expenses_table', 1),
(43, '2020_01_06_124036_create_transfer_balances_table', 1),
(44, '2020_01_13_084720_create_events_table', 1),
(45, '2020_01_16_041720_create_announcements_table', 1),
(46, '2020_01_16_090747_create_leave_types_table', 1),
(47, '2020_01_16_093256_create_leaves_table', 1),
(48, '2020_01_16_110357_create_meetings_table', 1),
(49, '2020_01_17_051906_create_tickets_table', 1),
(50, '2020_01_17_112647_create_ticket_replies_table', 1),
(51, '2020_01_23_101613_create_meeting_employees_table', 1),
(52, '2020_01_23_123844_create_event_employees_table', 1),
(53, '2020_01_24_062752_create_announcement_employees_table', 1),
(54, '2020_01_27_052503_create_attendance_employees_table', 1),
(55, '2020_02_28_051636_create_time_sheets_table', 1),
(56, '2020_04_21_115823_create_assets_table', 1),
(57, '2020_05_01_122144_create_ducument_uploads_table', 1),
(58, '2020_05_04_070452_create_indicators_table', 1),
(59, '2020_05_05_023742_create_appraisals_table', 1),
(60, '2020_05_05_061241_create_goal_types_table', 1),
(61, '2020_05_05_095926_create_goal_trackings_table', 1),
(62, '2020_05_07_093520_create_company_policies_table', 1),
(63, '2020_05_07_131311_create_training_types_table', 1),
(64, '2020_05_08_023838_create_trainers_table', 1),
(65, '2020_05_08_043039_create_trainings_table', 1),
(66, '2020_05_21_065337_create_permission_tables', 1),
(67, '2020_07_18_065859_create_messageses_table', 1),
(68, '2020_10_07_034726_create_holidays_table', 1),
(69, '2021_03_13_093312_create_ip_restricts_table', 1),
(70, '2021_03_13_114832_create_job_categories_table', 1),
(71, '2021_03_13_123125_create_job_stages_table', 1),
(72, '2021_03_15_094707_create_jobs_table', 1),
(73, '2021_03_15_153745_create_job_applications_table', 1),
(74, '2021_03_16_115140_create_job_application_notes_table', 1),
(75, '2021_03_17_163107_create_custom_questions_table', 1),
(76, '2021_03_18_140630_create_interview_schedules_table', 1),
(77, '2021_03_22_122532_create_job_on_boards_table', 1),
(78, '2021_06_22_114423_create_landing_page_sections_table', 1),
(79, '2021_08_20_084119_create_competencies_table', 1),
(80, '2021_11_22_043537_create_performance__types_table', 1),
(81, '2021_12_24_064955_create_zoom_meetings_table', 1),
(82, '2022_07_19_071401_create_email_templates_table', 1),
(83, '2022_07_19_071414_create_email_template_langs_table', 1),
(84, '2022_07_19_071557_user_email_templates_table', 1),
(85, '2022_08_03_050715_create_contract_types_table', 1),
(86, '2022_08_03_050734_create_contracts_table', 1),
(87, '2022_08_03_050752_create_contract_attechments_table', 1),
(88, '2022_08_03_050823_create_contract_comments_table', 1),
(89, '2022_08_03_050848_create_contract_notes_table', 1),
(90, '2022_08_23_043144_generate_offer_letter', 1),
(91, '2022_08_23_043307_joining_letter', 1),
(92, '2022_08_23_043319_experience_certificate', 1),
(93, '2022_08_23_043411_noc_certificate', 1),
(94, '2022_12_08_999999_create_favorites_table', 1),
(95, '2022_12_08_999999_create_messages_table', 1),
(96, '2023_04_24_043808_create_login_details_table', 1),
(97, '2023_04_25_060456_create_webhooks_table', 1),
(98, '2023_05_04_122759_create_notification_templates_table', 1),
(99, '2023_05_04_122830_create_notification_template_langs_table', 1),
(100, '2023_06_05_043450_create_landing_page_settings_table', 1),
(101, '2023_06_10_114031_create_join_us_table', 1),
(102, '2023_06_12_064215_create_template_table', 1),
(103, '2023_06_29_091559_create_languages_table', 1),
(104, '2024_01_25_102940_add_is_login_enable_to_users_table', 1),
(105, '2024_01_25_103031_update_password_for_users_table', 1),
(106, '2024_02_02_034114_add_attachment_to_tickets_table', 1),
(107, '2024_02_02_034347_add_attachment_to_ticket_replies_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `noc_certificates`
--

CREATE TABLE `noc_certificates` (
  `id` bigint UNSIGNED NOT NULL,
  `lang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `noc_certificates`
--

INSERT INTO `noc_certificates` (`id`, `lang`, `content`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'ar', '<h3 style=\"text-align: center;\">شهادة عدم ممانعة</h3>\r\n            \r\n            \r\n            \r\n            <p>التاريخ: {date}</p>\r\n            \r\n            \r\n            \r\n            <p>إلى من يهمه الأمر</p>\r\n            \r\n            \r\n            \r\n            <p>هذه الشهادة مخصصة للمطالبة بشهادة عدم ممانعة (NoC) للسيدة / السيد {employee_name} إذا انضمت إلى أي مؤسسة أخرى وقدمت خدماتها / خدماتها. يتم إبلاغه لأنه قام بتصفية جميع أرصدته واستلام أمانه من شركة {app_name}.</p>\r\n            \r\n            \r\n            \r\n            <p>نتمنى لها / لها التوفيق في المستقبل.</p>\r\n            \r\n            \r\n            \r\n            <p>بإخلاص،</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>التوقيع</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(2, 'da', '<h3 style=\"text-align: center;\">Ingen indsigelsesattest</h3>\r\n            \r\n            \r\n            \r\n            <p>Dato: {date}</p>\r\n            \r\n            \r\n            \r\n            <p>Til hvem det m&aring;tte vedr&oslash;re</p>\r\n            \r\n            \r\n            \r\n            <p>Dette certifikat er for at g&oslash;re krav p&aring; et No Objection Certificate (NoC) for Ms. / Mr. {employee_name}, hvis hun/han tilslutter sig og leverer sine tjenester til enhver anden organisation. Det informeres, da hun/han har udlignet alle sine saldi og modtaget sin sikkerhed fra {app_name}-virksomheden.</p>\r\n            \r\n            \r\n            \r\n            <p>Vi &oslash;nsker hende/ham held og lykke i fremtiden.</p>\r\n            \r\n            \r\n            \r\n            <p>Med venlig hilsen</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Underskrift</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(3, 'de', '<h3 style=\"text-align: center;\">Kein Einwand-Zertifikat</h3>\r\n            \r\n            \r\n            \r\n            <p>Datum {date}</p>\r\n            \r\n            \r\n            \r\n            <p>Wen auch immer es betrifft</p>\r\n            \r\n            \r\n            \r\n            <p>Dieses Zertifikat soll ein Unbedenklichkeitszertifikat (NoC) f&uuml;r Frau / Herrn {employee_name} beanspruchen, wenn sie/er einer anderen Organisation beitritt und ihre/seine Dienste anbietet. Sie wird informiert, da sie/er alle ihre/seine Guthaben ausgeglichen und ihre/seine Sicherheit von der Firma {app_name} erhalten hat.</p>\r\n            \r\n            \r\n            \r\n            <p>Wir w&uuml;nschen ihr/ihm viel Gl&uuml;ck f&uuml;r die Zukunft.</p>\r\n            \r\n            \r\n            \r\n            <p>Aufrichtig,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Unterschrift</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(4, 'en', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>No Objection Certificate</strong></span></p>\r\n            \r\n            <p>Date: {date}</p>\r\n            \r\n            <p>To Whomsoever It May Concern</p>\r\n            \r\n            <p>This certificate is to claim a No Objection Certificate (NoC) for Ms. / Mr. {employee_name} if she/he joins and provides her/his services to any other organization. It is informed as she/he has cleared all her/his balances and received her/his security from {app_name} Company.</p>\r\n            \r\n            <p>We wish her/him good luck in the future.</p>\r\n            \r\n            <p>Sincerely,</p>\r\n            <p>{employee_name}</p>\r\n            <p>{designation}</p>\r\n            <p>Signature</p>\r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(5, 'es', '<h3 style=\"text-align: center;\">Certificado de conformidad</h3>\r\n            \r\n            \r\n            \r\n            <p>Fecha: {date}</p>\r\n            \r\n            \r\n            \r\n            <p>A quien corresponda</p>\r\n            \r\n            \r\n            \r\n            <p>Este certificado es para reclamar un Certificado de No Objeci&oacute;n (NoC) para la Sra. / Sr. {employee_name} si ella / &eacute;l se une y brinda sus servicios a cualquier otra organizaci&oacute;n. Se informa que &eacute;l/ella ha liquidado todos sus saldos y recibido su seguridad de {app_name} Company.</p>\r\n            \r\n            \r\n            \r\n            <p>Le deseamos buena suerte en el futuro.</p>\r\n            \r\n            \r\n            \r\n            <p>Sinceramente,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Firma</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(6, 'fr', '<h3 style=\"text-align: center;\">Aucun certificat dopposition</h3>\r\n            \r\n            \r\n            <p>Date : {date}</p>\r\n            \r\n            \r\n            <p>&Agrave; toute personne concern&eacute;e</p>\r\n            \r\n            \r\n            <p>Ce certificat sert &agrave; r&eacute;clamer un certificat de non-objection (NoC) pour Mme / M. {employee_name} sil rejoint et fournit ses services &agrave; toute autre organisation. Il est inform&eacute; quil a sold&eacute; tous ses soldes et re&ccedil;u sa garantie de la part de la soci&eacute;t&eacute; {app_name}.</p>\r\n            \r\n            \r\n            <p>Nous lui souhaitons bonne chance pour lavenir.</p>\r\n            \r\n            \r\n            <p>Sinc&egrave;rement,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Signature</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(7, 'id', '<h3 style=\"text-align: center;\">Sertifikat Tidak Keberatan</h3>\r\n            \r\n            \r\n            \r\n            <p>Tanggal: {date}</p>\r\n            \r\n            \r\n            \r\n            <p>Kepada Siapa Pun Yang Memprihatinkan</p>\r\n            \r\n            \r\n            \r\n            <p>Sertifikat ini untuk mengklaim No Objection Certificate (NoC) untuk Ibu / Bapak {employee_name} jika dia bergabung dan memberikan layanannya ke organisasi lain mana pun. Diberitahukan karena dia telah melunasi semua saldonya dan menerima jaminannya dari Perusahaan {app_name}.</p>\r\n            \r\n            \r\n            \r\n            <p>Kami berharap dia sukses di masa depan.</p>\r\n            \r\n            \r\n            \r\n            <p>Sungguh-sungguh,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Tanda tangan</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(8, 'it', '<h3 style=\"text-align: center;\">Certificato di nulla osta</h3>\r\n            \r\n            \r\n            \r\n            <p>Data: {date}</p>\r\n            \r\n            \r\n            \r\n            <p>A chi pu&ograve; interessare</p>\r\n            \r\n            \r\n            \r\n            <p>Questo certificato serve a richiedere un certificato di non obiezione (NoC) per la signora / il signor {employee_name} se si unisce e fornisce i suoi servizi a qualsiasi altra organizzazione. Viene informato in quanto ha liquidato tutti i suoi saldi e ricevuto la sua sicurezza dalla societ&agrave; {app_name}.</p>\r\n            \r\n            \r\n            \r\n            <p>Le auguriamo buona fortuna per il futuro.</p>\r\n            \r\n            \r\n            \r\n            <p>Cordiali saluti,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Firma</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(9, 'ja', '<h3 style=\"text-align: center;\">異議なし証明書</h3>\r\n            \r\n            \r\n            \r\n            <p>日付: {date}</p>\r\n            \r\n            \r\n            \r\n            <p>関係者各位</p>\r\n            \r\n            \r\n            \r\n            <p>この証明書は、Ms. / Mr. {employee_name} が他の組織に参加してサービスを提供する場合に、異議なし証明書 (NoC) を請求するためのものです。彼女/彼/彼がすべての残高を清算し、{app_name} 会社から彼女/彼のセキュリティを受け取ったことが通知されます。</p>\r\n            \r\n            \r\n            \r\n            <p>彼女/彼の今後の幸運を祈っています。</p>\r\n            \r\n            \r\n            \r\n            <p>心から、</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>サイン</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(10, 'nl', '<h3 style=\"text-align: center;\">Geen bezwaarcertificaat</h3>\r\n            \r\n            \r\n            \r\n            <p>Datum: {date}</p>\r\n            \r\n            \r\n            \r\n            <p>Aan wie het ook aangaat</p>\r\n            \r\n            \r\n            \r\n            <p>Dit certificaat is bedoeld om aanspraak te maken op een Geen Bezwaarcertificaat (NoC) voor mevrouw/dhr. {employee_name} als zij/hij lid wordt en haar/zijn diensten verleent aan een andere organisatie. Het wordt ge&iuml;nformeerd als zij/hij al haar/zijn saldos heeft gewist en haar/zijn zekerheid heeft ontvangen van {app_name} Company.</p>\r\n            \r\n            \r\n            \r\n            <p>We wensen haar/hem veel succes in de toekomst.</p>\r\n            \r\n            \r\n            \r\n            <p>Eerlijk,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Handtekening</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(11, 'pl', '<h3 style=\"text-align: center;\">Certyfikat braku sprzeciwu</h3>\r\n            \r\n            \r\n            \r\n            <p>Data: {date}</p>\r\n            \r\n            \r\n            \r\n            <p>Do kogo to może dotyczyć</p>\r\n            \r\n            \r\n            \r\n            <p>Ten certyfikat służy do ubiegania się o Certyfikat No Objection Certificate (NoC) dla Pani/Pana {employee_name}, jeśli ona/ona dołącza i świadczy swoje usługi na rzecz jakiejkolwiek innej organizacji. Jest o tym informowany, ponieważ wyczyścił wszystkie swoje salda i otrzymał swoje zabezpieczenie od firmy {app_name}.</p>\r\n            \r\n            \r\n            \r\n            <p>Życzymy jej/jej powodzenia w przyszłości.</p>\r\n            \r\n            \r\n            \r\n            <p>Z poważaniem,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Podpis</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(12, 'pt', '<h3 style=\"text-align: center;\">Certificado de n&atilde;o obje&ccedil;&atilde;o</h3>\r\n            \r\n            \r\n            \r\n            <p>Data: {date}</p>\r\n            \r\n            \r\n            \r\n            <p>A quem interessar</p>\r\n            \r\n            \r\n            \r\n            <p>Este certificado &eacute; para reivindicar um Certificado de N&atilde;o Obje&ccedil;&atilde;o (NoC) para a Sra. / Sr. {employee_name} se ela ingressar e fornecer seus servi&ccedil;os a qualquer outra organiza&ccedil;&atilde;o. &Eacute; informado que ela cancelou todos os seus saldos e recebeu sua garantia da empresa {app_name}.</p>\r\n            \r\n            \r\n            \r\n            <p>Desejamos-lhe boa sorte no futuro.</p>\r\n            \r\n            \r\n            \r\n            <p>Sinceramente,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Assinatura</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(13, 'ru', '<h3 style=\"text-align: center;\">Сертификат об отсутствии возражений</h3>\r\n            \r\n            \r\n            \r\n            <p>Дата: {date}</p>\r\n            \r\n            \r\n            \r\n            <p>Кого бы это ни касалось</p>\r\n            \r\n            \r\n            \r\n            <p>Этот сертификат предназначен для получения Сертификата об отсутствии возражений (NoC) для г-жи / г-на {employee_name}, если она / он присоединяется и предоставляет свои услуги любой другой организации. Сообщается, что она/он очистила все свои балансы и получила свою безопасность от компании {app_name}.</p>\r\n            \r\n            \r\n            \r\n            <p>Мы желаем ей/ему удачи в будущем.</p>\r\n            \r\n            \r\n            \r\n            <p>Искренне,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Подпись</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(14, 'tr', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>İtiraz Yok Belgesi</strong></span></p>\r\n            \r\n            <p>Tarih: {date}</p>\r\n            \r\n            <p>İlgilenebilecek Kişiye</p>\r\n            \r\n            <p>Bu sertifika, Bayan / Bay için bir İtiraz Yok Sertifikası (NoC) talep etmek içindir {employee_name} başka bir kuruluşa katılır ve hizmet verirse. Tüm bakiyelerini kapattığı ve teminatını aldığı bilgisi verilir {app_name} Şirket.</p>\r\n            \r\n            <p>Kendisine gelecekte iyi şanslar diliyoruz.</p>\r\n            \r\n            <p>Samimi olarak,</p>\r\n            <p>{employee_name}</p>\r\n            <p>{designation}</p>\r\n            <p>İmza</p>\r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(15, 'zh', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>无异议证书</strong></span></p>\r\n            \r\n            <p>日期: {date}</p>\r\n            \r\n            <p>致相关负责人</p>\r\n            \r\n            <p>此证书旨在为女士/先生申请无异议证书（NoC）。{employee_name} 如果她/他加入任何其他组织并向其提供服务。据了解，她/他已结清所有余额并从以下机构收到她/他的担保： {app_name} 公司.</p>\r\n            \r\n            <p>我们祝她/他未来好运.</p>\r\n            \r\n            <p>真挚地,</p>\r\n            <p>{employee_name}</p>\r\n            <p>{designation}</p>\r\n            <p>签名</p>\r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(16, 'he', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>אין תעודת התנגדות</strong></span></p>\r\n            \r\n            <p>תַאֲרִיך: {date}</p>\r\n            \r\n            <p>לכל מאן דבעי</p>\r\n            \r\n            <p>תעודה זו מיועדת לתבוע אישור ללא התנגדות (NoC) עבור גב / מר. {employee_name} אם הוא/ה מצטרף ומספק את שירותיו/ה לכל ארגון אחר. זה מודיע כפי שהיא / הוא פינה את כל היתרות שלה / שלו וקיבל את האבטחה שלה / שלו {app_name} חֶברָה.</p>\r\n            \r\n            <p>אנו מאחלים לו/לה בהצלחה בעתיד.</p>\r\n            \r\n            <p>בכנות,</p>\r\n            <p>{employee_name}</p>\r\n            <p>{designation}</p>\r\n            <p>חֲתִימָה</p>\r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(17, 'pt-br', '<h3 style=\"text-align: center;\">Certificado de n&atilde;o obje&ccedil;&atilde;o</h3>\r\n                    \r\n            <p>Data: {date}</p>\r\n            \r\n            <p>A quem interessar</p>\r\n            \r\n            <p>Este certificado &eacute; para reivindicar um Certificado de N&atilde;o Obje&ccedil;&atilde;o (NoC) para a Sra. / Sr. {employee_name} se ela ingressar e fornecer seus servi&ccedil;os a qualquer outra organiza&ccedil;&atilde;o. &Eacute; informado que ela cancelou todos os seus saldos e recebeu sua garantia da empresa {app_name}.</p>\r\n            \r\n            <p>Desejamos-lhe boa sorte no futuro.</p>\r\n            \r\n            <p>Sinceramente,</p>\r\n            \r\n            <p>{employee_name}</p>\r\n            \r\n            <p>{designation}</p>\r\n            \r\n            <p>Assinatura</p>\r\n            \r\n            <p>{app_name}</p>', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15');

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'New Monthly Payslip', 'new_monthly_payslip', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(2, 'New Announcement', 'new_announcement', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(3, 'New Meeting', 'new_meeting', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(4, 'New Award', 'new_award', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(5, 'New Holidays', 'new_holidays', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(6, 'New Company Policy', 'new_company_policy', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(7, 'New Ticket', 'new_ticket', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(8, 'New Event', 'new_event', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(9, 'Leave Approve/Reject', 'leave_approve_reject', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(10, 'New Trip', 'new_trip', '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(11, 'New Contract', 'contract_notification', '2024-04-17 02:53:16', '2024-04-17 02:53:16');

-- --------------------------------------------------------

--
-- Table structure for table `notification_template_langs`
--

CREATE TABLE `notification_template_langs` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` int NOT NULL,
  `lang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `variables` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_template_langs`
--

INSERT INTO `notification_template_langs` (`id`, `parent_id`, `lang`, `content`, `variables`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'ar', 'تم إنشاء قسيمة دفع بتاريخ {year}.', '{\r\n                    \"Year\": \"year\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(2, 1, 'da', 'Lønseddel genereret af {year}.', '{\r\n                    \"Year\": \"year\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(3, 1, 'de', 'Gehaltsabrechnung erstellt vom {year}.', '{\r\n                    \"Year\": \"year\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(4, 1, 'en', 'Payslip generated of {year}.', '{\r\n                    \"Year\": \"year\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(5, 1, 'es', 'Nómina generada de {year}.', '{\r\n                    \"Year\": \"year\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(6, 1, 'fr', 'Fiche de paie générée de {year}.', '{\r\n                    \"Year\": \"year\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(7, 1, 'it', 'Busta paga generata da {year}.', '{\r\n                    \"Year\": \"year\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(8, 1, 'ja', '{year} の給与明細が作成されました。', '{\r\n                    \"Year\": \"year\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(9, 1, 'nl', 'Loonstrook gegenereerd van {year}.', '{\r\n                    \"Year\": \"year\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(10, 1, 'pl', 'Odcinek wypłaty wygenerowany za {year}.', '{\r\n                    \"Year\": \"year\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(11, 1, 'pt', 'Folha de pagamento gerada de {year}.', '{\r\n                    \"Year\": \"year\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(12, 1, 'ru', 'Расчетная ведомость создана за {year}.', '{\r\n                    \"Year\": \"year\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(13, 1, 'tr', 'oluşturulan maaş bordrosu {year}.', '{\r\n                    \"Year\": \"year\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(14, 1, 'zh', '生成的工资单 {year}', '{\r\n                    \"Year\": \"year\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(15, 1, 'he', 'תלוש שכר שנוצר מ {year}.', '{\r\n                    \"Year\": \"year\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(16, 1, 'pt-br', 'Folha de pagamento gerada de {year}.', '{\r\n                    \"Year\": \"year\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(17, 2, 'ar', '{announcement_title} إعلان تم إنشاؤه للفرع {branch_name} من {start_date} ل {end_date}', '{\r\n                    \"Announcement Title\": \"announcement_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(18, 2, 'da', '{announcement_title} meddelelse oprettet for filial {branch_name} fra {start_date} to {end_date}', '{\r\n                    \"Announcement Title\": \"announcement_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(19, 2, 'de', '{announcement_title} Ankündigung für Filiale erstellt {branch_name} aus {start_date} Zu {end_date}', '{\r\n                    \"Announcement Title\": \"announcement_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(20, 2, 'en', '{announcement_title} announcement created for branch {branch_name} from {start_date} to {end_date}', '{\r\n                    \"Announcement Title\": \"announcement_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(21, 2, 'es', '{announcement_title} anuncio creado para sucursal {branch_name} de {start_date} a {end_date}', '{\r\n                    \"Announcement Title\": \"announcement_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(22, 2, 'fr', '{announcement_title} annonce créée pour la filiale {branch_name} depuis {start_date} pour {end_date}', '{\r\n                    \"Announcement Title\": \"announcement_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(23, 2, 'it', '{announcement_title} annuncio creato per branch {branch_name} da {start_date} A {end_date}', '{\r\n                    \"Announcement Title\": \"announcement_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(24, 2, 'ja', '{announcement_title} ブランチ用に作成されたお知らせ {branch_name} から {start_date} に {end_date}', '{\r\n                    \"Announcement Title\": \"announcement_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(25, 2, 'nl', '{announcement_title} aankondiging gemaakt voor filiaal {branch_name} van {start_date} naar {end_date}', '{\r\n                    \"Announcement Title\": \"announcement_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(26, 2, 'pl', '{announcement_title} ogłoszenie stworzone dla oddziału {branch_name} z {start_date} Do {end_date}', '{\r\n                    \"Announcement Title\": \"announcement_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(27, 2, 'pt', '{announcement_title} anúncio criado para filial {branch_name} de {start_date} para {end_date}', '{\r\n                    \"Announcement Title\": \"announcement_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(28, 2, 'ru', '{announcement_title} объявление создано для ветки {branch_name} от {start_date} к {end_date}', '{\r\n                    \"Announcement Title\": \"announcement_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(29, 2, 'tr', '{announcement_title} şube için oluşturulan duyuru {branch_name} itibaren {start_date} ile {end_date}', '{\r\n                    \"Announcement Title\": \"announcement_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(30, 2, 'zh', '{announcement_title} 为分支机构创建的公告 {branch_name} 从 {start_date} 到 {end_date}', '{\r\n                    \"Announcement Title\": \"announcement_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(31, 2, 'he', '{announcement_title} הודעה נוצרה עבור הסניף {branch_name} מ {start_date} ל {end_date}', '{\r\n                    \"Announcement Title\": \"announcement_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(32, 2, 'pt-br', '{announcement_title} anúncio criado para filial {branch_name} de {start_date} para {end_date}', '{\r\n                    \"Announcement Title\": \"announcement_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(33, 3, 'ar', '{meeting_title} تم إنشاء الاجتماع لـ {branch_name} من {date} في {time}.', '{\r\n                    \"Meeting title\": \"meeting_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Date\": \"date\",\r\n                    \"Time\": \"time\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(34, 3, 'da', '{meeting_title} møde oprettet til {branch_name} fra {date} på {time}.', '{\r\n                    \"Meeting title\": \"meeting_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Date\": \"date\",\r\n                    \"Time\": \"time\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(35, 3, 'de', '{meeting_title} Besprechung erstellt für {branch_name} aus {date} bei {time}.', '{\r\n                    \"Meeting title\": \"meeting_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Date\": \"date\",\r\n                    \"Time\": \"time\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(36, 3, 'en', '{meeting_title} meeting created for {branch_name} from {date} at {time}.', '{\r\n                    \"Meeting title\": \"meeting_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Date\": \"date\",\r\n                    \"Time\": \"time\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(37, 3, 'es', '{meeting_title} reunión creada para {branch_name} de {date} en {time}.', '{\r\n                    \"Meeting title\": \"meeting_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Date\": \"date\",\r\n                    \"Time\": \"time\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(38, 3, 'fr', '{meeting_title} réunion créée pour {branch_name} depuis {date} à {time}.', '{\r\n                    \"Meeting title\": \"meeting_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Date\": \"date\",\r\n                    \"Time\": \"time\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(39, 3, 'it', '{meeting_title} incontro creato per {branch_name} da {date} A {time}.', '{\r\n                    \"Meeting title\": \"meeting_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Date\": \"date\",\r\n                    \"Time\": \"time\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(40, 3, 'ja', '{meeting_title} のために作成された会議 {branch_name} から {date} で {time}.', '{\r\n                    \"Meeting title\": \"meeting_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Date\": \"date\",\r\n                    \"Time\": \"time\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(41, 3, 'nl', '{meeting_title} bijeenkomst gemaakt voor {branch_name} van {date} bij {time}.', '{\r\n                    \"Meeting title\": \"meeting_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Date\": \"date\",\r\n                    \"Time\": \"time\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(42, 3, 'pl', '{meeting_title} spotkanie stworzone dla {branch_name} z {date} Na {time}.', '{\r\n                    \"Meeting title\": \"meeting_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Date\": \"date\",\r\n                    \"Time\": \"time\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(43, 3, 'pt', '{meeting_title} reunião criada para {branch_name} de {date} no {time}.', '{\r\n                    \"Meeting title\": \"meeting_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Date\": \"date\",\r\n                    \"Time\": \"time\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(44, 3, 'ru', '{meeting_title} встреча создана для {branch_name} от {date} в {time}.', '{\r\n                    \"Meeting title\": \"meeting_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Date\": \"date\",\r\n                    \"Time\": \"time\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(45, 3, 'tr', '{meeting_title} için oluşturulan toplantı {branch_name} itibaren {date} de {time}.', '{\r\n                    \"Meeting title\": \"meeting_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Date\": \"date\",\r\n                    \"Time\": \"time\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(46, 3, 'zh', '{meeting_title} 为以下目的创建的会议 {branch_name} 从 {date} 在 {time}.', '{\r\n                    \"Meeting title\": \"meeting_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Date\": \"date\",\r\n                    \"Time\": \"time\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(47, 3, 'he', '{meeting_title} פגישה נוצרה עבור {branch_name} מ {date} בְּ- {time}.', '{\r\n                    \"Meeting title\": \"meeting_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Date\": \"date\",\r\n                    \"Time\": \"time\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(48, 3, 'pt-br', '{meeting_title} reunião criada para {branch_name} de {date} no {time}.', '{\r\n                    \"Meeting title\": \"meeting_title\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Date\": \"date\",\r\n                    \"Time\": \"time\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(49, 4, 'ar', '{award_name} خلقت ل {employee_name} من {date}.', '{\r\n                    \"Award name\": \"award_name\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Date\": \"date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(50, 4, 'da', '{award_name} skabt til {employee_name} fra {date}.', '{\r\n                    \"Award name\": \"award_name\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Date\": \"date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(51, 4, 'de', '{award_name} hergestellt für {employee_name} aus {date}.', '{\r\n                    \"Award name\": \"award_name\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Date\": \"date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(52, 4, 'en', '{award_name} created for {employee_name} from {date}.', '{\r\n                    \"Award name\": \"award_name\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Date\": \"date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(53, 4, 'es', '{award_name} creado para {employee_name} de {date}.', '{\r\n                    \"Award name\": \"award_name\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Date\": \"date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(54, 4, 'fr', '{award_name} créé pour {employee_name} depuis {date}.', '{\r\n                    \"Award name\": \"award_name\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Date\": \"date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(55, 4, 'it', '{award_name} creato per {employee_name} da {date}.', '{\r\n                    \"Award name\": \"award_name\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Date\": \"date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(56, 4, 'ja', '{award_name} のために作成された {employee_name} から {date}.', '{\r\n                    \"Award name\": \"award_name\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Date\": \"date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(57, 4, 'nl', '{award_name} gemaakt voor {employee_name} van {date}.', '{\r\n                    \"Award name\": \"award_name\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Date\": \"date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(58, 4, 'pl', '{award_name} stworzone dla {employee_name} z {date}.', '{\r\n                    \"Award name\": \"award_name\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Date\": \"date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(59, 4, 'pt', '{award_name} criado para {employee_name} de {date}.', '{\r\n                    \"Award name\": \"award_name\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Date\": \"date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(60, 4, 'ru', '{award_name} предназначен для {employee_name} от {date}.', '{\r\n                    \"Award name\": \"award_name\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Date\": \"date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(61, 4, 'tr', '{award_name} için yaratıldı {employee_name} itibaren {date}.', '{\r\n                    \"Award name\": \"award_name\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Date\": \"date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(62, 4, 'zh', '{award_name} 已创建 为了 {employee_name} 从 {date}.', '{\r\n                    \"Award name\": \"award_name\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Date\": \"date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(63, 4, 'he', '{award_name} נוצר עבור {employee_name} מ {date}.', '{\r\n                    \"Award name\": \"award_name\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Date\": \"date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(64, 4, 'pt-br', '{award_name} criado para {employee_name} de {date}.', '{\r\n                    \"Award name\": \"award_name\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Date\": \"date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(65, 5, 'ar', '{occasion_name} على {start_date} ل {end_date}.', '{\r\n                    \"Occasion name\": \"occasion_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(66, 5, 'da', '{occasion_name} på {start_date} til {end_date}.', '{\r\n                    \"Occasion name\": \"occasion_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(67, 5, 'de', '{occasion_name} An {start_date} Zu {end_date}.', '{\r\n                    \"Occasion name\": \"occasion_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(68, 5, 'en', '{occasion_name} on {start_date} to {end_date}.', '{\r\n                    \"Occasion name\": \"occasion_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(69, 5, 'es', '{occasion_name} en {start_date} a {end_date}.', '{\r\n                    \"Occasion name\": \"occasion_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(70, 5, 'fr', '{occasion_name} sur {start_date} pour {end_date}.', '{\r\n                    \"Occasion name\": \"occasion_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(71, 5, 'it', '{occasion_name} SU {start_date} A {end_date}.', '{\r\n                    \"Occasion name\": \"occasion_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(72, 5, 'ja', '{occasion_name} の上 {start_date} に {end_date}.', '{\r\n                    \"Occasion name\": \"occasion_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(73, 5, 'nl', '{occasion_name} op {start_date} naar {end_date}.', '{\r\n                    \"Occasion name\": \"occasion_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(74, 5, 'pl', '{occasion_name} NA {start_date} Do {end_date}.', '{\r\n                    \"Occasion name\": \"occasion_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(75, 5, 'pt', '{occasion_name} sobre {start_date} para {end_date}.', '{\r\n                    \"Occasion name\": \"occasion_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(76, 5, 'ru', '{occasion_name} на {start_date} к {end_date}.', '{\r\n                    \"Occasion name\": \"occasion_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(77, 5, 'tr', '{occasion_name} Açık {start_date} ile {end_date}.', '{\r\n                    \"Occasion name\": \"occasion_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(78, 5, 'zh', '{occasion_name} 在 {start_date} 到 {end_date}.', '{\r\n                    \"Occasion name\": \"occasion_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(79, 5, 'he', '{occasion_name} עַל {start_date} ל {end_date}.', '{\r\n                    \"Occasion name\": \"occasion_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(80, 5, 'pt-br', '{occasion_name} sobre {start_date} para {end_date}.', '{\r\n                    \"Occasion name\": \"occasion_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(81, 6, 'ar', '{company_policy_name} ل {branch_name} مخلوق.', '{\r\n                    \"Company policy name\": \"company_policy_name\",\r\n                    \"Branch name\": \"branch_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(82, 6, 'da', '{company_policy_name} til {branch_name} oprettet.', '{\r\n                    \"Company policy name\": \"company_policy_name\",\r\n                    \"Branch name\": \"branch_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(83, 6, 'de', '{company_policy_name} für {branch_name} erstellt.', '{\r\n                    \"Company policy name\": \"company_policy_name\",\r\n                    \"Branch name\": \"branch_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(84, 6, 'en', '{company_policy_name} for {branch_name} created.', '{\r\n                    \"Company policy name\": \"company_policy_name\",\r\n                    \"Branch name\": \"branch_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(85, 6, 'es', '{company_policy_name} para {branch_name} creada.', '{\r\n                    \"Company policy name\": \"company_policy_name\",\r\n                    \"Branch name\": \"branch_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(86, 6, 'fr', '{company_policy_name} pour {branch_name} créé.', '{\r\n                    \"Company policy name\": \"company_policy_name\",\r\n                    \"Branch name\": \"branch_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(87, 6, 'it', '{company_policy_name} per {branch_name} creata.', '{\r\n                    \"Company policy name\": \"company_policy_name\",\r\n                    \"Branch name\": \"branch_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(88, 6, 'ja', '{company_policy_name} ために {branch_name} 作成した.', '{\r\n                    \"Company policy name\": \"company_policy_name\",\r\n                    \"Branch name\": \"branch_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(89, 6, 'nl', '{company_policy_name} voor {branch_name} gemaakt.', '{\r\n                    \"Company policy name\": \"company_policy_name\",\r\n                    \"Branch name\": \"branch_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(90, 6, 'pl', '{company_policy_name} Do {branch_name} Utworzony.', '{\r\n                    \"Company policy name\": \"company_policy_name\",\r\n                    \"Branch name\": \"branch_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(91, 6, 'pt', '{company_policy_name} para {branch_name} criada.', '{\r\n                    \"Company policy name\": \"company_policy_name\",\r\n                    \"Branch name\": \"branch_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(92, 6, 'ru', '{company_policy_name} для {branch_name} созданный.', '{\r\n                    \"Company policy name\": \"company_policy_name\",\r\n                    \"Branch name\": \"branch_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(93, 6, 'tr', '{company_policy_name} için {branch_name} oluşturuldu.', '{\r\n                    \"Company policy name\": \"company_policy_name\",\r\n                    \"Branch name\": \"branch_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(94, 6, 'zh', '{company_policy_name} 为了 {branch_name} 已创建.', '{\r\n                    \"Company policy name\": \"company_policy_name\",\r\n                    \"Branch name\": \"branch_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(95, 6, 'he', '{company_policy_name} ל {branch_name} נוצר.', '{\r\n                    \"Company policy name\": \"company_policy_name\",\r\n                    \"Branch name\": \"branch_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(96, 6, 'pt-br', '{company_policy_name} para {branch_name} criada.', '{\r\n                    \"Company policy name\": \"company_policy_name\",\r\n                    \"Branch name\": \"branch_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(97, 7, 'ar', 'تم إنشاء تذكرة دعم جديدة من {ticket_priority} الأولوية ل {employee_name}.', '{\r\n                    \"Ticket priority\": \"ticket_priority\",\r\n                    \"Employee Name\": \"employee_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(98, 7, 'da', 'Ny supportbillet oprettet af {ticket_priority} prioritet for {employee_name}.', '{\r\n                    \"Ticket priority\": \"ticket_priority\",\r\n                    \"Employee Name\": \"employee_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(99, 7, 'de', 'Neues Support-Ticket erstellt von {ticket_priority} Priorität für {employee_name}.', '{\r\n                    \"Ticket priority\": \"ticket_priority\",\r\n                    \"Employee Name\": \"employee_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(100, 7, 'en', 'New Support ticket created of {ticket_priority} priority for {employee_name}.', '{\r\n                    \"Ticket priority\": \"ticket_priority\",\r\n                    \"Employee Name\": \"employee_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(101, 7, 'es', 'Nuevo ticket de soporte creado de {ticket_priority} prioridad para {employee_name}.', '{\r\n                    \"Ticket priority\": \"ticket_priority\",\r\n                    \"Employee Name\": \"employee_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(102, 7, 'fr', 'Nouveau ticket de support créé de {ticket_priority} priorité pour {employee_name}.', '{\r\n                    \"Ticket priority\": \"ticket_priority\",\r\n                    \"Employee Name\": \"employee_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(103, 7, 'it', 'Nuovo ticket di supporto creato da {ticket_priority} priorità per {employee_name}.', '{\r\n                    \"Ticket priority\": \"ticket_priority\",\r\n                    \"Employee Name\": \"employee_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(104, 7, 'ja', 'の新しいサポート チケットが作成されました {ticket_priority} の優先順位 {employee_name}.', '{\r\n                    \"Ticket priority\": \"ticket_priority\",\r\n                    \"Employee Name\": \"employee_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(105, 7, 'nl', 'Nieuw supportticket gemaakt van {ticket_priority} prioriteit voor {employee_name}.', '{\r\n                    \"Ticket priority\": \"ticket_priority\",\r\n                    \"Employee Name\": \"employee_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(106, 7, 'pl', 'Utworzono nowe zgłoszenie do pomocy technicznej {ticket_priority} priorytet dla {employee_name}.', '{\r\n                    \"Ticket priority\": \"ticket_priority\",\r\n                    \"Employee Name\": \"employee_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(107, 7, 'pt', 'Novo ticket de suporte criado de {ticket_priority} prioridade para {employee_name}.', '{\r\n                    \"Ticket priority\": \"ticket_priority\",\r\n                    \"Employee Name\": \"employee_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(108, 7, 'ru', 'Создан новый тикет в службу поддержки {ticket_priority} приоритет для {employee_name}.', '{\r\n                    \"Ticket priority\": \"ticket_priority\",\r\n                    \"Employee Name\": \"employee_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(109, 7, 'tr', 'Şunun için yeni Destek bileti oluşturuldu {ticket_priority} için öncelik {employee_name}.', '{\r\n                    \"Ticket priority\": \"ticket_priority\",\r\n                    \"Employee Name\": \"employee_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(110, 7, 'zh', '新的支持票证创建于 {ticket_priority} 优先于 {employee_name}.', '{\r\n                    \"Ticket priority\": \"ticket_priority\",\r\n                    \"Employee Name\": \"employee_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(111, 7, 'he', 'כרטיס תמיכה חדש נוצר מ {ticket_priority} עדיפות עבור {employee_name}.', '{\r\n                    \"Ticket priority\": \"ticket_priority\",\r\n                    \"Employee Name\": \"employee_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(112, 7, 'pt-br', 'Novo ticket de suporte criado de {ticket_priority} prioridade para {employee_name}.', '{\r\n                    \"Ticket priority\": \"ticket_priority\",\r\n                    \"Employee Name\": \"employee_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(113, 8, 'ar', '{event_name} للفرع {branch_name} من {start_date} ل {end_date}', '{\r\n                    \"Event name\": \"event_name\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(114, 8, 'da', '{event_name} for filial {branch_name} fra {start_date} til {end_date}', '{\r\n                    \"Event name\": \"event_name\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(115, 8, 'de', '{event_name} für Filiale {branch_name} aus {start_date} Zu {end_date}', '{\r\n                    \"Event name\": \"event_name\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(116, 8, 'en', '{event_name} for branch {branch_name} from {start_date} to {end_date}', '{\r\n                    \"Event name\": \"event_name\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(117, 8, 'es', '{event_name} para rama {branch_name} de {start_date} a {end_date}', '{\r\n                    \"Event name\": \"event_name\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(118, 8, 'fr', '{event_name} pour la branche {branch_name} depuis {start_date} pour {end_date}', '{\r\n                    \"Event name\": \"event_name\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(119, 8, 'it', '{event_name} per ramo {branch_name} da {start_date} A {end_date}', '{\r\n                    \"Event name\": \"event_name\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(120, 8, 'ja', '{event_name} 支店用 {branch_name} から {start_date} に {end_date}', '{\r\n                    \"Event name\": \"event_name\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(121, 8, 'nl', '{event_name} voor filiaal {branch_name} van {start_date} naar {end_date}', '{\r\n                    \"Event name\": \"event_name\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(122, 8, 'pl', '{event_name} dla oddziału {branch_name} z {start_date} Do {end_date}', '{\r\n                    \"Event name\": \"event_name\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(123, 8, 'pt', '{event_name} para ramo {branch_name} de {start_date} para {end_date}', '{\r\n                    \"Event name\": \"event_name\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(124, 8, 'ru', '{event_name} для филиала {branch_name} от {start_date} к {end_date}', '{\r\n                    \"Event name\": \"event_name\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(125, 8, 'tr', '{event_name} şube için {branch_name} itibaren {start_date} ile {end_date}', '{\r\n                    \"Event name\": \"event_name\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(126, 8, 'zh', '{event_name} 对于分支机构 {branch_name} 从 {start_date} 到 {end_date}', '{\r\n                    \"Event name\": \"event_name\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(127, 8, 'he', '{event_name} עבור סניף {branch_name} מ {start_date} ל {end_date}', '{\r\n                    \"Event name\": \"event_name\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(128, 8, 'pt-br', '{event_name} para ramo {branch_name} de {start_date} para {end_date}', '{\r\n                    \"Event name\": \"event_name\",\r\n                    \"Branch name\": \"branch_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(129, 9, 'ar', 'لقد كانت إجازتك {leave_status}.', '{\r\n                    \"Leave Status\": \"leave_status\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(130, 9, 'da', 'Din orlov har været {leave_status}.', '{\r\n                    \"Leave Status\": \"leave_status\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(131, 9, 'de', 'Ihr Urlaub war {leave_status}.', '{\r\n                    \"Leave Status\": \"leave_status\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(132, 9, 'en', 'Your leave has been {leave_status}.', '{\r\n                    \"Leave Status\": \"leave_status\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(133, 9, 'es', 'Tu permiso ha sido {leave_status}.', '{\r\n                    \"Leave Status\": \"leave_status\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(134, 9, 'fr', 'Votre congé a été {leave_status}.', '{\r\n                    \"Leave Status\": \"leave_status\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(135, 9, 'it', 'Il tuo congedo è stato {leave_status}.', '{\r\n                    \"Leave Status\": \"leave_status\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(136, 9, 'ja', 'あなたの休暇は {leave_status}.', '{\r\n                    \"Leave Status\": \"leave_status\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(137, 9, 'nl', 'Je verlof is geweest {leave_status}.', '{\r\n                    \"Leave Status\": \"leave_status\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(138, 9, 'pl', 'Twój urlop był {leave_status}.', '{\r\n                    \"Leave Status\": \"leave_status\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(139, 9, 'pt', 'sua licença foi {leave_status}.', '{\r\n                    \"Leave Status\": \"leave_status\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(140, 9, 'ru', 'Ваш отпуск был {leave_status}.', '{\r\n                    \"Leave Status\": \"leave_status\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(141, 9, 'tr', 'İzniniz oldu {leave_status}.', '{\r\n                    \"Leave Status\": \"leave_status\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(142, 9, 'zh', '你的假期已经 {leave_status}.', '{\r\n                    \"Leave Status\": \"leave_status\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(143, 9, 'he', 'החופש שלך היה {leave_status}.', '{\r\n                    \"Leave Status\": \"leave_status\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(144, 9, 'pt-br', 'sua licença foi {leave_status}.', '{\r\n                    \"Leave Status\": \"leave_status\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(145, 10, 'ar', '{purpose_of_visit} تم إنشاؤه للزيارة {place_of_visit} ل {employee_name} من {start_date} ل {end_date}.', '{\r\n                    \"Purpose of visit\": \"purpose_of_visit\",\r\n                    \"Place of visit\": \"place_of_visit\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(146, 10, 'da', '{purpose_of_visit} er skabt til at besøge {place_of_visit} til {employee_name} fra {start_date} til {end_date}.', '{\r\n                    \"Purpose of visit\": \"purpose_of_visit\",\r\n                    \"Place of visit\": \"place_of_visit\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(147, 10, 'de', '{purpose_of_visit} ist zum Besuchen angelegt {place_of_visit} für {employee_name} aus {start_date} Zu {end_date}.', '{\r\n                    \"Purpose of visit\": \"purpose_of_visit\",\r\n                    \"Place of visit\": \"place_of_visit\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(148, 10, 'en', '{purpose_of_visit} is created to visit {place_of_visit} for {employee_name} from {start_date} to {end_date}.', '{\r\n                    \"Purpose of visit\": \"purpose_of_visit\",\r\n                    \"Place of visit\": \"place_of_visit\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(149, 10, 'es', '{purpose_of_visit} se crea para visitar {place_of_visit} para {employee_name} de {start_date} a {end_date}.', '{\r\n                    \"Purpose of visit\": \"purpose_of_visit\",\r\n                    \"Place of visit\": \"place_of_visit\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(150, 10, 'fr', '{purpose_of_visit} est créé pour visiter {place_of_visit} pour {employee_name} depuis {start_date} pour {end_date}.', '{\r\n                    \"Purpose of visit\": \"purpose_of_visit\",\r\n                    \"Place of visit\": \"place_of_visit\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(151, 10, 'it', '{purpose_of_visit} è creato per visitare {place_of_visit} for {employee_name} per {start_date} A {end_date}.', '{\r\n                    \"Purpose of visit\": \"purpose_of_visit\",\r\n                    \"Place of visit\": \"place_of_visit\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(152, 10, 'ja', '{purpose_of_visit} 訪問するために作成されます {place_of_visit} ために {employee_name} から {start_date} に {end_date}.', '{\r\n                    \"Purpose of visit\": \"purpose_of_visit\",\r\n                    \"Place of visit\": \"place_of_visit\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(153, 10, 'nl', '{purpose_of_visit} is gemaakt om te bezoeken {place_of_visit} voor {employee_name} van {start_date} naar {end_date}.', '{\r\n                    \"Purpose of visit\": \"purpose_of_visit\",\r\n                    \"Place of visit\": \"place_of_visit\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(154, 10, 'pl', '{purpose_of_visit} jest stworzony do zwiedzania {place_of_visit} Do {employee_name} z {start_date} Do {end_date}.', '{\r\n                    \"Purpose of visit\": \"purpose_of_visit\",\r\n                    \"Place of visit\": \"place_of_visit\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(155, 10, 'pt', '{purpose_of_visit} é criado para visitar {place_of_visit} para {employee_name} de {start_date} para {end_date}.', '{\r\n                    \"Purpose of visit\": \"purpose_of_visit\",\r\n                    \"Place of visit\": \"place_of_visit\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(156, 10, 'ru', '{purpose_of_visit} создан для посещения {place_of_visit} для {employee_name} от {start_date} к {end_date}.', '{\r\n                    \"Purpose of visit\": \"purpose_of_visit\",\r\n                    \"Place of visit\": \"place_of_visit\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(157, 10, 'tr', '{purpose_of_visit} ziyaret etmek için yaratılmıştır {place_of_visit} için {employee_name} itibaren {start_date} ile {end_date}.', '{\r\n                    \"Purpose of visit\": \"purpose_of_visit\",\r\n                    \"Place of visit\": \"place_of_visit\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16');
INSERT INTO `notification_template_langs` (`id`, `parent_id`, `lang`, `content`, `variables`, `created_by`, `created_at`, `updated_at`) VALUES
(158, 10, 'zh', '{purpose_of_visit} 被创建来访问 {place_of_visit} 为了 {employee_name} 从 {start_date} 到 {end_date}.', '{\r\n                    \"Purpose of visit\": \"purpose_of_visit\",\r\n                    \"Place of visit\": \"place_of_visit\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(159, 10, 'he', '{purpose_of_visit} נוצר כדי לבקר {place_of_visit} ל {employee_name} מ {start_date} ל {end_date}.', '{\r\n                    \"Purpose of visit\": \"purpose_of_visit\",\r\n                    \"Place of visit\": \"place_of_visit\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(160, 10, 'pt-br', '{purpose_of_visit} é criado para visitar {place_of_visit} para {employee_name} de {start_date} para {end_date}.', '{\r\n                    \"Purpose of visit\": \"purpose_of_visit\",\r\n                    \"Place of visit\": \"place_of_visit\",\r\n                    \"Employee Name\": \"employee_name\",\r\n                    \"Start Date\": \"start_date\",\r\n                    \"End Date\": \"end_date\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(161, 11, 'ar', 'تم إنشاء الفاتورة الجديدة {contract_number} بواسطة {contract_company_name}.', '{\r\n                    \"Contract number\": \"contract_number\",\r\n                    \"Contract company name\": \"contract_company_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(162, 11, 'da', 'Ny faktura {contract_number} oprettet af {contract_company_name}.', '{\r\n                    \"Contract number\": \"contract_number\",\r\n                    \"Contract company name\": \"contract_company_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(163, 11, 'de', 'Neue Rechnung {contract_number} erstellt von {contract_company_name}.', '{\r\n                    \"Contract number\": \"contract_number\",\r\n                    \"Contract company name\": \"contract_company_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(164, 11, 'en', 'New Invoice {contract_number} created by {contract_company_name}.', '{\r\n                    \"Contract number\": \"contract_number\",\r\n                    \"Contract company name\": \"contract_company_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(165, 11, 'es', 'Nueva factura {contract_number} creada por {contract_company_name}.', '{\r\n                    \"Contract number\": \"contract_number\",\r\n                    \"Contract company name\": \"contract_company_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(166, 11, 'fr', 'Nouvelle facture {contract_number} créée par {contract_company_name}.', '{\r\n                    \"Contract number\": \"contract_number\",\r\n                    \"Contract company name\": \"contract_company_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(167, 11, 'it', 'Nuova fattura {contract_number} creata da {contract_company_name}.', '{\r\n                    \"Contract number\": \"contract_number\",\r\n                    \"Contract company name\": \"contract_company_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(168, 11, 'ja', '{contract_company_name} によって作成された新しい請求書 {contract_number}。', '{\r\n                    \"Contract number\": \"contract_number\",\r\n                    \"Contract company name\": \"contract_company_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(169, 11, 'nl', 'Nieuwe factuur {contract_number} gemaakt door {contract_company_name}.', '{\r\n                    \"Contract number\": \"contract_number\",\r\n                    \"Contract company name\": \"contract_company_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(170, 11, 'pl', 'Nowa faktura {contract_number} utworzona przez firmę {contract_company_name}.', '{\r\n                    \"Contract number\": \"contract_number\",\r\n                    \"Contract company name\": \"contract_company_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(171, 11, 'pt', 'Nova fatura {contract_number} criada por {contract_company_name}.', '{\r\n                    \"Contract number\": \"contract_number\",\r\n                    \"Contract company name\": \"contract_company_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(172, 11, 'ru', 'Новый счет {contract_number}, созданный {contract_company_name}.', '{\r\n                    \"Contract number\": \"contract_number\",\r\n                    \"Contract company name\": \"contract_company_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(173, 11, 'tr', 'Yeni fatura {contract_number} tarafından yaratıldı {contract_company_name}.', '{\r\n                    \"Contract number\": \"contract_number\",\r\n                    \"Contract company name\": \"contract_company_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(174, 11, 'zh', '新发票 {contract_number} 由...制作 {contract_company_name}.', '{\r\n                    \"Contract number\": \"contract_number\",\r\n                    \"Contract company name\": \"contract_company_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(175, 11, 'he', 'חשבונית חדשה {contract_number} נוצר על ידי {contract_company_name}.', '{\r\n                    \"Contract number\": \"contract_number\",\r\n                    \"Contract company name\": \"contract_company_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(176, 11, 'pt-br', 'Nova fatura {contract_number} criada por {contract_company_name}.', '{\r\n                    \"Contract number\": \"contract_number\",\r\n                    \"Contract company name\": \"contract_company_name\"\r\n                  }', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16');

-- --------------------------------------------------------

--
-- Table structure for table `other_payments`
--

CREATE TABLE `other_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` int NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,2) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `overtimes`
--

CREATE TABLE `overtimes` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` int NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_of_days` int NOT NULL,
  `hours` int NOT NULL,
  `rate` double(15,2) NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
-- Table structure for table `payees`
--

CREATE TABLE `payees` (
  `id` bigint UNSIGNED NOT NULL,
  `payee_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payers`
--

CREATE TABLE `payers` (
  `id` bigint UNSIGNED NOT NULL,
  `payer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_types`
--

CREATE TABLE `payment_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payslip_types`
--

CREATE TABLE `payslip_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pay_slips`
--

CREATE TABLE `pay_slips` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` int NOT NULL,
  `net_payble` double(15,2) NOT NULL,
  `salary_month` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `basic_salary` double(15,2) NOT NULL,
  `allowance` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commission` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `saturation_deduction` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_payment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `overtime` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `performance__types`
--

CREATE TABLE `performance__types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Manage User', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(2, 'Create User', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(3, 'Edit User', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(4, 'Delete User', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(5, 'Manage Role', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(6, 'Create Role', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(7, 'Delete Role', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(8, 'Edit Role', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(9, 'Manage Award', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(10, 'Create Award', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(11, 'Delete Award', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(12, 'Edit Award', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(13, 'Manage Transfer', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(14, 'Create Transfer', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(15, 'Delete Transfer', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(16, 'Edit Transfer', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(17, 'Manage Resignation', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(18, 'Create Resignation', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(19, 'Edit Resignation', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(20, 'Delete Resignation', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(21, 'Manage Travel', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(22, 'Create Travel', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(23, 'Edit Travel', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(24, 'Delete Travel', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(25, 'Manage Promotion', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(26, 'Create Promotion', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(27, 'Edit Promotion', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(28, 'Delete Promotion', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(29, 'Manage Complaint', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(30, 'Create Complaint', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(31, 'Edit Complaint', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(32, 'Delete Complaint', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(33, 'Manage Warning', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(34, 'Create Warning', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(35, 'Edit Warning', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(36, 'Delete Warning', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(37, 'Manage Termination', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(38, 'Create Termination', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(39, 'Edit Termination', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(40, 'Delete Termination', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(41, 'Manage Department', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(42, 'Create Department', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(43, 'Edit Department', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(44, 'Delete Department', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(45, 'Manage Designation', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(46, 'Create Designation', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(47, 'Edit Designation', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(48, 'Delete Designation', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(49, 'Manage Document Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(50, 'Create Document Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(51, 'Edit Document Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(52, 'Delete Document Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(53, 'Manage Branch', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(54, 'Create Branch', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(55, 'Edit Branch', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(56, 'Delete Branch', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(57, 'Manage Award Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(58, 'Create Award Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(59, 'Edit Award Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(60, 'Delete Award Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(61, 'Manage Termination Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(62, 'Create Termination Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(63, 'Edit Termination Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(64, 'Delete Termination Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(65, 'Manage Employee', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(66, 'Create Employee', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(67, 'Edit Employee', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(68, 'Delete Employee', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(69, 'Show Employee', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(70, 'Manage Payslip Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(71, 'Create Payslip Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(72, 'Edit Payslip Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(73, 'Delete Payslip Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(74, 'Manage Allowance Option', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(75, 'Create Allowance Option', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(76, 'Edit Allowance Option', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(77, 'Delete Allowance Option', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(78, 'Manage Loan Option', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(79, 'Create Loan Option', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(80, 'Edit Loan Option', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(81, 'Delete Loan Option', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(82, 'Manage Deduction Option', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(83, 'Create Deduction Option', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(84, 'Edit Deduction Option', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(85, 'Delete Deduction Option', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(86, 'Manage Set Salary', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(87, 'Create Set Salary', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(88, 'Edit Set Salary', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(89, 'Delete Set Salary', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(90, 'Manage Allowance', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(91, 'Create Allowance', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(92, 'Edit Allowance', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(93, 'Delete Allowance', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(94, 'Create Commission', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(95, 'Create Loan', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(96, 'Create Saturation Deduction', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(97, 'Create Other Payment', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(98, 'Create Overtime', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(99, 'Edit Commission', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(100, 'Delete Commission', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(101, 'Edit Loan', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(102, 'Delete Loan', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(103, 'Edit Saturation Deduction', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(104, 'Delete Saturation Deduction', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(105, 'Edit Other Payment', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(106, 'Delete Other Payment', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(107, 'Edit Overtime', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(108, 'Delete Overtime', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(109, 'Manage Pay Slip', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(110, 'Create Pay Slip', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(111, 'Edit Pay Slip', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(112, 'Delete Pay Slip', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(113, 'Manage Account List', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(114, 'Create Account List', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(115, 'Edit Account List', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(116, 'Delete Account List', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(117, 'View Balance Account List', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(118, 'Manage Payee', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(119, 'Create Payee', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(120, 'Edit Payee', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(121, 'Delete Payee', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(122, 'Manage Payer', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(123, 'Create Payer', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(124, 'Edit Payer', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(125, 'Delete Payer', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(126, 'Manage Expense Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(127, 'Create Expense Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(128, 'Edit Expense Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(129, 'Delete Expense Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(130, 'Manage Income Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(131, 'Edit Income Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(132, 'Delete Income Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(133, 'Create Income Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(134, 'Manage Payment Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(135, 'Create Payment Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(136, 'Edit Payment Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(137, 'Delete Payment Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(138, 'Manage Deposit', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(139, 'Create Deposit', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(140, 'Edit Deposit', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(141, 'Delete Deposit', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(142, 'Manage Expense', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(143, 'Create Expense', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(144, 'Edit Expense', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(145, 'Delete Expense', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(146, 'Manage Transfer Balance', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(147, 'Create Transfer Balance', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(148, 'Edit Transfer Balance', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(149, 'Delete Transfer Balance', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(150, 'Manage Event', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(151, 'Create Event', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(152, 'Edit Event', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(153, 'Delete Event', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(154, 'Manage Announcement', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(155, 'Create Announcement', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(156, 'Edit Announcement', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(157, 'Delete Announcement', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(158, 'Manage Leave Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(159, 'Create Leave Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(160, 'Edit Leave Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(161, 'Delete Leave Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(162, 'Manage Leave', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(163, 'Create Leave', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(164, 'Edit Leave', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(165, 'Delete Leave', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(166, 'Manage Meeting', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(167, 'Create Meeting', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(168, 'Edit Meeting', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(169, 'Delete Meeting', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(170, 'Manage Ticket', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(171, 'Create Ticket', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(172, 'Edit Ticket', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(173, 'Delete Ticket', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(174, 'Manage Attendance', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(175, 'Create Attendance', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(176, 'Edit Attendance', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(177, 'Delete Attendance', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(178, 'Manage Language', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(179, 'Create Language', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(180, 'Manage Plan', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(181, 'Create Plan', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(182, 'Edit Plan', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(183, 'Buy Plan', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(184, 'Manage System Settings', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(185, 'Manage Company Settings', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(186, 'Manage TimeSheet', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(187, 'Create TimeSheet', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(188, 'Edit TimeSheet', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(189, 'Delete TimeSheet', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(190, 'Manage Order', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(191, 'manage coupon', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(192, 'create coupon', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(193, 'edit coupon', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(194, 'delete coupon', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(195, 'Manage Assets', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(196, 'Create Assets', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(197, 'Edit Assets', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(198, 'Delete Assets', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(199, 'Manage Document', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(200, 'Create Document', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(201, 'Edit Document', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(202, 'Delete Document', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(203, 'Manage Employee Profile', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(204, 'Show Employee Profile', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(205, 'Manage Employee Last Login', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(206, 'Manage Indicator', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(207, 'Create Indicator', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(208, 'Edit Indicator', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(209, 'Delete Indicator', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(210, 'Show Indicator', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(211, 'Manage Appraisal', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(212, 'Create Appraisal', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(213, 'Edit Appraisal', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(214, 'Delete Appraisal', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(215, 'Show Appraisal', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(216, 'Manage Goal Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(217, 'Create Goal Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(218, 'Edit Goal Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(219, 'Delete Goal Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(220, 'Manage Goal Tracking', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(221, 'Create Goal Tracking', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(222, 'Edit Goal Tracking', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(223, 'Delete Goal Tracking', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(224, 'Manage Company Policy', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(225, 'Create Company Policy', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(226, 'Edit Company Policy', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(227, 'Delete Company Policy', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(228, 'Manage Trainer', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(229, 'Create Trainer', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(230, 'Edit Trainer', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(231, 'Delete Trainer', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(232, 'Show Trainer', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(233, 'Manage Training', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(234, 'Create Training', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(235, 'Edit Training', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(236, 'Delete Training', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(237, 'Show Training', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(238, 'Manage Training Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(239, 'Create Training Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(240, 'Edit Training Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(241, 'Delete Training Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(242, 'Manage Report', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(243, 'Manage Holiday', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(244, 'Create Holiday', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(245, 'Edit Holiday', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(246, 'Delete Holiday', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(247, 'Manage Job Category', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(248, 'Create Job Category', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(249, 'Edit Job Category', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(250, 'Delete Job Category', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(251, 'Manage Job Stage', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(252, 'Create Job Stage', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(253, 'Edit Job Stage', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(254, 'Delete Job Stage', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(255, 'Manage Job', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(256, 'Create Job', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(257, 'Edit Job', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(258, 'Delete Job', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(259, 'Show Job', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(260, 'Manage Job Application', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(261, 'Create Job Application', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(262, 'Edit Job Application', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(263, 'Delete Job Application', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(264, 'Show Job Application', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(265, 'Move Job Application', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(266, 'Add Job Application Note', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(267, 'Delete Job Application Note', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(268, 'Add Job Application Skill', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(269, 'Manage Job OnBoard', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(270, 'Manage Custom Question', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(271, 'Create Custom Question', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(272, 'Edit Custom Question', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(273, 'Delete Custom Question', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(274, 'Manage Interview Schedule', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(275, 'Create Interview Schedule', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(276, 'Edit Interview Schedule', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(277, 'Delete Interview Schedule', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(278, 'Manage Career', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(279, 'Manage Competencies', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(280, 'Create Competencies', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(281, 'Edit Competencies', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(282, 'Delete Competencies', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(283, 'Manage Performance Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(284, 'Create Performance Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(285, 'Edit Performance Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(286, 'Delete Performance Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(287, 'Manage Contract Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(288, 'Create Contract Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(289, 'Edit Contract Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(290, 'Delete Contract Type', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(291, 'Manage Contract', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(292, 'Create Contract', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(293, 'Edit Contract', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(294, 'Delete Contract', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(295, 'Store Note', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(296, 'Delete Note', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(297, 'Store Comment', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(298, 'Delete Comment', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(299, 'Delete Attachment', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(300, 'Create Webhook', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(301, 'Edit Webhook', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(302, 'Delete Webhook', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(303, 'Manage Zoom meeting', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(304, 'Create Zoom meeting', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(305, 'Show Zoom meeting', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(306, 'Delete Zoom meeting', 'web', '2024-04-17 02:53:13', '2024-04-17 02:53:13');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` int NOT NULL,
  `designation_id` int NOT NULL,
  `promotion_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promotion_date` date NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resignations`
--

CREATE TABLE `resignations` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` int NOT NULL,
  `notice_date` date NOT NULL,
  `resignation_date` date NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'company', 'web', 0, '2024-04-17 02:53:13', '2024-04-17 02:53:13'),
(2, 'hr', 'web', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15'),
(3, 'employee', 'web', 1, '2024-04-17 02:53:15', '2024-04-17 02:53:15');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
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
(39, 1),
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
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(187, 1),
(188, 1),
(189, 1),
(190, 1),
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
(272, 1),
(273, 1),
(274, 1),
(275, 1),
(276, 1),
(277, 1),
(278, 1),
(279, 1),
(280, 1),
(281, 1),
(282, 1),
(283, 1),
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
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(65, 2),
(66, 2),
(67, 2),
(68, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(73, 2),
(74, 2),
(75, 2),
(76, 2),
(77, 2),
(78, 2),
(79, 2),
(80, 2),
(81, 2),
(82, 2),
(83, 2),
(84, 2),
(85, 2),
(86, 2),
(87, 2),
(88, 2),
(89, 2),
(90, 2),
(91, 2),
(92, 2),
(93, 2),
(94, 2),
(95, 2),
(96, 2),
(97, 2),
(98, 2),
(99, 2),
(100, 2),
(101, 2),
(102, 2),
(103, 2),
(104, 2),
(105, 2),
(106, 2),
(107, 2),
(108, 2),
(109, 2),
(110, 2),
(111, 2),
(112, 2),
(150, 2),
(151, 2),
(152, 2),
(153, 2),
(154, 2),
(155, 2),
(156, 2),
(157, 2),
(158, 2),
(159, 2),
(160, 2),
(161, 2),
(162, 2),
(163, 2),
(164, 2),
(165, 2),
(166, 2),
(167, 2),
(168, 2),
(169, 2),
(170, 2),
(171, 2),
(172, 2),
(173, 2),
(174, 2),
(175, 2),
(176, 2),
(177, 2),
(178, 2),
(186, 2),
(187, 2),
(188, 2),
(189, 2),
(195, 2),
(196, 2),
(197, 2),
(198, 2),
(199, 2),
(203, 2),
(204, 2),
(205, 2),
(206, 2),
(207, 2),
(208, 2),
(209, 2),
(210, 2),
(211, 2),
(212, 2),
(213, 2),
(214, 2),
(215, 2),
(216, 2),
(217, 2),
(218, 2),
(219, 2),
(220, 2),
(221, 2),
(222, 2),
(223, 2),
(224, 2),
(225, 2),
(226, 2),
(227, 2),
(228, 2),
(229, 2),
(230, 2),
(231, 2),
(232, 2),
(233, 2),
(234, 2),
(235, 2),
(236, 2),
(237, 2),
(238, 2),
(239, 2),
(240, 2),
(241, 2),
(243, 2),
(244, 2),
(245, 2),
(246, 2),
(247, 2),
(248, 2),
(249, 2),
(250, 2),
(251, 2),
(252, 2),
(253, 2),
(254, 2),
(255, 2),
(256, 2),
(257, 2),
(258, 2),
(259, 2),
(260, 2),
(261, 2),
(262, 2),
(263, 2),
(264, 2),
(265, 2),
(266, 2),
(267, 2),
(268, 2),
(269, 2),
(270, 2),
(271, 2),
(272, 2),
(273, 2),
(274, 2),
(275, 2),
(276, 2),
(277, 2),
(278, 2),
(283, 2),
(284, 2),
(285, 2),
(286, 2),
(287, 2),
(288, 2),
(289, 2),
(290, 2),
(291, 2),
(292, 2),
(293, 2),
(294, 2),
(295, 2),
(296, 2),
(297, 2),
(298, 2),
(299, 2),
(303, 2),
(305, 2),
(9, 3),
(13, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(25, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 3),
(37, 3),
(65, 3),
(67, 3),
(69, 3),
(90, 3),
(150, 3),
(154, 3),
(162, 3),
(163, 3),
(164, 3),
(165, 3),
(166, 3),
(170, 3),
(171, 3),
(172, 3),
(173, 3),
(174, 3),
(178, 3),
(186, 3),
(187, 3),
(188, 3),
(189, 3),
(199, 3),
(243, 3),
(278, 3),
(291, 3),
(295, 3),
(296, 3),
(297, 3),
(298, 3),
(299, 3),
(303, 3),
(305, 3);

-- --------------------------------------------------------

--
-- Table structure for table `saturation_deductions`
--

CREATE TABLE `saturation_deductions` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` int NOT NULL,
  `deduction_option` int NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,2) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'local_storage_validation', 'jpg,jpeg,png,xlsx,xls,csv,pdf', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(2, 'wasabi_storage_validation', 'jpg,jpeg,png,xlsx,xls,csv,pdf', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(3, 's3_storage_validation', 'jpg,jpeg,png,xlsx,xls,csv,pdf', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(4, 'local_storage_max_upload_size', '2048000', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(5, 'wasabi_max_upload_size', '2048000', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(6, 's3_max_upload_size', '2048000', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(7, 'storage_setting', 'local', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16');

-- --------------------------------------------------------

--
-- Table structure for table `set_salaries`
--

CREATE TABLE `set_salaries` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `template`
--

CREATE TABLE `template` (
  `id` bigint UNSIGNED NOT NULL,
  `template_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prompt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_json` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_tone` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `template`
--

INSERT INTO `template` (`id`, `template_name`, `prompt`, `module`, `field_json`, `is_tone`, `created_at`, `updated_at`) VALUES
(1, 'title', 'Generate a comma-separated string of common leave reasons that employees may provide to their employers. Include both personal and professional reasons for taking leave, such only ##title## . Aim to generate a diverse range of leave reasons that can be used in different situations. Please provide a comprehensive and varied list of leave reasons that can help employers understand and accommodate their employees\' needs.', 'allowance', '{\"field\":[{\"label\":\"Allowance Title\",\"placeholder\":\"e.g.Medical Allowance, Bonus Allowance\",\"field_type\":\"text_box\",\"field_name\":\"title\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(2, 'title', 'Generate a comma-separated string of common leave reasons that employees may provide to their employers. Include both personal and professional reasons for taking leave, such only ##title## . Aim to generate a diverse range of leave reasons that can be used in different situations. Please provide a comprehensive and varied list of leave reasons that can help employers understand and accommodate their employees\' needs.', 'commission', '{\"field\":[{\"label\":\"Commission Title\",\"placeholder\":\"e.g.Sales Commission, Bonus Commission\",\"field_type\":\"text_box\",\"field_name\":\"title\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(3, 'title', 'Generate a comma-separated string of common leave reasons that employees may provide to their employers. Include both personal and professional reasons for taking leave, such only ##title## . Aim to generate a diverse range of leave reasons that can be used in different situations. Please provide a comprehensive and varied list of leave reasons that can help employers understand and accommodate their employees\' needs.', 'loan', '{\"field\":[{\"label\":\"Loan Title\",\"placeholder\":\"e.g.Sales Training Loan, Other Loan\",\"field_type\":\"text_box\",\"field_name\":\"title\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(4, 'reason', 'Generate a comma-separated string of common loan reasons that employees may provide to their employers. Include both personal and professional reasons for taking loan, such only ##reason## . Aim to generate a diverse range of loan reasons that can be used in different situations. Please provide a comprehensive and varied list of loan reasons that can help employers understand and accommodate their employees\' needs.', 'loan', '{\"field\":[{\"label\":\"Leave Reason\",\"placeholder\":\"e.g.career development,health issues\",\"field_type\":\"textarea\",\"field_name\":\"reason\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(5, 'title', 'Generate a comma-separated string of common leave reasons that employees may provide to their employers. Include both personal and professional reasons for taking leave, such only ##title## . Aim to generate a diverse range of leave reasons that can be used in different situations. Please provide a comprehensive and varied list of leave reasons that can help employers understand and accommodate their employees\' needs.', 'saturation deduction', '{\"field\":[{\"label\":\"Saturation Deduction Title\",\"placeholder\":\"e.g.Saturation Deduction\",\"field_type\":\"text_box\",\"field_name\":\"title\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(6, 'title', 'Generate a comma-separated string of common leave reasons that employees may provide to their employers. Include both personal and professional reasons for taking leave, such only ##title## . Aim to generate a diverse range of leave reasons that can be used in different situations. Please provide a comprehensive and varied list of leave reasons that can help employers understand and accommodate their employees\' needs.', 'other payment', '{\"field\":[{\"label\":\"Other Payment Title\",\"placeholder\":\"e.g.Bonus Payment, Allowance Payment\",\"field_type\":\"text_box\",\"field_name\":\"title\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(7, 'title', 'Generate a comma-separated string of common leave reasons that employees may provide to their employers. Include both personal and professional reasons for taking leave, such only ##title## . Aim to generate a diverse range of leave reasons that can be used in different situations. Please provide a comprehensive and varied list of leave reasons that can help employers understand and accommodate their employees\' needs.', 'overtime', '{\"field\":[{\"label\":\"Overtime Title\",\"placeholder\":\"e.g.Overtime Pay, Overtime Earnings\",\"field_type\":\"text_box\",\"field_name\":\"title\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(8, 'remark', 'Generate a comma-separated string of common loan reasons that employees may provide to their employers. Include both personal and professional reasons for taking loan, such only ##remark## . Aim to generate a diverse range of loan reasons that can be used in different situations. Please provide a comprehensive and varied list of loan reasons that can help employers understand and accommodate their employees\' needs.', 'timesheet', '{\"field\":[{\"label\":\"Timesheet Remark\",\"placeholder\":\"e.g.Project Update,Time Management\",\"field_type\":\"textarea\",\"field_name\":\"reason\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(9, 'leave_reason', 'Generate a comma-separated string of common leave reasons that employees may provide to their employers. Include both personal and professional reasons for taking leave, such only ##leave_reason## . Aim to generate a diverse range of leave reasons that can be used in different situations. Please provide a comprehensive and varied list of leave reasons that can help employers understand and accommodate their employees\' needs.', 'leave', '{\"field\":[{\"label\":\"Leave Type\",\"placeholder\":\"e.g.illness, family emergencies,vacation\",\"field_type\":\"textarea\",\"field_name\":\"leave_reason\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(10, 'remark', 'Generate a comma-separated string of common leave reasons that employees may provide to their employers. Include both personal and professional reasons for taking leave, such only ##remark## . Aim to generate a diverse range of leave reasons that can be used in different situations. Please provide a comprehensive and varied list of leave reasons that can help employers understand and accommodate their employees\' needs.', 'leave', '{\"field\":[{\"label\":\"Leave Remark\",\"placeholder\":\"e.g.illness, family emergencies,vacation\",\"field_type\":\"textarea\",\"field_name\":\"remark\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(11, 'remark', 'Generate a comma-separated string of common leave reasons that employees may provide to their employers. Include both personal and professional reasons for taking leave, such only ##remark## . Aim to generate a diverse range of leave reasons that can be used in different situations. Please provide a comprehensive and varied list of leave reasons that can help employers understand and accommodate their employees\' needs.', 'appraisal', '{\"field\":[{\"label\":\"Appraisal Remark\",\"placeholder\":\"e.g.Communication Skills, Teamwork\",\"field_type\":\"textarea\",\"field_name\":\"remark\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(12, 'subject', 'Generate a goal subject for an employee\'s goal related type to ##type##.', 'goal tracking', '{\"field\":[{\"label\":\"Goal Type\",\"placeholder\":\"e.g.invoice, production,hiring\",\"field_type\":\"text_box\",\"field_name\":\"type\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(13, 'description', 'Generate a goal descriptions for an employee\'s goal title is ##title##.', 'goal tracking', '{\"field\":[{\"label\":\"Goal Description\",\"placeholder\":\"e.g.Invoice Accuracy\",\"field_type\":\"textarea\",\"field_name\":\"title\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(14, 'description', 'Generate a deposit descriptions for an employee\'s deposit title is ##title##.', 'deposit', '{\"field\":[{\"label\":\"Deposit Description\",\"placeholder\":\"e.g.Salary Deposit, Bonus Deposit\",\"field_type\":\"textarea\",\"field_name\":\"title\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(15, 'description', 'Generate a expense descriptions for an employee\'s expense title is ##title##.', 'expense', '{\"field\":[{\"label\":\"Expense Description\",\"placeholder\":\"e.g.Office Supplies, Travel Expenses\",\"field_type\":\"textarea\",\"field_name\":\"title\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(16, 'description', 'Generate a transfer balance descriptions for an employee\'s transfer balance title is ##title##.', 'transfer balance', '{\"field\":[{\"label\":\"Transfer Balance Description\",\"placeholder\":\"e.g.Savings Transfer\",\"field_type\":\"textarea\",\"field_name\":\"title\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(17, 'description', 'Generate a job training descriptions for a ##position## position. The training description should include responsibilities such as ##responsibilities##. Please ensure the descriptions are concise, informative, and accurately reflect the key responsibilities of a ##position##.', 'training', '{\"field\":[{\"label\":\"Position\",\"placeholder\":\"job training descriptions\",\"field_type\":\"text_box\",\"field_name\":\"position\"},{\"label\":\"Responsibilities\",\"placeholder\":\"\",\"field_type\":\"textarea\",\"field_name\":\"responsibilities\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(18, 'description', 'Generate a description for presenting the Award. The description should highlight ##description##. Emphasize the significance of the  Award as a symbol of recognition for employee\'s remarkable accomplishments and its representation of her \'##description##\' and impact on the organization. Please create a personalized and engaging description that conveys appreciation, pride, and gratitude for employee\'s contributions to the company\'s sucess', 'award', '{\"field\":[{\"label\":\"Award Description\",\"placeholder\":\"e.g.skilled, focused ,efficiency\",\"field_type\":\"textarea\",\"field_name\":\"description\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(19, 'description', 'Generate a list of common description for employee transfers within an organization. Include description such as ##description##. Please provide a comprehensive and varied list of description that can help employers understand and address employee transfer situations effectively.', 'transfer', '{\"field\":[{\"label\":\"Transfer Description\",\"placeholder\":\"e.g.career development,special projects or initiatives\",\"field_type\":\"textarea\",\"field_name\":\"description\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(20, 'description', 'Generate a description why an employee might choose to resign and request a transfer to another location within the company. Include both professional and personal reasons that could contribute to this decision. Examples may include ##reasons##. Aim to provide a comprehensive and varied description that can help employers understand and accommodate employees\' needs when considering a transfer request', 'resignation', '{\"field\":[{\"label\":\"Resignation reasons\",\"placeholder\":\"e.g.career development,health issues\",\"field_type\":\"textarea\",\"field_name\":\"reasons\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(21, 'description', 'Generate a description for organizing a company trip. The trip aims to ##aims## . Please provide a diverse description that highlight the benefits and positive outcomes associated with organizing a company trip. Focus on creating an engaging and enjoyable experience for employees while also achieving business objectives and cultivating a positive work environment.', 'travel', '{\"field\":[{\"label\":\"Aims\",\"placeholder\":\"e.g.career development,health issues\",\"field_type\":\"textarea\",\"field_name\":\"aims\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(22, 'promotion_title', 'Generate a list of promotion title suggestions for an ##role##. The promotion titles should reflect ##reasons##, and recognition of the ##role##\'s accomplishments. Please provide a diverse range of promotion titles that align with ##role## job roles and levels within the company. Aim to create titles that are both professional and descriptive, highlighting the ##role##\'s progression and impact within the organization.', 'promotion', '{\"field\":[{\"label\":\"Job\",\"placeholder\":\"e.g.doctor, developer\",\"field_type\":\"text_box\",\"field_name\":\"role\"},{\"label\":\"Promotion Reasons\",\"placeholder\":\"e.g.increased responsibility, higher position\",\"field_type\":\"textarea\",\"field_name\":\"reasons\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(23, 'description', 'Generate a promotion description for this title:##title##. ', 'promotion', '{\"field\":[{\"label\":\"Promotion Title\",\"placeholder\":\"e.g.Medical Director\",\"field_type\":\"text_box\",\"field_name\":\"title\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(24, 'title', 'Generate a list of titles for complaints related to employee and company issues. ##reasons##. Please provide a range of titles that accurately reflect common complaint categories, ensuring they are concise, descriptive, and effective in conveying the nature of the complaint. ', 'complaint', '{\"field\":[{\"label\":\"Complaint reasons\",\"placeholder\":\"e.g.unprofessional behavior, harassment,\",\"field_type\":\"textarea\",\"field_name\":\"reasons\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(25, 'description', 'Generate a Complaint description for this title:##title##. ', 'complaint', '{\"field\":[{\"label\":\"Complaint Title\",\"placeholder\":\"e.g.Unprofessional Behavior Complaint\",\"field_type\":\"text_box\",\"field_name\":\"title\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(26, 'subject', 'Generate a warning description for an employee who consistently ##subject##. The warning should address the employee\'s ##subject##, including further disciplinary action or termination of employment. Please provide a clear and firm warning message that encourages the employee to review the policy and make immediate improvements.', 'warning', '{\"field\":[{\"label\":\"Warning Subject\",\"placeholder\":\"e.g.break attendance policy\",\"field_type\":\"text_box\",\"field_name\":\"subject\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(27, 'description', 'Generate a warning description for an employee who consistently ##reasons##. The warning should address the employee\'s ##reasons##, including further disciplinary action or termination of employment. Please provide a clear and firm warning message that encourages the employee to review the policy and make immediate improvements.', 'warning', '{\"field\":[{\"label\":\"Warning reasons\",\"placeholder\":\"e.g.break attendance policy\",\"field_type\":\"textarea\",\"field_name\":\"reasons\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(28, 'description', 'Generate a termination description for  the reason :##reason##. The description should convey the company\'s regret over the decision and outline the specific concerns, such as ##reasons##. Please provide a clear and professional message that explains the decision while expressing appreciation for the employee\'s contributions. Aim to offer guidance for personal and professional growth and provide necessary instructions regarding final paycheck and return of company property.', 'termination', '{\"field\":[{\"label\":\"Termination reasons\",\"placeholder\":\"e.g.Poor Performance\",\"field_type\":\"textarea\",\"field_name\":\"reasons\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(29, 'title', 'Generate an announcement title for ##title##. The title should be attention-grabbing and informative, effectively conveying the key message to the intended audience. Please ensure the title is appropriate for the given situation, whether it\'s about a ##title##. Aim to create a title that captures the essence of the announcement and sparks interest or curiosity among the readers.', 'announcement', '{\"field\":[{\"label\":\"Announcement Title\",\"placeholder\":\"e.g.Growth Opportunities\",\"field_type\":\"text_box\",\"field_name\":\"title\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(30, 'description', 'Generate an announcement title for ##reasons##. The title should be attention-grabbing and informative, effectively conveying the key message to the intended audience. Please ensure the title is appropriate for the given situation, whether it\'s about a ##reasons##. Aim to create a title that captures the essence of the announcement and sparks interest or curiosity among the readers.', 'announcement', '{\"field\":[{\"label\":\"Announcement reasons\",\"placeholder\":\"e.g.Growth Opportunities\",\"field_type\":\"textarea\",\"field_name\":\"reasons\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(31, 'occasion', 'Generate a list of holiday occasions for celebrations and gatherings. The occasions should cover a variety of holidays and events throughout the year, such as ##name##. Please provide a diverse range of occasions that can be used for hosting parties, organizing special events, or planning festive activities. Aim to offer unique and creative ideas that cater to different cultures, traditions, and preferences.', 'holiday', '{\"field\":[{\"label\":\"Any Specific occasions\",\"placeholder\":\"e.g.Cultural Celebration\",\"field_type\":\"text_box\",\"field_name\":\"name\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(32, 'title', 'Generate a list of job titles commonly found in an ##work_place##. The job titles should cover a range of roles and responsibilities within the field of ##field##. Include positions such as ##positions##. Please provide a diverse selection of job titles that accurately reflect the various positions found in an ##work_place##.', 'job', '{\"field\":[{\"label\":\"Work Place\",\"placeholder\":\"e.g.IT Company,hospital\",\"field_type\":\"text_box\",\"field_name\":\"work_place\"},{\"label\":\"Field \",\"placeholder\":\"e.g.Backend\",\"field_type\":\"text_box\",\"field_name\":\"field\"},{\"label\":\"Positions\",\"placeholder\":\"e.g.developer,tester\",\"field_type\":\"text_box\",\"field_name\":\"positions\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(33, 'description', 'Generate a job descriptions for a ##position## position. The job description should include responsibilities such as ##responsibilities##. Please ensure the descriptions are concise, informative, and accurately reflect the key responsibilities of a ##position##.', 'job', '{\"field\":[{\"label\":\"Position\",\"placeholder\":\"job for a position\",\"field_type\":\"text_box\",\"field_name\":\"position\"},{\"label\":\"Responsibilities\",\"placeholder\":\"\",\"field_type\":\"textarea\",\"field_name\":\"responsibilities\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(34, 'requirement', 'Generate a comma-separated string of job requirements for a ##position## position. The requirements should include ##description##. Please provide the requirements in a comma-separated string format.', 'job', '{\"field\":[{\"label\":\"Position\",\"placeholder\":\"requirement of job\",\"field_type\":\"text_box\",\"field_name\":\"position\"},{\"label\":\"Description\",\"placeholder\":\"\",\"field_type\":\"textarea\",\"field_name\":\"description\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(35, 'comment', 'Generate an announcement title for ##comment##. The title should be attention-grabbing and informative, effectively conveying the key message to the intended audience. Please ensure the title is appropriate for the given situation, whether it\'s about a ##comment##. Aim to create a title that captures the essence of the announcement and sparks interest or curiosity among the readers.', 'interview-schedule', '{\"field\":[{\"label\":\"Interview Schedule Comment\",\"placeholder\":\"e.g.Growth Opportunities\",\"field_type\":\"textarea\",\"field_name\":\"comment\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(36, 'title', 'Generate a creative and engaging event title for an upcoming event. The event can be a ##name##. Please focus on creating a title that captures the essence of the event, sparks curiosity, and encourages attendance. Aim to make the title memorable, intriguing, and aligned with the purpose and theme of the event. Consider the target audience, event objectives, and any specific keywords or ideas you would like to incorporate', 'event', '{\"field\":[{\"label\":\"Specific type of event\",\"placeholder\":\"e.g.conference, workshop, seminar\",\"field_type\":\"text_box\",\"field_name\":\"name\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(37, 'description', 'Generate a meeting title that is catchy and informative. The title should effectively convey the purpose and focus of the meeting, whether it\'s for ##description##. Please aim to create a title that grabs the attention of participants, reflects the importance of the meeting, and provides a clear understanding of what will be discussed or accomplished during the session.', 'event', '{\"field\":[{\"label\":\"Event Description\",\"placeholder\":\"e.g.conference, workshop\",\"field_type\":\"textarea\",\"field_name\":\"description\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(38, 'title', 'Generate a meeting title that is catchy and informative. The title should effectively convey the purpose and focus of the meeting, whether it\'s for ##purpose##. Please aim to create a title that grabs the attention of participants, reflects the importance of the meeting, and provides a clear understanding of what will be discussed or accomplished during the session.', 'meeting', '{\"field\":[{\"label\":\"Meeting purpose\",\"placeholder\":\"e.g.conference, workshop\",\"field_type\":\"text_box\",\"field_name\":\"purpose\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(39, 'note', 'Generate a meeting title that is catchy and informative. The title should effectively convey the purpose and focus of the meeting, whether it\'s for ##note##. Please aim to create a title that grabs the attention of participants, reflects the importance of the meeting, and provides a clear understanding of what will be discussed or accomplished during the session.', 'meeting', '{\"field\":[{\"label\":\"Meeting Note\",\"placeholder\":\"e.g.conference, workshop\",\"field_type\":\"textarea\",\"field_name\":\"note\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(40, 'title', 'Generate a meeting title that is catchy and informative. The title should effectively convey the purpose and focus of the meeting, whether it\'s for ##title##. Please aim to create a title that grabs the attention of participants, reflects the importance of the meeting, and provides a clear understanding of what will be discussed or accomplished during the session.', 'zoom-meeting', '{\"field\":[{\"label\":\"Zoom Meeting Title\",\"placeholder\":\"e.g.conference, workshop\",\"field_type\":\"text_box\",\"field_name\":\"title\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(41, 'description', 'Generate a descriptive response for a given ##title##. The response should be detailed, engaging, and informative, providing relevant information and capturing the reader\'s interest', 'account-assets', '{\"field\":[{\"label\":\"Asset Description\",\"placeholder\":\"HR may provide some devices \",\"field_type\":\"textarea\",\"field_name\":\"title\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(42, 'description', 'Generate a description based on a given document name:##title##. The document name: ##title## represents a specific file or document, and you need a descriptive summary or overview of its contents. Please provide a clear and concise description that captures the main points, purpose, or key information contained within the document. Aim to create a brief but informative description that gives the reader an understanding of what they can expect when accessing or reviewing the document.', 'document-upload', '{\"field\":[{\"label\":\"Document Description\",\"placeholder\":\"e.g. Employee handbook\",\"field_type\":\"textarea\",\"field_name\":\"title\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(43, 'title', 'Generate a suitable title for the company policy regarding ##description##. The title should be clear, concise, and informative, effectively conveying the purpose and scope of the policy. Please ensure that the title reflects the importance of ##description##. Aim to create a title that is professional, easily understandable, and aligned with the company\'s culture and values.', 'company-policy', '{\"field\":[{\"label\":\"Description of policy\",\"placeholder\":\"e.g.Leave policies,Performance management\",\"field_type\":\"textarea\",\"field_name\":\"description\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(44, 'description', 'generate description for this title ##title##', 'company-policy', '{\"field\":[{\"label\":\" Company Policy Description \",\"placeholder\":\"e.g.Accounts Receivable,Office Equipment\",\"field_type\":\"textarea\",\"field_name\":\"title\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(45, 'subject', 'generate contract subject for this contract description ##description##', 'contract', '{\"field\":[{\"label\":\"Contract Subject\",\"placeholder\":\"e.g.Terms and Conditions\",\"field_type\":\"textarea\",\"field_name\":\"description\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(46, 'description', 'generate contract description for this contract subject ##subject##', 'contract', '{\"field\":[{\"label\":\"Contract Description\",\"placeholder\":\"e.g.Legal Protection,Terms and Conditions\",\"field_type\":\"textarea\",\"field_name\":\"subject\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(47, 'title', 'generate example of  subject for bug in ecommerce base website support ticket', 'ticket', '{\"field\":[{\"label\":\"Ticket Subject\",\"placeholder\":\"e.g.Bug Summary\",\"field_type\":\"text_box\",\"field_name\":\"title\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(48, 'description', 'generate support ticket description of  subject for ##description## ', 'ticket', '{\"field\":[{\"label\":\"Ticket Description\",\"placeholder\":\"e.g.Error Message Displayed\",\"field_type\":\"textarea\",\"field_name\":\"description\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(49, 'content', 'Generate a meeting notification message for an ##topic## meeting. Include the date, time, location, and a brief agenda with three key discussion points.', 'notification-templates', '{\"field\":[{\"label\":\"Notification Message\",\"placeholder\":\"e.g.brief explanation of the purpose or background of the notification\",\"field_type\":\"textarea\",\"field_name\":\"topic\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(50, 'meta_title', 'Write SEO meta title for:\n\n ##description## \n\nWebsite name is:\n ##title## \n\nSeed words:\n ##keywords## \n\n', 'seo', '{\"field\":[{\"label\":\"Website Name\",\"placeholder\":\"e.g. Amazon, Google\",\"field_type\":\"text_box\",\"field_name\":\"title\"},{\"label\":\"Website Description\",\"placeholder\":\"e.g. Describe what your website or business do\",\"field_type\":\"textarea\",\"field_name\":\"description\"},{\"label\":\"Keywords\",\"placeholder\":\"e.g.  cloud services, databases\",\"field_type\":\"text_box\",\"field_name\":\"keywords\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(51, 'meta_description', 'Write SEO meta description for:\n\n ##description## \n\nWebsite name is:\n ##title## \n\nSeed words:\n ##keywords## \n\n', 'seo', '{\"field\":[{\"label\":\"Website Name\",\"placeholder\":\"e.g. Amazon, Google\",\"field_type\":\"text_box\",\"field_name\":\"title\"},{\"label\":\"Website Description\",\"placeholder\":\"e.g. Describe what your website or business do\",\"field_type\":\"textarea\",\"field_name\":\"description\"},{\"label\":\"Keywords\",\"placeholder\":\"e.g.  cloud services, databases\",\"field_type\":\"text_box\",\"field_name\":\"keywords\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(52, 'cookie_title', 'please suggest me cookie title for this ##description## website which i can use in my website cookie', 'cookie', '{\"field\":[{\"label\":\"Website name or info\",\"placeholder\":\"e.g. example website \",\"field_type\":\"textarea\",\"field_name\":\"title\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(53, 'cookie_description', 'please suggest me  Cookie description for this cookie title ##title##  which i can use in my website cookie', 'cookie', '{\"field\":[{\"label\":\"Cookie Title \",\"placeholder\":\"e.g. example website \",\"field_type\":\"text_box\",\"field_name\":\"title\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(54, 'strictly_cookie_title', 'please suggest me only Strictly Cookie Title for this ##description## website which i can use in my website cookie', 'cookie', '{\"field\":[{\"label\":\"Website name or info\",\"placeholder\":\"e.g. example website \",\"field_type\":\"textarea\",\"field_name\":\"title\"}]}', 0, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(55, 'strictly_cookie_description', 'please suggest me Strictly Cookie description for this Strictly cookie title ##title##  which i can use in my website cookie', 'cookie', '{\"field\":[{\"label\":\"Strictly Cookie Title \",\"placeholder\":\"e.g. example website \",\"field_type\":\"text_box\",\"field_name\":\"title\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(56, 'more_information_description', 'I need assistance in crafting compelling content for my ##web_name## website\'s \'Contact Us\' page of my website. The page should provide relevant information to users, encourage them to reach out for inquiries, support, and feedback, and reflect the unique value proposition of my business.', 'cookie', '{\"field\":[{\"label\":\"Websit Name\",\"placeholder\":\"e.g. example website \",\"field_type\":\"text_box\",\"field_name\":\"web_name\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(57, 'content', 'generate email template for ##type##', 'email template', '{\"field\":[{\"label\":\"Email Type\",\"placeholder\":\"e.g. new user,new client\",\"field_type\":\"text_box\",\"field_name\":\"type\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(58, 'contract_description', 'generate contract brief description for title \'##contract_description##\' and cover all point that sutiable to contract title', 'contracts', '{\"field\":[{\"label\":\"Contract Description\",\"placeholder\":\"e.g. product return condition \",\"field_type\":\"textarea\",\"field_name\":\"contract_description\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(59, 'comment', 'generate short and valuable comment for contract title \'##name##\' and focus on this ##comment##', 'contracts', '{\"field\":[{\"label\":\"Contract Comment\",\"placeholder\":\"e.g. product return condition \",\"field_type\":\"textarea\",\"field_name\":\"comment\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(60, 'note', 'generate short and valuable note for contract title \'##note##\'', 'contracts', '{\"field\":[{\"label\":\"Contract Name\",\"placeholder\":\"e.g. product return condition \",\"field_type\":\"textarea\",\"field_name\":\"note\"}]}', 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16');

-- --------------------------------------------------------

--
-- Table structure for table `terminations`
--

CREATE TABLE `terminations` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` int NOT NULL,
  `notice_date` date NOT NULL,
  `termination_date` date NOT NULL,
  `termination_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `termination_types`
--

CREATE TABLE `termination_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int NOT NULL,
  `priority` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_created` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` bigint UNSIGNED NOT NULL,
  `ticket_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `is_read` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_sheets`
--

CREATE TABLE `time_sheets` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` int NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `hours` double(8,2) NOT NULL DEFAULT '0.00',
  `remark` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trainers`
--

CREATE TABLE `trainers` (
  `id` bigint UNSIGNED NOT NULL,
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `expertise` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trainings`
--

CREATE TABLE `trainings` (
  `id` bigint UNSIGNED NOT NULL,
  `branch` int NOT NULL,
  `trainer_option` int NOT NULL,
  `training_type` int NOT NULL,
  `trainer` int NOT NULL,
  `training_cost` double(15,2) NOT NULL DEFAULT '0.00',
  `employee` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `performance` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '0',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `training_types`
--

CREATE TABLE `training_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` int NOT NULL,
  `branch_id` int NOT NULL,
  `department_id` int NOT NULL,
  `transfer_date` date NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_balances`
--

CREATE TABLE `transfer_balances` (
  `id` bigint UNSIGNED NOT NULL,
  `from_account_id` int NOT NULL,
  `to_account_id` int NOT NULL,
  `date` date NOT NULL,
  `amount` double(15,2) NOT NULL,
  `payment_type_id` int NOT NULL,
  `referal_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `travels`
--

CREATE TABLE `travels` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `purpose_of_visit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `place_of_visit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'avatar.png',
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  `active_status` tinyint(1) NOT NULL DEFAULT '0',
  `is_login_enable` int NOT NULL DEFAULT '1',
  `dark_mode` tinyint(1) NOT NULL DEFAULT '0',
  `messenger_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#2180f3',
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `avatar`, `lang`, `last_login`, `is_active`, `active_status`, `is_login_enable`, `dark_mode`, `messenger_color`, `created_by`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'company', 'company@saco.com.bd', '2024-04-17 02:53:14', '$2y$10$J.59SWNuhwI5W1Gw/nFsx.UFIYr.DDXkHZUBVudWcOwBMuhw80Wqm', 'company', '', 'en', NULL, 1, 0, 1, 0, '#2180f3', '0', NULL, '2024-04-17 02:53:14', '2024-04-17 02:53:14'),
(2, 'hr', 'hr@example.com', '2024-04-17 02:53:15', '$2y$10$J.59SWNuhwI5W1Gw/nFsx.UFIYr.DDXkHZUBVudWcOwBMuhw80Wqm', 'hr', '', 'en', NULL, 1, 0, 1, 0, '#2180f3', '1', NULL, '2024-04-17 02:53:15', '2024-04-17 02:53:15');

-- --------------------------------------------------------

--
-- Table structure for table `user_email_templates`
--

CREATE TABLE `user_email_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `template_id` int NOT NULL,
  `user_id` int NOT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_email_templates`
--

INSERT INTO `user_email_templates` (`id`, `template_id`, `user_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(2, 2, 1, 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(3, 3, 1, 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(4, 4, 1, 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(5, 5, 1, 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(6, 6, 1, 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(7, 7, 1, 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(8, 8, 1, 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(9, 9, 1, 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(10, 10, 1, 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(11, 11, 1, 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(12, 12, 1, 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(13, 13, 1, 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16'),
(14, 14, 1, 1, '2024-04-17 02:53:16', '2024-04-17 02:53:16');

-- --------------------------------------------------------

--
-- Table structure for table `warnings`
--

CREATE TABLE `warnings` (
  `id` bigint UNSIGNED NOT NULL,
  `warning_to` int NOT NULL,
  `warning_by` int NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warning_date` date NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `webhooks`
--

CREATE TABLE `webhooks` (
  `id` bigint UNSIGNED NOT NULL,
  `module` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zoom_meetings`
--

CREATE TABLE `zoom_meetings` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meeting_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `duration` int NOT NULL DEFAULT '0',
  `start_url` text COLLATE utf8mb4_unicode_ci,
  `join_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'waiting',
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_lists`
--
ALTER TABLE `account_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allowances`
--
ALTER TABLE `allowances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allowance_options`
--
ALTER TABLE `allowance_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcement_employees`
--
ALTER TABLE `announcement_employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appraisals`
--
ALTER TABLE `appraisals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance_employees`
--
ALTER TABLE `attendance_employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `award_types`
--
ALTER TABLE `award_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ch_favorites`
--
ALTER TABLE `ch_favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ch_messages`
--
ALTER TABLE `ch_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_policies`
--
ALTER TABLE `company_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `competencies`
--
ALTER TABLE `competencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_attechments`
--
ALTER TABLE `contract_attechments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_comments`
--
ALTER TABLE `contract_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_notes`
--
ALTER TABLE `contract_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_types`
--
ALTER TABLE `contract_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_questions`
--
ALTER TABLE `custom_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deduction_options`
--
ALTER TABLE `deduction_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ducument_uploads`
--
ALTER TABLE `ducument_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_template_langs`
--
ALTER TABLE `email_template_langs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_employees`
--
ALTER TABLE `event_employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_types`
--
ALTER TABLE `expense_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experience_certificates`
--
ALTER TABLE `experience_certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generate_offer_letters`
--
ALTER TABLE `generate_offer_letters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genrate_payslip_options`
--
ALTER TABLE `genrate_payslip_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goal_trackings`
--
ALTER TABLE `goal_trackings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goal_types`
--
ALTER TABLE `goal_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_types`
--
ALTER TABLE `income_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `indicators`
--
ALTER TABLE `indicators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interview_schedules`
--
ALTER TABLE `interview_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ip_restricts`
--
ALTER TABLE `ip_restricts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_application_notes`
--
ALTER TABLE `job_application_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_categories`
--
ALTER TABLE `job_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_on_boards`
--
ALTER TABLE `job_on_boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_stages`
--
ALTER TABLE `job_stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `joining_letters`
--
ALTER TABLE `joining_letters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `join_us`
--
ALTER TABLE `join_us`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `join_us_email_unique` (`email`);

--
-- Indexes for table `landing_page_sections`
--
ALTER TABLE `landing_page_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `landing_page_settings`
--
ALTER TABLE `landing_page_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `landing_page_settings_name_unique` (`name`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_options`
--
ALTER TABLE `loan_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_details`
--
ALTER TABLE `login_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meeting_employees`
--
ALTER TABLE `meeting_employees`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `noc_certificates`
--
ALTER TABLE `noc_certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_template_langs`
--
ALTER TABLE `notification_template_langs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `other_payments`
--
ALTER TABLE `other_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `overtimes`
--
ALTER TABLE `overtimes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payees`
--
ALTER TABLE `payees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payers`
--
ALTER TABLE `payers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payslip_types`
--
ALTER TABLE `payslip_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pay_slips`
--
ALTER TABLE `pay_slips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `performance__types`
--
ALTER TABLE `performance__types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resignations`
--
ALTER TABLE `resignations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `saturation_deductions`
--
ALTER TABLE `saturation_deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_created_by_unique` (`name`,`created_by`);

--
-- Indexes for table `set_salaries`
--
ALTER TABLE `set_salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template`
--
ALTER TABLE `template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terminations`
--
ALTER TABLE `terminations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `termination_types`
--
ALTER TABLE `termination_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_sheets`
--
ALTER TABLE `time_sheets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trainers`
--
ALTER TABLE `trainers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trainings`
--
ALTER TABLE `trainings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `training_types`
--
ALTER TABLE `training_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfer_balances`
--
ALTER TABLE `transfer_balances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `travels`
--
ALTER TABLE `travels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_email_templates`
--
ALTER TABLE `user_email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warnings`
--
ALTER TABLE `warnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `webhooks`
--
ALTER TABLE `webhooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zoom_meetings`
--
ALTER TABLE `zoom_meetings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_lists`
--
ALTER TABLE `account_lists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `allowances`
--
ALTER TABLE `allowances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `allowance_options`
--
ALTER TABLE `allowance_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcement_employees`
--
ALTER TABLE `announcement_employees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appraisals`
--
ALTER TABLE `appraisals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_employees`
--
ALTER TABLE `attendance_employees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `award_types`
--
ALTER TABLE `award_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_policies`
--
ALTER TABLE `company_policies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `competencies`
--
ALTER TABLE `competencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_attechments`
--
ALTER TABLE `contract_attechments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_comments`
--
ALTER TABLE `contract_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_notes`
--
ALTER TABLE `contract_notes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_types`
--
ALTER TABLE `contract_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_questions`
--
ALTER TABLE `custom_questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deduction_options`
--
ALTER TABLE `deduction_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ducument_uploads`
--
ALTER TABLE `ducument_uploads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `email_template_langs`
--
ALTER TABLE `email_template_langs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_documents`
--
ALTER TABLE `employee_documents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_employees`
--
ALTER TABLE `event_employees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_types`
--
ALTER TABLE `expense_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `experience_certificates`
--
ALTER TABLE `experience_certificates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `generate_offer_letters`
--
ALTER TABLE `generate_offer_letters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `genrate_payslip_options`
--
ALTER TABLE `genrate_payslip_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goal_trackings`
--
ALTER TABLE `goal_trackings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goal_types`
--
ALTER TABLE `goal_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income_types`
--
ALTER TABLE `income_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `indicators`
--
ALTER TABLE `indicators`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interview_schedules`
--
ALTER TABLE `interview_schedules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ip_restricts`
--
ALTER TABLE `ip_restricts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_application_notes`
--
ALTER TABLE `job_application_notes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_categories`
--
ALTER TABLE `job_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_on_boards`
--
ALTER TABLE `job_on_boards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_stages`
--
ALTER TABLE `job_stages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `joining_letters`
--
ALTER TABLE `joining_letters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `join_us`
--
ALTER TABLE `join_us`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `landing_page_sections`
--
ALTER TABLE `landing_page_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `landing_page_settings`
--
ALTER TABLE `landing_page_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_options`
--
ALTER TABLE `loan_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_details`
--
ALTER TABLE `login_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meeting_employees`
--
ALTER TABLE `meeting_employees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `noc_certificates`
--
ALTER TABLE `noc_certificates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `notification_template_langs`
--
ALTER TABLE `notification_template_langs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT for table `other_payments`
--
ALTER TABLE `other_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `overtimes`
--
ALTER TABLE `overtimes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payees`
--
ALTER TABLE `payees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payers`
--
ALTER TABLE `payers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payslip_types`
--
ALTER TABLE `payslip_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pay_slips`
--
ALTER TABLE `pay_slips`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `performance__types`
--
ALTER TABLE `performance__types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resignations`
--
ALTER TABLE `resignations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `saturation_deductions`
--
ALTER TABLE `saturation_deductions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `set_salaries`
--
ALTER TABLE `set_salaries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `template`
--
ALTER TABLE `template`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `terminations`
--
ALTER TABLE `terminations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `termination_types`
--
ALTER TABLE `termination_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_sheets`
--
ALTER TABLE `time_sheets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trainers`
--
ALTER TABLE `trainers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trainings`
--
ALTER TABLE `trainings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `training_types`
--
ALTER TABLE `training_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfer_balances`
--
ALTER TABLE `transfer_balances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `travels`
--
ALTER TABLE `travels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_email_templates`
--
ALTER TABLE `user_email_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `warnings`
--
ALTER TABLE `warnings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `webhooks`
--
ALTER TABLE `webhooks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zoom_meetings`
--
ALTER TABLE `zoom_meetings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

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
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
