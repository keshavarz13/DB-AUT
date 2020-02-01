

--
-- Database: `hw2`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `BillId` int(11) NOT NULL,
  `Cost` int(15) NOT NULL,
  `UserId` int(11) NOT NULL,
  `RequestId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `CommentId` int(11) NOT NULL,
  `Question` text NOT NULL,
  `Answer` text NOT NULL,
  `UserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `link`
--

CREATE TABLE `link` (
  `LinkId` int(11) NOT NULL,
  `MainUrl` text NOT NULL,
  `ShortUrl` text NOT NULL,
  `IsFree` tinyint(1) NOT NULL,
  `IsValid` tinyint(1) NOT NULL,
  `CreationTime` date NOT NULL,
  `DisablingTime` date NOT NULL,
  `NumberOfInternalAccess` int(11) NOT NULL,
  `NumberOfExternalAccess` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `RequestId` int(11) NOT NULL,
  `Link` text NOT NULL,
  `State` varchar(25) NOT NULL,
  `LinkId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserId` int(11) NOT NULL,
  `FirstName` text NOT NULL,
  `LastName` text NOT NULL,
  `PhoneNumber` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`BillId`),
  ADD KEY `user_fk` (`UserId`),
  ADD KEY `request_fk` (`RequestId`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`CommentId`),
  ADD KEY `userId_fk` (`UserId`);

--
-- Indexes for table `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`LinkId`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`RequestId`),
  ADD KEY `requested_user` (`UserId`),
  ADD KEY `requested_link` (`LinkId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserId`);


--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `request_fk` FOREIGN KEY (`RequestId`) REFERENCES `request` (`RequestId`),
  ADD CONSTRAINT `user_fk` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `userId_fk` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `requested_link` FOREIGN KEY (`LinkId`) REFERENCES `link` (`LinkId`),
  ADD CONSTRAINT `requested_user` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`);
COMMIT;

-- ------------------------------------------------
DELIMITER $$
CREATE TRIGGER `set_creation_time` BEFORE INSERT ON `link` FOR EACH ROW begin
    SET new.CreationTime = CURRENT_TIMESTAMP;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_invalidation_time` BEFORE UPDATE ON `link` FOR EACH ROW BEGIN
  IF (new.IsValid = 0) and (old.IsValid = 1)
    THEN
    	set new.DisablingTime = CURRENT_TIMESTAMP;
  END IF ;	
END
$$
DELIMITER ;

