-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2020 at 04:29 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;

--
-- Database: `cust`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deposit` (IN `Account_ID` INT(11), IN `deposit_amount` FLOAT)  BEGIN
    UPDATE
        account
    SET
        bal = bal + deposit_amount
    WHERE
        ID = Account_ID ;
    INSERT INTO TRANSACTION(TYPE, amount, DATE, accid)
VALUES(
    "D",
    deposit_amount,
    CURRENT_DATE,
    Account_ID
) ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Withdraw` (IN `Account_ID` INT(11), IN `withdraw_amount` FLOAT)  BEGIN
    UPDATE
        account
    SET
        bal = bal - withdraw_amount
    WHERE
        ID = Account_ID ;
    INSERT INTO TRANSACTION(TYPE, amount, DATE, accid)
VALUES(
    "W",
    withdraw_amount,
    CURRENT_DATE,
    Account_ID
) ;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `ID` int(11) NOT NULL,
  `No.` varchar(20) DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `CreditLimit` double DEFAULT NULL,
  `bal` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`ID`, `No.`, `Name`, `CreditLimit`, `bal`) VALUES
(105, 'N01', 'John Morris', 20000, 6000);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `type` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `accid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `type`, `amount`, `date`, `accid`) VALUES
(1, 'W', 6000, '2020-10-31 00:00:00', 105);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
