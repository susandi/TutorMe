SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `TutorMeDatabase` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `TutorMeDatabase` ;

-- -----------------------------------------------------
-- Table `TutorMeDatabase`.`student`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `TutorMeDatabase`.`student` (
  `id` INT NOT NULL ,
  `first_name` VARCHAR(45) NULL ,
  `last_name` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  `username` VARCHAR(45) NULL ,
  `password` VARCHAR(45) NULL ,
  `salt` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TutorMeDatabase`.`tutor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `TutorMeDatabase`.`tutor` (
  `id` INT NOT NULL ,
  `first_name` VARCHAR(45) NULL ,
  `last_name` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  `username` VARCHAR(45) NULL ,
  `password` VARCHAR(45) NULL ,
  `salt` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TutorMeDatabase`.`course`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `TutorMeDatabase`.`course` (
  `id` INT NOT NULL ,
  `course_name` VARCHAR(45) NULL ,
  `department` VARCHAR(45) NULL ,
  `university` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TutorMeDatabase`.`student_has_course`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `TutorMeDatabase`.`student_has_course` (
  `student_id` INT NOT NULL ,
  `course_id` INT NOT NULL ,
  PRIMARY KEY (`student_id`, `course_id`) ,
  INDEX `fk_student_has_course_course1_idx` (`course_id` ASC) ,
  INDEX `fk_student_has_course_student_idx` (`student_id` ASC) ,
  CONSTRAINT `fk_student_has_course_student`
    FOREIGN KEY (`student_id` )
    REFERENCES `TutorMeDatabase`.`student` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_course_course1`
    FOREIGN KEY (`course_id` )
    REFERENCES `TutorMeDatabase`.`course` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TutorMeDatabase`.`tutor_has_course`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `TutorMeDatabase`.`tutor_has_course` (
  `tutor_id` INT NOT NULL ,
  `course_id` INT NOT NULL ,
  PRIMARY KEY (`tutor_id`, `course_id`) ,
  INDEX `fk_tutor_has_course_course1_idx` (`course_id` ASC) ,
  INDEX `fk_tutor_has_course_tutor1_idx` (`tutor_id` ASC) ,
  CONSTRAINT `fk_tutor_has_course_tutor1`
    FOREIGN KEY (`tutor_id` )
    REFERENCES `TutorMeDatabase`.`tutor` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tutor_has_course_course1`
    FOREIGN KEY (`course_id` )
    REFERENCES `TutorMeDatabase`.`course` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
