-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 03, 2021 at 09:20 AM
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
-- Database: `css326_db1`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `course_no` int(11) NOT NULL,
  `course_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_code`, `course_no`, `course_name`) VALUES
(1458, 'ME231', 12, 'CAD/CAM'),
(2345, 'GC124', 24, 'Critical Thinking'),
(4576, 'ITS341', 45, 'Programming');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `registration_id` int(11) NOT NULL,
  `student_id` bigint(15) NOT NULL,
  `section_id` int(11) NOT NULL,
  `grade` varchar(2) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`registration_id`, `student_id`, `section_id`, `grade`) VALUES
(602, 6022040411, 623, 'A'),
(603, 6022040412, 625, 'B'),
(604, 6022040413, 354, 'A'),
(605, 6022040414, 267, 'C'),
(606, 6022040415, 147, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `section_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `section_no` int(11) NOT NULL,
  `year` year(4) NOT NULL,
  `semester` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`section_id`, `course_id`, `section_no`, `year`, `semester`) VALUES
(147, 2345, 2, 2020, 2),
(267, 1458, 1, 2020, 2),
(354, 2345, 2, 2019, 1),
(623, 4576, 1, 2019, 1),
(625, 4576, 3, 2019, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` bigint(15) NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `curriculum` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `first_name`, `last_name`, `gender`, `city`, `curriculum`, `date_of_birth`) VALUES
(6022040411, 'Adam', 'Phelps', 'Male', 'New York', 'ICT', '2020-07-24'),
(6022040412, 'Mark', 'Twain', 'Male', 'Los Angeles', 'ICT', '2002-09-13'),
(6022040413, 'Shania', 'Judith', 'Female', 'New York', 'CIVIL', '2001-05-19'),
(6022040414, 'Angelina', 'Rosswell', 'Female', 'California', 'MECHANICAL', '2002-07-27'),
(6022040415, 'Thomas', 'Hardy', 'Male', 'New York', 'MANAGEMENT', '2006-03-19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`registration_id`),
  ADD KEY `section_id_fk` (`section_id`),
  ADD KEY `student_id_fk` (`student_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `course_id_fk` (`course_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `section_id_fk` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`),
  ADD CONSTRAINT `student_id_fk` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
