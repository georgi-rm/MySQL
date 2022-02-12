DELIMITER $$

CREATE FUNCTION ufn_get_salary_level(`salary_of_employee` DECIMAL(19, 4))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	CASE
		WHEN `salary_of_employee` < 30000
			THEN RETURN 'Low';
		WHEN `salary_of_employee` <= 50000
			THEN RETURN 'Average';
		ELSE RETURN 'High';
    END CASE;
END $$

DELIMITER ;

SELECT 
    e.`salary`, ufn_get_salary_level(e.`salary`)
FROM
    `employees` AS e;