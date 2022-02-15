DELIMITER $$
CREATE PROCEDURE usp_withdraw_money(`account_id` INT, `money_amount` DECIMAL(19, 4))
BEGIN
START TRANSACTION;
IF(money_amount < 0 OR (SELECT
							ac.`balance`
						FROM `accounts` AS ac
                        WHERE ac.`id` = `account_id`) < `money_amount`)
THEN 
	ROLLBACK;
ELSE
	UPDATE `accounts` AS a
	SET a.`balance` = a.`balance` - `money_amount`
	WHERE a.`id` = `account_id`;
END IF;
END $$

DELIMITER ;

CALL usp_withdraw_money(1, 10);

SELECT 
    *
FROM
    `accounts` AS a
WHERE
    a.`id` = 1;