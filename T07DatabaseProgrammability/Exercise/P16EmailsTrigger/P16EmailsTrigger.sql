CREATE TABLE `logs`(
	`log_id` INT PRIMARY KEY AUTO_INCREMENT, 
    `account_id` INT,
    `old_sum` DECIMAL(19, 4),
    `new_sum` DECIMAL(19, 4)
    );

CREATE TABLE `notification_emails`(
	`id` INT PRIMARY KEY AUTO_INCREMENT, 
    `recipient` INT,
    `subject` VARCHAR(100),
    `body` TEXT
    );
    
DELIMITER $$
    
CREATE TRIGGER `tr_log_sum_change`
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
    
CREATE TRIGGER `tr_notification_emails`
AFTER INSERT
ON `logs`
FOR EACH ROW
BEGIN
	INSERT INTO `notification_emails` (`recipient`, `subject`, `body` )
	VALUES(NEW.`account_id`,
        concat('Balance change for account: ', NEW.`account_id`), 
        concat('On ', date_format(now(), '%b %d %Y at %r'),
			' your balance was changed from ',
			round(NEW.`old_sum`, 2),
			' to ',
			round(NEW.`new_sum`, 2),
			'.'));
END $$

DELIMITER ;

SELECT * FROM `notification_emails`;