SELECT 
    c.`continent_code`,
    c.`currency_code`,
    count(*) AS 'currency_usage'
FROM
    `countries` AS c
GROUP BY c.`continent_code` , c.`currency_code`
HAVING `currency_usage` > 1
    AND `currency_usage` = (SELECT 
        count(*) AS 'most_used_currency'
    FROM
        `countries` AS c2
    WHERE
        c2.`continent_code` = c.`continent_code`
    GROUP BY c2.`currency_code`
    ORDER BY `most_used_currency` DESC
    LIMIT 1)
ORDER BY `continent_code` , `currency_code`;