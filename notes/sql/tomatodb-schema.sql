DROP DATABASE IF EXISTS tomatodb;
CREATE DATABASE tomatodb;
USE tomatodb;

CREATE TABLE `tomatodb`.`users` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL UNIQUE,
  `password` VARCHAR(45) NOT NULL,
  `create_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));
  
CREATE TABLE `tomatodb`.`plots` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT NOT NULL,
  `soil_makeup` VARCHAR(1000) NULL,
  `cultivation_style` VARCHAR(1000) NULL,
  `spaces_total` INT NOT NULL,
  `spaces_taken` INT NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `tomatodb`.`plants` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `variety_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `tomatodb`.`plots_plants` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `plot_id` BIGINT NULL,
  `plant_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `tomatodb`.`varieties` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `variety_name` VARCHAR(100) NOT NULL UNIQUE,
  `category` VARCHAR(100) NOT NULL,
  `color` VARCHAR(100) NULL,
  PRIMARY KEY (`id`));
