-- -----------------------------------------------------
-- MOVIES SQL PORTFOLIO
-- Dataset : 4000+ movies from 1980 to 2001
-- Tool    : MySQL Workbench
-- Author  : Krish Rathore
-- -----------------------------------------------------

USE sub;

-- -----------------------------------------------------
-- Q1: Which movies made the most money at the box office?
-- -----------------------------------------------------

SELECT 
    name,
    genre,
    year,
    director,
    ROUND(gross / 1000000, 2) AS gross_millions
FROM movies
WHERE gross > 0
ORDER BY gross DESC
LIMIT 10;


-- -----------------------------------------------------
-- Q2: Which genre has the highest average IMDb score?
-- -----------------------------------------------------

SELECT 
    genre,
    COUNT(*)                    AS total_movies,
    ROUND(AVG(score), 2)       AS avg_score
FROM movies
GROUP BY genre
ORDER BY avg_score DESC;


-- -----------------------------------------------------
-- Q3: Which year had the most movies released?
-- -----------------------------------------------------

SELECT 
    year,
    COUNT(*)                        AS total_movies,
    ROUND(AVG(gross) / 1000000, 2) AS avg_gross_millions,
    ROUND(AVG(score), 2)           AS avg_score
FROM movies
GROUP BY year
ORDER BY total_movies DESC;


-- -----------------------------------------------------
-- Q4: What is the highest rated movie in each genre?
-- -----------------------------------------------------

SELECT 
    genre,
    name,
    year,
    director,
    score
FROM movies m1
WHERE score = (
    SELECT MAX(score)
    FROM movies m2
    WHERE m2.genre = m1.genre
)
ORDER BY genre;


-- -----------------------------------------------------
-- Q5: Which movies made more money than they cost to make?
-- -----------------------------------------------------

SELECT 
    name,
    genre,
    year,
    director,
    budget,
    gross,
    gross - budget AS profit
FROM movies
WHERE budget > 0 
    AND gross > budget
ORDER BY profit DESC
LIMIT 15;


-- -----------------------------------------------------
-- Q6: Which directors consistently made the most profitable movies?
-- -----------------------------------------------------

SELECT 
    director,
    COUNT(*)                                    AS total_movies,
    ROUND(AVG(score), 2)                       AS avg_score,
    ROUND(SUM(gross) / 1000000, 2)             AS total_gross_millions,
    ROUND(AVG(gross - budget) / 1000000, 2)   AS avg_profit_millions
FROM movies
WHERE budget > 0 
    AND gross > 0
GROUP BY director
HAVING total_movies >= 2
ORDER BY total_gross_millions DESC
LIMIT 10;


-- -----------------------------------------------------
-- Q7: Which movies had the biggest budgets but still lost money?
-- -----------------------------------------------------

SELECT 
    name,
    genre,
    year,
    director,
    budget,
    gross,
    gross - budget AS loss
FROM movies
WHERE budget > 0
    AND gross < budget
ORDER BY loss ASC
LIMIT 10;


-- -----------------------------------------------------
-- Q8: Which genre gives the best return on investment?
-- -----------------------------------------------------

SELECT 
    genre,
    COUNT(*)                                                    AS total_movies,
    ROUND(AVG(budget) / 1000000, 2)                            AS avg_budget_millions,
    ROUND(AVG(gross) / 1000000, 2)                             AS avg_gross_millions,
    ROUND(AVG(gross - budget) / 1000000, 2)                    AS avg_profit_millions,
    ROUND((AVG(gross) - AVG(budget)) / AVG(budget) * 100, 2)  AS avg_roi_percent
FROM movies
WHERE budget > 0 
    AND gross > 0
GROUP BY genre
ORDER BY avg_roi_percent DESC;


-- -----------------------------------------------------
-- Q9: How does every movie rank against others in its own genre?
-- (Window Function — RANK + CTE)
-- -----------------------------------------------------

WITH genre_rankings AS (
    SELECT 
        name,
        genre,
        year,
        director,
        score,
        RANK() OVER (PARTITION BY genre ORDER BY score DESC) AS genre_rank
    FROM movies
    WHERE score > 0
)
SELECT *
FROM genre_rankings
WHERE genre_rank <= 5
ORDER BY genre, genre_rank;


-- -----------------------------------------------------
-- Q10: Which 3 movies made the most money in each genre?
-- (Window Function — ROW_NUMBER + CTE)
-- -----------------------------------------------------

WITH genre_gross_rankings AS (
    SELECT 
        name,
        genre,
        year,
        director,
        gross,
        ROW_NUMBER() OVER (PARTITION BY genre ORDER BY gross DESC) AS gross_rank
    FROM movies
    WHERE gross > 0
)
SELECT 
    genre,
    gross_rank,
    name,
    year,
    director,
    ROUND(gross / 1000000, 2) AS gross_millions
FROM genre_gross_rankings
WHERE gross_rank <= 3
ORDER BY genre, gross_rank;
