# Query 1
SELECT * 
FROM users
ORDER BY created_at
LIMIT 5;


# Query 2
SELECT 
    COUNT(*) AS total,
    DATE_FORMAT(created_at, '%W') AS day
FROM users
GROUP BY DATE_FORMAT(created_at, '%W')
ORDER BY COUNT(*) DESC;


# Query 3
SELECT
    users.id,
    username
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE image_url IS NULL;
 
 
# Query 4
SELECT 
    photo_id,
    COUNT(*) AS likes,
    username,
    photos.image_url
FROM likes
JOIN users
    ON likes.user_id = users.id
JOIN photos
    ON likes.photo_id = photos.id
GROUP BY photo_id
ORDER BY likes DESC
LIMIT 1;


# Query 5
SELECT (SELECT Count(*) 
        FROM   photos) / (SELECT Count(*) 
                          FROM   users) AS avg;  


# Query 6
SELECT
    tags.tag_name,
    COUNT(*) AS used
FROM tags
RIGHT JOIN photo_tags
    ON tags.id = photo_tags.tag_id
GROUP BY photo_tags.tag_id
ORDER BY used DESC
LIMIT 5;


# Query 7 
SELECT
    username,
    user_id AS user_id_of_bots
FROM likes
LEFT JOIN users
    ON likes.user_id = users.id
GROUP BY user_id
HAVING COUNT(*) = (SELECT COUNT(id) FROM photos);  