CREATE TABLE `teachers` (
	`teacher_id` INT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `manager_id` INT,
    CONSTRAINT `fk_teacher_manager`
    FOREIGN KEY (`manager_id`)
    REFERENCES `teachers`(`teacher_id`)
);

    
INSERT INTO `teachers`
VALUES
	(101, 'John', NULL),
	(106, 'Greta', 101),
	(105, 'Mark', 101),
	(104, 'Ted', 105),
	(103, 'Silvia', 106),
	(102, 'Maya', 106);
