DROP DATABASE IF EXISTS test1;
CREATE DATABASE test1 CHARACTER SET utf8mb4;
USE test1;
-- -----------------------------------------------------
-- Table `Status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Status` ;
CREATE TABLE IF NOT EXISTS `Status` (
  `idStatus` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`idStatus`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Original_language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Original_language` ;
CREATE TABLE IF NOT EXISTS `Original_language` (
  `idOriginal_language` INT AUTO_INCREMENT,
  `language` VARCHAR(255) NULL,
  PRIMARY KEY (`idOriginal_language`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Movies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Movies` ;
CREATE TABLE IF NOT EXISTS `Movies` (
  `idMovie` INT NOT NULL AUTO_INCREMENT,
  `index` INT NOT NULL,
  `budget` INT NULL,
  `homepage` VARCHAR(1000) NULL,
  `original_title` VARCHAR(1000) NULL,
  `overview` VARCHAR(5000) NULL,
  `popularity` DOUBLE NULL,
  `release_date` DATE NULL,
  `revenue` INT NULL,
  `runtime` DOUBLE NULL,
  `tagline` VARCHAR(1000) NULL,
  `title` VARCHAR(1000) NULL,
  `keywords` TEXT(1000) NULL,
  `vote_count` INT NULL,
  `vote_average` DOUBLE NULL,
  `idStatus` INT NOT NULL,
  `idOriginal_language` INT NOT NULL,
  PRIMARY KEY (`idMovie`),
    FOREIGN KEY (`idStatus`)
    REFERENCES `Status` (`idStatus`),
    FOREIGN KEY (`idOriginal_language`)
    REFERENCES `Original_language` (`idOriginal_language`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Production_companie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Production_companie` ;
CREATE TABLE IF NOT EXISTS `Production_companie` (
  `idProduction_companie` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`idProduction_companie`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Companie_movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Companie_movie` ;
CREATE TABLE IF NOT EXISTS `Companie_movie` (
  `idProduction_companie` INT NOT NULL,
  `idMovie` INT NOT NULL,
  PRIMARY KEY (`idProduction_companie`, `idMovie`),
    FOREIGN KEY (`idProduction_companie`)
    REFERENCES `Production_companie` (`idProduction_companie`),
    FOREIGN KEY (`idMovie`)
    REFERENCES `Movies` (`idMovie`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Production_countrie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Production_countrie` ;
CREATE TABLE IF NOT EXISTS `Production_countrie` (
  `isoCountrie` VARCHAR(2) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`isoCountrie`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Countrie_movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Countrie_movie` ;
CREATE TABLE IF NOT EXISTS `Countrie_movie` (
  `isoCountrie` VARCHAR(2) NOT NULL,
  `idMovie` INT NOT NULL,
  PRIMARY KEY (`isoCountrie`, `idMovie`),
    FOREIGN KEY (`isoCountrie`)
    REFERENCES `Production_countrie` (`isoCountrie`),
    FOREIGN KEY (`idMovie`)
    REFERENCES `Movies` (`idMovie`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Genre` ;
CREATE TABLE IF NOT EXISTS `Genre` (
  `idGenre` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idGenre`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Genre_movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Genre_movie` ;
CREATE TABLE IF NOT EXISTS `Genre_movie` (
  `idMovie` INT NOT NULL,
  `idGenre` INT NOT NULL,
  PRIMARY KEY (`idMovie`, `idGenre`),
    FOREIGN KEY (`idMovie`)
    REFERENCES `Movies` (`idMovie`),
    FOREIGN KEY (`idGenre`)
    REFERENCES `Genre` (`idGenre`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Spoken_language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Spoken_language` ;
CREATE TABLE IF NOT EXISTS `Spoken_language` (
  `isoLang` VARCHAR(2) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`isoLang`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Lenguage_movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Lenguage_movie` ;
CREATE TABLE IF NOT EXISTS `Lenguage_movie` (
  `idMovie` INT NOT NULL,
  `isoLang` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`idMovie`, `isoLang`),
    FOREIGN KEY (`idMovie`)
    REFERENCES `Movies` (`idMovie`),
    FOREIGN KEY (`isoLang`)
    REFERENCES `Spoken_language` (`isoLang`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Person` ;
CREATE TABLE IF NOT EXISTS `Person` (
  `idPerson` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  `gender` INT NULL,
  PRIMARY KEY (`idPerson`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Crew`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Crew` ;
CREATE TABLE IF NOT EXISTS `Crew` (
  `idMovie` INT NOT NULL,
  `job` VARCHAR(255) NOT NULL,
  `idPerson` INT NOT NULL,
  `department` VARCHAR(255) NULL,
  `credit_id` VARCHAR(255) NULL,
  PRIMARY KEY (`idMovie`, `job`, `idPerson`),
    FOREIGN KEY (`idMovie`)
    REFERENCES `Movies` (`idMovie`),
    FOREIGN KEY (`idPerson`)
    REFERENCES `Person` (`idPerson`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Cast`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cast` ;
CREATE TABLE IF NOT EXISTS `Cast` (
  `idPerson` INT NOT NULL,
  `idMovie` INT NOT NULL,
  PRIMARY KEY (`idPerson`, `idMovie`),
    FOREIGN KEY (`idPerson`)
    REFERENCES `Person` (`idPerson`),
    FOREIGN KEY (`idMovie`)
    REFERENCES `Movies` (`idMovie`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Director`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Director` ;
CREATE TABLE IF NOT EXISTS `Director` (
  `idPerson` INT NOT NULL,
  `idMovie` INT NOT NULL,
  PRIMARY KEY (`idPerson`, `idMovie`),
    FOREIGN KEY (`idPerson`)
    REFERENCES `Person` (`idPerson`),
    FOREIGN KEY (`idMovie`)
    REFERENCES `Movies` (`idMovie`))
ENGINE = InnoDB;