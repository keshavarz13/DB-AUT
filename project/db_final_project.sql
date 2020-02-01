-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2020 at 11:55 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_final_project`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_address_log` ()  BEGIN
  DELETE FROM address_log
    WHERE (DATEDIFF(Date(CURRENT_TIMESTAMP()),  Date(log_time))) >= 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_customer_log` ()  BEGIN
  DELETE FROM customer_log
    WHERE (DATEDIFF(Date(CURRENT_TIMESTAMP()),  Date(log_time))) >= 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_delivery_log` ()  BEGIN
  DELETE FROM delivery_log
    WHERE (DATEDIFF(Date(CURRENT_TIMESTAMP()),  Date(log_time))) >= 3;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_foo_rec_log` ()  BEGIN
  DELETE FROM foo_rec_log
    WHERE (DATEDIFF(Date(CURRENT_TIMESTAMP()),  Date(log_time))) >= 3;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_market_log` ()  BEGIN
  DELETE FROM market_log
    WHERE (DATEDIFF(Date(CURRENT_TIMESTAMP()),  Date(logTime))) >= 3;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_material_log` ()  BEGIN
  DELETE FROM market_log
    WHERE (DATEDIFF(Date(CURRENT_TIMESTAMP()),  Date(log_time))) >= 3;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_mat_log` ()  BEGIN
  DELETE FROM material_log
    WHERE (DATEDIFF(Date(CURRENT_TIMESTAMP()),  Date(log_time))) >= 3;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_mat_rec_log` ()  BEGIN
  DELETE FROM mat_rec_log
    WHERE (DATEDIFF(Date(CURRENT_TIMESTAMP()),  Date(log_time))) >= 3;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_sales_log` ()  BEGIN
  DELETE FROM sales_receipt_log
    WHERE (DATEDIFF(Date(CURRENT_TIMESTAMP()),  Date(log_time))) >= 3;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_shopping_log` ()  BEGIN
  DELETE FROM shopping_receipt_log
    WHERE (DATEDIFF(Date(CURRENT_TIMESTAMP()),  Date(log_time))) >= 3;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `AddressId` int(11) NOT NULL,
  `UserId` varchar(10) DEFAULT NULL,
  `address` text NOT NULL,
  `name` varchar(50) NOT NULL,
  `PhoneNumber` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`AddressId`, `UserId`, `address`, `name`, `PhoneNumber`) VALUES
(1, '022316579', 'qom kh 72 tan', 'khune', '0253698741');

--
-- Triggers `address`
--
DELIMITER $$
CREATE TRIGGER `delete_address_log` AFTER DELETE ON `address` FOR EACH ROW INSERT INTO `address_log`(`AddressId`, `UserId`, `address`, `name`, `PhoneNumber`, `logTime`, `Action`) VALUES (old.AddressId, old.UserId, old.address, old.name, old.PhoneNumber,CURRENT_TIMESTAMP,"Delete")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_address_log` AFTER INSERT ON `address` FOR EACH ROW INSERT INTO `address_log`(`AddressId`, `UserId`, `address`, `name`, `PhoneNumber`, `logTime`, `Action`) VALUES (new.AddressId, new.UserId, new.address, new.name, new.PhoneNumber,CURRENT_TIMESTAMP,'insert')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_address_log` AFTER UPDATE ON `address` FOR EACH ROW INSERT INTO `address_log`(`AddressId`, `UserId`, `address`, `name`, `PhoneNumber`, `logTime`, `Action`) VALUES (old.AddressId, old.UserId, old.address, old.name, old.PhoneNumber,CURRENT_TIMESTAMP,'update')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `address_log`
--

CREATE TABLE `address_log` (
  `AddressId` int(11) NOT NULL,
  `UserId` varchar(10) DEFAULT NULL,
  `address` text NOT NULL,
  `name` varchar(50) NOT NULL,
  `PhoneNumber` varchar(10) NOT NULL,
  `logTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Action` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address_log`
--

INSERT INTO `address_log` (`AddressId`, `UserId`, `address`, `name`, `PhoneNumber`, `logTime`, `Action`) VALUES
(2, '0022319433', 'kh 17 shahrivar', 'manzel', '0213351750', '2020-01-31 10:10:49', 'insert'),
(2, '0022319433', 'kh 17 shahrivar', 'manzel', '0213351750', '2020-01-31 10:11:28', 'Delete');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `NatinalCode` varchar(10) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `PhoneNumber` varchar(11) NOT NULL,
  `BirthYear` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`NatinalCode`, `FirstName`, `LastName`, `PhoneNumber`, `BirthYear`) VALUES
('0022319433', 'mohammadali', 'keshavarzi', '09125108642', 1999),
('0022319434', 'Mohammad', 'Kazemi', '09115502618', 1999),
('022316578', 'mahdi', 'alipour', '09364091880', 2004),
('022316579', 'mahdi', 'alipour', '09364091880', 2004);

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `delete_customer_log` AFTER DELETE ON `customer` FOR EACH ROW INSERT INTO `customer_log`(`NatinalCode`, `FirstName`, `LastName`, `PhoneNumber`, `BirthYear`, `logTime`, `Action`) VALUES  (old.NatinalCode, old.FirstName,  old.LastName, old.PhoneNumber, old.BirthYear,CURRENT_TIMESTAMP,"Delete")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_customer_log` AFTER INSERT ON `customer` FOR EACH ROW INSERT INTO `customer_log`(`NatinalCode`, `FirstName`, `LastName`, `PhoneNumber`, `BirthYear`, `logTime`, `Action`) VALUES  (new.NatinalCode, new.FirstName,  new.LastName, new.PhoneNumber, new.BirthYear,CURRENT_TIMESTAMP,'insert')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_customer_log` AFTER UPDATE ON `customer` FOR EACH ROW INSERT INTO `customer_log`(`NatinalCode`, `FirstName`, `LastName`, `PhoneNumber`, `BirthYear`, `logTime`, `Action`) VALUES  (old.NatinalCode, old.FirstName,  old.LastName, old.PhoneNumber, old.PhoneNumber,CURRENT_TIMESTAMP,'update')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_log`
--

CREATE TABLE `customer_log` (
  `NatinalCode` varchar(10) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `PhoneNumber` varchar(11) NOT NULL,
  `BirthYear` int(5) NOT NULL,
  `logTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Action` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_log`
--

INSERT INTO `customer_log` (`NatinalCode`, `FirstName`, `LastName`, `PhoneNumber`, `BirthYear`, `logTime`, `Action`) VALUES
('0022316497', 'shahab', 'hoseini', '09126587432', 1351, '2020-01-31 10:08:19', 'Delete');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `NatinalCode` varchar(10) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `PhoneNumber` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`NatinalCode`, `FirstName`, `LastName`, `PhoneNumber`) VALUES
('0022316497', 'kazem', 'ghasab', '09135286497'),
('0022356497', 'mmd', 'mfi', '09122225678');

--
-- Triggers `delivery`
--
DELIMITER $$
CREATE TRIGGER `delete_delivery_log` AFTER DELETE ON `delivery` FOR EACH ROW INSERT INTO `delivery_log`(`NatinalCode`, `FirstName`, `LastName`, `PhoneNumber`, `logTime`, `Action`) VALUES  (old.NatinalCode, old.FirstName,  old.LastName, old.PhoneNumber,CURRENT_TIMESTAMP,"Delete")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_delivery_log` AFTER INSERT ON `delivery` FOR EACH ROW INSERT INTO `delivery_log`(`NatinalCode`, `FirstName`, `LastName`, `PhoneNumber`, `logTime`, `Action`) VALUES  (new.NatinalCode, new.FirstName,  new.LastName, new.PhoneNumber,CURRENT_TIMESTAMP,'insert')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_delivery_log` AFTER UPDATE ON `delivery` FOR EACH ROW INSERT INTO `delivery_log`(`NatinalCode`, `FirstName`, `LastName`, `PhoneNumber`, `logTime`, `Action`) VALUES  (old.NatinalCode, old.FirstName,  old.LastName, old.PhoneNumber,CURRENT_TIMESTAMP,'update')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_log`
--

CREATE TABLE `delivery_log` (
  `NatinalCode` varchar(10) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `PhoneNumber` varchar(11) NOT NULL,
  `logTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Action` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery_log`
--

INSERT INTO `delivery_log` (`NatinalCode`, `FirstName`, `LastName`, `PhoneNumber`, `logTime`, `Action`) VALUES
('0022319438', 'Masoud', 'Ghiasi', '09023456987', '2020-01-31 10:14:46', 'Delete');

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `FoodId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Price` float NOT NULL,
  `IsActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`FoodId`, `Name`, `Price`, `IsActive`) VALUES
(1, 'koofte', 10.5, 1),
(2, 'joojekabab', 12, 0),
(3, 'kabab koobide', 13, 1),
(4, 'kabab koobide', 14, 1),
(5, 'ghormesabzi', 12, 0);

--
-- Triggers `food`
--
DELIMITER $$
CREATE TRIGGER `delete_food_log` AFTER DELETE ON `food` FOR EACH ROW INSERT INTO `food_log`(`FoodId`, `Name`, `Price`, `IsActive`, `logTime`, `Action`) VALUES  (old.FoodId, old.Name,  old.Price, old.IsActive,CURRENT_TIMESTAMP,"Delete")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_food_log` AFTER INSERT ON `food` FOR EACH ROW INSERT INTO `food_log`(`FoodId`, `Name`, `Price`, `IsActive`, `logTime`, `Action`) VALUES  (new.FoodId, new.Name,  new.Price, new.IsActive,CURRENT_TIMESTAMP,'insert')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_food_log` AFTER UPDATE ON `food` FOR EACH ROW INSERT INTO `food_log`(`FoodId`, `Name`, `Price`, `IsActive`, `logTime`, `Action`) VALUES  (old.FoodId, old.Name,  old.Price, old.IsActive,CURRENT_TIMESTAMP,'update')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `food_log`
--

CREATE TABLE `food_log` (
  `FoodId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Price` float NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `logTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Action` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food_log`
--

INSERT INTO `food_log` (`FoodId`, `Name`, `Price`, `IsActive`, `logTime`, `Action`) VALUES
(9, 'barbari', 1, 1, '2020-01-31 06:28:45', 'insert'),
(6, '3', 0, 0, '2020-01-31 06:29:06', 'Delete'),
(7, '3', 0, 0, '2020-01-31 06:29:09', 'Delete'),
(8, '3', 0, 0, '2020-01-31 06:29:11', 'Delete'),
(9, 'barbari', 1, 1, '2020-01-31 06:29:37', 'Delete');

-- --------------------------------------------------------

--
-- Table structure for table `foo_rec`
--

CREATE TABLE `foo_rec` (
  `FoodId` int(11) DEFAULT NULL,
  `receiptId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foo_rec`
--

INSERT INTO `foo_rec` (`FoodId`, `receiptId`) VALUES
(1, 0),
(4, 2),
(1, 3),
(4, 4),
(4, 4),
(4, 4),
(4, 3),
(1, 5),
(3, 6),
(2, 0);

--
-- Triggers `foo_rec`
--
DELIMITER $$
CREATE TRIGGER `delete_foo_rec_log` AFTER DELETE ON `foo_rec` FOR EACH ROW INSERT INTO `foo_rec_log`(`FoodId`, `receiptId`, `logTime`, `Action`) VALUES  (old.FoodId, old.receiptId,CURRENT_TIMESTAMP,"Delete")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_foo_rec_log` AFTER INSERT ON `foo_rec` FOR EACH ROW INSERT INTO `foo_rec_log`(`FoodId`, `receiptId`, `logTime`, `Action`) VALUES  (new.FoodId, new.receiptId,CURRENT_TIMESTAMP,'insert')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_foo_rec_log` AFTER UPDATE ON `foo_rec` FOR EACH ROW INSERT INTO `foo_rec_log`(`FoodId`, `receiptId`, `logTime`, `Action`) VALUES  (old.FoodId, old.receiptId,CURRENT_TIMESTAMP,'update')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `foo_rec_log`
--

CREATE TABLE `foo_rec_log` (
  `FoodId` int(11) DEFAULT NULL,
  `receiptId` int(11) DEFAULT NULL,
  `logTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Action` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foo_rec_log`
--

INSERT INTO `foo_rec_log` (`FoodId`, `receiptId`, `logTime`, `Action`) VALUES
(2, 0, '2020-01-31 10:54:12', 'insert');

-- --------------------------------------------------------

--
-- Table structure for table `market`
--

CREATE TABLE `market` (
  `MarketId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `IsActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `market`
--

INSERT INTO `market` (`MarketId`, `Name`, `IsActive`) VALUES
(2, 'ofoghe koorosh', 1);

--
-- Triggers `market`
--
DELIMITER $$
CREATE TRIGGER `delete_market_log` AFTER DELETE ON `market` FOR EACH ROW INSERT INTO `market_log`(`MarketId`, `Name`, `IsActive`, `logTime`, `Action`)  VALUES  (old.MarketId, old.Name, old.IsActive,CURRENT_TIMESTAMP,"Delete")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_market_log` AFTER INSERT ON `market` FOR EACH ROW INSERT INTO `market_log`(`MarketId`, `Name`, `IsActive`, `logTime`, `Action`)  VALUES  (new.MarketId, new.Name, new.IsActive,CURRENT_TIMESTAMP,'insert')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_market_log` AFTER UPDATE ON `market` FOR EACH ROW INSERT INTO `market_log`(`MarketId`, `Name`, `IsActive`, `logTime`, `Action`)  VALUES  (old.MarketId, old.Name, old.IsActive,CURRENT_TIMESTAMP,'update')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `market_log`
--

CREATE TABLE `market_log` (
  `MarketId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `logTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Action` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `market_log`
--

INSERT INTO `market_log` (`MarketId`, `Name`, `IsActive`, `logTime`, `Action`) VALUES
(1, 'refah', 1, '2020-01-31 10:16:16', 'Delete');

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `MaterialId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Price` float NOT NULL,
  `IsActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`MaterialId`, `Name`, `Price`, `IsActive`) VALUES
(0, 'kahoo', 1.2, 1);

--
-- Triggers `material`
--
DELIMITER $$
CREATE TRIGGER `delete_material_log` AFTER DELETE ON `material` FOR EACH ROW INSERT INTO `material_log`(`MaterialId`, `Name`, `Price`, `IsActive`, `logTime`, `Action`) VALUES  (old.MaterialId, old.Name,  old.Price, old.IsActive,CURRENT_TIMESTAMP,"Delete")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_material_log` AFTER INSERT ON `material` FOR EACH ROW INSERT INTO `material_log`(`MaterialId`, `Name`, `Price`, `IsActive`, `logTime`, `Action`) VALUES  (new.MaterialId, new.Name,  new.Price, new.IsActive,CURRENT_TIMESTAMP,'insert')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_material_log` AFTER UPDATE ON `material` FOR EACH ROW INSERT INTO `material_log`(`MaterialId`, `Name`, `Price`, `IsActive`, `logTime`, `Action`) VALUES  (old.MaterialId, old.Name,  old.Price, old.IsActive,CURRENT_TIMESTAMP,'update')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `material_log`
--

CREATE TABLE `material_log` (
  `MaterialId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Price` float NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `logTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Action` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mat_rec`
--

CREATE TABLE `mat_rec` (
  `MaterialId` int(11) DEFAULT NULL,
  `receiptId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mat_rec`
--

INSERT INTO `mat_rec` (`MaterialId`, `receiptId`) VALUES
(0, 1),
(0, 2),
(0, 2);

--
-- Triggers `mat_rec`
--
DELIMITER $$
CREATE TRIGGER `delete_mat_rec_log` AFTER DELETE ON `mat_rec` FOR EACH ROW INSERT INTO `mat_rec_log`(`MaterialId`, `receiptId`, `logTime`, `Action`)  VALUES  (old.MaterialId, old.receiptId,CURRENT_TIMESTAMP,"Delete")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_mat_rec_log` AFTER INSERT ON `mat_rec` FOR EACH ROW INSERT INTO `mat_rec_log`(`MaterialId`, `receiptId`, `logTime`, `Action`)  VALUES  (new.MaterialId, new.receiptId,CURRENT_TIMESTAMP,'insert')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_mat_rec_log` AFTER UPDATE ON `mat_rec` FOR EACH ROW INSERT INTO `mat_rec_log`(`MaterialId`, `receiptId`, `logTime`, `Action`)  VALUES  (old.MaterialId, old.receiptId,CURRENT_TIMESTAMP,'update')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mat_rec_log`
--

CREATE TABLE `mat_rec_log` (
  `MaterialId` int(11) DEFAULT NULL,
  `receiptId` int(11) DEFAULT NULL,
  `logTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Action` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sales_receipt`
--

CREATE TABLE `sales_receipt` (
  `ReceiptId` int(11) NOT NULL,
  `Address` text DEFAULT NULL,
  `Date` date NOT NULL DEFAULT current_timestamp(),
  `DeliveryId` varchar(10) DEFAULT NULL,
  `UserId` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales_receipt`
--

INSERT INTO `sales_receipt` (`ReceiptId`, `Address`, `Date`, `DeliveryId`, `UserId`) VALUES
(0, 'kh 17 shahrivar', '0000-00-00', NULL, '0022319433'),
(1, 'kh 17 shahrivar', '2020-01-27', NULL, NULL),
(2, 'kh 18 shahrivar', '2020-01-27', NULL, NULL),
(3, 'salam', '2020-01-28', NULL, NULL),
(4, 'meydoon tajrish', '2020-01-30', '0022356497', NULL),
(5, 'meydoon tajrish', '2020-01-31', '0022316497', NULL),
(6, 'qom kh 72 tan', '2020-01-31', '0022316497', '022316579');

--
-- Triggers `sales_receipt`
--
DELIMITER $$
CREATE TRIGGER `delete_sales_receipt_log` AFTER DELETE ON `sales_receipt` FOR EACH ROW INSERT INTO `sales_receipt_log`(`ReceiptId`, `Address`, `Date`, `DeliveryId`, `UserId`, `logTime`, `Action`) VALUES  (old.ReceiptId, old.Address,  old.Date, old.DeliveryId, old.UserId,CURRENT_TIMESTAMP,"Delete")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_sales_receipt_log` AFTER INSERT ON `sales_receipt` FOR EACH ROW INSERT INTO `sales_receipt_log`(`ReceiptId`, `Address`, `Date`, `DeliveryId`, `UserId`, `logTime`, `Action`) VALUES  (new.ReceiptId, new.Address,  new.Date, new.DeliveryId, new.UserId,CURRENT_TIMESTAMP,'insert')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_sales_receipt_log` AFTER UPDATE ON `sales_receipt` FOR EACH ROW INSERT INTO `sales_receipt_log`(`ReceiptId`, `Address`, `Date`, `DeliveryId`, `UserId`, `logTime`, `Action`) VALUES  (old.ReceiptId, old.Address,  old.Date, old.DeliveryId, old.UserId,CURRENT_TIMESTAMP,'update')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_receipt_log`
--

CREATE TABLE `sales_receipt_log` (
  `ReceiptId` int(11) NOT NULL,
  `Address` text DEFAULT NULL,
  `Date` date NOT NULL DEFAULT current_timestamp(),
  `DeliveryId` varchar(10) DEFAULT NULL,
  `UserId` varchar(10) DEFAULT NULL,
  `logTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Action` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales_receipt_log`
--

INSERT INTO `sales_receipt_log` (`ReceiptId`, `Address`, `Date`, `DeliveryId`, `UserId`, `logTime`, `Action`) VALUES
(7, 'iran', '2020-01-31', '0022319438', NULL, '2020-01-31 07:00:10', 'insert'),
(7, 'iran', '2020-01-31', '0022319438', NULL, '2020-01-31 07:00:31', 'Delete');

-- --------------------------------------------------------

--
-- Table structure for table `shopping_receipt`
--

CREATE TABLE `shopping_receipt` (
  `ReceiptId` int(11) NOT NULL,
  `Date` date NOT NULL DEFAULT current_timestamp(),
  `MarketId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shopping_receipt`
--

INSERT INTO `shopping_receipt` (`ReceiptId`, `Date`, `MarketId`) VALUES
(0, '0000-00-00', NULL),
(1, '2020-01-27', NULL),
(2, '2020-01-31', 2),
(3, '2020-01-31', 2);

--
-- Triggers `shopping_receipt`
--
DELIMITER $$
CREATE TRIGGER `delete_shopping_receipt_log` AFTER DELETE ON `shopping_receipt` FOR EACH ROW INSERT INTO `shopping_receipt_log`(`ReceiptId`, `Date`, `MarketId`, `logTime`, `Action`) VALUES  (old.ReceiptId, old.Date, old.MarketId,CURRENT_TIMESTAMP,"Delete")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_shopping_receipt_log` AFTER INSERT ON `shopping_receipt` FOR EACH ROW INSERT INTO `shopping_receipt_log`(`ReceiptId`, `Date`, `MarketId`, `logTime`, `Action`) VALUES  (new.ReceiptId, new.Date, new.MarketId,CURRENT_TIMESTAMP,'insert')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_shopping_receipt_log` AFTER UPDATE ON `shopping_receipt` FOR EACH ROW INSERT INTO `shopping_receipt_log`(`ReceiptId`, `Date`, `MarketId`, `logTime`, `Action`) VALUES  (old.ReceiptId, old.Date, old.MarketId,CURRENT_TIMESTAMP,'update')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `shopping_receipt_log`
--

CREATE TABLE `shopping_receipt_log` (
  `ReceiptId` int(11) NOT NULL,
  `Date` date NOT NULL DEFAULT current_timestamp(),
  `MarketId` int(11) DEFAULT NULL,
  `logTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Action` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`AddressId`),
  ADD KEY `user_fk` (`UserId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`NatinalCode`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`NatinalCode`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`FoodId`);

--
-- Indexes for table `foo_rec`
--
ALTER TABLE `foo_rec`
  ADD KEY `foo_rec_ibfk_1` (`FoodId`),
  ADD KEY `foo_rec_ibfk_2` (`receiptId`);

--
-- Indexes for table `market`
--
ALTER TABLE `market`
  ADD PRIMARY KEY (`MarketId`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`MaterialId`);

--
-- Indexes for table `mat_rec`
--
ALTER TABLE `mat_rec`
  ADD KEY `mat_rec_ibfk_1` (`MaterialId`),
  ADD KEY `mat_rec_ibfk_2` (`receiptId`);

--
-- Indexes for table `sales_receipt`
--
ALTER TABLE `sales_receipt`
  ADD PRIMARY KEY (`ReceiptId`),
  ADD KEY `del_fk` (`DeliveryId`),
  ADD KEY `use_fk` (`UserId`);

--
-- Indexes for table `shopping_receipt`
--
ALTER TABLE `shopping_receipt`
  ADD PRIMARY KEY (`ReceiptId`),
  ADD KEY `mar_fk` (`MarketId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `foo_rec`
--
ALTER TABLE `foo_rec`
  ADD CONSTRAINT `foo_rec_ibfk_1` FOREIGN KEY (`FoodId`) REFERENCES `food` (`FoodId`) ON DELETE SET NULL,
  ADD CONSTRAINT `foo_rec_ibfk_2` FOREIGN KEY (`receiptId`) REFERENCES `sales_receipt` (`ReceiptId`) ON DELETE SET NULL;

--
-- Constraints for table `mat_rec`
--
ALTER TABLE `mat_rec`
  ADD CONSTRAINT `mat_rec_ibfk_1` FOREIGN KEY (`MaterialId`) REFERENCES `material` (`MaterialId`) ON DELETE SET NULL,
  ADD CONSTRAINT `mat_rec_ibfk_2` FOREIGN KEY (`receiptId`) REFERENCES `shopping_receipt` (`ReceiptId`) ON DELETE SET NULL;

--
-- Constraints for table `sales_receipt`
--
ALTER TABLE `sales_receipt`
  ADD CONSTRAINT `del_fk` FOREIGN KEY (`DeliveryId`) REFERENCES `delivery` (`NatinalCode`) ON DELETE SET NULL,
  ADD CONSTRAINT `use_fk` FOREIGN KEY (`UserId`) REFERENCES `customer` (`NatinalCode`) ON DELETE SET NULL;

--
-- Constraints for table `shopping_receipt`
--
ALTER TABLE `shopping_receipt`
  ADD CONSTRAINT `mar_fk` FOREIGN KEY (`MarketId`) REFERENCES `market` (`MarketId`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
