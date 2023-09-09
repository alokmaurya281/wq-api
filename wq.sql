-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2023 at 12:31 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wq`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignment_submitted`
--

CREATE TABLE `assignment_submitted` (
  `id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `completed_lectures`
--

CREATE TABLE `completed_lectures` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `lecture_id` int(11) NOT NULL,
  `completed_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `completed_lectures`
--

INSERT INTO `completed_lectures` (`id`, `course_id`, `lecture_id`, `completed_on`, `created_at`, `updated_at`) VALUES
(1, 39, 1, '2022-11-20 09:27:55', '2022-11-20 09:27:55', '2022-11-20 09:27:55'),
(2, 6, 5, '2022-11-20 09:33:23', '2022-11-20 09:33:23', '2022-11-20 09:33:23'),
(3, 6, 4, '2022-11-20 09:33:33', '2022-11-20 09:33:33', '2022-11-20 09:33:33');

-- --------------------------------------------------------

--
-- Table structure for table `coupans`
--

CREATE TABLE `coupans` (
  `id` int(11) NOT NULL,
  `coupan` varchar(100) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_used` int(11) DEFAULT 0,
  `discount_amount` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coupans`
--

INSERT INTO `coupans` (`id`, `coupan`, `expiry_date`, `created_at`, `total_used`, `discount_amount`) VALUES
(1, 'FIRST100', '2022-11-30', '2022-10-10 13:49:09', 0, 500),
(2, 'FIRST1000', '2022-11-30', '2022-10-10 13:49:09', 0, 300);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_name` varchar(111) DEFAULT NULL,
  `course_short_description` text DEFAULT NULL,
  `course_long_description` text DEFAULT NULL,
  `course_language` varchar(111) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `course_feature_image` varchar(1000) DEFAULT NULL,
  `course_feature_video` varchar(1000) DEFAULT NULL,
  `level_of_course` varchar(100) DEFAULT NULL,
  `course_motive_id` int(11) DEFAULT NULL,
  `course_welcome_message` text DEFAULT NULL,
  `course_complete_message` text DEFAULT NULL,
  `teacher_id` int(11) NOT NULL,
  `course_material_id` int(11) DEFAULT NULL,
  `course_aim_id` int(11) DEFAULT NULL,
  `course_requirement_id` int(11) DEFAULT NULL,
  `course_project_id` int(11) DEFAULT NULL,
  `total_lectures` int(11) DEFAULT NULL,
  `total_hours_lectures` int(11) DEFAULT NULL,
  `total_enrolled_students` int(11) DEFAULT NULL,
  `course_price` varchar(100) NOT NULL DEFAULT '0.00',
  `status` varchar(100) NOT NULL DEFAULT 'Pending',
  `course_saved_in` varchar(100) NOT NULL DEFAULT 'Draft',
  `is_published` enum('1','0') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `course_short_description`, `course_long_description`, `course_language`, `category_id`, `course_feature_image`, `course_feature_video`, `level_of_course`, `course_motive_id`, `course_welcome_message`, `course_complete_message`, `teacher_id`, `course_material_id`, `course_aim_id`, `course_requirement_id`, `course_project_id`, `total_lectures`, `total_hours_lectures`, `total_enrolled_students`, `course_price`, `status`, `course_saved_in`, `is_published`, `created_at`, `updated_at`) VALUES
(1, 'Python', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'En', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Pending', 'Draft', NULL, '2022-09-23 09:22:23', '2022-09-23 09:22:23'),
(2, 'Python for Beginners', 'Wow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow Great', 'Wow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow Great', 'English', 4, 'files/course_feature_images/FXVym8Jhibkc50VQmAUvEOULPwYnyQrv0Nq2RMdU.png', NULL, 'Beginner', NULL, 'Wow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow Great', 'Wow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow GreatWow Great', 0, NULL, NULL, NULL, 3, 20, 60, 5, '999', 'Pending', 'Draft', NULL, '2022-09-23 09:28:17', '2022-09-23 09:28:17'),
(3, 'Python', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'En', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Pending', 'Draft', NULL, '2022-09-23 09:37:45', '2022-09-23 09:37:45'),
(4, 'Python', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'En', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Pending', 'Draft', NULL, '2022-09-23 09:43:30', '2022-09-23 09:43:30'),
(5, 'Python', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'En', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Pending', 'Draft', NULL, '2022-09-23 09:46:02', '2022-09-23 09:46:02'),
(6, 'Python', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'En', 1, '{\"name\":\"download (2).jpg\",\"full_path\":\"download (2).jpg\",\"type\":\"image\\/jpeg\",\"tmp_name\":\"C:\\\\xampp\\\\tmp\\\\phpBC41.tmp\",\"error\":0,\"size\":2123}', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'Pending', 'Draft', NULL, '2022-09-23 09:46:36', '2022-09-23 09:46:36'),
(7, 'Python', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'En', 1, 'files/course_feature_images/vNas8zkAXmt1XPiodemTAWxFTz3cPUCmbZJ3JMw5.png', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', '0', '2022-09-23 09:49:23', '2022-09-23 09:49:23'),
(8, 'Python', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'En', 1, 'files/course_feature_images/lSP65NZFTsWKfQUgPCIQKlZvf9gKERAlFX3W4fR4.png', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', '0', '2022-09-23 09:51:05', '2022-09-23 09:51:05'),
(9, 'Python', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'En', 1, 'files/course_feature_images//bSIAzeO9ij7cXg4pZBZe61IJNfKqq87Au5JYwWym.jpg', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', '0', '2022-09-23 09:51:40', '2022-09-23 09:51:40'),
(10, 'Python', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'En', 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', '0', '2022-09-23 10:01:33', '2022-09-23 10:01:33'),
(11, 'Python', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'En', 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', '0', '2022-09-23 10:03:11', '2022-09-23 10:03:11'),
(12, 'Python', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'En', 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', '0', '2022-09-23 10:04:43', '2022-09-23 10:04:43'),
(13, 'Python', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'En', 1, 'C:\\xampp\\tmp\\php90A0.tmp', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', '0', '2022-09-23 10:05:05', '2022-09-23 10:05:05'),
(14, 'Python', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'En', 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', '0', '2022-09-23 10:15:10', '2022-09-23 10:15:10'),
(15, 'Python', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'En', 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', '0', '2022-09-23 10:23:17', '2022-09-23 10:23:17'),
(16, 'Python', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem', 'En', 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', '0', '2022-09-23 10:24:42', '2022-09-23 10:24:42'),
(17, 'Python1', 'wow', 'wow', 'en', 1, 'public/files/course_feature_images/py18acTRfQW0eXL7JaQzCpdwL8EK3OZC6n89b0W5.jpg', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'Pending', 'Draft', '0', '2022-09-23 11:05:49', '2022-09-23 11:05:49'),
(18, 'Python1', 'wow', 'wow', 'en', 1, 'public/files/course_feature_images/IOcZm33WfpllATSVjTvX73EXy1uNCUHjl0s5qzov.jpg', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 5, 10, NULL, '0', 'Pending', 'Draft', '0', '2022-09-23 11:13:58', '2022-09-23 11:13:58'),
(19, 'Full Stack Development', 'A full stack web developer is a person who can develop both client and server software. In addition to mastering HTML and CSS, he/she also knows how to: Program a browser (like using JavaScript, jQuery, Angular, or Vue) Program a server (like using PHP, ASP, Python, or Node)', 'A full stack web developer is a person who can develop both client and server software. In addition to mastering HTML and CSS, he/she also knows how to: Program a browser (like using JavaScript, jQuery, Angular, or Vue) Program a server (like using PHP, ASP, Python, or Node)A full stack web developer is a person who can develop both client and server software. In addition to mastering HTML and CSS, he/she also knows how to: Program a browser (like using JavaScript, jQuery, Angular, or Vue) Program a server (like using PHP, ASP, Python, or Node)A full stack web developer is a person who can develop both client and server software. In addition to mastering HTML and CSS, he/she also knows how to: Program a browser (like using JavaScript, jQuery, Angular, or Vue) Program a server (like using PHP, ASP, Python, or Node)', 'en', 1, 'public/files/course_feature_images/GJSmxiSSTvXlUKBTlj6B5e871qWPrBp1cUaajyad.jpg', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 5, 10, NULL, '0', 'Pending', 'Draft', '0', '2022-09-23 11:15:23', '2022-09-23 11:15:23'),
(20, 'python', 'Chapter 1 Introduction', 'NiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOC', 'English', 2, 'course_feature_images/nVvNNRuu2yrvC0VdfBeu3mfL0846Futne2mUwFWu.jpg', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', NULL, '2022-09-24 16:10:59', '2022-09-24 16:10:59'),
(21, 'python', 'Chapter 1 Introduction', 'NiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOC', 'English', 2, 'public/files/course_feature_images/S7qTKf4eilRcYO6Fd2h42iwGzUxcppBZcWyOeqlI.jpg', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', NULL, '2022-09-25 06:01:40', '2022-09-25 06:01:40'),
(22, 'python', 'Chapter 1 Introduction', 'NiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOC', 'English', 2, 'files/course_feature_image/ALOK IMAGE.jpg', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', NULL, '2022-09-25 06:02:30', '2022-09-25 06:02:30'),
(23, 'python', 'Chapter 1 Introduction', 'NiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOC', 'English', 2, 'files/course_feature_image/ALOK IMAGE.jpg', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', NULL, '2022-09-25 06:05:57', '2022-09-25 06:05:57'),
(24, 'python', 'Chapter 1 Introduction', 'NiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOC', 'English', 2, 'files/course_feature_image/ALOK IMAGE.jpg', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', NULL, '2022-09-25 06:09:42', '2022-09-25 06:09:42'),
(25, 'python', 'Chapter 1 Introduction', 'NiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOC', 'English', 2, 'files/course_feature_images/BWFTd2taQ5tsp4m78lXaN6n9RGKI3KOZ2u9LYny8.jpg', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', NULL, '2022-09-25 06:11:29', '2022-09-25 06:11:29'),
(26, 'python', 'Chapter 1 Introduction', 'NiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOC', 'English', 2, 'files/course_feature_images/G1g5HYuFJrKzvk8qEX6NMSu2UuInjINwD15v32Oa.jpg', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', NULL, '2022-09-25 06:13:00', '2022-09-25 06:13:00'),
(27, 'python', 'Chapter 1 Introduction', 'NiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOC', 'English', 2, 'files/course_feature_images/EyjNaWqMHO13n5QC44h6rXmD17U0yZzrlykAl7iK.jpg', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', NULL, '2022-09-25 11:16:16', '2022-09-25 11:16:16'),
(28, 'python', 'Chapter 1 Introduction', 'NiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOC', 'English', 2, 'files/course_feature_images/aVbk8jiWZHGW2DtsVhfvUWwUCtkkwrIPQdDaVw3O.jpg', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', NULL, '2022-09-25 11:37:05', '2022-09-25 11:37:05'),
(29, 'python', 'Chapter 1 Introduction', 'NiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOC', 'English', 2, 'files/course_feature_images/nr2Lss5OHJjrp0WHLaGi6jpoXVRnC7W8zy8N3vlh.pdf', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', NULL, '2022-09-25 11:37:15', '2022-09-25 11:37:15'),
(30, 'Html For Beginners', '|mimes:png,jpg,jpeg,gif,svg|max:2048', '|mimes:png,jpg,jpeg,gif,svg|max:2048|mimes:png,jpg,jpeg,gif,svg|max:2048|mimes:png,jpg,jpeg,gif,svg|max:2048|mimes:png,jpg,jpeg,gif,svg|max:2048|mimes:png,jpg,jpeg,gif,svg|max:2048|mimes:png,jpg,jpeg,gif,svg|max:2048|mimes:png,jpg,jpeg,gif,svg|max:2048|mimes:png,jpg,jpeg,gif,svg|max:2048|mimes:png,jpg,jpeg,gif,svg|max:2048|mimes:png,jpg,jpeg,gif,svg|max:2048|mimes:png,jpg,jpeg,gif,svg|max:2048|mimes:png,jpg,jpeg,gif,svg|max:2048', 'English', 3, 'files/course_feature_images/MuZZfhJ1u6PSpyU3UAVbtg1nqd9MLZAPFHV7i44O.jpg', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', NULL, '2022-09-25 11:47:39', '2022-09-25 11:47:39'),
(31, 'Nice', 'Wow', 'Nice', 'English', 4, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', NULL, '2022-09-30 18:39:48', '2022-09-30 18:39:48'),
(32, 'Artificial Intelligence For Beginners', 'What is the artificial intelligence?\r\nWhat is artificial intelligence? Artificial intelligence (AI) is the ability of a computer or a robot controlled by a computer to do tasks that are usually done by humans because they require human intelligence and discernment.', 'What is the artificial intelligence?\r\nWhat is artificial intelligence? Artificial intelligence (AI) is the ability of a computer or a robot controlled by a computer to do tasks that are usually done by humans because they require human intelligence and discernment.What is the artificial intelligence?\r\nWhat is artificial intelligence? Artificial intelligence (AI) is the ability of a computer or a robot controlled by a computer to do tasks that are usually done by humans because they require human intelligence and discernment.What is the artificial intelligence?\r\nWhat is artificial intelligence? Artificial intelligence (AI) is the ability of a computer or a robot controlled by a computer to do tasks that are usually done by humans because they require human intelligence and discernment.What is the artificial intelligence?\r\nWhat is artificial intelligence? Artificial intelligence (AI) is the ability of a computer or a robot controlled by a computer to do tasks that are usually done by humans because they require human intelligence and discernment.', 'English', 4, 'files/course_feature_images/EdyJQ1BTCAKlOGrsoKoV6Td6ad6S3HPCgDt2XkFu.jpg', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', NULL, '2022-10-02 13:54:20', '2022-10-02 13:54:20'),
(33, 'Artificial Intelligence For Beginners', 'create-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-course', 'create-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-course', 'English', 4, 'files/course_feature_images/nQWDHVxb6aEfEGRWG0lD3So09rhBaUPKwSY0rfKh.jpg', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', NULL, '2022-10-02 14:30:26', '2022-10-02 14:30:26'),
(34, 'new', 'new', 'sever', 'English', 2, 'files/course_feature_images/ws2de7DM9XQMd27BMvHYiBufLOhFwSa7wT83LJJb.jpg', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', NULL, '2022-10-02 14:37:25', '2022-10-02 14:37:25'),
(35, 'new', 'new', 'sever', 'English', 2, 'files/course_feature_images/ygO2iplqtB8tOp1tjrHKdEq7FaDro51YwVPG9bTp.jpg', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', NULL, '2022-10-02 14:39:35', '2022-10-02 14:39:35'),
(36, 'new', 'new', 'sever', 'English', 2, 'files/course_feature_images/gqsU4jck53G46Io9mUWs1OZIUOxprponHgztZRg4.jpg', NULL, NULL, 2, NULL, NULL, 2, NULL, 2, 2, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', NULL, '2022-10-02 14:40:49', '2022-10-02 14:40:49'),
(37, 'Artificial Intelligence For Beginners', 'create-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-course', 'create-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-coursecreate-course', 'English', 4, 'files/course_feature_images/HPEYQqKYcuk1a7H5sptwUdO2nS6uX0Lx289tLJdQ.jpg', NULL, NULL, 3, NULL, NULL, 2, NULL, 3, 3, NULL, NULL, NULL, 1, '999', 'Pending', 'Draft', NULL, '2022-10-02 14:41:11', '2022-10-02 14:41:11'),
(38, 'Artificial Intelligence For Inter', 'wowwowwowwowwowwowwowwowwowwowwowwowwowwowwow', 'nicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenice', 'Hindi', 3, 'files/course_feature_images/lJqkwr7JvCJTMNhonzUwfFAwNAlCkKdpSuMhX8JE.jpg', NULL, 'Beginner', 4, 'wowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwowwow', 'wowwowwowwowwowwowwowwowwowwowwowwowwowwowwow', 2, NULL, 4, 4, NULL, 9, 4, NULL, '999', 'Pending', 'Draft', NULL, '2022-10-04 10:15:16', '2022-10-04 10:15:16'),
(39, 'The Python Mega Course: Build 10 Real World Applications', 'Become a Python programmer by learning how to build any Python program from scratch, GUIs, web apps, APIs, and more.', 'What does this course cover?\r\n\r\nThe course is exclusively targeted at people who have not programmed before. Therefore, you will learn every programming concept in the context of real-life programming examples by building real-world programs. That way, you will learn the syntax of the language but also understand the logic behind the programming process so you can create your own Python programs. In addition, you will learn both how to write programs but also how to deploy them to live servers and create executable versions that run independently on any computer. The course covers everything from A to Z.\r\n\r\nSome people have complained the content is outdated. Is this true?\r\n\r\nSome videos are old, but the code in those videos still works with the current Python 3.10 version. Whenever a video is affected by a new Python release, that video is updated with a new one.\r\n\r\nWill I be able to find a job after completing this course?\r\nMany students have found a job after taking the course. However, note that simply watching the videos is not sufficient. Besides the videos, you should take all the exercises, plus experiment with the code on your computer by changing it and trying to improve the programs we build. That will give you the skills to write programs independently.\r\n\r\nIs this course for beginners?\r\nYes. This course assumes you have no previous knowledge of programming. Whenever a new programming term emerges in the lectures, we will first explain it academically. Then we use it practically in a real-world code example and reuse it in exercises until you learn everything by heart.\r\n\r\nI know Python basics. Is this course for me?\r\nYes. The first 12 sections of the course cover Python basics. The other 27 sections cover intermediate and advanced Python, and you can jump right into those sections if you know the basics.\r\n\r\nWhat are the ten applications that students will build?\r\nThe ten apps covered in the course are: (1) A volcano web map generator, (2) an object detector app that detects moving objects from your computer live webcam, (3) a personal website built with Python and Flask, (4) a book inventory desktop GUI app that has an SQL database backend, (5) a data analysis and visualization dashboard that processes thousands of data records, (6) a mobile app that runs on Android and iOS devices, (7) a program that scrapes data from multiple webpages containing listings of real estate properties for sale, (8) a web app that collects users’ data via a form and sends users emails, (9) a blog and a translator web app with Django, and (10) a web app that processes Excel files and lets users download the processed files.\r\n\r\nCan students use the apps to build their own portfolios?\r\nYes, you can publish the apps in your own GitHub account. However, I recommend changing or adding something to the app to make it unique and reflect your own work. There is always something to improve and new features to add. Changing or adding something new will also immensely help your learning.\r\n\r\nHow often is the course updated?\r\nIf the code in a video does not work because a new version of Python is released or a new version of a Python third-party package breaks the current code, that video is immediately updated with a new one.\r\n\r\nHow much time will I need to complete the course?\r\nIt is recommended to watch 30 minutes of video content per day, followed by two hours of independent work and exercise activities provided along with the videos. The course has 33 hours of video, so it might take around three months to complete it, considering you study five days a week. If you want to speed up the process, I recommend watching up to 1 hour of content, but not more, followed by 4 hours of independent work and exercises.\r\n\r\nWhat if I get stuck?\r\nYou can drop a question in the Q&A, and the instructor or the teaching assistant will answer your questions. You can also use the chat in the course Discord server to ask questions and chat with fellow students about Python.\r\n\r\nWhat if I don’t like the course?\r\nThat will likely not happen. But, if it does, you are covered by the Udemy 30-day money-back guarantee, so you can quickly return the course. No questions asked.\r\n\r\nDoes this course cover Python 2 or Python 3?\r\nPython 3.\r\n\r\nWhat IDE/editor is used in the course?\r\nWe will use Visual Studio Code in the course. However, many students prefer to use PyCharm, Atom, or other IDEs and that is perfectly fine.\r\n\r\nDo I need Windows, Mac, or Linux to take the course?\r\nThe operating system does not matter. The code covered in the videos will work 100% the same in all operating systems.\r\n\r\nDoes the course expire?\r\nNo. Once you buy the course, it is yours. You will get all future updates for free as well.', 'English', 4, 'files/course_feature_images/xdLzIWkyiDT8vLqY1FMkgqTp48GQR6YO0CvMr9qS.jpg', NULL, NULL, 5, NULL, NULL, 2, NULL, 5, 5, NULL, 70, 50, 300, '0.00', 'Pending', 'Draft', NULL, '2022-10-06 05:59:35', '2022-10-06 05:59:35'),
(40, 'Html For Beginners', 'The HyperText Markup Language or HTML is the standard markup language for documents designed to be displayed in a web browser. It can be assisted by technologies such as Cascading Style Sheets and scripting languages such as JavaScript', 'The HyperText Markup Language or HTML is the standard markup language for documents designed to be displayed in a web browser. It can be assisted by technologies such as Cascading Style Sheets and scripting languages such as JavaScriptThe HyperText Markup Language or HTML is the standard markup language for documents designed to be displayed in a web browser. It can be assisted by technologies such as Cascading Style Sheets and scripting languages such as JavaScriptThe HyperText Markup Language or HTML is the standard markup language for documents designed to be displayed in a web browser. It can be assisted by technologies such as Cascading Style Sheets and scripting languages such as JavaScriptThe HyperText Markup Language or HTML is the standard markup language for documents designed to be displayed in a web browser. It can be assisted by technologies such as Cascading Style Sheets and scripting languages such as JavaScriptThe HyperText Markup Language or HTML is the standard markup language for documents designed to be displayed in a web browser. It can be assisted by technologies such as Cascading Style Sheets and scripting languages such as JavaScriptThe HyperText Markup Language or HTML is the standard markup language for documents designed to be displayed in a web browser. It can be assisted by technologies such as Cascading Style Sheets and scripting languages such as JavaScriptThe HyperText Markup Language or HTML is the standard markup language for documents designed to be displayed in a web browser. It can be assisted by technologies such as Cascading Style Sheets and scripting languages such as JavaScript', 'English', 1, 'files/course_feature_images/A5zyZbZLHRcti8q5BVVikF340HBQ6pCQNGg0LzZT.jpg', NULL, NULL, 6, NULL, NULL, 2, NULL, 6, 6, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', NULL, '2022-10-07 16:09:34', '2022-10-07 16:09:34'),
(41, 'pythons is a good', 'nice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice view', 'nice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice viewnice view', 'English', 4, 'files/course_feature_images/30PPp4n7zfaKU7HBMnabhpthzoB1xISrClbK5Sq9.jpg', NULL, NULL, 7, NULL, NULL, 2, NULL, 7, 7, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', NULL, '2022-10-20 05:59:57', '2022-10-20 05:59:57'),
(42, 'HTML and CSS for Beginners - Build a Website & Launch ONLINE', 'HTML and CSS for Beginners course will give your all the knowledge you need to master HTML and CSS easily and quickly.\r\nThis step-by-step HTML and CSS course will help you learn coding fast and with an instructor that really cares about his students.\r\n\r\nLearning to code will help you make more money in your job, or even find a better job, or better yet, get a nice job as a web developer.\r\n\r\nHTML and CSS are the foundations you need to get into any programming language.', 'Certification after course completion\r\n\r\nAlways adding new lectures\r\n\r\nHave you ever wanted to learn HTML and CSS but thought it was too hard or did not have time or money?\r\n\r\nThis step-by-step HTML and CSS course will help you learn coding fast and with an instructor that really cares about his students.\r\n\r\nLearning to code will help you make more money in your job, or even find a better job, or better yet, get a nice job as a web developer.\r\n\r\nHTML and CSS are the foundations you need to get into any programming language.\r\n\r\n\r\n\r\nEverything new is hard but programming doesn\'t have to be. Learning HTML and CSS is the first stepping stone you need to start programming . This course was created with a dummy approach, meaning even people with difficulty learning technology will learn. I also guaranteed that even small kids can learn its material. You will feel like you are beside me when taking the lecture, we will be buddies until the end of this course and even after. After this course, you will have a good understanding of HTML and CSS and will be able to start your journey into the beautiful world of programming.\r\n\r\nWhat are you waiting for? Every minute you let by is money and opportunities that are passing you by. Don\'t put it off anymore and get the knowledge your need to succeed today.\r\n\r\n\r\n\r\nEnroll today and begin your Adventure into becoming a code ninja with your Sensei Instructor Edwin Diaz.', 'English', 2, 'files/course_feature_images/0PtVwP6nPdM2YV1btZMoXJVUh7mdIPuzS8fz5p7P.jpg', NULL, NULL, 8, NULL, NULL, 2, NULL, 8, 8, NULL, NULL, NULL, NULL, '0.00', 'Pending', 'Draft', NULL, '2022-11-04 06:54:54', '2022-11-04 06:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `course_aim`
--

CREATE TABLE `course_aim` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `course_aim` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_aim`
--

INSERT INTO `course_aim` (`id`, `course_id`, `course_aim`, `created_at`, `updated_at`) VALUES
(1, 35, NULL, '2022-10-02 14:39:35', '2022-10-02 14:39:35'),
(2, 36, NULL, '2022-10-02 14:40:49', '2022-10-02 14:40:49'),
(3, 37, 'h', '2022-10-02 15:15:13', '2022-10-02 14:41:11'),
(4, 38, NULL, '2022-10-04 10:15:16', '2022-10-04 10:15:16'),
(5, 39, NULL, '2022-10-06 05:59:35', '2022-10-06 05:59:35'),
(6, 40, 'Web Development', '2022-10-07 16:10:07', '2022-10-07 16:09:34'),
(7, 41, 'concepts and the fact', '2022-10-20 06:02:48', '2022-10-20 05:59:57'),
(8, 42, 'Total beginners,Any person wishing to learn coding Any person that want to edit their website Any person looking for a second income online, Any Student looking for quick way to learn HTML & CSS should take this course', '2022-11-04 06:56:45', '2022-11-04 06:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `course_assignments`
--

CREATE TABLE `course_assignments` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `lecture_id` int(11) NOT NULL,
  `assignment_no` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_assignments`
--

INSERT INTO `course_assignments` (`id`, `course_id`, `lecture_id`, `assignment_no`, `created_at`, `updated_at`) VALUES
(1, 6, 15, 2, '2022-10-04 18:09:51', '2022-10-04 18:09:51'),
(2, 6, 16, 2, '2022-10-04 18:12:08', '2022-10-04 18:12:08'),
(3, 6, 17, 2, '2022-10-04 18:12:54', '2022-10-04 18:12:54'),
(4, 6, 18, 2, '2022-10-04 18:14:11', '2022-10-04 18:14:11'),
(5, 6, 19, 2, '2022-10-04 18:15:02', '2022-10-04 18:15:02'),
(6, 6, 20, 2, '2022-10-04 18:17:42', '2022-10-04 18:17:42'),
(7, 6, 21, 1, '2022-10-04 18:41:44', '2022-10-04 18:41:44'),
(8, 6, 22, 1, '2022-10-04 18:44:15', '2022-10-04 18:44:15'),
(9, 6, 23, 1, '2022-10-04 18:45:03', '2022-10-04 18:45:03'),
(10, 6, 24, 1, '2022-10-04 18:46:40', '2022-10-04 18:46:40'),
(11, 6, 25, 1, '2022-10-04 18:47:23', '2022-10-04 18:47:23'),
(12, 6, 26, 2, '2022-10-04 19:06:55', '2022-10-04 19:06:55'),
(13, 6, 27, 2, '2022-10-04 19:08:22', '2022-10-04 19:08:22'),
(14, 6, 28, 1, '2022-10-04 19:09:48', '2022-10-04 19:09:48'),
(15, 6, 29, 1, '2022-10-04 19:13:29', '2022-10-04 19:13:29'),
(16, 6, 4, 1, '2022-10-04 19:37:25', '2022-10-04 19:37:25'),
(17, 6, 5, 1, '2022-10-04 19:38:23', '2022-10-04 19:38:23'),
(18, 6, 32, 1, '2022-10-04 19:39:12', '2022-10-04 19:39:12'),
(19, 6, 33, 1, '2022-10-04 19:39:42', '2022-10-04 19:39:42'),
(20, 6, 34, 1, '2022-10-04 19:41:40', '2022-10-04 19:41:40'),
(21, 6, 35, 1, '2022-10-04 19:42:05', '2022-10-04 19:42:05'),
(22, 6, 36, 1, '2022-10-04 19:43:03', '2022-10-04 19:43:03'),
(23, 6, 37, 1, '2022-10-05 03:12:58', '2022-10-05 03:12:58'),
(24, 6, 38, 2, '2022-10-05 04:13:11', '2022-10-05 04:13:11'),
(25, 6, 39, 2, '2022-10-05 04:14:10', '2022-10-05 04:14:10'),
(26, 6, 40, 2, '2022-10-05 04:14:22', '2022-10-05 04:14:22'),
(27, 6, 41, 1, '2022-10-05 04:20:07', '2022-10-05 04:20:07'),
(28, 3, 5, 5, '2022-10-05 04:33:07', '2022-10-05 04:33:07'),
(29, 3, 5, 5, '2022-10-05 04:36:16', '2022-10-05 04:36:16'),
(30, 3, 5, 5, '2022-10-05 04:38:20', '2022-10-05 04:38:20'),
(31, 3, 5, 5, '2022-10-05 04:41:05', '2022-10-05 04:41:05'),
(32, 6, 46, 5, '2022-10-05 04:52:48', '2022-10-05 04:52:48'),
(33, 6, 47, 5, '2022-10-05 04:57:23', '2022-10-05 04:57:23'),
(34, 6, 48, 5, '2022-10-05 04:58:14', '2022-10-05 04:58:14'),
(35, 6, 49, 5, '2022-10-05 04:58:38', '2022-10-05 04:58:38'),
(36, 6, 50, 5, '2022-10-05 04:59:39', '2022-10-05 04:59:39'),
(37, 6, 51, 5, '2022-10-05 05:01:51', '2022-10-05 05:01:51'),
(38, 6, 52, 5, '2022-10-05 05:09:03', '2022-10-05 05:09:03'),
(39, 6, 53, 5, '2022-10-05 05:14:09', '2022-10-05 05:14:09'),
(40, 6, 54, 5, '2022-10-05 05:15:57', '2022-10-05 05:15:57'),
(41, 6, 55, 5, '2022-10-05 05:17:09', '2022-10-05 05:17:09'),
(42, 6, 56, 2, '2022-10-05 05:19:22', '2022-10-05 05:19:22'),
(43, 2, 57, 3, '2022-10-05 08:40:46', '2022-10-05 08:40:46'),
(44, 2, 58, 1, '2022-10-05 09:10:39', '2022-10-05 09:10:39'),
(45, 2, 59, 2, '2022-10-05 09:12:03', '2022-10-05 09:12:03'),
(46, 39, 60, 1, '2022-10-06 06:08:07', '2022-10-06 06:08:07'),
(47, 39, 61, 2, '2022-10-06 07:20:13', '2022-10-06 07:20:13'),
(48, 41, 62, 1, '2022-10-20 06:12:14', '2022-10-20 06:12:14');

-- --------------------------------------------------------

--
-- Table structure for table `course_assignments_ques_ans`
--

CREATE TABLE `course_assignments_ques_ans` (
  `id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `assignment_ques` text NOT NULL,
  `assignment_ans` text NOT NULL,
  `option1` text DEFAULT NULL,
  `option2` text DEFAULT NULL,
  `option3` text DEFAULT NULL,
  `option4` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_assignments_ques_ans`
--

INSERT INTO `course_assignments_ques_ans` (`id`, `assignment_id`, `assignment_ques`, `assignment_ans`, `option1`, `option2`, `option3`, `option4`, `created_at`, `updated_at`) VALUES
(1, 3, 'nice', 'g', NULL, NULL, NULL, NULL, '2022-10-04 18:12:54', '2022-10-04 18:12:54'),
(2, 4, 'nice', 'g', NULL, NULL, NULL, NULL, '2022-10-04 18:14:11', '2022-10-04 18:14:11'),
(3, 5, 'nice', 'g', NULL, NULL, NULL, NULL, '2022-10-04 18:15:02', '2022-10-04 18:15:02'),
(4, 6, 'nice', 'g', NULL, NULL, NULL, NULL, '2022-10-04 18:17:42', '2022-10-04 18:17:42'),
(5, 12, 'nice', 'g', NULL, NULL, NULL, NULL, '2022-10-04 19:06:55', '2022-10-04 19:06:55'),
(6, 17, 'nice', 'g', NULL, NULL, NULL, NULL, '2022-10-04 19:08:22', '2022-10-04 19:08:22'),
(7, 14, 'Array', 'Array', NULL, NULL, NULL, NULL, '2022-10-04 19:09:48', '2022-10-04 19:09:48'),
(8, 15, 'Array', 'Array', NULL, NULL, NULL, NULL, '2022-10-04 19:13:29', '2022-10-04 19:13:29'),
(9, 17, 'Array', 'Array', NULL, NULL, NULL, NULL, '2022-10-04 19:38:23', '2022-10-04 19:38:23'),
(10, 17, 'Array', 'Arrayno', '67', NULL, NULL, NULL, '2022-10-04 19:39:12', '2022-10-04 19:39:12'),
(11, 19, 'Array', 'Array', NULL, NULL, NULL, NULL, '2022-10-04 19:39:42', '2022-10-04 19:39:42'),
(12, 22, 'Array', 'Array', NULL, NULL, NULL, NULL, '2022-10-04 19:43:03', '2022-10-04 19:43:03'),
(13, 23, 'Array', 'Array', NULL, NULL, NULL, NULL, '2022-10-05 03:12:58', '2022-10-05 03:12:58'),
(14, 26, '[\'nice\',\'\'y,\'w\']', 'g', NULL, NULL, NULL, NULL, '2022-10-05 04:14:22', '2022-10-05 04:14:22'),
(15, 27, 'Array', 'Array', NULL, NULL, NULL, NULL, '2022-10-05 04:20:07', '2022-10-05 04:20:07'),
(16, 29, 'what is n', 'what is n', NULL, NULL, NULL, NULL, '2022-10-05 04:36:16', '2022-10-05 04:36:16'),
(17, 29, 'what is noun', 'what is no', NULL, NULL, NULL, NULL, '2022-10-05 04:36:16', '2022-10-05 04:36:16'),
(18, 30, 'what is n', 'what is n', NULL, NULL, NULL, NULL, '2022-10-05 04:38:20', '2022-10-05 04:38:20'),
(19, 30, 'what is noun', 'what is no', NULL, NULL, NULL, NULL, '2022-10-05 04:38:20', '2022-10-05 04:38:20'),
(20, 31, 'what is n', 'what is n', NULL, NULL, NULL, NULL, '2022-10-05 04:41:05', '2022-10-05 04:41:05'),
(21, 31, 'what is noun', 'what is no', NULL, NULL, NULL, NULL, '2022-10-05 04:41:05', '2022-10-05 04:41:05'),
(22, 37, '\r\n    gg', 'fgdgsg', NULL, NULL, NULL, NULL, '2022-10-05 05:01:51', '2022-10-05 05:01:51'),
(23, 16, '\r\n    ggiiiiii', 'fgdgsg', NULL, NULL, NULL, NULL, '2022-10-05 05:01:51', '2022-10-05 05:01:51'),
(24, 16, '\r\n    gg', 'fgdgsg', 'tddg', 'tgfr', 'rgrf', 'rg', '2022-10-05 05:09:03', '2022-10-05 05:09:03'),
(25, 16, '\r\n    ggiiiiii', 'fgdgsg', 'tddg', 'tgfr', 'rgrf', 'rg', '2022-10-05 05:09:03', '2022-10-05 05:09:03'),
(26, 39, '\r\n    gr', 't', 'h', 'jhbh', 'hjkg', 'jhvh', '2022-10-05 05:14:09', '2022-10-05 05:14:09'),
(27, 39, '\r\n    grgfkfdfd', 't', 'h', 'jhbh', 'hjkg', 'jhvh', '2022-10-05 05:14:09', '2022-10-05 05:14:09'),
(28, 39, '\r\n    grgfkfdfd555555', 't', 'h', 'jhbh', 'hjkg', 'jhvh', '2022-10-05 05:14:09', '2022-10-05 05:14:09'),
(29, 40, '\r\n    gr', 't', 'h', 'jhbh', 'hjkg', 'jhvh', '2022-10-05 05:15:57', '2022-10-05 05:15:57'),
(30, 40, '\r\n    grgfkfdfd', 't', 'h', 'jhbh', 'hjkg', 'jhvh', '2022-10-05 05:15:57', '2022-10-05 05:15:57'),
(31, 40, '\r\n    grgfkfdfd555555', 't', 'h', 'jhbh', 'hjkg', 'jhvh', '2022-10-05 05:15:57', '2022-10-05 05:15:57'),
(32, 41, '\r\n    gr', 't', 'h', 'jhbh', 'hjkg', 'jhvh', '2022-10-05 05:17:09', '2022-10-05 05:17:09'),
(33, 41, '\r\n    grgfkfdfd', 't', 'h', 'jhbh', 'hjkg', 'jhvh', '2022-10-05 05:17:09', '2022-10-05 05:17:09'),
(34, 41, '\r\n    grgfkfdfd555555', 't', 'h', 'jhbh', 'hjkg', 'jhvh', '2022-10-05 05:17:09', '2022-10-05 05:17:09'),
(35, 42, '\r\n    66', 'hb', 'vj', 'nn', ';iuh', '2', '2022-10-05 05:19:22', '2022-10-05 05:19:22'),
(36, 42, '\r\n    666', 'hb', 'vj', 'nn', ';iuh', '2', '2022-10-05 05:19:22', '2022-10-05 05:19:22'),
(37, 43, '\r\n    oe', 'two', '3', '33', '333333', '33', '2022-10-05 08:40:46', '2022-10-05 08:40:46'),
(38, 43, '\r\n    oe', 'two', '3', '33', '333333', '33', '2022-10-05 08:40:46', '2022-10-05 08:40:46'),
(39, 44, '\r\n    ok', 'jiok', 'jio', 'ok', 'ok', 'okl', '2022-10-05 09:10:39', '2022-10-05 09:10:39'),
(40, 44, '\r\n    ok', 'jiok', 'jio', 'ok', 'ok', 'okl', '2022-10-05 09:10:39', '2022-10-05 09:10:39'),
(41, 45, '\r\n    ok', 'jblfsjd', 'hjblf', 'hgghg', 'hjgbhj', 'hj', '2022-10-05 09:12:03', '2022-10-05 09:12:03'),
(42, 45, '\r\n    ok', 'jblfsjd', 'hjblf', 'hgghg', 'hjgbhj', 'hj', '2022-10-05 09:12:03', '2022-10-05 09:12:03'),
(43, 46, '\r\n    What is python?', 'Programming Language', 'SQL', 'Programming Language', 'English Language', 'other Language', '2022-10-06 06:08:07', '2022-10-06 06:08:07'),
(44, 46, '\r\n    What is AI?', 'Programming Language', 'SQL1', 'Programming Language', 'English Language', 'other Language', '2022-10-06 06:08:07', '2022-10-06 06:08:07'),
(45, 47, '\r\n    What is python?and it is interpreter based', 'yes', 'yes ', 'no', 'yes ', 'no', '2022-10-06 07:20:13', '2022-10-06 07:20:13'),
(46, 48, '\r\n    wow?', 'no', '1', '2', '9', '5', '2022-10-20 06:12:14', '2022-10-20 06:12:14'),
(47, 48, '\r\n    wow?8888', 'no', '1', '2', '9', '5', '2022-10-20 06:12:14', '2022-10-20 06:12:14');

-- --------------------------------------------------------

--
-- Table structure for table `course_categories`
--

CREATE TABLE `course_categories` (
  `id` int(11) NOT NULL,
  `category_name` text DEFAULT NULL,
  `category_long_description` text DEFAULT NULL,
  `category_short_description` text DEFAULT NULL,
  `category_image` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_categories`
--

INSERT INTO `course_categories` (`id`, `category_name`, `category_long_description`, `category_short_description`, `category_image`, `created_at`, `updated_at`) VALUES
(1, 'php', 'php', 'Php', 'public/files/category_images/pAP1gzopXDFdrbzWS2nQStVnWVAAvZekt7ORpM2Z.png', '2022-09-23 11:56:47', '2022-09-23 11:56:47'),
(2, 'php', 'php', 'Php', 'public/files/category_images/jZljWwfgALVjbaVkf6V6OGglgqav9hn4BNORN3mu.png', '2022-09-23 12:04:33', '2022-09-23 12:04:33'),
(3, 'p', NULL, NULL, 'public/files/category_images/wN9NqPBRpXWpRfFyQ0aG0KHHq0D1mVUTGAKwtOhU.png', '2022-09-23 12:04:30', '2022-09-23 12:04:30'),
(4, 'python', NULL, NULL, 'public/files/category_images/OnGXnCjebmhfqzUMjt52M99M1FQUygaVoVd51YEU.png', '2022-09-23 12:04:32', '2022-09-23 12:04:32'),
(5, 'php', 'php', 'Php', 'public/files/category_images/jZljWwfgALVjbaVkf6V6OGglgqav9hn4BNORN3mu.png', '2022-09-23 12:04:33', '2022-09-23 12:04:33');

-- --------------------------------------------------------

--
-- Table structure for table `course_certificates`
--

CREATE TABLE `course_certificates` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `certificate_generated_id` varchar(100) NOT NULL,
  `certificate_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `course_faqs`
--

CREATE TABLE `course_faqs` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `faqs_ques` text DEFAULT NULL,
  `faqs_ans` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_faqs`
--

INSERT INTO `course_faqs` (`id`, `course_id`, `faqs_ques`, `faqs_ans`, `created_at`, `updated_at`) VALUES
(1, 2, 'how can i register?', 'Go to signup', '2022-09-23 12:49:31', '2022-09-23 12:49:31'),
(3, 2, 'how can i register?', 'Go to signup', '2022-09-23 12:49:39', '2022-09-23 12:49:39'),
(4, 37, 'how can i register?', 'Go to signup', '2022-09-23 12:49:41', '2022-09-23 12:49:41'),
(5, 37, 'Okokok?', 'lecture', '2022-09-23 12:50:42', '2022-09-23 12:50:42'),
(6, 4, 'how can i register?', 'Go to signup', '2022-09-23 12:50:50', '2022-09-23 12:50:50'),
(7, 4, 'how can i register?', 'Go to signup', '2022-09-23 12:50:52', '2022-09-23 12:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `course_lectures`
--

CREATE TABLE `course_lectures` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `lecture_number` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `section_no` int(11) DEFAULT NULL,
  `section_title` text DEFAULT NULL,
  `section_description` text DEFAULT NULL,
  `lecture_name` varchar(100) DEFAULT NULL,
  `lecture_short_description` text DEFAULT NULL,
  `lecture_long_description` text DEFAULT NULL,
  `feature_image` varchar(1000) DEFAULT NULL,
  `is_published` enum('1','0') DEFAULT '0',
  `lecture_video` varchar(1000) DEFAULT NULL,
  `lecture_assignment_id` int(11) DEFAULT NULL,
  `lecture_material_id` int(11) DEFAULT NULL,
  `video_tags` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_lectures`
--

INSERT INTO `course_lectures` (`id`, `course_id`, `lecture_number`, `section_id`, `section_no`, `section_title`, `section_description`, `lecture_name`, `lecture_short_description`, `lecture_long_description`, `feature_image`, `is_published`, `lecture_video`, `lecture_assignment_id`, `lecture_material_id`, `video_tags`, `created_at`, `updated_at`) VALUES
(1, 2, 2, NULL, NULL, '', '', 'Chapter 1 Introduction', NULL, 'NiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOC', 'public/files/lecture_images/OMvG5peSityitVeFv0XLxyOJIv1NFbDAljcGrY1C.png', '0', 'CH8wP4DJMUo', 39, NULL, NULL, '2022-09-24 09:32:25', '2022-09-24 09:32:25'),
(2, 2, 1, 11, NULL, '', '', 'Chapter 1 Introduction', NULL, 'NiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOC', 'public/files/lecture_images/qZwsyORUCy1XP3ERi2x6OEN338e3tctIzFsFsNXS.png', '0', '7yMzIIgrvkc', 39, NULL, 'python, php', '2022-09-24 09:37:31', '2022-09-24 09:37:31'),
(3, 6, 1, 13, NULL, NULL, NULL, 'lecure 1', NULL, 'oneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneoneone', NULL, '0', 'files/lecture_videos/FgTROfVjndKvWbs5YJXAKDxi9TO1ZDJzXEU6Q8wl.mp4', 39, NULL, NULL, '2022-10-04 15:06:13', '2022-10-04 15:06:13'),
(4, 7, 2, 12, NULL, NULL, NULL, 'lecure 1', NULL, 'NiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOC', NULL, '0', 'files/lecture_videos/BAdL6OhSLgUnq2qlePRkkFkDJklVUlhjn88S05Yo.mp4', 39, NULL, NULL, '2022-10-04 15:11:40', '2022-10-04 15:11:40'),
(5, 7, 1, 12, NULL, NULL, NULL, 'h', NULL, 'hj', NULL, '0', 'files/lecture_videos/a53AJBDailc1NiAYIcwoeSaITHdobGyX2UGB1Umb.mp4', 39, NULL, NULL, '2022-10-04 15:13:18', '2022-10-04 15:13:18'),
(6, 6, 2, NULL, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/8fsly33NmQAEvKysmscbEmNijOKORy481cRRgnke.mp4', 39, NULL, NULL, '2022-10-04 15:32:21', '2022-10-04 15:32:21'),
(7, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/NTPa0cIwDa9HqZsv7N8yTYcTHh9neWigaUpPKGHB.mp4', 39, NULL, NULL, '2022-10-04 15:37:10', '2022-10-04 15:37:10'),
(8, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/asdMRZq6vcTZVfDOHk0N7NeXdKeZipYuXIum3UQr.mp4', 39, NULL, NULL, '2022-10-04 15:40:04', '2022-10-04 15:40:04'),
(9, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/GIC6cgmcv4S7x4w8vklPBOIBM1lNZTbJU7UjViCG.mp4', 39, NULL, NULL, '2022-10-04 15:42:27', '2022-10-04 15:42:27'),
(10, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/ygPoAWpbakai2iwy4WxSGlLoSkVcsuvXSbplk5Ah.mp4', 39, 5, NULL, '2022-10-04 15:45:02', '2022-10-04 15:45:02'),
(11, 6, 1, 13, NULL, NULL, NULL, 'th', NULL, 'nice', NULL, '0', 'files/lecture_videos/pNk5pPAuXETVEZzBKPr3kRCkJkx4PfwK87sW1beU.mp4', 39, 6, NULL, '2022-10-04 17:14:30', '2022-10-04 17:14:30'),
(12, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/lIWYa7EYdgyNb42kF6XBB55crthLkJuXgBeEw6o7.mp4', 39, 7, NULL, '2022-10-04 17:49:12', '2022-10-04 17:49:12'),
(13, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/A2zvmcNXOzOlzYhP1PVEx8jXH6X9t70ylquovS1V.mp4', 39, 8, NULL, '2022-10-04 18:07:47', '2022-10-04 18:07:47'),
(14, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/aY2yLyHHKarFbJFi49YfzVLW3mPKXBUXFausnOYJ.mp4', 39, 9, NULL, '2022-10-04 18:08:58', '2022-10-04 18:08:58'),
(15, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/zpK8DUiQeNGJU7cFxckCg2ynjJUjShqGBd6ayKi6.mp4', 39, 10, NULL, '2022-10-04 18:09:51', '2022-10-04 18:09:51'),
(16, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/yazm84nCiddLKuSO8M8hVezgEpgUZy2xdpnT1nMY.mp4', 39, 11, NULL, '2022-10-04 18:12:08', '2022-10-04 18:12:08'),
(17, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/nGyxgD0bYEp31QJ3r45EHr74YNw4egharWbosc0A.mp4', 39, 12, NULL, '2022-10-04 18:12:54', '2022-10-04 18:12:54'),
(18, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/NZeYUwgQ2rnAI114ZFQvAH3iWqYePfgwgOXX1Hly.mp4', 39, 13, NULL, '2022-10-04 18:14:11', '2022-10-04 18:14:11'),
(19, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/VZUUZKmfa2vk9r00eAHJfb2j9xDgWZnogF78CS8p.mp4', 39, 14, NULL, '2022-10-04 18:15:02', '2022-10-04 18:15:02'),
(20, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/LdSQRSTn86G0gglwSOT3fSHGGpZviD2YBhElqjRa.mp4', 39, 15, NULL, '2022-10-04 18:17:42', '2022-10-04 18:17:42'),
(21, 6, 1, 13, NULL, NULL, NULL, 'gggggggg', NULL, 'gg', NULL, '0', 'files/lecture_videos/dVEjlsi42StO5O5nPR9naPCklIYsvym9biaQxVor.mp4', 39, 16, NULL, '2022-10-04 18:41:44', '2022-10-04 18:41:44'),
(22, 6, 1, 13, NULL, NULL, NULL, 'gggggggg', NULL, 'gg', NULL, '0', 'files/lecture_videos/y6U8FdwIN50lDPB3320knwHG6swHBwUy1o4zFjrO.mp4', 39, 17, NULL, '2022-10-04 18:44:15', '2022-10-04 18:44:15'),
(23, 6, 1, 13, NULL, NULL, NULL, 'gggggggg', NULL, 'gg', NULL, '0', 'files/lecture_videos/FxUhJY1FgWSs2ntvruXcDFdouay8NdkRhsxk2n3e.mp4', 39, 18, NULL, '2022-10-04 18:45:03', '2022-10-04 18:45:03'),
(24, 6, 1, 13, NULL, NULL, NULL, 'gggggggg', NULL, 'gg', NULL, '0', 'files/lecture_videos/zGppvGaXFWPFGRoSBoHzN7UK9G0hxiiQbYl3lwZf.mp4', 39, 19, NULL, '2022-10-04 18:46:40', '2022-10-04 18:46:40'),
(25, 6, 1, 13, NULL, NULL, NULL, 'gggggggg', NULL, 'gg', NULL, '0', 'files/lecture_videos/TMq8cZrlv5Yy1pdOsuXOCBCi3dY0FRQSJTWa6Cww.mp4', 39, 20, NULL, '2022-10-04 18:47:23', '2022-10-04 18:47:23'),
(26, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/AN6ScPjDeLMad5WSPno2ZJ0Nv3OBdYIFG9Bz7q92.mp4', 39, 21, NULL, '2022-10-04 19:06:55', '2022-10-04 19:06:55'),
(27, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/dCng3FUetOe0AxABjQWnpfPiSKL3yXizt5qxLVYf.mp4', 39, 22, NULL, '2022-10-04 19:08:22', '2022-10-04 19:08:22'),
(28, 6, 1, 13, NULL, NULL, NULL, 'check', NULL, 'nice', NULL, '0', 'files/lecture_videos/01ShjL6U451KlaquhmZc9Ep4NmObohp3Msnikg4N.jpg', 39, 23, NULL, '2022-10-04 19:09:48', '2022-10-04 19:09:48'),
(29, 6, 1, 13, NULL, NULL, NULL, 'check', NULL, 'nice', NULL, '0', 'files/lecture_videos/EEM82VGYItQoL4aU3M3V56M8YtdUxa2SBCuIAiGt.jpg', 39, 24, NULL, '2022-10-04 19:13:29', '2022-10-04 19:13:29'),
(30, 6, 1, 13, NULL, NULL, NULL, 'check', NULL, 'nice', NULL, '0', 'files/lecture_videos/BYP5UCRw3c7irtzKLn8WmXVZWcMrnOzgMHMfXrNm.jpg', 39, 25, NULL, '2022-10-04 19:37:25', '2022-10-04 19:37:25'),
(31, 6, 1, 13, NULL, NULL, NULL, 'check', NULL, 'nice', NULL, '0', 'files/lecture_videos/sEhkF1E7JNVx6N8XwC9etzyg0f0mG5vSO4Qht07t.jpg', 39, 26, NULL, '2022-10-04 19:38:23', '2022-10-04 19:38:23'),
(32, 6, 1, 13, NULL, NULL, NULL, 'check', NULL, 'nice', NULL, '0', 'files/lecture_videos/k33XOZrAm0KEylhIicftprQIm8nbI7lK9SnOEBjx.jpg', 39, 27, NULL, '2022-10-04 19:39:12', '2022-10-04 19:39:12'),
(33, 6, 1, 13, NULL, NULL, NULL, 'check', NULL, 'nice', NULL, '0', 'files/lecture_videos/BLJaFpzwOUr5a6j3l5ugEWiBQXwreaQncP35daAm.jpg', 39, 28, NULL, '2022-10-04 19:39:42', '2022-10-04 19:39:42'),
(34, 6, 1, 13, NULL, NULL, NULL, 'check', NULL, 'nice', NULL, '0', 'files/lecture_videos/fEoQfaFEdzfpgfHW5zxMHJ5yXT0indn7w5HrXaBU.jpg', 39, 29, NULL, '2022-10-04 19:41:40', '2022-10-04 19:41:40'),
(35, 6, 1, 13, NULL, NULL, NULL, 'check', NULL, 'nice', NULL, '0', 'files/lecture_videos/4VMziRnVk55tG5QmL0ZOKROMqpSHpxmfT76bP2wR.jpg', 39, 30, NULL, '2022-10-04 19:42:05', '2022-10-04 19:42:05'),
(36, 6, 1, 13, NULL, NULL, NULL, 'check', NULL, 'nice', NULL, '0', 'files/lecture_videos/Wvfe6oIOmdSF8KxZwTkwaMkPXy27NLW2pJpYrmLI.jpg', 39, 31, NULL, '2022-10-04 19:43:03', '2022-10-04 19:43:03'),
(37, 6, 1, 13, NULL, NULL, NULL, 'check', NULL, 'nice', NULL, '0', 'files/lecture_videos/8uBUdBhZXsSCR4JIXkrarX5hzHuno30OGK8W5pej.jpg', 39, 32, NULL, '2022-10-05 03:12:58', '2022-10-05 03:12:58'),
(38, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/Ym4PnuNlp2lCPzBvjjnfOrhjshXm1jDxOvp9CSSJ.mp4', 39, 33, NULL, '2022-10-05 04:13:11', '2022-10-05 04:13:11'),
(39, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/5VSJBtGIkkxhAssbgQ4nZHUNKlfhfXvhejKJAgWU.mp4', 39, 34, NULL, '2022-10-05 04:14:10', '2022-10-05 04:14:10'),
(40, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/I9eAbxfpNlI5Sm8SHLsiQVGEJ0QCQs28UsiLYQqT.mp4', 39, 35, NULL, '2022-10-05 04:14:22', '2022-10-05 04:14:22'),
(41, 6, 1, 13, NULL, NULL, NULL, 'check', NULL, 'nice', NULL, '0', 'files/lecture_videos/KYp3yMPO0AX8Yx2CookOAkcoYMpFR95qLCGnlJdO.jpg', 39, 36, NULL, '2022-10-05 04:20:07', '2022-10-05 04:20:07'),
(42, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/Mi3EssiM7OYuOVfluJW0f1vyRYdGjWlGjkSAbnRV.mp4', 39, NULL, NULL, '2022-10-05 04:22:46', '2022-10-05 04:22:46'),
(43, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/uSN5mxya1MQp4kTQBxc9WYXDeK3sgXV3MicuPzwH.mp4', 39, 38, NULL, '2022-10-05 04:27:56', '2022-10-05 04:27:56'),
(44, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/EYNb4OVvqwz0uwvkJORsvsnL0xbSpq3alvRwu2xH.mp4', 39, 39, NULL, '2022-10-05 04:28:37', '2022-10-05 04:28:37'),
(45, 6, 2, 3, NULL, NULL, NULL, 'nice view', NULL, 'great', NULL, '0', 'files/lecture_videos/HElmpjS3qY8c9t7bQ8Ie48VLMNTXsPv3KSRyVSDD.mp4', 39, 40, NULL, '2022-10-05 04:50:51', '2022-10-05 04:50:51'),
(46, 6, 5, 13, NULL, NULL, NULL, '6', NULL, '66', NULL, '0', 'files/lecture_videos/OIxp2elTOjHM8Ck2evseUSZj3rvoaiaNdTZRyIGr.jpg', 39, 41, NULL, '2022-10-05 04:52:48', '2022-10-05 04:52:48'),
(47, 6, 5, 13, NULL, NULL, NULL, '6', NULL, '66', NULL, '0', 'files/lecture_videos/Q2PV5xsWF3zqpT3w17Zs8aw6Cd9w3htHCW9SrW5H.jpg', 39, 42, NULL, '2022-10-05 04:57:23', '2022-10-05 04:57:23'),
(48, 6, 5, 13, NULL, NULL, NULL, '6', NULL, '66', NULL, '0', 'files/lecture_videos/96AbrIBn3Zs7uoRrnO4TxABPssDjNCfGVw6F3WSF.jpg', 39, 43, NULL, '2022-10-05 04:58:14', '2022-10-05 04:58:14'),
(49, 6, 5, 13, NULL, NULL, NULL, '6', NULL, '66', NULL, '0', 'files/lecture_videos/X8HTOEEMsEK8K53KN3GRD77f8Iu3pm3FEljmwRbt.jpg', 39, 44, NULL, '2022-10-05 04:58:38', '2022-10-05 04:58:38'),
(50, 6, 5, 13, NULL, NULL, NULL, '6', NULL, '66', NULL, '0', 'files/lecture_videos/FOCbZmYFrabut0UVu2aFuZzL48FG9YvEXPALZ4sh.jpg', 39, 45, NULL, '2022-10-05 04:59:39', '2022-10-05 04:59:39'),
(51, 6, 5, 13, NULL, NULL, NULL, '6', NULL, '66', NULL, '0', 'files/lecture_videos/3L8M117zvXNNiciyB27bp9YCTPBGPixeR3Fe7FmA.jpg', 39, 46, NULL, '2022-10-05 05:01:51', '2022-10-05 05:01:51'),
(52, 6, 5, 13, NULL, NULL, NULL, '6', NULL, '66', NULL, '0', 'files/lecture_videos/epiaon5a1ORC8zyX5v0Ckkbl4qfe534nZR8qjaP7.jpg', 39, 47, NULL, '2022-10-05 05:09:03', '2022-10-05 05:09:03'),
(53, 6, 5, 13, NULL, NULL, NULL, 'n', NULL, 'nice', NULL, '0', 'files/lecture_videos/89gcO6eUthu7qDRz9YR5gsY46Hl2jR0cEOjYTCKw.mp4', 39, 48, NULL, '2022-10-05 05:14:09', '2022-10-05 05:14:09'),
(54, 6, 5, 13, NULL, NULL, NULL, 'n', NULL, 'nice', NULL, '0', 'files/lecture_videos/HNGtxKm7WJAZYCB0UsyltNiqKbmNxhViTowra6lY.mp4', 40, 49, NULL, '2022-10-05 05:15:57', '2022-10-05 05:15:57'),
(55, 6, 5, 13, NULL, NULL, NULL, 'n', NULL, 'nice', NULL, '0', 'files/lecture_videos/ZBKrfqyohVU199k6gt5UWG8ki2pRrGJNLEKRuOhi.mp4', 41, 50, NULL, '2022-10-05 05:17:09', '2022-10-05 05:17:09'),
(56, 6, 2, 13, NULL, NULL, NULL, 'lyuguy', NULL, 'iihb', NULL, '0', 'files/lecture_videos/mmMZxD2jvIfvWyqsjAazEow5JVmEkUhBCQuPik2x.mp4', 42, 51, NULL, '2022-10-05 05:19:21', '2022-10-05 05:19:21'),
(57, 2, 3, 13, NULL, NULL, NULL, 'intro', NULL, 'ji', NULL, '0', 'files/lecture_videos/EtbajrafLx2QjZx2DXtccAf5Qq13EjxXLtnewX92.mp4', 43, 52, NULL, '2022-10-05 08:40:46', '2022-10-05 08:40:46'),
(58, 2, 1, 15, NULL, NULL, NULL, 'wd', NULL, 'k', NULL, '0', 'files/lecture_videos/aX65UHz2gdqrfMEEE6bWZDgNZPwgM2HArWF9F9Ya.mp4', 44, 53, NULL, '2022-10-05 09:10:39', '2022-10-05 09:10:39'),
(59, 38, 8, 8, NULL, NULL, NULL, 'o000000jjj', NULL, 'ok', NULL, '0', 'files/lecture_videos/6KrIWL70noriMV9teH8IWA6LwDH0qAfpDfOQO34C.mp4', 45, 54, NULL, '2022-10-05 09:12:03', '2022-10-05 09:12:03'),
(60, 39, 1, 29, NULL, NULL, NULL, 'Introduction', NULL, 'Get the links to our chat community forums to ask questions and get help fast.', NULL, '0', 'files/lecture_videos/hATUo5lqZ1x34i9MpnNMawJF7ir3qyiIt7atJE9s.mp4', 46, 55, NULL, '2022-10-06 06:08:07', '2022-10-06 06:08:07'),
(61, 39, 2, 29, NULL, NULL, NULL, 'Introduction second', NULL, 'Programming LanguageProgramming LanguageProgramming LanguageProgramming LanguageProgramming LanguageProgramming', NULL, '0', 'files/lecture_videos/rhEfV0QQl587G7hDYaXTPKXloBIpQPbs4attYRxv.mp4', 47, 56, NULL, '2022-10-06 07:20:13', '2022-10-06 07:20:13'),
(62, 41, 1, 30, NULL, NULL, NULL, 'intro', NULL, 'newnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewvv', 'files/lecture_images/Nd1ZH6KNShsclhZCBefn2vTQMf9ULj6pXxUQGMts.jpg', '0', 'files/lecture_videos/QUDuCMUwbOZDFRmlhz9N05tiXRh2m1SZuaEZs8Cb.mp4', 48, 57, NULL, '2022-10-20 06:12:14', '2022-10-20 06:12:14'),
(63, 38, 1, 8, NULL, NULL, NULL, 'ok', NULL, 'ok', NULL, '0', 'files/lecture_videos/6KrIWL70noriMV9teH8IWA6LwDH0qAfpDfOQO34C.mp4', 45, 54, NULL, '2022-10-05 09:12:03', '2022-10-05 09:12:03');

-- --------------------------------------------------------

--
-- Table structure for table `course_materials`
--

CREATE TABLE `course_materials` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `course_lecture_id` int(11) DEFAULT NULL,
  `lecture_no` int(11) DEFAULT NULL,
  `material_title` varchar(100) DEFAULT NULL,
  `material_short_description` text DEFAULT NULL,
  `material_file` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_materials`
--

INSERT INTO `course_materials` (`id`, `course_id`, `course_lecture_id`, `lecture_no`, `material_title`, `material_short_description`, `material_file`, `created_at`, `updated_at`) VALUES
(1, 2, 2, NULL, 'Chapter 1 Introduction', 'NiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOC', 'public/files/course_materials/akkuHsrLJ382RWPfvmWk40edk0JeYHE1UKrijh3R.pdf', '2022-09-24 05:53:32', '2022-09-24 05:53:32'),
(2, 2, 2, NULL, 'Chapter 1 Introduction', 'NiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOC', 'sem 3.pdf', '2022-09-24 05:54:35', '2022-09-24 05:54:35'),
(3, 2, 4, NULL, 'Chapter 1 Introduction', 'NiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOCNiceBetween DOC files, PDFs, TXT files and more, there created a complete list of document file extension types \n.s the DOC', 'C:\\xampp\\tmp\\php60B0.tmp', '2022-09-24 05:54:56', '2022-09-24 05:54:56'),
(4, 6, 6, 2, 'new', 'new text', 'files/course_materials/CRr6MMoUifoTdsa48iE7CGocnaTMahf8PxTmLHtE.pdf', '2022-10-04 15:42:27', '2022-10-04 15:42:27'),
(5, 6, 5, 2, 'new', 'new text', 'files/course_materials/itAjLBRrKiYavEZqL4t8yQUEXndXe8heBNOUa3E5.pdf', '2022-10-04 15:45:02', '2022-10-04 15:45:02'),
(6, 6, 11, 1, 'wow', 'great', 'files/course_materials/b05t5EgsOOdKgdTaVeyJlklTmmDLtkDNsttnycDE.pdf', '2022-10-04 17:14:30', '2022-10-04 17:14:30'),
(7, 6, 12, 2, 'new', 'new text', 'files/course_materials/ejtl0LTBjsEWxvoYrUTnlj9VNTwAFQz8XFI69AjQ.pdf', '2022-10-04 17:49:12', '2022-10-04 17:49:12'),
(8, 6, 13, 2, 'new', 'new text', 'files/course_materials/OlEBL7cK7q8JBMy6y2eOPUjkFzyVyJOedqYRymQZ.pdf', '2022-10-04 18:07:47', '2022-10-04 18:07:47'),
(9, 6, 14, 2, 'new', 'new text', 'files/course_materials/pJI55s0YYEDsOYtVIeS1p1sklMDPs8e2wkwmzocY.pdf', '2022-10-04 18:08:58', '2022-10-04 18:08:58'),
(10, 6, 15, 2, 'new', 'new text', 'files/course_materials/f68lPbBcg7QrjyOpAjDaolZZDOeDbwLcUNfiFBKm.pdf', '2022-10-04 18:09:51', '2022-10-04 18:09:51'),
(11, 6, 16, 2, 'new', 'new text', 'files/course_materials/AlOO3V60uf2A2zdFaMVBXe36KzSNDoCzbeFWqDUo.pdf', '2022-10-04 18:12:08', '2022-10-04 18:12:08'),
(12, 6, 17, 2, 'new', 'new text', 'files/course_materials/crdkyHQmLPJWfp91sfo3hxjVNEd2cKAflS3HGjLi.pdf', '2022-10-04 18:12:54', '2022-10-04 18:12:54'),
(13, 6, 18, 2, 'new', 'new text', 'files/course_materials/RY7UWEAjMeRK3JzffhBgUVWPUqD4YzB9Wz0JJ4CV.pdf', '2022-10-04 18:14:11', '2022-10-04 18:14:11'),
(14, 6, 19, 2, 'new', 'new text', 'files/course_materials/hQHavjr58cGqZCB0C1sMt3A1Gk6b06zTwfeGP6I1.pdf', '2022-10-04 18:15:02', '2022-10-04 18:15:02'),
(15, 6, 20, 2, 'new', 'new text', 'files/course_materials/AcJizigTpEs1vYbtisI3xhxvhoo8xf9y83MKxAkf.pdf', '2022-10-04 18:17:42', '2022-10-04 18:17:42'),
(16, 6, 21, 1, 'gg', 'Array', 'files/course_materials/JoEUEtAeLe43V09n1G1Zorthh8DjKLv8TaEDAb4h.pdf', '2022-10-04 18:41:44', '2022-10-04 18:41:44'),
(17, 6, 22, 1, 'gg', 'Array', 'files/course_materials/Q8NdZJPdgF00iHczVhuxRDcka72MSvF8XAFOGUvn.pdf', '2022-10-04 18:44:15', '2022-10-04 18:44:15'),
(18, 6, 23, 1, 'gg', 'Array', 'files/course_materials/cLNmHPdrq1dVNQETArh8FiHiEWcdY2LsI9rlGxgm.pdf', '2022-10-04 18:45:03', '2022-10-04 18:45:03'),
(19, 6, 24, 1, 'gg', 'Array', 'files/course_materials/6GuyWDlXsqhJ3zkcLvpJ6Mfee6SL3cgKqUc0z8iB.pdf', '2022-10-04 18:46:40', '2022-10-04 18:46:40'),
(20, 6, 25, 1, 'gg', 'Array', 'files/course_materials/DeZdWRAavtSzBqweAMJI2zoVI5oPpRdKm4yMaXiX.pdf', '2022-10-04 18:47:23', '2022-10-04 18:47:23'),
(21, 6, 26, 2, 'new', 'new text', 'files/course_materials/T3st3E5rSDmSQkJatEpqIwwkrX9yDWP00Gl377Q3.pdf', '2022-10-04 19:06:55', '2022-10-04 19:06:55'),
(22, 6, 27, 2, 'new', 'new text', 'files/course_materials/p6FFfjbXpRhSeOxWqkeFjMTTfUprousdavVDhGPk.pdf', '2022-10-04 19:08:22', '2022-10-04 19:08:22'),
(23, 6, 28, 1, 'nic', 'Array', 'files/course_materials/m7gGPJlwiiNozCXNcXGMHUgMqBzvgZ2OG6VWDz6M.pdf', '2022-10-04 19:09:48', '2022-10-04 19:09:48'),
(24, 6, 29, 1, 'nic', 'Array', 'files/course_materials/sWsHU5OEdmykb6wsopOTcyVZzdLn7dXG2LFTp8mG.pdf', '2022-10-04 19:13:29', '2022-10-04 19:13:29'),
(25, 6, 30, 1, 'nic', 'Array', 'files/course_materials/bp7zq50pjLh1O9gzc92apOOitOdAeRKgN3bHGTzZ.pdf', '2022-10-04 19:37:25', '2022-10-04 19:37:25'),
(26, 6, 31, 1, 'nic', 'Array', 'files/course_materials/1lwBDFofr5Tz69l3p46AhRHhACG0Q9jSnDKdMpCn.pdf', '2022-10-04 19:38:23', '2022-10-04 19:38:23'),
(27, 6, 32, 1, 'nic', 'Array', 'files/course_materials/pvIw8FpO30U24nQLpnduagiPwVr0NTDjZFUb9fl4.pdf', '2022-10-04 19:39:12', '2022-10-04 19:39:12'),
(28, 6, 33, 1, 'nic', 'Array', 'files/course_materials/VG75f9w1j7P8oQ0Rg3T9714ECdd2H0o6Ts7q2B8p.pdf', '2022-10-04 19:39:42', '2022-10-04 19:39:42'),
(29, 6, 34, 1, 'nic', 'Array', 'files/course_materials/BPmUiW1sbZcUywN4jsfXpUEfBNdQObbZ4zC7KreZ.pdf', '2022-10-04 19:41:40', '2022-10-04 19:41:40'),
(30, 6, 35, 1, 'nic', 'Array', 'files/course_materials/E7HxGY3EEc8KGU7YHiNksZIgbQHBmwtqn4I57rVK.pdf', '2022-10-04 19:42:05', '2022-10-04 19:42:05'),
(31, 6, 36, 1, 'nic', 'Array', 'files/course_materials/4QyOmpgxMfleRYsPz6KBmRLJDV2EjOmz2SWjhPqC.pdf', '2022-10-04 19:43:03', '2022-10-04 19:43:03'),
(32, 6, 37, 1, 'nic', 'Array', 'files/course_materials/NbKmKk3hPOqda1AdG8vOnejCSB6sBiFm87ClazI1.pdf', '2022-10-05 03:12:58', '2022-10-05 03:12:58'),
(33, 6, 38, 2, 'new', 'new text', 'files/course_materials/bRsuH93q5rHlvW7T9jHOORLQKXgm59pA132ewJWm.pdf', '2022-10-05 04:13:11', '2022-10-05 04:13:11'),
(34, 6, 39, 2, 'new', 'new text', 'files/course_materials/0TMqfFnRH24XxKCDvrAfWzJit9beIBorTZFKjXas.pdf', '2022-10-05 04:14:10', '2022-10-05 04:14:10'),
(35, 6, 40, 2, 'new', 'new text', 'files/course_materials/5FtBtqRf1kW5tyT15IZ1EnWreEYdCGgsRAqv0LH3.pdf', '2022-10-05 04:14:22', '2022-10-05 04:14:22'),
(36, 6, 41, 1, 'nic', 'Array', 'files/course_materials/laKZPJwfxb6sBdHSx1x1UxaVZ0q78j0WzbB3h5YH.pdf', '2022-10-05 04:20:07', '2022-10-05 04:20:07'),
(37, 6, 42, 2, 'new', 'new text', 'files/course_materials/abSgPG7IBVzQ9tYk9u1aKhcMLroGIOJmwaDlL9v3.pdf', '2022-10-05 04:22:46', '2022-10-05 04:22:46'),
(38, 6, 43, 2, 'new', 'new text', 'files/course_materials/UdgK7pZVUdvTDj0Lgzqg3yJ3eFDxqAUDZLW1ou9l.pdf', '2022-10-05 04:27:56', '2022-10-05 04:27:56'),
(39, 6, 44, 2, 'new', 'new text', 'files/course_materials/2G6GoPysEAThn6aTlRn97JKDkRAAqWjwUdOWDwJI.pdf', '2022-10-05 04:28:37', '2022-10-05 04:28:37'),
(40, 6, 45, 2, 'new', 'new text', 'files/course_materials/1AoCVClrKkZe9i0XnWH7H7bWAP3j8igpqCsTOeBy.pdf', '2022-10-05 04:50:51', '2022-10-05 04:50:51'),
(41, 6, 46, 5, '66', 'Array', 'files/course_materials/GNLvcx9a4UhYwKx9z9WLpAEBXynyAUg9VLKbuLKU.pdf', '2022-10-05 04:52:48', '2022-10-05 04:52:48'),
(42, 6, 47, 5, '66', 'Array', 'files/course_materials/Is7MSbNCWt2xRSwKsmU8dYuP9stsKNwOJdmCTtJo.pdf', '2022-10-05 04:57:23', '2022-10-05 04:57:23'),
(43, 6, 48, 5, '66', 'Array', 'files/course_materials/hS4orNcJDPJw8HMxcN6c6WUFQvy1HPNcZ4rG3NEr.pdf', '2022-10-05 04:58:14', '2022-10-05 04:58:14'),
(44, 6, 49, 5, '66', 'Array', 'files/course_materials/jE3pal12VWTMlxlSYdOadUj91TNlMfcXiZdBi5kE.pdf', '2022-10-05 04:58:38', '2022-10-05 04:58:38'),
(45, 6, 50, 5, '66', 'Array', 'files/course_materials/lCoPN2llJ9u1Hy1jxVtuc6nrvKQn3cny1VmtWKaI.pdf', '2022-10-05 04:59:39', '2022-10-05 04:59:39'),
(46, 6, 51, 5, '66', 'Array', 'files/course_materials/6DNzoRvwSdekbgcGBc7jdjtgxgFAPIW1POOEweqB.pdf', '2022-10-05 05:01:51', '2022-10-05 05:01:51'),
(47, 6, 52, 5, '66', 'Array', 'files/course_materials/8BWBcEnY3FCPctZsPZIX572sxak44e2Axm5WXbhz.pdf', '2022-10-05 05:09:03', '2022-10-05 05:09:03'),
(48, 6, 53, 5, 'bh', 'Array', 'files/course_materials/3W2Rzq3CseLd0bEZGZDYJfAyP1HZNn4f15bZJZP3.pdf', '2022-10-05 05:14:09', '2022-10-05 05:14:09'),
(49, 6, 54, 5, 'bh', 'Array', 'files/course_materials/3EUcLiUjrUHrYfMcsXv4f6rWtl1wKeV5NugbFR6o.pdf', '2022-10-05 05:15:57', '2022-10-05 05:15:57'),
(50, 6, 55, 5, 'bh', 'Array', 'files/course_materials/AdzBaEIVD8ECf8zohO5HVFd32vUxYqQ12nHlkV15.pdf', '2022-10-05 05:17:09', '2022-10-05 05:17:09'),
(51, 6, 56, 2, 'luyfl', 'hl', 'files/course_materials/Hn6m42DB2M9hWCgAHbTGv8QviGKfPCnYSVDcTKVr.pdf', '2022-10-05 05:19:22', '2022-10-05 05:19:22'),
(52, 2, 57, 3, 'ji', 'hi', 'files/course_materials/5Yr0ZyeV8KvSQ2AvFey5dj2C3Z68aL9ix9OHqnhH.pdf', '2022-10-05 08:40:46', '2022-10-05 08:40:46'),
(53, 2, 58, 1, 'ok', '👍', 'files/course_materials/mMDMhQzunZrKmxM4FPYre79Vy7GHQPUJ4Luoc4no.pdf', '2022-10-05 09:10:39', '2022-10-05 09:10:39'),
(54, 2, 59, 2, 'ok', 'ok', 'files/course_materials/GllXjV9r7SQCLh3mB0SNbSCnx57poJvL50ZpZ1Df.pdf', '2022-10-05 09:12:03', '2022-10-05 09:12:03'),
(55, 39, 60, 1, 'Introduction', 'Great this is basic intro material file and here is basic intro about this course.', 'files/course_materials/vsRDQRpE7TaSleYMvyP2vHpfFNU411xiRHBS7fj1.pdf', '2022-10-06 06:08:07', '2022-10-06 06:08:07'),
(56, 39, 61, 2, 'Programming Language', 'okProgramming LanguageProgramming LanguageProgramming LanguageProgramming LanguageProgramming', 'files/course_materials/YVS4jnKPWP4KqNc6HT5esqkc2duDvj2Y7CDSDsLm.pdf', '2022-10-06 07:20:13', '2022-10-06 07:20:13'),
(57, 41, 62, 1, 'newnewnewnew', 'newnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewvvvnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewnewvv', 'files/course_materials/QbcxJ55OFhANhUBxSFXtrBdIxqi5L4OS92FYylWH.pdf', '2022-10-20 06:12:14', '2022-10-20 06:12:14');

-- --------------------------------------------------------

--
-- Table structure for table `course_motive`
--

CREATE TABLE `course_motive` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `motive1` varchar(100) DEFAULT NULL,
  `motive2` varchar(100) DEFAULT NULL,
  `motive3` varchar(100) DEFAULT NULL,
  `motive4` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_motive`
--

INSERT INTO `course_motive` (`id`, `course_id`, `motive1`, `motive2`, `motive3`, `motive4`, `created_at`, `updated_at`) VALUES
(1, 35, NULL, NULL, NULL, NULL, '2022-10-02 14:39:35', '2022-10-02 14:39:35'),
(2, 36, NULL, NULL, NULL, NULL, '2022-10-02 14:40:49', '2022-10-02 14:40:49'),
(3, 37, 'h', 'dfb', 'bgf', 'fvvd', '2022-10-02 14:41:11', '2022-10-02 14:41:11'),
(4, 38, NULL, NULL, NULL, NULL, '2022-10-04 10:15:16', '2022-10-04 10:15:16'),
(5, 39, 'pythons ', 'ml', 'ai ', 'ok', '2022-10-06 05:59:35', '2022-10-06 05:59:35'),
(6, 40, 'HTML', 'CSS', 'PHP', 'JS', '2022-10-07 16:09:34', '2022-10-07 16:09:34'),
(7, 41, 'concepts and the fact', 'concepts and the fact', 'concepts and the fact', 'concepts and the fact', '2022-10-20 05:59:57', '2022-10-20 05:59:57'),
(8, 42, 'You will Learn HTML', 'You will get a certification after the course that you can print', 'You will learn CSS', 'You will get the skills you need to make websites', '2022-11-04 06:54:54', '2022-11-04 06:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `course_projects`
--

CREATE TABLE `course_projects` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `project_name` text NOT NULL,
  `project_short_description` text DEFAULT NULL,
  `project_long_description` text NOT NULL,
  `project_file` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_projects`
--

INSERT INTO `course_projects` (`id`, `course_id`, `project_name`, `project_short_description`, `project_long_description`, `project_file`, `created_at`, `updated_at`) VALUES
(1, 6, 'wow', NULL, 'add-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-projectadd-course-project', 'files/course_project/CKL0sSGOgmn2IwqI7HjqSqe4c7jpS2MjPtoZsv37.zip', '2022-10-05 10:23:11', '2022-10-05 10:23:11'),
(2, 2, 'Paint DDD', NULL, 'gogogogogogogogogogogogogogogogogogogogogogogogogogogogogogogogogogogogogogogogov', 'files/course_project/hPr99DL7tmWKXP8u8UKrglFxTWWyT5S4ypBfZxaj.zip', '2022-10-05 10:26:48', '2022-10-05 10:26:48'),
(3, 2, 'Paint DDD', NULL, 'gogogogogogogogogogogogogogogogogogogogogogogogogogogogogogogogogogogogogogogogov', 'files/course_project/r6N9BMFs4HgMVLa4Wv8Kkgw0l5xavW9nspZmaJTE.zip', '2022-10-05 10:40:48', '2022-10-05 10:40:48');

-- --------------------------------------------------------

--
-- Table structure for table `course_ratings`
--

CREATE TABLE `course_ratings` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `status` set('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_ratings`
--

INSERT INTO `course_ratings` (`id`, `course_id`, `rating`, `comment`, `student_id`, `name`, `userid`, `status`, `created_at`, `updated_at`) VALUES
(1, 37, 3, 'Nice Tutor', 1, 'Alok', 18, 'Approved', '2022-09-24 11:08:35', '2022-09-24 11:08:35'),
(2, 2, 4, 'Nice Tutor', 2, 'AlRaok', 3, 'Pending', '2022-09-24 11:09:03', '2022-09-24 11:09:03'),
(3, 37, 3, 'Nice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice TutorNice Tutorv', 2, 'AlRaok', 13, 'Approved', '2022-09-24 11:09:03', '2022-09-24 11:09:03');

-- --------------------------------------------------------

--
-- Table structure for table `course_requirements`
--

CREATE TABLE `course_requirements` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `requirement_1` text DEFAULT NULL,
  `requirement_2` text DEFAULT NULL,
  `requirement_3` text DEFAULT NULL,
  `requirement_4` text DEFAULT NULL,
  `requirement_5` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_requirements`
--

INSERT INTO `course_requirements` (`id`, `course_id`, `requirement_1`, `requirement_2`, `requirement_3`, `requirement_4`, `requirement_5`, `created_at`, `updated_at`) VALUES
(1, 35, NULL, NULL, NULL, NULL, NULL, '2022-10-02 14:39:35', '2022-10-02 14:39:35'),
(2, 36, NULL, NULL, NULL, NULL, NULL, '2022-10-02 14:40:49', '2022-10-02 14:40:49'),
(3, 37, 'j', 'pythob basic', 'pythob basic', 'pythob basic', 'pythob basic', '2022-10-02 14:41:11', '2022-10-02 14:41:11'),
(4, 38, NULL, NULL, NULL, NULL, NULL, '2022-10-04 10:15:16', '2022-10-04 10:15:16'),
(5, 39, NULL, NULL, NULL, NULL, NULL, '2022-10-06 05:59:35', '2022-10-06 05:59:35'),
(6, 40, 'Nothing', NULL, NULL, NULL, NULL, '2022-10-07 16:09:34', '2022-10-07 16:09:34'),
(7, 41, 'concepts and the fact', NULL, NULL, NULL, NULL, '2022-10-20 05:59:57', '2022-10-20 05:59:57'),
(8, 42, 'Web Browser', NULL, NULL, NULL, NULL, '2022-11-04 06:54:54', '2022-11-04 06:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `course_review_requests`
--

CREATE TABLE `course_review_requests` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) NOT NULL,
  `status` set('Pending','Approved','Rejected') DEFAULT 'Pending',
  `date` date NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_review_requests`
--

INSERT INTO `course_review_requests` (`id`, `course_id`, `teacher_id`, `status`, `date`, `created_at`, `updated_at`) VALUES
(1, 38, 2, 'Pending', '2022-10-05', '2022-10-05 12:23:36', '2022-10-05 12:23:36');

-- --------------------------------------------------------

--
-- Table structure for table `course_sections`
--

CREATE TABLE `course_sections` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `section_no` int(11) DEFAULT NULL,
  `section_title` text DEFAULT NULL,
  `section_description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_sections`
--

INSERT INTO `course_sections` (`id`, `course_id`, `section_no`, `section_title`, `section_description`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Nice', 'Very Nice', '2022-10-02 16:30:56', '2022-10-02 16:30:56'),
(2, 2, 2, 'Nice', 'Very Nice', '2022-10-02 16:30:56', '2022-10-02 16:30:56'),
(3, 37, 1, 'Introduction', 'intro', '2022-10-04 11:28:40', '2022-10-04 11:28:40'),
(4, 37, 1, 'Introduction', 'intro', '2022-10-04 11:28:59', '2022-10-04 11:28:59'),
(5, 37, 1, 'Introduction', 'intro', '2022-10-04 11:33:17', '2022-10-04 11:33:17'),
(6, 37, 1, 'Introduction', 'intro', '2022-10-04 11:33:39', '2022-10-04 11:33:39'),
(7, 37, 1, 'h', 'g', '2022-10-04 11:55:06', '2022-10-04 11:55:06'),
(8, 38, 1, 'nice', 'view', '2022-10-04 12:23:09', '2022-10-04 12:23:09'),
(9, 38, 2, 'f', 'f', '2022-10-04 12:23:49', '2022-10-04 12:23:49'),
(10, 38, 3, 'great', '2bnh', '2022-10-04 13:09:46', '2022-10-04 13:09:46'),
(11, 7, 4, 'Introduction', 'tuio', '2022-10-04 13:36:12', '2022-10-04 13:36:12'),
(12, 7, 5, 'j', 'f', '2022-10-04 13:42:09', '2022-10-04 13:42:09'),
(13, 6, 1, 'Introduction', 'five', '2022-10-04 13:46:23', '2022-10-04 13:46:23'),
(14, 2, 2, 'main', 'main', '2022-10-05 09:08:08', '2022-10-05 09:08:08'),
(15, 7, 2, 'main', 'main', '2022-10-05 09:09:54', '2022-10-05 09:09:54'),
(16, 2, 3, '3', '3', '2022-10-05 09:16:29', '2022-10-05 09:16:29'),
(17, 2, 3, '3', '3', '2022-10-05 09:17:43', '2022-10-05 09:17:43'),
(18, 2, 3, '3', '3', '2022-10-05 09:17:51', '2022-10-05 09:17:51'),
(19, 2, 3, '3', '3', '2022-10-05 09:18:56', '2022-10-05 09:18:56'),
(20, 2, 3, '3', '3', '2022-10-05 09:19:01', '2022-10-05 09:19:01'),
(21, 2, 3, '3', '3', '2022-10-05 09:19:34', '2022-10-05 09:19:34'),
(22, 2, 3, '3', '3', '2022-10-05 09:22:22', '2022-10-05 09:22:22'),
(23, 2, 3, '3', '3', '2022-10-05 09:24:21', '2022-10-05 09:24:21'),
(24, 2, 3, '3', '3', '2022-10-05 09:24:49', '2022-10-05 09:24:49'),
(25, 2, 3, '3', '3', '2022-10-05 09:25:15', '2022-10-05 09:25:15'),
(26, 2, 3, '3', '3', '2022-10-05 09:26:55', '2022-10-05 09:26:55'),
(27, 2, 3, '3', '3', '2022-10-05 09:27:41', '2022-10-05 09:27:41'),
(28, 2, 3, '3', '3', '2022-10-05 09:28:56', '2022-10-05 09:28:56'),
(29, 39, 1, 'Welcome', 'Here is basic Welcome section of this course.', '2022-10-06 06:03:54', '2022-10-06 06:03:54'),
(30, 41, 1, 'introduction', 'introduction and the fact', '2022-10-20 06:03:29', '2022-10-20 06:03:29'),
(31, 42, 1, 'Introduction', 'introduction is the first section where we will get some basics intro', '2022-11-04 06:58:07', '2022-11-04 06:58:07'),
(32, 42, 2, 'Introduction', '76868hgh', '2022-11-19 09:46:06', '2022-11-19 09:46:06');

-- --------------------------------------------------------

--
-- Table structure for table `enrolled_courses`
--

CREATE TABLE `enrolled_courses` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `enrollment_date` date NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrolled_courses`
--

INSERT INTO `enrolled_courses` (`id`, `userid`, `course_id`, `enrollment_date`, `created_at`, `updated_at`) VALUES
(1, 18, 37, '0000-00-00', '2022-10-11 11:57:10', '2022-10-11 11:57:10'),
(2, 18, 39, '0000-00-00', '2022-10-11 11:57:53', '2022-10-11 11:57:53'),
(3, 18, 38, '0000-00-00', '2022-10-11 11:58:37', '2022-10-11 11:58:37'),
(4, 18, 39, '2022-10-11', '2022-10-11 11:59:56', '2022-10-11 11:59:56'),
(5, 18, 37, '0000-00-00', '2022-10-11 11:57:10', '2022-10-11 11:57:10'),
(6, 18, 23, '0000-00-00', '2022-10-11 11:57:53', '2022-10-11 11:57:53'),
(7, 18, 38, '0000-00-00', '2022-10-11 11:58:37', '2022-10-11 11:58:37'),
(8, 18, 39, '2022-10-11', '2022-10-11 11:59:56', '2022-10-11 11:59:56'),
(9, 18, 2, '2022-10-24', '2022-10-24 09:08:38', '2022-10-24 09:08:38'),
(10, 18, 37, '2022-10-27', '2022-10-27 13:35:49', '2022-10-27 13:35:49');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `image` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `image`) VALUES
(1, 'files/uploads//0JJ2PCojIWPFraMT1FrzQRFUt4EAV88NjgdBl8s3.jpg'),
(2, 'files/uploads/lCpYWHYbgDK7Ln9vK4GAEqCqKNwbpCQn02blApkK.jpg'),
(3, 'files/uploads/JOhsp2by21cAc2aAeATzYTVPXULgZB1JTogDv1YN.jpg'),
(4, 'files/uploads/1p9z7HZAaZaLlPosEJsL5091ukPujibeTlW6nP4A.jpg'),
(5, 'files/uploads/vs1u19tljlgmg8vFQ6HAyevYU7OXx4NC6InY6Qn1.jpg'),
(6, 'files/uploads/OQsguHH8lhc7zQpCnrJLF4iPM1oNKZx02cUEKRYB.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2015_05_06_194030_create_youtube_access_tokens_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
('00a9306de532805c3fafdfa3b9670a62251d037f41a9e3f1bebaa520fd97ffa3518831d7ea307c43', 3, 1, 'token', '[]', 1, '2022-09-22 04:09:46', '2022-09-22 04:10:08', '2023-09-22 09:39:46'),
('0305c9fda337956db19fcf4620336a3205cb7c6c2425056a4e4bb38febd4a4614f946f0f6b5fec92', 3, 1, 'Token', '[]', 0, '2022-09-22 05:52:58', '2022-09-22 05:52:58', '2023-09-22 11:22:58'),
('0527292dd55ce6bbb1925bb416c00dd0a1c78a9d6a8235eb703597a4a3057aefb388b95342c8e3dc', 18, 1, 'token', '[]', 0, '2022-10-27 08:01:59', '2022-10-27 08:01:59', '2023-10-27 13:31:59'),
('07d2df4744af6384f4dcc10d8c50fbe7ba5d4cfb34097f2b9a61a7b6e19ec1c23758398d50340057', 18, 1, 'token', '[]', 0, '2022-10-07 23:57:52', '2022-10-07 23:57:52', '2023-10-08 05:27:52'),
('084a73638be54587b5a3deb89af3d99bfb016dc0cf387ae17d9f043e41d295f3e29a30fefb0475a6', 3, 1, 'token', '[]', 0, '2022-09-22 03:40:01', '2022-09-22 03:40:01', '2023-09-22 09:10:01'),
('094b8da444522a3ee05f0a6ccb234b9b539f7262efffe27583ca7e1f071ece5f87f49d9104605987', 12, 1, 'token', '[]', 0, '2022-09-24 07:07:56', '2022-09-24 07:07:56', '2023-09-24 12:37:56'),
('0951a1daa1e17a9238b480c949b1b91cb4152983893ef1b354f0e9e293fdfb2f7f7d095b45712bb2', 12, 1, 'token', '[]', 0, '2022-09-24 07:06:51', '2022-09-24 07:06:51', '2023-09-24 12:36:51'),
('0a7db8c26411bc8802d734f437323ec1d12a627284d35b1bd1360e4afe89538a787d82c0b24e78b3', 15, 1, 'token', '[]', 0, '2022-09-24 07:11:19', '2022-09-24 07:11:19', '2023-09-24 12:41:19'),
('0a85b67a54c2ec9aa9f0b682ae1e2b370a7a0cbc093979c5f3e21afd899b4fa941dd02ad665d1b8e', 13, 1, 'token', '[]', 0, '2022-10-03 01:56:20', '2022-10-03 01:56:20', '2023-10-03 07:26:20'),
('0ae8d789d93731795424a55a564d72a7e6f5da9d6062bbb422b00645634b24fe9232907fe6502bad', 19, 1, 'Token', '[]', 0, '2023-03-23 03:08:58', '2023-03-23 03:08:58', '2024-03-23 08:38:58'),
('0b006336d4a4c8bcf6a4228e892b91c7831cb7d59e691b31b8877e60baca541eb3d63da46b771aeb', 13, 1, 'token', '[]', 0, '2022-10-01 22:33:27', '2022-10-01 22:33:27', '2023-10-02 04:03:27'),
('1031a4407ef9bdc8132725e417c76e080c78f609959c669e8eb91230eff9b096469de83e44a11244', 18, 1, 'token', '[]', 0, '2022-10-10 07:42:19', '2022-10-10 07:42:19', '2023-10-10 13:12:19'),
('130d630c96ecdf67146c72528ab793c0b51cfbbc25e5986efe9634eb241ca14c0c9af936f085aba2', 13, 1, 'token', '[]', 1, '2022-10-06 11:03:43', '2022-10-06 11:28:23', '2023-10-06 16:33:43'),
('1317d96902d2f7d8c8c96776e61d7711668b06095c6639641495556da47dab12b759e38592000125', 13, 1, 'token', '[]', 0, '2022-09-26 00:14:23', '2022-09-26 00:14:23', '2023-09-26 05:44:23'),
('14d4535d33453c870c36e390dc5f336686b9a0741720b118a6435778c63484747eab255c91555706', 13, 1, 'token', '[]', 1, '2022-10-06 11:00:48', '2022-10-06 11:01:20', '2023-10-06 16:30:48'),
('16f9c60a740559ac92eef1e2ba88c2c9f0037692f65fcc3f38941aed266f6e969182212a33de9364', 18, 1, 'token', '[]', 0, '2022-10-24 03:31:18', '2022-10-24 03:31:18', '2023-10-24 09:01:18'),
('1dfdb3ed5c65a067b576e7245d049b3b8b0c20e60f1e80e862c218c3372009e5c56864946630e900', 15, 1, 'Token', '[]', 0, '2022-09-24 06:33:46', '2022-09-24 06:33:46', '2023-09-24 12:03:46'),
('2184b569aeead397e0869972d3b63755225e6ed55a2bea07148fbeb62d2fe3697f03ac92932b047b', 18, 1, 'token', '[]', 0, '2022-10-06 11:31:58', '2022-10-06 11:31:58', '2023-10-06 17:01:58'),
('237789e6c42656afc68bd31235af085c745278bbd40889b0545702527b7c92dcdcf9f11caf7b324e', 18, 1, 'token', '[]', 1, '2022-11-19 04:10:18', '2022-11-19 04:10:35', '2023-11-19 09:40:18'),
('261ca9462cbc879581afdc709f1f8533d1bb28bd2554453f045ac69977549939a998c3dc19ef5cf6', 17, 1, 'token', '[]', 0, '2022-09-26 06:53:27', '2022-09-26 06:53:27', '2023-09-26 12:23:27'),
('26d69ae672aa2c0340897a3d47c21a7d11d6658bfbde2383f4c2a6be1e461d9935bb3bd4a13f5840', 3, 1, 'token', '[]', 0, '2022-09-22 03:39:13', '2022-09-22 03:39:13', '2023-09-22 09:09:13'),
('2730e816f205dd16b8b6a4d32f4be8beabb32074a6fbf087b82b10816fdec9c4d37d502b65d86d3b', 18, 1, 'token', '[]', 0, '2022-10-08 00:50:24', '2022-10-08 00:50:24', '2023-10-08 06:20:24'),
('286b533711e89f7f64c1d3f44bda63d28c744e39b17b0c8a2a25c996e0c0268d9d2b1aee68cce267', 13, 1, 'token', '[]', 0, '2022-09-25 01:04:01', '2022-09-25 01:04:01', '2023-09-25 06:34:01'),
('28d7cb5dff80772031170bac75af3e5e8f497c307aaea00308ba2bad60fce2678ab10e3a2068aebf', 13, 1, 'token', '[]', 1, '2022-10-13 10:23:17', '2022-10-13 10:23:47', '2023-10-13 15:53:17'),
('29bb3a5a78b432bf7f86ec9e3507274f06131034e209d50258f379556ad378a9797fd3c9b8bdb386', 13, 1, 'token', '[]', 0, '2022-10-06 10:59:07', '2022-10-06 10:59:07', '2023-10-06 16:29:07'),
('2c18b29f7141f90ffcc34efdf1311e7301f56d8cb0401e3902b5b04f0b1140b21fb1fb8d507eaaa5', 13, 1, 'token', '[]', 0, '2022-09-25 02:49:44', '2022-09-25 02:49:44', '2023-09-25 08:19:44'),
('2da451a46a66772b0cda1ea7e49c90548e99d670406efafd6ae32c87648aa0a40174e7868ac8b56b', 3, 1, 'token', '[]', 0, '2022-09-22 03:39:04', '2022-09-22 03:39:04', '2023-09-22 09:09:04'),
('307ae40040e182a125250402aa447a820d23e744d0fc933a0596ebb4b9e0f19a47d3c4c72381e161', 13, 1, 'token', '[]', 0, '2022-09-30 10:38:02', '2022-09-30 10:38:02', '2023-09-30 16:08:02'),
('31406da7def81e1cf1728ad76df1314235f541a7ac09d61b69a93ba4689d37bf1714faf0389dd1c9', 12, 1, 'Token', '[]', 0, '2022-09-24 06:23:37', '2022-09-24 06:23:37', '2023-09-24 11:53:37'),
('34f4abf9cd8a7ac4a485a425140402c2591559fcf1356ff1f4756543693a6251f67307bff78f0561', 18, 1, 'token', '[]', 0, '2022-10-08 00:38:05', '2022-10-08 00:38:05', '2023-10-08 06:08:05'),
('35d9df0fd455ea5da6f913ead0ab0ac2636f47fc157f11a3f937d2dcf82d9587ec15bfe62133c3cf', 18, 1, 'token', '[]', 0, '2022-10-08 00:57:14', '2022-10-08 00:57:14', '2023-10-08 06:27:14'),
('38224de2383f5ed103fe1c11088ae4a1926ca7d24bd57866dfe56779e28350910f283be7688f27e4', 18, 1, 'token', '[]', 0, '2022-10-08 00:29:01', '2022-10-08 00:29:01', '2023-10-08 05:59:01'),
('394175867c2fa45a18be589713eee9860fbbf4157fc5678f4c00cde7dae0c03925464089bf5a9e04', 13, 1, 'token', '[]', 0, '2022-10-27 08:01:44', '2022-10-27 08:01:44', '2023-10-27 13:31:44'),
('39fee142e74917067c3471543242676a12e16c6b5321cc19364f25feb59bd50b59d178576e422380', 13, 1, 'token', '[]', 0, '2022-10-20 00:27:18', '2022-10-20 00:27:18', '2023-10-20 05:57:18'),
('3a1fa4d9d811741a29fc6b8180a8d8446fd5e9e9c155d0cd2e50442b2d8c304061423c3a9dfdc470', 11, 1, 'Token', '[]', 0, '2022-09-23 04:38:14', '2022-09-23 04:38:14', '2023-09-23 10:08:14'),
('3a6b4680f261a6cd362b7cf6f6c47980b372bd737ecb313adc2d33587abeffef5e7122fc216041a5', 18, 1, 'token', '[]', 1, '2022-10-08 01:05:13', '2022-10-08 01:21:15', '2023-10-08 06:35:13'),
('3eb3f1cab100755e976fc1a42d32d1ba9df5f966bdc2697e2221fdcebd75244910c48fe9135732ef', 13, 1, 'token', '[]', 0, '2022-10-06 10:54:59', '2022-10-06 10:55:00', '2023-10-06 16:24:59'),
('3ed4dde3c0dc08314df26b81840c0285bd2a077657e0f1e46f9a787efd0b3a3847b79c67ac5dc730', 13, 1, 'token', '[]', 0, '2022-09-30 11:24:24', '2022-09-30 11:24:24', '2023-09-30 16:54:24'),
('414765b6c408ce77564aef6be1159bac6bfd65fb48801a808bfc1a7ee649838faeb62d438e78961a', 13, 1, 'token', '[]', 0, '2022-10-06 11:36:48', '2022-10-06 11:36:48', '2023-10-06 17:06:48'),
('446e6ff24013c59f533e31540e61c2fb66bab4ead8c5bd64f5e6974530a8f81fe6b6244b06966cc1', 12, 1, 'token', '[]', 0, '2022-09-24 07:13:27', '2022-09-24 07:13:27', '2023-09-24 12:43:27'),
('4503a820b30e8d4c023bfd85e37d1b6501d6b4b3b3e2d39f806b54a16de79d213de63ab2884150cd', 12, 1, 'token', '[]', 0, '2022-09-24 08:33:16', '2022-09-24 08:33:16', '2023-09-24 14:03:16'),
('46c88c21ed1f9d0d63c35cdb1cb448b67af1c8eb5416f4902921fa4a11d903eef7c8e3100a3c8968', 12, 1, 'token', '[]', 0, '2022-09-24 07:12:27', '2022-09-24 07:12:27', '2023-09-24 12:42:27'),
('48f5da21685e2a5ee09351ddf1af883353d67e4c9b2c9cdd580e515c62babd2716a582f91d95abc2', 18, 1, 'token', '[]', 0, '2022-10-06 11:34:00', '2022-10-06 11:34:00', '2023-10-06 17:04:00'),
('48f790e05978c8b7cc3e0964ae04bd23ac590a7734ca0e0e94cfc56512a9f84c5759751bcd130e7a', 12, 1, 'token', '[]', 0, '2022-09-24 08:31:09', '2022-09-24 08:31:09', '2023-09-24 14:01:09'),
('49eb4b772d9a38473bd9a00ba5eff1955b0a94e13fc2a73b7aeab7d76453d4a2183e3cca776889b4', 18, 1, 'token', '[]', 0, '2022-10-27 23:21:18', '2022-10-27 23:21:18', '2023-10-28 04:51:18'),
('4afe9a474f1bf6886c1821ceebe3391dc30ca033dee8124a4e1906a8d944c3146380d1801615e93e', 18, 1, 'token', '[]', 0, '2022-10-08 00:37:23', '2022-10-08 00:37:23', '2023-10-08 06:07:23'),
('4b00e5f37c8e22f24d02ba190c4d8805f0e19444c2225c5fc8427f16915489af069cd04f918416b6', 13, 1, 'token', '[]', 0, '2022-10-06 11:37:34', '2022-10-06 11:37:34', '2023-10-06 17:07:34'),
('4b70912d6f11e3657f8bc35c069f7b54bc1029f85429da05ab46cc8cdcf491754a5c7239eddf0dc3', 13, 1, 'token', '[]', 0, '2022-09-25 06:42:52', '2022-09-25 06:42:52', '2023-09-25 12:12:52'),
('4ba30ba8a0027bd7622106ad302cde38ef155363709a8d21c05ddf722f5cc8c1754ca206dac52403', 17, 1, 'token', '[]', 0, '2022-09-26 06:49:37', '2022-09-26 06:49:38', '2023-09-26 12:19:37'),
('4e7a9c5512fb0961d1334c055c7c5cbf5803b0721b054a836387d96509982f124103fc85343e0577', 13, 1, 'token', '[]', 0, '2022-11-04 01:21:19', '2022-11-04 01:21:19', '2023-11-04 06:51:19'),
('5082fee2b6b25a749067db1c15e90ba0d4ff859a49da1030c5d32366a04adccd7ad6e269003c6112', 18, 1, 'token', '[]', 0, '2022-10-08 00:31:12', '2022-10-08 00:31:12', '2023-10-08 06:01:12'),
('513042492b867b070566a05b6670a8c0727a0d2f9e8ce26b28bac6342f993a8327e7ad6ed3f00968', 18, 1, 'token', '[]', 0, '2022-10-08 00:33:59', '2022-10-08 00:33:59', '2023-10-08 06:03:59'),
('52ba77670dd590392d0e4b741bef32211a29ffe5334aa8327c10b0c54ab159551de514d4793c7092', 14, 1, 'Token', '[]', 0, '2022-09-24 06:31:30', '2022-09-24 06:31:30', '2023-09-24 12:01:30'),
('578eb0b5358882f6e8dab5cba958654ae0f119228bd55680d95fa72d883244b22949013a13217b0e', 13, 1, 'token', '[]', 1, '2022-10-06 10:59:27', '2022-10-06 11:00:35', '2023-10-06 16:29:27'),
('597c20c80415c0010c27b3e20f79304ce94b9cd199ab99628da9cc5df00d083bec60e0f6d00e4183', 12, 1, 'token', '[]', 0, '2022-09-24 07:09:14', '2022-09-24 07:09:14', '2023-09-24 12:39:14'),
('599b08d99d7a319c1df868775cd0f57d0a1e8a070211df5f2ab8a6b823fc8ca6866a8699b2a380f8', 18, 1, 'token', '[]', 1, '2022-10-07 00:16:49', '2022-10-07 10:45:57', '2023-10-07 05:46:49'),
('5a0007541838d3b2797f9a0f71de1d6e5fe97288fe6fb720116bd694df89311800eacc59abcd4300', 13, 1, 'token', '[]', 0, '2022-09-24 07:11:49', '2022-09-24 07:11:49', '2023-09-24 12:41:49'),
('5b92d2a89537fbf0b9bf4bca1a7f5260560ddd67a7affc60c64fd0fdc694c95c9054023bab3e862f', 18, 1, 'token', '[]', 0, '2022-11-19 01:57:10', '2022-11-19 01:57:11', '2023-11-19 07:27:10'),
('5c038466531e016f707cfa8251873cc734349aaf477af9b1e2cbbf8be1a66aa235aadc156f504bb5', 16, 1, 'Token', '[]', 0, '2022-09-24 06:36:48', '2022-09-24 06:36:48', '2023-09-24 12:06:48'),
('5d134f9dc5523491dd7a8d8af6c816a45f6fcf1376e5ca274cecb4b8c6d27134ae96d42582c8cba1', 13, 1, 'token', '[]', 0, '2022-09-25 01:44:49', '2022-09-25 01:44:49', '2023-09-25 07:14:49'),
('5f4f57c4b00d53da1e80329213538fa1876d911b5bc5f568bfc323791433f61f0444bf36189bc645', 18, 1, 'token', '[]', 1, '2022-10-11 05:34:33', '2022-10-13 10:21:22', '2023-10-11 11:04:33'),
('6019b8fe1d66554e506f740a9fdf453c656f6b71350a3d9146b0d1ffb7c21f96cafc1fa4955492a6', 13, 1, 'token', '[]', 0, '2022-10-02 08:22:15', '2022-10-02 08:22:15', '2023-10-02 13:52:15'),
('60d2178adf015c7b222d54a4adcd778d06ad01d76d70cffc624bde5b4013a43ff086d16dc63b6862', 3, 1, 'Token', '[]', 0, '2022-09-22 05:54:14', '2022-09-22 05:54:14', '2023-09-22 11:24:14'),
('625d63ab8a0c73f843c28a7d0f9e74ba7ab0c1f06fed6096a6c835320bc55f5804c6cd2964877528', 8, 1, 'token', '[]', 0, '2022-09-24 08:33:37', '2022-09-24 08:33:38', '2023-09-24 14:03:37'),
('62e271fb7ad75e6d373344e2bc3b9d079bad34bb5dddf0e6ef8c9572734febaf6eef29c122be4ef0', 18, 1, 'token', '[]', 0, '2022-10-08 00:11:03', '2022-10-08 00:11:03', '2023-10-08 05:41:03'),
('634857e4a884d11c4a782f49f328e2aff8a3c4be761cb0a34286d957bc4b2e3d594a9f54d0d2105e', 18, 1, 'token', '[]', 0, '2022-10-06 11:38:04', '2022-10-06 11:38:04', '2023-10-06 17:08:04'),
('667dfe74235ab5f442e370a511fd0ccf614f6057018e338a645875a059c4f2cd69f6472ff031d9fc', 3, 1, 'Token', '[]', 0, '2022-09-22 05:49:46', '2022-09-22 05:49:46', '2023-09-22 11:19:46'),
('674498cae947a47e6bf193b05498da8adda478b01ad5f5b7a9c330b5865e7c34958b72035d3adfe3', 18, 1, 'token', '[]', 0, '2022-10-06 11:42:54', '2022-10-06 11:42:54', '2023-10-06 17:12:54'),
('685bb3320f8de39498d3e6e495202b16a5bc4cf48c845be036161b21598c32d0db43bef206beb6ea', 18, 1, 'token', '[]', 0, '2022-10-08 00:29:14', '2022-10-08 00:29:14', '2023-10-08 05:59:14'),
('68a52deffbd6e6e0329a279b6af07c1ce919f2d14643e62ff4c7de88f8f457707a51d29bce2d5a8a', 12, 1, 'token', '[]', 0, '2022-09-24 07:16:45', '2022-09-24 07:16:45', '2023-09-24 12:46:45'),
('6dbf30574f680a71602f5c52b956000c61ae229631b456e6e1b478870cc1a162862eaa301f8f3202', 18, 1, 'Token', '[]', 0, '2022-10-06 11:29:19', '2022-10-06 11:29:19', '2023-10-06 16:59:19'),
('6e0d7d346d1eb8e7830db892f8f83561bc7a861ba7082a258d691be50b8f14ef9d3dc60411232518', 18, 1, 'token', '[]', 0, '2022-10-08 00:58:40', '2022-10-08 00:58:40', '2023-10-08 06:28:40'),
('6e40c0e2ee63086bebdaef7267cd587952c0afafc8d181d35374f1e0233fe9a05b33f0f2658bbe7a', 8, 1, 'token', '[]', 0, '2022-09-24 06:56:00', '2022-09-24 06:56:00', '2023-09-24 12:26:00'),
('6e9161b5cbd9712ddbb6adbf3e6cf46c796ef4802ea8ba1287bcbc159cf3b27d606782a35ca89d0f', 18, 1, 'token', '[]', 0, '2022-10-22 22:23:33', '2022-10-22 22:23:34', '2023-10-23 03:53:33'),
('711fff4e28cd35768cedc54bdaf4a3e3442fb94a0124f7585879755772aeb29c3cfec70624e1c862', 13, 1, 'token', '[]', 1, '2022-10-06 04:39:31', '2022-10-06 04:39:39', '2023-10-06 10:09:31'),
('71ab2a3ccab2a64ecde6e44e8e3860190f67b2ea3c5456f9fad0dc635a73656870f2d7ded3fceb84', 18, 1, 'token', '[]', 0, '2022-11-19 04:25:38', '2022-11-19 04:25:38', '2023-11-19 09:55:38'),
('7279059dc3d86221fdcdccc7eb54b8c3cf9032ee4e479194b25a3253c027cb3399f7ac7b13af2edd', 3, 1, 'token', '[]', 0, '2022-09-22 03:41:29', '2022-09-22 03:41:29', '2023-09-22 09:11:29'),
('7481b3be2d6b9f03d1449aeb02c7975645be34475d9c7650d1be8c75d9fbd57853ffc11324330459', 14, 1, 'token', '[]', 0, '2022-10-06 11:35:27', '2022-10-06 11:35:27', '2023-10-06 17:05:27'),
('7487b3ad12ea2354a5ecef1a40a61c00a10a676a3e102ae75b56d452920a97134ca6d26f84350e0f', 3, 1, 'Token', '[]', 0, '2022-09-22 05:50:07', '2022-09-22 05:50:07', '2023-09-22 11:20:07'),
('75ec0b67baaceef4351108fb96f2b135f1877b63051ec11050adf8dea43ae1f8e2f5c2e782d17d66', 3, 1, 'token', '[]', 0, '2022-09-22 03:40:07', '2022-09-22 03:40:07', '2023-09-22 09:10:07'),
('76ad5e7d5f0a68f35738752f9f436bb6629e730c4082a33839ea402a3e83b84505bb03ead1904053', 13, 1, 'token', '[]', 0, '2022-09-30 13:08:20', '2022-09-30 13:08:20', '2023-09-30 18:38:20'),
('780972846d3a66e18b19cfa9d5d2752dd11f8165d2ea9e57611fed00d2a2640f44318c095c6c985e', 13, 1, 'token', '[]', 0, '2022-11-14 21:44:57', '2022-11-14 21:44:57', '2023-11-15 03:14:57'),
('7b61cfe92889c0402b6cf3d0db7a2b2fa95f824dab08b9cb24ec90d606a15e2f852fadd5ce28fa34', 2, 1, 'Token', '[]', 0, '2022-09-22 03:20:54', '2022-09-22 03:20:55', '2023-09-22 08:50:54'),
('7c129fe90c7a81e16698259889bb1023db314d64a9efa356f28ef6a1c36cff1ed96cf15aaca7110c', 18, 1, 'token', '[]', 0, '2022-10-10 08:13:38', '2022-10-10 08:13:38', '2023-10-10 13:43:38'),
('7f94cdbb423cf36614d9a92197e78106744eda3f3b3058f598f97fa82dc48626f5386f4102fc0526', 18, 1, 'token', '[]', 1, '2022-10-07 00:14:37', '2022-10-07 00:16:44', '2023-10-07 05:44:37'),
('8015adc1797486694e5f4aa6ca36e884cad58c0e56433fc9ca6afd66cebd7aa317ae32d2f02214e0', 13, 1, 'token', '[]', 0, '2022-10-01 12:03:15', '2022-10-01 12:03:15', '2023-10-01 17:33:15'),
('842a6861acb9810549fbdcfba60223c7aa37ca53a51974ad0712f90bee801c2803c8bd324c6e5e75', 18, 1, 'token', '[]', 0, '2023-03-27 05:32:02', '2023-03-27 05:32:02', '2024-03-27 11:02:02'),
('854b72985b3b6969b11a6372600f02821167a5eee8bcf6edddd51bb5e7b703187060d9e979b7beff', 3, 1, 'token', '[]', 0, '2022-09-23 03:48:39', '2022-09-23 03:48:39', '2023-09-23 09:18:39'),
('86f49d915a482c9f41242b8100eb38daabeb9e4239d505ef28bd38ff6666c82d4b401da8691eabe1', 18, 1, 'token', '[]', 1, '2022-10-06 11:32:06', '2022-10-06 11:32:44', '2023-10-06 17:02:06'),
('8b026c3627e493d59715997805a43b51c143959ad1582457754c018db049d3f978aa23dfbe61f0e7', 18, 1, 'token', '[]', 0, '2022-10-24 03:35:17', '2022-10-24 03:35:17', '2023-10-24 09:05:17'),
('8c12349b4b23ebde87df62953fcbbf370a738e1c412567a14c014e92bcb9bd4f21a0c40ee90381fe', 18, 1, 'token', '[]', 1, '2022-12-29 00:34:21', '2022-12-29 00:43:41', '2023-12-29 06:04:21'),
('8d5bd936ec1d219a0940addc54763299e3704ad4e3e039796e6b18fa5caeed5fa23ebcc141f7bfa4', 13, 1, 'token', '[]', 0, '2022-09-25 23:18:01', '2022-09-25 23:18:01', '2023-09-26 04:48:01'),
('8de13739650fcc103f17d508db961dd38506164d5bbbbf302f2812a20db2a20e328ab8dc9f5cf58f', 10, 1, 'Token', '[]', 0, '2022-09-23 01:05:01', '2022-09-23 01:05:01', '2023-09-23 06:35:01'),
('8ecf229960f9c5ad332e3355b8041a4b761284075baa48fd6860b95858d8c0616e100597b4e4990f', 18, 1, 'token', '[]', 0, '2022-10-08 00:34:18', '2022-10-08 00:34:18', '2023-10-08 06:04:18'),
('8f1d2d02f2c2610d705d0fb30cc669df2040a2a8715f940d98437a350b6cff7feb06316992a691b4', 18, 1, 'token', '[]', 0, '2022-10-08 00:39:18', '2022-10-08 00:39:18', '2023-10-08 06:09:18'),
('91535c394fe90e84ede4ff40900b4a3ab68609fe47fa9b84e2eba5c86a0f74c19c2e54ca00321b7c', 13, 1, 'token', '[]', 0, '2022-09-30 07:33:15', '2022-09-30 07:33:15', '2023-09-30 13:03:15'),
('92c70f6ec4a4e33d2791de7b020c9de0adf3cdbf909a426a3efd9d482f80ea5b1f967b6d78bde694', 18, 1, 'token', '[]', 1, '2022-10-10 02:22:32', '2022-10-10 02:23:06', '2023-10-10 07:52:32'),
('93d00f3d36e681132427573e2b82eed540091e2deefccd3956d503d232f84b56d8c27c6f973ffd12', 18, 1, 'token', '[]', 0, '2022-10-20 00:24:32', '2022-10-20 00:24:32', '2023-10-20 05:54:32'),
('943be4d61bf8341c5923ccda878cc3ffd71bc7d50c83b10d568f9fcbfc26a546bd0a69b1f289c86d', 18, 1, 'token', '[]', 0, '2022-10-06 11:30:21', '2022-10-06 11:30:21', '2023-10-06 17:00:21'),
('9532574048999bf9bbf9345b0ee581dd85de0b6e7a1d1f1874ad147fd092f3561cb06b93a8d7394f', 3, 1, 'Token', '[]', 0, '2022-09-22 05:50:09', '2022-09-22 05:50:09', '2023-09-22 11:20:09'),
('96569ecd7d76a0551ac6a6f5630ae498ee0b2475cd4b6de43ff4d1e29868dc0ca57bfae8d521eb80', 15, 1, 'token', '[]', 0, '2022-09-24 07:09:47', '2022-09-24 07:09:47', '2023-09-24 12:39:47'),
('9731c2158a2fdec679f0214dad94e8690213c9cb1f0e703873a3babd7a9dee57125e8e648354f58c', 18, 1, 'token', '[]', 0, '2022-10-08 00:37:59', '2022-10-08 00:38:00', '2023-10-08 06:07:59'),
('99e35bda16aa11dd4b2fcfb65b1892f06259bfab5e00b5311e850403ee7a77cbec8699a228e5dc52', 18, 1, 'token', '[]', 0, '2022-11-15 21:18:28', '2022-11-15 21:18:28', '2023-11-16 02:48:28'),
('9d4e647389077719ec1d2d557b9a2d37820350f7c5ca31591db6f363c8d93ca95b4ce0cb0572937c', 3, 1, 'token', '[]', 0, '2022-09-22 03:39:58', '2022-09-22 03:39:59', '2023-09-22 09:09:58'),
('9fd908bbdb019fb0e995bb0f3053535c54bb6eb26811cca6185e50f5db865d2aecd2111c3c32c86d', 13, 1, 'Token', '[]', 0, '2022-09-24 06:29:04', '2022-09-24 06:29:04', '2023-09-24 11:59:04'),
('a28b99c0f381cf21cd45d60cd1e2b06eb274b65bc88950f5222e15be7d69a9108b6c4ed3fa4d9b0b', 3, 1, 'token', '[]', 0, '2022-09-22 04:55:06', '2022-09-22 04:55:06', '2023-09-22 10:25:06'),
('a5fb57692eb21b18aa4476741c687cf4234e71dfaa35e56043daf8fad7979c47803598b42e1dace0', 3, 1, 'Token', '[]', 0, '2022-09-22 03:33:40', '2022-09-22 03:33:40', '2023-09-22 09:03:40'),
('a6d2fdd708f55d2a2e1ca46a658512c1f1b423a8f9e208e3f77106d12d1ae83e61ef8461799c4db6', 13, 1, 'token', '[]', 0, '2022-10-24 04:50:43', '2022-10-24 04:50:43', '2023-10-24 10:20:43'),
('aa6cb2effa05a93b350552b10fba8d91942322e07109df2b126ededf33eeb5ff7068f3fbc477ed76', 13, 1, 'token', '[]', 0, '2022-10-07 10:38:02', '2022-10-07 10:38:02', '2023-10-07 16:08:02'),
('ab12ea4927aedc9138fe1cf5540f55f18aed1164b7f68c9a3b26eb012efd60af9bd26705def09c79', 13, 1, 'token', '[]', 1, '2022-10-06 04:36:02', '2022-10-06 04:36:12', '2023-10-06 10:06:02'),
('ab40f224a0fc1104b3e49a1a55e1c5ed87571663a32da4a6af361b5c772363e869c3bbab9dff4660', 13, 1, 'token', '[]', 0, '2022-09-30 12:12:07', '2022-09-30 12:12:07', '2023-09-30 17:42:07'),
('ae5fa1faec92dffeca7ae1f115539120a305a8cfeaa7a667410cabaffae757143efd4b0d03b8e6c9', 13, 1, 'token', '[]', 1, '2022-10-03 03:50:57', '2022-10-06 04:30:54', '2023-10-03 09:20:57'),
('af6c23251973c10a7008c636b0b119b5954ef65fd7dab53d7db74744d0e4016a858d082975af5803', 18, 1, 'token', '[]', 0, '2022-10-08 00:23:32', '2022-10-08 00:23:32', '2023-10-08 05:53:32'),
('b00ffd12c33a46b1afdf5a7cff67812a09be217bc13f6787879da09052b54cc971bce0a34f3f1e98', 17, 1, 'token', '[]', 0, '2022-09-26 06:49:50', '2022-09-26 06:49:50', '2023-09-26 12:19:50'),
('b02ac2c329dc8fd6dc3decc814631e8e4a56ef077a8c7b3d805cb687422de6d41861176307e15488', 13, 1, 'token', '[]', 0, '2022-10-02 09:05:30', '2022-10-02 09:05:30', '2023-10-02 14:35:30'),
('b10020a51df73e7e51862f2240830a877e97c147ea43a908816fca565701e69df7236169dbb452d8', 18, 1, 'token', '[]', 0, '2022-10-08 00:33:37', '2022-10-08 00:33:37', '2023-10-08 06:03:37'),
('b52e3b54ccc8bca0e798403dce5f0a9989d98baa367cc56edfee7edec387e1c2769f9404a4647c5d', 18, 1, 'token', '[]', 0, '2022-10-07 00:12:08', '2022-10-07 00:12:08', '2023-10-07 05:42:08'),
('b69582945c7252eeba17eb8664de6c48ea5f3e9261479b1af9c48b934434d2f7eb7d61e8ed05cc78', 18, 1, 'token', '[]', 0, '2022-10-06 11:29:59', '2022-10-06 11:29:59', '2023-10-06 16:59:59'),
('b6dcb4c6167858440d63500e382313f91560d1af446c1154c12daf104b803ba67e97b3fb67c401f2', 3, 1, 'token', '[]', 0, '2022-09-22 03:36:31', '2022-09-22 03:36:31', '2023-09-22 09:06:31'),
('b70d8fc0e584bb8ed681e5bff259e83461e420b41b9dbd01e40b269707aa569d4816aea88536a08a', 18, 1, 'token', '[]', 0, '2022-10-08 00:33:26', '2022-10-08 00:33:26', '2023-10-08 06:03:26'),
('b7da962ea9c97c7d82fd004b056e112a63a03c586657341eb8505e63f906ed3308c4759eedb8a9a8', 13, 1, 'token', '[]', 0, '2022-10-01 07:57:49', '2022-10-01 07:57:49', '2023-10-01 13:27:49'),
('b88ddf895ca25b22ff73b97efd8ee905d300662f39b0b8f6cbdef0db16bbc305ea220e34aec61437', 13, 1, 'token', '[]', 0, '2022-10-05 10:19:46', '2022-10-05 10:19:46', '2023-10-05 15:49:46'),
('b929e104a17180615db5168c5be003d1b020f9e1d9c52c4b56466e4e8102b813b5c4f2018deab5e8', 8, 1, 'token', '[]', 0, '2022-09-24 06:54:18', '2022-09-24 06:54:18', '2023-09-24 12:24:18'),
('bad91b2797e8d2546f3e5a32f83db2c95e9b14ec4bd9e0f4d4a462b924215b7218eac26f33d1c63d', 12, 1, 'token', '[]', 0, '2022-09-24 07:18:25', '2022-09-24 07:18:25', '2023-09-24 12:48:25'),
('bb1781e3f732e53a93755ff2875e2b62ed5ebcb533d163e7ce5be97bebeaf77ebd431ce171a69a63', 18, 1, 'token', '[]', 1, '2022-10-07 00:08:16', '2022-10-07 00:11:31', '2023-10-07 05:38:16'),
('bc5cb20b1725f92ac9fe28c34279779c8a4746028f94823302801f49b04cd43055849b105502fc1b', 18, 1, 'token', '[]', 1, '2022-10-07 00:02:58', '2022-10-07 00:08:11', '2023-10-07 05:32:58'),
('bd1d6741d5b7da3e8fe017235ab217d7dc84bec7608895ffebeb78aaa407a7781d0d573cf3e2bbfc', 12, 1, 'token', '[]', 0, '2022-09-25 01:03:18', '2022-09-25 01:03:18', '2023-09-25 06:33:18'),
('bd870da69506fbdcb4c1cf2705872c56b094151e3b55f5357235fa9fd75d59c7af5a0ecb175be91a', 13, 1, 'token', '[]', 0, '2022-09-25 04:52:12', '2022-09-25 04:52:12', '2023-09-25 10:22:12'),
('bdbe69d96183ab56af9fdebcf5e4ba6482af4efe61cde933df0c0cf461dc39f192ade450bda04afe', 13, 1, 'token', '[]', 1, '2022-10-06 04:50:20', '2022-10-06 09:50:38', '2023-10-06 10:20:20'),
('c0ecb139db3e78a855d712fccbaebed896f890d13420ac8e9d8d68aea48b738e47860b0bc5a2dcfb', 18, 1, 'token', '[]', 0, '2023-03-27 05:26:37', '2023-03-27 05:26:37', '2024-03-27 10:56:37'),
('c27dd421e6ed286d85e3fe8ea003fefc4ff05cb273f498b2e5595fb649b57f7768efb7130f3aa581', 13, 1, 'token', '[]', 0, '2022-09-26 07:05:08', '2022-09-26 07:05:08', '2023-09-26 12:35:08'),
('c47be53bde9a30102257c86b6f86ed494b4a5ee42c0c5f5bfff0b7961d44694628b152208fac48f5', 18, 1, 'token', '[]', 0, '2022-10-06 11:42:09', '2022-10-06 11:42:09', '2023-10-06 17:12:09'),
('c8d8813c0ad2c43584f5a4ed67587109a91b2c8ea3b388dd75c5b1ee5c70cbe5cf90ffe3877153e5', 13, 1, 'token', '[]', 0, '2022-09-28 05:17:21', '2022-09-28 05:17:21', '2023-09-28 10:47:21'),
('caa51ae9ea124edcfed2b9536379503648fd95bd20359ff10d132681d1fcd06d1dda71c63f098d89', 13, 1, 'token', '[]', 0, '2022-10-06 04:39:49', '2022-10-06 04:39:49', '2023-10-06 10:09:49'),
('cc4ba449a5f512f99b908390192f96ceb7316073812d384022e80d611f74f5fc3ab887b02f6db38c', 13, 1, 'token', '[]', 0, '2022-09-25 01:05:39', '2022-09-25 01:05:39', '2023-09-25 06:35:39'),
('ce9c2f535763e346201686e8d49e3782fe24ad459a0c836f66856d8aa8d34954e02002102edacb35', 18, 1, 'token', '[]', 1, '2022-10-07 00:13:24', '2022-10-07 00:13:34', '2023-10-07 05:43:24'),
('d2859100d3f6bb6cb2aaaceb4c5dcef405c9a8fee7ef7702d25f6d8402a038e571f66499623c14da', 17, 1, 'token', '[]', 0, '2022-09-26 06:51:55', '2022-09-26 06:51:55', '2023-09-26 12:21:55'),
('d30178891e9a15e551a4694dcb3e6a6217330c52255909c590ba08a48c2897ae7129d86f385769ad', 18, 1, 'token', '[]', 0, '2022-11-19 22:41:05', '2022-11-19 22:41:05', '2023-11-20 04:11:05'),
('d4ebc26fd449a422b11d08d099022a9d97e8c49e7fd1f052bb4eef68429f4575a0ee43728ba5c08e', 18, 1, 'token', '[]', 1, '2022-10-24 03:29:03', '2022-10-24 03:30:33', '2023-10-24 08:59:03'),
('d71e46c13dd06766dc1f55c90b15cbbecb266d2fe787146577c36bfe67391f749adee478e82b2fa2', 18, 1, 'token', '[]', 0, '2022-12-29 00:33:23', '2022-12-29 00:33:23', '2023-12-29 06:03:23'),
('dc467ff5081af855579f8c8717bb1f35f06e87512f7bc4080ae4d5e26e9bbb24d2a326b6ce84e8b7', 13, 1, 'token', '[]', 0, '2022-10-06 04:45:19', '2022-10-06 04:45:19', '2023-10-06 10:15:19'),
('de08c435bc693da167de92a686d362874f1be31520579fc680da8ca43f25455f69acf0556be45280', 13, 1, 'token', '[]', 0, '2022-09-27 01:02:24', '2022-09-27 01:02:24', '2023-09-27 06:32:24'),
('df697673846b6ac1c939b683c1d91ebcc24e14583ccd84e0977c7a7678fad3760c45e20708c05260', 3, 1, 'Token', '[]', 0, '2022-09-22 05:51:08', '2022-09-22 05:51:08', '2023-09-22 11:21:08'),
('e10bb4c5294f35d90bba8c3682a51cde5a58e0ae1ed5b98f9bb84feec8fd465f821903f84fda41c6', 13, 1, 'token', '[]', 0, '2022-09-25 01:07:05', '2022-09-25 01:07:05', '2023-09-25 06:37:05'),
('e192378d0e16f975f50117b35e55b4207bd75c25ef19ac92c193b87ee5bbb71deb2c30129a64888f', 18, 1, 'token', '[]', 0, '2022-10-06 11:34:47', '2022-10-06 11:34:47', '2023-10-06 17:04:47'),
('e2c7f23d5bfe5c40f39b093464a8cc0bdd0637b4b570d18859d13fb8d2b921288ed6caadc893b4bf', 18, 1, 'token', '[]', 1, '2022-10-07 23:45:08', '2022-10-07 23:57:40', '2023-10-08 05:15:08'),
('e70c556058f2f33e41cec98a962abbd50bd71f7fb2b0fcdbb02af7e652a10f3af60e68d04fa5bd60', 18, 1, 'token', '[]', 1, '2022-10-08 00:58:11', '2022-10-08 00:58:26', '2023-10-08 06:28:11'),
('e7c85db229d2e0f2005210a8569b000efa1e059e7a4405d2502f4ad760a5697097d0aa67b1db5a9f', 8, 1, 'Token', '[]', 0, '2022-09-23 01:02:16', '2022-09-23 01:02:16', '2023-09-23 06:32:16'),
('e8cea28d80a7edb37b08b946c71289172bb0b5f744d308b5540f5e7e4aa25e54121186d1010320b7', 13, 1, 'token', '[]', 0, '2022-10-13 04:26:58', '2022-10-13 04:26:58', '2023-10-13 09:56:58'),
('e90c5fde8e8620f8c977d4667883a0cd794a10257a607cc7e47d01736cba640b98ba2da568c2cafd', 13, 1, 'token', '[]', 0, '2022-11-19 04:10:43', '2022-11-19 04:10:43', '2023-11-19 09:40:43'),
('e9fd5792397be5c4d780c8af9d964f56cd48191425071d7b01df19273396d32f5a16246912344ad7', 18, 1, 'token', '[]', 0, '2022-10-08 00:57:41', '2022-10-08 00:57:41', '2023-10-08 06:27:41'),
('e9fdeac525b7121b106d37b2e8229ec7eaa14640f7f314ebe892d3912dba4d408f1afa2be6b9a470', 18, 1, 'token', '[]', 0, '2022-10-08 00:47:28', '2022-10-08 00:47:28', '2023-10-08 06:17:28'),
('eccebe996e30edf6cc55b357481cb2441ca0703b0ce8db4d60e29345e6e99ceedafb0b746459234c', 13, 1, 'token', '[]', 0, '2022-09-25 13:42:03', '2022-09-25 13:42:03', '2023-09-25 19:12:03'),
('ef00e5e90d1f5929fb565856a155489d386191ebde2217ff487036ec77044ed821db7e7d46545766', 13, 1, 'token', '[]', 1, '2022-10-06 09:50:44', '2022-10-06 10:36:01', '2023-10-06 15:20:44'),
('f055ffbb4dcff9f7592ca5cf328af6f1a1f4e42d706f8c3887e9d883ef8133b3588a6acd3fbad1f0', 3, 1, 'token', '[]', 0, '2022-09-22 03:39:18', '2022-09-22 03:39:18', '2023-09-22 09:09:18'),
('f096f06ace60801d455ddc42704795da92e02b6da20904f8bde1d3588a5759187cca18f35776f4d3', 13, 1, 'token', '[]', 0, '2022-10-06 05:49:45', '2022-10-06 05:49:45', '2023-10-06 11:19:45'),
('f0ada4f5210232450ff7574c9b2a72acbe33183710f60396c40df6f82217d2546e6d0b1217abff61', 18, 1, 'token', '[]', 0, '2022-10-13 10:23:54', '2022-10-13 10:23:54', '2023-10-13 15:53:54'),
('f24c0ccbd0977ab2704071247192b8654ad89c3411dd7f996c3dff76698b6db24467f44ea64d7b2b', 17, 1, 'Token', '[]', 0, '2022-09-26 06:49:13', '2022-09-26 06:49:13', '2023-09-26 12:19:13'),
('f3936e2af33463cc2681ed87465cc2a2eefb2547e62f3d28533a5afa297598266ca44c570a3cefea', 18, 1, 'token', '[]', 0, '2022-10-08 00:27:52', '2022-10-08 00:27:52', '2023-10-08 05:57:52'),
('f4049e73e58c01106ffa040ea79bd57acffc17c509ee4a803fd4629c45cc42c35668f73e1ba34a40', 3, 1, 'token', '[]', 0, '2022-09-22 03:39:16', '2022-09-22 03:39:16', '2023-09-22 09:09:16'),
('f5dc05d28aaffecbc5893fee2de826854f258144666d07be1e87a927540c2f75dbd0e2229d41af42', 13, 1, 'token', '[]', 0, '2022-10-06 10:59:12', '2022-10-06 10:59:12', '2023-10-06 16:29:12'),
('f77c0cf7ec76b08d6cb38610378e1223fbc71db43c972d8c9551a62385b0dd45c00aa62e582171c3', 18, 1, 'token', '[]', 1, '2022-10-08 01:22:11', '2022-10-10 02:22:16', '2023-10-08 06:52:11'),
('ff09560d6f041bc8d951ffeed4247e8ae03887b68118bb403a43497e50e9c8c1786fed3fd79b7bc8', 8, 1, 'token', '[]', 1, '2022-11-19 04:24:25', '2022-11-19 04:24:47', '2023-11-19 09:54:25'),
('ff71efb754baa066c0f346cbac25f461a11fddb9fa04e46ebb258e7e7ecec5484a657b739c6b28db', 18, 1, 'token', '[]', 0, '2022-10-21 22:42:28', '2022-10-21 22:42:29', '2023-10-22 04:12:28');

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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'qgx93TzscU30UZERZq2PwcGFezY0o8KuMoHnEZ1K', NULL, 'http://localhost', 1, 0, 0, '2022-09-22 01:16:26', '2022-09-22 01:16:26'),
(2, NULL, 'Laravel Password Grant Client', 'EO7MXdwuVF9Cqofs5ckikcYZzWEv6GBFmtmxjeql', 'users', 'http://localhost', 0, 1, 0, '2022-09-22 01:16:26', '2022-09-22 01:16:26');

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
(1, 1, '2022-09-22 01:16:26', '2022-09-22 01:16:26');

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
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('alok@gmail.com', 'hwIK21lhOP', NULL),
('alok@gmail.com', 'DB42Y5s4vv', NULL),
('alok@gmail.com', '06C1cbmRZ2', NULL),
('alok@gmail.com', 'XktczRMeXC', NULL),
('alok@gmail.com', 'Ze5r4hkU98', NULL),
('alok@gmail.com', 'Cyrfpimakb', NULL),
('alok@gmail.com', 'XTpnGwWQvy', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects_submitted`
--

CREATE TABLE `projects_submitted` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `project_url` varchar(1000) NOT NULL,
  `student_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `project_file_url` varchar(1000) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_summary`
--

CREATE TABLE `purchase_summary` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `item_price` float DEFAULT NULL,
  `coupan_applied` varchar(100) DEFAULT NULL,
  `final_price` float DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_summary`
--

INSERT INTO `purchase_summary` (`id`, `course_id`, `userid`, `item_price`, `coupan_applied`, `final_price`, `transaction_id`, `status`, `payment_method`, `created_at`, `updated_at`) VALUES
(1, NULL, 18, 999, 'FIRST1000', 699, NULL, NULL, NULL, '2022-10-11 11:47:57', '2022-10-11 11:47:57'),
(2, 2, 18, 999, 'FIRST100', 499, NULL, NULL, NULL, '2022-10-11 11:52:20', '2022-10-11 11:52:20'),
(3, 2, 18, 999, 'FIRST100', 499, '93522985', NULL, NULL, '2022-10-11 11:57:10', '2022-10-11 11:57:10'),
(4, 2, 18, 999, 'FIRST100', 499, '22548273', NULL, NULL, '2022-10-11 11:57:53', '2022-10-11 11:57:53'),
(5, 2, 18, 999, 'FIRST100', 499, '87354138', NULL, NULL, '2022-10-11 11:58:37', '2022-10-11 11:58:37'),
(6, 2, 18, 999, 'FIRST100', 499, '1965917', NULL, NULL, '2022-10-11 11:59:56', '2022-10-11 11:59:56'),
(7, 2, 18, 999, 'FIRST100', 499, '72130011', NULL, NULL, '2022-10-24 09:08:37', '2022-10-24 09:08:37'),
(8, 38, 18, 999, 'FIRST1000', 699, NULL, NULL, NULL, '2022-10-24 10:02:37', '2022-10-24 10:02:37'),
(9, 38, 18, 999, 'FIRST1000', 699, NULL, NULL, NULL, '2022-10-24 10:04:54', '2022-10-24 10:04:54'),
(10, 37, 18, 999, 'FIRST1000', 699, '68822916', NULL, NULL, '2022-10-27 13:35:48', '2022-10-27 13:35:48'),
(11, 37, 18, 999, 'FIRST100', 499, NULL, NULL, NULL, '2022-10-27 13:37:54', '2022-10-27 13:37:54'),
(12, 37, 18, 999, 'FIRST100', 499, NULL, NULL, NULL, '2022-10-27 13:40:10', '2022-10-27 13:40:10'),
(13, 37, 18, 999, 'FIRST100', 499, NULL, NULL, NULL, '2022-10-27 13:44:57', '2022-10-27 13:44:57'),
(14, 37, 18, 999, 'FIRST100', 499, NULL, NULL, NULL, '2022-10-27 13:45:42', '2022-10-27 13:45:42'),
(15, 37, 18, 999, 'FIRST100', 499, NULL, NULL, NULL, '2022-10-27 13:45:49', '2022-10-27 13:45:49'),
(16, 37, 18, 999, 'FIRST100', 499, NULL, NULL, NULL, '2022-10-27 13:46:24', '2022-10-27 13:46:24');

-- --------------------------------------------------------

--
-- Table structure for table `reviews_platform`
--

CREATE TABLE `reviews_platform` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `role` varchar(111) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_id`, `role`, `created_at`, `updated_at`) VALUES
(1, 1, 'student', '2022-09-23 05:48:39', '2022-09-23 05:48:39'),
(2, 2, 'teacher', '2022-09-23 05:48:39', '2022-09-23 05:48:39');

-- --------------------------------------------------------

--
-- Table structure for table `searches`
--

CREATE TABLE `searches` (
  `id` int(11) NOT NULL,
  `userid` varchar(110) DEFAULT NULL,
  `keyword` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `searches`
--

INSERT INTO `searches` (`id`, `userid`, `keyword`, `created_at`, `updated_at`) VALUES
(1, 'anonymous', 'python', '2022-10-24 12:07:18', '2022-10-24 12:07:18'),
(2, '18', 'python', '2022-10-24 12:16:58', '2022-10-24 12:16:58'),
(3, '18', 'python', '2022-10-24 12:17:59', '2022-10-24 12:17:59'),
(4, '18', 'html', '2022-10-24 12:18:34', '2022-10-24 12:18:34'),
(5, '18', 'html', '2022-10-24 12:19:04', '2022-10-24 12:19:04'),
(6, '18', NULL, '2022-10-24 12:29:43', '2022-10-24 12:29:43'),
(7, '18', NULL, '2022-10-24 12:30:55', '2022-10-24 12:30:55'),
(8, '18', 'html', '2022-10-24 12:31:22', '2022-10-24 12:31:22'),
(9, '18', NULL, '2022-10-24 12:35:54', '2022-10-24 12:35:54'),
(10, '18', NULL, '2022-10-24 12:36:25', '2022-10-24 12:36:25'),
(11, '18', NULL, '2022-10-24 12:38:13', '2022-10-24 12:38:13'),
(12, '18', 'html', '2022-10-24 12:40:21', '2022-10-24 12:40:21'),
(13, '18', 'html', '2022-10-24 12:40:42', '2022-10-24 12:40:42'),
(14, '18', 'html', '2022-10-24 12:40:49', '2022-10-24 12:40:49'),
(15, '18', 'python', '2022-10-24 12:41:02', '2022-10-24 12:41:02'),
(16, '18', 'html', '2022-10-24 12:41:46', '2022-10-24 12:41:46'),
(17, 'anonymous', 'python', '2022-10-24 12:50:59', '2022-10-24 12:50:59'),
(18, '18', 'python', '2022-10-24 12:53:16', '2022-10-24 12:53:16'),
(19, '18', 'python', '2022-10-24 12:55:45', '2022-10-24 12:55:45'),
(20, '18', 'python', '2022-10-24 12:56:57', '2022-10-24 12:56:57'),
(21, '18', 'python', '2022-10-24 12:59:48', '2022-10-24 12:59:48'),
(22, '18', 'python', '2022-10-24 13:00:32', '2022-10-24 13:00:32'),
(23, '18', 'php', '2022-10-24 13:00:49', '2022-10-24 13:00:49'),
(24, '18', '2', '2022-10-24 13:01:47', '2022-10-24 13:01:47'),
(25, '18', 'p', '2022-10-24 13:05:04', '2022-10-24 13:05:04'),
(26, '18', 'php', '2022-10-24 13:05:13', '2022-10-24 13:05:13'),
(27, '18', 'php', '2022-10-24 13:07:07', '2022-10-24 13:07:07'),
(28, '18', 'php', '2022-10-24 13:07:32', '2022-10-24 13:07:32'),
(29, '18', 'php', '2022-10-24 13:09:39', '2022-10-24 13:09:39'),
(30, '18', 'php', '2022-10-24 13:13:00', '2022-10-24 13:13:00'),
(31, '18', 'php', '2022-10-24 13:14:49', '2022-10-24 13:14:49'),
(32, '18', 'php', '2022-10-24 13:19:02', '2022-10-24 13:19:02'),
(33, '18', 'p', '2022-10-24 13:19:29', '2022-10-24 13:19:29'),
(34, '18', 'p', '2022-10-24 13:20:24', '2022-10-24 13:20:24'),
(35, '18', 'php', '2022-10-24 13:21:07', '2022-10-24 13:21:07'),
(36, '18', 'php', '2022-10-24 13:21:53', '2022-10-24 13:21:53'),
(37, '18', 'php', '2022-10-24 13:23:48', '2022-10-24 13:23:48'),
(38, '18', 'php', '2022-10-24 13:25:03', '2022-10-24 13:25:03'),
(39, '18', 'php', '2022-10-24 13:26:11', '2022-10-24 13:26:11'),
(40, '18', 'php', '2022-10-24 13:27:31', '2022-10-24 13:27:31');

-- --------------------------------------------------------

--
-- Table structure for table `setup_video`
--

CREATE TABLE `setup_video` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `video` varchar(100) DEFAULT NULL,
  `video_language` varchar(100) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `microphone_type` varchar(100) DEFAULT NULL,
  `camera_type` varchar(100) DEFAULT NULL,
  `operating_system` varchar(100) DEFAULT NULL,
  `software` varchar(100) DEFAULT NULL,
  `status` set('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setup_video`
--

INSERT INTO `setup_video` (`id`, `teacher_id`, `video`, `video_language`, `title`, `description`, `microphone_type`, `camera_type`, `operating_system`, `software`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'English', NULL, NULL, 'Headphone', 'mobile', 'windows', 'bsd', 'Pending', '2022-10-03 04:03:00', '2022-10-03 04:03:00'),
(2, 1, 'XsL3hdjZxGk', 'English', 'newfbbbbbbbbbg', 'newupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-videoupload-setup-video', 'Headphone', 'mobile', 'windows', 'bsd', 'Pending', '2022-10-03 04:03:49', '2022-10-03 04:03:49'),
(3, 2, 'files/setup_videos/nx3wpR2VG0EombTFE1f84E0UE5SJCJ9iMmo3K8zT.mp4', 'Hindi', 'ok', 'ok', 'headphones', 'mobile', 'windows', 'bsd', 'Pending', '2022-10-03 04:08:24', '2022-10-03 04:08:24'),
(4, 2, NULL, 'Hindi', NULL, NULL, 'n', 'h', 'hh', 'h', 'Pending', '2022-10-03 08:08:21', '2022-10-03 08:08:21'),
(5, 2, NULL, 'Hindii', NULL, NULL, 'headphones', 'mobile', 'windows', 'bsd', 'Pending', '2022-10-03 08:53:01', '2022-10-03 08:53:01');

-- --------------------------------------------------------

--
-- Table structure for table `setup_video_requests`
--

CREATE TABLE `setup_video_requests` (
  `id` int(11) NOT NULL,
  `setup_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `status` set('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `date` date NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `setup_video_requests`
--

INSERT INTO `setup_video_requests` (`id`, `setup_id`, `teacher_id`, `status`, `date`, `created_at`, `updated_at`) VALUES
(1, 2, 13, 'Pending', '2022-10-05', '2022-10-05 13:12:56', '2022-10-05 13:12:56'),
(2, 2, 13, 'Pending', '2022-10-05', '2022-10-05 15:53:30', '2022-10-05 15:53:30'),
(3, 3, 2, 'Pending', '2022-10-05', '2022-10-05 15:58:14', '2022-10-05 15:58:14'),
(4, 3, 2, 'Pending', '2022-10-05', '2022-10-05 15:58:43', '2022-10-05 15:58:43');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `state` text DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `profile_image` varchar(1000) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `is_active` enum('1','0','','') NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `userid`, `email`, `name`, `phone`, `dob`, `address`, `state`, `pincode`, `country`, `city`, `profile_image`, `about`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 10, 'alok312@gmail.com', 'Alok', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-09-23 06:35:01', '2022-09-23 06:35:01'),
(2, 11, 'alok5@gmail.com', 'alok', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-09-23 10:08:14', '2022-09-23 10:08:14'),
(3, 12, 'snmaurya10275@gmail.com', 'Alok Maurya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-09-24 11:53:37', '2022-09-24 11:53:37'),
(4, 14, 'a@nnn.com', 'ANUJ MAURYA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-09-24 12:01:30', '2022-09-24 12:01:30'),
(5, 15, 'a111@nnn.com', 'ANUJ MAURYA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-09-24 12:03:46', '2022-09-24 12:03:46'),
(6, 16, '1@l.o', 'Alok', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-09-24 12:06:48', '2022-09-24 12:06:48'),
(7, 17, 'a@n.commm', 'Alok', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-09-26 12:19:13', '2022-09-26 12:19:13'),
(8, 18, 'alok@gmail1.com', 'Alok Maurya', '07071994439', '2022-10-15', 'Vidhayak Road Jayram Nagar Fatehpur', 'Uttar Pradesh', 212601, 'India', 'Fatehpur', 'files/profile_images/5PtfjC253MeMHtrP0RMeH9vFfaaDACyQv4EInrwJ.jpg', NULL, '1', '2022-10-06 16:59:19', '2022-10-06 16:59:19'),
(9, 19, 'vip@gmail.com', 'Vip', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-03-23 08:38:57', '2023-03-23 08:38:57');

-- --------------------------------------------------------

--
-- Table structure for table `student_course_progress`
--

CREATE TABLE `student_course_progress` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `attended_lectures` int(11) DEFAULT NULL,
  `assignment_submitted` int(11) DEFAULT NULL,
  `project_submitted` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_course_progress`
--

INSERT INTO `student_course_progress` (`id`, `course_id`, `student_id`, `userid`, `attended_lectures`, `assignment_submitted`, `project_submitted`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, 18, NULL, NULL, NULL, '2022-10-11 11:58:37', '2022-10-11 11:58:37'),
(2, 2, NULL, 18, NULL, NULL, NULL, '2022-10-11 11:59:56', '2022-10-11 11:59:56'),
(3, 2, NULL, 18, NULL, NULL, NULL, '2022-10-24 09:08:38', '2022-10-24 09:08:38'),
(4, 37, NULL, 18, NULL, NULL, NULL, '2022-10-27 13:35:49', '2022-10-27 13:35:49');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `state` text DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `profile_image` varchar(1000) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `is_active` enum('1','0','','') NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `userid`, `email`, `name`, `phone`, `dob`, `address`, `state`, `pincode`, `country`, `city`, `profile_image`, `about`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 8, 'alok1@gmail.com', 'Alok', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-09-23 06:32:15', '2022-09-23 06:32:15'),
(2, 13, 'a@n.com', 'Alok', '07071994439', '2016-10-14', 'Vidhayak Road Jayram Nagar Fatehpur', 'Uttar Pradesh', 212601, 'India', 'Fatehpur', 'files/profile_images/xxB0lkGfk97aYs8H0UgNI2XJq9ppfVuCrdDZq9y8.jpg', 'A full-stack guide to writing a software engineer resume that’d put Linus Torvalds to shame. With easy to code tips to make your next job application a cinch.no', '1', '2022-09-24 11:59:04', '2022-09-24 11:59:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `last_login_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role_id`, `is_active`, `last_login_ip`, `last_login_date`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Alok', 'alok@gmail.com', NULL, '$2y$10$a3kb/8Qc8jIdGT7RFcKsROBMQCRXzozHPASDGxIZF8o00PXaLQHQa', 0, '1', '', '', NULL, '2022-09-22 03:33:40', '2022-09-22 03:33:40'),
(8, 'Alok', 'alok1@gmail.com', NULL, '$2y$10$81IYjEBNiSeLStA0wSoTw.U8GST.3cC6o/QL7n8mLbCKi7FjXoEzC', 2, '1', NULL, NULL, 'MmPqlJUezH', '2022-09-23 01:02:15', '2022-09-23 01:02:15'),
(9, 'Alok', 'alok12@gmail.com', NULL, '$2y$10$UM4A5Qz7wWjY3cAOBAujHuI/dGJ6JLS3vtcqkTo5GfZhpILZ9qVom', 1, '1', NULL, NULL, 'PcOALlxHCo', '2022-09-23 01:04:28', '2022-09-23 01:04:28'),
(10, 'Alok', 'alok312@gmail.com', NULL, '$2y$10$U65aaYp9E2jajouAD7yqauQ3N3CpjgcJTyTcywr/D9A9NHNr/iLoS', 1, '1', NULL, NULL, 'ZMgJsKT52v', '2022-09-23 01:05:01', '2022-09-23 01:05:01'),
(11, 'alok', 'alok5@gmail.com', NULL, '$2y$10$AJkCkgOrWlB8DSFheCI4Wuj85vzpkJF/w7CceovtqwkOgeVudxM7y', 1, '1', NULL, NULL, 'Jdss0KZ285', '2022-09-23 04:38:14', '2022-09-23 04:38:14'),
(12, 'Alok Maurya', 'snmaurya10275@gmail.com', NULL, '$2y$10$iJfa3iiwT0U0MTDpSUDK6ugX7LfxOBDzmWnHIwR4QM7yxBRdFCVF.', 1, '1', NULL, NULL, '7yyxX0ESuk', '2022-09-24 06:23:37', '2022-09-24 06:23:37'),
(13, 'Alok', 'a@n.com', NULL, '$2y$10$WENpjx0dHxWKTxlTec2X7uPbLdBejjFLlOHx5ILY.CPkZSA5x9TzC', 2, '1', NULL, NULL, 'LWIALgOfOS', '2022-09-24 06:29:04', '2022-09-24 06:29:04'),
(14, 'ANUJ MAURYA', 'a@nnn.com', NULL, '$2y$10$oZey.SEZkwg2t4o8i1.BTOtpKjrNufFVT5B2ZC0Kks.aeRw8rXovi', 1, '1', NULL, NULL, 'bmJgTJNE6H', '2022-09-24 06:31:30', '2022-09-24 06:31:30'),
(15, 'ANUJ MAURYA', 'a111@nnn.com', NULL, '$2y$10$2YjbXjn.F1Fe7bXErBHBzO49kYMthho9wyoydbhg/MVue23tsCTxq', 1, '1', NULL, NULL, '0gV3Qq8mJA', '2022-09-24 06:33:46', '2022-09-24 06:33:46'),
(16, 'Alok', '1@l.o', NULL, '$2y$10$J1yh0tYmxKuhlFfRpvZ/aeL47PHUEZnLrx4Qfb7lxU0LXDYR9OuWW', 1, '1', NULL, NULL, 'u9Qazc41PB', '2022-09-24 06:36:48', '2022-09-24 06:36:48'),
(17, 'Alok', 'a@n.commm', NULL, '$2y$10$ksgJVC7KtOt2RKFE3/NK4uFLAOPDtSP.M08vrDKoBimaeRzXOW5hK', 1, '1', NULL, NULL, 'SitHcSOL1M', '2022-09-26 06:49:13', '2022-09-26 06:49:13'),
(18, 'Alok Maurya', 'alok@gmail1.com', NULL, '$2y$10$nCHtc19aYHatdztcjEDb.Owz.vL963rQQoeuN2mXBGtKvSlo.Toai', 1, '1', NULL, NULL, 'Vz24owhLEv', '2022-10-06 11:29:19', '2022-10-06 11:29:19'),
(19, 'Vip', 'vip@gmail.com', NULL, '$2y$10$Bi6wFpAm7d4MpuyfXPWl8eVpvfeQqR0Xcw3vA..J1jDRJ4weL8.wG', 1, '1', NULL, NULL, 'XubXuX6oDG', '2023-03-23 03:08:57', '2023-03-23 03:08:57');

-- --------------------------------------------------------

--
-- Table structure for table `user_cart`
--

CREATE TABLE `user_cart` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `cart_quantity` int(11) DEFAULT NULL,
  `item_price` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_cart`
--

INSERT INTO `user_cart` (`id`, `course_id`, `userid`, `cart_quantity`, `item_price`, `created_at`, `updated_at`) VALUES
(3, 37, 19, 1, 999, '2022-10-08 07:15:34', '2022-10-08 07:15:34'),
(11, 1, 18, 1, NULL, '2022-10-27 13:33:38', '2022-10-27 13:33:38'),
(12, 39, 18, 1, 0, '2022-10-27 13:34:56', '2022-10-27 13:34:56');

-- --------------------------------------------------------

--
-- Table structure for table `youtube_access_tokens`
--

CREATE TABLE `youtube_access_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `access_token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `youtube_access_tokens`
--

INSERT INTO `youtube_access_tokens` (`id`, `access_token`, `created_at`) VALUES
(2, '{\"access_token\":\"ya29.a0Aa4xrXMxcK9Evh5Czyop0sIJmfFZgRJD9yMHCbG8eKMPJwP9NCR8veWdr-1bp_VNouG8vydTD_r74tW0gKg0_bg3wcbEbcokCsbFd-do1XOmJ_yJaPRQfAmcUG8zGCUnoekHXjXnTeXV4_WhJjMOMfvgA6RzaCgYKATASARASFQEjDvL9LEYEe0y_F5Rh302uLZwHkw0163\",\"expires_in\":3599,\"refresh_token\":\"1\\/\\/0gUjZxvLwyGzTCgYIARAAGBASNwF-L9IrpxKoocT8_-82UHcX71_7piZETI6p-OimqRPcf6C0CzR8Eca_z_61YhEx7nj7vnVZh0E\",\"scope\":\"https:\\/\\/www.googleapis.com\\/auth\\/youtube.upload https:\\/\\/www.googleapis.com\\/auth\\/youtube.readonly https:\\/\\/www.googleapis.com\\/auth\\/youtube\",\"token_type\":\"Bearer\",\"created\":1664798624}', '2022-10-03 06:33:44'),
(3, '{\"access_token\":\"ya29.a0Aa4xrXMA26EG1EeKxKt_vSYp-SeFF4qaGkb18EgrkL56O9V4Adqqyerh6PZ-Hqpa7mcc-2mszkwPwe8f4_-xkiJpvpR8-V8UtS87tmnL7jxwML-lFxrHpTZ0VkGM38ER_0Kg7KwYAK_PLmT6OAn0DaUI8l4AaCgYKATASARESFQEjDvL9rRB84DwZBScpAQS8cvkO5A0163\",\"expires_in\":3599,\"refresh_token\":\"1\\/\\/0g1TPyv7mPPjbCgYIARAAGBASNwF-L9IrO1cuYvvIEEUSzeWu3zMHDX_QozzPaVuOjJF0dvyKH-25x8yeeCSC2HnAcwfS2kOuPEY\",\"scope\":\"https:\\/\\/www.googleapis.com\\/auth\\/youtube https:\\/\\/www.googleapis.com\\/auth\\/youtube.readonly https:\\/\\/www.googleapis.com\\/auth\\/youtube.upload\",\"token_type\":\"Bearer\",\"created\":1664800367}', '2022-10-03 07:02:47'),
(4, '{\"access_token\":\"ya29.a0Aa4xrXOHfbLrBi1LpbyNI6mSezP8JPFBplETBqum99RekHVL_4dbQIIVbGAmIoqLQOzCeRya5xnmrXcp1-Gub07ZjOKgW1puAfJiyg-6MEzqof0Tid94ItyggF_bKGXa2Q7TOYFMNK16AMcnXX9H_fZl6vB_owaCgYKATASARMSFQEjDvL9d-1fyoGL5ly6-ZcvNiMrGQ0165\",\"expires_in\":3599,\"refresh_token\":\"1\\/\\/0g1TPyv7mPPjbCgYIARAAGBASNwF-L9IrO1cuYvvIEEUSzeWu3zMHDX_QozzPaVuOjJF0dvyKH-25x8yeeCSC2HnAcwfS2kOuPEY\",\"scope\":\"https:\\/\\/www.googleapis.com\\/auth\\/youtube https:\\/\\/www.googleapis.com\\/auth\\/youtube.readonly https:\\/\\/www.googleapis.com\\/auth\\/youtube.upload\",\"token_type\":\"Bearer\",\"created\":1664819365}', '2022-10-03 12:19:25'),
(5, '{\"access_token\":\"ya29.a0Aa4xrXM2tSOWPDIQU2ZF5xYFBdsGoCz3ISuEddP37Zz08ca3h929w2gMERZsA2zSX9qYd7VEEGhmKn36ZaKrZWvV7LoyNWL8YdGwWsfjANc6cmzy-71ue8md-CubCIhzq-1rvRnzakvsBGUAorhlaKQ56yNobQaCgYKATASARISFQEjDvL9LC-ux_HKJlQCwh6KRiRFUg0165\",\"expires_in\":3599,\"refresh_token\":\"1\\/\\/0g1TPyv7mPPjbCgYIARAAGBASNwF-L9IrO1cuYvvIEEUSzeWu3zMHDX_QozzPaVuOjJF0dvyKH-25x8yeeCSC2HnAcwfS2kOuPEY\",\"scope\":\"https:\\/\\/www.googleapis.com\\/auth\\/youtube https:\\/\\/www.googleapis.com\\/auth\\/youtube.readonly https:\\/\\/www.googleapis.com\\/auth\\/youtube.upload\",\"token_type\":\"Bearer\",\"created\":1664875036}', '2022-10-04 03:47:16'),
(6, '{\"access_token\":\"ya29.a0Aa4xrXORi82FdWSvl6B8-_tWHiZXjIRB3aWjzZ_u3wKNnN4WfnroMSkzdGdv0sNlfOe-eR-nIHR7Xi0I4poHqxq2E5sclsBb5ETQew8sZfG98XHy5sEgIpGPHh5U1wBjajwhA3QnnIhuWPK0F4ltIY4t1_MS_waCgYKATASARASFQEjDvL9mj3UL-bewqwFLUdIE6URVQ0165\",\"expires_in\":3599,\"refresh_token\":\"1\\/\\/0g1TPyv7mPPjbCgYIARAAGBASNwF-L9IrO1cuYvvIEEUSzeWu3zMHDX_QozzPaVuOjJF0dvyKH-25x8yeeCSC2HnAcwfS2kOuPEY\",\"scope\":\"https:\\/\\/www.googleapis.com\\/auth\\/youtube https:\\/\\/www.googleapis.com\\/auth\\/youtube.readonly https:\\/\\/www.googleapis.com\\/auth\\/youtube.upload\",\"token_type\":\"Bearer\",\"created\":1664892716}', '2022-10-04 08:41:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment_submitted`
--
ALTER TABLE `assignment_submitted`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `completed_lectures`
--
ALTER TABLE `completed_lectures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupans`
--
ALTER TABLE `coupans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_aim`
--
ALTER TABLE `course_aim`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_assignments`
--
ALTER TABLE `course_assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_assignments_ques_ans`
--
ALTER TABLE `course_assignments_ques_ans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_categories`
--
ALTER TABLE `course_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_certificates`
--
ALTER TABLE `course_certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_faqs`
--
ALTER TABLE `course_faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_lectures`
--
ALTER TABLE `course_lectures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_materials`
--
ALTER TABLE `course_materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_motive`
--
ALTER TABLE `course_motive`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_projects`
--
ALTER TABLE `course_projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_ratings`
--
ALTER TABLE `course_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_requirements`
--
ALTER TABLE `course_requirements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_review_requests`
--
ALTER TABLE `course_review_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_sections`
--
ALTER TABLE `course_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrolled_courses`
--
ALTER TABLE `enrolled_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `projects_submitted`
--
ALTER TABLE `projects_submitted`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_summary`
--
ALTER TABLE `purchase_summary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews_platform`
--
ALTER TABLE `reviews_platform`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `searches`
--
ALTER TABLE `searches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setup_video`
--
ALTER TABLE `setup_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setup_video_requests`
--
ALTER TABLE `setup_video_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_course_progress`
--
ALTER TABLE `student_course_progress`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_cart`
--
ALTER TABLE `user_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `youtube_access_tokens`
--
ALTER TABLE `youtube_access_tokens`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment_submitted`
--
ALTER TABLE `assignment_submitted`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `completed_lectures`
--
ALTER TABLE `completed_lectures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coupans`
--
ALTER TABLE `coupans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `course_aim`
--
ALTER TABLE `course_aim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `course_assignments`
--
ALTER TABLE `course_assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `course_assignments_ques_ans`
--
ALTER TABLE `course_assignments_ques_ans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `course_categories`
--
ALTER TABLE `course_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `course_certificates`
--
ALTER TABLE `course_certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_faqs`
--
ALTER TABLE `course_faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `course_lectures`
--
ALTER TABLE `course_lectures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `course_materials`
--
ALTER TABLE `course_materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `course_motive`
--
ALTER TABLE `course_motive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `course_projects`
--
ALTER TABLE `course_projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `course_ratings`
--
ALTER TABLE `course_ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `course_requirements`
--
ALTER TABLE `course_requirements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `course_review_requests`
--
ALTER TABLE `course_review_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course_sections`
--
ALTER TABLE `course_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `enrolled_courses`
--
ALTER TABLE `enrolled_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects_submitted`
--
ALTER TABLE `projects_submitted`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_summary`
--
ALTER TABLE `purchase_summary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `reviews_platform`
--
ALTER TABLE `reviews_platform`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `searches`
--
ALTER TABLE `searches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `setup_video`
--
ALTER TABLE `setup_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `setup_video_requests`
--
ALTER TABLE `setup_video_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `student_course_progress`
--
ALTER TABLE `student_course_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_cart`
--
ALTER TABLE `user_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `youtube_access_tokens`
--
ALTER TABLE `youtube_access_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
