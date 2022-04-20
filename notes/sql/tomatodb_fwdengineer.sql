-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema tomatodb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tomatodb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tomatodb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `tomatodb` ;

-- -----------------------------------------------------
-- Table `tomatodb`.`varieties`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tomatodb`.`varieties` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `variety_name` VARCHAR(100) NOT NULL,
  `category` VARCHAR(100) NOT NULL,
  `color` VARCHAR(100) NULL DEFAULT NULL,
  `image_url` VARCHAR(3000) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `variety_name` (`variety_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 81
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tomatodb`.`plants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tomatodb`.`plants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `variety_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_plants_varieties_idx` (`variety_id` ASC) VISIBLE,
  CONSTRAINT `FK_plants_varieties`
    FOREIGN KEY (`variety_id`)
    REFERENCES `tomatodb`.`varieties` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tomatodb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tomatodb`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `create_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tomatodb`.`plots`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tomatodb`.`plots` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `soil_makeup` VARCHAR(1000) NULL DEFAULT NULL,
  `cultivation_style` VARCHAR(1000) NULL DEFAULT NULL,
  `spaces_total` INT NOT NULL,
  `spaces_taken` INT NOT NULL,
  `user_fullname` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_plots_user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `FK_plots_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `tomatodb`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tomatodb`.`plots_plants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tomatodb`.`plots_plants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `plot_id` INT NOT NULL,
  `plant_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_plots_plants_plot_id_idx` (`plot_id` ASC) VISIBLE,
  INDEX `FK_plots_plants_plant_id_idx` (`plant_id` ASC) VISIBLE,
  CONSTRAINT `FK_plots_plants_plant_id`
    FOREIGN KEY (`plant_id`)
    REFERENCES `tomatodb`.`plants` (`id`),
  CONSTRAINT `FK_plots_plants_plot_id`
    FOREIGN KEY (`plot_id`)
    REFERENCES `tomatodb`.`plots` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tomatodb`.`user_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tomatodb`.`user_roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `user_role` VARCHAR(45) NOT NULL,
  `create_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `FK_user_roles_user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `FK_user_roles_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `tomatodb`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 57
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
