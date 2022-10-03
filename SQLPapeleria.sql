-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BDPAPELERIA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BDPAPELERIA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BDPAPELERIA` DEFAULT CHARACTER SET utf8 ;
USE `BDPAPELERIA` ;

-- -----------------------------------------------------
-- Table `BDPAPELERIA`.`CATEGORIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDPAPELERIA`.`CATEGORIA` (
  `IdCat` INT NOT NULL,
  `NomCat` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IdCat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDPAPELERIA`.`PROVEEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDPAPELERIA`.`PROVEEDOR` (
  `NitProv` INT NOT NULL,
  `NomProv` VARCHAR(30) NOT NULL,
  `DirProv` VARCHAR(30) NOT NULL,
  `TelProv` INT NOT NULL,
  `CorProv` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`NitProv`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDPAPELERIA`.`ARTICULO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDPAPELERIA`.`ARTICULO` (
  `IdArt` INT NOT NULL,
  `IdCat` INT NOT NULL,
  `NitProv` INT NOT NULL,
  `NomArt` VARCHAR(30) NOT NULL,
  `ExisArt` INT NOT NULL,
  `PreArt` FLOAT NOT NULL,
  `MarArt` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`IdArt`),
  INDEX `IdCat_idx` (`IdCat` ASC) VISIBLE,
  INDEX `NitProv_idx` (`NitProv` ASC) VISIBLE,
  CONSTRAINT `IdCat`
    FOREIGN KEY (`IdCat`)
    REFERENCES `BDPAPELERIA`.`CATEGORIA` (`IdCat`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `NitProv`
    FOREIGN KEY (`NitProv`)
    REFERENCES `BDPAPELERIA`.`PROVEEDOR` (`NitProv`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDPAPELERIA`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDPAPELERIA`.`user` (
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP);


-- -----------------------------------------------------
-- Table `BDPAPELERIA`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDPAPELERIA`.`category` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`category_id`));


-- -----------------------------------------------------
-- Table `BDPAPELERIA`.`timestamps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDPAPELERIA`.`timestamps` (
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL);


-- -----------------------------------------------------
-- Table `BDPAPELERIA`.`timestamps_1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDPAPELERIA`.`timestamps_1` (
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL);


-- -----------------------------------------------------
-- Table `BDPAPELERIA`.`timestamps_2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDPAPELERIA`.`timestamps_2` (
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL);


-- -----------------------------------------------------
-- Table `BDPAPELERIA`.`PROVEEDOR_has_PROVEEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDPAPELERIA`.`PROVEEDOR_has_PROVEEDOR` (
  `PROVEEDOR_NitProv` INT NOT NULL,
  `PROVEEDOR_NitProv1` INT NOT NULL,
  PRIMARY KEY (`PROVEEDOR_NitProv`, `PROVEEDOR_NitProv1`),
  INDEX `fk_PROVEEDOR_has_PROVEEDOR_PROVEEDOR2_idx` (`PROVEEDOR_NitProv1` ASC) VISIBLE,
  INDEX `fk_PROVEEDOR_has_PROVEEDOR_PROVEEDOR1_idx` (`PROVEEDOR_NitProv` ASC) VISIBLE,
  CONSTRAINT `fk_PROVEEDOR_has_PROVEEDOR_PROVEEDOR1`
    FOREIGN KEY (`PROVEEDOR_NitProv`)
    REFERENCES `BDPAPELERIA`.`PROVEEDOR` (`NitProv`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PROVEEDOR_has_PROVEEDOR_PROVEEDOR2`
    FOREIGN KEY (`PROVEEDOR_NitProv1`)
    REFERENCES `BDPAPELERIA`.`PROVEEDOR` (`NitProv`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
