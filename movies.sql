SELECT * 
FROM movies;

SELECT *
FROM movies
LIMIT 10;

SELECT *
FROM movies m
WHERE m.movieid = 485;

SELECT movieid
FROM movies m
WHERE title = 'Made in America (1993)';

SELECT *
FROM movies
ORDER BY title
LIMIT 10;

SELECT *
FROM movies
WHERE title like '%(2002)%';

SELECT *
FROM movies
WHERE title like 'Godfather, The%';

SELECT *
FROM movies
WHERE genres like '%Comedy%';

SELECT *
FROM movies
WHERE genres like '%Comedy%' AND title like '%(200%)%';

SELECT *
FROM tags
WHERE tag like '%death';

SELECT m.title, m.genres, t.tag
FROM movies m
JOIN tags t ON m.movieid = t.movieid
WHERE genres like '%Comedy%' AND lower(tag) like '%death%';

SELECT *
FROM movies
WHERE (title like '%(2001)%' OR title like '%(2002)%') AND lower(title) like '%super%';

SELECT m.title, r.rating
FROM movies
     m
JOIN ratings r ON m.movieid = r.movieid
WHERE m.title = 'Godfather, The (1972)';

SELECT m.title, r.rating
FROM movies m
JOIN ratings r ON m.movieid = r.movieid
WHERE m.title = 'Godfather, The (1972)'
ORDER BY r.timestamp DESC;

SELECT m.title, l.imdbid
FROM movies m
JOIN links l ON m.movieid = l.movieid
WHERE m.title like '%(2005)%' AND lower(genres) like '%comedy%';

SELECT m.title, r.rating
FROM movies m
LEFT JOIN ratings r ON m.movieid = r.movieid
WHERE r.id is NULL;

SELECT m.title, avg(r.rating)
FROM movies m
JOIN ratings r ON m.movieid = r.movieid
WHERE m.movieid = 1206 AND rating > 0
GROUP BY m.movieid, m.title;

SELECT m.title, avg(r.rating), count(r.rating)
FROM movies m
JOIN ratings r ON m.movieid = r.movieid
WHERE m.movieid = 1206 AND rating > 0
GROUP BY m.movieid, m.title;

SELECT count(m.genres)
FROM movies m
WHERE m.genres like '%Horror%';

SELECT avg(r.rating)
FROM ratings r
WHERE r.userid = '666';


SELECT r.userid, count(r.rating) as Count
FROM ratings r
GROUP BY r.userid
ORDER BY Count DESC
LIMIT 1;

SELECT r.userid, avg(r.rating) as Average
FROM ratings r
GROUP BY r.userid
ORDER BY Average DESC
LIMIT 1;

SELECT r.userid, avg(r.rating) as Average, count(r.rating) as Count
FROM ratings r
JOIN movies m ON m.movieid = r.movieid
GROUP BY r.userid
HAVING count(r.rating) > 50
ORDER BY Average DESC
LIMIT 1;

select g.genre_id, avg(r.rating) as Average, count(r.rating) as Count
FROM movie_genre g
JOIN ratings r ON g.movieid = r.movieid
GROUP BY g.genre_id
ORDER BY Average DESC;


SELECT m.movieid, m.title, avg(r.rating) as Average, count(r.rating) as Count
FROM movies m
JOIN ratings r ON m.movieid = r.movieid
WHERE rating > 4
GROUP BY m.movieid
HAVING count(r.rating) > 100
ORDER BY Average DESC
LIMIT 10;




