SELECT 
    *
FROM
    `towns`
WHERE
    upper(left(`name`, 1)) NOT IN ('R' , 'B', 'D')
ORDER BY `name`;