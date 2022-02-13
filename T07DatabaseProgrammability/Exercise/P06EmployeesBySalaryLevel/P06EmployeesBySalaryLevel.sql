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

CREATE PROCEDURE usp_get_employees_by_salary_level(`salary_level` VARCHAR(20))
BEGIN
	SELECT 
		e.`first_name`, e.`last_name`
	FROM
		`employees` AS e
	WHERE
		lower(ufn_get_salary_level(`salary`)) = lower(`salary_level`)
	ORDER BY e.`first_name` DESC, e.`last_name` DESC;
END $$

DELIMITER ;

CALL usp_get_employees_by_salary_level('High');