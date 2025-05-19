-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 19, 2025 at 01:40 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bayanicare_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `barangay_id` int(11) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('official') NOT NULL,
  `office_location` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reset_code` int(11) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `full_name`, `email`, `barangay_id`, `password`, `role`, `office_location`, `position`, `contact_number`, `created_at`, `reset_code`, `avatar`, `address`) VALUES
(14, 'Carlo Ian Quimbo', 'ian.quimbo2004@gmail.com', 1, '$2y$10$VlnCvB4T8ek2FLeqdNJQa.tTFCOQRUE2DMU5JDUT2aMI48BuA6iti', 'official', 'Bukidnon State University', 'Barangay Captain', '4123123123', '2025-05-19 02:56:21', NULL, 'avatars/682a9dd4f16237.18385686.jpg', NULL),
(15, 'Ivan Clifford Quimbo', 'yansem2522@gmail.com', 1, '$2y$10$B9AD8iOiJXPpNU/YX3WTWOkn0/YjwZG7M9eJJcfJCgIvKjIq8GWyG', 'official', 'Bukidnon State University', 'Barangay Secretary', '423423', '2025-05-19 02:57:28', NULL, 'avatars/682a9e1824afe8.52544283.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `barangay_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `barangay_id`, `title`, `content`, `created_at`) VALUES
(15, 1, 'Barangay Clean Up Drive', 'for saving mother earth', '2025-05-19 03:06:09');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `appointment_with` varchar(100) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `message` text DEFAULT NULL,
  `appointment_type` varchar(100) NOT NULL,
  `status` enum('pending','approved','rejected','completed') DEFAULT 'pending',
  `created_at` datetime DEFAULT current_timestamp(),
  `handled_at` datetime DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `user_email`, `appointment_with`, `appointment_date`, `appointment_time`, `message`, `appointment_type`, `status`, `created_at`, `handled_at`, `user_id`) VALUES
(9, 'quimbo.iancarlo@gmail.com', 'captain', '2025-05-23', '14:15:00', '', 'meeting', 'pending', '2025-05-19 11:01:09', NULL, 11);

-- --------------------------------------------------------

--
-- Table structure for table `appointment_status_log`
--

CREATE TABLE `appointment_status_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `appointment_id` int(10) UNSIGNED NOT NULL,
  `changed_by` int(10) UNSIGNED NOT NULL,
  `new_status` varchar(20) NOT NULL,
  `comment` text DEFAULT NULL,
  `change_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barangays`
--

CREATE TABLE `barangays` (
  `barangay_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangays`
--

INSERT INTO `barangays` (`barangay_id`, `name`) VALUES
(1, 'Sumpong'),
(2, 'Casisang'),
(3, 'Kalasungay');

-- --------------------------------------------------------

--
-- Table structure for table `barangay_activities`
--

CREATE TABLE `barangay_activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `barangay_id` int(10) NOT NULL,
  `activity_title` varchar(255) NOT NULL,
  `activity_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barangay_activities`
--

INSERT INTO `barangay_activities` (`id`, `barangay_id`, `activity_title`, `activity_date`, `description`, `location`, `created_by`, `created_at`, `updated_at`) VALUES
(8, 1, 'Libreng Tuli sa Barangay', '2025-05-23', 'Libre Tuli', 'Barangay 6, Covered Court', 13, '2025-05-19 09:24:20', '2025-05-19 09:24:20'),
(9, 1, 'BukSU Enrolment', '2025-07-14', 'For upcoming SY 2025-2026 ', 'Bukidnon State University', 14, '2025-05-19 11:05:19', '2025-05-19 11:05:19');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `complaint_type` varchar(100) NOT NULL,
  `complaint_details` text NOT NULL,
  `incident_date` date NOT NULL,
  `evidence_file` varchar(255) DEFAULT NULL,
  `status` enum('pending','in_progress','resolved','rejected') DEFAULT 'pending',
  `date_submitted` date DEFAULT curdate(),
  `created_at` datetime DEFAULT current_timestamp(),
  `handled_at` datetime DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `user_email`, `complaint_type`, `complaint_details`, `incident_date`, `evidence_file`, `status`, `date_submitted`, `created_at`, `handled_at`, `user_id`) VALUES
(10, NULL, 'robbery', 'robbery was witnessed yesterday around 10:00 pm', '2025-05-18', NULL, 'pending', '2025-05-19', '2025-05-19 11:00:28', NULL, 11);

-- --------------------------------------------------------

--
-- Table structure for table `complaint_status_log`
--

CREATE TABLE `complaint_status_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `complaint_id` int(10) UNSIGNED NOT NULL,
  `changed_by` int(10) UNSIGNED NOT NULL,
  `new_status` varchar(20) NOT NULL,
  `comment` text DEFAULT NULL,
  `change_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`) VALUES
(1, 'How do I update my profile?', 'Go to \"Update Profile\" in the settings menu.'),
(2, 'Who can see my complaints?', 'Only authorized barangay officials have access.'),
(3, 'How do I update my profile?', 'Go to \"Update Profile\" in the settings menu.'),
(4, 'Who can see my complaints?', 'Only authorized barangay officials have access.'),
(5, 'Can I edit or delete a complaint after submission?', 'Once submitted, you may contact the barangay secretary to request changes.'),
(6, 'How do I schedule an appointment?', 'Use the \"Appointments\" section in your dashboard to request a date and time.'),
(7, 'Will I receive a notification for updates?', 'Yes, notifications will appear in your notification panel for status changes.'),
(8, 'What do I do if I forgot my password?', 'Click \"Forgot Password\" on the login page to reset it via your email.'),
(9, 'How do I know if my feedback was received?', 'You will receive a confirmation message after submitting your feedback.'),
(10, 'Who manages the FAQs?', 'The barangay admin or secretary is responsible for updating and managing the FAQs.'),
(11, 'Can I submit a suggestion for improvement?', 'Yes, use the feedback form to submit any ideas or concerns.'),
(12, 'Is my personal information secure?', 'Yes, your data is encrypted and only accessible to authorized personnel.'),
(13, 'How soon will I get a response to my complaint?', 'Response times vary, but most are addressed within 3-5 business days.'),
(14, 'Can I see the status of my complaint?', 'Yes, you can check it in the \"Complaints\" section of your dashboard.');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `households`
--

CREATE TABLE `households` (
  `householdId` int(10) UNSIGNED NOT NULL,
  `family_members` int(11) NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `seniors` int(11) DEFAULT 0,
  `children` int(11) DEFAULT 0,
  `pwds` int(11) DEFAULT 0,
  `date_added` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `households`
--

INSERT INTO `households` (`householdId`, `family_members`, `id`, `seniors`, `children`, `pwds`, `date_added`) VALUES
(5, 5, 11, 1, 3, 0, '2025-05-19 11:01:52');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `message`, `icon`, `created_at`, `is_read`) VALUES
(3, 0, 'New announcement posted: Clean Up Drive', 'fa-bullhorn', '2025-05-05 19:37:24', 0),
(4, 1, 'New announcement posted: \"Libreng Konsulta: Medical and Dental Mission sa Barangay Hall\"', 'fa-bullhorn', '2025-05-16 09:12:06', 0),
(5, 5, 'New announcement posted: \"Libreng Konsulta: Medical and Dental Mission sa Barangay Hall\"', 'fa-bullhorn', '2025-05-16 09:12:06', 0),
(6, 1, 'New announcement posted: \"Youth Sports Fest 2025: Paligsahan ng Kabataan!\"', 'fa-bullhorn', '2025-05-16 09:12:19', 0),
(7, 5, 'New announcement posted: \"Youth Sports Fest 2025: Paligsahan ng Kabataan!\"', 'fa-bullhorn', '2025-05-16 09:12:19', 0),
(8, 1, 'New announcement posted: \"Barangay Assembly Day: Sama-sama sa Pagpaplano ng Kinabukasan\"', 'fa-bullhorn', '2025-05-16 09:12:32', 0),
(9, 5, 'New announcement posted: \"Barangay Assembly Day: Sama-sama sa Pagpaplano ng Kinabukasan\"', 'fa-bullhorn', '2025-05-16 09:12:32', 0),
(10, 1, 'New announcement posted: \"Alerto Barangay: Iwas Sunog at Sakuna Seminar\"', 'fa-bullhorn', '2025-05-16 09:12:42', 0),
(11, 5, 'New announcement posted: \"Alerto Barangay: Iwas Sunog at Sakuna Seminar\"', 'fa-bullhorn', '2025-05-16 09:12:42', 0),
(12, 1, 'New announcement posted: \"Barangay Cleanup Drive: Sama-Samang Linisin ang Ating Komunidad!\"', 'fa-bullhorn', '2025-05-16 09:13:17', 0),
(13, 5, 'New announcement posted: \"Barangay Cleanup Drive: Sama-Samang Linisin ang Ating Komunidad!\"', 'fa-bullhorn', '2025-05-16 09:13:17', 0),
(14, 1, 'New announcement posted: \"Barangay Cleanup Drive: Sama-Samang Linisin ang Ating Komunidad!\"', 'fa-bullhorn', '2025-05-16 09:18:31', 0),
(15, 5, 'New announcement posted: \"Barangay Cleanup Drive: Sama-Samang Linisin ang Ating Komunidad!\"', 'fa-bullhorn', '2025-05-16 09:18:31', 0),
(16, 1, 'New announcement posted: \"Barangay Cleanup Drive: Sama-Samang Linisin ang Ating Komunidad!\"', 'fa-bullhorn', '2025-05-16 09:24:13', 0),
(17, 5, 'New announcement posted: \"Barangay Cleanup Drive: Sama-Samang Linisin ang Ating Komunidad!\"', 'fa-bullhorn', '2025-05-16 09:24:13', 0),
(18, 1, 'New announcement posted: \"Barangay Cleanup Drive: Sama-Samang Linisin ang Ating Komunidad!\"', 'fa-bullhorn', '2025-05-16 09:27:51', 0),
(19, 5, 'New announcement posted: \"Barangay Cleanup Drive: Sama-Samang Linisin ang Ating Komunidad!\"', 'fa-bullhorn', '2025-05-16 09:27:51', 0),
(20, 11, 'New announcement posted: Barangay Clean Up Drive', 'fa-bullhorn', '2025-05-19 11:06:09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `barangay_id` int(11) UNSIGNED DEFAULT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  `budget` decimal(10,2) DEFAULT NULL,
  `amount_spent` decimal(10,2) DEFAULT NULL,
  `status` enum('Planning','Ongoing','Completed') DEFAULT 'Planning',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `barangay_id`, `project_name`, `budget`, `amount_spent`, `status`, `start_date`, `end_date`, `description`, `created_at`) VALUES
(2, 1, 'Barangay Center', 1500000.00, 0.00, 'Ongoing', '2025-05-19', '2026-12-01', 'hehefasfasfansfjbaksfjaksjbfnajksnf asnf a,sfn las', '2025-05-19 01:22:40'),
(3, 1, 'Barangay Covered Court', 4999999.99, 4500000.00, 'Completed', '2025-05-30', '2027-02-01', 'For meeting and such purposes', '2025-05-19 03:11:40');

-- --------------------------------------------------------

--
-- Table structure for table `service_requests`
--

CREATE TABLE `service_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `service_type` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `supporting_document` varchar(255) DEFAULT NULL,
  `preferred_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `document` varchar(255) DEFAULT NULL,
  `handled_at` datetime DEFAULT NULL,
  `document_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_requests`
--

INSERT INTO `service_requests` (`id`, `user_id`, `service_type`, `description`, `supporting_document`, `preferred_date`, `created_at`, `status`, `document`, `handled_at`, `document_path`) VALUES
(13, 11, 'certificate', 'Request for certificate of indigency', NULL, '2025-05-21', '2025-05-19 10:59:04', 'approved', 'uploads/documents/request_13_1747624201.docx', '2025-05-19 11:10:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_request_status_log`
--

CREATE TABLE `service_request_status_log` (
  `id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `changed_by` int(11) NOT NULL,
  `old_status` varchar(50) DEFAULT NULL,
  `new_status` varchar(50) DEFAULT NULL,
  `change_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_request_status_log`
--

INSERT INTO `service_request_status_log` (`id`, `request_id`, `changed_by`, `old_status`, `new_status`, `change_time`, `notes`, `comment`) VALUES
(23, 13, 15, NULL, 'approved', '2025-05-19 03:10:01', NULL, 'this is approved');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `barangay_id` int(10) UNSIGNED DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('resident','official') NOT NULL,
  `address` text DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `reset_code` varchar(100) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `barangay_id`, `password`, `role`, `address`, `contact_number`, `created_at`, `reset_code`, `avatar`) VALUES
(11, 'Ian Carlo Quimbo', 'quimbo.iancarlo@gmail.com', 1, '$2y$10$T/qi6/pVZD0b8Y2Kt9oATOiNPGXY7FEQyYsaB6ziMNfuq1FBlCJGe', 'resident', 'Kihare, House Number 713', '09659412324', '2025-05-19 10:54:16', NULL, 'avatars/682a9d58887547.35962750.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_appointment_user` (`user_id`);

--
-- Indexes for table `appointment_status_log`
--
ALTER TABLE `appointment_status_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointment_id` (`appointment_id`),
  ADD KEY `changed_by` (`changed_by`);

--
-- Indexes for table `barangays`
--
ALTER TABLE `barangays`
  ADD PRIMARY KEY (`barangay_id`);

--
-- Indexes for table `barangay_activities`
--
ALTER TABLE `barangay_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_complaint_user` (`user_id`);

--
-- Indexes for table `complaint_status_log`
--
ALTER TABLE `complaint_status_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaint_id` (`complaint_id`),
  ADD KEY `changed_by` (`changed_by`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `households`
--
ALTER TABLE `households`
  ADD PRIMARY KEY (`householdId`),
  ADD KEY `fk_household_user` (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barangay_id` (`barangay_id`);

--
-- Indexes for table `service_requests`
--
ALTER TABLE `service_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `service_request_status_log`
--
ALTER TABLE `service_request_status_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `appointment_status_log`
--
ALTER TABLE `appointment_status_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `barangays`
--
ALTER TABLE `barangays`
  MODIFY `barangay_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `barangay_activities`
--
ALTER TABLE `barangay_activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `complaint_status_log`
--
ALTER TABLE `complaint_status_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `households`
--
ALTER TABLE `households`
  MODIFY `householdId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service_requests`
--
ALTER TABLE `service_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `service_request_status_log`
--
ALTER TABLE `service_request_status_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `fk_appointment_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `appointment_status_log`
--
ALTER TABLE `appointment_status_log`
  ADD CONSTRAINT `appointment_status_log_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`),
  ADD CONSTRAINT `appointment_status_log_ibfk_2` FOREIGN KEY (`changed_by`) REFERENCES `admins` (`id`);

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `fk_complaint_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `complaint_status_log`
--
ALTER TABLE `complaint_status_log`
  ADD CONSTRAINT `complaint_status_log_ibfk_1` FOREIGN KEY (`complaint_id`) REFERENCES `complaints` (`id`),
  ADD CONSTRAINT `complaint_status_log_ibfk_2` FOREIGN KEY (`changed_by`) REFERENCES `admins` (`id`);

--
-- Constraints for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `households`
--
ALTER TABLE `households`
  ADD CONSTRAINT `fk_household_user` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`barangay_id`) REFERENCES `barangays` (`barangay_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `service_requests`
--
ALTER TABLE `service_requests`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
