
--
-- Database: `hw1`
--

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `code` varchar(6) NOT NULL,
  `passenger` int(11) NOT NULL,
  `available` int(11) NOT NULL,
  `discount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`code`,`passenger`);

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `status` int(1) NOT NULL,
  `phone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `phone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`id`);

-- --------------------------------------------------------

--
-- Table structure for table `rides`
--

CREATE TABLE `rides` (
  `id` int(11) NOT NULL,
  `driver` int(11) NOT NULL,
  `passenger` int(11) NOT NULL,
  `source_lat` float NOT NULL,
  `source_lng` float NOT NULL,
  `destination_lat` float NOT NULL,
  `destination_lng` float NOT NULL,
  `second_destination_lat` float NOT NULL,
  `second_destination_lng` float NOT NULL,
  `total_price` float NOT NULL,
  `final_price` float NOT NULL,
  `discount` varchar(6) NOT NULL,
  `start_time` datetime NOT NULL,
  `finish_time` datetime NOT NULL,
  `score` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
COMMIT;

--
-- Indexes for table `rides`
--
ALTER TABLE `rides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `passenger_id` (`passenger`),
  ADD KEY `driver_id` (`driver`),
  ADD KEY `discount_code` (`discount`);

--
-- Constraints for table `rides`
--
ALTER TABLE `rides`
  ADD CONSTRAINT `discount_code` FOREIGN KEY (`discount`) REFERENCES `discount` (`code`),
  ADD CONSTRAINT `driver_id` FOREIGN KEY (`driver`) REFERENCES `drivers` (`id`),
  ADD CONSTRAINT `passenger_id` FOREIGN KEY (`passenger`) REFERENCES `passengers` (`id`);
COMMIT;

-- --------------------------------------------------------

