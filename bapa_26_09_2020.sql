-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2020 at 03:07 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bapa`
--

-- --------------------------------------------------------

--
-- Table structure for table `board_members`
--

CREATE TABLE `board_members` (
  `id` bigint(20) NOT NULL,
  `ref_board_members_category_id` bigint(20) NOT NULL,
  `board_members_first_name` varchar(100) NOT NULL,
  `board_members_last_name` varchar(100) NOT NULL,
  `bio` text NOT NULL,
  `board_members_image_location` varchar(500) DEFAULT NULL,
  `board_member_designation` varchar(200) DEFAULT NULL,
  `board_members_email_address` varchar(250) DEFAULT NULL,
  `board_members_position` int(11) DEFAULT 0,
  `board_members_active` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `board_members`
--

INSERT INTO `board_members` (`id`, `ref_board_members_category_id`, `board_members_first_name`, `board_members_last_name`, `bio`, `board_members_image_location`, `board_member_designation`, `board_members_email_address`, `board_members_position`, `board_members_active`) VALUES
(3, 1, 'Jasim', 'Mia', 'I was born in Bangladesh and migrated to United States on 2009 when I was 21 years old. I began my career with the New York City police department in January 2018 and assign to 33 precinct. I joined the NYPD to serve the community and to retire in early age with a great pension. I am married and I have one son name Aryan Jawad.', '231950853.jpeg', 'Executive Member', 'Jasim@gmail.com', 0, 1),
(4, 2, 'Ershad', 'Siddique', 'Ershad Siddique  was born in Chittagong  Bangladesh. He migrated to the United  States  of America in 1995 when he was 15 years old. In  beginning of 2003, while he was attending  queens  college city university  of New York  he observed  a NYPD recruitment table in the cafeteria.  He approached the police officers and started a conversation which lead him to join  the new York finest and the best police department in the world NYPD class of July  2003.  Ershad Siddique  started  his career  in 19th precinct followed by central park pct. He was promoted  the rank of sergeant  in 2016 and assigned  to 110 precinct. Currently  he is assign to Community  Affairs Bureau in charge of Immigrant Outreach Unit. He has a bachelor degree in Mathematics from city university  of new York Queens college. He is married  with two Sons Jawad and Jinan.', '2038881076.jpeg', 'General Secretary', 'Ershad@gmail.com', 0, 1),
(6, 2, 'MEHADI', 'MAMUN', 'MEHADI MAMUN was born city of jessore, Bangladesh and migrated to the United  states when i was 23 years old.  I began my career with the New york city police department in August  2006 as TRAFFIC ENFORCEMENT AGENT assign to command T-103. I joined  NYPD as a POLICE OFFICER  in January 2013 to serve my community. \r\n I holds a bachelor degree in  Bengali from M M college jessore Bangladesh.  I have been married 12years to my wife and have two sons Muqsit Mamun and Muntasir Mamun.', '1297700831.jpg', 'Member', 'MAMUN@gmail.com', 0, 1),
(7, 2, 'Jamil', 'Sarwar', 'Jamil Sarwar was born in Pirojpur, Bangladesh. He migrated to the United States of America in 2006. He began his career with the New York City Police Department on September 2007 as a TEA. January 2012 he was sworn in as Police Officer. From 2012 until 2014 he served in the 75th Precinct and the 115th Precinct. August 2014 he was assigned to Intelligence Bureau where he was promoted to Rank of Detective on February 2016, he is currently assigned to Intelligence Bureau. He has a Master’s Degree Major in history from the University of Rajshahi, Bangladesh. He is happily married with one daughter.', '1943259220.jpg', 'Vice President', 'Sarwar@gmail.com', 0, 1),
(8, 1, 'SM', 'TUGRIL', 'MY NAME IS SM TUGRIL WAS BORN IN BANGLADESH AND MIGRATED TO THE UNITED STATES WHEN I WAS 45 YEARS OLD. I BEGAN MY CAREER WITH NEW YORK CITY POLICE DEPARTMENT IN MAY 28,2014 ASSIGNED TO TRAFFIC DEPARTMENT AND TRANSFERRED TO SCHOOL SAFETY AGENT MARCH 1ST 2016 BRONX WEST COMMAND 48 PRECINCT. I JOINED SCHOOL SAFETY DEPARTMENT TO SERVE MY COMMUNITY \r\nI HOLDS MASTERS DEGREE IN POLITICAL SCIENCE UNDER DHAKA UNIVERSITY AND BACHELOR OF LAW UNDER RAJSHAHI UNIVERSITY. I HAVE BEEN MARRIED TO MY WIFE AND WE HAVE ONE SON SM FAHMID AND ONE DAUGHTER THNJIM ARA.', '1522247868.jpg', 'Member', 'TUGRIL@gmail.com', 0, 1),
(9, 1, 'aaa', 'aa', 'aa', '786485154.jpg', 'aa', 'aaa@aaa.com', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `board_members_categories`
--

CREATE TABLE `board_members_categories` (
  `id` bigint(20) NOT NULL,
  `board_members_category_name` varchar(200) NOT NULL,
  `board_members_category_position` int(11) DEFAULT 0,
  `board_members_category_active` tinyint(4) DEFAULT 1 COMMENT '1 means active and 0 means not active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `board_members_categories`
--

INSERT INTO `board_members_categories` (`id`, `board_members_category_name`, `board_members_category_position`, `board_members_category_active`) VALUES
(1, 'Executive', 0, 1),
(2, 'Trustees', 1, 1),
(4, 'kkk', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint(20) NOT NULL,
  `ref_membership_id` int(11) NOT NULL,
  `contact_us_subject` text DEFAULT NULL,
  `contact_us_details` text DEFAULT NULL,
  `contact_us_seen` tinyint(4) DEFAULT 0,
  `contact_us_created_date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customusers`
--

CREATE TABLE `customusers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passcode` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) NOT NULL,
  `event_title` text DEFAULT NULL,
  `event_details` text DEFAULT NULL,
  `event_venue` text DEFAULT NULL,
  `event_flyer_location` varchar(500) NOT NULL,
  `event_flyer_type` enum('image','pdf','doc') NOT NULL,
  `event_starting_date` date NOT NULL,
  `event_starting_time` time DEFAULT NULL,
  `event_ending_date` date NOT NULL,
  `event_ending_time` time DEFAULT NULL,
  `event_ticket_price` varchar(10) DEFAULT NULL COMMENT 'null means free',
  `event_ticket_price_children` int(11) NOT NULL,
  `event_total_seat` varchar(10) DEFAULT NULL,
  `event_active` tinyint(4) DEFAULT 1 COMMENT '1 means active and 0 means not active',
  `event_created_datetime` datetime NOT NULL,
  `event_edited_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `event_title`, `event_details`, `event_venue`, `event_flyer_location`, `event_flyer_type`, `event_starting_date`, `event_starting_time`, `event_ending_date`, `event_ending_time`, `event_ticket_price`, `event_ticket_price_children`, `event_total_seat`, `event_active`, `event_created_datetime`, `event_edited_datetime`) VALUES
(1, 'Eid Special', 'Eid Special Details', 'Dhaka', '69491922.jpg', 'image', '2020-08-07', '00:30:00', '2020-08-07', '18:30:00', '100', 30, '4', 1, '2020-08-13 00:00:00', '2020-08-13 08:11:51'),
(2, 'Test Event', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text', 'JB Hall,Newyork', '1242502875.jpg', 'image', '2020-08-05', '01:00:00', '2020-08-05', '08:00:00', '500', 15, '85', 1, '2020-08-13 00:00:00', '2020-08-13 08:11:36'),
(3, 'Pitch your startup idea to us, we\'ll make it happen.', 'Dhaka is the capital city of Bangladesh, in southern Asia. Set beside the Buriganga River, it’s at the center of national government, trade and culture. The 17th-century old city was the Mughal capital of Bengal, and many palaces and mosques remain. American architect Louis Khan’s National Parliament House complex typifies the huge, fast-growing modern metropolis.', 'Badda,Dhaka', '1478951663.jpg', 'image', '2020-06-05', '12:30:00', '2020-06-05', '18:00:00', '850', 500, '120', 1, '2020-08-13 00:00:00', '2020-08-13 06:01:09'),
(4, 'IEEE Region 10 Symposium', 'The IEEE Region 10 Symposium is themed as Technology for Impactful Sustainable Development and it intends to bring together individuals conducting projects and research to achieve the United Nation’s 17 global Sustainable Development Goals (SDGs) to end poverty, protect the planet and ensure that all people enjoy peace and prosperity. The focal topics also include AI, Computer Networks, Security & IoT, Computer Vision, Graphics & HCI, Cloud, Big Data & ICT, Devices, Materials & Processing, Ethics and Societal Impacts of Technology, etc.', 'IEEE Region 10 Symposium', '1834061559.jpg', 'image', '2020-06-06', '06:00:00', '2020-06-06', '10:00:00', '580', 250, '85', 1, '2020-08-13 00:00:00', '2020-08-13 06:00:56'),
(5, 'dasf', 'asdSAFA', 'SDF', '2120363752.jpg', 'image', '2020-07-08', '01:00:00', '2020-07-08', '00:30:00', '55', 0, '55', 1, '2020-07-19 00:00:00', '2020-07-19 16:55:37'),
(6, 'Chistmass', 'Chistmass Special details', 'Dhaka', '144966480.jpg', 'image', '2020-08-10', NULL, '2020-08-14', NULL, '500', 200, '10', 1, '2020-08-13 00:00:00', '2020-08-13 06:00:42'),
(7, 'test events', 'test events', 'Sylhet', '1672776760.jpg', 'image', '2020-08-20', NULL, '2020-08-20', NULL, '50', 20, '20', 1, '2020-08-13 00:00:00', '2020-08-13 06:06:43');

-- --------------------------------------------------------

--
-- Table structure for table `event_ticket_buyers`
--

CREATE TABLE `event_ticket_buyers` (
  `id` bigint(20) NOT NULL,
  `ref_event_id` int(11) NOT NULL,
  `ref_membership_id` int(11) NOT NULL,
  `buyer_first_name` varchar(100) DEFAULT NULL,
  `buyer_last_name` varchar(100) DEFAULT NULL,
  `payment_type` enum('cash','online payment','others') DEFAULT NULL,
  `total_tickets` int(11) DEFAULT 0,
  `total_price` varchar(10) DEFAULT NULL,
  `event_ticket_buyer_stored_datetime` datetime NOT NULL,
  `event_ticket_buyer_edited_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event_ticket_payments`
--

CREATE TABLE `event_ticket_payments` (
  `id` bigint(20) NOT NULL,
  `ref_event_id` bigint(20) NOT NULL,
  `event_ticket_payment_by` enum('PAYPAL','DEBIT_CREDIT_MASTER_CARD','OTHERS') DEFAULT NULL,
  `event_ticket_payment_details` text DEFAULT NULL COMMENT 'it is not defined.it could be the last 4 digit of card number and other information',
  `event_ticket_payment_datetime` datetime NOT NULL,
  `event_ticket_payment_amount` varchar(10) NOT NULL,
  `event_ticket_payment_creating_datetime` datetime NOT NULL,
  `event_ticket_payment_editing_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE `memberships` (
  `id` int(10) NOT NULL,
  `user_type_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `memberships`
--

INSERT INTO `memberships` (`id`, `user_type_id`, `name`, `username`, `password`, `email`, `active`, `remember_token`, `created_at`, `updated_at`) VALUES
(25, 1, 'sajed', 'sajedaiub', '$2y$10$dGyYyleI0bXmu4NajczKsuZeproZ745igJRE1c530VLlXOCFriExq', 'sajedaiub@gmail.com', 0, 'ZUmFoxbfJWDf1So0jjRGeMAnlgoBSV94ybczJSVXQlV9KQV3uPeb6ZEEsvj9', '2020-04-04 13:00:01', '2020-04-04 13:00:01'),
(26, 2, 'vvvvvv', 'dfsdfsda', '$2y$10$Tw8eK7EZzXx.aj4K3co45OgWOk1yrmTOU7yH8IVvxf73gluP6x8Nu', 'aaaa@aaa.com', 1, NULL, '2020-04-04 13:16:05', '2020-04-04 13:16:05'),
(27, 1, 'Admin', 'admin', '$2y$10$KaIDkmlgDI7VuSWoABiioOML9R9jGBOclkwcWLFNJh0OEqqCCFZG.', 'admin@admin.com', 1, NULL, '2020-04-04 14:10:26', '2020-04-04 14:10:26'),
(28, 2, 'sajed', 'app123', '$2y$10$1YkpWM.NmeqU9rMgRQXi0u2SOUkvyiRcqvWXYXifKlKTKYCqKN2AS', 'app123@gmail.com', 0, NULL, '2020-04-13 22:17:21', '2020-04-13 22:17:21'),
(29, 2, 'aaa', 'aaa', '$2y$10$dGyYyleI0bXmu4NajczKsuZeproZ745igJRE1c530VLlXOCFriExq', 'aaa@aaa.com', 1, NULL, '2020-04-23 10:25:14', '2020-04-23 10:25:14'),
(30, 2, 'ccc', 'ccc', '$2y$10$aoU.VNYiVyWvl2fCZaXsHOSaoe81YlYbtYYvM8baJ.bKDmtRmxLp.', 'ccc@ccc.com', 1, NULL, '2020-04-29 08:48:03', '2020-04-29 08:48:03'),
(34, 2, 'Sajed Ahmed', 'a@gmail.com', '$2y$10$DTyJjoGNXFn6YEihF/Nn3eWsawVc69qIn.BKgz7QkGQ27nNqrJ0d.', 'a@gmail.com', 1, NULL, '2020-05-14 12:14:01', '2020-05-14 12:14:01'),
(35, 2, 'K M Hasnat', 'abc@gmail.com', '$2y$10$Z0lWARToewqtROqiDYe.cu.gbh5daKsWfjW4Bh4thuoxCHO4AWGhW', 'abc@gmail.com', 1, NULL, '2020-05-14 13:11:02', '2020-05-14 13:11:02'),
(36, 2, 'Anwar hossain Sumon', 'abcc@gmail.cim', '$2y$10$kFvRjhMtS7LKa4z9Ip3WEODRqjH3kiKxPY6n94etCtN.r7Ysffkei', 'abcc@gmail.cim', 1, NULL, '2020-05-14 13:12:59', '2020-05-14 13:12:59'),
(37, 2, 'S A Khan', 'adfsdf@gmail.com', '$2y$10$wpdDca/tWzIraCHWvk/Ywe5VAZJLxsAZx5G5iy9Nfje4XF7gUZHdW', 'adfsdf@gmail.com', 1, NULL, '2020-05-14 13:14:37', '2020-05-14 13:14:37'),
(38, 2, 'Abu Jihan', 'abec@gmail.com', '$2y$10$1OUegaukchtDkkZ5v7OtXuQFPVNQzpYvyCLoVv9leWQUQZnzOF8oS', 'abec@gmail.com', 1, NULL, '2020-05-14 13:18:27', '2020-05-14 13:18:27'),
(39, 2, 'fsdsdf sfdsfdsfd', '123@gmail.com', '$2y$10$6I6YjMpnnCDEk07AKSnuEegds8sI2os9jfooO5qEvfebXc7JCEjGa', '123@gmail.com', 1, NULL, '2020-05-14 13:19:47', '2020-05-14 13:19:47'),
(40, 2, 'Anwar Hossain', 'anwar@gmail.com', '$2y$10$7XqqT5Rz/X8yjMGYsx5.aehoOwS7ahdds08Lf/pbH6XalN43C2L8G', 'anwar@gmail.com', 1, NULL, '2020-05-16 13:37:01', '2020-05-16 13:37:01'),
(41, 2, 'raju', 'raju123', '$2y$10$AdljXxdLtL8oUkT9XOUIzO5OWA9mpIkwjM.Yx7EvNvTVnhmcEToDi', 'raju@gmail.com', 1, NULL, '2020-05-17 13:02:03', '2020-05-17 13:02:03'),
(42, 2, 'km hasnat', 'kmhasnat', '$2y$10$BhWZIimnFj77iuDVDZ7IreZbyRfPW0BLnwUOkS9cVS6rapPldfluu', 'hasnat288@gmail.com', 1, NULL, '2020-05-30 19:20:38', '2020-05-30 19:20:38');

-- --------------------------------------------------------

--
-- Table structure for table `membership_payments`
--

CREATE TABLE `membership_payments` (
  `id` bigint(20) NOT NULL,
  `ref_membership_id` int(11) NOT NULL,
  `membership_payment_ess` tinyint(4) DEFAULT 0 COMMENT '0 means no,1 means yes',
  `membership_payment_by` enum('PAYPAL','DEBIT_CREDIT_MASTER_CARD','OTHERS') DEFAULT NULL,
  `membership_payment_details` text DEFAULT NULL COMMENT 'it is not defined.it could be the last 4 digit of card number and other information',
  `membership_payment_datetime` datetime NOT NULL,
  `membership_payment_amount` varchar(10) NOT NULL,
  `membership_next_renewal_date` date DEFAULT NULL,
  `membership_payment_creating_datetime` datetime NOT NULL,
  `membership_payment_editing_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `membership_payments`
--

INSERT INTO `membership_payments` (`id`, `ref_membership_id`, `membership_payment_ess`, `membership_payment_by`, `membership_payment_details`, `membership_payment_datetime`, `membership_payment_amount`, `membership_next_renewal_date`, `membership_payment_creating_datetime`, `membership_payment_editing_datetime`) VALUES
(1, 34, 1, NULL, NULL, '2020-05-14 00:00:00', '0', NULL, '2020-05-14 00:00:00', '2020-05-14 04:00:00'),
(2, 35, 1, NULL, NULL, '2020-05-14 00:00:00', '0', NULL, '2020-05-14 00:00:00', '2020-05-14 04:00:00'),
(3, 36, 1, NULL, NULL, '2020-05-14 00:00:00', '0', NULL, '2020-05-14 00:00:00', '2020-05-14 04:00:00'),
(4, 37, 1, NULL, NULL, '2020-05-14 00:00:00', '0', NULL, '2020-05-14 00:00:00', '2020-05-14 04:00:00'),
(5, 38, 1, NULL, NULL, '2020-05-14 00:00:00', '0', NULL, '2020-05-14 00:00:00', '2020-05-14 04:00:00'),
(6, 39, 1, NULL, NULL, '2020-05-14 00:00:00', '0', NULL, '2020-05-14 00:00:00', '2020-05-14 04:00:00'),
(7, 40, 1, NULL, NULL, '2020-05-16 00:00:00', '0', NULL, '2020-05-16 00:00:00', '2020-05-16 04:00:00'),
(8, 41, 1, NULL, NULL, '2020-05-17 00:00:00', '0', NULL, '2020-05-17 00:00:00', '2020-05-17 04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `member_devices`
--

CREATE TABLE `member_devices` (
  `id` bigint(20) NOT NULL,
  `ref_member_device_membership_id` int(11) NOT NULL,
  `member_device_os_type` enum('android','ios','windows','others','not defined') NOT NULL,
  `member_device_token_id` text NOT NULL,
  `member_device_unique_id` varchar(200) DEFAULT NULL,
  `member_device_storing_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member_devices`
--

INSERT INTO `member_devices` (`id`, `ref_member_device_membership_id`, `member_device_os_type`, `member_device_token_id`, `member_device_unique_id`, `member_device_storing_datetime`) VALUES
(5, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZmYxZWVjY2Y2NWM2YmU3OTQxYTFlZjgyMTM4ZDZmNGZmOTMzMjZkYWM1MmVjYTBmZmQzNjYxODNhOGNjOTg4MDY5Zjk0MWFlMzk1MjBkMDQiLCJpYXQiOjE1ODU5OTA4ODUsIm5iZiI6MTU4NTk5MDg4NSwiZXhwIjoxNjE3NTI2ODg1LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.pwLjxFpGsuUAnNlZ0C-Y7Lq2QuwqnKfXn5oRPH_U_SUKPaF95nGWLE1T1uke6UuVOIiFUyW_WfQrkF0_pVCxhMZ_I6cYe64KCYaa_TUcLCiAsM6m5qEgjQJSQJOU6eo0-6lymshvtnYp5xUda4O4Xxudf_AjkLszPbxAg_-w1Ues4Lc_SKMuP6IbN97HsWrj3jHQcp90zQCEsPnwRa0LcOUl4Y1EwFyv3464ZsNj7USk79n_EjjRC0jidtAsIJejRH27-j-KUB0mCLj4lF81tDaHCh4ssy5ZOmzxf1dGdOAHTvFbqZzUZCLwrpGILe5uAhFzpmjzy69g-KQeC_qVJoB0WtBuk0wTkc5RrdKGcZC0ioWtyjahm_VgGMYXLah6MyvBcBcOgGSx_oxDH4VgUPh0ROfmAh7hBAy0eqvZQ_gjrWbleqqB7R65iIvIECppC4q4Mo2VSl9CwP_pTEY0ceBjEHRxJv3miHzoeTIBVA8o-ny5FWFGs6PX3blAS2cLXP7LB6QxKCD5scJvWEG3xZjN_S9lE3nag2KwreXxZz-jDkUKSB6TLzd7CWPFNu5jX2NrzVnYthrLZfUtyOXdWY_81lVXN_XyYAtMf1VkvaCs-dMvmrbk83d_IhqOMv16VS90UaeJRXTcAmVvu4Z06bSq1kgd2lQw9u7P9KJM4a0', 'member_device_unique_id', '2020-04-04 09:01:25'),
(6, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiY2M5NDQwNDdhZjhjODNlNTQyOWI2OTE3ZGJkYzI5NDRmM2I5MGE5NWU4YzE4NzhhNGE5MjJiNzdiMWQ2MDBlYWY4ZDY0N2NlMDc5NjJkMzAiLCJpYXQiOjE1ODU5OTUzODgsIm5iZiI6MTU4NTk5NTM4OCwiZXhwIjoxNjE3NTMxMzg4LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.l2EmNFmVyLb1umcQbxiEAaKCwlYuBg4GETOv0zv9wigsohjth16yC4jV0WETQW_hSH8VIkCOCDr9Av5AE9Zx1Qz1steXHYtlm51YeLx9e-Z55DaXKcSFNGFnSVX3MRT2UVRNjOUpoFYCCJGgTPZn3Kc5iqL2swY6NWAVw8uIYihFlhQCWzdR5dQgh-tS13JI4cP8lWc-KaeYWTOn3EoprlGQZ5ERsEnhM5SDyrqjtL9w-1siBumzPjnv0wuXUakTRD81WvLBU5SeZYymC0Zc76glCCgP0LuOKmfujaIVljj4ECpzX7B5x5cHrdhE-FOHaoxT1InannpLfucpRGcFkLobgtegCg6Isf2flaWSISCDTy9wyp1lc0j34m1Cz6x0zP0RLObpi-ep-IlEz4a6ow8huPnoVieeUlL7imM4Kyu4WGkjYaEftZql-zyvZj1BjArMd27SWm3g4fNzoAXGjC9KYV6Kdoveqxzn0tQEvDpafIxlqf0gAVa5Iy6uq0h_8z6lu61fNKs5M8ZxiMXwXfEbgrStVyejbC5QPVOOWj9vgCuD1ABBKiQLEc84-o4zmemy9UkC9Sc6xJkyKMldxnIot3bwAo7ZXS8Z9ngvCTzAwI-tKOMZ3Rx92gOM99Zu49GqkSG0c8e8Y5rVFPFIeXaRovtTZFeU0NZSVydihcM', 'member_device_unique_id', '2020-04-04 10:16:28'),
(7, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMDc1ZjllYjQwNzhkZGJjNmNjNDg5NWM2ZDliMTUyNzRiYTE5YThjNWRkZjQ4NjcxODAwMDJkMzU1YjA4NjI3ZDFhNzViNGJlZjYwZjZlZjYiLCJpYXQiOjE1ODY3MTAyNjcsIm5iZiI6MTU4NjcxMDI2NywiZXhwIjoxNjE4MjQ2MjY3LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.F5DtwqL-o1y0ZO2PMvIt7zLPmq_BbguQQQnbADOCUy0j4EjxLEcldSPf8HR6X2Gs-pIT4s9_ub5yg3nHePUGCfCZhc1rujBRPHcmgu73znZQ9IftM6x1LNm2A9XGyOlIYb4e5BXQtaVMNx77cNGCAV9oJAJQocrc1Lk_EOFsJeEZqtAlihiqwymWno9HGud4y090sGzND5_i6CZG4K7DKIbH8M_N9jrHk3uJqLh4147mAPjeKrDxTKX1Y7sM-V-ghCZYrjAvwqr3OaNB2AAyihyW_aT38Er2eBHQ3o-7fFCDn6sP5ybLcV4ub9x3Rj9VxWNiLkuWSAHCu4zjWjOMXoUylqAf9YxBn0hjoXa4ZNsWPlG9ad4S3WQU5e_ZCcrHIhg6erxTMq900xaH7cRYyode5TEi0dNKYhGvTJAlW7dTqNtUSMUJz-FVk3pSDRdnNqK6LCpqaGhOJtXXke3e7oY08ut5WkGGDQheb5QsQrElPTLi9BxoXh6hS-Uw8m8jrnBlOSFxjSg88ZI-k9DxPdI3JZSB4BRxUTrqdQZg7q3X1VOJydnGrPhT-BxXqMKPUvF8jeXcakkdsewYUfeCVD08TAPtVR8N_gLpzo5rzY8GEtz4mVkaLETkPSkR6F4cvPBzTU8Ys3Eo5MuOGmJU65MNvq4IbUAQ6vqgad2u6_U', 'member_device_unique_id', '2020-04-12 16:51:07'),
(8, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMTY5YTU4YWQ3MzE1ODAzZDU5N2U1MGIzNmQwMWYwY2U1NjA2MTBmNDY3ZTc5ODlhMWEzNGI4MzQ3ZTg2MzM0MzQyZGYxNTE3MTFkNGMwMzciLCJpYXQiOjE1ODY4MDE5NTYsIm5iZiI6MTU4NjgwMTk1NiwiZXhwIjoxNjE4MzM3OTU2LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.JXuCcXY4GglelBedfzV7asQ7rCuGGc7U0IGfGBjskwFqpJ9WEF_bo3wQ-bpIysjwnAc3hCLtG5aWcPygW3FzfNcoqDrEyMh_ex9BdWdK925zYQ0VFlhVQwF-CbZ6DWl7V8s1T2XvYKb_teJ1LWy1a3RP642sxp7Tl1m8GW3YLZdYoJL_fnfzUe4Jsy7erqLkhHR8COiqGvH8Mi3MjvycRtvYttoy7w9FwcGi1KPGFMSohTFH8P0VKbIgjgz2BvkhwTGu-jgg0u7e8G-r2ZzgkyCzfuUUWyd6U61HsDL9-E43oPynaC0LQiw6CPzqXchrtzVNAMAz-PvnE_rXX7dXQ-ZgXI5hUcDgEGQlflYoWtVgF-lIE45WFI4AO5Yf9nK5VY1VVttfgn_ptijMy1q8LaiKY0n0C1HRClyHV2-ai_WzqAKApsvyJZ38O3oczCn3k7j_RKCOlNOGN7yz0-TjqDz7IKNdXSXehzDosN_eQ0ZL7eAyV6bpfuQ8E5AgywkXZGi8rFfqtx4uFhkt0P-hGrQrmMtTXAPWlyAojLtwUzzn_JWd4CjgpDB8aVjvRQXnYluAs4PO9_3AusWie_TgwUOCWkTffxkyFjVmVMjV1Zu5_9CYYXNoDAThegyq-EPWs5viiW_-aDLzpeCj6EHTrcyFMCwfm1f7tlnKqJ2kt_8', 'member_device_unique_id', '2020-04-13 18:19:16'),
(9, 28, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNjhiNzZjYjUwYTEwMDllMWU2YmVkNDE0MzM3NTNhOGFhZDEzNzBjMmE0MWEwZmU3MzlmMGViZWYxMjZlMTMyOTg2NzEzZjNlY2YwNjk5OTUiLCJpYXQiOjE1ODY4MDE5OTAsIm5iZiI6MTU4NjgwMTk5MCwiZXhwIjoxNjE4MzM3OTkwLCJzdWIiOiIyOCIsInNjb3BlcyI6W119.N-F3RpJVgY-nKb1ID0RuVEzbfHNPEvqWv1-n_AwlHjLjbeB4h6OhJXVDEsz6wrSBvJnExTjIuVzeisxG7wqZxniv-THRUzQtBTl9-Dtwm4XCzhkw4s21LVtlVuMT8eEDtoRBobCLFraRzmGz-mWB8Huuhz1WemjHcEcjlXArSdf2V9rGKIKfSZq6sYD69QgPvkV4PE-62PJlMq0Xbigczj4qZymrzlsxdeDIAKQXBhlSqNMAWnh5J27vmZgpkoKbDl0-I6V_D4nbEr8-kR5A5obgiFLbvTLrqA8Yq1wejq3MWv7Kyj8hVWzRrMu8kw0eaj4LSyf2f8OY-GynotpN--BX6MXAXqcS8iPyg8XQWMW2RO3AYUo2njxNxAnqjORC2WdcZAMIP0EaMY-COj46HLUviO0HfBJEsgCngwGmenr5PBGA34kCCEbKSrwUeKaiN3gU6KzKqvQh6DM1x-WcaPy_TQpWZJ9EKxwfD_yMgNyVJPfs7ZTovNp0tOKce7EExV0FmM4u3zm_8p5EDiH4qFHMuPqF8KSMjqxZybY0nSiywq7Eqs1f0KzQ9AbPHoxlPq7zok3yIwTuAzh6RwInUd7RGfU1z0jApd9X6KElczIeVBdAIS_9eNLCS8Z-LKTly5CSUdlB7kvA1kbDpHNlNfErcHxkNaksGLPxnS0vq5o', 'member_device_unique_id', '2020-04-13 18:19:50'),
(10, 28, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMGJmZTI1NzIyYTc3NGNmOTYyZDY2NGUxNTA3MGQxZTRjZjA2MzZlMGI5ZGE1MmI1MTk3Y2RhYzcxNTM1OGQ0NTA5NjczNTU3ODA0NDYzMGUiLCJpYXQiOjE1ODc1NjQ1NjgsIm5iZiI6MTU4NzU2NDU2OCwiZXhwIjoxNjE5MTAwNTY4LCJzdWIiOiIyOCIsInNjb3BlcyI6W119.no-Fqgi84VKsVyzRXt0jklA7O1N_ANR163avLm5HYxs-42Vnw-SmjLqiWM6QVOOvp7C1i_twsS8y7gPa7V3sPcw34vmm1Xnjt-Ne2teLUgCql--CymrOYFJSbq2jZrHX9NdceCZrQifOoipupTK325hvh1MOkUNyLOoVqLYMqoG5zMt-nqZbjUyhV9WM_INWtFsDvpYscKmCaarTF7lgCDpBj9wiTZHZ1vIEuyONi1MdJE01RQCTQ0LOv3b9HtYjxXWDsNPE-JgZinXmlUi088ogUBd2K_sbMVWNfqZqOJ36FM985U_2Zf-MQtjsnY6ARiOs2WgLp4Q6WXtUZjNuybLEFAvJUoJYI6l_5SkZZAKO3VqZbx_Kxb-oqpSsFalAopjSOH8NOO2jsUVyiH9BoTuWvcJv77htoC-hC7P9irMatCDapDkLGCMbEylQGwjotIebBBJoW_Y4rHfnIyW3r6f9PHjA5oNF88q06IQqHT9WAYuMiFoMwiK73lmWFIQ2lCXWMEvHU3oYnNwdZZ52UA5hadHLsPsVJoSuITVCSxRhhxtFrmfxNmp8YvFfhZWpIzYv1IFueQDzMWQQXIRLP5AFx1IJL3yohPFPApBb9u01gl3CjiMBTj7z1i8_XwlXQRznYSYRYJiRmjl6Vm0UIRpkakf9YW9Ehp5lC3WmO6Q', 'member_device_unique_id', '2020-04-22 14:09:28'),
(11, 28, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNWNiOWQxNzViMDc0YjlhZjQ2MDI5MmUwZjUwNGZjYmZkZmZiMmQzNzgxYzYxNGQ1YWM2ZDFhMmI2MWViMThmMTkxODk1ZjFhNzYyYjYxOWYiLCJpYXQiOjE1ODc2NzE1ODQsIm5iZiI6MTU4NzY3MTU4NCwiZXhwIjoxNjE5MjA3NTg0LCJzdWIiOiIyOCIsInNjb3BlcyI6W119.HbXalg2XGpT_UcoECExUhfD-bOqpSxdhEpn6O9Ta85aYQzWeKhwwKxjZASAVErG756EXcuuUCNuniLf8ACmoB31Gc603TFMph5J7KNQ472ymruDaEhYipEADOKBl8Yxz_4whO6A7yPlt71QLpqTUJKAiM2D6XNUi9DbVByX3iwxb0iX2SAqQMmoKKv-9F4UrcDCPYXa7ersz-xLGQVVKyCQgsnC8Jm-CjTlCTzZgWBtRvGpdE2kBMCgRPEGXgB67B6Lqyniw1Gp41ZEu4FZU2GaMXwCmD2dx5-ku9JQ4JeqhDCd-yBcsAslw1Ge-zZOJDeSVnKyea_H7GQBrq-gMxBroLGNEcgkCYZQ6VsaynUxYyZ2whItLXAP5B6fBxMWnOiyPTewE7Kj5b-7j2YbM3VldV6B__FJ26YoMnXsQcGMz4L-muFm34P3DBsAy6b_jnx_8JPa46gdk668Vww9vguVvfJlffK3_jVHZZ37irz31Hx8ry2DhVd1QMBnwFL83IwY2B8LK3u92--sCpP5r3ItU7Gh_orKYK0tKe0-Kz7cvsUIKNINP8A_PlUJE75CK94gdiJsAtUgJTRG0V3lcqSbMWvjdVSol0gOL7_ynjFYOzPMr8VxPhBR5lJbutuo34gJvzdDVVkg07HEAcWWsS8u8TUqmVhTdZt7sLRBl9wg', 'member_device_unique_id', '2020-04-23 19:53:04'),
(12, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiOTk1ZTg1ZTdmYjUzMjE1N2I4NGJiNjZmYTc4MzQ2YjIxZjZlYzA3NzczMzFiMDIzNmZkZmU4MWQ0OGJiZjYyYmJiNzY2Y2ViMDQ0ZTZlZWMiLCJpYXQiOjE1ODc2NzQyNjQsIm5iZiI6MTU4NzY3NDI2NCwiZXhwIjoxNjE5MjEwMjY0LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.F3BdjupMz7eOaaT2bRJAxpuUztm4LKA7EJQEEEZerjxXXgeEAg4v8OZhC5HOjiY4lD1AwJbFaypHMW1yg8uNF0ITDD-yKdQ5Yr8AXNdlAq3Q5dOaG-XjhUqANqbRPPurIr--_4cQgWm0gu7PXGqN4GWNKf2QnQSJGne5cDk4cZjnFKWrv8J3yXVO1V3IcVbARP59LS2pGDh1F3Q4scY34pvXAvxR2xH23VwhH-toYYekD7wiI0G3wpLWN55x4TNJJeXMeuuhkj8XLeB5zXge5GFjVUkyj1yAnY0jIzh5FMi6sGLfkii32TRfxQhIZLhDyx86r8e5V1LdVtV08POxLiDD06lUT4uPdsfORP_7_-zj5c-zPUI0cOmsPYB7gRFxOiuNzmpv4K30F9b2p6rP5pSdXV0BZOnuVfx-iAuk9yPaC35FnwsIsC-vehW3e6II37QtIbslV1i45aLJx3M8lLweHC8hU8c51OpGVlpBQP1k_3EqlxKwh05-wdRPOxk25GAAQksM4YUV1NMel7jAWtYWDd2qxo9BtedJ9L2r-FN9toA7CgXmOuBq3L77coxtX1xh16-mh-Cn6fWKFuWsDOYFPOcq7sFUN2fGohQIR8zaDPFgqqWkL8y9zOmGmpFQj-PraWWNmEiEt-K1dmTgy6M3yLdyrjlzXhAKdYfTx1s', 'member_device_unique_id', '2020-04-23 20:37:44'),
(13, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiY2M0ZTU3NjQzODE3NWQ1NThjZGYzMTdkMThiYTg4NTk4YzY1ZTAyZDljZDkzYzcwM2Y1Nzk1NzBmNWY2YjJkZGE2NDNmOTgwMzNlMzMyMmEiLCJpYXQiOjE1ODgwNzAzNjgsIm5iZiI6MTU4ODA3MDM2OCwiZXhwIjoxNjE5NjA2MzY4LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.aO3Cv_5HfpbsL3Dq6r_eUTBeBJZ5pz2vVfEIrZbwW5jVpjKJp_03V0tcfclUfOAU-P01fM1cRp9hyyxObl11Rh6t0L1BTOr-ENC7lO3J7uk9g3fMBDYBtAEiuGmZiXZr_6PIzMbndMQrQbNsUsV5tDdwOoGjPKAvCcnk7CvkxwVuN06n6PpY167uKo5gXWVb3CR2GOLIODeoIK3i4a4Yh1Pk8f31uHIM4XEf0R1ulSot6pxDr2Q393TasF-jwm4BYUpflrJIgPe-ucjvm9IHJFnhirtGF0QGuvEtVNeL4c7zESl21XhJdzraxEGg9hiEozra3IL2mYNf7QxuoCjQ0BWFQugSu_ZqL4E2s3AfEw7lD1nhA9uS5o0dVecur_u5IawR4g0gtUNLy7osoU1sG15l0lUTHmKWcjiJcaeUG4qEoy_RJ2V_DT1ijYp5Sk3tYU-kO6IqVTX_yVEt-sZKoEpZ0AfsdKy_RWzTHsJt5cgpR99NHWrW7BQnUteoqSzW1_Tjs-35NHrQUm5J7Wv2reYyYHzTTWjlAybRNVkz5P4dy2lK7VL2UPUNeSxXwGdqA5ConTNEp1TnLz5_tBzgm3bRFtwrYErCNhjCd1MpSmzKQxztEd2ScyyNB-kwZeb2T40-rrOtFd2fb5frTj0BqQ6ThGoWwlHKUj31Ezm4GZ8', 'member_device_unique_id', '2020-04-28 10:39:28'),
(14, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZjc1MDNhMTNlN2ViNmVjODkyODUzZWM0NDNkYmU2ZjYyNTJhOWZiZjI2YWI4NDVlZGU1M2E4ZTU0OTFhNTBiNzBmNTVmNjZhYTgyODZhMGYiLCJpYXQiOjE1ODk2MjQwMTUsIm5iZiI6MTU4OTYyNDAxNSwiZXhwIjoxNjIxMTYwMDE1LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.mQwjNWQtX28I1A1O9AQC04Gor59GAJB4WdG5iPJai4r6q9TRTNVPBtNMi7qDRHJyWuT7HM5pIpntTL3lhOHwxnf8bzm5KAKEFrReGJqzu_yuXAa7wu-Pmx6c_M5P29asYaW3aXkXC44WlWwu0OwPRmbAPEtZliGKP_wuyeesuJXNCdwkkBCTlqU75hTaX8OD5Ix_5zsZlL7Jt2iTqDDe61vFhtE6iCmac-iF6m-gnPpi1K1juRtNY9QBmU607c7Ou8PaR9ojNVxjq58DbYmZ1zKyQqgbi_XmMOg_6ydan-DAAr3jQW3yK3GgHXDy_knDxWi2Dt16VDrxy6QYTuRA0jZq-v-WlFyTY2GKd9gcE5aXJYK_6QQUoBzwqVXkckwFZzyYFC1V66wUVtHd29Ly5M-70WtRv_gWjVWqB_L2WyogxNPVRcVi9_LkSvtdevhLJSWt3YfkD43RLO0T30xTDgotmRkM0kQxyRCNFYjhmeewbLpUYggMFYEiGoXDfPTgcPHqC12sm2LQ5pjEepDHHv5Cazk4vnP2xBo90SBlSS9g7VBnnX_96ZxJai4BEXT6FbtsBW6lij9O-HB-IINio_6Nhs0b_6OazR4mNeEeM0tjSsIPWlsSus3i-mGfRbziWRLEG1hT5YB73SmONg23SIr5o2WsB-2SctGf8UntqOY', 'member_device_unique_id', '2020-05-16 10:13:35'),
(15, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMTdlOTZhNzA1YmNmMGQ4Zjk3Yzk5MmMyYjEyYmZkYzAzNTNiZDc5Mzg0MGEzOTg2OWYwOGZhODIwZDc3NDY2OTI0ZjNmNDYxNzA4YjYxYjciLCJpYXQiOjE1ODk2MjQ3MjcsIm5iZiI6MTU4OTYyNDcyNywiZXhwIjoxNjIxMTYwNzI3LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.BkyaIIzR-h5XZwC7UylNM7Lg1cH4ieyZA0Uxru4zrxHUnjLvL8WdQzEbEzGFsx20BDJwvpszIMaqTt1NkU8TfCLof5eicXLKfSShZDMYHRWHucNZ9PjtuzaWaySRa1p_XnkiQnnQM7zZ2R7pjiT3JTh4oZTO-dgnlXcXI2zA82VK9OL_BMjX9rib8kaU47RfLxcBrggRm2adi4HHf65nHCyfz3HlZEjR4DblAjpVUaDdhjDxKKQ3XIe27RYcmQWXoVWcGkBHEOYvkOMHujHlKp26-cnomEjwBSLrzr6Nd2Vtvz1vG1E4dULU2llH0o4zGLCaSdUDLWXGw5LgE9WfcLy_Uv1sUkUGrLJKsPyHrA-IYmF_ZaD_ItJHVnrHZDOq7LE9giprW0rmZCRR6rXEFbmq4I11cocZHCk-TlkT7GnaN6pMh0FKNjTvio-bNXNPlQqwzKmbcf12-G7HkOZj-WzhKnXloFvVKCrw1i0ehvGmIQADfoGlIiqH02wkNkmIDbETLRmVqa6WS9qvXb-H4Yq1kAdk0LjpFKOyhKhPW9PLYi1-bydOwTLioc80irW5LxYFAGl8YAmYNjYGTFuiNwCmVfYBDdkCOrtwhzrt3T8WdHAQwwPkyBD5OKBuf0820hCfkoS3JlLxAW8yVadC84Li-IewWf9YxAr5k10fBY4', 'member_device_unique_id', '2020-05-16 10:25:27'),
(16, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiY2JlNDA5NWMxMjVmNjYzMTE2MDJiNzYzZjJjOWE3NWVjYjY1ZmYwNWJkN2Y0MjA4ZjM5ODY5ZDJhNWQ4ZWYxNzMwYWRmOGY0MjI3MWQyMDEiLCJpYXQiOjE1ODk2MjU3MDQsIm5iZiI6MTU4OTYyNTcwNCwiZXhwIjoxNjIxMTYxNzA0LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.L8TC39V0qjYs9MzhHUOPNrSkAQB-2IIqtibEhihKF6LOZl40UYXO1ZAQs35xvjHmv8nU35_DNDnnKg-GFNp9O-lsVEt9mZoo-1W4n74w8hGXIeHG8RlZ5WzUpbWDRA4wU-HhQkoyiyfcAbfiufSjxTKYnl0EWgpSmWbJzZqQdpjItBXXhO7XX_fnGXOXX9eOr36Y5Lvdy1iPWyFBwjGsEoKA94hmNTU9Mv41g5WrCoCknlXUyezQSqbmOVDd6ZRtKmMjrjyxeGyHw-hqgTvgiFGjnIyl4E1glvGcKrW5tzkxLaaA2AxWF6iLiWonFoLepxPs9edce1XNvltBBVbgAlCdbYR2HCnUjpXFcrHDbNO9mrrWfBIWmnpS-lw2DB916tGK2BTKdUoz7fyfyp8jaTckbSprxnalH76w-zFBZd1fsQU5MhCVXoqRXKjZtUnYs3pyK5CHzPSkAYQuNmihEt0XPNgWWE2LIDo0bXmrk-oTNu3OsgOXmeW7zYJU7DeQAGOecuX-UvwGi8UPWzg59kFWlRAp86iQYGP0CbgO1KEpcNvXvYST1dOUclgtjXDIDaoVdEyYSOQnJIDEaYesqoFYLY8SLOkEYFdNeuVpgoAbIuzuiIWiugi0wLsSjInl7ysEZhLpqdMKylRpY9ccgV9wsX3I5-mOlAf_fnHUASs', 'member_device_unique_id', '2020-05-16 10:41:44'),
(17, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZTc4MDRiMjQ1NDA1YzFiYzA1NGE5MDhhYTI0Nzk2NzlmMTZhYTA3ZGQzNTQ3MmU3NjM3OTVlOWQwNDdlMWRhOWY3ODhlNzgyZGU1OGIzNjMiLCJpYXQiOjE1ODk2MjU4MTAsIm5iZiI6MTU4OTYyNTgxMCwiZXhwIjoxNjIxMTYxODEwLCJzdWIiOiIyNSIsInNjb3BlcyI6W119.E5FctdDgMyx_HKdTUxCGD_qIKqA2fUQ3X7_cWhlFAYEMfRatV5Tqva-uN9zqm4aI7jVTe60ELNI2Xokckcyv2kNu2FAY6zBvgjLGOLQJpn1YSYXI1c9fB5eaefUx_C52h1fYZzfMUrO9-Vw_K1UhNGArZx-guKUxhE1pqp7n_RlwM1N8a0uRK-H5PTWLxyde__bNnKicvhTbbt7ByatQNKGAv57fMmu6O67V6Rcz9A9_PSATEvVCeX4MIVoUO8GXeuT12F0Tgqqmd9Lo9py2A53p_JwvZ9jJ4arlRMRZ_Y-7bI-Rx95NeP2LjaQEQ3_9T97Zmd8JdC-PHtXhHTRl6f0Iph--lGlCcPzUe76uB3KWrD_iM2m9ha9i_B8re48g9RnA4C-i1OdReUjpiKK2TvLmtofscIaFQ6gqnTp_88VlnEyCRXVGK60ri9cUYDFuPlg6NZ0ostyklyg6uzpMNzK3NGoXdw5tgkHuwJlGeZd1G_k1MDZNqYatuBKWP2OgC6UhIKc9ufXFj1jKWHp2Bzc_ArpWJFW9sQMnd8hy7w2jU-9mSMIstAgcxl02XhtoOTLMnMDJ8QCKeJglCmzJ9BLxHvyjyKTBVSagWqFuvLHAJ__pLBf8s8zeY_Ixs88jJDKO0vFosK1IX3CotiIV8FnlTMicDBSTuHY3Kpqe4b8', 'member_device_unique_id', '2020-05-16 10:43:30'),
(18, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMTNhNmUwMTg2NWJiNDJhYjU0MWRjYmQyYzA2MGM2M2M2M2RjNGRhNTIwZjMwOTg0Nzk2YzcwMmNjYzU1MTgzODJjZGU1N2EzMzlkMzAwZmIiLCJpYXQiOjE1ODk2MzUyMDksIm5iZiI6MTU4OTYzNTIwOSwiZXhwIjoxNjIxMTcxMjA5LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.i7QVTVpCblhcquSxpR77rRNopt43_U0I9J_fR7LfpOAHGt4K-xrb1ESQb9qG7xF3aXpzsySw3gzgNxW1v8tBumDQ7YRWiVamB4gy_yHoh3oy3g7zBgL1M2c2FPWf6-C6rJXeJ8Qb_EmRTxYXAAUtZa2hwMzdbkEUEatvQYesJn4Ro1XY2H0rK9CnheZIrzh4knt2g7HuoZ_7Oz8VH9LhMzqKmhwXql-LYMRyX0udSl7gfTyzlBhAjRQmBSZvhO3sgQwKhKMJk_QZgWivklvt2rrsoDahbu8DvFd3SY_zs3Dj3fnb8EmtZGVhyeJ3mCpgpbVb1UpvBSW-X1XtfD8N5OI_dVt_MNbbRBUuCOI00NqglMXCvDMpgcUQCbR-p-5TH1jiTYgTAzoi8AWlpNSiR3Nw0mGYhzLe1mBYCQpQDzDicoyJ62ung0aMi6UDdEqW4jn_Vh1loC6yfeduvNkNaUUcHvX87XUxS7OCcCKa_2m_rhqcmtNfCmcS55eHqyATlT-ZWZ9gszm2XsAF94JaimLX7y_NVetEF4cx7h33mtb3F4Ywb420rquV8k1UTZ62hdLM9ne5QhYjEu8fBWteSDE_RRZnNyYkAPRdxYaJuZR6bZ4iNoAF9Les6Lkfqm7bK_BGYfFt7Xvml85J9vwNF5OuXOkJMxCupWrHhZiTLWs', 'member_device_unique_id', '2020-05-16 13:20:09'),
(19, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZjY2ZmFhNmFkZmNiN2NkZDRkYzQ4ZDRmYmUzNjg2ZTkwZGI0MDI3Y2RjNDY5OWExY2I1NWM3NmM4OTNkMDJlNGZjZGM2NjdlYzhlNmIyYTAiLCJpYXQiOjE1ODk2NDE2MDIsIm5iZiI6MTU4OTY0MTYwMiwiZXhwIjoxNjIxMTc3NjAyLCJzdWIiOiIyNSIsInNjb3BlcyI6W119.Y8Z6fDhff59DFM33RsRN_4q-UNSoJYIkP4Ol8UqWudFLPzVjaGdoUS5kJhXujmd_ebnpPzD8vD9oyxvoytoC0S2sivV4aGCvTlOS6xGZjeNYplHrcLoNCAD0moSoRHCMyOVFX2PNDzvS8zfxw5rXerfOVuCy5VbrJKbJHZTcoKdgduZvKg91tyIMglUFqyl0m3WSpwouZ8AL1F10dt2kVNSFz97UAh7NQHtXvTw2T2FMMrJ_ylnnDeORHoC8Sr6rGcclN5dLHQTHeiXbAS0K7ndJK0Zix5TSHvqCGOE0599lFAr7ZvkBQ07EAIhugb4nBouYCFPLoQC8dlT9lulpHAtTEoHvNx3GMpBkVr-oUrW7XXiwDjlr4Y0QVxCeCac99-b-RS_wI_qIfxI22VZKIq4zw_c_bonfg19sWcoop0vgu-HBM1tE3pXq45XBhOzC43FBstoLFQ_Iw8vT69VFZvO8sLyY-W-e2F3LbU4iOxTXQyQcmPT-LyaeqoiX88fQ_I8kEqnAYtoKdDdOQh-0FZVBQtuguFyPikJ-9tSf5GkwHKfXtTuOJDUrJvGmY6mI-E5-4_sDJSEBpv10xw0upNCgkLji1ydZMVKRgeMhu-crbllvmG7_nzNlN3SI2i-LcmOGOi4PR32DRC5kyoGNtyxob5PDjs7dJaWT0CE-hjc', 'member_device_unique_id', '2020-05-16 15:06:42'),
(20, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiOGRhNjE2OTI3ZWUyNzhjY2YyMGNkMjAwYjFlYjQ2MzNiN2MxMGZmYTBiZWExMTdlODBhNDdiYTU5MzYxM2YzNTE4MzJjNTFiNDFkZDZhMzEiLCJpYXQiOjE1ODk2NDE4MjUsIm5iZiI6MTU4OTY0MTgyNSwiZXhwIjoxNjIxMTc3ODI1LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.ifQe5q2srzKeELZToKBRQy2fc5XkRlz8JorULvMhpFtvsRVGmMG-SCtYbSZg7NXWpTBG10oed3eAWDRUJ13Lse2akMh4_6INn-E-Qtti1Z-8noyxMla4gzYA31aFGUqofeAR9HFCubNpmJTOxU1N9kEvJJeb_07pPwVIA45HBHXLK3phEo8Z9aZepDF05d_LpBzV0N6su_3ChzjLW2mfgjzuvDJ5uSaYOuTweGq2PVTDdQ2hodwcXvijtYA1kvuuNE8-KOu45WmkQXqQbDLdLRN-09LqiVd8o-0phGLRAE9EcZNAZq0bQBpTuhQfuKMGfZHLJwF-EKLpPfK_7mJjA_ayTAX00MUtISXh3QvcSvHU743nif6ObwaEIPJ3GGcc4J2SnzhSfOOYraDjvptLy_kPz1Uyrl8QPUo6PXYKjl5vM5DQyvXJnwqcpxyf1Av31707qeqa3tcaJsMfNOR7il_5FhkPPjEwTh1k4QEeW8kqUifo_XGIqBR_S1OCDeEiona2-w1mSGFSOyA1CACb0tcnzJ70CGMEE3jYc4JJpSfV2EdUzrrYuRHPzItH49VwzzMrHbQj4nmfy4HUEvsYd-X042v4MuqeThGSPFc3lHQViaJHkGbXCCP6JsKcnbatY09QAxY-mtOBbSG0h0WXS3R3IQrn5COvUcJRIL5Al8o', 'member_device_unique_id', '2020-05-16 15:10:25'),
(21, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZTdhZTExMWMwNjM4MGJiMmEwM2RlZmM1MWI2YmU5ZGJkZmQzODI1YmE5NDBjMzQ3OGIzMTNmNjM1OGQzNjkyOWJmZmJiNGVhNmQ4MTVmZGQiLCJpYXQiOjE1ODk2NDIxMDAsIm5iZiI6MTU4OTY0MjEwMCwiZXhwIjoxNjIxMTc4MTAwLCJzdWIiOiIyNSIsInNjb3BlcyI6W119.XdbgoFXNrMaLdKIXnkVv02DObvILekO1NB7L0RruYlyi4bHr7IwvNDXyWOQi4JtvJqbGbVg4XnzTBZ_6snAIF_RQZJHD9Pubk2y-QRzxRD9OndDcbNxpmkac2mH6RjcGeIphTqUS_ziv1vEZFDFiTpaA0zWOuasHwcJmfOFqxm2oNRfjk4JTRXZS1uKe3QNDFI6sfPnBDbL9niau0ygCOQmunbDFzwQszvf9rKJE1lYjb7aArl6BjvKnbw6z4OZw66IxAmp5ij_-8TEdBNsSpcv0LKHU-Oat7_8MsOzocvZ7vqSIMLjJRWRfN4H0u0YoKNpFTFSh01u_gXQP0ACJ57bcv1F7XCmpP7X1NY3nhBsWZTMQAByyjyxZ-yTYEspN0X9PXl1ECNd20ZmPQfmELWjzABlIk1Y1AdzKQCGWuanVbB7KsVGvi8E350AVSlpaAxgsYC2XOmFMR1-dTGzKNCB0UYqwtUfEHtG9LwYIiSBvljMi64HdLxZB7yecvdiZCdf6ZAEbIP_KQSZ37ViUlIR4TKAzDF2bzCM8ocf5SrOW5h6IFWK-rHdWCS3xoo7rEF9lJ1kJljMcqoKjlXbjzy-ypKwDrTwHhEFjnwJwkfkkPKEvOuojF5pmx7HzkTdXNV5UZHUH0_TEUooeYJXaio5AUMT-N2OiDTKnwPbLk60', 'member_device_unique_id', '2020-05-16 15:15:00'),
(22, 41, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMDYxNDUxZTFlN2NmMzkxY2Q3MmU4MTQ5YzQ3Mzg1NmViY2QwOTI5YzQxMmM3ZTRmYWRkOGQ4NDBkYjVlYjAzMGYzYmEwMDQ5YWU3NzJjZTkiLCJpYXQiOjE1ODk3MDYxOTQsIm5iZiI6MTU4OTcwNjE5NCwiZXhwIjoxNjIxMjQyMTk0LCJzdWIiOiI0MSIsInNjb3BlcyI6W119.HkRcF8cr0BWRu-uVG1ddIEIZXwkzDuAW9fo13JqjLc2zrXbhY4RiibNHXv5Ks3sUrR8Rlju4JUDHBNI-1QG6Dt2nAWKAQ5h-Ol2YI51qDagQqivPZON5TvYwckGXLq5Cq3C3RKHRZvkKarpn-NMMffiJPKfKgnl5mCkM3Quc2G-QAHUhTCQfj6HE4sGDR9PScXSt10E6JZ6L7DNnIWuROALibOPO3ihMXKR_W2OI0PTRM--BSohTRvocnArc4ibCt07Q7-dPpcCTYBXpdYYcP5DeqHmz-MBMXzMP19YElinkuKIKCpvK_yVSbPD_YTYvdbntJ0hW3vGl3U2FwmSgntO2JVOFjMkDGzaUu1Wu9TbOL31csPv5Dli0q9PAAbKnGxYnOL6jTBBXQxZz3_ABmsj9eodFzkJ7zH8xkT-y8xraEVJK-th6Uy5uSoRZpX_e0BlBPrMkF89k2as1CD-Urkh8Xgx8c5un-LELWoZhmqdPVe5cl88W67Uu6bgGBBaf5dvd0c7000Uu_sqc1xBwYVuIvr_0hfSddTWHEEkk8x8SLORGsaSFBr9d5FnGmMkeeSbyVnqhGdcbRXF-eVR1PQbG9i5eTu3i03bZzGx8VjYVbOvc_ij6sxSMWFPuVKYmCLKPGvg1NDjTH1Hfj-xVuNPAYcI5UKF49j45Eq96PXo', 'member_device_unique_id', '2020-05-17 09:03:14'),
(23, 41, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMDI0MDQzMzQwY2Q3ZTViYmZkNWY1NzZiOTlkZmE3MDYyMjhiZGE0Y2JkOGRiODg0M2JmZTZlNjQwY2Q0YmVlOTU2OWYxZmQ2OGFmYTgyOWUiLCJpYXQiOjE1ODk3MDY0ODEsIm5iZiI6MTU4OTcwNjQ4MSwiZXhwIjoxNjIxMjQyNDgxLCJzdWIiOiI0MSIsInNjb3BlcyI6W119.MjypWlZ-lL7WBet1Fe2xOII1I-tf0Rz3RevppJWE39XL0HrNwGmRPUkeudaQSYrZgDVBHBbdooaLSgpfmflyYA9V6vknrlrAFBeL0X9k3ZGKasr1ui4A4T2FMUeP1h1kPp3je7Axm97sGa_TnbUSKc9JTrtIzRctJ-Bvp-e7MAWxhRH55g00e3fZC3g9squeQOn5CVdez3XtmQneulPnCA6bPYxE7SsL-Ve-xQofTnWs8ciEgKQebPdFoG5HURQgZbgWsYExrH_4LJs6eEu8S0eaqZbFqU3LxruGV4pIx7eteWakCizrpMeYf8JQz7fcO4WeYv9nkZaf-7emvuUshKnu7IDypwm1FeSWhkvA6AVxF2TbuqCWLLBfL1S9QC7hjKSv8-Z9NOvD4NuUfFsp6tmw_xTWqYgMv0ccBUisivzBz7g0kxu7McjSySMxoP3RgF8-kLaOLIhfF8LXaaawjTtXCf8lNeTzdmqokeS1KwnjHISKa_IakwxllKWdJ5Cyx6o5hcFiqtGIKvZeEIXUbVXyPSD6oBvPTYwJe7Cta221TgguTfUpNJne1bBG3F3a5NSSy5RfO9rSC7e2KZOfZ6H4zdmdRvhL5zUAbd-FBYYhlT3tvohk8tkCwG_p-hKpZg7y_Cdat8xiV6iEmcPJznW-QfvJX1t5p5EngmmT7So', 'member_device_unique_id', '2020-05-17 09:08:01'),
(24, 41, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiYWI3ZGNkMGFmZDA2MjZiZmNmYzYzZDNkMDA0ZjNlMjVjNzlmOGVlOTAzNDE2MDc2YWIwOGJlYjI2MGM3YzZiMDIyOGQ0MDNhM2QxYzk4ZWIiLCJpYXQiOjE1ODk3MDgyNDksIm5iZiI6MTU4OTcwODI0OSwiZXhwIjoxNjIxMjQ0MjQ5LCJzdWIiOiI0MSIsInNjb3BlcyI6W119.RNOclPr4Kls92g7XpJhTdxlw_Vnl_uC1UZQ3qlXv2c4RWFL8dkVLTkAkOfFKf4pdZjgq_ou8LOVerZb-sACVfjK6ecOJ2zs79LitFzCZBq-Lqdyw2qANeTETwxhU6QLOHMGBUk0BuzNrH26Ms6t1Q5cpNlHs0Q9EJ2Pf8l5rjLhn745Mq4Ury9tE8SsSAw79Kb7Zi2jm5-nZkhoGshuZdZbKQnsjhRJm_bKm_cd7vXiTAxEmocaUXgplz54nEOwKLoCHy3SgL7bJRcEAHkXqXDdVPg7QuhljRwY9vxBDPQf6ptxDCQBWod9m3ktKvG34Bzi8Hp7hg8zByDViIQE3sksHU3zxcCdaADsrCErAogcByGo_CkEmGFvDLbJiif6cu_e9aPI-grFX6d9ewgO2itoN630vzFJ02wVjseO7E9KYqUtwgUw3QABqSBsjtOwudyXzkSmoELIIn9H3t2ythNABVNaJiwFSu7h-WHszZy5YEsbqSk4SHYagt1-I0zsQpdFc6xdnEmoPriCst3P8bXWKG0sQWFwbqX2zUOknB9s553sbtKvjylRAS3tGlPJeE_ms7UPjYQLBUlPKCZ7i8eu0KuXPW7uEaNi-Gxp6dA4rfrfJVsLCOMX4FJm3bUYLLhG-I1RvFmhswvuq60a_3x2Zl80ANQEFMNbpGyJtjUA', 'member_device_unique_id', '2020-05-17 09:37:29'),
(25, 41, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiOGVhZjJmZGZhZTE4NTYwZmRkNWM0NWFlMDcwNGEwMGVhZjMxYTBiZTY2ZDRhOTM1ZWU5MDk3MThjNGNlOWI0NTJhM2Q2MTA0MWIzMjRiNjciLCJpYXQiOjE1ODk3NDY4NjYsIm5iZiI6MTU4OTc0Njg2NiwiZXhwIjoxNjIxMjgyODY2LCJzdWIiOiI0MSIsInNjb3BlcyI6W119.n16QxCd0vRCj5EJgpAuMz-Tx38wbccjeoJ9oI4HWlwZgJgcU1VTcvG6YtuN6ZSg4myxNscB6cOpX3801M0oudRsqXrN87OGt8En0R2iM7_iqIix1ENrQG5bBLhDcdCntJLRZul7Rcbt1ndeySgeFHz0WJHJBUtEjwCiu3bbELLimZbvKKYVOGkdaSahvkukOZ3hsqoNHqfVckNeDXpvAgI6i-1HHa9oUKCL4jpkr9V_df5s21KYe62N0UCp00K3Y75Tgg8I1KieYy5OnvPvwb9P-ONTOjAimRmP5Azo8RTZsj3v1M3FVmMWsreLrq8tTRnuX1hO_FxxP9ZSpkHr_nCmqCmvZ0LNTbpCBzpfeGSgR4wKzC22K0Ivu-nB_9V87XjalybikilpDsu0dqENzJ5mjtETxuQ-jf6d2c47BWNm8GkpKhhYf2JaLtzN2EbenbintFqGjriqSq4tY9z1QUzwbCXSnp4Pvh3HXl5yyoxGt4tP2AmlS_um7Xnwk1cwD-dTcmlzB5DTgIOoO2sJi4E5Kcs9IfEnn1BIVLywghMArZL3-yvpGPkYZ_HQpRjg4tt8OqxyltuRSneATwElNxL5T5aORXGzrKJ9k4toaZlWY4qeWs3lzLLPib__TdB4mumy37bTu02Rce01RWGReAxwHCf6LtPUw8JtunpqWMMg', 'member_device_unique_id', '2020-05-17 20:21:06'),
(26, 41, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNzJlYThhZDAyNWIwMjA3NDljZWE3NzA3MmE0NGU3MzEwODU4Y2I3ZGYwZTFhNTM2MTUzYWZjYzgyNDBlNDg1OTA4Zjk1Zjg4NGUwMjU5N2YiLCJpYXQiOjE1ODk3NDY4NzcsIm5iZiI6MTU4OTc0Njg3NywiZXhwIjoxNjIxMjgyODc3LCJzdWIiOiI0MSIsInNjb3BlcyI6W119.ZnU0iejg26AnKEq2S0E1N76G8P1EhMaU_J1LH8slt2Klj9t6pSQiZoB-KafjJYiQbE-88D8_Re4gveZPa1_8qRPvCbBDM6Zx6Qt85gzn6hNB48MSGK-HTZOw5UuXBsbclwTSW-yuc6irrGWdSxayeIsHEpR15DIbWtfIuOJ2SjHjvTdPAURAqZdTLsdXaKwBeQUv0oQqF5cYoPib-nm-DkMoC1M1MJsLPjIor9HR-F8hSYHezR7ShJs2dSexMZHIMs-lQPRsAaGCrTq3BAke5QrnajGXkTnu0w38XMRjzpllSH1thoaC_scawUk3H_RkZ26IcP37ZAvAzRok1mwcOOukCf3u_S_IymB0PvewoaoJw_UZSxGJFv4DRNpuaOVTAHzqrbFO9U1ye0oybWL8y5r7_w4GK29qDV5Rs9Dz5rzNi9oXg5IL4XsPT11JWA-s7TK81Z87OdetdcY2GOizru95NTxm1Hgj9Ln-pYhJktseIAUZK_DLic1U8OIJcYTM7RWWZpxJddCHvT6WCttV8XK5G4LzZE2rbmUflPlnLIn3tx8mqxFZWR54NjGKQMs5Q3RBdl3UVq5sna2Q-meYxPrND47wQieHB1waDkPL9nlEWIs5wSywZFzcLmtkErdsJzND7GruLttx_oKtWtmRulwwZV9AD8W_GLfEN1q46Q0', 'member_device_unique_id', '2020-05-17 20:21:17'),
(27, 41, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiOWM5Zjg2NTA0NmU5YjJhOWVmMDc0MTQ2YTUzZjgxNWMzYWFlODBjZGUyMzdiZDhmMTM1NzBkNzkzNjUwMzVhZGUwNjNiNzNhODY2NWM5OTUiLCJpYXQiOjE1ODk3OTMzMTQsIm5iZiI6MTU4OTc5MzMxNCwiZXhwIjoxNjIxMzI5MzE0LCJzdWIiOiI0MSIsInNjb3BlcyI6W119.O2SPs3zGEcvTYkbkIbAyzzsLfE1rJZ_GmbCUsufWPBOkeVrpS-f62z30-5Za6HNUNqE6ATnkDh1vFATqbr7y0sTQ-HetC8IFPaSg5V242yHvVBxxIrCP9UsxA-iBnOr8e1Ay7GyfEOcSsRfWx4kW8J_XsjdVyu7Kzg8m9x2s5_uu4QdQySsHlMajDsPJ3dZvENBL9st4FwmVTvvmZmMarToZ6gXfh1k1rNO28ivqGmqDJqHFf2naXLFE-VwyFnFhTlKuJZ0a_ZYRsxgb3bVjM5uuKGc14uMzGGf0lQdzXEkPQ8ZSd2p2NqlnZYKJ86tTNfPRv9BeDf6ZwACdhofSMos8Cgashy-bKUfbdYcH2wHT6o6_AhAocXF_su4VmW8aJV8zLxOeczhaKEumDeaRT7YwAWhfwfwZA0Wi_PmFGQ4ywxSfUNmfnUyWH2hfXk5AhZuasytq4AZVIz9gLSNsryM0l4JpaYIyUW4cfYHiGctmFJBflywRPDjggdHxQqkOTdl6N_eM3dWVLuPy3KYpIEaE03qymg4JtDWTqnZHAR-aGHyhoBBQCMbAGxe0D5XiGNN6yFwzNxSb_7quOXHXpbgTJNHLjplX2uDYEqfJC6xjnLjV2mRq4cyfDOfZ6_uEXl-2ipqFXwSyk4OK1b0dmz4Mz5wlzV84N6wgLB5vE0o', 'member_device_unique_id', '2020-05-18 09:15:15'),
(28, 41, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiYWIyYjhmMWZlNjQzYzU3NzczZWY2ZjNmMDQ5MmQzMDg2NTcxY2RkZjNhZjJlYmE2OWQ0NDkxNmFhMzk3MDk0ZDdmN2UwMGZmZjAwYjNhNjMiLCJpYXQiOjE1ODk3OTY2NzIsIm5iZiI6MTU4OTc5NjY3MiwiZXhwIjoxNjIxMzMyNjcyLCJzdWIiOiI0MSIsInNjb3BlcyI6W119.QmaE1jcXAN-eMnL49EgJ7hGBhvwckp5fBniyvhpOOe0mm7M_0iAVxRszr38Jp3r1S6KhRyom4EmZ1iOUUHZn1OKef-8mpRHqW6CAj2ORBaYiijcpMx_QkgY29fMfPn1DMSBnxnmu89x9E69O_wvOURgJQVcGHnIvI95RaCTl7owDnTvS2yq-IIHXpjLn-K9bPK796rk2CKDxngXU7DwHvWRCrJdRw20vDp4AdJtZI7k3dhBwCjvrcLOdSMzhqTqIUy2n7CAxc7iSVZ7pq6XNtay7cVHiM3DtpvXtl72tg-6_Fq-E5Gr6Ep-N1gRj5Xs_Qki_94dsBYfYztTaj6Fpz0VAG5szsyDQiMtD2SbxNuLq75sih-CyyqKfwhHAEWZbYZmwWtDVFt3MqTHCxLF62fd_h3QySbmgWdutiU_zaCpoWG-xxGrFNSufgFoEEPD2JQa5ZSkFYvhyfJv--zhZeYmop8Dk5WdRZPEbZXdhJNhTv-ENJCGBBZts0BP2eaHgcKMv22kLLlHf7kztZMQDayovP1VbSJ0F9-ucP3c3p_N90-cmNupLw-CBog1m9G0PP_xr_-a5mlUrGg8fZI7HMFl0pKlZvfWlnOxaYondlMMtOViQ2V6kNhZ2gcHE1iCSwOV1ZFMELqHQ8ZOn2KbU6kzUjFBnT_2lYGwpiVElwIw', 'member_device_unique_id', '2020-05-18 10:11:12'),
(29, 41, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMzdkNzNjZGEwMDQyNWU0MzQyOGFmZWYwY2Y2ZDExYmU1YWUzM2Y5MGNlYjU0N2E3MTgwZThmMTUxZDA3ZDA2NTQ2MmFlYjk0NmRjMThhMmQiLCJpYXQiOjE1ODk4Njg2MTgsIm5iZiI6MTU4OTg2ODYxOCwiZXhwIjoxNjIxNDA0NjE4LCJzdWIiOiI0MSIsInNjb3BlcyI6W119.RNI7d3nwEx8-etLygl5EDeK8jMfwVipk9ujC2_Z_eYpXZxxMKjvwGI4LP6Xyh5Hxeq-f_-eXg9BDFXbleDQ01ROuMOF4MFFxSoAAxlQeGJqDzEZtdDMwIVS_-LhiXx7Whan07NXL0RbEEWeX7MGzn1_lGCTGX-DVqLJ4xNsq_GZgTDmwSpe8LPtj5_BTPbvcuEyg2L3ZU0InI6XiRIOBD9rjOCGQn9SQ-fMZ-oCW6heKWY6pAuhjUJvD-3vH9LeO6fhaQmjJfrElx_InuSuXFa3QWoyaIGjqrNmgu_gwwnGiuZBDguvUZ11UJQq-SbEJ4wTve5zO2-E8UZ3hqKHq-qHBtvMPT2NX-RQbqDWC9ZE_yX48DDB_HdUUpHIWNDiYKxRSZZYMcwZz_uXQepanYeTrQ7zdDoqMyPi_HNnMk2gLbv4ncNIHVNwYbOSxcT3QKrZVoqo0TlKR7-i-4j6_04fvTcmnJrmVYbbbKhGdM3rN8mUlGsOCUIso-Csaw9i-ptDt-ZH0zaFfUtwtq_6ZCbCgcawUuHqLfoLRZByYcjB-srJCOQdsx5k0wkgYJctzAMW4HFuyjxEKxOkfOKHIeqMH5SD1gUCDJY2mKX_zYsH_ejJ_8ICCEuyacIXegGZL0v0-RcOU3OCjBOvS1PT5wfSwF2rEwznSRLuvdGaN61k', 'member_device_unique_id', '2020-05-19 06:10:18'),
(30, 41, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMjg5ZDVkYWQ0ODAyZDNjNjJlMGQyNTJmY2E5NDc0OWUwMjgwNjFmYTViY2E1ZjhjNWQwNDRkMzc0MjY1NmFmZjcyMDNkNzFhYmZkMWIyMzAiLCJpYXQiOjE1ODk4NjkxNDksIm5iZiI6MTU4OTg2OTE0OSwiZXhwIjoxNjIxNDA1MTQ5LCJzdWIiOiI0MSIsInNjb3BlcyI6W119.JorNe4LJE34cMxd7P44yrjRNB0niwYjKh4OpQ3GSQt3GSDIcQIk-QeG7_IDmVOMA6jdLLzr7s2CLZnCIYPgQFkAGOcN7mwRwKmV5N3pvWRsgrs4UxMuRsKYXxBiLJXnK33-05xQq0p6wFGQwF_OqRCIo2ARa9JlcnDPyfxs3zILzEnVhMkZ20d8W_pqidbJUsTLrHXYYOyY69i_0Q5GvorXo60FHsrkcDKQu_eAEenWO8gi3Sn2EVupzv2e2gw7wgZs9Z42ZU9kQtX4GdcOuKsWhRgXN7MXipMZHcP1nfTIvLShm5gS-GlxSs9TVVJt7iwRlkvk4M_nTyMsyPiL305r3Ehww_apBJoJVhjNtDJOn_4m-kS_lyv8mwQaMYavSWfTt3dax65gTIQBXKILOVYRbC5F8KWdxTD7eRT0_HbTQwyNwtIbGupgsS2BMQsst4M91neF2HY6lpa4Fsdzo8SwxDNGTQUF7TOF_J29hxc8ifZz-8-wD0ripgaHPM0M1ZtmR81YqGtqGEABd2LlE0juoYhPbkbGjQRY55xAfpFAdADLGuQlD-_ggP-HVHtQTRR-eCcrpY2WIUapXbKAlXD9cWI7n-bTOyn85OxvIyoNXiIhA0YxRKjIHVOchT95rSmhEtDwmmgnHEudWcf1I71qSi_Fv61X3tJ_CVF6YeuU', 'member_device_unique_id', '2020-05-19 06:19:09'),
(31, 41, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiYmY4OGVkODIxOWZhZTE2ZTVmMDBlZTUxMDk4NGQzYmIxMzAzYzI0MjMzMzMxZWQwYTg0NDI0MmY3MGQwMjY5MzIzZDBiNWVmMzZhYTk3YjIiLCJpYXQiOjE1ODk4NzkwODIsIm5iZiI6MTU4OTg3OTA4MiwiZXhwIjoxNjIxNDE1MDgyLCJzdWIiOiI0MSIsInNjb3BlcyI6W119.VgOHCnguVNWTlKyYtR2x86oOURLyBJHYXfX0yrERAl3uluFEIdCwW8zZs-yov1hxVepmi8e04s8FkUb4zCDlfV7fuOwAwI1zh31VP3cpWvO0jHz4AltSWb-kBZVNLN-rH8xMik0bvcAgBr8n3NFnpihOeFbFEB4NrXgRTMabNTFYiKpRqsbqlLbtwyVyKT5gi0CSewKCaMLQOmK2UxR68vGJF4FvgUTJz1mvIqrhswSbz0LqZEN-xs2eKxuZ_PKUDShnkrIYTQJL1XgFmqHC0RfS-pHfX79bo-DaAVvKqg0CfwPotjR3C54tFBRrBX-vTgzhkOz3knWxXdMDrGPKnnUu_5zAvr6H5rQvN6OIOrVD1R1osGCvhBKsDqCffyjQJyUuJuSvNij_SCeJaK2c_y4JXH7XSfSxVkQEsOIiBtPg1gaJOK32Dc_F5QyeA2-iEcDVp8H9oyYeUA6qE6hQFfwY3PpwxXTGbgilv1STRJ6xEjKXWeX3HBV21qDjOr6Eg1e_W9XDagjdgvEPYmYSV4sU1MolXTfjmy3cgGqvcvvWGNt6M6fGRDhjR0lJ4vkJv_qpB2xNB-9Kj_LwePhmma0xukO_ygmLeZXr9pAjym72AolCI-q_3zl3wFqKfquD1p4KFxui6lwLUBy4h8xTwEPERs-RbwjTtpXidZqgJAY', 'member_device_unique_id', '2020-05-19 09:04:42'),
(32, 41, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiODZlMGRiNTFjMzY1OGQxMTg3ZjQyZTlkYzc4Yjg4MzY5MTZmNGE2Yjc3NjE1NDA4ZDkzNzM3NzgwMzcwNzcyMTEwZmRkZDQ3OTk5MzkzNmMiLCJpYXQiOjE1OTAwNDE0MjAsIm5iZiI6MTU5MDA0MTQyMCwiZXhwIjoxNjIxNTc3NDIwLCJzdWIiOiI0MSIsInNjb3BlcyI6W119.BOGp4xi3PkW-yIIregbxKOY_F7XjEZ4rHosuXw1CrToM2eoixCNec1Xk9ZLFO97BJQT30gEzDXYEnnhGZyOe0Iemf5QZGtre-IBQbs5RH5axWUTk28KRlaRd8tXIJde7LDe9txbUpjBbmps52rIAirXOXksac5OxRHEbeV4OgGf4miNOYQalcSyY_-MLW4Rty7Oak0z-6TmhhGTXS0YSnVmYSjXYrm8G78HfXd3dSbMQPSn_Lu-1kZUCEQC3hMhH8eQnW-S-0aMe6xstpAAFf-0kCXgQrwy2gUbx7l0PTzIh1nKj1RHGpYlWo6fbKvZod8bYsxMeS25NpnzJGDeCjzukOpz9-1wflNmshtaSFaijd1fCFLWx-F1iM1tQKRadY-Kdm922AoR4m_fJZmdevKtf_U1pk4jiZME2ASZoxVbKmSV_u2FXCHZ7u-YYMEsF39DbI2So-pL08hn5p2KjJ0OoAzLs11X9Yt3Uz_zqs0RmNvfCWTX55vaCKzB3JE2fjxJU-wfjY8enD-bR0WHtZv2q1aahdz68CKOqc6sRJaX4Y5moKiKDCX_EM29TtR-HTWd9_MVc420dqZqqlIGCNqrIvkLN92X9FUXu6YjNnh_EMOVSIl7-XOfD4FPpEtyZP1ny-x2BTJ56kTDZVkh6LQVGGyf1uYezphTXMJxKbFs', 'member_device_unique_id', '2020-05-21 06:10:20'),
(33, 41, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiYTA0YmI0MmU0ZjRkYmM5ZDk4MTM3YTRhYzE0ZDgzYmQ3ZDg1NDNjY2ZmOTE1MmYxMzVmYTJkYzM3MzkwYWZkMzQ0ZmZkZGMyN2U0ZmU4MzQiLCJpYXQiOjE1OTAwNDQ4OTAsIm5iZiI6MTU5MDA0NDg5MCwiZXhwIjoxNjIxNTgwODkwLCJzdWIiOiI0MSIsInNjb3BlcyI6W119.Ig-PNsf624_aRjGS7XM1nUunQuRfCeinItNoYjIwPPXEWGdVvCbrLwaIcjxhdnNN8i_5mq8MJzccbjEQuRVzyXq_sY8sjVJdOSbAMEoqOBSOh99w7K7BjE_wWM1ol4Ao76HmMvVWGM_t-uRVNX__2_Uud8t6NUTCJKubQd462Wwt7wuguj2y7jyU__tUMM8fBGBepIkyqpA-Xtz-GAZ9P20OXcZVd7UD9ZD8BZI_Pjn5WgXvmDANxxTiLHOwtNaINtgeoKXPyX1XexPG_Cu6yqkG6NqXqstVFQdiJKl5E6CzGc4UPfv8fO-T1lZXoekrava9ot-wWnIHvNvB1NdvLyyDY9zsJjdzyhaNpRhdD829RDiRrYuFHmLC_v_erCV8rL7yRbyUOwZATfMe_7YsNtNE7QK9mQiFO58-YRzgpT5YSwuUZVSUrMDk483hiFceZWXQRGDifm3wTthWcDNOr6VSncnX5buH2ryHB0NrfYGyND9Cgp5Eu0pVy8PDbIa6QPVDB6NSThK6UNWF9OB_FSQZsivbzGsHXb0Uty-LQxokR1cuBMcz0Vi4eM2_hH1iwUNKIrc2fc8xQmZzSaugYOMVEPADzxYardAXEyHbbY5HS1jgdcC0V2jIUgKxO3hAGTmHumd0MFIusD9sHeMwhlAeMgQ9HClB8_pGsiOzNOY', 'member_device_unique_id', '2020-05-21 07:08:10'),
(34, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZmE0YjZhMWVjYTg0NzE0YTg3ZTRlZDVjZWQ5ZDQ3NjlhYjdmMzgyM2FiYjEzNzk5YmJjY2I3Mzk0YjAzN2Y0MjU5YzNjOTZjY2UxNzllMmEiLCJpYXQiOjE1OTAwNjk2NjIsIm5iZiI6MTU5MDA2OTY2MiwiZXhwIjoxNjIxNjA1NjYyLCJzdWIiOiIyNSIsInNjb3BlcyI6W119.lBvhiDytHs8egTZj3sUp9xj1_gCqoj0BH43qGoMVwanRHC90w_vxbCI0CqeU_PrsWdH2N24D4oXRJwFj9jNqFNzNYHVX1eVUL-m5npPH3F-KtL8jPwYNUtVyTw-VnmELi1-3p9eqCPgE77UE0jX6KhGF7WJ4umEL2FteTeAqVZN8zdE_brAlIQ8y-TNFnqwlwDmjHxtYgOqyamlRFCqgEg30Ys1LUAqgb54fVvv8pzq-56yH2DhCCH-pTbGz3vRnBHi5Hje-Oh2DvUqzU6CtdTE_KQjOnkDLz0G7fp6d0RGgyZGWMJyRfC-pW4OKtxssYBc6HrI9-02T0k0_7lRsed5iwQFURlyyiH4dQ-CizgAJL7JU0QKCrIidfDGaYNepaHfkhoJURy-ySRX8QB2tEL52Mxg5cP4RAS_qPclF9OJ6476-2ncDfMNp68iP0ARKSa_B1OnU_zCmf-lfkqmdYvy8o8rma6v4qUExwcClKzGTLVKh9RBeqOj06UQ4-e5b8gFnYtnYICdKvvbm3ZDB3r0bjyUJNj97qFgBylzP7htz5_8vsMN5Fe_vgFZ2Mn9QygD33BsTu3hmKBZesurcqlJUgEF1PsVSltsiM-Vk_owExQrGYIXqz9e7pgTqVS5g8-6yjv5neF8EyW619AxvdO4kkSFxV9ef2EnnxHCnkoY', 'member_device_unique_id', '2020-05-21 14:01:02'),
(35, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZGU0ZDVhODFlMjY1ZGI1NjdiNjZmYzc3YjUzNDBjZmFmZDMyNzRmZGRmYWJjMTBhNDA0MzFjMzc4Y2VlNzgwMzk2YTk1ZGE0YjJhMDUwYzUiLCJpYXQiOjE1OTAwNzI0MDcsIm5iZiI6MTU5MDA3MjQwNywiZXhwIjoxNjIxNjA4NDA3LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.EemqNK78MmBi02WchUhQaeYzPG0dM_BiT0zEX2DeKub70sj2nIu5Fh8hYA4kTcwwPw8Vq-BD8XRxtOa-VWYF5mw9mmjYv22hRZ1UNF_arb-y7H7o0BAr2-Uc_fLAroZRCTzidtEWe-QZgHyUmYm2xmJgazxrJk3XAy_NXpVEsyRbL9Wm-W2Z8GLt5j7o5JE1LhvAyovNQY1NRwMwRPGW7dm5BDMCZ_NDjtdMViGl7K2JmKqq_2LfKQFjtXrh6-iE9lQNJKjSGDmTKxhtBhVPW6j0zFxUC4HmmAhbKcDB-al5VTAH9R6sFVt5cqQX1nbTZG3F-mljODkYLyOIcfI6kIwbYRKLvl9P0voblLR0ezc0cDsbM6bZvPOPKYl7vtTC4MB5CLJYVTAwhSAOD1Zjqs5KRUkrqN4I_vQlBahvIG9X22wPMmvqMMteuEkRQ0C8D2HA2mjAMFF2qvvshLtKkSid_zfprfWHhaAaomJnSYZcOyEPyYydD6l5quycggoCFOdOAbMpeaVE-WAycJZZvU5zviSw24SR0QII1K6aD_1KR7ROcw_xfEu2jj05wiUAqRgP90VvoJQ5c73OZoPLTRfvm3HwRJqYbNEhDKY5NQIuas08p3FtVO3fBvXkBaBibhgnq89SZIqXSEgo5gdiAfdMA9IYfR2znIYmxO8hauE', 'member_device_unique_id', '2020-05-21 14:46:48'),
(36, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiODVlZTYwOWUyYTZhNzFjOTZjYjcxYTIzOTIyY2QyNTYxYjcyZTgzYmVmMjZiODk0MjA5Y2RmYjFlYWViMTg5NThlMDA2NjQzZWZhMDY1NjEiLCJpYXQiOjE1OTAxNjYxOTUsIm5iZiI6MTU5MDE2NjE5NSwiZXhwIjoxNjIxNzAyMTk1LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.MQC0Xw3zLislHr8cWXwkADVrml4SnowoO6SUI6XPIGxCdhipENGIYhDtF90pC4gCCmkHD-Onjx_93P2jqVq7V9rMLr_fI6H0wJ-B8X9eyw_2SFLiBXZdh47Z0I_VS5iodN7qJMrfsmYbIOpbAf2jvBOpdhcyR_rHgoECJIxXBBxMZAkMHLaRfG3QvlaavWOauSI5iOV9MS5mg5iAzYkcjx1yF2HZnfBfFy0rm5bSoxRBMnbNPEPsEZhVu-eS-nTjIGib2V12uuWwB3OxUpj7Hk4ksPmoenFs-yxQApPobdzTJYfizJOwLrWDqFzoleQUqL9XVN2K8h0xupVxjYdBuROVCjzLztBYJcGuhOMV111SOfghCve_srpgxKZ3TNTPiYCFOuVeiXY-MXITjDuky_MU1aRad_3zdghnVkmM1aGTFxhCzd9h1tBIq-iGyiOvaYZG4-GHiObJ-5SwX4NuNCsYfTUsC-IaVmGyRvNsrLOXBYGgyhUatmOwN5F4HwajMnCUD87qT5r8Z538fnuuXCPK8GSIJZVr_eWPuxbXO3n6gga9faTAwpTa7bW2_9m39X6gguxCvF4-FgZA0uMzKMzQh3pcatjxseOtxVy3omVZAsN_hMRSDHF-aH67ju8OjrbtJP2n5hWEzgT1eSEuSDt-JBD7B4IP4t9UfJuVS1o', 'member_device_unique_id', '2020-05-22 16:49:55'),
(37, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMjc1MTc5MjU0MGZlNmVjMmIxNGJlYzczYWQxZTUyZGQ0YjRmZjg1YzM5MTgyNjk5YjE0YWYxNGNiNGE2NThmZTNkYmZlM2JjZTM4MzRiMzYiLCJpYXQiOjE1OTA5MDI5OTcsIm5iZiI6MTU5MDkwMjk5NywiZXhwIjoxNjIyNDM4OTk3LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.KbYigA97eEuTq7hHUjm6ApNXWVSJkUMXsVW5KRmJul8cZxWBotrwb90Fizhh-89Of9tqbj-zHh67NkNSV8F1oaUHVLDcAXOQq-1aDmy3P720ThEUubFNU7rWdj86WP_fWb_OSULrBwJmu_TaD3Q4qFeHVqc8mHTGV-AfO-oRvUmeebOHUwUAFwsVje9xx090N-RDBD6RP4yrFfZQXLo23ccy6W3jhvfaPHDOvtPECTd3fxEh3fdWREKNvW04TJBFHIQhzu1EHWBbI7mOPD2kRh5k3MGuXz2VMdHjLG30IczR49jVYoM2HZoJBLPMvcdU1pdqJQEZbACvFKZd3McuH9jOPmZb34qC0mZKeT7jdrgwqXZYC6cdQJwhM4n6id6CoQ5UATy9P7m7UkCzcsknQiYRIEgiFa2r_yXEjnu5iUzDxBT3V47_KYmq9o6o_FCgRGrRT8dI978022GumO2O1LZrStGEZiau6XH7KWn5rLOh_T2cnEP2SdvTiIIh04CHzmGsW5p2Sfoarhf1Zn9igrIIAODDC52NxM36psb8SBDokqolSiZ6mfk6LJHUnJWTzQdnBUpdro9fx04b4RYv5hFv9p-AuuihwpBM0s3oGZ3iHSyj__Ds7BSZX9jXb0ePZY91hvS5fuYDhhsKLi7BmbqxSNWQ7jz2gnCD-cvQyKY', 'member_device_unique_id', '2020-05-31 05:29:57'),
(38, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNGY5MmIxMTE5NDgzZDViNmVmOGViZTRiMTExZDYwODNhMjI4ZjA3MmJlMTBlMzhiNDg4NjM4MzczMzc2ZmY0YTJkMWIzMDZlYmQyZTAwYmUiLCJpYXQiOjE1OTEwMTkyNDEsIm5iZiI6MTU5MTAxOTI0MSwiZXhwIjoxNjIyNTU1MjQxLCJzdWIiOiIyNSIsInNjb3BlcyI6W119.UAqXNHRxxcah3Xdos1s_fEfAVyya73TwaJ59GTZpI2eVVsHp1GJcHJsB4pg08iA5Ko8ovGXWSYsG6YfnsYFDrYcPrzRJYnpl1-GxWOaolQudhM6RUl3_NWR0R_lSDV6uJ6NY2pjYiukVomzdzgBmzypqztHYOn9etDCknIePr_D0rk-_MovwIy_99O-aoHbTHy4CLJixc2gQ1k57cI7q5nGTHXwuvj-BDAr4-JAmhPwe0S1hdtXcFj3GaoMZmLg9O14QeIEIBOziCDBYnWoSc-0cjsWpJmIcZA8QafpM0fgpkRVyZJTZ-PHiWv14O4NKD-jc7kVQ_oxRKBPwwAGV-bq7PDVMmfdUH0f-92CI9yeO2afpLPwQHRwyDVX8opMyX1Ccq3e0Yyq7d1j2FXxJ98-dqEBNPSQKXcmyVCTuafL88qiTY0t4sNJfVpFsEPIAW21E56MY-gE4ra1S4CvMJKdkM8M-KRuQJzX7aRZrHGKVrRNuelm1Xpt0dafgQFWjQ_WzsFKQ8F3If9DSJrrCGAn88bHcbEposynQTmf08Qqv6q2IZdOAKEfCKrwQoPs57TH_IxG8e8A8H5RonNKFkPnMgfbcY4i3RnFsx9_6fIegI6oJPy7sO_c7sFfj3XpnbXzsSy2AU6VdjKgficUHR045r2oa8e_vIbMi16qib-M', 'member_device_unique_id', '2020-06-01 13:47:21'),
(39, 41, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNmMwM2YyNzA0YTc3Y2VhNGFlN2U1OTY1NTVjZmQzZTc5ODhmNjI2NGYwNGNjMGUzOTg3NGFlYTFmYWQ5YmQ5Mzg2NTA2NGRlYmNiNGRlYmEiLCJpYXQiOjE1OTEwMTk0MjIsIm5iZiI6MTU5MTAxOTQyMiwiZXhwIjoxNjIyNTU1NDIyLCJzdWIiOiI0MSIsInNjb3BlcyI6W119.e-HqVh_4-Ezvheb6_fIMHcJo8e2ifNLKo-zQhXJUWNzGsYsrD0Cq7TyZo_YpXBh-Kan8YPxxIdJkJ4-SD30M-wggVIGLcyNGpkoQ8LtkQXPGe7-lkW1gsdoTxLoja34ZcpOOuOlHUQdl4BtTwDyw6goK6uZi-Hh5tJ6xkNUBLXuMetcJtKn6JIWmY3ieO2EVMTS59BaAG96QB2nv97UzFAN64KGXY_xzlTuakYmKoz_MPn6IiEW08kg-wM0OXTdxNRmRc0ce1BT4d1ElZ9MarGYEgtpQPGB3X4x27yBiqtQhCfbjqAxiyBJNGyhCcwjOavh283P7AWV_mmW4ZhQn69DtqoFJ6hK4k4l2w5yqMFNZ_jKOlE5Hz7bw231Na8WgWVrid5IQK-8BriR38Gvtbw26SwHLIg0aDWbEQt3nEsilpVAaAOkupNCZocbr8VeNUmxz4OOVU63a0Ot2oowKsbsCK--B1dCuw6AqXHPoKfQu8M-hoAbcIQURV3RcQEFkPvfsXg_qUF8JDE7xVlQaNoj8Tv-tOr241Ke34c9E4bGPzxHMAm1nusmxjl2Al0aKG_gX4Ba6KgFLWurE8pPS4vXxgs6iLovpBnBjNVQpqoXax4_5Z2TLPH9UEaICXOCKwVDD3XsTaxz07Bop56JWCVcJnGyJUo59j0sSWemRqBM', 'member_device_unique_id', '2020-06-01 13:50:22'),
(40, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZGEzOTM1NGYyZDE1MGJiNDljN2M3MjRkZDA0YjgyM2FlZmEyODkwZWUzMGJlMjUyNGIyZjczNzk1MjgwMmUzYjY5NjkzYmM2OWFiZTMwNTgiLCJpYXQiOjE1OTExNjY2ODksIm5iZiI6MTU5MTE2NjY4OSwiZXhwIjoxNjIyNzAyNjg5LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.C8dYJQ7tx8QiQNeJWgbHTVc7ng8HfEU5gvmKX2sVlYFeOOTpEfJFuDbk74PPALi13cRo4B7rLheoyKbXwdoVMpYlX-jn_2afW0tj5dCN8zUPxZUbpPaIBBgV6JqfgPrNgxB0uhPNFr2FByJs5uriKM2-up6Kv0O33lLRwm0X1IEclEnZBpZ2BVlGSQ3SuuI1zFkOUiMyla5w0clbtZSJCyf8_LSqFuREkMpDPU_UZtHt6NFpvv22bxbAvE_YVSFPhwG_OaDGCiTyVGDxQ5lR1DM7J08jddHhW38RDj9NQ1HhuTlwL1lpsYVFmUIAt_ntGZ4sRdMrBMfUs66Go2effKE6ZHTYz2yETCU_dc_5khU9JkWLZv89ybOpoETygCY9kqw9AZoYwFQW9gPZIPh4Y4gdZ6Og4453ibiYviGoxU5fhX3HIM5ClbXvOf9uTI92slhIkbB6kddhvKd21GRUpLuxsOGrz-DyovQppOM7dxJVhVZ1x1trrFcmrbQffYjK7CdnY4qryppCpOJ-kqsqo_2oTjjN78lTpYgVxEyKXnzlfkBXxFkonnWTir7zBOSJjA2mJal549IMQ3Wup02PcHV4GmLoXpyoD-za7ijjpZyo-jfhpUMfO0ugya2XrRf6wR2RyeNBFsPRl4w5N4yB2RJu47kBcp2ibvdTPAAyW34', 'member_device_unique_id', '2020-06-03 06:44:49'),
(41, 41, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMWIwYzE3MjA2YjVkM2ZhYjliNTNhZjViZjM0M2U0MDZiMDEzOTkwNThkODljYTZiNmE0MWFhMzYwYjQzZDlkMTA5ZTczNDdmMmI5NDJkNTgiLCJpYXQiOjE1OTExNjcxMTIsIm5iZiI6MTU5MTE2NzExMiwiZXhwIjoxNjIyNzAzMTEyLCJzdWIiOiI0MSIsInNjb3BlcyI6W119.SlDfS0ZQmV-aDk4dLYs_aJHHg7z82ZYLn_SaOTpxZLcjXL-jnXdSJICfjS111GHwhB6CqTn3ZXktBr1lVKVvehwdBGNELG9c8x3ieajyVXjNFoJHbbuxFQBObL7RggZ8w1TK_NEE7EHCYug_0VrPQmf_6rq3h8xUgzmxL-xNOWVemBFYWmZSqcfERPf5z5V1wrbJTUOZcK7nxb_F0M947AF-7yzIRQImlfrElsChWJjf1dsDIiqjzADCsesWuSR5rbUa1tVnTnjuDIIgd4SoPzyqnZrA03lORVVt3m1-cP96JuzB_ECsTq2VlNUbm2VJiiuZcxr8YZnnkzfa0CZQlLLTapAlf5CImZk92mmgIQEZwJbvkI-wf9IZVW52IghtxIJsFFgnDqYy8EXF6rF_9_ncLXetJkeAgZkoZRli0YI8uOPZ_8Lgm9wkdEr-LxcO1ruFg9t9kcYuBdBv2Qjk2cnuGJCArYc-SiFITODFHQoUY4MftbH5oEz5H1EJflfktA9EOSyeYmrX9TSPmMZq4Wlariz6tIheT31RKD2_iL3-GYeAc4xxPHhKo_tNTzYhQSceJUjSn5-3l6M2j3T_TdfUvJEBlP_Fsqgc8Ut0U2PHpo9UCXQ_oo0i_JHzSS54rfn6Y8akZ42mlbJTNN6EuAlj_VI_oCRIHP_fGLpTNbM', 'member_device_unique_id', '2020-06-03 06:51:52'),
(42, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMTcxMTgyM2M5MDU2ZDI4NjkxZWM2ODJlMjVhYmIwOTRmMzhlMmNkZmU1OTE5YTQyNzAzNTA5MmIzNDU0OTA5NGI4ODY4ODE3OWZiZGUzZjAiLCJpYXQiOjE1OTExNjcxOTIsIm5iZiI6MTU5MTE2NzE5MiwiZXhwIjoxNjIyNzAzMTkyLCJzdWIiOiIyNSIsInNjb3BlcyI6W119.M53lqzPbN3xfce2QqveqKRrd7umFBS_1SGTVtm2NzyFBcrQxqG6Wc16KOIKzZNrYhKIlaE7evt3N9rHhudnoYupzNIBYgYfFbZdMcy3c0isM8joI5p50vX2H0nnHx0ZOmN4an6dPSPsLJpAPAAF_m5LB5IyyJvQRJi_wOhf7xfP2lV1ftN5HEG9_Iwky_A0BTvv7CNHmj6IOjuKTFNmc31gbL8dGe7zMZm8ChI-eyRqQsHD0FFRXaw17xXlYTFh0e87KV14K7Mi4Odovvst5il3C7XXx-Uz1wOOVAFAebTiFcoYv2vO9ouHOwrSk7PIQC7jEU-qPXD31948MdXoOGqAzg2BybZ8_W_B0lB6Gf7pWkwPOWwl8XQcGZJDtxjCHb9ygYFRZIep_d0AFztNkfux8ZxeNZhSSvNgfN2Rq5Gr-rdh26TyrLLMDrfPlke4siDG9C62Xy03vnjBqZiqSU0B-xvdAkmEdLLQgzv8_NWiT5crEmuvpoQXhRNydIUuLQCz80VOiOX0ef5MA8UmXAd-a3v44qYhhFNjb1PkgSCMBsxO__WIAlWqjYR2T2nR4ykpu7q5fHXT_amaBSMs8W8on5FzyU2mO55a-2GOdBWxNOgxONMRds8aX2hu5KrIWskwtt4FLAGprEzS0AtJ6FdfPfdPPs_YjbN8ICI9esD0', 'member_device_unique_id', '2020-06-03 06:53:12'),
(43, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNTRjNzFiNWI3NzIwZWQxZTZiY2U2YTA5YzYyZDUzMmM5MDIyZTViNWQ0YTUyYThmZTQ2Y2Y2YmY1MTIyNzUzZDFlY2JmYWFhYWIwYjA5NGIiLCJpYXQiOjE1OTExNzM4MDUsIm5iZiI6MTU5MTE3MzgwNSwiZXhwIjoxNjIyNzA5ODA1LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.kaVq0BjNnCFa1nIZUPt1tcvI5b-jgYXls8_4v8Zb68h-pz1_mkD5JtPFmLhOr3xBncb8xQRc7PoxlP1dXHP-NYmUOldspNMZeAdHPSm5c_e1YrI6tFvvrJNnxKVrDjSlb8s95gqaq27fsONhWp59nVcYFqf_3tbG3NFZfVKtFLVDlnxDD-StpKxXNJdDEgd0VUOCmoYES474H7gNPg2PQZhc-_QqMg5-upL5FV-aOof-fXJlHZaCaygLiXaLFLW5R3YkKiJ4aQuk3o20SpnwSnNaI6DZzh6fz_SbvXo3rYFEmZ6hVR4viK8VoWHiqoj-vsle1KggsAlngCYH0EJfWpyii9Rg-HceTPe3s9KNwXmcWH7gL36UuErr-2RqFSs7nB6n66R1L1z6NwhA-WwfAlwoAjoUfaxZCVkY4JaTfNxr2Qb4ypp4hOfaQ14iL5DLFfWpzW-VZX-KuwVkxk1jFvWeM_oVLMOX_qg4VbC9C2OL8DWd6RABTDg3PsCPbhoBfu6DGKYW4f5N_b5iiQoFSkvo59sDEPmeGMQ4e2ZAp_-Sgqa-a0WHbf5uZ6XsCVX5C-TBEsEgVv0o9Z4bMFFTs91k8zni5bKiF5hP4eV5rQqLBXdRyf-WovhSCY_VRxk-Nar48AGeZ_uQwCDrhiOcZykcOUJ_vu1_8Z1QOqwTrOM', 'member_device_unique_id', '2020-06-03 08:43:25'),
(44, 41, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMmEzM2FiNTFjYTQ1NTIzYjIyNjZkOTYwZDFhZGU5MDk2Y2ExMDUxMmMwNjAyOTkyZWYwMzJiYjAyYmYyYzQwODJhZjQzNDUzODYxY2UyM2MiLCJpYXQiOjE1OTExNzkwMTksIm5iZiI6MTU5MTE3OTAxOSwiZXhwIjoxNjIyNzE1MDE5LCJzdWIiOiI0MSIsInNjb3BlcyI6W119.IjHAEgVT-82X3mZ467avjiQ5KpIA1C2aPawfFOq-EYvDTvCBeXxaBh87WsBOKpE8Yn6-qbrin_pqXVuZPDT_7ICCbgAzxPshggdns5I__k1SYwzKF6Td62u66ESkqnFkzVIEg_fQ-ilLUhUDMwuX1qDKrTXmLTQ40WSqzF3seDwDSv_hSRSeKCwpwz-8C630ovvrZCb2-UryP-DKr3TdGUfbm3zWCAAccgMo8CMOxZ_upP8RDMzR2uKypdG6aRHtYW92qoT9ioBS-E8gID185FxRtrigTVohZ4KfzDcQkeGBf73ex9b995KA-t3z5dbKj8_5QpzkJtaayjnSFKBr6_kR6PoDEH285ecaCxw0ttWXQm6MQKyAjS7pSGlhUO6oAIQlA5UdNY3npsp1PBFOn8DIaacl1tvMXG5iDm6_Yjlj4eoJT3YSdoqYxDQO7VyU_nadWR_NBukVJLO3TaxGdDpfvvGT-xiySr7O6WV1zIEslshiQZN_cFvaFWokrPT2SGKQbhgxEXHFkCd_h0OJ6-0UNghYgEG8V3LtT89AExVRrSYgDiyyQbdhLBZFWr4sJXPoNV-dt9l9QPTvmhPpKDs-E6T-6_dDoveOPb1eHK-lrth_SMm7S58ZMnPmcNa5OTGmlbxT3SiuprQgKs4SijA6E19FBwlZWkESppe4u_w', 'member_device_unique_id', '2020-06-03 10:10:19'),
(45, 41, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMGNjYWQ4ZjBlOTBhMDg0ZDg4Mjk0YWQxZWQ1NzdlZGM3MTIyNmRlMjZkMDBmYjA1NmVhYmQ3OGFkZGZiNTg1YTNlNTY4MjA3OTRmY2FjZDMiLCJpYXQiOjE1OTExNzkzODksIm5iZiI6MTU5MTE3OTM4OSwiZXhwIjoxNjIyNzE1Mzg5LCJzdWIiOiI0MSIsInNjb3BlcyI6W119.aLSL_lRtqhVplcrt3OfmkpKJMSWlzduEkBzmnUOVaYZWBoDcha6xwCK7rqUmsY2nBV5spsfyW4Fe6ooNSWaIJ2rj0QEv2Hnhs7lHvy9pKFfLKmYocLJOjFlGphURQCpOJ5T3a_08Lirull9ULPbxSvcpnwOwM9n4aigrP_ayJm-I4fvjVi4nAtvcjECMzI_YLbSRSg2mrd6rc1cZFUlXGWOL1OOTMLvPXXWLOeAaHVgWNojTB7EXNccu1H1ljkVVRf86W6vmNrMZbmfRagfAp0JTQPBkSnzYTiQHeczzhosMvVMhQU3pI89tKjT3NnJAAYaa3bscnZ_9tBTxfG_1hYxVwJIYoDAjSjOAMY3mqJsPN7Gyd-FWCdrLfaE3Iu0q9YF53s3KlqnsRY0dCy0pxnMl49SiKnBxlTOO-EZ4qLzn2w6YXgA70HDoNu4Ho9t6pJ_pgZbjNqrZzbVHv6taKQjrk2nj3NQdJn4QYWJTHuXzVyKf4PWCoyvM47qWMtLSapNDyuCaGuxhRI0aR3S0WW_V9P0DkUEVVu-jUnu-vFgTZ-VU1VkUKSrahwOlyWJ49lJDGqeYvcpqphg9qAHxqxgw2SsPXZ9uiPbZAWyqHvrEbhQssSiO36gCNofStHnd4q0CE-JlcEWxQqtPohkXJSWj34jrFDULPQCVaRctreY', 'member_device_unique_id', '2020-06-03 10:16:29'),
(46, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMGY2YjBiNWRmZWFhNWY3NDg3MGU0NGVjNGI5MTAxN2IzYmMxNjg0MGQzNjAwYjlkZjc2ZGFiMzk3MDNmZjczNDVlYTE1ZWYyZDEwMWI2YWIiLCJpYXQiOjE1OTExODA2MDcsIm5iZiI6MTU5MTE4MDYwNywiZXhwIjoxNjIyNzE2NjA3LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.epoFNehRQCHzT4dmp9LhUk8Me7OeYw_Ssgt2n9h8ZN_EvwgZaolfVkqG_NO_J8SmZY4riX8kZcbWUiRo60T-RIJhEUm9aDkCSl_6A8Zyfj08CA2BRvb_abywwYJ2dazR1rQOzq6haazncyDLToUz5I4Lvyw-BzHDMkFd3KU8nC5EjL2M4AQLJa4oMOmCgcw0pFIUU7WsYVgp6UdSAaG1l60UHlTC23SxeINPfrf2Mp15x3w4DYJ6HuFiWCkJmz1zkiWLTM_918fLzCNOBHPPuaUW8G32gRmGe08pYAjNIkwnSuLq3LB2PlpPFvngnfomth0xH7LZAzLk4YVS5aH0PEBDfjc2ON4tQUUzRWcCwN8q_FyGg-6SN46na0_IzKqD53RyUg5lJpAAzPti406ph2Za8gaswINZkzO1jO9FM36z7ZAhwrVP0ueLZpCosD8qovw4VeJY1XtWTHi5Xzb5bqxpM4WaQZuUeEDWeIc4Ao2D1CaW7AaY-uGi6Ix8LxzTJ1kMSSpsa0nrsDk5FSFcYQkh0w5AC8j4Fx6mgHJc_2ui9MqKmC_aEp7IvdjOJedIygjcY3Z59E-Au75K2rYFiFBWHDyZiXrz_EG3FH__Pa37bhjfDh9RtK8-EdUuly_6lnKI3Rp_Tmuti3etEvoqvxx4uG_OWZIEEIZAtnr0fFI', 'member_device_unique_id', '2020-06-03 10:36:47'),
(47, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMWFiMzUzODhjNzJiYzM5MzE4YjYzZTkyMzk4NWU1NjBkYjQ1YWNmYjgzNjM2OWNmYTU3M2FjOTVhNDQ4ZTkzZWVhNzMzMTE1NzM1NmQ2MzIiLCJpYXQiOjE1OTExODE5NjUsIm5iZiI6MTU5MTE4MTk2NSwiZXhwIjoxNjIyNzE3OTY1LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.NK7uIX88h2SHCBHpvMnFf70UxqYoeGEm5ZTvi3QidEvhnTB8mfy2-7afY_pNmDDGqQ9h7XjcZf1o_4eURtyAcJHBIK43FjVecVY4BK_ygV6ShCkKhyASHiAwCbLSfcor_JWsR6Kbstw-Ms4EDy4UdVNKVPd-zNjGwAzwUuxYNMFaX6PPyuRjYCmWYubxcjtsS196x-4V9I9bKkX6wDBrDDE9wCYqsjRO7DINd4zpsHnBGSbLVcFQ6iFf5iV1fELPb5R7T6IjZkSCSqMjdoyMoStFgpSZJJwZHQh2hyveYDKV3mrz9qpi29djRtPCo3Q9NePJMkbMAfPN82shmbI8M2rsI1H-I6oZq-3j6yAVyeGZNjLVGyIDKhA54B-yeaTChLKRZojfBNJofp9seyne6BFogM90YmmPvQRAX5cOUDKp6bCM82nVs7eiDD5nZ58TDSYH-Y_6iqb_tyOAy2auHen4TqlvT33b9-Md9ipIJuQUSDUBTwbg-gcxET0ib7Aw-QWMOZxZXlRSDXQBKSeD1EHjT2dICazkE2Q2R_2dHn1V6w9lrN_wPXh2bqZ1dDy_2j7lch_hur2MemofC8uMSqPwS5xumAARLlQkmV8Znlf7HzQzES_jJIJmlgSKGSxRb562fVoWA1bNL-ZG5Xi717MDHBXuE2RyUE8B8fHQ4Sg', 'member_device_unique_id', '2020-06-03 10:59:25'),
(48, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZWQ1ZTA4MTViZGVkNTI2MTQxMjBkYzdiZTVhNzViNWQ2YmZjN2U5ZTFlOWY5YmMxOTA1ZjMzMGJmMDVkNTZiYTVkODFjZDM3ODE5NDUwNGEiLCJpYXQiOjE1OTEyNTE4MzYsIm5iZiI6MTU5MTI1MTgzNiwiZXhwIjoxNjIyNzg3ODM2LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.AZG3HD1wX-ihnOhO3lzS49JCm80ZASmeqyUpYgnSGNE9NG-NWHTv98cLkH3Getzn6tiZuun-TB1VaNdZ3x_ksbERiQbP9jm0CaMtQ_SkLRrxCn_QSE0IWhPLSegyJFFs2C--HQizSR1qmeyLrmVSkNhbANMB_HXMxKasatNVMDwD519j5Djgn6M24NnI9Iwt2MwXmviJvOZyr0pKXgPItPqV4ItE46c4pAsuTtbGq2xrVEzLtHBYcar2HPlBRQiifEuc41aIUBdeCMkFyQyNEyBZCNpPIbJRf8rPm81mAl395JPEO1z3ENMkA-uWm1ZT76D_fbiLsqlJz-RFOYx5QrzsAOUen5KVoGrhLHuhU1s9_IrrBRoNTC0mB-NUo6QJ8i367ctq3tQaQo8_t4kVhaLQgWJcD0X9B-KN8tcDrjk7WcJrVKSme62pcLzwcXAVIXqIL1ip57n-3Y5Oi57BKiIWnp8ORmgvieYwAZ28ArXK7STFRs3NgUtBork2qoymD6ITYOy6SKOLn6-Jbw6VQBdtnC4pUWDzOlVW0RrpOKDnZHk6H7INSUTuGowTFOxlF9v5_epeGEEWNW6kRmb7B4bflVQcxIfUQE8mlydofncf4msItwzm-vz1xo2p9gZTJTK_k38d2dGGaqi3Y4TKW58XboKfMfYFYERytQ4yRNQ', 'member_device_unique_id', '2020-06-04 06:23:56'),
(49, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiOTdjNTAyYTVhMTQ4NDJkYjYwZGYwZjEzZDI1YWVlNzcwMWQ2NGFlMDQ3MjRiOTg1ZmRkNmRkOTIwMzgxYWU0ZGZlNTNlNTRiYTMyODAwZDAiLCJpYXQiOjE1OTEyNTE5NjMsIm5iZiI6MTU5MTI1MTk2MywiZXhwIjoxNjIyNzg3OTYzLCJzdWIiOiIyNSIsInNjb3BlcyI6W119.K-Gr16GIMzYvwVWDX-6xxc5RIr2FLY1XBYsY-0HQItCIhTlC-J-3mwQc1d-CSh6FoKdyF0w9DRCY2U4uVyf4Xs-8c0vbCJ0ktQuAn4QqNVBpcllrmoK3Hl0jbMwUOc1JHeduxgm4TngCRc0C46XuatHJNdIY7VF4H6MbacL53BHX2P4P0rrpCBKCxAxVsR9p9uSVbSBi2wrwP6pvYcuUPkazo8YLW5rAR_3VAl4Hv06R-goro_7AnTvvsk4sgArJfZTMxdf-5v20Ko-gl7vR1f2Fxeo1gqpUNdz0RX-WSnD6Q0Tgklgowalx7LFoTvn3JlCpk5lA1tdwrKAJSe1CL1JUcwLFxKfDwDdtkbOOJsybpo-o4dmEPmRwBi5VZZL684qbPi0qQdVIObXdHmhN4c-lfk3SW92bE1LpLPUAodsS0tZ-INg_3ErtXn01u3P57agLvTv_qxt-rBcG8S_Lln8OOgQGyqpZXVyccBcWj0SC3Xb-lwc_DWpx1XmALN9Sa9U2K4tTTdLhZWA9N64jNVt5Lm2yS2_CiMls74U6HZxwHE2Pdsx89akt3rNOnV8OWwsR10eaOvX9bpoe8a3aGwePcRBbMI6k_qR708zsmiK_18HhG1JNiu4S23MhfA8TXNDmcjeA7_ZNjA7DJ8ZKIDxTG398pmhoLwQqdo5Im8o', 'member_device_unique_id', '2020-06-04 06:26:03'),
(50, 41, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNWQ3ZTYyMWIzYjcxOTE3YWQ3Y2FiZWQxNmMzMWYxYzZjY2U5MDdiODNlNTA3NmMxNDYzNWVmOGU3MjAzNjc5ZWEyNzIyZWM2MDI3MDlmZDQiLCJpYXQiOjE1OTEyNTIwMDAsIm5iZiI6MTU5MTI1MjAwMCwiZXhwIjoxNjIyNzg4MDAwLCJzdWIiOiI0MSIsInNjb3BlcyI6W119.cOjqrvS3qpziIc5M8EmNbjhx12qzMKRJeVjxlrEws9M3bBaZ7A9TF_bD70xM-O5TDZc4KOSY7X8bfoCxolxJIGXLb1J5kWI01Pgtb4IHZ2WkM9bZHPDJc50zM_rQF5vB__WYlcaUMrg_Y6u7Wm-IzyswRJG6kJT7oWABXpHxjkfzNwoz24ljHXvW4uuR8p_P6hciQVH-BJQrrz-4DUU9jMZs-yTfvkUiyD5TQAC_e4d5RmRBtkzSclrCErUphXWCNdVuCrtddi2XHIjD3HQs5AZxYXA540qjuz-_ur1vsgxnHUo9EdvEtUdXJC2hoYPCFzf58rvE7fOgBic4uWjYPIyuOpFgEXyuW0uCxJ0cjLfGpdoiop8pBmH724XbZzC4NlsFvbeGbdPvfkWx1yQv6C4sR9bLxlE2dUdRUfnvyAxPYOlSH5h3qr8abg2ntNbHbcdrEiOeH-qUChZahMzY51awHlX1xfTEwawy4J_Gb35vFiQGtHPs-QdEVe6MIyzKNbThgcPAfITA18GB4WnJnI_coqdLOEqbSl5QlXUn6UvDKnC51TfXzwBWvHrtdUs9RmXaP3eWoULUGUV6-3nt_Yd6_NgaIPKG58bDrJk8Izl3JGaMmhlIIpsrh-bunCl400Tqel4LZ1REOuAZr2RUhWXQFTxinHXrGSVanyyOLWk', 'member_device_unique_id', '2020-06-04 06:26:40'),
(51, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiOGEzZjgzNjljNTRjNGI2NjY5ZjRmYjZiODljMDQ0NWJiMjBkNDJkYTViYjYyMzQ3ODU4MDhiMWE2MjAxMGY3NGQzMDRmNjMyNjEyMWUwYzAiLCJpYXQiOjE1OTEyNTQxNjIsIm5iZiI6MTU5MTI1NDE2MiwiZXhwIjoxNjIyNzkwMTYyLCJzdWIiOiIyNSIsInNjb3BlcyI6W119.Am8Iq1SuktbPQFOtq8z7xZKfv7UXWCXgiw1nF3qE1ui4R76T5h0YC09H2ipXYJM6WQ3jKDTA4TQZnbXeGBN3Ekb8YUch3KJsx2wxeU4BXZTDvASUOqs-NDiv_9irlvicoTE8GQCGGEiw2dkCe0mBhpSQ0ExrzjoB3bJ2CLOj9ntjsiCW-GWqNdqcuSByc-tEFADMFce2s4QsALASV8JEWAxXEVoEdz1cchw61_mO-QElNBRp2PSdtSeOyekytkZswmHvFyYalPnUA0vFtbXuFQVIpy8zSmMBWT2FWOpTOP3YedddVj3jvHSJuUX7warHkF_IkNzv2gx4y4ttv33i6EZ9vVEoK3PeuFCq99Whr2yjGEY9WacLFseE2MV2y51Rkl3NXD6YhYU9RvOz2aDa1lh4qWmpF00-eTW4kHCYtIYyc6CXrzhq66OQJHBYRyUQIflyRuxemW3SwJu0khokl4CE1BvW1fCXw9Vnd1t9wtCdNCFzvk3_xFhbvfg5c67T_PXatTHxZxc39g8rdxc0WS2aEvFn9gfbg9xpRooznHOwKcAvv3cCmHsMrvwIsplkvCtsFQaB9jitEuLdo4vefNvswR_kbaRDUL1qc0n2ZDwQ442cLSixqaLR1ND1r6111vSqQQ5qxsjKpCXlIVkfNAj8Fd611TfrG6FyQTzWwWs', 'member_device_unique_id', '2020-06-04 07:02:42'),
(52, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNWQzYWMzNmM5MWZiNzFmZDQ0MDQwNmI1ODA3MjM2MDU4OTBhMDA2NTdmZTVkZjgzYjQ1YzRlYTg1M2FiNzUzYjEzZDNiN2IzODhiMGFlMDgiLCJpYXQiOjE1OTEyNTQzNDEsIm5iZiI6MTU5MTI1NDM0MSwiZXhwIjoxNjIyNzkwMzQxLCJzdWIiOiIyNSIsInNjb3BlcyI6W119.KjdueHzlzKfYGODa6Voqee2HeZTi1swV89Uky7cPgJw3pAssBbpPia_s9HVVlZdD2qD9Hp1TiG0mvu8HCZZqZUySWrEXjYKaH10TPs_0CFYlkWStXQWx3Ja6i2bTjNMsecoRKccYWO5vo7ngaPWvCX2qwUtVom9AI94JiQhujha1PZbjh_VWJv3M1dZHLM3_2tAyV-RtjsAa7pBWSurotfe5rg4q2RRmEnCA1JdKEhEKn512F3wg4YCxc7Az5iU7kcB8PkkpW4Q-q12JMm4QNyfunBOsz1D6MgWx1J_PPA277QRVycKoyqWn-w3iqacBxK-2P7MafewkLSou0tCyD3-XNNTf7fVXyFv4E3YR6_kGXQKtfafUrhxSL25avRsB8moVQojA2XtdvQpfFkmLSsEfLNkxdhvN5kD3o6OILBXsebmsOP6jpZ3wl_aToHUuU9uXlT2V5XztkkvGvOMUsL-dAOf1miQ2G0ktYU1ZOczFE4VSmMiUKUrjBJas_0KQRWxxupJfLKdBwifHFyKzFY5j3ti3FqDvdo8hr0uhLzmqv8h2f_HdYju71ND0peD3SdyJruGyMXfD8XhSC-xTHDFoIDEjW3BjalkhfnyjCqmW8VvbZO5fzJbvoWcELG7CHy8BarAaNAl9aqEZwjNFH6Ef_SYlp9ZfY95pJ7MesYI', 'member_device_unique_id', '2020-06-04 07:05:41');
INSERT INTO `member_devices` (`id`, `ref_member_device_membership_id`, `member_device_os_type`, `member_device_token_id`, `member_device_unique_id`, `member_device_storing_datetime`) VALUES
(53, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNDRmOTAxYmYzNjFmOGY1YjU1ZGU4NTk0Nzg4ZDJjYzNhY2Y2NjY4MTRmY2IyNjU1NzRmM2NjZmUwODcyZmY1M2QzODZhMDdkYjMyMDg5OGYiLCJpYXQiOjE1OTEyNTQzNDQsIm5iZiI6MTU5MTI1NDM0NCwiZXhwIjoxNjIyNzkwMzQ0LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.ekzqZNCzW5En7jBf5-k6wDfnlFPQjjSze2MVgU0gmGC9ZX59DyazOtvsK4vjBk-2z7s8Ara-EGokWzuyuZJaUPODf9_Wwue2sOhLEaKMFlHoTDk_35q8QY_w-UVbxP5bAMEwg2tzKuncLM6S0JaT6pQZHMalEdLwcLvIKYEeEqaid5mTCMTgWyxkTMQ1_5BANDeNpaJOgPyXxQXoKznxO0uzwbNZTwciWeOy38UHTPBPrtZR2QF29uZFAlk6kgBf61OaMI4OBmI7TzeP9jPjY3f4jfRGqEXindugIezhGXiNmKH8K31lMgsQU4pWf1HjZrPAbw3F5ERCvC0irwNfqa1KnWpPgVcQxI08hm5GkvWTw_-Hijg-ZK5QTRQyRT9ZUeHQyKJ7zaXR3BcOXQJs0a-BZt7LWfJOSTHKcW-V9vIU5aFvKolrJYSBNoAQqug1ltEano7sVejsE27ZT0NsxFjbRANLZfEOKcg7zT0Wji9B5-Qkg8kVGcWxZs_vzz-Q9a6el4YT6hUvXoJGXZUZ7aH6HxfzUmge8mVUrEb__kRde5XskmY_vJzJlRN7liaCiQcoCJXpjYfLlBzDqJ56S_hmgJkWJjH3HQN_MiCgAmwsvFKoUviF_QcQ_LryAUfKpPMqXul3GDlcV5ben1NX5ExZmsceeXzeVrY8-noeOtM', 'member_device_unique_id', '2020-06-04 07:05:44'),
(54, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZjc0ZTU1MjRhNTg0OTQ2ZGRhMGIwN2JjZGM0M2FhZjUxMjljMDY0OTdiYWE3OTc5YzMwODg1NmIwZTU2MTExOTc0NTVlYWZlZjI0NmMzMjIiLCJpYXQiOjE1OTEyNTU5OTYsIm5iZiI6MTU5MTI1NTk5NiwiZXhwIjoxNjIyNzkxOTk2LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.Ffcyp6ZorWzvBr9Jc9RNf2-CQK2c8zz_eL0zjJyzCf2212Vxx5e9zO6dzpMbr5sL6okuagI1A7xBUfZglFO8y7hVl-Gm0aW3akLi-4TAqiUg5R5lote0lcfyP9QlSzGQEURIeJZFpC8-7EJvh8_OmtDD9BKpz5vQn4AMNp_3cOg0IZYd_vM3B8jhW4o_hcwMD3dtswGyro0TrIZWVr1GF9hDalkZR8O97lVW4rZ-M_IZ_3IMbQc35ULFOEO4rk9Ljcjxb7hbcMEkdJOdWYS6CkLMxWbvkpuoOBqzeRQ5TectHn5vo38MF_CNIyGMQzB0bFGeG6z4qENkHFhwoGLAaBo9YM-xnBintUwvFN7gnE2A4R-qYnc2WYRWoxbZUTQfZz7k4Ox1DBQkmzkXSSA4hRthNZypfZqaMEsNtUclyHInPRUPJ6I9n1TRaDp1Mfw4ETEL4HREkXXdG_SyBydCPgeEaE44qhPviBUtweKcF-pprHmANBmbYTWU9_N8o_p_HPlciAAEzKXT4AvLGI9jQCaJ7Ms0PYOVJfdAVPs69-bLF4lXmJQWAnSLHG2ab85PrisDSBh83THTSGIPqrGvrlt2YVYA30R-y4qUz35hNO0qZOAyOj3EwDw2if-2aOhiYrcYm_FqmNGhh0hJ7dIihafut4ViTGhnYbYlkejPZXM', 'member_device_unique_id', '2020-06-04 07:33:16'),
(55, 41, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZjdhYmY3ZjliZDM2YWFlMTdjODIzNDE2Nzg3MjA4OWFkMDRiYmM1ZTBlYjUxZGQ3YzY0ZjgwNWFkYWJkYzYxMzFkZDdhNzkyMTJiMTM4NDkiLCJpYXQiOjE1OTEyNTc5NTIsIm5iZiI6MTU5MTI1Nzk1MiwiZXhwIjoxNjIyNzkzOTUyLCJzdWIiOiI0MSIsInNjb3BlcyI6W119.WDSKwPeZCu8VDzlAVM3zeqRjsv7HNWWp3MaRbjw1BhrcbZGryLD2ehM1TX3LtySS8DLbazho6ifth8p2bAVmIaKdo9-ZsyNWZZcxp6nacrnqMXoGAzBzsiQZjb-XBiL4jj0_I_9k36ZSmYLhuZE1XyXFmRW0noV8N-dmFNV6hXpXljMglSQKRhIdlHvDp5zNNJaw8YLNh7Mlz9Crax8OGu9xHb8w9FR-zEm9X55Oih-jZm1xIFQz0-GNUzkBY70pq9RVYfO53wvbN_Q7v_dUFjC5Pgo4prZpiq6UXNUC-_wJo8X1htOs72jkpfSv_x-QGxhcEdAl1-ZOpFMNmOJFwVyxUSmIpg4lvVl66KmzZ_H7wSCV6WZFm7Yrc2FYP0JIyUoj1Igfk7WZ9siBxPBORg53GofA1soDo51yI-cWT-8VPSZR5Gp7_MwHRy6EOIHCbt5hA4tHucHog4-vOvpYQN2-KDuNyqDcFStT7JFRSgF7ni7x82EgegaS5KsdpzRdhg_x12FnOeo3VSqMX_-LRAVvahYJ3cf31pWBD_oyV2IQmiT97f6Dna51YSQp7uUtfmaIN33nfhOXdmX3p2zOOoGdenQHdQKET7_W02iiYbAfk1DEYBw1Vdu46ZzUNO0qObSW6JRL9AZ5n1zl6uSp4yUqwM2nw_HL9k4GAfUxRog', 'member_device_unique_id', '2020-06-04 08:05:52'),
(56, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMDdlNDBiNjQ1MGI2NTU3ZWM0ZDk1MjVjOTNhOTEzZTI2MDkzNmM4YzUxZjk5YTZmYjMxZmJmNDUyNDg5Y2RhZmQ2ZmFkZTYzMDU2MjA1NDMiLCJpYXQiOjE1OTEyNjQzMDgsIm5iZiI6MTU5MTI2NDMwOCwiZXhwIjoxNjIyODAwMzA4LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.NBxJ7T3NEjoFfpShAlass-A9DWzEetjDajyNvvFcUGqTLRIGCTrp-nBcSd8d-TBVNeYmn1haQPfB8zXdP_k9bK7_Kh6--AR_-Vk2rpFAjCUZxexAOw9rZxCl7Rb0ktfnc13hOUmkIDzBd4CTA9Alj6ZBqFRrea5U98ahYYDUHm9ExUJ2gul4tUgG2BbjVJpG4T8_bxhS8gGg77pR1mShisa0DzSyV_rCnHIuM9FUOnodEKzK6k4L712dfYe0Nym6G7Z_st0yU78H5z_pZJzqrVDEeKuohZJoeaYN7dCtw7HsgbeDr0myluMepZOplcR_jL76mNue3UG54IYREGnPWOov49x-Irej-vuYEMkcuOYyH2Cy1fVz-hIzEeRAeCSasC8zwhNL5xnxHVhM58ThptaCHfo6fMqWNz9Hw1HCoXmv8s6PjJdazgCZGGxJwkUvadz7kaESN4RvbIHgyefnfXbKeFQQnpXqledNsiMEMmulFDqNOrZ06AzSdmN0uLwjdryRZHj08FL5k4SMznOJbMJPsnYK7S__0__B4jvh_ZgmO7FDDaA7ksBGH2KAl3qciHpcHmT5XB959MP2HOBZpXoa7udiYECtyr8-eFm-LbBFDSlWHt2z-3LVjzgAOLzbRQ4fDOt1gAh89cLvemkLTGacwG4VetfFiWkxGQ_SzgI', 'member_device_unique_id', '2020-06-04 09:51:48'),
(57, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZjkxZDRmNDYyYjM1ZGM0MGI3MTIwN2YzMTk2YTZhZWY2NjAyOGQwMzZlNmI2ZmVmYTU2NjcwYzllNTBhNjczZDc4YmExM2IyODljNmU1MGYiLCJpYXQiOjE1OTEyNjQ2NzUsIm5iZiI6MTU5MTI2NDY3NSwiZXhwIjoxNjIyODAwNjc1LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.WRjyKPwfJkgKohTy2r9BpSDRSAXqXstd_N-AhMv4zy5h8apQOiomQTwcqJP2uOGAEvzkcrLALBsIT-vWZpygH6KtNRaZwODEGjmJvrkkbDpOL84OHf_ysG6ZHK35TZSmAQ_LGv_M5KmHRkoYtEjmqUdPdhb3BsyONswd3sDZGT8G8P4rw2KwQZmOQJPiycUuL9zaNpSP1oC0LTJM8DGYv7h9rfliKOoSajax4BtmQq23bhYWknfOPFoI-3niGjGG04Mq9Zl9-nTt9o8a-GjudGrjZChLslhIQrWkeL_z3i7L2XYbNy178gBAg80TOb9Qi8sa_vDC4UMu0_GNcZexmKs-vH0Xkh99_tdirbo9s3yIzR7HWjyTJKS9rhpRnPW9xgdiGSmGAwmIgPKas0b4uZhcyKwMaAbI2idkxBuiINNDWT8cpudPeJSejg-r6PSBrlgMEqI8P7VAkdzApFTkX-1XXhZFzYFSuO4ycuRlTxicGd7oR6Uh2MYqMraDy5QbEBf5G-yE3_zbsq8i9GJt7Q6XImFgdaUnouNyvUJjkXxhK-bFDx0RMMRTmSKpS9poyVyQ5gO1NsFAc356hP-_hdBXXV7Ad3jdf1w1hB1Skp8TVhyCRxU1-mDo7MaGFDDWNNHLcGqIZawXnjLZVJMzULuQlYnLkZtIkuaa6VCR9sk', 'member_device_unique_id', '2020-06-04 09:57:55'),
(58, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZTQwZjIzNGZlNDgyYzg2NmMyZWUzYTJlY2UwY2NjZWRlYTU2Y2EyM2RhMDllOGY1YzE2YmFjMTFkMTYwODhlZjBiZmNkY2M2MmE0Y2E4NjEiLCJpYXQiOjE1OTE2MzM0MzAsIm5iZiI6MTU5MTYzMzQzMCwiZXhwIjoxNjIzMTY5NDMwLCJzdWIiOiIyNSIsInNjb3BlcyI6W119.IiWG_poJXzGMUIPRzIDMWC0065sHwK30mFx8uBhchAQzClZbI2cRShUrIPVlB7T4QmFOo21HFB5AZtJXvUe_pgxwXc4sjzPJ11pcSnFAKxr9BLywXARgBbGAWZX9VyD9fXdoua77l7IqZa-BR7BljPFb1z431fNWAUuBhX_dlzX9hNXoNI8gSbkeH7egErU0-kzzYk2QQGdDKiYBNII6mVgABtC1bl_bz2lEIZ42zt70SffgJ60EE0Ba8tmKI6pwl1ZO2uXTn_stNf6J1GJx96kqY05hJYf2E3HQKNLJ3mJ9ifTW0QnznTQla3TgTlJKdtNA7bFOQfv84V7fSA06tNwy9mX9XVM3qhxUOXs-TAan9e2rNxcqc7o57wD2VBkGMJsIkOCC95tJFdWbeMUF0ZLXlV7a57XKH-yl9iqHXF_OlzMSe-Y1WuIcpFu_qcRQmOJ7yFO5qxV8oD0OBlAs3Qq792g7hP-_DhyDinOVhk2thWB9E8pdNPkwR6DD9RCYiQZstyDBuclPNzi9xsZ2TLDYHQsHYgQzN9kQXiTLnPE1KbPiuHDl-KjBGu_B1E-3s3EeyKSR8pKlOQPyEgmtnT10vUS1wrmGueD5w0djtgxRSlqu23XT2si2-NFQXxS7Pf9S2ehG6w1P3h0T6wILGB5DFoi-67A175crHESxRIA', 'member_device_unique_id', '2020-06-08 16:23:50'),
(59, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNjM3MTFkZWVmM2JmNjBmZDVmMjcxODdiNDBhNTkyYzVhZjE0NDBjZDJkYzkwZTBiMjJmNmEyN2JlODdiYWY0NTI4OTBmYmUwYWNjYmU5N2QiLCJpYXQiOjE1OTQ1MzUxMjAsIm5iZiI6MTU5NDUzNTEyMCwiZXhwIjoxNjI2MDcxMTIwLCJzdWIiOiIyNSIsInNjb3BlcyI6W119.GMQMgPVJENDkUx_U7I4xCuE3wM7_a7zBBPKHqGSL4ALli1qwSBHw17YkYIsDDEvNQc9Ay-Jaq7CdT2uvllD37ei6ga4tP5wrpiaRE9WH8qqLaxElXXp9qgdclQmwX4kXUGBb96S7-8HhjlOs70Uu70wD1CCi08R4IZQmxVafbQBGc2neoczn6DX3ImntziTqNVqjcyDz1btKsE4VqF57As4GddLvcvWY7lBXy6OhstsPOrksJJdNl-5631xRdqLXBs9Ct1joZRjJyhe9lY_ePsAjImapZ-Q0cRaUOZOxPKjA3960euw4KR1rgK40gy2pLbofS8oyCOtVkqdQ8RbBW4l60LzOtLp8bB0zQl47Jvq3ydKh8x8rdD1f2beyHKoY1ulfQEvkf-QnLwPkwjAcHasJrr6pgPwpYjrDaSIQiuunS9EVAEB3KZGUG3CJqPAu5qZIMdHLPwckiHMR6RtHizDrYP0-Ks59dnjoFUL5BSV5Cx_c2SZJ5DCM5-qsXUO3rzJ1RRTM2rMsfH9SIlpUsCgimsH0aRwEFmsxGplcXI4Kx6n8nh_Wsu7X4qYoQ0dxkDC84EE6ygoOrlabk1PITNki-vF25H4ZVuZuSKk4YbXDh2SNsC5daWaECvV3RQzVrvjdF-W-0uXVAfHlk5gflNdrNEc1fG-56vrDBHYfyEc', 'member_device_unique_id', '2020-07-12 06:25:20'),
(60, 25, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNTliYzhhZmZlYTlhZmRkMTIxZTNhMzE1YTVhZGRmYWMxMmNlNzM1ZGVmM2FhOTI0OTdhZjI4ZDEyYWNkOGRmNjEyM2VmZGI4MDQxMDY5NTMiLCJpYXQiOjE1OTUxNzExNTQsIm5iZiI6MTU5NTE3MTE1NCwiZXhwIjoxNjI2NzA3MTU0LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.CKLlnBjo0vNzgjjzH5JwUJFkoakCYHbscIpShgxCa3gFIxDi4bEM7SDbplr5iOwJhp7QZ1zud8LMqR8MoJL7et1xf-AGLcEZ9sJUc670Aj626sJwySBY754Tq3JHVCVSdNcX3mKb3X_UcRFYd5uw6k3ivBHtszAtKqi-X4wXTpV6K-7RXs6zCBF3i1vU4w_oxNQD9Uc96UEFABb-x9fycdMQF0y36eAtGR-Q2OgJlyXNRtcTT2Y5lSoQylo2wBZ4tED843XqSgTZPcszAwdCc0HXK1UlCuoUhtSiqZUQo3Zn0dMBB1oNRTLN_uAKWaCAxVt_7AcOs8JECrqVxl2f1cXYMPzJ-TPZgVqa4MVtgjm8aMIcV2d_eSkZlhJwOq4PGDPFKmGbX43GI36MATxqsKS2Z8dmTaGljZ4j7zIwzS6ywt1X1n_BjVaulDr16HlanZvwyoUp1AynM2I7jH7KYBY3C1LcFxBOHPVqJc-88jqTlxlBXX2pbuObhrd-B4d_OPQyzHW2nfaFT_xAd9gDXoBjZXK6PwDGs59l5a3JAhqPKw9yUhehOVuHDUSq8GoLczcKY0ygfk8z3hhpiVXkJdn_rI_5acPf7r7ER_sH78GpiynH2qlD0tyt6TvaidBkFPzr6-NpUs21m2dv5AyNepLgD3lLnM69_5TSScqJVZA', 'member_device_unique_id', '2020-07-19 15:05:54');

-- --------------------------------------------------------

--
-- Table structure for table `member_job_infos`
--

CREATE TABLE `member_job_infos` (
  `id` bigint(20) NOT NULL,
  `ref_member_job_info_membership_id` int(11) NOT NULL,
  `member_command_code` varchar(50) DEFAULT NULL,
  `member_command_name` varchar(100) DEFAULT NULL,
  `member_rank` varchar(100) DEFAULT NULL,
  `member_shield` varchar(100) DEFAULT NULL,
  `member_appointment_date` date DEFAULT NULL,
  `member_promoted_date` date DEFAULT NULL,
  `member_boro` varchar(200) DEFAULT NULL,
  `member_benificiary` varchar(200) DEFAULT NULL,
  `member_reference_no` varchar(100) DEFAULT NULL,
  `member_retired` varchar(100) DEFAULT NULL,
  `member_job_info_creating_datetime` datetime NOT NULL,
  `member_job_info_editing_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member_job_infos`
--

INSERT INTO `member_job_infos` (`id`, `ref_member_job_info_membership_id`, `member_command_code`, `member_command_name`, `member_rank`, `member_shield`, `member_appointment_date`, `member_promoted_date`, `member_boro`, `member_benificiary`, `member_reference_no`, `member_retired`, `member_job_info_creating_datetime`, `member_job_info_editing_datetime`) VALUES
(1, 34, '3243244234', NULL, '4324', '23432', '2020-04-14', '2020-04-14', '0', '234324324', 'qwewqeewqewqqw', 'YES', '2020-05-14 00:00:00', '2020-05-14 04:00:00'),
(2, 35, 'qewreqrwe', NULL, 'wrwerwe', 'rew', '2020-04-14', '2020-04-14', '0', 'wwewe', 'Ee', 'YES', '2020-05-14 00:00:00', '2020-05-14 04:00:00'),
(3, 36, 'retret', NULL, 'terterter', 'tretre', '2020-04-14', '2020-04-14', '0', 'Uuuu', 'Eee', 'YES', '2020-05-14 00:00:00', '2020-05-14 04:00:00'),
(4, 37, '21321321', NULL, '21321321', '321312', '2020-04-14', '2020-04-14', '0', '23213123', 'Rrrr', 'YES', '2020-05-14 00:00:00', '2020-05-14 04:00:00'),
(5, 38, 'adfdf', NULL, 'dsfdfd', 'fdsfdsf', '2020-04-14', '2020-04-14', '0', 'fddsf', 'ddfdfdf', 'YES', '2020-05-14 00:00:00', '2020-05-14 04:00:00'),
(6, 39, '12323', NULL, '435435435', '43543', '2020-04-14', '2020-04-14', '0', 'Kkk', 'Hhhh', 'YES', '2020-05-14 00:00:00', '2020-05-14 04:00:00'),
(7, 40, '123', NULL, '12233', '123213', '2020-04-16', '2020-04-16', '0', '3213', '123213', 'YES', '2020-05-16 00:00:00', '2020-05-16 04:00:00'),
(8, 41, '2222', NULL, '3', 'dof', '2009-12-03', '2015-01-02', 'ffg', 'ew', '2324', '1', '2020-05-17 00:00:00', '2020-05-17 04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `member_personal_infos`
--

CREATE TABLE `member_personal_infos` (
  `id` bigint(20) NOT NULL,
  `ref_member_personal_info_membership_id` int(11) NOT NULL,
  `member_first_name` varchar(200) NOT NULL,
  `member_last_name` varchar(200) NOT NULL,
  `member_birth_date` date NOT NULL,
  `member_gender` enum('0','1','2','3') NOT NULL COMMENT '0 means not selected,1 means Male,2 means female,3 means others',
  `member_address` text DEFAULT NULL,
  `member_zip_code` varchar(10) NOT NULL,
  `member_email_address` varchar(500) NOT NULL,
  `member_tax_reg_no` varchar(30) NOT NULL,
  `member_personal_info_creating_datetime` datetime NOT NULL,
  `member_personal_info_editing_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member_personal_infos`
--

INSERT INTO `member_personal_infos` (`id`, `ref_member_personal_info_membership_id`, `member_first_name`, `member_last_name`, `member_birth_date`, `member_gender`, `member_address`, `member_zip_code`, `member_email_address`, `member_tax_reg_no`, `member_personal_info_creating_datetime`, `member_personal_info_editing_datetime`) VALUES
(1, 34, 'ghg', 'ghdfgdfg', '2020-04-14', '1', 'dfgdfgdf', 'fdgfdgd', 'a@gmail.com', 'fdgfd', '2020-05-14 00:00:00', '2020-05-14 04:00:00'),
(2, 35, 'reertret', 'retretreer', '2020-04-14', '1', 'eeterter', 'rrrrer', 'abc@gmail.com', 'trettert', '2020-05-14 00:00:00', '2020-05-14 04:00:00'),
(3, 36, 'sfgfdsf', 'dsfdsdf', '2020-04-14', '1', 'dfsf', 'dfdsfd', 'abcc@gmail.cim', 'fsfsdf', '2020-05-14 00:00:00', '2020-05-14 04:00:00'),
(4, 37, 'gfgfhgfgfgf', 'hgfhgf', '2020-04-14', '1', 'fghgfhgf', 'gfhgfhfg', 'adfsdf@gmail.com', 'fghgfh', '2020-05-14 00:00:00', '2020-05-14 04:00:00'),
(5, 38, 'bdfdfs', 'sdfdsfds', '2020-04-14', '1', 'dsfdsf', 'Eee', 'abec@gmail.com', 'Yyy', '2020-05-14 00:00:00', '2020-05-14 04:00:00'),
(6, 39, 'fsdsdf', 'sfdsfdsfd', '2020-04-14', '1', 'fsdfds', '324423', '123@gmail.com', '423432423', '2020-05-14 00:00:00', '2020-05-14 04:00:00'),
(7, 40, 'Anwar', 'Hossain', '2020-04-16', '1', 'Ja-34', '1212', 'anwar@gmail.com', '1212122', '2020-05-16 00:00:00', '2020-05-16 04:00:00'),
(8, 41, 'raju', 'hossain', '1990-12-01', '1', 'xyz', '1234', 'raju@gmail.com', '4321', '2020-05-17 00:00:00', '2020-05-17 04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `memories`
--

CREATE TABLE `memories` (
  `id` bigint(20) NOT NULL,
  `memories_name` text DEFAULT NULL,
  `memories_details` text DEFAULT NULL,
  `memories_thumb` varchar(100) NOT NULL,
  `memories_created_date_time` datetime NOT NULL,
  `memories_editing_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `memories_active` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `memories`
--

INSERT INTO `memories` (`id`, `memories_name`, `memories_details`, `memories_thumb`, `memories_created_date_time`, `memories_editing_datetime`, `memories_active`) VALUES
(3, 'dgads asdf s', 'sdf asdfa', 'public/images/memory/125912515.jpg', '2020-07-19 00:00:00', '2020-07-19 16:57:21', NULL),
(4, 'zzz', 'zzz', 'public/images/memory/80855648.jpg', '2020-05-09 00:00:00', '2020-05-09 23:10:15', NULL),
(5, 'Our Team', 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to ... Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', 'public/images/memory/1431714720.jpg', '2020-05-21 00:00:00', '2020-05-21 07:12:44', 1);

-- --------------------------------------------------------

--
-- Table structure for table `memories_photos`
--

CREATE TABLE `memories_photos` (
  `id` bigint(20) NOT NULL,
  `ref_memories_id` bigint(20) NOT NULL,
  `memories_photo_location` varchar(500) NOT NULL,
  `memories_photo_uploaded_date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `memories_photo_active` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `memories_photos`
--

INSERT INTO `memories_photos` (`id`, `ref_memories_id`, `memories_photo_location`, `memories_photo_uploaded_date_time`, `memories_photo_active`) VALUES
(1, 1, '219344995.jpg', '2020-04-23 04:00:00', 1),
(2, 1, '364792687.jpg', '2020-04-23 04:00:00', 1),
(3, 1, '1907375334.jpg', '2020-04-23 04:00:00', 1),
(4, 1, '1489727616.jpg', '2020-04-23 04:00:00', 1),
(5, 1, '1304583611.jpg', '2020-04-23 04:00:00', 1),
(6, 1, '882680192.jpg', '2020-04-23 04:00:00', 1),
(7, 2, '2058245316.jpg', '2020-04-23 04:00:00', 1),
(8, 2, '1136508679.jpg', '2020-04-23 04:00:00', 1),
(9, 1, '1772066078.jpg', '2020-04-23 04:00:00', 1),
(10, 1, '1646552493.jpg', '2020-04-23 04:00:00', 1),
(11, 1, '820049615.jpg', '2020-04-23 04:00:00', 1),
(12, 1, '1526071069.jpg', '2020-04-23 04:00:00', 1),
(13, 1, '1850356338.jpg', '2020-04-23 04:00:00', 1),
(14, 1, '1902740265.jpg', '2020-04-23 04:00:00', 1),
(15, 1, '1641248016.jpg', '2020-04-23 04:00:00', 1),
(16, 2, '161033175.jpg', '2020-04-23 04:00:00', 1),
(17, 2, '1699862267.jpg', '2020-04-23 04:00:00', 1),
(18, 2, '1407445395.jpg', '2020-04-23 04:00:00', 1),
(19, 3, 'public/images/memory/1539450954.jpg', '2020-05-09 04:00:00', 1),
(20, 3, 'public/images/memory/1987586025.jpg', '2020-05-09 04:00:00', 1),
(21, 3, 'public/images/memory/1165586257.jpg', '2020-05-09 04:00:00', 1),
(22, 5, 'public/images/memory/1017329239.jpeg', '2020-05-21 04:00:00', 1),
(23, 5, 'public/images/memory/1230109469.jpeg', '2020-05-21 04:00:00', 1),
(24, 5, 'public/images/memory/454702007.jpeg', '2020-05-21 04:00:00', 1),
(25, 5, 'public/images/memory/883031502.jpeg', '2020-05-21 04:00:00', 1),
(26, 3, 'public/images/memory/366719070.jpg', '2020-07-18 18:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL,
  `message_details` text DEFAULT NULL,
  `message_active` tinyint(4) DEFAULT 1 COMMENT '1 means active and 0 means not active',
  `message_created_datetime` datetime NOT NULL,
  `message_edited_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `message_details`, `message_active`, `message_created_datetime`, `message_edited_datetime`) VALUES
(1, 'Dcipher Analytics is the world’s leading end-to-end solution for gaining value from text and other unstructured data. Whether you’re looking for a tool, an API, or pure insights, you’ve come to the right place.', 1, '2020-05-17 14:41:17', '2020-05-17 14:41:17'),
(2, 'The easiest way to test your message is using a Leanplum in-app message because they don\'t require APNS / GCM to perform the message delivery. Even if you\'re planning to use your message inside a push notification, we recommend you create a temporary in-app message for more rapid iteration as you write your personalized message with Jinja.', 1, '2020-05-17 14:41:34', '2020-05-17 14:41:34'),
(3, 'A textbook can only get you so far. The video aid provided by Study.com really helps connect the dots for a much deeper understanding.', 1, '2020-05-17 14:43:48', '2020-05-17 14:43:48'),
(4, 'As you can see it’s not a lot of space, but it’s certainly enough if your message is clear, concise, and action-oriented. Instead of viewing the number of characters as a limit, think of it as a Litmus Test for your text. If the message you’re looking to send can’t be condensed down, maybe it’s not appropriate for text.', 1, '2020-05-17 14:44:13', '2020-05-17 14:44:13');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(3, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(4, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(5, '2016_06_01_000004_create_oauth_clients_table', 1),
(6, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(7, '2020_03_26_112254_create_customusers_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00e5b16cd1e7d372307aa8e57e205b3825865f86a3600c8e3c7ec50031aad8491ba2ce5b0620b3b5', 41, 3, 'MyApp', '[]', 0, '2020-05-17 13:37:29', '2020-05-17 13:37:29', '2021-05-17 09:37:29'),
('024043340cd7e5bbfd5f576b99dfa706228bda4cbd8db8843bfe6e640cd4bee9569f1fd68afa829e', 41, 3, 'MyApp', '[]', 0, '2020-05-17 13:08:01', '2020-05-17 13:08:01', '2021-05-17 09:08:01'),
('03284a9cb805f814783c3a8a985fdf627bd7daec7683c185ed8dec1627116fe0b1a6c9d9ad4793aa', 22, 3, 'MyApp', '[]', 0, '2020-04-03 15:51:55', '2020-04-03 15:51:55', '2021-04-03 21:51:55'),
('05236eadcca5c3e2643acbae171bbaf56abad088626c187b249893a0c564a4b3ba73336ef69eae6d', 25, 3, 'MyApp', '[]', 0, '2020-05-22 20:49:55', '2020-05-22 20:49:55', '2021-05-22 16:49:55'),
('057b9f5bf5a9c33a6c31bf412507c6da6c9c77f6ec481862ec8ce53662830f1fcbe46ab76018e6b2', 28, 3, 'MyApp', '[]', 0, '2020-04-22 18:09:28', '2020-04-22 18:09:28', '2021-04-22 14:09:28'),
('061451e1e7cf391cd72e8149c473856ebcd0929c412c7e4fadd8d840db5eb030f3ba0049ae772ce9', 41, 3, 'MyApp', '[]', 0, '2020-05-17 13:03:14', '2020-05-17 13:03:14', '2021-05-17 09:03:14'),
('075f9eb4078ddbc6cc4895c6d9b15274ba19a8c5ddf4867180002d355b08627d1a75b4bef60f6ef6', 25, 3, 'MyApp', '[]', 0, '2020-04-12 20:51:07', '2020-04-12 20:51:07', '2021-04-12 16:51:07'),
('07e40b6450b6557ec4d9525c93a913e260936c8c51f99a6fb31fbf452489cdafd6fade6305620543', 25, 3, 'MyApp', '[]', 0, '2020-06-04 13:51:48', '2020-06-04 13:51:48', '2021-06-04 09:51:48'),
('08e6ff2fbacf05c015de33fa7586180ef31c4f859160614de2409c329cfff10bb3b59c0c379c4f23', 25, 3, 'MyApp', '[]', 0, '2020-05-21 18:46:48', '2020-05-21 18:46:48', '2021-05-21 14:46:48'),
('0bfe25722a774cf962d664e15070d1e4cf0636e0b9da52b5197cdac715358d45096735578044630e', 28, 3, 'MyApp', '[]', 0, '2020-04-22 18:09:28', '2020-04-22 18:09:28', '2021-04-22 14:09:28'),
('0cc26aea30f13022670368766ae51bd40eac1f6a77885fd684ec89a0754f765c5cb4b0a4fa229b1e', 17, 3, 'MyApp', '[]', 0, '2020-03-27 13:47:00', '2020-03-27 13:47:00', '2021-03-27 19:47:00'),
('0ccad8f0e90a084d88294ad1ed577edc71226de26d00fb056eabd78addfb585a3e56820794fcacd3', 41, 3, 'MyApp', '[]', 0, '2020-06-03 14:16:29', '2020-06-03 14:16:29', '2021-06-03 10:16:29'),
('0f6b0b5dfeaa5f74870e44ec4b91017b3bc16840d3600b9df76dab39703ff7345ea15ef2d101b6ab', 25, 3, 'MyApp', '[]', 0, '2020-06-03 14:36:47', '2020-06-03 14:36:47', '2021-06-03 10:36:47'),
('13a6e01865bb42ab541dcbd2c060c63c63dc4da520f30984796c702ccc5518382cde57a339d300fb', 25, 3, 'MyApp', '[]', 0, '2020-05-16 17:20:09', '2020-05-16 17:20:09', '2021-05-16 13:20:09'),
('14581571c06dc8d2544ff5059693eb814fa78a2a0237ae50719d8c95c6c7a692c79e8f2917b0d272', 25, 3, 'MyApp', '[]', 0, '2020-07-19 19:05:54', '2020-07-19 19:05:54', '2021-07-19 15:05:54'),
('14d52f60b404116bb61906e5bef11179ac754761dc09c333c959a9a053c8b681f7b17a9b812ff3bc', 22, 3, 'MyApp', '[]', 0, '2020-04-03 16:28:58', '2020-04-03 16:28:58', '2021-04-03 22:28:58'),
('169a58ad7315803d597e50b36d01f0ce560610f467e7989a1a34b8347e86334342df151711d4c037', 25, 3, 'MyApp', '[]', 0, '2020-04-13 22:19:16', '2020-04-13 22:19:16', '2021-04-13 18:19:16'),
('1711823c9056d28691ec682e25abb094f38e2cdfe5919a427035092b34549094b88688179fbde3f0', 25, 3, 'MyApp', '[]', 0, '2020-06-03 10:53:12', '2020-06-03 10:53:12', '2021-06-03 06:53:12'),
('17e96a705bcf0d8f97c992c2b12bfdc0353bd793840a39869f08fa820d77466924f3f461708b61b7', 25, 3, 'MyApp', '[]', 0, '2020-05-16 14:25:27', '2020-05-16 14:25:27', '2021-05-16 10:25:27'),
('1ab35388c72bc39318b63e923985e560db45acfb836369cfa573ac95a448e93eea7331157356d632', 25, 3, 'MyApp', '[]', 0, '2020-06-03 14:59:25', '2020-06-03 14:59:25', '2021-06-03 10:59:25'),
('1b0c17206b5d3fab9b53af5bf343e406b01399058d89ca6b6a41aa360b43d9d109e7347f2b942d58', 41, 3, 'MyApp', '[]', 0, '2020-06-03 10:51:52', '2020-06-03 10:51:52', '2021-06-03 06:51:52'),
('1d34463ad6a5bf80d46e3689d3a7cd592d919cba712302a0db1421e43abcc005727df7a37bfec69f', 41, 3, 'MyApp', '[]', 0, '2020-05-17 13:08:01', '2020-05-17 13:08:01', '2021-05-17 09:08:01'),
('20b2a11322870d1ac2d6050614aa610676550c2f8d156d50f37b9f77f2ebf08365f3140314ea3e5b', 25, 3, 'MyApp', '[]', 0, '2020-06-03 10:53:12', '2020-06-03 10:53:12', '2021-06-03 06:53:12'),
('21721c31e2303db813f4b00b51d6bfab126c36b0f1198011fdd44e5b4374198409a328177b8954bd', 22, 3, 'MyApp', '[]', 0, '2020-04-03 15:21:51', '2020-04-03 15:21:51', '2021-04-03 21:21:51'),
('2751792540fe6ec2b14bec73ad1e52dd4b4ff85c39182699b14af14cb4a658fe3dbfe3bce3834b36', 25, 3, 'MyApp', '[]', 0, '2020-05-31 09:29:57', '2020-05-31 09:29:57', '2021-05-31 05:29:57'),
('28596fab4e189ce22dc7ca4735666612c3c851e12b281d065664baee02c1aa90162ed0883e323288', 41, 3, 'MyApp', '[]', 0, '2020-06-04 12:05:52', '2020-06-04 12:05:52', '2021-06-04 08:05:52'),
('289d5dad4802d3c62e0d252fca94749e028061fa5bca5f8c5d044d3742656aff7203d71abfd1b230', 41, 3, 'MyApp', '[]', 0, '2020-05-19 10:19:09', '2020-05-19 10:19:09', '2021-05-19 06:19:09'),
('29300a90a8a8e8763bac557136212c3516b95190d7165afeb0fc90d7ba3fa12ce6d2b2bc3674cac0', 41, 3, 'MyApp', '[]', 0, '2020-05-17 13:02:04', '2020-05-17 13:02:04', '2021-05-17 09:02:04'),
('2a33ab51ca45523b2266d960d1ade9096ca10512c0602992ef032bb02bf2c4082af43453861ce23c', 41, 3, 'MyApp', '[]', 0, '2020-06-03 14:10:19', '2020-06-03 14:10:19', '2021-06-03 10:10:19'),
('2bcbd4305c817286647ace053e881a0fa66f0ac42aa4ccb9f682ce566258e57c873529776b5683ce', 35, 3, 'MyApp', '[]', 0, '2020-05-14 13:11:02', '2020-05-14 13:11:02', '2021-05-14 09:11:02'),
('2ceec6d51ff7bd379cf6f712871c566dbe862c0d55afc8e680c3d4851278b3b7f0b792af4d14df40', 41, 3, 'MyApp', '[]', 0, '2020-05-18 13:15:15', '2020-05-18 13:15:15', '2021-05-18 09:15:15'),
('2d72e252227189e86e78464d7ac7c3125bfc25a5afec72626fbd48d390e2a6479897f2d58bfb0dca', 41, 3, 'MyApp', '[]', 0, '2020-05-18 00:21:17', '2020-05-18 00:21:17', '2021-05-17 20:21:17'),
('2e1a316c382fc1324a3f39ef07ba975f0c279e77f839c18112e80475e22d5911dacb93bbdb64ab60', 25, 3, 'MyApp', '[]', 0, '2020-04-04 13:01:25', '2020-04-04 13:01:25', '2021-04-04 09:01:25'),
('34e34f2e9c92220e73c5e3b00bbbe69e61941957f581592e5de1f62a9fbf89f23d768a5ff3a3f339', 24, 3, 'MyApp', '[]', 0, '2020-04-03 14:46:55', '2020-04-03 14:46:55', '2021-04-03 20:46:55'),
('362341ec1b0040a980cda416bf10cd5e60b571f8cb568d8ba0bba491b3c87acc3b8310b5ee7ee4cf', 41, 3, 'MyApp', '[]', 0, '2020-06-03 10:51:52', '2020-06-03 10:51:52', '2021-06-03 06:51:52'),
('3623a32c012f1d0f7636b40af58658a32dfc8836edd6827de30300ac06593732a9130ad1d65393a6', 41, 3, 'MyApp', '[]', 0, '2020-05-21 10:10:20', '2020-05-21 10:10:20', '2021-05-21 06:10:20'),
('37d73cda00425e43428afef0cf6d11be5ae33f90ceb547a7180e8f151d07d065462aeb946dc18a2d', 41, 3, 'MyApp', '[]', 0, '2020-05-19 10:10:18', '2020-05-19 10:10:18', '2021-05-19 06:10:18'),
('3b01ccac5859a8d4f958190905f56ed7f69f6e6f39e581b5c2a15b827c9ee6dd1fbe9cbf6bd900f3', 34, 3, 'MyApp', '[]', 0, '2020-05-14 12:14:02', '2020-05-14 12:14:02', '2021-05-14 08:14:02'),
('3bde515a339e4e8f22559d5a8a9c0f43aee7d6d9523136a1558cc9776d2055e479db94b0dceb795d', 28, 3, 'MyApp', '[]', 0, '2020-04-13 22:17:21', '2020-04-13 22:17:21', '2021-04-13 18:17:21'),
('3be69041a5ed56a5ea84070899eea03dd5b1dfbc131ffc3df3fae8b7dbc2f7fa5cecca3d40de3e03', 25, 3, 'MyApp', '[]', 0, '2020-05-16 19:06:42', '2020-05-16 19:06:42', '2021-05-16 15:06:42'),
('3c69e54811de6c8c8813ef6b743b97f0e5a082c668c75723641d4a0819f1778ade97bda27cbd5504', 41, 3, 'MyApp', '[]', 0, '2020-05-18 14:11:12', '2020-05-18 14:11:12', '2021-05-18 10:11:12'),
('4006b1ff24632b3be7e50e90830fb5f95ce195a166ec6b03fbf437e570a01e97b3e7a1cc01baf00a', 18, 3, 'MyApp', '[]', 0, '2020-03-27 14:03:09', '2020-03-27 14:03:09', '2021-03-27 20:03:09'),
('4125a12dd763a0d6abfdb000969b97fece7bf52895e06cc1ce68872326e32f064ea0259ceaee52df', 15, 3, 'TutsForWeb', '[]', 0, '2020-03-27 13:41:24', '2020-03-27 13:41:24', '2021-03-27 19:41:24'),
('44f901bf361f8f5b55de8594788d2cc3acf666814fcb265574f3ccfe0872ff53d386a07db320898f', 25, 3, 'MyApp', '[]', 0, '2020-06-04 11:05:44', '2020-06-04 11:05:44', '2021-06-04 07:05:44'),
('49a47fad8dc4b4d69f387acf8adeadb76eecf7a02ac1bac49876032726ee83128ad7159f60b93423', 25, 3, 'MyApp', '[]', 0, '2020-04-24 00:37:44', '2020-04-24 00:37:44', '2021-04-23 20:37:44'),
('4d1e105d4af03029e862cd04aeaf5e7ae040f56060fea860c1db29bce6d9d8b761dfb4eec7052a2d', 25, 3, 'MyApp', '[]', 0, '2020-06-04 10:26:03', '2020-06-04 10:26:03', '2021-06-04 06:26:03'),
('4e5837fb51b40dd155b44386d4e3d32474e011033a470258dc8a4433d97f7e85fced35d59d9053c4', 22, 3, 'MyApp', '[]', 0, '2020-03-27 17:19:48', '2020-03-27 17:19:48', '2021-03-27 23:19:48'),
('4f92b1119483d5b6ef8ebe4b111d6083a228f072be10e38b488638373376ff4a2d1b306ebd2e00be', 25, 3, 'MyApp', '[]', 0, '2020-06-01 17:47:21', '2020-06-01 17:47:21', '2021-06-01 13:47:21'),
('522416faaa65bdb30cecf0a933e08d474e1b048a5bdc4a455324ea54df2413c6bfffa5240ad37a73', 24, 3, 'MyApp', '[]', 0, '2020-04-04 01:53:28', '2020-04-04 01:53:28', '2021-04-04 07:53:28'),
('5353310f682a06116326f6a978aa24f9514ae55e36bf8162e7108566b91693c8c6367e68ffc5eaab', 25, 3, 'MyApp', '[]', 0, '2020-05-16 14:41:44', '2020-05-16 14:41:44', '2021-05-16 10:41:44'),
('54c71b5b7720ed1e6bce6a09c62d532c9022e5b5d4a52a8fe46cf6bf5122753d1ecbfaaaab0b094b', 25, 3, 'MyApp', '[]', 0, '2020-06-03 12:43:25', '2020-06-03 12:43:25', '2021-06-03 08:43:25'),
('56c8ac20359066b9c909a91a3286b7b6814b10cd4c49d001a6b42eb8a193a795aa4e0be2d2551460', 25, 3, 'MyApp', '[]', 0, '2020-04-04 13:00:01', '2020-04-04 13:00:01', '2021-04-04 09:00:01'),
('59bc8affea9afdd121e3a315a5addfac12ce735def3aa92497af28d12acd8df6123efdb804106953', 25, 3, 'MyApp', '[]', 0, '2020-07-19 19:05:54', '2020-07-19 19:05:54', '2021-07-19 15:05:54'),
('5a4591c88667c4fb80967cc7e0f50ba8741961ced7259e18eb7818d3a06257f68da302f155f07193', 24, 3, 'MyApp', '[]', 0, '2020-04-04 01:54:26', '2020-04-04 01:54:26', '2021-04-04 07:54:26'),
('5bbe8d35f181f87ba62d64651cf39c895e1e1480cda3874950e40d7d499a5151e7163ba781efe4e3', 41, 3, 'MyApp', '[]', 0, '2020-06-01 17:50:22', '2020-06-01 17:50:22', '2021-06-01 13:50:22'),
('5cb9d175b074b9af460292e0f504fcbfdffb2d3781c614d5ac6d1a2b61eb18f191895f1a762b619f', 28, 3, 'MyApp', '[]', 0, '2020-04-23 23:53:04', '2020-04-23 23:53:04', '2021-04-23 19:53:04'),
('5d3ac36c91fb71fd440406b580723605890a00657fe5df83b45c4ea853ab753b13d3b7b388b0ae08', 25, 3, 'MyApp', '[]', 0, '2020-06-04 11:05:41', '2020-06-04 11:05:41', '2021-06-04 07:05:41'),
('5d7e621b3b71917ad7cabed16c31f1c6cce907b83e5076c14635ef8e7203679ea2722ec602709fd4', 41, 3, 'MyApp', '[]', 0, '2020-06-04 10:26:40', '2020-06-04 10:26:40', '2021-06-04 06:26:40'),
('5e17c0becc75d335fb4f44c4219237bc6d08f53f236b1a7e646e2bb12478c617e9f44bbc4a7a4ce1', 14, 3, 'TutsForWeb', '[]', 0, '2020-03-27 13:41:08', '2020-03-27 13:41:08', '2021-03-27 19:41:08'),
('5e6609de5686169cad9d08d640b974bee49d0ae63d68b32b1a55b0db10bd28ae90b14205cf65e0c7', 25, 3, 'MyApp', '[]', 0, '2020-06-01 17:47:21', '2020-06-01 17:47:21', '2021-06-01 13:47:21'),
('5f1cbaa7a748f3d068095c14d81faabc6288d2443ec00c0c265dc863a773b8b4ba02ce3ec6e66d79', 10, 3, 'TutsForWeb', '[]', 0, '2020-03-27 13:11:23', '2020-03-27 13:11:23', '2021-03-27 19:11:23'),
('5f387935577ef1d0272c344641962d30e80fa7c9ccf566f6341d8b0e08e792590284aa33713f6072', 25, 3, 'MyApp', '[]', 0, '2020-06-04 11:05:41', '2020-06-04 11:05:41', '2021-06-04 07:05:41'),
('60a2a5a4d2cd558e3096fbcb277678be894a6ca05ef620772203d481251af7c8a03f4ef35012f748', 41, 3, 'MyApp', '[]', 0, '2020-06-04 10:26:40', '2020-06-04 10:26:40', '2021-06-04 06:26:40'),
('63711deef3bf60fd5f27187b40a592c5af1440cd2dc90e0b22f6a27be87baf452890fbe0accbe97d', 25, 3, 'MyApp', '[]', 0, '2020-07-12 10:25:20', '2020-07-12 10:25:20', '2021-07-12 06:25:20'),
('657e6c72fad752cd349aeb564ccb32176ed96a3e4094c2ed55910dd564f4a03d352d4d3c03867e53', 41, 3, 'MyApp', '[]', 0, '2020-05-19 10:19:09', '2020-05-19 10:19:09', '2021-05-19 06:19:09'),
('68b76cb50a1009e1e6bed41433753a8aad1370c2a41a0fe739f0ebef126e132986713f3ecf069995', 28, 3, 'MyApp', '[]', 0, '2020-04-13 22:19:50', '2020-04-13 22:19:50', '2021-04-13 18:19:50'),
('69fcd2678c173a530b1029de2e890089a2570dc2abfdc349c460c8aacae60c097fae5a6aaf210b95', 22, 3, 'MyApp', '[]', 0, '2020-03-27 18:24:04', '2020-03-27 18:24:04', '2021-03-28 00:24:04'),
('6c03f2704a77cea4ae7e596555cfd3e7988f6264f04cc0e39874aea1fad9bd93865064debcb4deba', 41, 3, 'MyApp', '[]', 0, '2020-06-01 17:50:22', '2020-06-01 17:50:22', '2021-06-01 13:50:22'),
('6d39180521e47d680e7cede925a2fa5ffaaa4a8c760cdddb45ced8f184b12360028558aea70507c5', 25, 3, 'MyApp', '[]', 0, '2020-04-04 14:16:28', '2020-04-04 14:16:28', '2021-04-04 10:16:28'),
('71f316aeb17e2328156af44457f9432f1f3fc8e4f7df83fc3841fa137534c243ec4a4379bb29a1ee', 25, 3, 'MyApp', '[]', 0, '2020-07-12 10:25:20', '2020-07-12 10:25:20', '2021-07-12 06:25:20'),
('72c3b6f28bd1ac888e93af3abd53bb870f9d8c6f7bfa7c2fde0535f071618f08462f748c8dcf6eef', 36, 3, 'MyApp', '[]', 0, '2020-05-14 13:12:59', '2020-05-14 13:12:59', '2021-05-14 09:12:59'),
('72ea8ad025b020749cea77072a44e7310858cb7df0e1a536153afcc8240e485908f95f884e02597f', 41, 3, 'MyApp', '[]', 0, '2020-05-18 00:21:17', '2020-05-18 00:21:17', '2021-05-17 20:21:17'),
('73c867aab485a722d34bd1a51e6ff092f140a974a0ba54b7d8857002c0463067978146517df52b12', 25, 3, 'MyApp', '[]', 0, '2020-05-16 17:20:09', '2020-05-16 17:20:09', '2021-05-16 13:20:09'),
('754ccf1156f299f1c11c0924c9541a99187acdb37095cc96faf768f5ecc4d701feb08e064c3d7457', 22, 3, 'MyApp', '[]', 0, '2020-04-04 00:50:38', '2020-04-04 00:50:38', '2021-04-04 06:50:38'),
('75c67d6d202c0f4cfd55315c6452c87807748758bdbf8dbfb9ff812135df057f292fe5812099b469', 22, 3, 'MyApp', '[]', 0, '2020-04-03 15:19:15', '2020-04-03 15:19:15', '2021-04-03 21:19:15'),
('7640c4b222e714642af45af431891a66014653fd6daffe5779fac0864cc3fd5554a24b9779504b6f', 25, 3, 'MyApp', '[]', 0, '2020-05-21 18:01:02', '2020-05-21 18:01:02', '2021-05-21 14:01:02'),
('77a181e80f3f7e71a075039478d63f01f04edd092c25e4b0621a39f9fe38f74c56ac8e96968651f7', 41, 3, 'MyApp', '[]', 0, '2020-06-03 14:10:19', '2020-06-03 14:10:19', '2021-06-03 10:10:19'),
('78620a79f7b91741f0a0e7b615cd231c217985c961ade72ee0440c4556aafcfab8f293203a814500', 25, 3, 'MyApp', '[]', 0, '2020-06-08 20:23:50', '2020-06-08 20:23:50', '2021-06-08 16:23:50'),
('79129c752d3bd7076fc27e5733b7157301e0a59970aa274176195a94ab8a86739bc0bc3af2f572da', 20, 3, 'MyApp', '[]', 0, '2020-03-27 14:49:14', '2020-03-27 14:49:14', '2021-03-27 20:49:14'),
('7ea6113c006aa2fa4ad290990c10327cb24d71110e701c6c9fdbe937fccbf814bce20e6fa49b28e2', 21, 3, 'MyApp', '[]', 0, '2020-03-27 14:55:03', '2020-03-27 14:55:03', '2021-03-27 20:55:03'),
('81c662360f1674e85f61d0b68720790fb7da48d7bc1ba042bfe194213d3cdee576c5d9f23aa86436', 25, 3, 'MyApp', '[]', 0, '2020-05-16 19:15:00', '2020-05-16 19:15:00', '2021-05-16 15:15:00'),
('85ee609e2a6a71c96cb71a23922cd2561b72e83bef26b894209cdfb1eaeb18958e006643efa06561', 25, 3, 'MyApp', '[]', 0, '2020-05-22 20:49:55', '2020-05-22 20:49:55', '2021-05-22 16:49:55'),
('86e0db51c3658d1187f42e9dc78b8836916f4a6b77615408d93737780370772110fddd479993936c', 41, 3, 'MyApp', '[]', 0, '2020-05-21 10:10:20', '2020-05-21 10:10:20', '2021-05-21 06:10:20'),
('8a3f8369c54c4b6669f4fb6b89c0445bb20d42da5bb6234785808b1a62010f74d304f6326121e0c0', 25, 3, 'MyApp', '[]', 0, '2020-06-04 11:02:42', '2020-06-04 11:02:42', '2021-06-04 07:02:42'),
('8da616927ee278ccf20cd200b1eb4633b7c10ffa0bea117e80a47ba593613f351832c51b41dd6a31', 25, 3, 'MyApp', '[]', 0, '2020-05-16 19:10:25', '2020-05-16 19:10:25', '2021-05-16 15:10:25'),
('8e74e02c86e9233d51757fe7a632acc35c19e5646f7f73010b79984b4f198ae92653de1077a6e512', 28, 3, 'MyApp', '[]', 0, '2020-04-23 23:53:04', '2020-04-23 23:53:04', '2021-04-23 19:53:04'),
('8e8ecfd4fe29521ad0585730faabad73eb96549cb8b55e8ef0bac4fa0d0a38f24408f3e6e94b7d01', 41, 3, 'MyApp', '[]', 0, '2020-05-18 00:21:06', '2020-05-18 00:21:06', '2021-05-17 20:21:06'),
('8eaf2fdfae18560fdd5c45ae0704a00eaf31a0be66d4a935ee909718c4ce9b452a3d61041b324b67', 41, 3, 'MyApp', '[]', 0, '2020-05-18 00:21:06', '2020-05-18 00:21:06', '2021-05-17 20:21:06'),
('97c502a5a14842db60df0f13d25aee7701d64ae04724b985fdd6dd920381ae4dfe53e54ba32800d0', 25, 3, 'MyApp', '[]', 0, '2020-06-04 10:26:03', '2020-06-04 10:26:03', '2021-06-04 06:26:03'),
('97d30ad29f2dbf6b3e690b0d2093e259c7f9136d3dcbcd6f85c8b9cc81384fc548aa67eb0df6fb64', 11, 3, 'TutsForWeb', '[]', 0, '2020-03-27 13:36:56', '2020-03-27 13:36:56', '2021-03-27 19:36:56'),
('995e85e7fb532157b84bb66fa78346b21f6ec0777331b0236fdfe81d48bbf62bbb766ceb044e6eec', 25, 3, 'MyApp', '[]', 0, '2020-04-24 00:37:44', '2020-04-24 00:37:44', '2021-04-23 20:37:44'),
('99a7e0816d7cfc859114d03c80803d8fd22fb8a4266f8cabf1abb210ebc5dfa8e62f3d6aa54195b2', 41, 3, 'MyApp', '[]', 0, '2020-05-21 11:08:10', '2020-05-21 11:08:10', '2021-05-21 07:08:10'),
('9b45acc027d6107267780992952e2c88c01e22242f713c842b3b9326e4fd490acaeb5661e1da4d22', 24, 3, 'MyApp', '[]', 0, '2020-04-04 01:58:28', '2020-04-04 01:58:28', '2021-04-04 07:58:28'),
('9be40ceb05ebda1af158d178db81879c34f48e57c85edf9ee76d4e62314580838413ded641e0a38a', 37, 3, 'MyApp', '[]', 0, '2020-05-14 13:14:37', '2020-05-14 13:14:37', '2021-05-14 09:14:37'),
('9c9f865046e9b2a9ef074146a53f815c3aae80cde237bd8f13570d79365035ade063b73a8665c995', 41, 3, 'MyApp', '[]', 0, '2020-05-18 13:15:14', '2020-05-18 13:15:14', '2021-05-18 09:15:14'),
('9e38c374f43c167e51c111f2fb16da98349f73a223504394f53a8cb1c83683c3050dcf0ce5113871', 25, 3, 'MyApp', '[]', 0, '2020-04-28 14:39:28', '2020-04-28 14:39:28', '2021-04-28 10:39:28'),
('9e66b6a4e59c2ef3568399264116ccbb51f2066524a5cb1a100db5cd4f60ce99bc70993735b6a6f5', 39, 3, 'MyApp', '[]', 0, '2020-05-14 13:19:47', '2020-05-14 13:19:47', '2021-05-14 09:19:47'),
('9f1296eae5aaeabbd395edc39ea6579b63be7a0e4fa633cc21805996dfc971caede2c00c84ccbbe1', 25, 3, 'MyApp', '[]', 0, '2020-06-04 13:57:55', '2020-06-04 13:57:55', '2021-06-04 09:57:55'),
('a04bb42e4f4dbc9d98137a4ac14d83bd7d8543ccff9152f135fa2dc37390afd344ffddc27e4fe834', 41, 3, 'MyApp', '[]', 0, '2020-05-21 11:08:10', '2020-05-21 11:08:10', '2021-05-21 07:08:10'),
('a12ef8806d240f7bfc4f298c3444a8bdbb4c98d7173a788ac42b743c005482a35ea43d4f4fa8dc74', 22, 3, 'MyApp', '[]', 0, '2020-03-27 17:18:47', '2020-03-27 17:18:47', '2021-03-27 23:18:47'),
('ab2b8f1fe643c57773ef6f3f0492d3086571cddf3af2eba69d44916aa397094d7f7e00fff00b3a63', 41, 3, 'MyApp', '[]', 0, '2020-05-18 14:11:12', '2020-05-18 14:11:12', '2021-05-18 10:11:12'),
('ab7dcd0afd0626bfcfc63d3d004f3e25c79f8ee903416076ab08beb260c7c6b0228d403a3d1c98eb', 41, 3, 'MyApp', '[]', 0, '2020-05-17 13:37:29', '2020-05-17 13:37:29', '2021-05-17 09:37:29'),
('b2c54242c374bee89fbec075ebb44c6f8b96506501d4af3eb9dfc0bff9175f6588cadf123698a5f7', 22, 3, 'MyApp', '[]', 0, '2020-04-03 15:21:48', '2020-04-03 15:21:48', '2021-04-03 21:21:48'),
('b4cb912245294648cf61a995e0dc672513e796778a55f2d8f2a7cb81ae91802d6098f232db46bb68', 41, 3, 'MyApp', '[]', 0, '2020-05-19 13:04:42', '2020-05-19 13:04:42', '2021-05-19 09:04:42'),
('b6373c07e8b9e1a3106a4a5b49e31cdcd49d0be835e5d73cedc4b08c0575d9a3fe3e47b32757aa6a', 25, 3, 'MyApp', '[]', 0, '2020-06-04 10:23:56', '2020-06-04 10:23:56', '2021-06-04 06:23:56'),
('be564e711bbde41307f4c561bfef51b21ef46349dc6d724a7ce5c1edf1aac135ebc0931b7981d621', 24, 3, 'MyApp', '[]', 0, '2020-04-04 01:57:37', '2020-04-04 01:57:37', '2021-04-04 07:57:37'),
('be9b28f59019c75783c04f8f867d3071c8fa93d4afe22d80aeaf0838ef26c34fb5b9f411901b1176', 25, 3, 'MyApp', '[]', 0, '2020-06-04 13:51:48', '2020-06-04 13:51:48', '2021-06-04 09:51:48'),
('bf5e966b97b3b25e8c0440bd9ca29f2dad30aa8afd1c658c1f270256acd3101d3301ad4114340dcf', 25, 3, 'MyApp', '[]', 0, '2020-06-04 11:05:44', '2020-06-04 11:05:44', '2021-06-04 07:05:44'),
('bf88ed8219fae16e5f00ee510984d3bb1303c24233331ed0a844242f70d0269323d0b5ef36aa97b2', 41, 3, 'MyApp', '[]', 0, '2020-05-19 13:04:42', '2020-05-19 13:04:42', '2021-05-19 09:04:42'),
('bfc04aed94c24fd45db1c57b8044e37e36487bc8a224e4234758d9fdac26e6a095d2018885b140ad', 25, 3, 'MyApp', '[]', 0, '2020-05-31 09:29:57', '2020-05-31 09:29:57', '2021-05-31 05:29:57'),
('c94c6510f2af32918c3024616062b8e3a6b71a65e4e2e8a93e5c231742f39808367580419d7d62a2', 28, 3, 'MyApp', '[]', 0, '2020-04-13 22:19:50', '2020-04-13 22:19:50', '2021-04-13 18:19:50'),
('c961333d3e32eee045066fd4e0d78ec8a9d0ee2d403a0229781174a871c7fbecd5957a309f292871', 25, 3, 'MyApp', '[]', 0, '2020-04-12 20:51:07', '2020-04-12 20:51:07', '2021-04-12 16:51:07'),
('cb5c01412f8d6eac4dd545ad260a0455f9b385f8d58696e30c636ad1bc0b54633d2b6f13a8c90b40', 38, 3, 'MyApp', '[]', 0, '2020-05-14 13:18:27', '2020-05-14 13:18:27', '2021-05-14 09:18:27'),
('cbe4095c125f66311602b763f2c9a75ecb65ff05bd7f4208f39869d2a5d8ef1730adf8f42271d201', 25, 3, 'MyApp', '[]', 0, '2020-05-16 14:41:44', '2020-05-16 14:41:44', '2021-05-16 10:41:44'),
('cc4e576438175d558cdf317d18ba88598c65e02d9cd93c703f579570f5f6b2dda643f98033e3322a', 25, 3, 'MyApp', '[]', 0, '2020-04-28 14:39:28', '2020-04-28 14:39:28', '2021-04-28 10:39:28'),
('cc944047af8c83e5429b6917dbdc2944f3b90a95e8c1878a4a922b77b1d600eaf8d647ce07962d30', 25, 3, 'MyApp', '[]', 0, '2020-04-04 14:16:28', '2020-04-04 14:16:28', '2021-04-04 10:16:28'),
('ce9bda1d5e9dd4f06f27e618a6046d11591b00698390a07dddb17c25152428fc22ec49cb051fa2dd', 25, 3, 'MyApp', '[]', 0, '2020-06-04 11:33:16', '2020-06-04 11:33:16', '2021-06-04 07:33:16'),
('d0d0b3280751b84a4924e50ac499b76bdd39ca3c1ac4160f635c838a4e1a74fcc828e3c30dafed97', 19, 3, 'MyApp', '[]', 0, '2020-03-27 14:24:14', '2020-03-27 14:24:14', '2021-03-27 20:24:14'),
('d6e5b73bed9f90b8c68e021fb5b3801b7f2360c52559e138a092a4d73342bc326b88901ab2a6d949', 25, 3, 'MyApp', '[]', 0, '2020-05-16 14:13:35', '2020-05-16 14:13:35', '2021-05-16 10:13:35'),
('d8ebcf54d181e8ea929bc106fdb0ec7d53b0ab209420cbbf855c20ee4141044ba662db3f55e158a4', 22, 3, 'MyApp', '[]', 0, '2020-04-03 15:21:49', '2020-04-03 15:21:49', '2021-04-03 21:21:49'),
('da39354f2d150bb49c7c724dd04b823aefa2890ee30be2524b2f737952802e3b69693bc69abe3058', 25, 3, 'MyApp', '[]', 0, '2020-06-03 10:44:49', '2020-06-03 10:44:49', '2021-06-03 06:44:49'),
('dc7fdf84916bf617f538353b6d2595cc1f0bed8ad87865b7b3b39e6a4e6fa71e8c1cf7ac8f636d74', 25, 3, 'MyApp', '[]', 0, '2020-05-16 14:43:30', '2020-05-16 14:43:30', '2021-05-16 10:43:30'),
('de4d5a81e265db567b66fc77b5340cfafd3274fddfabc10a40431c378cee780396a95da4b2a050c5', 25, 3, 'MyApp', '[]', 0, '2020-05-21 18:46:47', '2020-05-21 18:46:47', '2021-05-21 14:46:47'),
('df1f59f37ef751294808ce04df38c7873e4fb39c390f54ffbb2024fa81ac7cb2d2f5286ea1a05685', 41, 3, 'MyApp', '[]', 0, '2020-05-19 10:10:18', '2020-05-19 10:10:18', '2021-05-19 06:10:18'),
('e054b69984234b857ccbd0baf7bd57d74e1ef25ba4146b314e131532da7089097c46699ce7c6c338', 25, 3, 'MyApp', '[]', 0, '2020-06-03 12:43:25', '2020-06-03 12:43:25', '2021-06-03 08:43:25'),
('e3c3adeecaf8f2e458460041368ceed2d3689e885c266a96f960853bf9d99cfd41a2b6d96cb35280', 25, 3, 'MyApp', '[]', 0, '2020-06-04 11:02:42', '2020-06-04 11:02:42', '2021-06-04 07:02:42'),
('e40f234fe482c866c2ee3a2ece0cccedea56ca23da09e8f5c16bac11d16088ef0bfcdcc62a4ca861', 25, 3, 'MyApp', '[]', 0, '2020-06-08 20:23:50', '2020-06-08 20:23:50', '2021-06-08 16:23:50'),
('e63bbc5141b3e9f2ced95be9bc88f8c2da257484fb1ce36b5135671345da1804f7d80556e204fae0', 41, 3, 'MyApp', '[]', 0, '2020-06-03 14:16:29', '2020-06-03 14:16:29', '2021-06-03 10:16:29'),
('e7804b245405c1bc054a908aa2479679f16aa07dd35472e763795e9d047e1da9f788e782de58b363', 25, 3, 'MyApp', '[]', 0, '2020-05-16 14:43:30', '2020-05-16 14:43:30', '2021-05-16 10:43:30'),
('e7ae111c06380bb2a03defc51b6be9dbdfd3825ba940c3478b313f6358d36929bffbb4ea6d815fdd', 25, 3, 'MyApp', '[]', 0, '2020-05-16 19:15:00', '2020-05-16 19:15:00', '2021-05-16 15:15:00'),
('e9353113189ab433c5ac25894c47347b9b7079e4e37396d3888d692dffbeca971431892604bc7280', 25, 3, 'MyApp', '[]', 0, '2020-06-03 14:59:25', '2020-06-03 14:59:25', '2021-06-03 10:59:25'),
('ebd7c241ea0892e69c7110197bb132881ed91a5236bfb9d6cfb44762593eebca9b927339c4297d45', 25, 3, 'MyApp', '[]', 0, '2020-04-13 22:19:16', '2020-04-13 22:19:16', '2021-04-13 18:19:16'),
('ed5e0815bded52614120dc7be5a75b5d6bfc7e9e1e9f9bc1905f330bf05d56ba5d81cd378194504a', 25, 3, 'MyApp', '[]', 0, '2020-06-04 10:23:56', '2020-06-04 10:23:56', '2021-06-04 06:23:56'),
('ee8d8d21759e022f4f44846feb20ea7e7e162d2a249457aa35141b01f8ce8fa869785eeaee4e3730', 25, 3, 'MyApp', '[]', 0, '2020-06-03 14:36:47', '2020-06-03 14:36:47', '2021-06-03 10:36:47'),
('f1c799bbc878a2601e74d718305912013b6745789a6e6c1afa69c6217a13a71a48058b7f60bfd2d6', 25, 3, 'MyApp', '[]', 0, '2020-05-16 19:10:25', '2020-05-16 19:10:25', '2021-05-16 15:10:25'),
('f279b800807692e7185365c5d16d995723fa65e01d4e35cbba022f8e1c90270608928678f02bb849', 12, 3, 'TutsForWeb', '[]', 0, '2020-03-27 13:37:18', '2020-03-27 13:37:18', '2021-03-27 19:37:18'),
('f4df65a8e0d1649c1c8544bb1065f9fcf07136e1d50a10360e938e3928aa0ea3febe09584a4a44a3', 25, 3, 'MyApp', '[]', 0, '2020-06-03 10:44:49', '2020-06-03 10:44:49', '2021-06-03 06:44:49'),
('f66faa6adfcb7cdd4dc48d4fbe3686e90db4027cdc4699a1cb55c76c893d02e4fcdc667ec8e6b2a0', 25, 3, 'MyApp', '[]', 0, '2020-05-16 19:06:42', '2020-05-16 19:06:42', '2021-05-16 15:06:42'),
('f674ed27997b6861ea61a7775c88276141e5a76f1ddf39354273b850ce0558a33908e2c90a0ed64d', 25, 3, 'MyApp', '[]', 0, '2020-05-16 14:25:27', '2020-05-16 14:25:27', '2021-05-16 10:25:27'),
('f74e5524a584946dda0b07bcdc43aaf5129c06497baa7979c308856b0e5611197455eafef246c322', 25, 3, 'MyApp', '[]', 0, '2020-06-04 11:33:16', '2020-06-04 11:33:16', '2021-06-04 07:33:16'),
('f7503a13e7eb6ec892853ec443dbe6f6252a9fbf26ab845ede53a8e5491a50b70f55f66aa8286a0f', 25, 3, 'MyApp', '[]', 0, '2020-05-16 14:13:35', '2020-05-16 14:13:35', '2021-05-16 10:13:35'),
('f7abf7f9bd36aae17c8234167872089ad04bbc5e0eb51dd7c64f805adabdc6131dd7a79212b13849', 41, 3, 'MyApp', '[]', 0, '2020-06-04 12:05:52', '2020-06-04 12:05:52', '2021-06-04 08:05:52'),
('f917b7721c6ec39989653a4009935192fbd9646fd2d20f0e149d52c18bfa0e045b68b341c6a816c8', 16, 3, 'MyApp', '[]', 0, '2020-03-27 13:45:25', '2020-03-27 13:45:25', '2021-03-27 19:45:25'),
('f91d4f462b35dc40b71207f3196a6aef66028d036e6b6fefa56670c9e50a673d78ba13b289c6e50f', 25, 3, 'MyApp', '[]', 0, '2020-06-04 13:57:55', '2020-06-04 13:57:55', '2021-06-04 09:57:55'),
('f9ea3e4ee4a092ad9a01b5705c256c45db2d35a675ea914612c4a795eaed14b786851e45ace265aa', 24, 3, 'MyApp', '[]', 0, '2020-04-04 01:58:28', '2020-04-04 01:58:28', '2021-04-04 07:58:28'),
('fa4b6a1eca84714a87e4ed5ced9d4769ab7f3823abb13799bbccb7394b037f4259c3c96cce179e2a', 25, 3, 'MyApp', '[]', 0, '2020-05-21 18:01:02', '2020-05-21 18:01:02', '2021-05-21 14:01:02'),
('fabcdef7471b3cce4ca66836fc1ecfda2ff156372735e0bb8de4962a214240722f4eeb16b5e42be9', 41, 3, 'MyApp', '[]', 0, '2020-05-17 13:03:14', '2020-05-17 13:03:14', '2021-05-17 09:03:14'),
('fe602823fa9c5f6f87d40d04aebad292faa239c8a7b70530f18fdddee33085925f524d6d6731cc5b', 40, 3, 'MyApp', '[]', 0, '2020-05-16 13:37:01', '2020-05-16 13:37:01', '2021-05-16 09:37:01'),
('ff1eeccf65c6be7941a1ef82138d6f4ff93326dac52eca0ffd366183a8cc988069f941ae39520d04', 25, 3, 'MyApp', '[]', 0, '2020-04-04 13:01:25', '2020-04-04 13:01:25', '2021-04-04 09:01:25');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'columbia_assosiation Personal Access Client', 'SZmQYXUNlfPDQuDQ1Sd38SHDCjf51Eow5bf2m7R2', 'http://localhost', 1, 0, 0, '2020-03-27 12:45:27', '2020-03-27 12:45:27'),
(2, NULL, 'columbia_assosiation Password Grant Client', 'Ihso2LnauXpcTlvFPEXpf6WQSqADJW0xSy5lFqhi', 'http://localhost', 0, 1, 0, '2020-03-27 12:45:27', '2020-03-27 12:45:27'),
(3, NULL, 'columbia_assosiation Personal Access Client', 'vvey9eViPit2nsxpla1kHzL0DSRZJQlIIRYJEePx', 'http://localhost', 1, 0, 0, '2020-03-27 12:45:55', '2020-03-27 12:45:55'),
(4, NULL, 'columbia_assosiation Password Grant Client', 'WtnmVbknMnRiGQUNeKTaS4cJ9iEkOIhhgTmctIPf', 'http://localhost', 0, 1, 0, '2020-03-27 12:45:55', '2020-03-27 12:45:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-03-27 12:45:27', '2020-03-27 12:45:27'),
(2, 3, '2020-03-27 12:45:55', '2020-03-27 12:45:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organize_infos`
--

CREATE TABLE `organize_infos` (
  `organize_address` text DEFAULT NULL,
  `organize_telephone` text DEFAULT NULL,
  `organize_email` varchar(300) DEFAULT NULL,
  `organize_facebook` varchar(300) DEFAULT NULL,
  `organize_instagram` varchar(300) DEFAULT NULL,
  `organize_linkedin` varchar(300) DEFAULT NULL,
  `organize_twitter` varchar(300) DEFAULT NULL,
  `organize_info_created_edited_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('sajedaiub@gmail.com', '$2y$10$K.hp2kWisDrIhxnF1Q9AJOZDrz4pLRhhi2oOlT.es0pYrsTjZgOnC', '2020-04-23 10:23:36');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_description` text NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(3) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_description`, `price`, `stock`, `photo`, `status`) VALUES
(1, 'T-Shirt', 'description....', 20, 5, '816306291.jpg', 5),
(2, 'Watch', 'description....description....', 100, 10, '721579894.jpg', 10),
(5, 'ttt5', 'ttt5', 235, 25, '1553109.jpg', 25),
(6, 'Mobile', 'sdf asda s asd a', 7500, 5, '848845184.jpg', 5);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `caption` varchar(150) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `photo`, `name`, `caption`, `status`) VALUES
(1, '1491549225.jpg', 'Slider1', 'caption 111', 1),
(2, '90721394.jpg', 'slider2', 'caption22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sponsors`
--

CREATE TABLE `sponsors` (
  `id` bigint(20) NOT NULL,
  `sponsor_name` varchar(300) NOT NULL,
  `sponsor_details` text DEFAULT NULL,
  `sponsor_address` text DEFAULT NULL,
  `sponsor_email` varchar(300) DEFAULT NULL,
  `sponsor_website` varchar(300) DEFAULT NULL,
  `sponsor_logo_photo` varchar(300) DEFAULT NULL,
  `sponsor_position` int(11) DEFAULT 0,
  `sponsor_created_datetime` datetime NOT NULL,
  `sponsor_edited_date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sponsors`
--

INSERT INTO `sponsors` (`id`, `sponsor_name`, `sponsor_details`, `sponsor_address`, `sponsor_email`, `sponsor_website`, `sponsor_logo_photo`, `sponsor_position`, `sponsor_created_datetime`, `sponsor_edited_date_time`) VALUES
(1, 'Whatsupitec', 'Xyz', 'Flat-12,kha-1, Shajadpur, Dhaka-1212, Gulshan-1', 'hello@gmail.com', 'http://www.whatsupitec.com', '1665451130.png', 0, '2020-05-19 06:16:44', '2020-05-19 06:16:44'),
(2, 'IBM', 'International Business Machines Corporation is an American multinational technology company headquartered in Armonk, New York, with operations in over 170 countries', 'Armonk, New York, United States', 'ibm@gmail.com', 'https://www.ibm.com/bd-en', '191929702.png', 0, '2020-05-19 07:37:12', '2020-05-19 07:37:12'),
(3, 'Skytap', 'Skytap, Inc. is a private company based in Seattle, Washington offering a public service for cloud computing', 'Seattle, Washington, United States', 'skytap@gmail.com', 'https://www.skytap.com/', '1564798315.png', 0, '2020-05-19 07:47:29', '2020-05-19 07:47:29');

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id` int(11) NOT NULL,
  `user_type_name` varchar(50) NOT NULL,
  `active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `user_type_name`, `active`) VALUES
(1, 'Admin', 1),
(2, 'Member', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vote_candidate`
--

CREATE TABLE `vote_candidate` (
  `id` int(11) NOT NULL,
  `vote_id` int(11) NOT NULL,
  `vote_position_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vote_candidate`
--

INSERT INTO `vote_candidate` (`id`, `vote_id`, `vote_position_id`, `user_id`, `status`) VALUES
(1, 1, 1, 35, 1),
(2, 1, 1, 36, 1),
(3, 1, 2, 37, 1),
(4, 1, 2, 38, 1),
(5, 1, 3, 40, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vote_count`
--

CREATE TABLE `vote_count` (
  `id` int(11) NOT NULL,
  `vote_id` int(11) NOT NULL,
  `vote_position_id` int(11) NOT NULL,
  `vote_candidate_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vote_count`
--

INSERT INTO `vote_count` (`id`, `vote_id`, `vote_position_id`, `vote_candidate_id`, `voter_id`) VALUES
(19, 1, 1, 38, 38),
(20, 1, 2, 36, 38),
(21, 1, 2, 37, 38);

-- --------------------------------------------------------

--
-- Table structure for table `vote_details`
--

CREATE TABLE `vote_details` (
  `id` int(11) NOT NULL,
  `vote_name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `voting_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vote_details`
--

INSERT INTO `vote_details` (`id`, `vote_name`, `description`, `voting_date`, `start_time`, `end_time`, `status`) VALUES
(1, 'Annual Vote', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2020-07-13', '10:00:00', '17:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vote_position`
--

CREATE TABLE `vote_position` (
  `id` int(11) NOT NULL,
  `vote_id` int(11) NOT NULL,
  `position_name` varchar(100) NOT NULL,
  `noc` int(11) NOT NULL,
  `sort_order` tinyint(2) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vote_position`
--

INSERT INTO `vote_position` (`id`, `vote_id`, `position_name`, `noc`, `sort_order`, `status`) VALUES
(1, 1, 'President', 1, 1, 1),
(2, 1, 'Vice President', 2, 2, 1),
(3, 1, 'Executive Secretary', 1, 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `board_members`
--
ALTER TABLE `board_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_board_members_category_id` (`ref_board_members_category_id`);

--
-- Indexes for table `board_members_categories`
--
ALTER TABLE `board_members_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_membership_id_2` (`ref_membership_id`);

--
-- Indexes for table `customusers`
--
ALTER TABLE `customusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_ticket_buyers`
--
ALTER TABLE `event_ticket_buyers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_membership_id` (`ref_membership_id`),
  ADD KEY `ref_event_id` (`ref_event_id`);

--
-- Indexes for table `event_ticket_payments`
--
ALTER TABLE `event_ticket_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_event_id` (`ref_event_id`);

--
-- Indexes for table `memberships`
--
ALTER TABLE `memberships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_type_id` (`user_type_id`);

--
-- Indexes for table `membership_payments`
--
ALTER TABLE `membership_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_membership_id` (`ref_membership_id`);

--
-- Indexes for table `member_devices`
--
ALTER TABLE `member_devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_member_device_membership_id` (`ref_member_device_membership_id`);

--
-- Indexes for table `member_job_infos`
--
ALTER TABLE `member_job_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_member_job_info_membership_id` (`ref_member_job_info_membership_id`);

--
-- Indexes for table `member_personal_infos`
--
ALTER TABLE `member_personal_infos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `member_email_address` (`member_email_address`),
  ADD KEY `ref_member_personal_info_membership_id` (`ref_member_personal_info_membership_id`);

--
-- Indexes for table `memories`
--
ALTER TABLE `memories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UC_Memories` (`memories_name`(255));

--
-- Indexes for table `memories_photos`
--
ALTER TABLE `memories_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_memories_id` (`ref_memories_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sponsors`
--
ALTER TABLE `sponsors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vote_candidate`
--
ALTER TABLE `vote_candidate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vote_id` (`vote_id`),
  ADD KEY `vote_position_id` (`vote_position_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `vote_count`
--
ALTER TABLE `vote_count`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vote_id` (`vote_id`),
  ADD KEY `vote_position_id` (`vote_position_id`),
  ADD KEY `vote_candidate_id` (`vote_candidate_id`),
  ADD KEY `voter_id` (`voter_id`);

--
-- Indexes for table `vote_details`
--
ALTER TABLE `vote_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vote_position`
--
ALTER TABLE `vote_position`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vote_id` (`vote_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `board_members`
--
ALTER TABLE `board_members`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `board_members_categories`
--
ALTER TABLE `board_members_categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customusers`
--
ALTER TABLE `customusers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `event_ticket_buyers`
--
ALTER TABLE `event_ticket_buyers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_ticket_payments`
--
ALTER TABLE `event_ticket_payments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `memberships`
--
ALTER TABLE `memberships`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `membership_payments`
--
ALTER TABLE `membership_payments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `member_devices`
--
ALTER TABLE `member_devices`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `member_job_infos`
--
ALTER TABLE `member_job_infos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `member_personal_infos`
--
ALTER TABLE `member_personal_infos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `memories`
--
ALTER TABLE `memories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `memories_photos`
--
ALTER TABLE `memories_photos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sponsors`
--
ALTER TABLE `sponsors`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vote_candidate`
--
ALTER TABLE `vote_candidate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vote_count`
--
ALTER TABLE `vote_count`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `vote_details`
--
ALTER TABLE `vote_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vote_position`
--
ALTER TABLE `vote_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `board_members`
--
ALTER TABLE `board_members`
  ADD CONSTRAINT `board_members_ibfk_1` FOREIGN KEY (`ref_board_members_category_id`) REFERENCES `board_members_categories` (`id`);

--
-- Constraints for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD CONSTRAINT `contact_us_cons` FOREIGN KEY (`ref_membership_id`) REFERENCES `memberships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_ticket_buyers`
--
ALTER TABLE `event_ticket_buyers`
  ADD CONSTRAINT `event_ticket_buyers_ibfk_1` FOREIGN KEY (`ref_event_id`) REFERENCES `memberships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_ticket_buyers_ibfk_2` FOREIGN KEY (`ref_membership_id`) REFERENCES `memberships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_ticket_payments`
--
ALTER TABLE `event_ticket_payments`
  ADD CONSTRAINT `event_ticket_payments_ibfk_11` FOREIGN KEY (`ref_event_id`) REFERENCES `event_ticket_buyers` (`id`);

--
-- Constraints for table `memberships`
--
ALTER TABLE `memberships`
  ADD CONSTRAINT `user_type_ibfk_1` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `membership_payments`
--
ALTER TABLE `membership_payments`
  ADD CONSTRAINT `membership_payments_ibfk_1` FOREIGN KEY (`ref_membership_id`) REFERENCES `memberships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `member_devices`
--
ALTER TABLE `member_devices`
  ADD CONSTRAINT `member_device_cons` FOREIGN KEY (`ref_member_device_membership_id`) REFERENCES `memberships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `member_job_infos`
--
ALTER TABLE `member_job_infos`
  ADD CONSTRAINT `member_job_infos_ibfk_1` FOREIGN KEY (`ref_member_job_info_membership_id`) REFERENCES `memberships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `member_personal_infos`
--
ALTER TABLE `member_personal_infos`
  ADD CONSTRAINT `member_personal_infos_ibfk_1` FOREIGN KEY (`ref_member_personal_info_membership_id`) REFERENCES `memberships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vote_candidate`
--
ALTER TABLE `vote_candidate`
  ADD CONSTRAINT `vote_candidate_ibfk_1` FOREIGN KEY (`vote_id`) REFERENCES `vote_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vote_candidate_ibfk_2` FOREIGN KEY (`vote_position_id`) REFERENCES `vote_position` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vote_candidate_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `memberships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vote_count`
--
ALTER TABLE `vote_count`
  ADD CONSTRAINT `vote_count_ibfk_1` FOREIGN KEY (`vote_id`) REFERENCES `vote_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vote_count_ibfk_2` FOREIGN KEY (`voter_id`) REFERENCES `memberships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vote_count_ibfk_3` FOREIGN KEY (`vote_position_id`) REFERENCES `vote_position` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vote_count_ibfk_4` FOREIGN KEY (`vote_candidate_id`) REFERENCES `memberships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vote_position`
--
ALTER TABLE `vote_position`
  ADD CONSTRAINT `vote_position_ibfk_1` FOREIGN KEY (`vote_id`) REFERENCES `vote_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
