-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema gamedb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gamedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gamedb` DEFAULT CHARACTER SET utf8 ;
USE `gamedb` ;

-- -----------------------------------------------------
-- Table `gamedb`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gamedb`.`member` (
  `id` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NULL,
  `birthdate` DATE NULL,
  `gender` INT NULL,
  `email` VARCHAR(100) NOT NULL,
  `image` VARCHAR(100) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gamedb`.`game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gamedb`.`game` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `explanation` TEXT NOT NULL,
  `platform` VARCHAR(45) NULL,
  `thumbnail` VARCHAR(100) NOT NULL,
  `views` INT NOT NULL DEFAULT 0,
  `rating` DOUBLE NULL,
  `reviews` INT NOT NULL DEFAULT 0,
  `releaseDate` DATE NULL,
  `trailer` TEXT NULL,
  `screenshot1` VARCHAR(45) NULL,
  `screenshot2` VARCHAR(45) NULL,
  `screenshot3` VARCHAR(45) NULL,
  `screenshot4` VARCHAR(45) NULL,
  `relevant_site1` TEXT NULL,
  `relevant_site2` VARCHAR(45) NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gamedb`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gamedb`.`review` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `member_id` VARCHAR(45) NOT NULL,
  `game_no` INT NOT NULL,
  `date` DATETIME NULL,
  `contents` TEXT NULL,
  `stars` DOUBLE NULL,
  `image` VARCHAR(100) NULL,
  `approve` INT NULL,
  `disapprRsn` TEXT NULL,
  PRIMARY KEY (`no`),
  UNIQUE INDEX `no_UNIQUE` (`no` ASC) VISIBLE,
  INDEX `fk_review_member_idx` (`member_id` ASC) VISIBLE,
  INDEX `fk_review_game1_idx` (`game_no` ASC) VISIBLE,
  CONSTRAINT `fk_review_member`
    FOREIGN KEY (`member_id`)
    REFERENCES `gamedb`.`member` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_review_game1`
    FOREIGN KEY (`game_no`)
    REFERENCES `gamedb`.`game` (`no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gamedb`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gamedb`.`genre` (
  `game_no` INT NOT NULL,
  `genre` VARCHAR(45) NOT NULL,
  INDEX `fk_genre_game1_idx` (`game_no` ASC) VISIBLE,
  CONSTRAINT `fk_genre_game1`
    FOREIGN KEY (`game_no`)
    REFERENCES `gamedb`.`game` (`no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gamedb`.`wishlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gamedb`.`wishlist` (
  `member_id` VARCHAR(45) NOT NULL,
  `game_no` INT NOT NULL,
  INDEX `fk_wishlist_member1_idx` (`member_id` ASC) VISIBLE,
  INDEX `fk_wishlist_game1_idx` (`game_no` ASC) VISIBLE,
  CONSTRAINT `fk_wishlist_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `gamedb`.`member` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_wishlist_game1`
    FOREIGN KEY (`game_no`)
    REFERENCES `gamedb`.`game` (`no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gamedb`.`mainImgs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gamedb`.`mainimgs` (
  `no` INT NOT NULL,
  `image` VARCHAR(100) NULL,
  `title` TEXT NULL,
  `subtitle` TEXT NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gamedb`.`promotion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gamedb`.`promotion` (
  `platform` VARCHAR(45) NOT NULL,
  `startDate` DATE NULL,
  `endDate` DATE NULL,
  `mainImage` VARCHAR(100) NULL,
  `image` VARCHAR(100) NULL,
  `link` TEXT NULL)
  
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
