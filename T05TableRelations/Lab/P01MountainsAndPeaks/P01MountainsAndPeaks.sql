CREATE TABLE `mountains` (
    `id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(50)
);

CREATE TABLE `peaks` (
	`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(50),
    `mountain_id` INT NOT NULL,
    CONSTRAINT `fk_peaks_mountains`
    FOREIGN KEY (`mountain_id`)
    REFERENCES `mountains`(`id`)
);