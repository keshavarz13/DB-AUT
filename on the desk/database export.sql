
CREATE TABLE `application` (
  `application_id` int(11) NOT NULL,
  `state` varchar(20) NOT NULL DEFAULT 'pending',
  `client_id` int(11) NOT NULL,
  `url` int(11) NOT NULL
) ;

-- --------------------------------------------------------

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `response` int(11) NOT NULL,
  `author` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

CREATE TABLE `receipt` (
  `receipt_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `application` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

CREATE TABLE `url` (
  `url_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `short_url` text NOT NULL,
  `free_service` tinyint(1) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  `external_access_count` int(11) NOT NULL DEFAULT 0,
  `internal_access_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `invalidated_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

ALTER TABLE `application`
  ADD PRIMARY KEY (`application_id`),
  ADD KEY `fk_foreign_key_name` (`client_id`),
  ADD KEY `fk_foreign_key_name_2` (`url`);

ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`);

ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_foreign_key_name_3` (`response`),
  ADD KEY `fk_foreign_key_name_4` (`author`);

ALTER TABLE `receipt`
  ADD PRIMARY KEY (`receipt_id`),
  ADD KEY `fk_foreign_key_name_5` (`application`);

ALTER TABLE `url`
  ADD PRIMARY KEY (`url_id`);

ALTER TABLE `application`
  ADD CONSTRAINT `fk_foreign_key_name` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `fk_foreign_key_name_2` FOREIGN KEY (`url`) REFERENCES `url` (`url_id`);

ALTER TABLE `comment`
  ADD CONSTRAINT `fk_foreign_key_name_3` FOREIGN KEY (`response`) REFERENCES `comment` (`id`),
  ADD CONSTRAINT `fk_foreign_key_name_4` FOREIGN KEY (`author`) REFERENCES `client` (`client_id`);

ALTER TABLE `receipt`
  ADD CONSTRAINT `fk_foreign_key_name_5` FOREIGN KEY (`application`) REFERENCES `application` (`application_id`);

-- --------------------------------------------------------

DELIMITER $$
CREATE TRIGGER `set_creation_time` BEFORE INSERT ON `url` FOR EACH ROW begin
    SET new.created_at = CURRENT_TIMESTAMP;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_invalidation_time` BEFORE UPDATE ON `url` FOR EACH ROW BEGIN
  IF (NEW.valid = 0) and (OLD.valid = 1)
    THEN
    	set new.invalidated_at = CURRENT_TIMESTAMP;
  END IF ;	
END
$$
DELIMITER ;
