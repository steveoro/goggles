-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generato il: Ott 25, 2013 alle 13:07
-- Versione del server: 5.5.33-MariaDB
-- Versione PHP: 5.4.20

--
-- DB struct vers. 1.15.00
--
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `goggles_development`
--

--
-- Dump dei dati per la tabella `admins`
--

INSERT INTO `admins` (`id`, `email`, `encrypted_password`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `failed_attempts`, `unlock_token`, `locked_at`, `lock_version`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'steve.alloro@gmail.com', '$2a$10$DnFPWNAZtPS8GrhheVOAKuqM5Gql6Ral5oLW6YkYbdTqprnr9Jrb2', 2, '2013-10-24 16:30:58', '2013-10-24 15:28:16', '127.0.0.1', '127.0.0.1', 0, NULL, NULL, 2, 'steve', 'Stefano Alloro', '2013-10-23 17:10:03', '2013-10-24 16:30:58'),
(2, 'leegaweb@gmail.com', '$2a$10$E7jeThqmjOqkRh4ZqwtK2.bIXwHmbGLw4Sm2.O9pc71iNcIjTexkS', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'leega', 'Marco Ligabue', '2013-10-23 17:10:03', '2013-10-23 17:10:03');

--
-- Dump dei dati per la tabella `tags`
--

INSERT INTO `tags` (`id`, `lock_version`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 0, 'allenamenti', 1, '2013-10-23 17:09:23', '2013-10-23 17:09:23'),
(2, 0, 'risultati', 1, '2013-10-23 17:09:23', '2013-10-23 17:09:23'),
(3, 0, 'classifiche', 1, '2013-10-23 17:09:23', '2013-10-23 17:09:23'),
(4, 0, 'recensioni', 1, '2013-10-23 17:09:23', '2013-10-23 17:09:23'),
(5, 0, 'collegiale', 1, '2013-10-23 17:09:23', '2013-10-23 17:09:23'),
(6, 0, 'sfida', 1, '2013-10-23 17:09:23', '2013-10-23 17:09:23'),
(7, 0, 'FIN', 1, '2013-10-23 17:09:23', '2013-10-23 17:09:23'),
(8, 0, 'CSI', 1, '2013-10-23 17:09:23', '2013-10-23 17:09:23'),
(9, 0, 'UISP', 1, '2013-10-23 17:09:23', '2013-10-23 17:09:23'),
(10, 0, 'FINA', 1, '2013-10-23 17:09:23', '2013-10-23 17:09:23'),
(11, 0, 'LEM', 1, '2013-10-23 17:09:23', '2013-10-23 17:09:23'),
(12, 0, 'workout', 1, '2013-10-23 17:09:23', '2013-10-23 17:09:23'),
(13, 0, 'results', 1, '2013-10-23 17:09:23', '2013-10-23 17:09:23'),
(14, 0, 'charts', 1, '2013-10-23 17:09:23', '2013-10-23 17:09:23'),
(15, 0, 'reviews', 1, '2013-10-23 17:09:23', '2013-10-23 17:09:23'),
(16, 0, 'team workshop', 1, '2013-10-23 17:09:23', '2013-10-23 17:09:23'),
(17, 0, 'challenge', 1, '2013-10-23 17:09:23', '2013-10-23 17:09:23'),
(18, 0, 'achievements', 1, '2013-10-23 17:09:23', '2013-10-23 17:09:23');

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `lock_version`, `name`, `description`, `swimmer_id`, `created_at`, `updated_at`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `confirmation_token`, `confirmed_at`, `confirmation_sent_at`, `unconfirmed_email`, `failed_attempts`, `unlock_token`, `locked_at`, `use_email_data_updates_notify`, `use_email_achievements_notify`, `use_email_newsletter_notify`, `use_email_community_notify`) VALUES
(1, 0, 'steve', 'Stefano Alloro', NULL, '2013-10-23 17:10:00', '2013-10-24 15:28:38', 'steve.alloro@gmail.com', '$2a$10$buNmcVk6qri9yUi8N7nPeeOT8yF6kRGNq2jqN25aFHZk7/WjKV2Ti', NULL, NULL, '2013-10-24 15:28:38', 1, '2013-10-24 15:28:38', '2013-10-24 15:28:38', '127.0.0.1', '127.0.0.1', '201a65fdf52975e0b4c4de988192fb53695a266d85b83975954127db6a4b54e1', '2013-10-23 17:10:05', '2013-10-23 17:10:00', NULL, 0, NULL, NULL, 1, 1, 1, 1),
(2, 0, 'leega', 'Marco Ligabue', NULL, '2013-10-23 17:10:02', '2013-10-23 17:10:02', 'leegaweb@gmail.com', '$2a$10$sYp1zKjmgy6mNvLgFjuUPOf2QaEcbZnn4LP9q0QWYoKTqiaKPOoou', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'f767e941f857f10d7dfed303c7aa2844a2c0446a3295fb0cc4c7deb283689e79', '2013-10-23 17:10:05', '2013-10-23 17:10:02', NULL, 0, NULL, NULL, 1, 1, 1, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
