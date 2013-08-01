-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 28, 2013 at 10:34 PM
-- Server version: 5.1.44
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `TutorMeDatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `university` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_name`, `department`, `university`) VALUES
('AFAM 200W', 'African-American Studies', 'San Jose State University'),
( 'AMS 001', 'American Studies', 'San Jose State University'),
('ASM 001', 'Asian American Studies', 'San Jose State University'),
( 'ANT 001', 'Anthropology', 'San Jose State University'),
('ART 001', 'Art', 'San Jose State University'),
('ASTN 001', 'Astronomy', 'San Jose State University'),
( 'BUS 001', 'Business', 'San Jose State University'),
('BOT 001', 'Botany', 'San Jose State University'),
( 'BIO 001', 'Biology', 'San Jose State University'),
( 'CHEM 001', 'Chemical engineering', 'San Jose State University'),
( 'CMPE 046', 'Computer engineering', 'San Jose State University'),
( 'CMPE 050', 'Computer engineering', 'San Jose State University'),
( 'CMPE 102', 'Computer engineering', 'San Jose State University'),
('CMPE 110', 'Computer engineering', 'San Jose State University'),
( 'CMPE 120', 'Computer engineering', 'San Jose State University'),
( 'CMPE 124', 'Computer engineering', 'San Jose State University'),
( 'CMPE 125', 'Computer engineering', 'San Jose State University'),
('CMPE 126', 'Computer engineering', 'San Jose State University'),
('CMPE 127', 'Computer engineering', 'San Jose State University'),
( 'CMPE 130', 'Computer engineering', 'San Jose State University'),
( 'CS 46A', 'Computer science', 'San Jose State University'),
( 'CS 46B', 'Computer science', 'San Jose State University'),
( 'CS 49C', 'Computer science', 'San Jose State University'),
( 'CS 49J', 'Computer science', 'San Jose State University'),
( 'CS 100W', 'Computer science', 'San Jose State University'),
( 'CS 146', 'Computer science', 'San Jose State University'),
( 'CS 147', 'Computer science', 'San Jose State University'),
( 'CS 149', 'Computer science', 'San Jose State University'),
( 'CS 151', 'Computer science', 'San Jose State University'),
( 'CS 154', 'Computer science', 'San Jose State University'),
( 'COMM 001', 'Communication studies', 'San Jose State University'),
( 'ECON 001', 'Economics', 'San Jose State University'),
( 'ENG 001', 'English', 'San Jose State University'),
( 'ENVS 001', 'Environmental studies', 'San Jose State University'),
( 'EDUC 001', 'Education', 'San Jose State University'),
( 'FORL 001', 'Foreign languages', 'San Jose State University'),
( 'FS 001', 'Forensic science', 'San Jose State University'),
( 'ENGR 001', 'General Engineering', 'San Jose State University'),
( 'GEOG 001', 'Geography', 'San Jose State University'),
( ' GERM 001', 'German', 'San Jose State University'),
( 'HPRF 001', 'Health profession', 'San Jose State University'),
( 'HS 001', 'Health science', 'San Jose State University'),
( 'HIS 001', 'History', 'San Jose State University'),
( 'HUM 001', 'Humanities', 'San Jose State University'),
( 'DSIT 001', 'Interior design', 'San Jose State University'),
( 'DSID 001', 'industrial design', 'San Jose State University'),
( 'JOUR 001', 'Journalism', 'San Jose State University');

-- --------------------------------------------------------

--
-- Table structure for table `major_lists`
--

CREATE TABLE IF NOT EXISTS `major_lists` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `majors` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `major_lists`
--

INSERT INTO `major_lists` (`id`, `majors`) VALUES
(1, 'African Studies'),
(2, 'American Studies'),
(3, 'Asian American Studies'),
(4, 'Anthropology'),
(5, 'Art'),
(6, 'Astronomy'),
(7, 'Business'),
(8, 'Botany'),
(9, 'Biology'),
(10, 'Chemical engineering'),
(11, 'Computer engineering'),
(12, 'Computer science'),
(13, 'Communication studies'),
(14, 'Economics'),
(15, 'English'),
(16, 'Environmental studies'),
(17, 'Education'),
(18, 'Foreign languages'),
(19, 'Forensic science'),
(20, 'General Engineering'),
(21, 'Geography'),
(22, 'German'),
(23, 'Health'),
(24, 'Health science'),
(25, 'History'),
(26, 'Humanities'),
(27, 'Interior design'),
(28, 'industrial design'),
(29, 'Journalism');




-- --------------------------------------------------------

--
-- Table structure for table `student_has_course`
--

CREATE TABLE IF NOT EXISTS `student_has_course` (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`student_id`,`course_id`),
  KEY `fk_student_has_course_course1_idx` (`course_id`),
  KEY `fk_student_has_course_student_idx` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_has_course`
--


-- --------------------------------------------------------

--
-- Table structure for table `tutor`
--

CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `salt` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `userprofile` (
  `uid` int(11) NOT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `usertype` varchar(45) DEFAULT NULL,
  `major` varchar(45) DEFAULT NULL,
  `school` varchar(45) DEFAULT NULL,
  `degree` varchar(45) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `availableTime` varchar(60)  DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tutor`
--


-- --------------------------------------------------------

--
-- Table structure for table `tutor_has_course`
--

CREATE TABLE IF NOT EXISTS `tutor_has_course` (
  `tutor_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`tutor_id`,`course_id`),
  KEY `fk_tutor_has_course_course1_idx` (`course_id`),
  KEY `fk_tutor_has_course_tutor1_idx` (`tutor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tutor_has_course`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `student_has_course`
--
ALTER TABLE `student_has_course`
  ADD CONSTRAINT `fk_student_has_course_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_student_has_course_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tutor_has_course`
--
ALTER TABLE `tutor_has_course`
  ADD CONSTRAINT `fk_tutor_has_course_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tutor_has_course_tutor1` FOREIGN KEY (`tutor_id`) REFERENCES `tutor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
