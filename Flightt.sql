-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 28, 2020 at 12:06 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Flightt`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(64) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin1@ba', 'admin1'),
('admin2@ba', 'admin2');

-- --------------------------------------------------------

--
-- Table structure for table `aircraft`
--

CREATE TABLE `aircraft` (
  `reg_no` char(6) NOT NULL,
  `capacity` int(3) NOT NULL,
  `model_no` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aircraft`
--

INSERT INTO `aircraft` (`reg_no`, `capacity`, `model_no`) VALUES
('BA-BCB', 78, 'Dash 8-400'),
('BA-CBC', 78, 'Dash 8-400'),
('BA-CDC', 78, 'ATR 72-600'),
('BA-DCD', 78, 'ATR 72-500'),
('BA-FGF', 170, 'Airbus A320-232'),
('BA-GFG', 170, 'Airbus A320-232'),
('BA-GHG', 164, 'Boeing 737-8Q8'),
('BA-HGH', 164, 'Boeing 737-8Q8'),
('BA-IHI', 402, 'Boeing 777-300ER'),
('BA-KJK', 402, 'Boeing 777-300ER'),
('BA-LKL', 402, 'Boeing 777-300ER'),
('BA-MLM', 402, 'Boeing 777-300ER'),
('BA-OPO', 330, 'Airbus A350-900'),
('BA-POP', 330, 'Airbus A350-900');

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `IATA` char(3) NOT NULL,
  `name` varchar(128) NOT NULL,
  `country` varchar(16) NOT NULL,
  `city` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`IATA`, `name`, `country`, `city`) VALUES
('BZL', 'Barisal Airport', 'Bangladesh', 'Barisal'),
('CGP', 'Chittagong Shah Amanat International Airport', 'Bangladesh', 'Chittagong'),
('CXB', 'Cox\'s Bazar Airport', 'Bangladesh', 'Cox\'s Bazar'),
('DAC', 'Dhaka Shahjalal International Airport', 'Bangladesh', 'Dhaka'),
('DXB', 'Dubai International Airport', 'United Arab Emir', 'Dubai'),
('HND', 'Tokyo Haneda International Airport', 'Japan', 'Tokyo'),
('LAX', 'Los Angeles International Airport', 'United States', 'Los Angeles'),
('SIN', 'Singapore Changi Airport', 'Singapore', 'Singapore'),
('SYD', 'Sydney Kingsford Smith Airport', 'Australia', 'Sydney'),
('ZYL', 'Sylhet Osmani International Airport', 'Bangladesh', 'Sylhet');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `bk_id` int(11) NOT NULL,
  `bk_date` datetime NOT NULL DEFAULT current_timestamp(),
  `price` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `flt_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `flt_id` int(11) NOT NULL,
  `callsign` char(5) NOT NULL,
  `sch_id` int(4) NOT NULL,
  `reg_no` char(6) NOT NULL,
  `from_IATA` char(3) NOT NULL,
  `to_IATA` char(3) NOT NULL,
  `Departure_date` date NOT NULL,
  `Availability` tinyint(1) NOT NULL,
  `Booked_for` varchar(10) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`flt_id`, `callsign`, `sch_id`, `reg_no`, `from_IATA`, `to_IATA`, `Departure_date`, `Availability`, `Booked_for`) VALUES
(2, 'avail', 5, 'BA-IHI', 'DAC', 'CXB', '2021-01-08', 1, 'Nobody'),
(4, 'avail', 3, 'BA-IHI', 'DAC', 'DXB', '2021-01-09', 1, NULL),
(5, 'avail', 3, 'BA-DCD', 'LAX', 'ZYL', '2020-12-14', 1, NULL),
(6, 'avail', 3, 'BA-DCD', 'LAX', 'ZYL', '2021-01-14', 1, NULL),
(7, 'avail', 2, 'BA-DCD', 'DAC', 'LAX', '2021-01-13', 1, NULL),
(14, 'avail', 3, 'BA-KJK', 'HND', 'BZL', '2021-01-17', 1, 'Nobody'),
(15, 'avail', 3, 'BA-KJK', 'SIN', 'BZL', '2021-01-11', 1, 'Nobody'),
(16, 'avail', 3, 'BA-KJK', 'DXB', 'BZL', '2021-01-27', 1, 'Nobody');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `username` varchar(64) NOT NULL,
  `password` varchar(32) NOT NULL,
  `fname` varchar(64) NOT NULL,
  `lname` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `gender` char(1) NOT NULL,
  `birthdate` date NOT NULL,
  `passport_no` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`username`, `password`, `fname`, `lname`, `email`, `phone`, `gender`, `birthdate`, `passport_no`) VALUES
('user1', 'user1', 'Test', 'User1', 'user1@ba.com', '+8801798765432', '0', '1999-01-01', 'BH0123456'),
('user2', 'user2', 'Test', 'User2', 'user2@ba.com', '+8801998765432', '1', '1989-02-01', 'BH0987654');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `sch_id` int(4) NOT NULL,
  `day` int(1) NOT NULL,
  `depart_time` time NOT NULL,
  `arrive_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`sch_id`, `day`, `depart_time`, `arrive_time`) VALUES
(1, 0, '10:50:00', '11:20:00'),
(2, 2, '10:50:00', '11:20:00'),
(3, 4, '10:50:00', '11:20:00'),
(4, 5, '10:50:00', '11:20:00'),
(5, 6, '10:50:00', '11:20:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `aircraft`
--
ALTER TABLE `aircraft`
  ADD PRIMARY KEY (`reg_no`);

--
-- Indexes for table `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`IATA`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`bk_id`),
  ADD KEY `username` (`username`),
  ADD KEY `flt_id` (`flt_id`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`flt_id`),
  ADD KEY `sch_id` (`sch_id`),
  ADD KEY `reg_no` (`reg_no`),
  ADD KEY `from_IATA` (`from_IATA`),
  ADD KEY `to_IATA` (`to_IATA`),
  ADD KEY `Booked_for` (`Booked_for`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`sch_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `bk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `flt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `sch_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`username`) REFERENCES `passenger` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`flt_id`) REFERENCES `flight` (`flt_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`sch_id`) REFERENCES `schedule` (`sch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flight_ibfk_2` FOREIGN KEY (`reg_no`) REFERENCES `aircraft` (`reg_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flight_ibfk_3` FOREIGN KEY (`from_IATA`) REFERENCES `airport` (`IATA`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flight_ibfk_4` FOREIGN KEY (`to_IATA`) REFERENCES `airport` (`IATA`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
