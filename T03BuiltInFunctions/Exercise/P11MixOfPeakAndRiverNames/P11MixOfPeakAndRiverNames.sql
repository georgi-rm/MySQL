SELECT 
    p.`peak_name`,
    r.`river_name`,
    lower(concat(p.`peak_name`, substr(r.`river_name`, 2))) AS `mix`
FROM
    `peaks` AS p,
    `rivers` AS r
WHERE
    right(p.`peak_name`, 1) = left(r.`river_name`, 1)
ORDER BY `mix`;