{\rtf1\ansi\ansicpg1252\cocoartf1187\cocoasubrtf370
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww21340\viewh12820\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural

\f0\fs24 \cf0 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;\
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;\
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';\
\
CREATE SCHEMA IF NOT EXISTS `TutorMeDatabase` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;\
USE `TutorMeDatabase` ;\
\
-- -----------------------------------------------------\
-- Table `TutorMeDatabase`.`student`\
-- -----------------------------------------------------\
CREATE  TABLE IF NOT EXISTS `TutorMeDatabase`.`student` (\
  `id` INT NOT NULL ,\
  `first_name` VARCHAR(45) NULL ,\
  `last_name` VARCHAR(45) NULL ,\
  `email` VARCHAR(45) NULL ,\
  `username` VARCHAR(45) NULL ,\
  `password` VARCHAR(45) NULL ,\
  `salt` VARCHAR(45) NULL ,\
  PRIMARY KEY (`id`) )\
ENGINE = InnoDB;\
\
\
-- -----------------------------------------------------\
-- Table `TutorMeDatabase`.`tutor`\
-- -----------------------------------------------------\
CREATE  TABLE IF NOT EXISTS `TutorMeDatabase`.`tutor` (\
  `id` INT NOT NULL ,\
  `first_name` VARCHAR(45) NULL ,\
  `last_name` VARCHAR(45) NULL ,\
  `email` VARCHAR(45) NULL ,\
  `username` VARCHAR(45) NULL ,\
  `password` VARCHAR(45) NULL ,\
  `salt` VARCHAR(45) NULL ,\
  PRIMARY KEY (`id`) )\
ENGINE = InnoDB;\
\
\
-- -----------------------------------------------------\
-- Table `TutorMeDatabase`.`course`\
-- -----------------------------------------------------\
CREATE  TABLE IF NOT EXISTS `TutorMeDatabase`.`course` (\
  `id` INT NOT NULL ,\
  `course_name` VARCHAR(45) NULL ,\
  `department` VARCHAR(45) NULL ,\
  `university` VARCHAR(45) NULL ,\
  PRIMARY KEY (`id`) )\
ENGINE = InnoDB;\
\
\
-- -----------------------------------------------------\
-- Table `TutorMeDatabase`.`student_has_course`\
-- -----------------------------------------------------\
CREATE  TABLE IF NOT EXISTS `TutorMeDatabase`.`student_has_course` (\
  `student_id` INT NOT NULL ,\
  `course_id` INT NOT NULL ,\
  PRIMARY KEY (`student_id`, `course_id`) ,\
  INDEX `fk_student_has_course_course1_idx` (`course_id` ASC) ,\
  INDEX `fk_student_has_course_student_idx` (`student_id` ASC) ,\
  CONSTRAINT `fk_student_has_course_student`\
    FOREIGN KEY (`student_id` )\
    REFERENCES `TutorMeDatabase`.`student` (`id` )\
    ON DELETE NO ACTION\
    ON UPDATE NO ACTION,\
  CONSTRAINT `fk_student_has_course_course1`\
    FOREIGN KEY (`course_id` )\
    REFERENCES `TutorMeDatabase`.`course` (`id` )\
    ON DELETE NO ACTION\
    ON UPDATE NO ACTION)\
ENGINE = InnoDB;\
\
\
-- -----------------------------------------------------\
-- Table `TutorMeDatabase`.`tutor_has_course`\
-- -----------------------------------------------------\
CREATE  TABLE IF NOT EXISTS `TutorMeDatabase`.`tutor_has_course` (\
  `tutor_id` INT NOT NULL ,\
  `course_id` INT NOT NULL ,\
  PRIMARY KEY (`tutor_id`, `course_id`) ,\
  INDEX `fk_tutor_has_course_course1_idx` (`course_id` ASC) ,\
  INDEX `fk_tutor_has_course_tutor1_idx` (`tutor_id` ASC) ,\
  CONSTRAINT `fk_tutor_has_course_tutor1`\
    FOREIGN KEY (`tutor_id` )\
    REFERENCES `TutorMeDatabase`.`tutor` (`id` )\
    ON DELETE NO ACTION\
    ON UPDATE NO ACTION,\
  CONSTRAINT `fk_tutor_has_course_course1`\
    FOREIGN KEY (`course_id` )\
    REFERENCES `TutorMeDatabase`.`course` (`id` )\
    ON DELETE NO ACTION\
    ON UPDATE NO ACTION)\
ENGINE = InnoDB;\
\
\
-- -----------------------------------------------------\
-- Populate student\
-- -----------------------------------------------------\
\pard\pardeftab720\sl420
\cf0 INSERT INTO `student` (`id`, `first_name`, `last_name`, `email`, `username`, `password`, `salt`) VALUES\
(1, 'admin_first', 'admin_last', 'admin@admin', 'admin ', 'd3da100d34932b0cd796a9ece89ec0be076665978007a59bd17a9b52bbc5ed4a6a2ffa35c07ef35cee498dd5087a91714a9f', '830710796517d717a1f6879.54793340'),\
(2, 'guest_first', 'guest_last', 'guest@guest', 'guest', '03592187206aeca00c61e0670da882961b11dd1c1a59f30a51072723f0f1b379f88f6bc6524946f1bd4846ea1d31cc756cd7', '842596234517d718dc7e295.31688249'),\
(3, 'aaa_first', 'aaa_last', 'aaa@aaa', 'aaa', '2ebe8e6322b88db57a3280f0cefea4d2b42f9eb6fd73eca19668274f001ece5cdac9866cfb1423e4034936ffcd4259ef166e', '1011950024517d721251fd17.20484217');\
\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural
\cf0 \
-- -----------------------------------------------------\
-- Populate course\
-- -----------------------------------------------------\
INSERT INTO `course` (`id`, `course_name`, `department`, `university`) VALUES\
(1, 'CS100W', 'CS', 'SJSU'),\
(2, 'CS160', 'CS', 'SJSU'),\
(3, 'CS152', 'CS', 'SJSU');\
\
\
\
SET SQL_MODE=@OLD_SQL_MODE;\
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;\
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;\
}