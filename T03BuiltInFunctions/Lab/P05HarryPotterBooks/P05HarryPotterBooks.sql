SELECT 
    `title`
FROM
    `books`
WHERE
    substr(`title`, 1, 12) = 'Harry Potter'
ORDER BY `id`;