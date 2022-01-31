SELECT 
    `name`,
    concat_ws('-',
            year(`start`),
            lpad(month(`start`), 2, '0'),
            lpad(day(`start`), 2, '0')) AS 'start'
FROM
    `games`
WHERE
    year(`start`) IN (2011 , 2012)
ORDER BY `games`.`start` , `name`
LIMIT 50;