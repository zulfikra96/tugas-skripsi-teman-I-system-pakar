-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 26, 2018 at 04:45 AM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `linkez`
--

-- --------------------------------------------------------

--
-- Table structure for table `asisten_relation`
--

CREATE TABLE `asisten_relation` (
  `id` int(11) NOT NULL,
  `user_id` int(50) DEFAULT NULL,
  `figure_id` int(50) DEFAULT NULL,
  `key_overal` int(12) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asisten_relation`
--

INSERT INTO `asisten_relation` (`id`, `user_id`, `figure_id`, `key_overal`, `created_at`) VALUES
(3, 45, 24, 3594806, '2018-05-29 05:43:46');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `user_id` int(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `count` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `user_id`, `title`, `color`, `count`) VALUES
(1, NULL, 'photography', 'E91E63', 1000),
(2, NULL, 'politic', '9C27B0', 1000),
(3, NULL, 'sport', '3F51B5', 1000),
(4, NULL, 'lifestyle', '263238', 1000),
(22, NULL, 'politiks', '1A237E', 6),
(24, NULL, 'life style', 'EC407A', 0),
(25, NULL, 'sosial', 'FFC107', 1),
(26, NULL, 'Action', 'FF9800', 0),
(27, NULL, 'religi', '607D8B', 1),
(28, NULL, 'drama', '00838F', 1),
(29, NULL, 'tukang', 'E040FB', 0),
(30, NULL, 'haji', '00BCD4', 0),
(31, NULL, 'opick', '9E9E9E', 0),
(32, NULL, 'maher zein', '8BC34A', 0),
(33, NULL, 'karma', '880E4F', 0),
(34, NULL, 'islam', '8BC34A', 0),
(35, NULL, 'jajan', '546E7A', 1),
(36, NULL, 'biru', 'B71C1C', 0),
(37, NULL, 'politik', '00897B', 0),
(38, NULL, 'media', '4CAF50', 0),
(39, NULL, 'test', '009688', 0),
(40, NULL, 'lagi', 'FFC107', 0),
(41, NULL, 'dan lagi', '03A9F4', 0),
(42, NULL, 'anjay', '8BC34A', 0),
(43, NULL, 'jancok', '009688', 72),
(44, NULL, 'cok', '4CAF50', 0),
(45, NULL, 'pro', NULL, 0),
(46, NULL, 'zzz', NULL, 0),
(47, NULL, 'gatel', '9E9E9E', 0),
(48, NULL, 'jbt', '00BCD4', 0),
(49, NULL, 'jembot', 'FF9800', 8),
(50, NULL, 'basi', 'B71C1C', 0),
(51, NULL, 'asu', '607D8B', 0),
(52, NULL, 'lol', 'FFC107', 1),
(53, NULL, 'test 1', '00897B', 0),
(54, NULL, 'test 2', 'FFEB3B', 0),
(55, NULL, 'test 3', '880E4F', 0),
(56, NULL, '', 'FF9800', 0),
(57, NULL, 'ajsjsm', 'CDDC39', 0),
(58, NULL, 'ksnss', 'FFA000', 0),
(59, NULL, 'keren', '00838F', 1),
(60, NULL, 'topik baru', '795548', 0),
(61, NULL, 'sepeda', NULL, 0),
(62, NULL, 'pemandangan', '795548', 0);

-- --------------------------------------------------------

--
-- Table structure for table `category_user`
--

CREATE TABLE `category_user` (
  `id` int(11) NOT NULL,
  `user_id` int(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `color` varchar(6) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_user`
--

INSERT INTO `category_user` (`id`, `user_id`, `title`, `color`, `created_at`) VALUES
(6, 23, 'test 3', '607D8B', '2018-05-01 04:02:02'),
(46, 24, 'test 1', '512DA8', '2018-04-30 04:14:13'),
(47, 24, 'test 2', '2196F3', '2018-04-30 04:14:22'),
(107, 43, 'jancok', '03A9F4', '2018-05-01 10:30:04'),
(108, 43, 'jancok', '1A237E', '2018-05-01 10:30:04'),
(109, 43, 'jancok', '3F51B5', '2018-05-01 10:30:05'),
(110, 43, 'jancok', 'FF5722', '2018-05-01 10:30:06'),
(111, 43, 'jancok', 'FFA000', '2018-05-01 10:30:06'),
(112, 43, 'jancok', '8BC34A', '2018-05-01 10:30:14'),
(113, 43, 'jancok', 'B71C1C', '2018-05-01 10:30:15'),
(114, 43, 'jancok', '880E4F', '2018-05-01 10:30:15'),
(115, 43, 'jancok', '4A148C', '2018-05-01 10:30:16'),
(116, 43, 'jancok', '4A148C', '2018-05-01 10:30:16'),
(117, 43, 'jancok', '2E7D32', '2018-05-01 10:30:24'),
(118, 43, 'jancok', '00838F', '2018-05-01 10:30:25'),
(119, 43, 'jancok', 'FF5722', '2018-05-01 10:30:25'),
(120, 43, 'jancok', 'CDDC39', '2018-05-01 10:30:26'),
(121, 43, 'jancok', '03A9F4', '2018-05-01 10:30:26'),
(122, 43, 'keren', '9C27B0', '2018-05-01 10:30:34'),
(123, 43, 'keren', '607D8B', '2018-05-01 10:30:34'),
(124, 24, 'topik baru', 'FF9800', '2018-05-01 10:49:35'),
(125, 23, 'sepeda', '9E9E9E', '2018-05-13 14:45:02'),
(126, 23, 'pemandangan', '8BC34A', '2018-05-13 14:46:58');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `user_id` int(50) DEFAULT NULL,
  `to_id` int(50) DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `is_exist_file` tinyint(1) DEFAULT NULL,
  `path_file` varchar(200) DEFAULT NULL,
  `group_id` int(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `base64_field` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `user_id`, `to_id`, `message`, `is_deleted`, `is_exist_file`, `path_file`, `group_id`, `created_at`, `base64_field`) VALUES
(736, 45, 24, 'Grafik', NULL, 0, NULL, 38, '2018-06-06 04:21:41', NULL),
(737, 45, 24, 'Hahahai', NULL, 0, NULL, 38, '2018-06-06 04:21:48', NULL),
(738, 24, 45, 'Anjay', NULL, 0, NULL, 38, '2018-06-06 04:22:25', NULL),
(739, 45, 24, 'Hahai', NULL, 0, NULL, 38, '2018-06-06 04:27:51', NULL),
(740, 45, 24, 'Dawdawd', NULL, 0, NULL, 38, '2018-06-06 04:28:00', NULL),
(741, 24, 45, 'Cjc', NULL, 0, NULL, 38, '2018-06-06 04:28:20', NULL),
(742, 45, 24, 'Halo', NULL, 0, NULL, 38, '2018-06-06 04:31:47', NULL),
(743, 45, 24, 'Halo', NULL, NULL, NULL, 38, '2018-06-06 05:21:38', NULL),
(744, 45, 24, 'Halo', NULL, NULL, NULL, 38, '2018-06-06 05:22:28', NULL),
(745, 45, 24, 'Hahai', NULL, NULL, NULL, 38, '2018-06-06 05:22:38', NULL),
(746, 45, 24, 'Test', NULL, NULL, NULL, 38, '2018-06-06 05:25:21', NULL),
(747, 45, 24, 'Zzz', NULL, NULL, NULL, 38, '2018-06-06 05:28:07', NULL),
(748, 45, 24, 'Zzz', NULL, NULL, NULL, 38, '2018-06-06 05:28:18', NULL),
(749, 45, 24, 'Babahin', NULL, NULL, NULL, 38, '2018-06-06 05:30:46', NULL),
(750, 45, 24, 'Zzz', NULL, NULL, NULL, 38, '2018-06-06 05:30:55', NULL),
(751, 45, 24, 'Asem', NULL, NULL, NULL, 38, '2018-06-06 05:33:09', NULL),
(752, 45, 24, 'Yes', NULL, NULL, NULL, 38, '2018-06-06 05:33:27', NULL),
(753, 24, 45, 'Bisa', NULL, NULL, NULL, 38, '2018-06-06 05:33:32', NULL),
(754, 24, 45, 'Ak', NULL, NULL, NULL, 38, '2018-06-06 05:35:06', NULL),
(755, 45, 24, 'Gak tau', NULL, NULL, NULL, 38, '2018-06-06 05:35:12', NULL),
(756, 45, 24, 'Tau dimana', NULL, NULL, NULL, 38, '2018-06-06 05:35:30', NULL),
(757, 45, 24, 'Dari mana asalmu', NULL, NULL, NULL, 38, '2018-06-06 05:35:34', NULL),
(758, 45, 24, 'Dari sini dong', NULL, NULL, NULL, 38, '2018-06-06 05:35:38', NULL),
(759, 24, 45, 'Oke', NULL, NULL, NULL, 38, '2018-06-06 05:35:42', NULL),
(760, 24, 45, 'Bajinhan', NULL, NULL, NULL, 38, '2018-06-06 05:36:18', NULL),
(761, 24, 45, 'Kwkwkw', NULL, NULL, NULL, 38, '2018-06-06 05:36:20', NULL),
(762, 24, 45, 'Bug', NULL, NULL, NULL, 38, '2018-06-06 05:36:22', NULL),
(763, 45, 24, 'Bug njir', NULL, NULL, NULL, 38, '2018-06-06 05:36:30', NULL),
(764, 45, 24, 'Hahaha', NULL, NULL, NULL, 38, '2018-06-06 05:36:35', NULL),
(765, 45, 24, 'Anjay', NULL, NULL, NULL, 38, '2018-06-06 05:36:39', NULL),
(766, 24, 45, 'Tai', NULL, NULL, NULL, 38, '2018-06-06 05:36:43', NULL),
(767, 24, 45, 'Kuda', NULL, NULL, NULL, 38, '2018-06-06 05:36:47', NULL),
(768, 24, 45, 'Bospan', NULL, NULL, NULL, 38, '2018-06-06 05:36:53', NULL),
(769, 45, 24, 'Test', NULL, NULL, NULL, 38, '2018-06-06 05:39:49', NULL),
(770, 45, 24, 'Bener ?', NULL, NULL, NULL, 38, '2018-06-06 05:39:52', NULL),
(771, 45, 24, 'Ok', NULL, NULL, NULL, 38, '2018-06-06 05:39:54', NULL),
(772, 24, 45, 'Hello', NULL, NULL, NULL, 38, '2018-06-06 05:39:57', NULL),
(773, 45, 24, 'Aku', NULL, NULL, NULL, 38, '2018-06-06 05:41:10', NULL),
(774, 45, 24, 'Test', NULL, NULL, NULL, 38, '2018-06-06 05:43:07', NULL),
(775, 24, 45, 'Ggvg', NULL, NULL, NULL, 38, '2018-06-06 05:43:17', NULL),
(776, 45, 24, 'Test 1', NULL, NULL, NULL, 38, '2018-06-06 05:43:26', NULL),
(777, 45, 24, 'Test 2', NULL, NULL, NULL, 38, '2018-06-06 05:43:29', NULL),
(778, 45, 24, 'Test 3', NULL, NULL, NULL, 38, '2018-06-06 05:43:34', NULL),
(779, 24, 45, 'Ygcch', NULL, NULL, NULL, 38, '2018-06-06 05:43:39', NULL),
(780, 45, 24, 'Test', NULL, NULL, NULL, 38, '2018-06-06 05:48:00', NULL),
(781, 45, 24, 'Asss', NULL, NULL, NULL, 38, '2018-06-06 05:48:02', NULL),
(782, 45, 24, 'Bbb', NULL, NULL, NULL, 38, '2018-06-06 05:48:03', NULL),
(783, 24, 45, 'Vkvcjcjc', NULL, NULL, NULL, 38, '2018-06-06 05:48:09', NULL),
(784, 45, 24, 'Bajai', NULL, 0, NULL, 38, '2018-06-06 06:00:47', NULL),
(785, 45, 24, 'Bismilah', NULL, 0, NULL, 38, '2018-06-06 06:00:51', NULL),
(786, 45, 24, 'Coba', NULL, 0, NULL, 38, '2018-06-06 06:04:20', NULL),
(787, 24, 45, 'Mn', NULL, 0, NULL, 38, '2018-06-06 06:04:33', NULL),
(788, 24, 45, 'Malas', NULL, 0, NULL, 38, '2018-06-06 06:06:30', NULL),
(789, 24, 45, 'Halo', NULL, 0, NULL, 38, '2018-06-06 06:08:04', NULL),
(790, 24, 45, 'Ha', NULL, NULL, NULL, 38, '2018-06-06 06:11:56', NULL),
(791, 24, 45, 'Za', NULL, NULL, NULL, 38, '2018-06-06 06:14:04', NULL),
(792, 24, 45, 'Haha', NULL, NULL, NULL, 38, '2018-06-06 06:14:06', NULL),
(793, 45, 24, 'Ba', NULL, NULL, NULL, 38, '2018-06-06 06:14:15', NULL),
(794, 45, 24, 'Adawd', NULL, NULL, NULL, 38, '2018-06-06 06:14:18', NULL),
(795, 24, 45, 'Hsjjajaa', NULL, NULL, NULL, 38, '2018-06-06 06:14:22', NULL),
(796, 24, 45, 'Mak', NULL, 0, NULL, 38, '2018-06-06 06:20:23', NULL),
(797, 24, 45, 'Bismillah', NULL, 0, NULL, 38, '2018-06-06 06:23:20', NULL),
(798, 45, 24, 'Bar', NULL, 0, NULL, 38, '2018-06-06 06:25:25', NULL),
(799, 45, 24, 'Test', NULL, 0, NULL, 38, '2018-06-06 06:25:26', NULL),
(800, 45, 24, 'Gagaga', NULL, 0, NULL, 38, '2018-06-06 06:25:28', NULL),
(801, 45, 24, 'Hhahaha', NULL, 0, NULL, 38, '2018-06-06 06:25:30', NULL),
(802, 24, 45, 'Asem', NULL, 0, NULL, 38, '2018-06-06 06:25:33', NULL),
(803, 24, 45, 'Qjqua', NULL, 0, NULL, 38, '2018-06-06 06:25:35', NULL),
(804, 24, 45, 'Akakaka', NULL, 0, NULL, 38, '2018-06-06 06:25:37', NULL),
(805, 24, 45, 'Lina', NULL, 0, NULL, 38, '2018-06-06 06:25:39', NULL),
(806, 45, 24, 'Bisa', NULL, 0, NULL, 38, '2018-06-06 06:25:43', NULL),
(807, 45, 24, 'Yeah', NULL, 0, NULL, 38, '2018-06-06 06:25:46', NULL),
(808, 45, 24, 'Test', NULL, 0, NULL, 38, '2018-06-06 06:28:19', NULL),
(809, 45, 24, 'Hahai', NULL, 0, NULL, 38, '2018-06-06 06:28:23', NULL),
(810, 24, 45, 'Set', NULL, 0, NULL, 38, '2018-06-06 06:28:33', NULL),
(811, 24, 45, 'Babah', NULL, 0, NULL, 38, '2018-06-06 06:28:40', NULL),
(812, 45, 24, 'As', NULL, 0, NULL, 38, '2018-06-06 06:30:37', NULL),
(813, 45, 24, 'Asem', NULL, 0, NULL, 38, '2018-06-06 06:30:42', NULL),
(814, 45, 24, 'Test', NULL, 0, NULL, 38, '2018-06-06 06:32:13', NULL),
(815, 45, 24, 'Ba', NULL, 0, NULL, 38, '2018-06-06 06:36:18', NULL),
(816, 45, 24, 'Asem', NULL, 0, NULL, 38, '2018-06-06 06:36:22', NULL),
(817, 45, 24, 'Ho', NULL, 0, NULL, 38, '2018-06-06 06:38:49', NULL),
(818, 45, 24, 'Klll', NULL, 0, NULL, 38, '2018-06-06 06:39:30', NULL),
(819, 45, 24, 'Ha', NULL, 0, NULL, 38, '2018-06-06 06:42:03', NULL),
(820, 24, 45, 'Cf', NULL, 0, NULL, 38, '2018-06-06 06:42:20', NULL),
(821, 45, 24, 'Halah', NULL, 0, NULL, 38, '2018-06-06 06:42:33', NULL),
(822, 24, 45, 'Gkgog', NULL, 0, NULL, 38, '2018-06-06 06:45:35', NULL),
(823, 45, 24, 'Asdasd', NULL, 0, NULL, 38, '2018-06-06 06:49:51', NULL),
(824, 45, 24, 'Aaaaaaa', NULL, 0, NULL, 38, '2018-06-06 06:51:17', NULL),
(825, 45, 24, 'Xcscsdasda', NULL, 0, NULL, 38, '2018-06-06 06:51:48', NULL),
(826, 45, 24, 'Asdadasd', NULL, 0, NULL, 38, '2018-06-06 06:51:52', NULL),
(827, 45, 24, 'Zzz', NULL, 0, NULL, 38, '2018-06-06 06:53:01', NULL),
(828, 45, 24, 'Adadaw', NULL, 0, NULL, 38, '2018-06-06 06:53:05', NULL),
(829, 45, 24, 'Kkkk', NULL, 0, NULL, 38, '2018-06-06 06:53:32', NULL),
(830, 45, 24, 'Lo', NULL, 0, NULL, 38, '2018-06-06 06:53:36', NULL),
(831, 45, 24, 'J', NULL, 0, NULL, 38, '2018-06-06 06:54:00', NULL),
(832, 45, 24, 'Lo', NULL, 0, NULL, 38, '2018-06-06 06:54:00', NULL),
(833, 45, 24, 'Hjk', NULL, 0, NULL, 38, '2018-06-06 06:54:00', NULL),
(834, 45, 24, 'Asdadad', NULL, NULL, NULL, 38, '2018-06-06 06:57:47', NULL),
(835, 24, 45, 'Hhh', NULL, NULL, NULL, 38, '2018-06-06 06:59:36', NULL),
(836, 24, 45, 'Gj', NULL, NULL, NULL, 38, '2018-06-06 07:00:41', NULL),
(837, 24, 45, 'Cigiffi', NULL, NULL, NULL, 38, '2018-06-06 07:02:26', NULL),
(838, 24, 45, 'Hkk', NULL, NULL, NULL, 38, '2018-06-06 07:04:03', NULL),
(839, 24, 45, 'Gkgg', NULL, NULL, NULL, 38, '2018-06-06 07:04:41', NULL),
(840, 24, 45, 'Hoho', NULL, NULL, NULL, 38, '2018-06-06 07:05:57', NULL),
(841, 45, 24, 'Babahin', NULL, NULL, NULL, 38, '2018-06-06 07:06:53', NULL),
(842, 45, 24, 'Hagha', NULL, NULL, NULL, 38, '2018-06-06 07:07:08', NULL),
(843, 45, 24, 'Hahaha', NULL, NULL, NULL, 38, '2018-06-06 07:07:19', NULL),
(844, 45, 24, 'Asdasd', NULL, NULL, NULL, 38, '2018-06-06 07:07:27', NULL),
(845, 45, 24, 'Haris', NULL, NULL, NULL, 38, '2018-06-06 07:08:19', NULL),
(846, 45, 24, 'Hahahaha', NULL, NULL, NULL, 38, '2018-06-06 07:08:24', NULL),
(847, 45, 24, '', NULL, NULL, NULL, 38, '2018-06-06 07:08:26', NULL),
(848, 45, 24, 'Babahin', NULL, NULL, NULL, 38, '2018-06-06 07:08:41', NULL),
(849, 45, 24, 'Hahai', NULL, NULL, NULL, 38, '2018-06-06 07:15:18', NULL),
(850, 45, 24, 'Zul', NULL, NULL, NULL, 38, '2018-06-06 07:15:28', NULL),
(851, 45, 24, 'Hahai', NULL, NULL, NULL, 38, '2018-06-06 07:15:47', NULL),
(852, 45, 24, 'Hohoho', NULL, NULL, NULL, 38, '2018-06-06 07:15:54', NULL),
(853, 45, 24, 'Bababa', NULL, NULL, NULL, 38, '2018-06-06 07:16:04', NULL),
(854, 45, 24, 'Asdasd', NULL, NULL, NULL, 38, '2018-06-06 07:16:15', NULL),
(855, 45, 24, 'Basem', NULL, NULL, NULL, 38, '2018-06-06 07:16:20', NULL),
(856, 45, 24, 'Loalah', NULL, NULL, NULL, 38, '2018-06-06 07:16:26', NULL),
(857, 45, 24, 'Awdadawd', NULL, NULL, NULL, 38, '2018-06-06 07:16:42', NULL),
(858, 45, 24, 'Kook', NULL, NULL, NULL, 38, '2018-06-06 07:19:25', NULL),
(859, 45, 24, 'Zxc', NULL, NULL, NULL, 38, '2018-06-06 07:19:33', NULL),
(860, 45, 24, 'Tuak', NULL, NULL, NULL, 38, '2018-06-06 07:19:48', NULL),
(861, 45, 24, 'Adawd', NULL, NULL, NULL, 38, '2018-06-06 07:19:59', NULL),
(862, 45, 24, 'Awdawdaw', NULL, NULL, NULL, 38, '2018-06-06 07:20:09', NULL),
(863, 45, 24, 'Awdawd', NULL, NULL, NULL, 38, '2018-06-06 07:23:13', NULL),
(864, 45, 24, 'Zzz', NULL, NULL, NULL, 38, '2018-06-06 07:24:18', NULL),
(865, 45, 24, 'Asdada', NULL, NULL, NULL, 38, '2018-06-06 07:24:21', NULL),
(866, 45, 24, 'Awdadad', NULL, NULL, NULL, 38, '2018-06-06 07:24:41', NULL),
(867, 45, 24, 'Adad', NULL, NULL, NULL, 38, '2018-06-06 07:26:20', NULL),
(868, 45, 24, 'Adwdaw', NULL, NULL, NULL, 38, '2018-06-06 07:26:31', NULL),
(869, 45, 24, 'Adasd', NULL, NULL, NULL, 38, '2018-06-06 07:27:01', NULL),
(870, 45, 24, 'Bbbb', NULL, NULL, NULL, 38, '2018-06-06 07:29:17', NULL),
(871, 45, 24, 'Aaaaa', NULL, NULL, NULL, 38, '2018-06-06 07:29:19', NULL),
(872, 45, 24, 'Ssss', NULL, NULL, NULL, 38, '2018-06-06 07:29:21', NULL),
(873, 48, 24, 'Hahai', NULL, NULL, NULL, 39, '2018-06-06 07:31:50', NULL),
(874, 48, 24, 'Halo', NULL, NULL, NULL, 39, '2018-06-06 07:37:04', NULL),
(875, 48, 24, 'Agan', NULL, NULL, NULL, 39, '2018-06-06 07:37:06', NULL),
(876, 48, 24, 'Sadsd', NULL, NULL, NULL, 39, '2018-06-06 07:37:22', NULL),
(877, 48, 24, 'Sdasd', NULL, NULL, NULL, 39, '2018-06-06 07:37:24', NULL),
(878, 48, 24, 'Aaaa', NULL, NULL, NULL, 39, '2018-06-06 07:37:31', NULL),
(879, 48, 24, 'Aaa', NULL, NULL, NULL, 39, '2018-06-06 07:37:35', NULL),
(880, 45, 24, 'Cok', NULL, NULL, NULL, 38, '2018-06-06 07:38:25', NULL),
(881, 45, 24, 'Ahaahaha', NULL, NULL, NULL, 38, '2018-06-06 07:38:29', NULL),
(882, 45, 24, 'Kamu kok gitu seh', NULL, NULL, NULL, 38, '2018-06-06 07:38:35', NULL),
(883, 45, 24, 'Aku mangkel lo', NULL, NULL, NULL, 38, '2018-06-06 07:38:38', NULL),
(884, 45, 24, 'Ojok ngunu ta', NULL, NULL, NULL, 38, '2018-06-06 07:38:41', NULL),
(885, 45, 24, 'Nangisan', NULL, NULL, NULL, 38, '2018-06-06 07:38:47', NULL),
(886, 45, 24, 'Tuh kan', NULL, NULL, NULL, 38, '2018-06-06 07:38:58', NULL),
(887, 45, 24, 'Adadaw', NULL, NULL, NULL, 38, '2018-06-06 07:39:06', NULL),
(888, 45, 24, 'Nles', NULL, NULL, NULL, 38, '2018-06-06 07:39:14', NULL),
(889, 45, 24, 'Zzz', NULL, NULL, NULL, 38, '2018-06-06 07:39:21', NULL),
(890, 45, 24, 'Asem', NULL, NULL, NULL, 38, '2018-06-06 07:39:23', NULL),
(891, 45, 24, 'Asdasd', NULL, NULL, NULL, 38, '2018-06-06 07:44:41', NULL),
(892, 45, 24, 'Aku', NULL, NULL, NULL, 38, '2018-06-06 07:44:44', NULL),
(893, 45, 24, 'Sasf', NULL, NULL, NULL, 38, '2018-06-06 07:46:13', NULL),
(894, 45, 24, 'Asdad', NULL, NULL, NULL, 38, '2018-06-06 07:47:55', NULL),
(895, 45, 24, 'Asdasd', NULL, NULL, NULL, 38, '2018-06-06 07:48:01', NULL),
(896, 45, 24, 'Adawd', NULL, NULL, NULL, 38, '2018-06-06 07:48:21', NULL),
(897, 45, 24, 'Eawaw', NULL, NULL, NULL, 38, '2018-06-06 07:50:57', NULL),
(898, 45, 24, 'Adwd', NULL, NULL, NULL, 38, '2018-06-06 07:51:32', NULL),
(899, 45, 24, 'Zzzz', NULL, NULL, NULL, 38, '2018-06-06 07:51:39', NULL),
(900, 45, 24, 'Aaaa', NULL, NULL, NULL, 38, '2018-06-06 07:51:49', NULL),
(901, 45, 24, 'Zzzz', NULL, NULL, NULL, 38, '2018-06-06 07:53:30', NULL),
(902, 45, 24, 'Aas', NULL, NULL, NULL, 38, '2018-06-06 07:53:35', NULL),
(903, 45, 24, 'Dadasd', NULL, NULL, NULL, 38, '2018-06-06 07:53:48', NULL),
(904, 45, 24, 'Adad', NULL, NULL, NULL, 38, '2018-06-06 07:53:56', NULL),
(905, 45, 24, 'Adaddw', NULL, NULL, NULL, 38, '2018-06-06 07:54:08', NULL),
(906, 45, 24, 'Adawdawd', NULL, NULL, NULL, 38, '2018-06-06 07:54:22', NULL),
(907, 45, 24, 'Awddawd', NULL, NULL, NULL, 38, '2018-06-06 07:54:30', NULL),
(908, 45, 24, 'Sss', NULL, NULL, NULL, 38, '2018-06-06 07:54:38', NULL),
(909, 45, 24, 'Zzzz', NULL, NULL, NULL, 38, '2018-06-06 07:56:08', NULL),
(910, 45, 24, 'Ssss', NULL, NULL, NULL, 38, '2018-06-06 07:56:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `choose_category`
--

CREATE TABLE `choose_category` (
  `id` int(11) NOT NULL,
  `user_id` int(50) DEFAULT NULL,
  `category_id` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `choose_category`
--

INSERT INTO `choose_category` (`id`, `user_id`, `category_id`) VALUES
(13, 22, 1),
(14, 22, 2),
(15, 22, 3),
(16, 22, 4),
(17, 20, 1),
(18, 20, 2),
(19, 20, 3),
(20, 20, 4),
(21, 24, 1),
(22, 24, 2),
(23, 24, 3),
(24, 24, 4),
(25, 24, 1),
(26, 24, 2),
(27, 24, 3),
(28, 24, 4),
(29, 25, 1),
(30, 25, 2),
(31, 25, 3),
(32, 28, 2),
(33, 28, 2),
(34, 28, 3),
(35, 33, 1),
(36, 33, 2),
(37, 33, 3),
(38, 40, 2),
(39, 40, 1),
(40, 40, 3),
(41, 41, 2),
(42, 43, 1),
(43, 43, 2),
(44, 43, 3),
(45, 43, 4),
(46, 23, 1),
(47, 23, 2),
(48, 23, 3),
(49, 23, 4),
(50, 44, 1),
(51, 44, 2),
(52, 44, 3),
(53, 44, 4),
(54, 45, 1),
(55, 45, 2),
(56, 45, 3),
(57, 45, 4),
(58, 47, 3),
(59, 48, 1),
(60, 48, 2),
(61, 48, 3),
(62, 48, 4);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `timeline_id` int(50) DEFAULT NULL,
  `comments_id` int(50) DEFAULT NULL,
  `user_id` int(50) DEFAULT NULL,
  `comments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `timeline_id`, `comments_id`, `user_id`, `comments`, `created_at`) VALUES
(1, 47, NULL, 24, 'hello bro', '2018-05-27 07:25:58'),
(2, 48, NULL, 40, 'test 123', '2018-05-27 07:41:47'),
(4, 48, NULL, 45, 'Haiiiii', '2018-05-27 07:42:24'),
(5, 49, NULL, 43, 'Test', '2018-05-29 08:04:23'),
(6, 49, NULL, 43, 'Halo', '2018-05-29 06:23:28'),
(7, 49, NULL, 48, 'Hai', '2018-05-29 08:04:27'),
(8, 49, NULL, 48, 'Jaja', '2018-05-29 06:26:52'),
(9, 48, NULL, 43, 'Aku kurang setuju', '2018-05-29 06:43:36'),
(10, 49, 5, 43, 'Apa sih', '2018-05-29 08:44:20'),
(11, 49, 5, 43, 'Kamu tuh loh', '2018-05-29 08:44:30'),
(12, 49, 5, 48, 'Hai', '2018-05-29 08:45:37'),
(13, 49, 5, 48, 'Apaan', '2018-05-29 08:45:40');

-- --------------------------------------------------------

--
-- Table structure for table `figure_relation`
--

CREATE TABLE `figure_relation` (
  `id` int(11) NOT NULL,
  `user_id` int(50) DEFAULT NULL,
  `figure_id` int(50) DEFAULT NULL,
  `asisten_id` int(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `figure_relation`
--

INSERT INTO `figure_relation` (`id`, `user_id`, `figure_id`, `asisten_id`, `created_at`) VALUES
(1, 43, 24, 45, '2018-05-29 05:48:17');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `user_id` int(50) DEFAULT NULL,
  `followed_id` int(50) DEFAULT NULL,
  `is_fans` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `user_id`, `followed_id`, `is_fans`, `created_at`) VALUES
(3, 43, 24, 1, '2018-05-17 03:35:09'),
(12, 45, 24, 0, '2018-05-24 03:26:59'),
(15, 47, 45, 1, '2018-05-27 09:19:10'),
(34, 48, 24, 0, '2018-05-29 08:45:21');

-- --------------------------------------------------------

--
-- Table structure for table `group_message`
--

CREATE TABLE `group_message` (
  `id` int(11) NOT NULL,
  `from_id` int(50) DEFAULT NULL,
  `to_id` int(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `count_message` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_message`
--

INSERT INTO `group_message` (`id`, `from_id`, `to_id`, `created_at`, `count_message`) VALUES
(38, 45, 24, '2018-06-06 07:56:10', 168),
(39, 24, 48, '2018-06-06 07:37:35', 7);

-- --------------------------------------------------------

--
-- Table structure for table `group_message_figure`
--

CREATE TABLE `group_message_figure` (
  `id` int(11) NOT NULL,
  `user_id` int(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_message_figure`
--

INSERT INTO `group_message_figure` (`id`, `user_id`, `name`, `color`, `created_at`) VALUES
(1, NULL, 'tim pemengangan terbaik', '795548', '2018-06-22 12:46:59'),
(2, 48, 'tim pemengangan terbaik', '795548', '2018-06-22 12:50:25'),
(3, 48, 'tim pemengangan terbaik', '4CAF50', '2018-06-22 12:50:12');

-- --------------------------------------------------------

--
-- Table structure for table `group_relation_message`
--

CREATE TABLE `group_relation_message` (
  `id` int(11) NOT NULL,
  `group_id` int(50) DEFAULT NULL,
  `user_id` int(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_relation_message`
--

INSERT INTO `group_relation_message` (`id`, `group_id`, `user_id`, `created_at`) VALUES
(1, 2, 40, '2018-06-22 06:27:05'),
(2, 2, 43, '2018-06-22 06:27:05');

-- --------------------------------------------------------

--
-- Table structure for table `group_user`
--

CREATE TABLE `group_user` (
  `id` int(11) NOT NULL,
  `user_id` int(20) UNSIGNED DEFAULT NULL,
  `group_id` int(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `nama_level` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `timeline_id` int(50) DEFAULT NULL,
  `user_id` int(50) DEFAULT NULL,
  `likes` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `timeline_id`, `user_id`, `likes`, `created_at`) VALUES
(15, 47, 23, '3', '2018-05-21 02:50:06'),
(16, 47, 45, '1', '2018-05-24 02:28:38'),
(17, 48, 45, '1', '2018-05-24 03:48:21');

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `id` int(11) NOT NULL,
  `user_id` int(50) DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  `timeline_id` int(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`id`, `user_id`, `path`, `timeline_id`, `created_at`) VALUES
(27, 24, '/opt/lampp/htdocs/JS/linkez/storage/public/users/haris/upload_bcd2539f4fb9b36c5f6a84458ef33a53.jpg', NULL, '2018-05-27 07:28:50'),
(28, 41, '/opt/lampp/htdocs/JS/linkez/storage/public/users/hmmnazhier/upload_d56d2a96a6ba29c4a310cc80d7291be3.jpg', NULL, '2018-05-04 10:57:43'),
(29, 23, '/opt/lampp/htdocs/JS/linkez/storage/public/users/zulfikra/upload_90077cc393f9a72255be865b36ceba09.jpg', NULL, '2018-05-14 06:56:11'),
(37, NULL, '/opt/lampp/htdocs/JS/linkez/storage/public/users/haris/timeline/upload_d9f6ce92d5b36b9be179fbf0d48f66cc.jpg', 47, '2018-05-21 09:02:00'),
(38, NULL, '/opt/lampp/htdocs/JS/linkez/storage/public/users/haris/timeline/upload_7a5c3e35a301cbc693b816fbd608fa72.jpg', 49, '2018-05-21 09:14:09'),
(39, NULL, '/opt/lampp/htdocs/JS/linkez/storage/public/users/haris/timeline/upload_ef371b29eacc277057329c2b7ce73e02.jpg', 48, '2018-05-21 09:06:00'),
(40, NULL, '/opt/lampp/htdocs/JS/linkez/storage/public/users/haris/timeline/upload_e22ced480087f66f110da06945e7b339.jpg', 50, '2018-06-04 06:28:10'),
(41, 45, '/opt/lampp/htdocs/JS/linkez/storage/public/users/tony/upload_ad54163b6643a504ab3865f218a5a10c.jpg', NULL, '2018-05-24 02:56:08'),
(42, 48, '/opt/lampp/htdocs/JS/linkez/storage/public/users/zulfikra/upload_b77cc5807d8da26532ff5a1e41ae6e1e.jpg', NULL, '2018-06-04 06:25:58');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `user_id` int(50) DEFAULT NULL,
  `motto` text,
  `profesi` varchar(50) NOT NULL,
  `is_photo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `first_name`, `last_name`, `user_id`, `motto`, `profesi`, `is_photo`) VALUES
(17, 'Zulfikra', 'Lahmudin', 23, 'Maju tak gentar membela yang benar', 'Tukang Jahit', 0),
(19, 'Haris', 'Miftahul Hudha', 24, 'Sometimes you gotta run before you can walk', 'Tukang Ketik', 1),
(20, 'nazhier', 'rijalana', 25, NULL, '', 1),
(21, 'zulfikra', 'lahmudin', 26, NULL, '', 0),
(22, 'testname', 'test', 28, 'null', '', 0),
(23, 'yaysysgsgdg', 'hejshshsh', 33, NULL, '', 0),
(24, 'nazhier677', 'naz', 37, NULL, '', 0),
(27, 'oen', 'sjsnj', 43, 'lucinta luna', 'mulung', 0),
(28, 'Tony', 'Stark', 44, NULL, '', 1),
(29, 'Tony', 'Stark', 45, 'hidup itu indah', 'Tukang Sapu', 1),
(30, 'ali', 'ali', 46, NULL, '', 0),
(31, 'ali', 'ali', 47, NULL, '', 0),
(32, 'zulfikra', 'lahmudin', 48, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `timeline`
--

CREATE TABLE `timeline` (
  `id` int(11) NOT NULL,
  `user_id` int(50) DEFAULT NULL,
  `category_id` int(50) DEFAULT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_photo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timeline`
--

INSERT INTO `timeline` (`id`, `user_id`, `category_id`, `title`, `description`, `created_at`, `is_photo`) VALUES
(47, 24, 124, 'topik zulzzz hhh', 'belajar membaca coding hati lagizzz perbarui', '2018-05-21 09:01:31', 1),
(48, 24, 124, 'topik zul', 'belajar membaca baru', '2018-05-21 09:05:38', 1),
(49, 24, 46, 'topik zul bar', 'belajar membaca hahaha', '2018-05-21 09:03:01', 1),
(50, 24, 124, 'bru', 'topik baru', '2018-05-21 09:07:02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tokoh_users`
--

CREATE TABLE `tokoh_users` (
  `id` int(11) NOT NULL,
  `tokoh_id` int(50) DEFAULT NULL,
  `user_id` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `no_telp` varchar(200) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `activate_code` int(5) DEFAULT NULL,
  `is_selected_category` tinyint(1) NOT NULL,
  `token_android` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `no_telp`, `username`, `password`, `role`, `is_active`, `activate_code`, `is_selected_category`, `token_android`) VALUES
(24, 'hariscoba@gmail.com', '62+087855736502', 'haris', 'U2FsdGVkX19QYnrEyVdbpp5jUnjACtXvE0qvVdkRRKk=', 'tokoh', 1, NULL, 1, 'fF6kG9BF7f8:APA91bFwlmRYUbz7BzjeQR9AVwpPoosNcZ8HQFGlSMy9LacfXPLNJ7uKjRo152Is2E5_IjG1-Tbg4sOesOBc_NVf1F9yIuFzCxibhPF8o-QT1rdGxrc6Rz6KLoukCzoDsxnEkAOexWmO'),
(40, 'nazhier9974@gmail.com', '62+85784024519', 'nazhier77', 'U2FsdGVkX1+0ueFgnGaRRZgvr/UF2B/y6HLlXPE38wA=', 'public', 1, NULL, 1, NULL),
(43, 'abdussholeh48@gmail.com', '62+877855736999', 'jancok', 'U2FsdGVkX1+Y5fWTT+vsEhpYUeCR68ALhrApTj/ryvE=', 'public', 1, NULL, 1, NULL),
(45, 'harishudha12@gmail.com', '+6287855736009', 'tony', 'U2FsdGVkX1+UDuJ/WGJu/hmDOVXtk8KShNBBuRH98T0=', 'asisten', 1, 17553, 1, NULL),
(47, 'azidaali6@gmail.com', '+6281332914766', 'godogali', 'U2FsdGVkX19PiQRDRAqNb0LxXQaiZTg8MFIjUTuSNhk=', 'public', 1, 0, 1, NULL),
(48, 'harismiftahulhudha@gmail.com', '+6287855736999', 'zulfikra', 'U2FsdGVkX1+o/r/i0ychgQjVyppLHtlftaZwP8CI9QA=', 'public', 1, 0, 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asisten_relation`
--
ALTER TABLE `asisten_relation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key_overal` (`key_overal`,`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_user`
--
ALTER TABLE `category_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `choose_category`
--
ALTER TABLE `choose_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `figure_relation`
--
ALTER TABLE `figure_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_message`
--
ALTER TABLE `group_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_message_figure`
--
ALTER TABLE `group_message_figure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_relation_message`
--
ALTER TABLE `group_relation_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_user`
--
ALTER TABLE `group_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timeline`
--
ALTER TABLE `timeline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokoh_users`
--
ALTER TABLE `tokoh_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `no_telp` (`no_telp`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asisten_relation`
--
ALTER TABLE `asisten_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `category_user`
--
ALTER TABLE `category_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=911;

--
-- AUTO_INCREMENT for table `choose_category`
--
ALTER TABLE `choose_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `figure_relation`
--
ALTER TABLE `figure_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `group_message`
--
ALTER TABLE `group_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `group_message_figure`
--
ALTER TABLE `group_message_figure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `group_relation_message`
--
ALTER TABLE `group_relation_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `group_user`
--
ALTER TABLE `group_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `timeline`
--
ALTER TABLE `timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tokoh_users`
--
ALTER TABLE `tokoh_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
