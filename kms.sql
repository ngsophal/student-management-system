-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.17 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table ksm.courses
DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `grade_id` int(11) unsigned NOT NULL,
  `session_id` int(11) unsigned NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_courses_grades` (`grade_id`),
  KEY `FK_courses_sessions` (`session_id`),
  CONSTRAINT `FK_courses_grades` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`id`),
  CONSTRAINT `FK_courses_sessions` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table ksm.courses: ~4 rows (approximately)
DELETE FROM `courses`;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` (`id`, `grade_id`, `session_id`, `start_date`, `end_date`, `status`, `created_date`, `created_by`, `modified_date`, `modified_by`) VALUES
	(1, 5, 1, '2017-04-16', '2017-04-23', 1, '2017-04-09 11:50:09', 1, '2017-04-09 12:34:08', 1),
	(2, 4, 1, '2017-04-01', '2017-04-30', 1, '2017-04-21 07:29:59', 0, NULL, NULL),
	(3, 1, 1, '2017-04-20', '2017-04-23', 1, '2017-04-21 10:49:14', 0, NULL, NULL),
	(4, 6, 3, '2017-04-19', '2017-04-23', 1, '2017-04-21 10:51:14', 1, NULL, NULL);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;


-- Dumping structure for table ksm.courses_rooms
DROP TABLE IF EXISTS `courses_rooms`;
CREATE TABLE IF NOT EXISTS `courses_rooms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(11) unsigned NOT NULL,
  `room_id` int(11) unsigned NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_courses_rooms_courses` (`course_id`),
  KEY `FK_courses_rooms_rooms` (`room_id`),
  CONSTRAINT `FK_courses_rooms_courses` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `FK_courses_rooms_rooms` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table ksm.courses_rooms: ~3 rows (approximately)
DELETE FROM `courses_rooms`;
/*!40000 ALTER TABLE `courses_rooms` DISABLE KEYS */;
INSERT INTO `courses_rooms` (`id`, `course_id`, `room_id`, `status`, `created_date`, `created_by`, `modified_date`, `modified_by`) VALUES
	(1, 1, 1, 1, '2017-04-27 17:04:54', 1, NULL, NULL),
	(2, 1, 3, 1, '2017-04-27 17:05:34', 1, NULL, NULL),
	(3, 2, 6, 1, '2017-04-27 17:06:53', 1, NULL, NULL);
/*!40000 ALTER TABLE `courses_rooms` ENABLE KEYS */;


-- Dumping structure for table ksm.enrollments
DROP TABLE IF EXISTS `enrollments`;
CREATE TABLE IF NOT EXISTS `enrollments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) unsigned NOT NULL,
  `course_id` int(11) unsigned NOT NULL,
  `room_id` int(5) unsigned NOT NULL,
  `enrollment_date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_enrollments_students` (`student_id`),
  KEY `FK_enrollments_course` (`course_id`),
  KEY `FK_enrollments_room` (`room_id`),
  CONSTRAINT `FK_enrollments_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `FK_enrollments_room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  CONSTRAINT `FK_enrollments_students` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table ksm.enrollments: ~2 rows (approximately)
DELETE FROM `enrollments`;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` (`id`, `student_id`, `course_id`, `room_id`, `enrollment_date`, `status`, `created_date`, `created_by`, `modified_date`, `modified_by`) VALUES
	(1, 1, 1, 1, '2017-01-17', 1, '2017-01-20 08:02:10', 1, NULL, NULL),
	(2, 16, 1, 4, '2017-02-17', 1, '2017-02-21 09:12:20', 1, NULL, NULL),
	(3, 30, 1, 1, '2017-04-11', 1, '2017-04-28 16:24:52', 1, NULL, NULL);
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;


-- Dumping structure for table ksm.fees
DROP TABLE IF EXISTS `fees`;
CREATE TABLE IF NOT EXISTS `fees` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fee_type_id` int(11) unsigned NOT NULL,
  `course_id` int(11) unsigned NOT NULL,
  `fee` double NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:active,2:deactive',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fees_fee_types` (`fee_type_id`),
  KEY `FK_fees_courses` (`course_id`),
  CONSTRAINT `FK_fees_courses` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `FK_fees_fee_types` FOREIGN KEY (`fee_type_id`) REFERENCES `fee_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table ksm.fees: ~8 rows (approximately)
DELETE FROM `fees`;
/*!40000 ALTER TABLE `fees` DISABLE KEYS */;
INSERT INTO `fees` (`id`, `fee_type_id`, `course_id`, `fee`, `status`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
	(1, 1, 1, 110, 1, 1, '2017-01-20 08:02:10', NULL, NULL),
	(2, 2, 1, 120, 1, 1, '2017-02-20 08:02:10', NULL, NULL),
	(3, 3, 1, 130, 1, 1, '2017-03-01 07:49:28', NULL, NULL),
	(4, 1, 3, 125, 1, 1, '2017-04-21 09:36:00', NULL, NULL),
	(5, 1, 4, 129, 1, 1, '2017-04-21 10:00:58', 0, '2017-04-21 10:52:33'),
	(6, 1, 2, 125, 1, 1, '2017-04-26 21:08:18', NULL, NULL),
	(7, 2, 2, 200, 1, 1, '2017-04-26 23:37:31', NULL, NULL),
	(8, 3, 4, 527, 1, 1, '2017-04-26 23:58:43', NULL, NULL);
/*!40000 ALTER TABLE `fees` ENABLE KEYS */;


-- Dumping structure for table ksm.fee_types
DROP TABLE IF EXISTS `fee_types`;
CREATE TABLE IF NOT EXISTS `fee_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `created_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table ksm.fee_types: ~3 rows (approximately)
DELETE FROM `fee_types`;
/*!40000 ALTER TABLE `fee_types` DISABLE KEYS */;
INSERT INTO `fee_types` (`id`, `name`, `created_date`, `created_by`, `modified_date`, `modified_by`, `status`) VALUES
	(1, 'Quater', '2017-01-01 01:01:01', 1, NULL, NULL, 1),
	(2, 'Semester', '2017-01-01 01:01:01', 1, NULL, NULL, 1),
	(3, 'Year', '2017-01-01 01:01:01', 1, NULL, NULL, 1);
/*!40000 ALTER TABLE `fee_types` ENABLE KEYS */;


-- Dumping structure for table ksm.grades
DROP TABLE IF EXISTS `grades`;
CREATE TABLE IF NOT EXISTS `grades` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `created_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Dumping data for table ksm.grades: ~12 rows (approximately)
DELETE FROM `grades`;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` (`id`, `name`, `created_date`, `created_by`, `modified_date`, `modified_by`, `status`) VALUES
	(1, 'Kindergarten 1', '2017-01-01 01:01:01', 1, NULL, NULL, 1),
	(2, 'Kindergarten 2', '2017-01-01 01:01:01', 1, NULL, NULL, 1),
	(3, 'Kindergarten 3', '2017-01-01 01:01:01', 1, NULL, NULL, 1),
	(4, 'Kindergarten 4', '2017-04-05 15:51:28', 1, NULL, NULL, 1),
	(5, 'Kindergarten 5', '2017-04-07 14:41:06', 1, NULL, NULL, 1),
	(6, 'Kindergarten 6', '2017-04-08 22:01:39', 1, NULL, NULL, 1),
	(7, 'Kindergarten 7', '2017-04-08 23:03:13', 1, NULL, NULL, 1),
	(8, 'Kindergarten 8', '2017-04-08 23:10:57', 1, NULL, NULL, 1),
	(9, 'Kindergarten 9', '2017-04-08 23:12:22', 1, NULL, NULL, 1),
	(10, 'Kindergarten 10', '2017-04-09 08:18:48', 1, NULL, NULL, 1),
	(11, 'Kindergarten 11', '2017-04-09 08:20:16', 1, NULL, NULL, 1);
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;


-- Dumping structure for table ksm.payments
DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `enrollment_id` int(11) unsigned DEFAULT NULL,
  `payment_amount` double NOT NULL,
  `payment_date` date NOT NULL,
  `discount` int(5) NOT NULL COMMENT 'percentage',
  `fee_type_id` int(11) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_payments_enrollments` (`enrollment_id`),
  KEY `FK_payments_fee_types` (`fee_type_id`),
  CONSTRAINT `FK_payments_enrollments` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments` (`id`),
  CONSTRAINT `FK_payments_fee_types` FOREIGN KEY (`fee_type_id`) REFERENCES `fee_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table ksm.payments: ~0 rows (approximately)
DELETE FROM `payments`;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` (`id`, `enrollment_id`, `payment_amount`, `payment_date`, `discount`, `fee_type_id`, `status`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
	(1, 1, 104.5, '2017-04-28', 5, 1, 1, 1, '2017-04-28 17:57:35', NULL, NULL),
	(2, 2, 120, '2017-04-21', 0, 2, 1, 1, '2017-04-28 22:29:07', NULL, NULL);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;


-- Dumping structure for table ksm.rooms
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `created_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table ksm.rooms: ~7 rows (approximately)
DELETE FROM `rooms`;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` (`id`, `name`, `created_date`, `created_by`, `modified_date`, `modified_by`, `status`) VALUES
	(1, 'Room A', '2017-01-01 01:01:01', 1, NULL, NULL, 1),
	(2, 'Room B', '2017-01-31 10:46:01', 1, NULL, NULL, 1),
	(3, 'Room C', '2017-01-11 03:01:01', 1, NULL, NULL, 1),
	(4, 'Room D', '2017-01-01 07:01:01', 1, NULL, NULL, 1),
	(5, 'Room E', '2017-02-20 01:51:01', 1, NULL, NULL, 1),
	(6, 'Room F', '2017-02-06 11:21:01', 1, NULL, NULL, 1),
	(7, 'Room G', '2017-03-19 12:01:01', 1, NULL, NULL, 1);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;


-- Dumping structure for table ksm.sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table ksm.sessions: ~3 rows (approximately)
DELETE FROM `sessions`;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`id`, `name`, `created_date`, `created_by`, `modified_date`, `modified_by`, `status`) VALUES
	(1, 'Morning', '2017-01-11 01:01:01', 1, NULL, NULL, 1),
	(2, 'Afternoon', '2017-02-25 01:01:01', 1, NULL, NULL, 1),
	(3, 'Full Day', '2017-03-21 01:01:01', 1, NULL, NULL, 1);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;


-- Dumping structure for table ksm.students
DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL DEFAULT '',
  `lastname` varchar(30) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL COMMENT '1:Male, 2:Female',
  `dob` date NOT NULL,
  `address` varchar(500) NOT NULL DEFAULT '',
  `contact_person_name` varchar(50) NOT NULL DEFAULT '',
  `contact_person_relationship` tinyint(1) NOT NULL COMMENT '1:Parents, 2:Other',
  `contact_person_phone` varchar(30) NOT NULL DEFAULT '',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1:active, 2:deactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- Dumping data for table ksm.students: ~23 rows (approximately)
DELETE FROM `students`;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` (`id`, `firstname`, `lastname`, `sex`, `dob`, `address`, `contact_person_name`, `contact_person_relationship`, `contact_person_phone`, `created_by`, `created_date`, `modified_by`, `modified_date`, `status`) VALUES
	(1, 'Dara', 'Sok', 2, '2013-09-05', '#11, Chamkamon, Phnom penh', 'Sok Voleak', 1, '012369255', 2, '2017-01-11 12:11:21', 1, '2017-04-09 12:54:24', 1),
	(2, 'Hy', 'Bora', 2, '2011-08-25', '#223, PoSenCheay, Phnom penh', 'Bora Keochea', 1, '012369256', 2, '2017-01-11 12:11:21', 0, '2017-01-11 12:11:21', 1),
	(3, 'Chea', 'Piset', 1, '2009-03-07', '#330, Chamkamon, Phnom penh', 'Piset Dara', 2, '012369257', 2, '2017-01-11 12:11:21', 1, '2017-04-10 16:05:49', 1),
	(4, 'Noy', 'Sovan', 2, '2010-05-30', '#44, Chamkamon, Phnom penh', 'Sovan Longsat', 1, '012369258', 2, '2017-01-11 12:11:21', 1, '2017-04-09 12:51:38', 1),
	(11, 'Koe', 'Chan', 2, '2015-04-18', '#12, DanKao, Phnom penh, Cambodia', 'Chan Dauch', 2, '012457836', 1, '2017-04-09 12:31:38', NULL, NULL, 1),
	(12, 'Ky', 'Tong', 1, '2000-04-22', '#890, Kakab, Phnom penh, Cambodia', 'Tong yuth', 1, '013569747', 1, '2017-04-09 12:41:28', 1, '2017-04-09 12:53:37', 1),
	(13, 'Pisetha', 'Chan', 2, '2005-04-23', '#406, Meanchey, Phnom penh, Cambodia', 'Chan Bora', 1, '012654789', 1, '2017-04-09 13:00:18', 0, '2017-04-09 13:00:46', 1),
	(14, 'Cheat', 'Phek', 1, '2010-04-23', '#07, Russey Keo, Phnom penh, Cambodia', 'Phek gy', 1, '014725830', 1, '2017-04-10 09:37:41', NULL, NULL, 1),
	(15, 'Jy', 'Hek', 1, '2010-04-23', '#91, Prosenchey, Phnom penh, Cambodia', 'Hek yu', 1, '013697779', 1, '2017-04-10 09:38:18', NULL, NULL, 1),
	(16, 'Hout', 'Bo', 1, '2010-04-23', '#151, Chamkamon, Phnom penh', 'Bo noop', 2, '015698888', 1, '2017-04-10 09:39:57', NULL, NULL, 1),
	(17, 'Noup', 'Kea', 2, '2010-04-23', '#31, Phar Tmey, Phnom penh, Cambodia', 'Kea chan', 1, '019874563', 1, '2017-04-10 09:40:40', NULL, NULL, 1),
	(18, 'Meas', 'Ly', 2, '2010-04-23', '#09, Sen Sok, Phnom penh, Cambodia', 'Ly Dara', 2, '011874563', 1, '2017-04-10 09:41:29', NULL, NULL, 1),
	(19, 'Dara', 'Sokha', 1, '2013-09-05', '#11, Chamkamon, Phnom penh', 'Sokha Pisey', 1, '012369255', 1, '2017-04-10 14:19:20', 1, '2017-04-10 14:25:45', 1),
	(20, 'Darit', 'Hong', 1, '2011-04-22', '#123, Toulkook, Phnom penh, Cambodia', 'Hong Da', 1, '012695847', 1, '2017-04-11 10:28:47', NULL, NULL, 1),
	(21, 'Pisey', 'Sou', 1, '2003-04-23', '#89, Phnom Pneh Tmey, Phnom penh, Cambodia', 'Sou Sao', 2, '013695847', 1, '2017-04-11 10:38:56', NULL, NULL, 1),
	(22, 'Kim', 'Lon', 2, '2005-04-19', '#210, Daun Penh, Phnom penh, Cambodia', 'Lon Sok', 1, '014789569', 1, '2017-04-18 10:05:09', NULL, NULL, 1),
	(23, 'Sopheap', 'Long', 1, '2003-04-20', '#301, Olypic, Phnom penh, Cambodia', 'Long Ty', 1, '023658974', 1, '2017-04-20 20:43:28', NULL, NULL, 1),
	(24, 'Sophal', 'Noty', 1, '2009-04-21', '#2005, 7Mekara, Phnom penh, Cambodia', 'Noty Pou', 2, '066879651', 1, '2017-04-20 21:20:51', NULL, NULL, 1),
	(25, 'Vicheat', 'Gy', 1, '2007-04-19', '#009, Sen Sok, Phnom penh, Cambodia', 'Gy Mouy', 2, '014782236', 1, '2017-04-20 21:47:28', 1, '2017-04-20 21:47:47', 1),
	(26, 'Sort', 'Tou', 2, '2013-04-21', '#46, Olympic, Phnom penh, Cambodia', 'Tou Dy', 1, '078369258', 1, '2017-04-20 23:37:51', NULL, NULL, 1),
	(27, 'Sovann', 'Preap', 1, '2008-04-20', '#83, Phar Tmey, Phnom penh, Cambodia', 'Preap Sovat', 1, '015369258', 1, '2017-04-20 23:58:33', NULL, NULL, 1),
	(28, 'Bonrith', 'Ty', 2, '2006-04-21', '#23, Toulkook, Phnom penh, Cambodia', 'Ty Da', 1, '016259874', 1, '2017-04-21 00:33:17', NULL, NULL, 1),
	(29, 'Pha', 'Yuth', 1, '2010-04-21', '#210, Kakab, Phnom penh, Cambodia', 'Yuth Ty', 2, '698776687', 1, '2017-04-21 00:36:51', NULL, NULL, 1),
	(30, 'Vatheay', 'So', 2, '2011-04-22', '#316, Kakab, Phnom penh, Cambodia', 'So Sophal', 2, '014587923', 1, '2017-04-21 07:29:09', 0, '2017-04-21 07:39:59', 1);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;


-- Dumping structure for table ksm.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(250) NOT NULL DEFAULT '',
  `fullname` varchar(50) NOT NULL DEFAULT '',
  `created_date` datetime NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table ksm.users: ~2 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `fullname`, `created_date`, `created_by`, `modified_date`, `modified_by`, `status`) VALUES
	(1, 'test', '$2a$10$sYTIcOEMxGY0MCQ2f1VdxOlLWVHuRojuHQeT/ogWdSQrfRIiUq2i2', 'test user', '2017-01-01 11:21:17', 1, '2017-04-05 09:30:10', 0, 1),
	(2, 'test2', '$2a$10$sYTIcOEMxGY0MCQ2f1VdxOlLWVHuRojuHQeT/ogWdSQrfRIiUq2i2', 'test2 user', '2017-03-21 05:30:32', 1, '2017-04-28 15:58:46', NULL, 0),
	(3, 'admin', '$2a$10$PM9HLWaNzcndcdn3wjHitOxgSsGWELHq7QrGmqD6s0IvJpeRjWLVK', 'Admin', '2017-04-28 16:30:21', 1, NULL, NULL, 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
