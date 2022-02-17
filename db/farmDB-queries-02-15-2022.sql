DROP DATABASE IF EXISTS farmdb;
###################
CREATE DATABASE farmdb;
USE farmdb;seed
##################

CREATE TABLE employee(
employee_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
last_name VARCHAR(50) NOT NULL,
first_name VARCHAR(50),
title VARCHAR(30),
superior_emp_id INT,
FOREIGN KEY (superior_emp_id) REFERENCES employee(employee_id)
);

INSERT INTO EMPLOYEE
(last_name, first_name, title)
VALUES ('Appleseed', 'Johnny', 'events manager'),
('Denver', 'John', 'biologist'),
('Kuti', 'Fela', 'operations manager'),
('Doe', 'Jane', 'chairperson');

UPDATE employee
SET superior_emp_id = 3
WHERE employee_id = 1 OR employee_id = 2;

UPDATE employee
SET superior_emp_id = 4
WHERE employee_id = 3;

SELECT * FROM employee;
####################
# Typically, the foreign key columns of the child 
# table often refer to the primary key columns of the parent table.
###################
CREATE TABLE inventory(
item_id int NOT NULL PRIMARY KEY AUTO_INCREMENT PRIMARY KEY,
item_name VARCHAR(50) NOT NULL,
item_type ENUM('Tool', 'Vehicle', 'Seed', 'Crop'),
purchasedby_ID INT,
FOREIGN KEY(purchasedby_ID)
	REFERENCES employee(employee_id)
);

INSERT INTO inventory
(item_name, item_type, purchasedby_ID)
VALUES ('trowel', 'tool', 3),
('tomato seeds', 'seed', 4),
('grape tomato', 'crop', 4),
('shovel', 'tool', 4),
('tractor', 'vehicle', 1),
('pickup truck', 'vehicle', 1),
('garden hose', 'tool', 2),
('squash seeds', 'seed', 2),
('hammer', 'tool', 3),
('seeder', 'tool', 3),
('watermelon', 'crop', 2),
('posthole digger', 'tool', 3),
('bobcat', 'vehicle', 1),
('sunflower seeds', 'seed', 2),
('drip hose', 'tool', 3),
('corn seeds', 'seed', 2);

SELECT * FROM inventory;
######################
CREATE TABLE crop(
crop_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
crop_name VARCHAR(50) NOT NULL,
species_id INT UNIQUE,
harvest_month ENUM('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'),
crop_category ENUM('Vegetable', 'Flower', 'Green', 'Herb', 'Melon')
);

INSERT INTO crop
(crop_name, species_id, harvest_month, crop_category)
VALUES ('grape tomato', 1165, 'September', 'vegetable'),
('watermelon', 7298, 'july', 'melon'),
('grape tomato', 1683, 'August', 'Vegetable'),
('squash', 4886, 'september', 'Vegetable'),
('sunflower', 4586, 'august', 'Flower'),
('corn', 6528, 'september', 'Vegetable');

SELECT * FROM crop;
####################
CREATE TABLE seed(
seed_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
seed_name VARCHAR(50) NOT NULL,
species_id INT UNIQUE,
sew_month ENUM('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'),
crop_category ENUM('Vegetable', 'Flower', 'Green', 'Herb', 'Melon'),
FOREIGN KEY(species_id)
	REFERENCES crop(species_id)
);

INSERT INTO seed
(seed_name, species_id, sew_month, crop_category)
VALUES ('grape tomato', 1683, 'June', 'Vegetable'),
('squash', 4886, 'August', 'Vegetable'),
('sunflower', 4586,  'June','Flower'),
('corn', 6528, 'July', 'Vegetable'),
('grape tomato', 1165, 'July', 'Vegetable'),
('watermelon', 7298, 'June', 'Melon');

SELECT * FROM seed;

# had to first CREATE TABLE crop() then CREATE TABLE seed() 
# b4 adding FOREIGN KEY to reference TABLE seed
# otherwise TABLE crop didn't know existence of TABLE seed
ALTER TABLE crop
ADD FOREIGN KEY(species_id)
	REFERENCES seed(species_id);
####################
CREATE TABLE vehicle(
vehicle_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
vehicle_name VARCHAR(50) NOT NULL UNIQUE,
purchase_date DATE,
vehicle_type ENUM('automobile', 'farming', 'construction'),
storage_location VARCHAR(50)
);

INSERT INTO vehicle
(vehicle_name, purchase_date, vehicle_type, storage_location)
VALUES ('tractor', '2008-11-5', 'farming', 'storage container'),
('pickup truck', '2019-06-02', 'automobile', 'parking lot'),
('bobcat', '2021-03-05', 'construction', 'storage container');

SELECT * FROM vehicle;
####################
CREATE TABLE tool(
tool_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
tool_name VARCHAR(50) NOT NULL UNIQUE,
quantity INT,
unit VARCHAR(20)
);

INSERT INTO tool
(tool_name, quantity, unit)
VALUES 
('trowel', 5, NULL),
('shovel', 8, NULL),
('garden hose', 500, 'ft'),
('hammer', 3, NULL),
('seeder', 4, NULL),
('posthole digger', 2, NULL),
('drip hose', 300, 'ft');

SELECT * FROM TOOL;
########################