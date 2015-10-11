-- phpMyAdmin SQL Dump
-- version 4.2.12deb2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 12, 2015 at 12:00 AM
-- Server version: 5.5.44-0+deb8u1
-- PHP Version: 5.6.13-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dcimstack`
--

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE IF NOT EXISTS `devices` (
  `rackid` int(11) NOT NULL,
`device_id` int(11) NOT NULL,
  `device_type` varchar(255) NOT NULL,
  `device_label` varchar(255) NOT NULL,
  `device_brand` varchar(255) NOT NULL,
  `device_serial` varchar(255) NOT NULL COMMENT 'Serial Number',
  `device_mac` varchar(255) NOT NULL,
  `device_ram_total` varchar(255) NOT NULL,
  `device_cpu_count` varchar(255) NOT NULL,
  `device_power_usage` varchar(255) NOT NULL COMMENT 'in Amps',
  `device_power_feed1` varchar(255) NOT NULL,
  `device_power_feed2` varchar(255) NOT NULL,
  `device_cpu` varchar(255) NOT NULL,
  `device_rack_position` int(2) NOT NULL,
  `device_size` int(11) NOT NULL COMMENT 'in U',
  `device_notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
`id` int(11) NOT NULL,
  `event_type` varchar(255) NOT NULL,
  `event_message` varchar(255) NOT NULL,
  `event_status` varchar(255) NOT NULL,
  `event_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hdd`
--

CREATE TABLE IF NOT EXISTS `hdd` (
`id` int(11) NOT NULL,
  `hdd_type` varchar(255) NOT NULL,
  `hdd_brand` varchar(255) NOT NULL,
  `hdd_capacity` varchar(255) NOT NULL,
  `hdd_serial_number` varchar(255) NOT NULL,
  `hdd_age` varchar(255) NOT NULL,
  `hdd_notes` varchar(255) NOT NULL,
  `hdd_added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `power_feeds`
--

CREATE TABLE IF NOT EXISTS `power_feeds` (
  `rackid` int(11) NOT NULL,
`feed_id` int(11) NOT NULL,
  `feed_type` varchar(255) NOT NULL COMMENT 'A or B',
  `feed_power` int(11) NOT NULL COMMENT 'in Amps',
  `feed_voltage` int(11) NOT NULL COMMENT 'in Volts'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rackspace`
--

CREATE TABLE IF NOT EXISTS `rackspace` (
`rackid` int(11) NOT NULL,
  `rack_name` varchar(255) NOT NULL,
  `rack_size` varchar(255) NOT NULL COMMENT 'in U''s',
  `rack_city` varchar(255) NOT NULL,
  `rack_country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(11) NOT NULL COMMENT 'auto incrementing user_id of each user, unique index',
  `user_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s name, unique',
  `user_password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s password in salted and hashed format',
  `user_email` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s email, unique'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_password_hash`, `user_email`) VALUES
(1, 'admin', '$1$sMwLR2cB$V/2igCcG.IFrasNvn/L591', 'user@user.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
 ADD PRIMARY KEY (`device_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hdd`
--
ALTER TABLE `hdd`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `power_feeds`
--
ALTER TABLE `power_feeds`
 ADD PRIMARY KEY (`feed_id`), ADD UNIQUE KEY `feed_id` (`feed_id`), ADD KEY `feed_id_2` (`feed_id`);

--
-- Indexes for table `rackspace`
--
ALTER TABLE `rackspace`
 ADD PRIMARY KEY (`rackid`), ADD KEY `id` (`rackid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `user_name` (`user_name`), ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
MODIFY `device_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hdd`
--
ALTER TABLE `hdd`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `power_feeds`
--
ALTER TABLE `power_feeds`
MODIFY `feed_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rackspace`
--
ALTER TABLE `rackspace`
MODIFY `rackid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index',AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;