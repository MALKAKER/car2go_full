-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 17, 2018 at 09:47 PM
-- Server version: 5.5.52-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `maker_rentCar_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `parkingSpace` int(10) NOT NULL DEFAULT '0',
  `branchNumber` bigint(20) NOT NULL,
  `branchAddress` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`parkingSpace`, `branchNumber`, `branchAddress`) VALUES
(3, 1234, 'ISRAEL,Beitar,Mutzaffi,9'),
(7, 5678, 'USA,Holiwood,La La Land,9'),
(3, 9101, 'ISRAEL,Jerusalem,Beit HaDfus,7');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `locationNumber` bigint(20) DEFAULT NULL,
  `modelType` varchar(45) DEFAULT NULL,
  `mileage` float NOT NULL,
  `licencePlate` varchar(45) NOT NULL DEFAULT '',
  `fuelMode` enum('Empty','Low','Medium','Full') NOT NULL,
  `carStatus` enum('true','false') NOT NULL DEFAULT 'true'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`locationNumber`, `modelType`, `mileage`, `licencePlate`, `fuelMode`, `carStatus`) VALUES
(9101, 'blah123', 92735, '12345678', 'Full', 'true'),
(9101, 'lux100', 28058, '5555555', 'Full', 'true'),
(5678, 'SWEET123', 8525, '56475647', 'Full', 'true'),
(5678, 'I5PN0TEQLNP', 900, '56564738', 'Medium', 'true'),
(9101, '6778ty', 29259, '78879889', 'Full', 'true'),
(5678, 'I5PN0TEQLNP', 8000, '7888878', 'Medium', 'true'),
(9101, 'lux100', 19365, '87654321', 'Full', 'true'),
(5678, '6778ty', 110472, '88076655', 'Full', 'true'),
(1234, '6778ty', 21367, '88776655', 'Full', 'false'),
(1234, 'yuuyu45', 888889, '9090877', 'Full', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE `models` (
  `model` varchar(45) NOT NULL,
  `modelName` varchar(45) NOT NULL,
  `engineVol` int(20) NOT NULL DEFAULT '600',
  `mileageNumber` int(20) DEFAULT NULL,
  `pollutionLevel` int(20) NOT NULL,
  `numberOfSeats` smallint(5) NOT NULL,
  `trunkHeight` int(11) NOT NULL,
  `trunkWidth` int(11) NOT NULL,
  `isGearBox` enum('true','false') NOT NULL DEFAULT 'false',
  `isLimitMileage` enum('true','false') NOT NULL DEFAULT 'false',
  `airConditioning` enum('true','false') NOT NULL DEFAULT 'false',
  `isSafetySystem` enum('true','false') NOT NULL DEFAULT 'false',
  `carCompany` enum('Audi','BMW','Bugatti','Cadillac','Chevrolet','Citroen','Fiat','Farrari','Ford','Honda','Hummer','Jaguar','JEEP','Kia','Lamborghini','lexus','Mazda','Mercedes_Benz','Mini','Nissan','Skoda','Volkswagen','Volvo') NOT NULL,
  `safetyType` enum('Mobileye','Other') DEFAULT NULL,
  `carColor` enum('Red','Blue','Black','White') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `models`
--

INSERT INTO `models` (`model`, `modelName`, `engineVol`, `mileageNumber`, `pollutionLevel`, `numberOfSeats`, `trunkHeight`, `trunkWidth`, `isGearBox`, `isLimitMileage`, `airConditioning`, `isSafetySystem`, `carCompany`, `safetyType`, `carColor`) VALUES
('6778ty', 'jeepy', 800, 900, 8, 3, 1, 1, 'true', 'true', 'true', 'true', 'JEEP', 'Mobileye', 'Red'),
('blah123', 'blahblah', 600, 7000, 5, 5, 50, 50, 'true', 'true', 'true', 'true', 'lexus', 'Mobileye', 'Black'),
('BMW100', 'Mountain', 600, 2000, 10, 5, 100, 100, 'true', 'true', 'true', 'true', 'BMW', 'Mobileye', 'Red'),
('I5PEQLNP', 'YESNO', 600, 90, 12, 7, 90, 90, 'true', 'true', 'true', 'true', 'Bugatti', 'Mobileye', 'Red'),
('I5PN0TEQLNP', 'ABC123', 600, 90, 13, 7, 90, 90, 'true', 'true', 'true', 'true', 'Cadillac', 'Mobileye', 'Red'),
('lux100', 'happy', 600, 10000, 4, 7, 90, 90, 'true', 'true', 'true', 'true', 'BMW', 'Mobileye', 'Blue'),
('sport', 'minisport', 600, 1, 1, 5, 70, 70, 'true', 'false', 'false', 'true', 'Hummer', 'Other', 'Black'),
('SWEET123', 'lolol', 600, 8000, 10, 5, 1, 1, 'true', 'true', 'true', 'true', 'Mini', 'Other', 'Red'),
('yuuyu45', 'yay', 600, 1, 7, 3, 44, 44, 'false', 'false', 'false', 'false', 'Audi', 'Mobileye', 'Red');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderNumber` int(10) NOT NULL,
  `clientNumber` varchar(20) DEFAULT NULL,
  `carNumber` varchar(8) DEFAULT NULL,
  `startMileage` float NOT NULL,
  `endMileage` float DEFAULT NULL,
  `fuelVol` float DEFAULT NULL,
  `billAmount` decimal(20,0) DEFAULT NULL,
  `startRent` varchar(20) NOT NULL,
  `endRent` varchar(20) DEFAULT NULL,
  `orderStatus` enum('true','false') NOT NULL DEFAULT 'true',
  `isFuel` enum('true','false') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderNumber`, `clientNumber`, `carNumber`, `startMileage`, `endMileage`, `fuelVol`, `billAmount`, `startRent`, `endRent`, `orderStatus`, `isFuel`) VALUES
(12381, '333333333', '88076655', 455, 7590, 74, '0', '17/01/2018 13:33:10 ', '24/01/2018 13:33:10 ', 'false', 'true'),
(12382, '333333333', '88776655', 888, 5718, 51, '2897', '23/01/2018 10:55:43 ', '24/01/2018 12:55:43 ', 'false', 'true'),
(12383, '333333333', '12345678', 6000, 11494, 82, '0', '24/01/2018 13:36:57 ', '24/01/2018 13:36:57 ', 'false', 'true'),
(12384, '333333333', '12345678', 11494, 18446, 73, '0', '24/01/2018 13:40:12 ', '25/01/2018 20:42:54 ', 'false', 'true'),
(12385, '333333333', '88076655', 7590, 12616, 70, '49910', '24/01/2018 13:41:48 ', '01/03/2018 21:09:32', 'false', 'true'),
(12386, '333333333', '88776655', 5718, 14571, 50, '88530', '24/01/2018 14:01:34 ', '01/03/2018 21:11:05', 'false', 'false'),
(12387, '333333333', '5555555', 2228, 9000, 50, '800', '24/01/2018 14:11:27 ', '20/02/2018 11:36:54', 'false', 'true'),
(12392, '316301191', '12345678', 51646, 57140, 76, '0', '11/02/2018 12:24:54 ', '11/02/2018 13:31:55 ', 'false', 'true'),
(12393, '316301191', '5555555', 2228, 8256, 62, '0', '22/02/2018 13:58:23 ', '22/02/2018 13:58:47 ', 'false', 'true'),
(12394, '316301191', '5555555', 8256, 13867, 84, '0', '22/02/2018 14:03:47 ', '22/02/2018 14:03:47 ', 'false', 'true'),
(12395, '316301191', '87654321', 305, 5669, 90, '0', '22/02/2018 14:04:07 ', '22/02/2018 14:27:15', 'false', 'true'),
(12396, '316301191', '56475647', 700, 8525, 77, '0', '22/02/2018 14:04:42 ', '22/02/2018 14:47:44', 'false', 'true'),
(12397, '316301191', '5555555', 13867, 20468, 73, '0', '22/02/2018 14:59:49 ', '22/02/2018 15:14:46', 'false', 'true'),
(12398, '316301191', '12345678', 57140, 63285, 79, '0', '22/02/2018 15:00:25 ', '22/02/2018 15:19:58', 'false', 'true'),
(12399, '316301191', '78879889', 4444, 10628, 71, '0', '22/02/2018 15:00:33 ', '22/02/2018 15:20:52', 'false', 'true'),
(12400, '316301191', '12345678', 63285, 68935, 63, '56185', '22/02/2018 15:21:34', '22/02/2018 15:42:36', 'false', 'true'),
(12401, '316301191', '12345678', 68935, 76070, 77, '70965', '22/02/2018 15:46:21', '24/02/2018 20:37:55', 'false', 'true'),
(12402, '316301191', '5555555', 20468, 21106, 36, '6200', '24/02/2018 20:52:05', '24/02/2018 20:52:40', 'false', 'true'),
(12406, '316301191', '78879889', 10628, 15927, 68, '52650', '24/02/2018 23:58:09', '01/03/2018 19:31:43', 'false', 'true'),
(12407, '316301191', '9090877', 888888, 888889, 0, '10', '01/03/2018 19:25:18', '01/03/2018 19:52:29', 'false', 'false'),
(12408, '316301191', '78879889', 15927, 22268, 90, '63410', '01/03/2018 19:55:53', '01/03/2018 20:07:03', 'false', 'false'),
(12409, '333333333', '87654321', 5669, 11736, 50, '60670', '01/03/2018 21:07:25', '01/03/2018 21:12:40', 'false', 'false'),
(12410, '333333333', '78879889', 22268, 29259, 50, '69910', '03/03/2018 19:39:52', '03/03/2018 19:40:39', 'false', 'false'),
(12411, '333333333', '87654321', 11736, 19365, 81, '75885', '03/03/2018 19:43:50', '03/03/2018 19:44:15', 'false', 'true'),
(12412, '333333333', '5555555', 1, 7331, 89, '72855', '03/03/2018 19:47:01', '03/03/2018 20:12:00', 'false', 'true'),
(12413, '333333333', '88076655', 12616, 19074, 50, '64580', '03/03/2018 20:00:56', '03/03/2018 20:01:10', 'false', 'false'),
(12414, '333333333', '12345678', 78036, 86277, 86, '81980', '03/03/2018 20:03:31', '03/03/2018 20:03:50', 'false', 'true'),
(12415, '333333333', '12345678', 86277, 92735, 50, '64580', '03/03/2018 22:56:21', '03/03/2018 22:56:34', 'false', 'false'),
(12416, '333333333', '88076655', 19074, 25493, 84, '63770', '07/03/2018 18:54:19', '07/03/2018 18:54:44', 'false', 'true'),
(12417, '333333333', '88076655', 25493, 33018, 76, '74870', '07/03/2018 19:02:08', '07/03/2018 19:02:19', 'false', 'true'),
(12418, '333333333', '88076655', 33018, 40270, 74, '72150', '07/03/2018 20:03:49', '07/03/2018 20:03:58', 'false', 'true'),
(12419, '333333333', '88076655', 40270, 46454, 79, '61445', '07/03/2018 20:06:31', '07/03/2018 20:06:41', 'false', 'true'),
(12420, '333333333', '88076655', 46454, 54162, 73, '76715', '07/03/2018 20:08:10', '07/03/2018 20:08:21', 'false', 'true'),
(12421, '333333333', '88076655', 54162, 60503, 82, '63000', '07/03/2018 20:09:55', '07/03/2018 20:10:04', 'false', 'true'),
(12422, '333333333', '88076655', 60503, 68028, 75, '74875', '07/03/2018 20:11:59', '07/03/2018 20:12:09', 'false', 'true'),
(12423, '333333333', '88076655', 68028, 73561, 50, '55330', '07/03/2018 20:15:15', '07/03/2018 20:15:27', 'false', 'false'),
(12424, '333333333', '88076655', 73561, 79407, 69, '58115', '07/03/2018 20:25:56', '07/03/2018 20:26:17', 'false', 'true'),
(12425, '333333333', '88076655', 79407, 86698, 81, '72505', '07/03/2018 20:43:36', '07/03/2018 20:47:28', 'false', 'true'),
(12426, '333333333', '88076655', 86698, 92348, 76, '56120', '07/03/2018 20:47:41', '07/03/2018 20:49:58', 'false', 'true'),
(12427, '333333333', '88076655', 92348, 96801, 50, '44530', '07/03/2018 20:50:07', '07/03/2018 21:08:36', 'false', 'false'),
(12428, '333333333', '88776655', 14571, 21367, 81, '67555', '07/03/2018 21:07:16', '07/03/2018 21:22:07', 'false', 'true'),
(12429, '333333333', '88076655', 96801, 103142, 50, '63410', '07/03/2018 21:21:40', '07/03/2018 21:22:37', 'false', 'false'),
(12430, '333333333', '5555555', 7331, 14088, 68, '67230', '07/03/2018 21:35:40', '07/03/2018 21:36:21', 'false', 'true'),
(12431, '316301191', '5555555', 14088, 20429, 76, '63030', '08/03/2018 11:26:37', '08/03/2018 11:35:36', 'false', 'true'),
(12432, '316301191', '88076655', 103142, 110472, 76, '72920', '08/03/2018 13:24:36', '08/03/2018 13:25:03', 'false', 'true'),
(12433, '316301191', '5555555', 20429, 28058, 73, '75925', '11/03/2018 06:43:54', '11/03/2018 06:45:35', 'false', 'true'),
(12434, '316301191', '88776655', 21367, NULL, 50, NULL, '12/03/2018 07:49:18', NULL, 'true', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `clientID` varchar(9) NOT NULL DEFAULT '',
  `phoneNumber` bigint(10) NOT NULL DEFAULT '0',
  `email` varchar(100) DEFAULT NULL,
  `creditCard` bigint(20) NOT NULL,
  `userName` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`firstName`, `lastName`, `clientID`, `phoneNumber`, `email`, `creditCard`, `userName`, `password`) VALUES
('w', 'e', '045555444', 9999999900, 'e@gmail.com', 373737373, '045555444', 'kl123'),
('wonder', 'woman', '122112211', 4545454545, 'ww@gmail.com', 4567, '122112211', 'okok100'),
('yoyo', 'koko', '123443212', 909000000, 'yykk@gmail.com', 89328, '123443212', 'yykk0000'),
('t', 't', '123443215', 9999999999, 'y@gmail.com', 67788, '123443215', 'mmm111'),
('Bugs', 'Bunny', '123456789', 545337060, 'BugsBunny@gmail.com', 987654321, '123456789', 'bugsbunny'),
('A', 'B', '125445544', 1111111111, 'AB@gmail.com', 342517, '125445544', 'ffd334'),
('Malki', 'Aker', '316301191', 584465913, 'malkiaker@gmail.com', 1234567890, '316301191', 'malki1996'),
('R', 'C', '333333333', 2222222222, 'Q@gmail.com', 4321, '333333333', 'qqqq1111'),
('MIKEY', 'MOUSE', '343434334', 34343434343, 'mm@gmail.com', 4674474, '', 'mmmm1111'),
('KOFIKO', 'LAZAR', '444333211', 8989899800, 'KL@gmail.com', 456456, '444333211', 'mkmkmk'),
('binyamin', 'netanyahu', '450620189', 555555555, 'bibi@gmail.com', 46789, '4539997189', 'bibib'),
('binyamin', 'netanyahu', '453627189', 555555555, 'bibi@gmail.com', 46789, '453627189', 'bibibyebye'),
('Gal', 'Gadot', '467467467', 4646464463, 'galGadot@gmail.com', 678888, '467467467', 'galwonder'),
('Barbie', 'bar', '564738291', 6745335678, 'barbie@gmail.com', 12345678, '6745335678', 'barbie1996'),
('kim', 'karditian', '565678787', 6789987432, 'kk@gmail.com', 123223, '565678787', '7856er'),
('super', 'man', '666633331', 1111111111, 'sm@gmail.com', 343333, '666633331', 'smsmsm'),
('spider', 'man', '687935121', 566557788, 'man@gmail.com', 89898, '687935121', '999888'),
('nine1', 'west1', '765677177', 6767614444, 'nw1@gmail.com', 898188, '765677177', 'mmmm3331'),
('nine', 'west', '765677777', 6767644444, 'nw@gmail.com', 89888, '765677777', 'mmmm333'),
('BLAH', 'blee', '789789789', 6262626262, 'blee@gmail.com', 782782, '789789789', 'blee111'),
('biti', 'coini', '907889890', 8055215554, 'btcoin@gmail.com', 78680, '907889890', '0oooo0'),
('bitiwE', 'coiniwE', '907889895', 8255215554, 'coin@gmail.com', 786877, '907889895', '0oooo90'),
('bit', 'coin', '907889898', 8855215554, 'bitcoin@gmail.com', 78689, '907889898', '0ooooo'),
('minie', 'mouse', '987667898', 9876567890, 'mm@gmail.com', 6785555, '987667898', 'kkkk6666'),
('charlie', 'chapline', '999999999', 8888888888, 'cc@gmail.com', 76548, '999999999', 'gtdehy67');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branchNumber`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`licencePlate`),
  ADD KEY `locationNumber` (`locationNumber`),
  ADD KEY `modelType` (`modelType`);

--
-- Indexes for table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`model`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderNumber`),
  ADD KEY `carNumber` (`carNumber`),
  ADD KEY `orders_ibfk_1` (`clientNumber`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`clientID`),
  ADD UNIQUE KEY `user_name` (`userName`),
  ADD UNIQUE KEY `password` (`password`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `branchNumber` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9104;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderNumber` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12435;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`locationNumber`) REFERENCES `branches` (`branchNumber`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `cars_ibfk_2` FOREIGN KEY (`modelType`) REFERENCES `models` (`model`) ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`clientNumber`) REFERENCES `users` (`clientID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`carNumber`) REFERENCES `cars` (`licencePlate`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`carNumber`) REFERENCES `cars` (`licencePlate`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
