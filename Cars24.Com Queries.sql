------Let's have a look at the entire table.....

SELECT * 
FROM cars_24_combined$


-----Calculating the total number of cars...

SELECT COUNT([Car Name])
FROM cars_24_combined$


-----Calculating the total car prices...

SELECT SUM([Price])
FROM cars_24_combined$


-----Identidying which brand of car has the highest price and number of previous owners....

SELECT TOP 1 Type, [Car Name], Price, Owner
FROM cars_24_combined$
ORDER BY Price DESC;


-----Identidying which brand of car has the lowest price...

SELECT TOp 1 Type, [Car Name], Price, Owner
FROM cars_24_combined$
ORDER BY Price ASC;


-----Top 10 most sought-after cars on the website....

SELECT TOP 10 [Car Name], 
          COUNT(*) AS Frequency
FROM cars_24_combined$
GROUP BY [Car Name]
ORDER BY Frequency DESC;


-----What is the average price of cars by year?....

SELECT AVG(Price) as Avg_car_price, Year
FROM cars_24_combined$
GROUP BY [Year]
Order by Year ASC


-----What is the number of cars that operates manually and what number is automatic as well as their percentages?...

SELECT 
   COUNT(CASE WHEN Drive = 'Manual' THEN 1 END) AS ManualCount,
   COUNT(CASE WHEN Drive = 'Automatic' THEN 1 END) AS AutomaticCount,
   (CAST(COUNT(CASE WHEN Drive = 'Manual' THEN 1 END) AS FLOAT) / COUNT(*)) * 100 AS ManualPercentage,
   (CAST(COUNT(CASE WHEN Drive = 'Automatic' THEN 1 END) AS FLOAT) / COUNT(*)) * 100 AS AutomaticPercentage
FROM 
    cars_24_combined$;

	         
--------------Calculate the number of cars by fuel type as well as their respective percentages.

	SELECT 
    Fuel,
    COUNT(*) AS TotalCars,
    ROUND((COUNT(*) * 100.0 / SUM(COUNT(*)) OVER()), 2) AS Percentage
FROM 
    cars_24_combined$
GROUP BY 
    Fuel;


----------- What is the average price of car by car by type?

	SELECT COUNT(*) AS No_of_cars,
	AVG(Price) as Avgprice_ofcars, 
	          Type
	FROM cars_24_combined$
	GROUP BY Type
	ORDER BY Type DESC;

