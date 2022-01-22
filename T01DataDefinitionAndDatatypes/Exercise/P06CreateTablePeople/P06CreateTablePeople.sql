CREATE TABLE `people` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    `picture` BLOB,
    `height` DOUBLE(10, 2),
    `weight` DOUBLE(10, 2),
    `gender` CHAR(1) NOT NULL,
    `birthdate` DATE NOT NULL,
    `biography` TEXT
); 

INSERT INTO `people` (`name`, `picture`, `height`, `weight`, `gender`, `birthdate`, `biography`)
VALUES
	('Test Name 1', NULL, 174, 84, 'm', '1987-08-13', 'Information for person 1' ),
	('Test Name 2', NULL, 163, 55, 'f', '1989-04-29', 'Information for person 2' ),
	('Test Name 3', NULL, 178, 96, 'm', '2000-01-01', 'Information for person 3' ),
	('Test Name 4', NULL, 190, 82, 'm', '2008-09-13', 'Information for person 4' ),
	('Test Name 5', NULL, 200, 107, 'm', '1979-12-31', 'Information for person 5' );