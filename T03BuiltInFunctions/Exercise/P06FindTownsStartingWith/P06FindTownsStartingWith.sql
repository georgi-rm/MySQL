SELECT 
    *
FROM
    `towns`
WHERE
    upper(left(`name`, 1)) IN ('M' , 'K', 'B', 'E')
ORDER BY `name`;