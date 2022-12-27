/* task list
- Load data into SQL
- Total unique restarants in Banglore
- Restayrant counts per pincode
- Top 3 liked dishes per restaurant
- Find Second best restarant
- *** booking vs online order analysis ***
- additional questions below
- How many restaurants of each category (casual dining, cafe etc.)
- how many restaurants in each city regardless of the type
- list of restaurants with above 4 star rating
*/



-- - Total unique restarants in Banglore
select COUNT(distinct name) AS Unique_restaurant_count
FROM dbo.zomato

-- Restaurant counts per pincode(LOCATION here)
select location, COUNT(name) AS number_of_restaurants
FROM dbo.zomato
WHERE name IS NOT NULL  -- this is to make sure that incomplete data is not
AND location IS NOT NULL
GROUP BY location


-- - Top 3 liked dishes per restaurant
Select name, dish_liked
FROM dbo.zomato
GROUP BY name, dish_liked



-- - Find Second best restarant
SELECT name, rate
FROM zomato_bangalore_dataset.dbo.zomato
ORDER BY rate DESC
GROUP BY rate;


-- - booking vs online order analysis 

select COUNT(online_order) AS online_orders_count ,COUNT(book_table) AS book_table_count
FROM dbo.zomato
where online_order LIKE 'Yes' OR book_table LIKE 'Yes'


-- - How many restaurants of each category of casual dining. 

SELECT COUNT(rest_type) AS total_restaurants
FROM DBO.zomato
where rest_type LIKE '%Casual Dining%';




-- - how many restaurants in each city regardless of the type
SELECT listed_in_city, COUNT(*) AS number_of_restaurants
FROM zomato_bangalore_dataset.dbo.zomato
GROUP BY listed_in_city


-- - list of restaurants with above 4 star rating
SELECT name, rate
FROM zomato_bangalore_dataset.dbo.zomato
WHERE rate IS NOT NULL
ORDER BY rate DESC

/*
SELECT * 
FROM zomato_bangalore_dataset.dbo.zomato
*/





/*
Select cast(* AS nvarchar(1000)) 
FROM dbo.zomato
*/





/*
SELECT DATA_TYPE from INFORMATION_SCHEMA.COLUMNS where
table_schema = 'dbo' and table_name = 'zomato'

ALTER TABLE dbo.zomato
ALTER COLUMN name nvarchar(1000);

ALTER TABLE dbo.zomato
ALTER COLUMN location nvarchar(1000);

ALTER TABLE dbo.zomato
ALTER COLUMN online_order nvarchar(1000);

ALTER TABLE dbo.zomato
ALTER COLUMN book_table nvarchar(1000);


ALTER TABLE dbo.zomato
ALTER COLUMN dish_liked nvarchar(1000);

ALTER TABLE zomato_bangalore_dataset.dbo.zomato
ALTER COLUMN rate nvarchar(1000);

ALTER TABLE zomato_bangalore_dataset.dbo.zomato
ALTER COLUMN rest_type nvarchar(1000);



ALTER TABLE zomato_bangalore_dataset.dbo.zomato
ALTER COLUMN approx_cost_for_two_people int;

ALTER TABLE zomato_bangalore_dataset.dbo.zomato
ALTER COLUMN listed_in_city nvarchar(1000);
*/


/*
select cast (name AS nvarchar(100)) restaurant_name
FROM dbo.zomato
WHERE name IS NOT NULL
AND location IS NOT NULL
GROUP BY location




select COUNT(cast (name AS nvarchar(100))) number_of_restaurants
FROM dbo.zomato
WHERE cast (name AS nvarchar(100)) IS NOT NULL
AND cast(location AS nvarchar(300)) restaurant_location IS NOT NULL
GROUP BY cast(location AS nvarchar(300)) restaurant_location

*/
