DELIMITER $$

CREATE PROCEDURE usp_get_holders_full_name()
BEGIN
	SELECT 
		concat_ws(' ', ah.`first_name`, ah.`last_name`) as 'full_name'
	FROM
		`account_holders` AS ah
	ORDER BY `full_name`;
END $$

DELIMITER ;

CALL usp_get_holders_full_name();