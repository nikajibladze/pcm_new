-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2021 at 02:54 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medical_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `personal` varchar(255) DEFAULT NULL,
  `visit_number` int(11) DEFAULT NULL,
  `register_date` datetime(6) DEFAULT NULL ON UPDATE current_timestamp(6),
  `history` varchar(255) DEFAULT NULL,
  `doctor` varchar(255) DEFAULT NULL,
  `doctor_structure` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `personal`, `visit_number`, `register_date`, `history`, `doctor`, `doctor_structure`, `status`) VALUES
(1, 'ნიკა', 'ჯიბლაძე', '01019074070', 2147483647, '2021-09-07 18:10:33.176178', NULL, 'დავით გაგუა', NULL, NULL),
(2, 'გიორგი', 'მამულაშვილი', '0111214125', 113223223, '2021-09-07 18:10:42.997143', NULL, 'თეა კორინთელი', NULL, NULL),
(3, 'ვალერი', 'ფაჩარაული', '57452562318', 21474836, '2021-09-07 20:23:26.787199', NULL, '1', NULL, NULL),
(4, 'ვალერი', 'ჯიბლაძე', NULL, NULL, '2021-09-07 20:24:44.565692', NULL, NULL, NULL, NULL),
(5, 'გიორგი', 'მამულაშვილი', NULL, NULL, '2021-09-07 20:24:41.515401', NULL, NULL, NULL, NULL),
(6, 'დავით', 'ახვლედიანი', '3424244454', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'დავით', 'ახვლედიანი', '3424244454', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'დავით', 'ახვლედიანი', '3424244454', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'დავით', 'ახვლედიანი', '3424244454', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'დავით', 'ახვლედიანი', '3424244454', NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'დავით', 'ახვლედიანი', '3424244454', NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'დავით', 'ახვლედიანი', '3424244454', NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'დავით', 'ახვლედიანი', '3424244454', NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'დავით', 'ახვლედიანი', '3424244454', NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'დავით', 'ახვლედიანი', '3424244454', NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'დავით', 'ახვლედიანი', '3424244454', NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'დავით', 'ახვლედიანი', '3424244454', NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'დავით', 'ახვლედიანი', '3424244454', NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'დავით', 'ახვლედიანი', '3424244454', NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'დავით', 'ახვლედიანი', '3424244454', NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'დავით', 'ახვლედიანი', '3424244454', NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'დავით', 'ახვლედიანი', '3424244454', NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'დავით', 'ახვლედიანი', '3424244454', NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
