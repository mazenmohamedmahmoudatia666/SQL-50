-- Find the user who rated the greatest number of movies
WITH UserRatings AS (
    SELECT 
        u.name, 
        COUNT(mr.movie_id) AS total_ratings
    FROM Users u
    JOIN MovieRating mr ON u.user_id = mr.user_id
    GROUP BY u.name
),
TopUser AS (
    SELECT 
        name
    FROM UserRatings
    WHERE total_ratings = (SELECT MAX(total_ratings) FROM UserRatings)
    ORDER BY name ASC
    LIMIT 1
),

-- Find the movie with the highest average rating in February 2020
MovieAvgRating AS (
    SELECT 
        m.title, 
        AVG(mr.rating) AS avg_rating
    FROM Movies m
    JOIN MovieRating mr ON m.movie_id = mr.movie_id
    WHERE DATE_PART('year', mr.created_at) = 2020 
      AND DATE_PART('month', mr.created_at) = 2
    GROUP BY m.title
),
TopMovie AS (
    SELECT 
        title
    FROM MovieAvgRating
    WHERE avg_rating = (SELECT MAX(avg_rating) FROM MovieAvgRating)
    ORDER BY title ASC
    LIMIT 1
)

-- Combine results
SELECT name AS results FROM TopUser
UNION ALL
SELECT title AS results FROM TopMovie;
