CREATE SCHEMA `car_rental`;
USE `car_rental`;

CREATE TABLE `categories` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `category` VARCHAR(50) NOT NULL,
    `daily_rate` DOUBLE,
    `weekly_rate` DOUBLE,
    `monthly_rate` DOUBLE,
    `weekend_rate` DOUBLE
);
    
CREATE TABLE `cars` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `plate_number` VARCHAR(10) NOT NULL,
    `make` VARCHAR(50) NOT NULL,
    `model` VARCHAR(50) NOT NULL,
    `car_year` INT,
    `category_id` INT NOT NULL,
    `doors` INT,
    `picture` BLOB,
    `car_condition` TEXT,
    `available` BOOL NOT NULL
);

CREATE TABLE `employees` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `title` VARCHAR(50) NOT NULL,
    `notes` TEXT
);

CREATE TABLE `customers` (
	`id`INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `driver_licence_number` VARCHAR(10) NOT NULL,
    `full_name` VARCHAR(50) NOT NULL,
    `address` VARCHAR(200),
    `city` VARCHAR(50),
    `zip_code` INT,
    `notes` TEXT
);

CREATE TABLE `rental_orders` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`employee_id` INT NOT NULL,
	`customer_id` INT NOT NULL,
    `car_id` INT NOT NULL,
    `car_condition` TEXT,
    `tank_level` DOUBLE,
    `kilometrage_start` INT,
    `kilometrage_end` INT,
    `total_kilometrage` INT,
    `start_date` DATETIME NOT NULL,
    `end_date` DATETIME,
    `total_days` INT,
    `rate_applied` DOUBLE,
    `tax_rate` DOUBLE,
    `order_status` BOOL,
    `notes` TEXT
);

INSERT INTO `categories`
VALUES
	( 1, 'Car', 24.50, 75.23, 150.99, 30.01),
	( 2, 'SUV', 34.50, 85.23, 160.99, 40.01),
	( 3, 'Truck', 54.50, 95.23, 170.99, 60.01);
    
INSERT INTO `cars`
VALUES
	( 1, 'CB3943BA', 'PEUGEOT', '307 SW', '2006', 1, 5, NULL, 'Good', TRUE),
	( 2, 'B0934CP', 'OPEL', 'Astra', '2008', 2, 5, NULL, 'Damaged', FALSE),
	( 3, 'H3465AA', 'VOLVO', 'FMX', '2021', 3, 2, NULL, 'New', TRUE);

INSERT INTO `employees`
VALUES
	( 1, 'Ivan', 'Ivanov', 'Salesman', 'Good at selling cars'),
	( 2, 'George', 'Popov', 'Engineer', 'Repair cars'),
	( 3, 'Maria', 'Speri', 'Cashier', 'Responsible for payments');


INSERT INTO `customers`
VALUES
	(1, '6409439659', 'George Iliev', 'jk. Mladost', 'Sofia', '1729', 'Owner of big company'),
	(2, '2345903403', 'Ivan Petkov', 'jk. Dobrudjanski', 'Shumen', '9700', 'Private client'),
	(3, '6495038485', 'Diana Asenova', 'jk. Drujba', 'Sofia', '1000', 'Truck driver');
    
    
INSERT INTO `rental_orders`
VALUES
	(1, 1, 1, 1, 'Good', 52.5, 1000, 1200, 200, '2021-12-10 09:00:00', '2021-12-15 18:50:24', 5, 76.23, 20.00, FALSE, 'Client is happy' ),
	(2, 1, 2, 2, 'Broken', 72.5, 1500, 1505, 5, '2022-01-01 09:00:00', '2022-01-01 09:20:15', 1, 50.65, 15.00, FALSE, 'Client is not happy, condition of car is bad' ),
	(3, 1, 3, 3, 'Good', 52.5, 20800, 21200, 400, '2021-12-10 09:00:00', '2021-12-20 15:40:23', 10, 100.23, 20.00, TRUE, 'Client is satosfied' );
