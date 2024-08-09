-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2023 at 10:45 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `censusmanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `addinformation`
--

CREATE TABLE `addinformation` (
  `RegID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `FatherName` varchar(100) NOT NULL,
  `DateofBirth` date NOT NULL,
  `NIDNo` int(11) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `BloodGroup` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `ContactNumber` int(11) NOT NULL,
  `Nationality` varchar(100) NOT NULL,
  `User_UserName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addinformation`
--

INSERT INTO `addinformation` (`RegID`, `Name`, `FatherName`, `DateofBirth`, `NIDNo`, `Gender`, `BloodGroup`, `Address`, `ContactNumber`, `Nationality`, `User_UserName`) VALUES
(1, 'Abdullah ', 'Shirajul ISlam', '1999-12-23', 5678099, 'Male', 'B+', 'Dhaka', 1234, 'Bangladeshi', 'Miraj01'),
(2, 'Bhowmik', 'Shopon Bhowmik', '2000-01-27', 56748, 'Male', 'O+', 'Demra', 5643777, 'Ban', 'Taief06'),
(3, 'Samia Islam', 'Shirajul Islam', '2004-12-12', 788845, 'Female', 'A+', 'Dhaka', 5677889, 'Ban', 'Miraj01'),
(4, 'Fazle Rabby', 'Rahim Miaji', '2002-12-13', 677758, 'Male', 'B+', 'Dhaka', 344567, 'Ban', 'Taief06'),
(5, 'Kuril Islam', 'Daru Islam Al', '2006-12-23', 7784899, 'Female', 'O-', 'Dhaka', 76349, 'Ban', 'Shopon01'),
(5, 'Kuril Islam', 'Daru Islam Al', '2006-12-23', 7784899, 'Female', 'O-', 'Dhaka', 76349, 'Ban', 'Taief06');

-- --------------------------------------------------------

--
-- Table structure for table `register_admin_account`
--

CREATE TABLE `register_admin_account` (
  `Name` varchar(50) NOT NULL,
  `Admin_UserName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` int(11) DEFAULT NULL,
  `Pass_Word` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `register_admin_account`
--

INSERT INTO `register_admin_account` (`Name`, `Admin_UserName`, `Email`, `Phone`, `Pass_Word`) VALUES
('Fazle Rasul', 'Fazle01', 'Falze01@gmail.com', 45678, 'Fazle01'),
('Rahul Bhowmik', 'Rahul05', 'rahul05@gmail.com', 78902, 'Rahul05'),
('Abdullah Al Sami', 'Sami58', 'sami58@gmail.com', 904578, 'Sami58');

-- --------------------------------------------------------

--
-- Table structure for table `register_user_account`
--

CREATE TABLE `register_user_account` (
  `Name` varchar(50) NOT NULL,
  `User_UserName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` int(11) NOT NULL,
  `Pass_Word` varchar(50) NOT NULL,
  `Admin_UserName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `register_user_account`
--

INSERT INTO `register_user_account` (`Name`, `User_UserName`, `Email`, `Phone`, `Pass_Word`, `Admin_UserName`) VALUES
('Miraj Talukder ', 'Miraj01', 'Miraj01@gmail.com', 56734, 'Miraj01', 'Sami58'),
('Shopon', 'Shopon01', 'Shopon01@gmail.com', 5678, 'Shopon01', 'Sami58'),
('Taief Siddue', 'Taief06', 'Taief06@gmail.com', 945678, 'Taief06', 'Rahul05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addinformation`
--
ALTER TABLE `addinformation`
  ADD PRIMARY KEY (`RegID`,`Name`,`NIDNo`,`ContactNumber`,`User_UserName`),
  ADD KEY `User_UserName` (`User_UserName`);

--
-- Indexes for table `register_admin_account`
--
ALTER TABLE `register_admin_account`
  ADD PRIMARY KEY (`Admin_UserName`);

--
-- Indexes for table `register_user_account`
--
ALTER TABLE `register_user_account`
  ADD PRIMARY KEY (`User_UserName`),
  ADD KEY `Admin_UserName` (`Admin_UserName`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addinformation`
--
ALTER TABLE `addinformation`
  ADD CONSTRAINT `addinformation_ibfk_1` FOREIGN KEY (`User_UserName`) REFERENCES `register_user_account` (`User_UserName`);

--
-- Constraints for table `register_user_account`
--
ALTER TABLE `register_user_account`
  ADD CONSTRAINT `register_user_account_ibfk_1` FOREIGN KEY (`Admin_UserName`) REFERENCES `register_admin_account` (`Admin_UserName`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
