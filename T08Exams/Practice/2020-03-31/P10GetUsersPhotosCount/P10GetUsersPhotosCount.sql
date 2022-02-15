DELIMITER $$

CREATE FUNCTION udf_users_photos_count(username VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN
RETURN (SELECT 
    count(*)
FROM
    `users` AS u
        JOIN
    `users_photos` AS up ON u.`id` = up.`user_id`
WHERE
    u.`username` = username);
END $$

DELIMITER ;

SELECT udf_users_photos_count('ssantryds') AS photosCount;
SELECT udf_users_photos_count('ssantryd') AS photosCount;