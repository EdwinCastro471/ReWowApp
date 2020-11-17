-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `Role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Role` ;

CREATE TABLE IF NOT EXISTS `Role` (
  `idRole` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  PRIMARY KEY (`idRole`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `title_UNIQUE` ON `Role` (`title` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `User` ;

CREATE TABLE IF NOT EXISTS `User` (
  `idUser` INT NOT NULL,
  `idRole` INT NOT NULL,
  `user` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUser`),
  CONSTRAINT `FkRole`
    FOREIGN KEY (`idRole`)
    REFERENCES `Role` (`idRole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `user_UNIQUE` ON `User` (`user` ASC) VISIBLE;

CREATE UNIQUE INDEX `userRoleId_UNIQUE` ON `User` (`idRole` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `UserInformation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UserInformation` ;

CREATE TABLE IF NOT EXISTS `UserInformation` (
  `idUser` INT NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`idUser`),
  CONSTRAINT `FkUser`
    FOREIGN KEY (`idUser`)
    REFERENCES `User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idUser_UNIQUE` ON `UserInformation` (`idUser` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `PetType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PetType` ;

CREATE TABLE IF NOT EXISTS `PetType` (
  `idPetType` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPetType`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `type_UNIQUE` ON `PetType` (`type` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Pet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pet` ;

CREATE TABLE IF NOT EXISTS `Pet` (
  `idPet` INT NOT NULL AUTO_INCREMENT,
  `idUser` INT NOT NULL,
  `idPetType` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `size` VARCHAR(45) NOT NULL,
  `description` LONGTEXT NULL,
  PRIMARY KEY (`idPet`),
  CONSTRAINT `idPetTypeFK`
    FOREIGN KEY (`idPetType`)
    REFERENCES `PetType` (`idPetType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FkIdUser`
    FOREIGN KEY (`idUser`)
    REFERENCES `User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `IdPetType_UNIQUE` ON `Pet` (`idPetType` ASC) VISIBLE;

CREATE INDEX `FkIdUser_idx` ON `Pet` (`idUser` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Vaccinations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Vaccinations` ;

CREATE TABLE IF NOT EXISTS `Vaccinations` (
  `idVaccinations` INT NOT NULL AUTO_INCREMENT,
  `idPet` INT NOT NULL,
  `number` INT NULL,
  `type` VARCHAR(45) NULL,
  `date` DATE NULL,
  PRIMARY KEY (`idVaccinations`),
  CONSTRAINT `FkIdPet`
    FOREIGN KEY (`idPet`)
    REFERENCES `Pet` (`idPet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `FkIdPet_idx` ON `Vaccinations` (`idPet` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
