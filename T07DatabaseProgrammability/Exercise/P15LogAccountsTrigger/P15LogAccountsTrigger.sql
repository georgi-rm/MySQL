CREATE TABLE `logs`(
	`log_id` INT PRIMARY KEY AUTO_INCREMENT, 
    `account_id` INT,
    `old_sum` DECIMAL(19, 4),
    `new_sum` DECIMAL(19, 4)
    );
    
DELIMITER $$
    
CREATE TRIGGER tr_log_sum_change
AFTER UPDATE
ON `accounts`
FOR EACH ROW
BEGIN
	IF(NEW.`balance` != OLD.`balance`)
	THEN
		INSERT INTO `logs` (`account_id`, `old_sum`, `new_sum` )
		VALUES(NEW.`id`, OLD.`balance`, NEW.`balance`);
	END IF;
END $$

DELIMITER ;

SELECT * FROM `logs`;