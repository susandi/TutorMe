-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 30, 2013 at 06:55 AM
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
  `courseId` int(11) NOT NULL DEFAULT '0',
  `course_name` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `university` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseId`, `course_name`, `department`, `university`) VALUES
(1, 'AFAM 200W', 'African-American Studies', 'San Jose State University'),
(2, 'AMS 001', 'American Studies', 'San Jose State University'),
(3, 'ASM 001', 'Asian American Studies', 'San Jose State University'),
(4, 'ANT 001', 'Anthropology', 'San Jose State University'),
(5, 'ART 001', 'Art', 'San Jose State University'),
(6, 'ASTN 001', 'Astronomy', 'San Jose State University'),
(7, 'BUS 001', 'Business', 'San Jose State University'),
(8, 'BOT 001', 'Botany', 'San Jose State University'),
(9, 'BIO 001', 'Biology', 'San Jose State University'),
(10, 'CHEM 001', 'Chemical engineering', 'San Jose State University'),
(11, 'CMPE 046', 'Computer engineering', 'San Jose State University'),
(12, 'CMPE 050', 'Computer engineering', 'San Jose State University'),
(13, 'CMPE 102', 'Computer engineering', 'San Jose State University'),
(14, 'CMPE 110', 'Computer engineering', 'San Jose State University'),
(15, 'CMPE 120', 'Computer engineering', 'San Jose State University'),
(16, 'CMPE 124', 'Computer engineering', 'San Jose State University'),
(17, 'CMPE 125', 'Computer engineering', 'San Jose State University'),
(18, 'CMPE 126', 'Computer engineering', 'San Jose State University'),
(19, 'CMPE 127', 'Computer engineering', 'San Jose State University'),
(20, 'CMPE 130', 'Computer engineering', 'San Jose State University'),
(21, 'CS 46A', 'Computer science', 'San Jose State University'),
(22, 'CS 46B', 'Computer science', 'San Jose State University'),
(23, 'CS 49C', 'Computer science', 'San Jose State University'),
(24, 'CS 49J', 'Computer science', 'San Jose State University'),
(25, 'CS 100W', 'Computer science', 'San Jose State University'),
(26, 'CS 146', 'Computer science', 'San Jose State University'),
(27, 'CS 147', 'Computer science', 'San Jose State University'),
(28, 'CS 149', 'Computer science', 'San Jose State University'),
(29, 'CS 151', 'Computer science', 'San Jose State University'),
(30, 'CS 154', 'Computer science', 'San Jose State University'),
(31, 'COMM 001', 'Communication studies', 'San Jose State University'),
(32, 'ECON 001', 'Economics', 'San Jose State University'),
(33, 'ENG 001', 'English', 'San Jose State University'),
(34, 'ENVS 001', 'Environmental studies', 'San Jose State University'),
(35, 'EDUC 001', 'Education', 'San Jose State University'),
(36, 'FORL 001', 'Foreign languages', 'San Jose State University'),
(37, 'FS 001', 'Forensic science', 'San Jose State University'),
(38, 'ENGR 001', 'General Engineering', 'San Jose State University'),
(39, 'GEOG 001', 'Geography', 'San Jose State University'),
(40, ' GERM 001', 'German', 'San Jose State University'),
(41, 'HPRF 001', 'Health profession', 'San Jose State University'),
(42, 'HS 001', 'Health science', 'San Jose State University'),
(43, 'HIS 001', 'History', 'San Jose State University'),
(44, 'HUM 001', 'Humanities', 'San Jose State University'),
(45, 'DSIT 001', 'Interior design', 'San Jose State University'),
(46, 'DSID 001', 'industrial design', 'San Jose State University'),
(47, 'JOUR 001', 'Journalism', 'San Jose State University');

-- --------------------------------------------------------

--
-- Table structure for table `major_lists`
--

CREATE TABLE IF NOT EXISTS `major_lists` (
  `majorId` int(10) NOT NULL DEFAULT '0',
  `majors` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`majorId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `major_lists`
--

INSERT INTO `major_lists` (`majorId`, `majors`) VALUES
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
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `uId` int(11) NOT NULL DEFAULT '0',
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `salt` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uId`, `username`, `password`, `salt`) VALUES
(1, 'RobertM', '223fsdvfdb3251342', '12424rfdverg43t52'),
(2, 'ChristinaK', 'f96fb288471135d43f46e21748f99be0dac5bd5974103', '1956535226514368f68e3db7.01703686'),
(3, 'VanessaS', '031989fdb6eefe8a3fb2fc75cc2fefcd078b0f950f0ad', '1498132156514368b53684c3.46308604');

-- --------------------------------------------------------

--
-- Table structure for table `userprofile`
--

CREATE TABLE IF NOT EXISTS `userprofile` (
  `uId` int(10) NOT NULL DEFAULT '0',
  `lastname` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `usertype` varchar(45) DEFAULT NULL,
  `major` varchar(45) DEFAULT NULL,
  `school` varchar(45) DEFAULT NULL,
  `degree` varchar(45) DEFAULT NULL,
  `location` varchar(60) DEFAULT NULL,
  `fees` varchar(60) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `availableTime` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`uId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userprofile`
--

INSERT INTO `userprofile` (`uId`, `lastname`, `firstname`, `usertype`, `major`, `school`, `degree`, `location`, `fees`, `image`, `availableTime`) VALUES
(1, 'Anand', 'Michael', 'Tutor', 'Computer Science', 'SJSU', 'B.Sc', 'San Jose', '$10 per hour', NULL, '8:00-5:00 Monday thru Friday'),
(2, 'K', 'Christina', 'Tutor', 'Computer Science', 'SJSU', 'B.Sc', ' San Jose,Sunnyvale, ', '$10/hour', NULL, '10:00 to 2:00 weekdays'),
(3, 'Smith', 'Vanessa', 'Student', 'Computer Science', 'SJSU', 'student', 'Campbell', '$10/hour', NULL, 'Anytime'),
(4, 'Brown', 'Scott', 'Tutor', 'Literature', 'SJSU', 'senior student', 'San Jose', '$10/hour', NULL, '8:00 to 3:00 weekdays');

-- --------------------------------------------------------

--
-- Table structure for table `user_has_courses`
--

CREATE TABLE IF NOT EXISTS `user_has_courses` (
  `uId` int(10) DEFAULT NULL,
  `courseId` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_has_courses`
--

INSERT INTO `user_has_courses` (`uId`, `courseId`) VALUES
(1, 20),
(1, 22),
(1, 25),
(3, 22),
(2, 22),
(2, 21);
