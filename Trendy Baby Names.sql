-- Code to view the data in baby_names
SELECT *
FROM baby_names
LIMIT 5;

-- Q1
-- List the overall top five names in alphabetical order and find out if each name is "Classic" or "Trendy."

SELECT first_name, SUM(num) AS sum,
       CASE WHEN COUNT(DISTINCT year) >= 50 THEN 'Classic'
	        ELSE 'Trendy'
		END AS popularity_type
FROM baby_names
GROUP BY first_name
ORDER BY first_name ASC 
LIMIT 5; 

-- Q2
-- What were the top 20 male names overall, and how did the name Paul rank?

SELECT first_name, SUM(num) AS sum,
       RANK()OVER(ORDER BY SUM(num) DESC) AS name_rank 

FROM baby_names 
WHERE sex = 'M'
GROUP BY first_name
ORDER BY name_rank ASC 
lIMIT 20;


-- Q3
-- Which female names appeared in both 1920 and 2020?

SELECT first_name, SUM(num) AS total_occurrences
FROM baby_names 
WHERE sex = 'F' 
  AND year in (1920, 2020) 
GROUP BY first_name
HAVING COUNT(DISTINCT year) = 2;