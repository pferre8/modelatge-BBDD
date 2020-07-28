-- MySQL Script generated by MySQL Workbench
-- Tue Jul 28 22:08:25 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Optics
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Optics
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Optics` DEFAULT CHARACTER SET utf8 ;
USE `Optics` ;

-- -----------------------------------------------------
-- Table `Optics`.`Supplier_has_Glasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optics`.`Supplier_has_Glasses` (
  `Supplier_Supplier_id` INT NOT NULL,
  `Glasses_Glasses_col` INT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Supplier_Supplier_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optics`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optics`.`Supplier` (
  `Supplier_id` INT NOT NULL AUTO_INCREMENT,
  `Name_col` VARCHAR(45) NULL,
  `Adress_col` VARCHAR(45) NULL,
  `Phone_col` VARCHAR(45) NULL,
  `Fax_col` VARCHAR(45) NULL,
  `NIF_col` VARCHAR(45) NULL,
  `Brand_col` VARCHAR(45) NULL,
  `Supplier_has_Glasses_Supplier_Supplier_id` INT NOT NULL,
  PRIMARY KEY (`Supplier_id`, `Supplier_has_Glasses_Supplier_Supplier_id`),
  INDEX `fk_Supplier_Supplier_has_Glasses1_idx` (`Supplier_has_Glasses_Supplier_Supplier_id` ASC) VISIBLE,
  CONSTRAINT `fk_Supplier_Supplier_has_Glasses1`
    FOREIGN KEY (`Supplier_has_Glasses_Supplier_Supplier_id`)
    REFERENCES `Optics`.`Supplier_has_Glasses` (`Supplier_Supplier_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optics`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optics`.`Order` (
  `Order_id` INT NOT NULL,
  `Glasses Reference_col` VARCHAR(45) NULL,
  `Employee_col` VARCHAR(45) NULL,
  PRIMARY KEY (`Order_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optics`.`Glasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optics`.`Glasses` (
  `Glasses_id` INT NOT NULL AUTO_INCREMENT,
  `Supplier_col` INT NULL,
  `Brand_col` VARCHAR(45) NULL,
  `Calibration_col` VARCHAR(45) NULL,
  `Design_col` VARCHAR(45) NULL,
  `Color_design_col` VARCHAR(45) NULL,
  `Price_col` VARCHAR(45) NULL,
  `Reference_col` VARCHAR(45) NULL,
  `Order_col` VARCHAR(45) NULL,
  `Supplier_has_Glasses_Supplier_Supplier_id` INT NOT NULL,
  `Order_Order_id` INT NOT NULL,
  PRIMARY KEY (`Glasses_id`, `Supplier_has_Glasses_Supplier_Supplier_id`, `Order_Order_id`),
  INDEX `fk_Glasses_Supplier_has_Glasses1_idx` (`Supplier_has_Glasses_Supplier_Supplier_id` ASC) VISIBLE,
  INDEX `fk_Glasses_Order1_idx` (`Order_Order_id` ASC) VISIBLE,
  CONSTRAINT `fk_Glasses_Supplier_has_Glasses1`
    FOREIGN KEY (`Supplier_has_Glasses_Supplier_Supplier_id`)
    REFERENCES `Optics`.`Supplier_has_Glasses` (`Supplier_Supplier_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Glasses_Order1`
    FOREIGN KEY (`Order_Order_id`)
    REFERENCES `Optics`.`Order` (`Order_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optics`.`New Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optics`.`New Customers` (
  `New Customers_id` INT NOT NULL,
  `First_col` VARCHAR(45) NULL,
  `Last_col` VARCHAR(45) NULL,
  `Actual Customers_col` VARCHAR(45) NULL,
  PRIMARY KEY (`New Customers_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optics`.`Glasses_has_Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optics`.`Glasses_has_Customers` (
  `Glasses_Glasses_id` INT NOT NULL AUTO_INCREMENT,
  `Customers_Customers_col` INT NULL,
  `Glasses_Glasses_id1` INT NOT NULL,
  `Glasses_Supplier_has_Glasses_Supplier_Supplier_id` INT NOT NULL,
  PRIMARY KEY (`Glasses_Glasses_id`, `Glasses_Glasses_id1`, `Glasses_Supplier_has_Glasses_Supplier_Supplier_id`),
  INDEX `fk_Glasses_has_Customers_Glasses1_idx` (`Glasses_Glasses_id1` ASC, `Glasses_Supplier_has_Glasses_Supplier_Supplier_id` ASC) VISIBLE,
  CONSTRAINT `fk_Glasses_has_Customers_Glasses1`
    FOREIGN KEY (`Glasses_Glasses_id1` , `Glasses_Supplier_has_Glasses_Supplier_Supplier_id`)
    REFERENCES `Optics`.`Glasses` (`Glasses_id` , `Supplier_has_Glasses_Supplier_Supplier_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optics`.`Actual Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optics`.`Actual Customers` (
  `Customers_id` INT NOT NULL AUTO_INCREMENT,
  `First_col` VARCHAR(45) NULL,
  `Last_col` VARCHAR(45) NULL,
  `Phone_col` VARCHAR(45) NULL,
  `email_col` VARCHAR(45) NULL,
  `Date_col` VARCHAR(45) NULL,
  `Recommendation_col` VARCHAR(45) NULL,
  `New Customers_New Customers_id` INT NOT NULL,
  `Glasses_has_Customers_Glasses_Glasses_id` INT NOT NULL,
  PRIMARY KEY (`Customers_id`, `Glasses_has_Customers_Glasses_Glasses_id`),
  INDEX `fk_Actclients_New Clients1_idx` (`New Customers_New Customers_id` ASC) VISIBLE,
  INDEX `fk_Actual Customers_Glasses_has_Customers1_idx` (`Glasses_has_Customers_Glasses_Glasses_id` ASC) VISIBLE,
  CONSTRAINT `fk_Actclients_New Clients1`
    FOREIGN KEY (`New Customers_New Customers_id`)
    REFERENCES `Optics`.`New Customers` (`New Customers_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Actual Customers_Glasses_has_Customers1`
    FOREIGN KEY (`Glasses_has_Customers_Glasses_Glasses_id`)
    REFERENCES `Optics`.`Glasses_has_Customers` (`Glasses_Glasses_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
