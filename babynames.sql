-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 15, 2018 at 09:05 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `babynames`
--

-- --------------------------------------------------------

--
-- Table structure for table `babynames`
--

CREATE TABLE `babynames` (
  `id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `surname` varchar(32) NOT NULL,
  `number` int(11) NOT NULL,
  `list_name` varchar(255) NOT NULL,
  `image` varchar(500) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `babynames`
--

INSERT INTO `babynames` (`id`, `firstname`, `surname`, `number`, `list_name`, `image`, `link`) VALUES
(1, 'James', 'Smith', 31290, 'List1', '', ''),
(2, 'Michael', 'Smith', 30915, 'List2', '', ''),
(3, 'Robert', 'Smith', 26094, 'List3', '', ''),
(4, 'David', 'Smith', 25056, 'List3', '', ''),
(5, 'James', 'Johnson', 22466, 'List6', 'fhdsj.jpg', 'www.james.com'),
(6, 'Michael', 'Johnson', 22111, 'List4', '', ''),
(7, 'William', 'Smith', 22067, 'List4', '', ''),
(8, 'James', 'Williams', 20779, 'List1', '', ''),
(9, 'Robert', 'Johnson', 20168, 'List5', 'ttt.jpg', 'www.johnson.com'),
(10, 'Mary', 'Smith', 19835, 'List2', '', ''),
(11, 'James', 'Brown', 19133, '5tsil', 'ddd.jpg', 'www.brown.com'),
(12, 'John', 'Smith', 18715, '', '', ''),
(13, 'David', 'Johnson', 18568, '', '', ''),
(14, 'Michael', 'Brown', 18014, '', '', ''),
(15, 'Maria', 'Garcia', 17939, '', '', ''),
(16, 'Michael', 'Williams', 17926, '', '', ''),
(17, 'Michael', 'Jones', 16704, '', '', ''),
(18, 'James', 'Jones', 16449, '', '', ''),
(19, 'Maria', 'Rodriguez', 16324, '', '', ''),
(20, 'Robert', 'Brown', 16189, '', '', ''),
(21, 'Michael', 'Miller', 16126, '', '', ''),
(22, 'Robert', 'Jones', 15802, '', '', ''),
(23, 'Robert', 'Williams', 15786, '', '', ''),
(24, 'William', 'Johnson', 15660, '', '', ''),
(25, 'James', 'Davis', 15654, '', '', ''),
(26, 'Mary', 'Johnson', 15324, '', '', ''),
(27, 'Maria', 'Martinez', 15142, '', '', ''),
(28, 'Charles', 'Smith', 14978, '', '', ''),
(29, 'David', 'Brown', 14729, '', '', ''),
(30, 'Robert', 'Miller', 14511, '', '', ''),
(31, 'James', 'Miller', 14498, '', '', ''),
(32, 'John', 'Williams', 14458, '', '', ''),
(33, 'Richard', 'Smith', 14357, '', '', ''),
(34, 'David', 'Williams', 13967, '', '', ''),
(35, 'David', 'Jones', 13881, '', '', ''),
(36, 'Michael', 'Davis', 13690, '', '', ''),
(37, 'William', 'Brown', 13668, '', '', ''),
(38, 'David', 'Miller', 13490, '', '', ''),
(39, 'Mary', 'Williams', 13031, '', '', ''),
(40, 'Jennifer', 'Smith', 12787, '', '', ''),
(41, 'William', 'Jones', 12768, '', '', ''),
(42, 'John', 'Johnson', 12577, '', '', ''),
(43, 'John', 'Miller', 12369, '', '', ''),
(44, 'Daniel', 'Smith', 12317, '', '', ''),
(45, 'Thomas', 'Smith', 12123, '', '', ''),
(46, 'Linda', 'Smith', 12092, '', '', ''),
(47, 'James', 'Wilson', 12066, '', '', ''),
(48, 'Robert', 'Davis', 11740, '', '', ''),
(49, 'Mary', 'Brown', 11550, '', '', ''),
(50, 'Mary', 'Jones', 11343, '', '', ''),
(51, 'Patricia', 'Smith', 11205, '', '', ''),
(52, 'James', 'Moore', 10922, '', '', ''),
(53, 'James', 'Taylor', 10845, '', '', ''),
(54, 'William', 'Miller', 10813, '', '', ''),
(55, 'John', 'Davis', 10737, '', '', ''),
(56, 'Charles', 'Johnson', 10715, '', '', ''),
(57, 'William', 'Davis', 10628, '', '', ''),
(58, 'John', 'Jones', 10512, '', '', ''),
(59, 'Richard', 'Johnson', 10510, '', '', ''),
(60, 'James', 'Anderson', 10229, '', '', ''),
(61, 'Robert', 'Taylor', 10208, '', '', ''),
(62, 'Barbara', 'Smith', 10056, '', '', ''),
(63, 'Michael', 'Moore', 10012, '', '', ''),
(64, 'James', 'Martin', 9989, '', '', ''),
(65, 'Michael', 'Wilson', 9955, '', '', ''),
(66, 'James', 'Thomas', 9921, '', '', ''),
(67, 'Joseph', 'Smith', 9905, '', '', ''),
(68, 'James', 'White', 9875, '', '', ''),
(69, 'Mary', 'Miller', 9800, '', '', ''),
(70, 'Robert', 'Anderson', 9733, '', '', ''),
(71, 'Robert', 'Wilson', 9706, '', '', ''),
(72, 'Charles', 'Williams', 9612, '', '', ''),
(73, 'Jennifer', 'Johnson', 9588, '', '', ''),
(74, 'Michael', 'Anderson', 9571, '', '', ''),
(75, 'John', 'Brown', 9492, '', '', ''),
(76, 'Michael', 'Martin', 9411, '', '', ''),
(77, 'James', 'Thompson', 9381, '', '', ''),
(78, 'Mark', 'Smith', 9369, '', '', ''),
(79, 'Michael', 'Thomas', 9268, '', '', ''),
(80, 'David', 'Anderson', 9249, '', '', ''),
(81, 'Linda', 'Johnson', 9247, '', '', ''),
(82, 'Elizabeth', 'Smith', 9077, '', '', ''),
(83, 'Mary', 'Davis', 9057, '', '', ''),
(84, 'James', 'Jackson', 9029, '', '', ''),
(85, 'Michael', 'Taylor', 8997, '', '', ''),
(86, 'Charles', 'Brown', 8941, '', '', ''),
(87, 'Daniel', 'Garcia', 8917, '', '', ''),
(88, 'James', 'Lee', 8789, '', '', ''),
(89, 'Michael', 'Thompson', 8489, '', '', ''),
(90, 'Daniel', 'Johnson', 8473, '', '', ''),
(91, 'David', 'Wilson', 8439, '', '', ''),
(92, 'Thomas', 'Johnson', 8393, '', '', ''),
(93, 'John', 'Anderson', 8350, '', '', ''),
(94, 'Robert', 'Moore', 8316, '', '', ''),
(95, 'John', 'Wilson', 8311, '', '', ''),
(96, 'Richard', 'Brown', 8294, '', '', ''),
(97, 'Charles', 'Jones', 8256, '', '', ''),
(98, 'Mark', 'Johnson', 8189, '', '', ''),
(99, 'Robert', 'Lee', 8159, '', '', ''),
(100, 'Patricia', 'Johnson', 8131, '', '', ''),
(101, 'Michael', 'Lee', 8006, '', '', ''),
(102, 'David', 'Garcia', 7984, '', '', ''),
(103, 'Robert', 'Martin', 7976, '', '', ''),
(104, 'Jennifer', 'Jones', 7943, '', '', ''),
(105, 'Daniel', 'Martinez', 7938, '', '', ''),
(106, 'John', 'Thomas', 7911, '', '', ''),
(107, 'John', 'Martin', 7892, '', '', ''),
(108, 'Richard', 'Miller', 7825, '', '', ''),
(109, 'Michael', 'White', 7800, '', '', ''),
(110, 'Robert', 'Thomas', 7740, '', '', ''),
(111, 'Barbara', 'Johnson', 7740, '', '', ''),
(112, 'Susan', 'Smith', 7728, '', '', ''),
(113, 'Robert', 'Thompson', 7698, '', '', ''),
(114, 'Daniel', 'Rodriguez', 7690, '', '', ''),
(115, 'Robert', 'White', 7684, '', '', ''),
(116, 'William', 'Wilson', 7621, '', '', ''),
(117, 'David', 'Lee', 7549, '', '', ''),
(118, 'Richard', 'Jones', 7540, '', '', ''),
(119, 'John', 'Taylor', 7503, '', '', ''),
(120, 'John', 'Moore', 7492, '', '', ''),
(121, 'Thomas', 'Brown', 7482, '', '', ''),
(122, 'Richard', 'Williams', 7476, '', '', ''),
(123, 'William', 'Taylor', 7470, '', '', ''),
(124, 'David', 'Martin', 7450, '', '', ''),
(125, 'David', 'Martinez', 7416, '', '', ''),
(126, 'William', 'Moore', 7379, '', '', ''),
(127, 'David', 'Rodriguez', 7372, '', '', ''),
(128, 'Thomas', 'Williams', 7339, '', '', ''),
(129, 'Linda', 'Williams', 7286, '', '', ''),
(130, 'David', 'Moore', 7273, '', '', ''),
(131, 'Daniel', 'Miller', 7266, '', '', ''),
(132, 'William', 'Martin', 7177, '', '', ''),
(133, 'Joseph', 'Johnson', 7174, '', '', ''),
(134, 'David', 'White', 7122, '', '', ''),
(135, 'Michael', 'Jackson', 7105, '', '', ''),
(136, 'Charles', 'Davis', 7090, '', '', ''),
(137, 'William', 'White', 7089, '', '', ''),
(138, 'Patricia', 'Williams', 7052, '', '', ''),
(139, 'Thomas', 'Jones', 7021, '', '', ''),
(140, 'David', 'Thomas', 7020, '', '', ''),
(141, 'William', 'Thomas', 6976, '', '', ''),
(142, 'Jennifer', 'Brown', 6891, '', '', ''),
(143, 'John', 'Thompson', 6888, '', '', ''),
(144, 'Charles', 'Miller', 6880, '', '', ''),
(145, 'Robert', 'Jackson', 6876, '', '', ''),
(146, 'David', 'Thompson', 6822, '', '', ''),
(147, 'Elizabeth', 'Johnson', 6819, '', '', ''),
(148, 'Mary', 'Wilson', 6815, '', '', ''),
(149, 'David', 'Taylor', 6804, '', '', ''),
(150, 'John', 'Lee', 6802, '', '', ''),
(151, 'Jennifer', 'Williams', 6760, '', '', ''),
(152, 'John', 'White', 6744, '', '', ''),
(153, 'Michael', 'Garcia', 6737, '', '', ''),
(154, 'Linda', 'Jones', 6714, '', '', ''),
(155, 'Joseph', 'Williams', 6709, '', '', ''),
(156, 'Linda', 'Brown', 6682, '', '', ''),
(157, 'William', 'Thompson', 6650, '', '', ''),
(158, 'Thomas', 'Miller', 6554, '', '', ''),
(159, 'Mary', 'Anderson', 6526, '', '', ''),
(160, 'Patricia', 'Brown', 6510, '', '', ''),
(161, 'Richard', 'Davis', 6488, '', '', ''),
(162, 'Daniel', 'Brown', 6483, '', '', ''),
(163, 'William', 'Anderson', 6465, '', '', ''),
(164, 'Jennifer', 'Miller', 6383, '', '', ''),
(165, 'Mary', 'Thomas', 6326, '', '', ''),
(166, 'Mary', 'Moore', 6277, '', '', ''),
(167, 'Patricia', 'Jones', 6221, '', '', ''),
(168, 'Mary', 'Martin', 6208, '', '', ''),
(169, 'Barbara', 'Williams', 6203, '', '', ''),
(170, 'Daniel', 'Williams', 6172, '', '', ''),
(171, 'Joseph', 'Brown', 6148, '', '', ''),
(172, 'Mary', 'Taylor', 6128, '', '', ''),
(173, 'Michael', 'Martinez', 6123, '', '', ''),
(174, 'Barbara', 'Brown', 6067, '', '', ''),
(175, 'William', 'Jackson', 6051, '', '', ''),
(176, 'Mark', 'Miller', 5965, '', '', ''),
(177, 'Linda', 'Miller', 5928, '', '', ''),
(178, 'Joseph', 'Miller', 5813, '', '', ''),
(179, 'Mary', 'White', 5742, '', '', ''),
(180, 'David', 'Davis', 5705, '', '', ''),
(181, 'Daniel', 'Jones', 5689, '', '', ''),
(182, 'David', 'Jackson', 5581, '', '', ''),
(183, 'Mary', 'Thompson', 5569, '', '', ''),
(184, 'Mark', 'Williams', 5559, '', '', ''),
(185, 'Susan', 'Johnson', 5517, '', '', ''),
(186, 'Barbara', 'Jones', 5509, '', '', ''),
(187, 'Mary', 'Jackson', 5483, '', '', ''),
(188, 'Jennifer', 'Davis', 5434, '', '', ''),
(189, 'Patricia', 'Miller', 5396, '', '', ''),
(190, 'Linda', 'Davis', 5383, '', '', ''),
(191, 'Thomas', 'Davis', 5343, '', '', ''),
(192, 'Richard', 'Anderson', 5304, '', '', ''),
(193, 'Elizabeth', 'Garcia', 5273, '', '', ''),
(194, 'Charles', 'Wilson', 5226, '', '', ''),
(195, 'Elizabeth', 'Rodriguez', 5219, '', '', ''),
(196, 'Robert', 'Garcia', 5195, '', '', ''),
(197, 'John', 'Jackson', 5160, '', '', ''),
(198, 'William', 'Williams', 5157, '', '', ''),
(199, 'Michael', 'Rodriguez', 5142, '', '', ''),
(200, 'Barbara', 'Miller', 5125, '', '', ''),
(201, 'Elizabeth', 'Williams', 5120, '', '', ''),
(202, 'Elizabeth', 'Brown', 5091, '', '', ''),
(203, 'William', 'Lee', 5084, '', '', ''),
(204, 'Mary', 'Garcia', 5060, '', '', ''),
(205, 'Elizabeth', 'Martinez', 5052, '', '', ''),
(206, 'Robert', 'Martinez', 4944, '', '', ''),
(207, 'Elizabeth', 'Jones', 4931, '', '', ''),
(208, 'Patricia', 'Davis', 4881, '', '', ''),
(209, 'Joseph', 'Jones', 4879, '', '', ''),
(210, 'Thomas', 'Moore', 4864, '', '', ''),
(211, 'Daniel', 'Taylor', 4814, '', '', ''),
(212, 'Charles', 'Moore', 4766, '', '', ''),
(213, 'Elizabeth', 'Miller', 4717, '', '', ''),
(214, 'Charles', 'Taylor', 4668, '', '', ''),
(215, 'Mary', 'Martinez', 4656, '', '', ''),
(216, 'Daniel', 'Davis', 4611, '', '', ''),
(217, 'Barbara', 'Davis', 4595, '', '', ''),
(218, 'Susan', 'Miller', 4583, '', '', ''),
(219, 'Joseph', 'Davis', 4575, '', '', ''),
(220, 'Mark', 'Brown', 4570, '', '', ''),
(221, 'Charles', 'Thomas', 4562, '', '', ''),
(222, 'Richard', 'Wilson', 4557, '', '', ''),
(223, 'Thomas', 'Wilson', 4525, '', '', ''),
(224, 'Robert', 'Rodriguez', 4469, '', '', ''),
(225, 'Mark', 'Davis', 4405, '', '', ''),
(226, 'Mary', 'Lee', 4383, '', '', ''),
(227, 'Mark', 'Jones', 4383, '', '', ''),
(228, 'Charles', 'Anderson', 4343, '', '', ''),
(229, 'Richard', 'Taylor', 4336, '', '', ''),
(230, 'Richard', 'Martin', 4330, '', '', ''),
(231, 'Thomas', 'Martin', 4323, '', '', ''),
(232, 'Richard', 'Moore', 4288, '', '', ''),
(233, 'Charles', 'White', 4206, '', '', ''),
(234, 'Mark', 'Anderson', 4192, '', '', ''),
(235, 'Susan', 'Brown', 4190, '', '', ''),
(236, 'John', 'Garcia', 4176, '', '', ''),
(237, 'Jennifer', 'Wilson', 4169, '', '', ''),
(238, 'Richard', 'White', 4111, '', '', ''),
(239, 'Jennifer', 'Anderson', 4103, '', '', ''),
(240, 'Thomas', 'Anderson', 4093, '', '', ''),
(241, 'John', 'Martinez', 4085, '', '', ''),
(242, 'Patricia', 'Garcia', 4083, '', '', ''),
(243, 'Daniel', 'Martin', 4077, '', '', ''),
(244, 'Charles', 'Jackson', 4072, '', '', ''),
(245, 'Jennifer', 'Lee', 4069, '', '', ''),
(246, 'Richard', 'Thomas', 4064, '', '', ''),
(247, 'Charles', 'Thompson', 4062, '', '', ''),
(248, 'Richard', 'Thompson', 3983, '', '', ''),
(249, 'Charles', 'Martin', 3981, '', '', ''),
(250, 'Elizabeth', 'Davis', 3974, '', '', ''),
(251, 'Thomas', 'Taylor', 3966, '', '', ''),
(252, 'Linda', 'Wilson', 3910, '', '', ''),
(253, 'Richard', 'Garcia', 3901, '', '', ''),
(254, 'Joseph', 'Martin', 3896, '', '', ''),
(255, 'Joseph', 'Thomas', 3894, '', '', ''),
(256, 'Daniel', 'Lee', 3888, 'hhh', '', ''),
(257, 'Jennifer', 'Taylor', 3846, 'ffff', '', ''),
(258, 'Richard', 'Lee', 3828, '', '', ''),
(259, 'Thomas', 'White', 3819, '', '', ''),
(260, 'Jennifer', 'Martin', 3818, '', '', ''),
(261, 'Linda', 'Anderson', 3809, '', '', ''),
(262, 'Mary', 'Rodriguez', 3797, '', '', ''),
(263, 'Joseph', 'Garcia', 3767, '', '', ''),
(264, 'Susan', 'Williams', 3756, '', '', ''),
(265, 'Joseph', 'Martinez', 3746, '', '', ''),
(266, 'Jennifer', 'Garcia', 3735, '', '', ''),
(267, 'Linda', 'Taylor', 3726, '', '', ''),
(268, 'Daniel', 'Wilson', 3708, '', '', ''),
(269, 'Patricia', 'Martinez', 3647, '', '', ''),
(270, 'Mark', 'Wilson', 3639, '', '', ''),
(271, 'Linda', 'Moore', 3625, '', '', ''),
(272, 'Jennifer', 'Moore', 3611, '', '', ''),
(273, 'Susan', 'Jones', 3605, '', '', ''),
(274, 'John', 'Rodriguez', 3562, '', '', ''),
(275, 'Richard', 'Martinez', 3534, '', '', ''),
(276, 'Daniel', 'Moore', 3514, '', '', ''),
(277, 'Patricia', 'Rodriguez', 3503, '', '', ''),
(278, 'Linda', 'Martin', 3497, '', '', ''),
(279, 'Jennifer', 'Rodriguez', 3494, '', '', ''),
(280, 'Patricia', 'Taylor', 3490, '', '', ''),
(281, 'Thomas', 'Lee', 3438, '', '', ''),
(282, 'Charles', 'Lee', 3432, '', '', ''),
(283, 'Jennifer', 'Thompson', 3430, '', '', ''),
(284, 'Linda', 'Thomas', 3426, '', '', ''),
(285, 'Patricia', 'Thomas', 3412, '', '', ''),
(286, 'Patricia', 'Martin', 3411, '', '', ''),
(287, 'Jennifer', 'White', 3409, '', '', ''),
(288, 'Jennifer', 'Martinez', 3408, '', '', ''),
(289, 'Patricia', 'Wilson', 3384, '', '', ''),
(290, 'Patricia', 'Anderson', 3382, '', '', ''),
(291, 'Barbara', 'Wilson', 3381, '', '', ''),
(292, 'Richard', 'Rodriguez', 3375, '', '', ''),
(293, 'Patricia', 'Moore', 3366, '', '', ''),
(294, 'Daniel', 'Anderson', 3356, '', '', ''),
(295, 'Joseph', 'Wilson', 3351, '', '', ''),
(296, 'Daniel', 'White', 3345, '', '', ''),
(297, 'Jennifer', 'Thomas', 3317, '', '', ''),
(298, 'Joseph', 'White', 3315, '', '', ''),
(299, 'Daniel', 'Thompson', 3305, '', '', ''),
(300, 'Thomas', 'Thompson', 3264, '', '', ''),
(301, 'Barbara', 'Anderson', 3244, '', '', ''),
(302, 'Linda', 'White', 3242, '', '', ''),
(303, 'Mark', 'Thompson', 3238, '', '', ''),
(304, 'Thomas', 'Jackson', 3231, '', '', ''),
(305, 'Joseph', 'Moore', 3219, '', '', ''),
(306, 'Linda', 'Thompson', 3217, '', '', ''),
(307, 'Linda', 'Jackson', 3212, '', '', ''),
(308, 'Susan', 'Davis', 3196, '', '', ''),
(309, 'Elizabeth', 'Wilson', 3192, '', '', ''),
(310, 'Joseph', 'Taylor', 3181, '', '', ''),
(311, 'Richard', 'Jackson', 3092, '', '', ''),
(312, 'Barbara', 'Taylor', 3089, '', '', ''),
(313, 'Joseph', 'Rodriguez', 3082, '', '', ''),
(314, 'Linda', 'Lee', 3062, '', '', ''),
(315, 'Elizabeth', 'Anderson', 3060, '', '', ''),
(316, 'Joseph', 'Lee', 3053, '', '', ''),
(317, 'Mark', 'Taylor', 3052, '', '', ''),
(318, 'Susan', 'Anderson', 3049, '', '', ''),
(319, 'Patricia', 'White', 3040, '', '', ''),
(320, 'Patricia', 'Jackson', 3037, '', '', ''),
(321, 'Patricia', 'Thompson', 3035, '', '', ''),
(322, 'Jennifer', 'Jackson', 2995, '', '', ''),
(323, 'Barbara', 'Moore', 2987, '', '', ''),
(324, 'Daniel', 'Thomas', 2986, '', '', ''),
(325, 'Joseph', 'Jackson', 2953, '', '', ''),
(326, 'Barbara', 'Thomas', 2909, '', '', ''),
(327, 'Barbara', 'Martin', 2886, '', '', ''),
(328, 'Elizabeth', 'Martin', 2882, '', '', ''),
(329, 'Elizabeth', 'Moore', 2860, '', '', ''),
(330, 'Joseph', 'Anderson', 2848, '', '', ''),
(331, 'Mark', 'Thomas', 2838, '', '', ''),
(332, 'Barbara', 'Jackson', 2803, '', '', ''),
(333, 'Joseph', 'Thompson', 2796, '', '', ''),
(334, 'Elizabeth', 'Taylor', 2773, '', '', ''),
(335, 'Barbara', 'White', 2752, '', '', ''),
(336, 'Barbara', 'Thompson', 2658, '', '', ''),
(337, 'Elizabeth', 'Thomas', 2655, '', '', ''),
(338, 'Elizabeth', 'Thompson', 2646, '', '', ''),
(339, 'Daniel', 'Jackson', 2566, '', '', ''),
(340, 'Susan', 'Wilson', 2551, '', '', ''),
(341, 'Elizabeth', 'White', 2516, '', '', ''),
(342, 'Susan', 'Martin', 2450, '', '', ''),
(343, 'Linda', 'Garcia', 2448, '', '', ''),
(344, 'Susan', 'Taylor', 2340, '', '', ''),
(345, 'Susan', 'Lee', 2338, '', '', ''),
(346, 'William', 'Rodriguez', 2331, '', '', ''),
(347, 'Susan', 'Moore', 2276, '', '', ''),
(348, 'Susan', 'Thomas', 2254, '', '', ''),
(349, 'Patricia', 'Lee', 2237, '', '', ''),
(350, 'Linda', 'Martinez', 2175, '', '', ''),
(351, 'Elizabeth', 'Lee', 2159, '', '', ''),
(352, 'Susan', 'Thompson', 2131, '', '', ''),
(353, 'Elizabeth', 'Jackson', 2130, '', '', ''),
(354, 'James', 'Garcia', 2048, '', '', ''),
(355, 'Mark', 'Moore', 2046, '', '', ''),
(356, 'Mark', 'White', 2030, '', '', ''),
(357, 'Mark', 'Jackson', 2011, '', '', ''),
(358, 'Barbara', 'Lee', 1999, '', '', ''),
(359, 'Susan', 'White', 1998, '', '', ''),
(360, 'Linda', 'Rodriguez', 1969, '', '', ''),
(361, 'James', 'Martinez', 1908, '', '', ''),
(362, 'Mark', 'Lee', 1812, '', '', ''),
(363, 'William', 'Martinez', 1719, '', '', ''),
(364, 'William', 'Garcia', 1702, '', '', ''),
(365, 'Mark', 'Martin', 1575, '', '', ''),
(366, 'James', 'Rodriguez', 1554, '', '', ''),
(367, 'Mark', 'Martinez', 1527, '', '', ''),
(368, 'Mark', 'Garcia', 1509, '', '', ''),
(369, 'Susan', 'Jackson', 1478, '', '', ''),
(370, 'Thomas', 'Garcia', 1404, '', '', ''),
(371, 'Thomas', 'Martinez', 1393, '', '', ''),
(372, 'Barbara', 'Garcia', 1364, '', '', ''),
(373, 'Barbara', 'Rodriguez', 1243, '', '', ''),
(374, 'Mark', 'Rodriguez', 1233, '', '', ''),
(375, 'Barbara', 'Martinez', 1209, '', '', ''),
(376, 'Susan', 'Garcia', 1202, '', '', ''),
(377, 'Susan', 'Martinez', 1092, '', '', ''),
(378, 'Susan', 'Rodriguez', 1005, '', '', ''),
(379, 'Maria', 'Smith', 980, '', '', ''),
(380, 'Thomas', 'Rodriguez', 939, '', '', ''),
(381, 'Charles', 'Garcia', 896, '', '', ''),
(382, 'Maria', 'Johnson', 796, '', '', ''),
(383, 'Charles', 'Martinez', 769, '', '', ''),
(384, 'Thomas', 'Thomas', 724, '', '', ''),
(385, 'Maria', 'Williams', 635, '', '', ''),
(386, 'Maria', 'Martin', 630, '', '', ''),
(387, 'Charles', 'Rodriguez', 594, '', '', ''),
(388, 'Maria', 'Brown', 587, '', '', ''),
(389, 'Maria', 'Jones', 557, '', '', ''),
(390, 'Maria', 'Miller', 483, '', '', ''),
(391, 'Maria', 'Davis', 428, '', '', ''),
(392, 'Maria', 'Thomas', 347, '', '', ''),
(393, 'Maria', 'Wilson', 346, '', '', ''),
(394, 'Maria', 'Anderson', 335, '', '', ''),
(395, 'Maria', 'Lee', 315, '', '', ''),
(396, 'Maria', 'Thompson', 296, '', '', ''),
(397, 'Maria', 'Moore', 283, '', '', ''),
(398, 'Maria', 'White', 279, '', '', ''),
(399, 'Maria', 'Taylor', 278, '', '', ''),
(400, 'Maria', 'Jackson', 258, '', '', ''),
(401, 'Raihan', 'Raihan', 0, '', '', ''),
(402, 'Raihan', 'ahmed', 34556, '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `babynames`
--
ALTER TABLE `babynames`
  ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
