-- 1)Which 5 audiobooks have received the most ratings?
	SELECT name,sum(no_of_ratings) as total_ratings FROM audible
	WHERE no_of_ratings IS NOT NULL
	GROUP BY name
	ORDER BY 2 DESC
	LIMIT 5;
-- 2)Which authors have the highest average ratings across all their audiobooks?
	SELECT author,ROUND(Avg(rating),1) AS average_rating 
	FROM audible
	WHERE rating IS NOT NULL
	GROUP BY author
	HAVING ROUND(Avg(rating),1)=5;
-- 3)What is the total duration of all  unique audiobooks released in the year 2022?
	SELECT round(sum(duration)/60,1) as total_duration_hrs
	FROM(
	SELECT name,author,min(duration) AS duration
	FROM audible
	WHERE year(release_date)=2022
	GROUP BY name,author
	)t;
-- 4)What is the most expensive audiobook in the dataset, and who is the author?
	SELECT name,author,language,price FROM audible
	ORDER BY price DESC 
	LIMIT 1;
-- 5)How many unique audiobooks were released each year, and what is the average price for each year?
	SELECT year,count(author) as no_of_audio_books,round(avg(price),1) as average_price_INR
	FROM
	(
	SELECT DISTINCT author ,year(release_date) AS year,price 
	FROM audible
	) T
	GROUP BY year
	ORDER BY year;
-- 6)Which narrator has narrated the most audiobooks?
	SELECT narrator,count(name) as audio_books_narrated
	FROM audible
	GROUP BY narrator
	ORDER BY audio_books_narrated DESC 
	LIMIT 1;
-- 7)What percent of  audiobooks  have a rating of 4.5 or higher?
	SELECT 
	ROUND(
	(
	SELECT COUNT(DISTINCT name)FROM audible WHERE   rating>=4.5)*100/
	(SELECT COUNT(DISTINCT name) FROM audible),2) AS 
	pct_of_books_with_higher_rating;
-- 8)Which audiobook has the highest number of ratings but a relatively low star rating (less than 3.0)?
	SELECT  name,sum(no_of_ratings) AS total_ratings
	FROM audible 
	WHERE rating <3.0
	GROUP BY  name
	ORDER BY  2 DESC
	LIMIT 1;
-- 9)What are the top 3 most expensive audiobooks that are longer than 8 hours?
	SELECT name FROM
	(
	SELECT  name,min(duration),min(price)
	FROM audible
	WHERE duration>480
	group by name
	ORDER BY 3 DESC
	) t
	LIMIT 3;
-- 10)Which authors have produced more than 10 audiobooks, and what is their average rating?
	SELECT author,count(name) AS no_of_audibooks_produced,round(avg(rating),1) as average_rating
	FROM
	(
	SELECT DISTINCT author,name,rating
	FROM audible
	WHERE rating  IS NOT NULL
	) t
	GROUP BY author
	HAVING count(name)>10
	ORDER BY 2 DESC;
-- 11)Which audiobook has the longest duration, and what is its price and rating?
	SELECT name,price,rating
	FROM audible
	WHERE name=
	(
	SELECT name
	FROM audible
	GROUP BY name
	ORDER BY max(duration) DESC
	LIMIT 1
	);
-- 12)Find the  top 5 narrators who narrated the most number of audiobooks.
	SELECT narrator,count(name) AS no_of_audiobooks_narrated
	FROM audible
	GROUP BY  1
	ORDER BY  2 DESC
	LIMIT 5;
-- 13)What percentage of audiobooks have a rating of at least 4 stars?
	SELECT 
	ROUND(
	(SELECT COUNT(DISTINCT name) FROM audible WHERE rating>=4)*100/
	(SELECT COUNT(DISTINCT name) FROM audible),2) AS pct_of_audiobooks_atleast_4_stars;
-- 14)Find the percentage breakdown of audiobooks by each language
	WITH CTE AS
	(
	SELECT language,count(name) as num,max(total) AS total
	FROM
	(
	SELECT distinct name,language,
	(SELECT count(distinct name) FROM audible) AS total
	FROM audible
	)T
	GROUP BY 1
	)
	SELECT language,ROUND(num*100/total,2) as  pct_of_audiobooks 
	FROM cte
	ORDER BY 2 DESC;
-- 15)Find the top 3 most expensive audiobooks of each language?
	WITH CTE AS
	(
	SELECT language,name,price,DENSE_RANK()OVER(PARTITION BY language ORDER BY price DESC) AS rnk
	FROM
	(
	SELECT DISTINCT name,language,price 
	FROM audible
	)helper
	)
	SELECT language,name,price 
	FROM CTE 
	WHERE rnk<=3
	ORDER BY 1,3 DESC;
-- 16)What is the distribution of audiobook durations 
-- (e.g., how many fall into categories like less than 0-2 hours, 2-4 hours, 4-6 hours,6+ hours)?
	WITH CTE3 AS
	(
	WITH CTE2 AS
	(
	WITH CTE1 AS
	(
	SELECT name,round(duration/60,2) as length_hrs,count(*)over() as total 
	FROM
	(
	SELECT name,min(duration) AS duration FROM audible
	GROUP BY name,duration
	)t
	)
	SELECT 
	CASE WHEN length_hrs <2.00 THEN "0-2 hours"
	WHEN length_hrs>=2.00 AND length_hrs<4.00 THEN "2-4 hours"
	WHEN length_hrs>=4.00 AND length_hrs<6.00 THEN "4-6 hours"
	ELSE "6+ hours"
	END AS bins,total
	FROM CTE1
	)
	SELECT bins,count(bins) AS num,max(total) AS total
	FROM CTE2
	GROUP BY 1
	ORDER BY 1 
	)
	SELECT bins,ROUND(num*100/total,2) AS  pct_distribution 
	FROM CTE3;
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
    
    
    
    
    
    
    
    
