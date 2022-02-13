DELIMITER $$

CREATE FUNCTION ufn_is_word_comprised(`set_of_letters` varchar(50), `word` varchar(50))
RETURNS BIT
DETERMINISTIC
BEGIN
	RETURN word REGEXP(concat('^[', `set_of_letters`, ']+$'));
END $$

DELIMITER ;

SELECT ufn_is_word_comprised('oistmiahf', 'Sofia');
SELECT ufn_is_word_comprised('oistmiahf', 'halves');