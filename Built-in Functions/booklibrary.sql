SELECT 
    `title`
FROM
    `books`
WHERE
    SUBSTRING(`title`, 1, 3) = 'The'
ORDER BY `id`;



SELECT 
    REPLACE(`title`, 'The', '***') AS `title`
FROM
    `books`
WHERE
    SUBSTRING(`title`, 1, 3) = 'The'
ORDER BY `id`;



SELECT 
    ROUND(SUM(`cost`), 2)
FROM
    `books`;



