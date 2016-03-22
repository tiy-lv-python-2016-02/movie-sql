SELECT * FROM movies;

SELECT title, movieid
FROM movies
LIMIT 10;

SELECT *
FROM movies
WHERE movieid = 485;

SELECT movieid
FROM movies
WHERE title LIKE '%Made in America%';

SELECT * FROM movies
ORDER BY title LIMIT 10;

SELECT * FROM movies
WHERE title LIKE '%(2002)%';

SELECT * FROM movies
WHERE title = 'Godfather, The (1972)';

SELECT * FROM movies
WHERE genres LIKE 'Comedy' and title LIKE '%(2000)%';

SELECT m.movieid, m.title
FROM movies m
JOIN tags t ON m.movieid = t.movieid
WHERE lower(t.tag) LIKE '%death%' AND lower(m.genres) like 'comedy';

SELECT * FROM movies
WHERE (title LIKE '%(2001)%' or title LIKE '%(2002)%') and lower(title) LIKE '%super%';

SELECT m.title, r.rating
FROM movies m
JOIN ratings r ON m.movieid = r.movieid
WHERE m.movieid = 858;

SELECT m.title, r.rating
FROM movies m
JOIN ratings r ON m.movieid = r.movieid
WHERE m.movieid = 858
ORDER BY r.timestamp DESC;

SELECT movies.title, links.imdbid
FROM movies
JOIN links ON movies.movieid = links.movieid
WHERE movies.title LIKE '%(2005)%';

SELECT m.title, r.rating
FROM movies m
LEFT JOIN ratings r ON m.movieid = r.movieid
WHERE r.rating IS NULL;

SELECT m.title, avg(r.rating)
FROM movies m
JOIN ratings r on m.movieid = r.movieid
GROUP BY m.title;

SELECT m.title, count(r.rating)
FROM movies m
JOIN ratings r on m.movieid = r.movieid
GROUP BY m.title;

SELECT mg.genre_id, count(mg.genre_id)
FROM movie_genre mg
GROUP BY mg.genre_id;

SELECT r.userid, avg(r.rating)
FROM ratings r
GROUP BY r.userid;

SELECT r.userid, count(r.rating)
FROM ratings r
GROUP BY r.userid
ORDER BY count(r.rating) DESC;

SELECT r.userid, avg(r.rating)
FROM ratings r
GROUP BY r.userid
ORDER BY avg(r.rating) DESC;

SELECT r.userid, avg(r.rating), count(r.rating)
FROM ratings r
GROUP BY r.userid
HAVING count(r.rating) > 50
ORDER BY avg(r.rating) DESC;

SELECT m.title, avg(r.rating)
FROM movies m
JOIN ratings r ON m.movieid = r.movieid
GROUP BY m.title
HAVING avg(r.rating) > 4
ORDER BY avg(r.rating) DESC;

SELECT g.genre_id, count(r.rating), avg(r.rating)
From movie_genre g
JOIN ratings r ON r.movieid = g.movieid
GROUP BY g.genre_id
ORDER BY avg(r.rating) DESC;

-- Joined names with genre ids for fun.
SELECT genre.genres, count(r.rating), avg(r.rating)
From genre
JOIN movie_genre ON genre.id = movie_genre.genre_id
JOIN ratings r ON r.movieid = movie_genre.movieid
GROUP BY genre.genres
ORDER BY avg(r.rating) DESC;

SELECT concat('http://www.imdb.com/title/tt', links.imdbid)
from links;

SELECT concat('https://www.themoviedb.org/movie/', links.tmdbid)
from links;

-- Can't find The Unusuals, the following does not return anything.
SELECT * FROM movies
WHERE lower(movies.title) LIKE '%unusual%';
















