SELECT 
    count(p.id) AS 'items_count',
    c.`name`,
    sum(p.`quantity_in_stock`) AS 'total_quantity'
FROM
    `categories` AS c
        JOIN
    `products` AS p ON c.`id` = p.`category_id`
GROUP BY c.`id`
ORDER BY `items_count` DESC , `total_quantity` ASC
LIMIT 5;