DELIMITER $$

CREATE FUNCTION ufn_get_balance(`account_id` INT )
RETURNS DECIMAL(19, 4)
DETERMINISTIC
BEGIN
	RETURN (SELECT
				ac.`balance`
			FROM `accounts` AS ac
			WHERE ac.`id` = `account_id`);
END $$

CREATE PROCEDURE usp_transfer_money(`from_account_id` INT, `to_account_id` INT, `amount` DECIMAL(19, 4))
BEGIN
DECLARE `from_account_new_balance` DECIMAL(19, 4);
DECLARE `to_account_new_balance` DECIMAL(19, 4);
START TRANSACTION;

IF(`amount` < 0 OR ufn_get_balance(`from_account_id`) IS NULL
				OR ufn_get_balance(`from_account_id`) < `amount`
                OR ufn_get_balance(`to_account_id`) IS NULL
				OR `from_account_id` = `to_account_id`)
THEN 
	ROLLBACK;
ELSE
SET `from_account_new_balance` = ufn_get_balance(`from_account_id`) - `amount`;
SET `to_account_new_balance` = ufn_get_balance(`to_account_id`) + `amount`;

	UPDATE `accounts` AS a
	SET a.`balance` = a.`balance` - `amount`
	WHERE a.`id` = `from_account_id`;
    
    UPDATE `accounts` AS a
	SET a.`balance` = a.`balance` + `amount`
	WHERE a.`id` = `to_account_id`;
    
    IF (ufn_get_balance(`from_account_id`) IS NULL
		OR ufn_get_balance(`from_account_id`) < 0
		OR ufn_get_balance(`from_account_id`) != `from_account_new_balance`
		OR ufn_get_balance(`to_account_id`) IS NULL
		OR ufn_get_balance(`to_account_id`) < 0
		OR ufn_get_balance(`to_account_id`) != `to_account_new_balance`)
	THEN
		ROLLBACK;
    END IF;
END IF;
END $$

DELIMITER ;

CALL usp_transfer_money(1, 2, 10);

SELECT ufn_get_balance(0);

SELECT 
    *
FROM
    `accounts` AS a
WHERE
    a.`id` IN (1, 2);