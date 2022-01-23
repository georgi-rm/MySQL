CREATE SCHEMA `soft_uni`;
USE `soft_uni`;

CREATE TABLE `towns` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE `addresses` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `address_text` VARCHAR(200) NOT NULL,
    `town_id` INT
);

CREATE TABLE `departments` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE `employees` (
	`id`INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `middle_name`VARCHAR(50),
    `last_name` VARCHAR(50) NOT NULL,
    `job_title` VARCHAR(50) NOT NULL,
    `department_id` INT NOT NULL,
    `hire_date` DATE NOT NULL,
    `salary` DOUBLE NOT NULL,
    `address_id` INT
);

INSERT INTO `towns`
VALUES
	(1, 'Sofia'),
    (2, 'Plovdiv'),
    (3, 'Varna'),
    (4, 'Burgas');
    
INSERT INTO `departments` (`name`)
VALUES
	('Engineering'),
    ('Sales'),
    ('Marketing'),
    ('Software Development'),
    ('Quality Assurance');

INSERT INTO `employees`
VALUES
	(1, 'Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00, NULL),
	(2, 'Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00, NULL),
	(3, 'Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25, NULL),
	(4, 'Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00, NULL),
	(5, 'Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88, NULL);