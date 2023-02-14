/* task list
- Load data into SQL
- Total unique restarants in Banglore
- Restaurant counts by LOCATION
- liked dishes for Casual Dining Restaurants
- How many restaurants of casual dining category. 
- how many restaurants in each city regardless of the type
- list of restaurants with above 4 star rating
- list of restaurants with above 4 star rating
*/



-- - Total unique restarants in Banglore
select COUNT(distinct name) AS Unique_restaurant_count
FROM dbo.zomato


-- Restaurant counts by LOCATION
select location, COUNT(name) AS number_of_restaurants
FROM dbo.zomato
WHERE name IS NOT NULL  -- this is to make sure that incomplete data is not
AND location IS NOT NULL
GROUP BY location


-- - liked dishes for Casual Dining Restaurants
Select name, dish_liked
FROM zomato_bangalore_dataset.dbo.zomato
WHERE rest_type LIKE '%Casual Dining%'
GROUP BY name, dish_liked


-- - How many restaurants of casual dining category. 
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
