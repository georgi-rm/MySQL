SELECT 
    c.`country_name` AS 'country_name',
    max(p.`elevation`) AS 'highest_peak_elevation',
    max(r.`length`) AS 'longest_river_length'
FROM
    `countries` AS c
        LEFT JOIN
    `mountains_countries` AS mc ON c.`country_code` = mc.`country_code`
        LEFT JOIN
    `peaks` AS p ON mc.`mountain_id` = p.`mountain_id`
        LEFT JOIN
    `countries_rivers` AS cr ON c.`country_code` = cr.`country_code`
        LEFT JOIN
    `rivers` AS r ON cr.`river_id` = r.`id`
GROUP BY c.`country_code`
ORDER BY `highest_peak_elevation` DESC , `longest_river_length` DESC , `country_name` ASC
LIMIT 5;
