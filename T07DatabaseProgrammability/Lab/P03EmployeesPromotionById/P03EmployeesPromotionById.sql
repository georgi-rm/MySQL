DELIMITER $$
CREATE PROCEDURE usp_raise_salary_by_id(id INT)
BEGIN
START TRANSACTION;
IF( (SELECT
		count(emp.`employee_id`)
    FROM 
		`employees` AS emp
	WHERE
		emp.`employee_id` = id ) != 1 )
THEN
	ROLLBACK;
ELSE
	UPDATE `employees` AS e
	SET 
		e.`salary` = e.`salary` * 1.05
	WHERE
		e.`employee_id` = id;
END IF;
END $$

DELIMITER ;

DROP PROCEDURE usp_raise_salary_by_id;

SELECT `employee_id`, `salary`
FROM `employees`;

CALL usp_raise_salary_by_id(17);