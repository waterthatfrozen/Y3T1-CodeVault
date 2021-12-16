-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 10, 2021 at 09:18 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `css326_week5`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usergroup` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`title`, `first_name`, `last_name`, `email`, `usergroup`, `disabled`) VALUES
('Ms', 'Jane', 'Doe', 'jane@doe.com', 'Teacher', 1),
('Mr', 'John', 'Doe', 'john@doe.com', 'Student', 0),
('Ms.', 'P', 'N', 'pn@gmail.com', 'Student', 0),
('Mr.', 'P', 'Y', 'py@gmail.com', 'Student', 1),
('Ms.', 'S', 'A', 'sa@gmail.com', 'TA', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
