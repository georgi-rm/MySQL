SELECT 
    concat(left(`description`, 30), '...') AS 'summary', `date`
FROM
    `photos`
WHERE
    day(`date`) = 10
ORDER BY `date` DESC; 