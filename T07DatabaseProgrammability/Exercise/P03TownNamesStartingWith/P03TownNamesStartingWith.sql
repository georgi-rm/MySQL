DELIMITER $$
CREATE PROCEDURE usp_get_towns_starting_with(`start_of_name` VARCHAR(50))
BEGIN
	SELECT 
		t.`name` AS 'town_name'
	FROM
		`towns` AS t
	WHERE
		t.`name` LIKE concat(`start_of_name`, '%')
	ORDER BY t.`name`;
END $$

DELIMITER ;
CALL usp_get_towns_starting_with('b');

DROP PROCEDURE usp_get_towns_starting_with;