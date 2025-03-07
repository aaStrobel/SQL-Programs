SELECT * FROM Album WHERE Title LIKE '%Best of%' OR '%_Greatest Hits%';

-- Retrieves all rows and columns from the table album
SELECT * FROM Album;

-- Retrieves only specific columns for all rows
SELECT AlbumId, Title, ArtistId FROM Album;

-- Retreives only specific columns for one artist
SELECT  AlbumId, Title, ArtistId FROM Album WHERE ArtistId = 22;


SELECT * FROM Customer;

-- Customer's name, company, state, email address, USA Customers, Not Null
SELECT FirstName, LastName, Company, State, Email 
FROM Customer 
WHERE Country = 'USA' 
AND Company IS NOT NUll;

SELECT * FROM Track WHERE Composer LIKE '%Robert Plant%' OR '%Jimmy Page%';


-- Aggregate Functions
SELECT COUNT(TrackId) -- Count
FROM Track;

SELECT 
	MIN(t.UnitPrice), --Minimum Value
	MAX(t.UnitPrice), --Maximum Value
	AVG(t.UnitPrice), -- Average Value
	SUM(t.UnitPrice)  -- Sum of all the values in the column
FROM Track t;

SELECT Country 
FROM Customer
ORDER BY Country ASC; -- Selects all records in the column and orders it in ascending order

SELECT Country 
FROM Customer
GROUP BY Country;  -- Groups the countries together

SELECT 
	DISTINCT Country  --Returns distinct countries in the table
FROM Customer;


--Group by and Having Clauses
SELECT 
	COUNT(TrackId),
	Composer,
	GenreId
FROM Track
GROUP BY Composer, GenreId
HAVING COUNT(TrackId) > 10;

SELECT 
	COUNT(TrackId) AS TrackCount, -- Gives count column a name of TrackCount
	Composer,
	GenreId
FROM Track
WHERE Composer IS NOT NULL
GROUP BY Composer, GenreId
HAVING COUNT(TrackId) > 10;

SELECT * FROM Employee;

SELECT
	e.LastName,
	LENGTH (e.LastName),
	LOWER(e.LastName),
	UPPER(e.LastName),
	REPLACE(REPLACE (e.LastName, 'a',''), 'A', ''),
	REPLACE(LOWER(e.LastName), 'a', ''),
	SUBSTRING(e.LastName,1,3),
	TRIM(' trim '),
	'trim',
	e.LastName || ',' || e.FirstName as Name
FROM Employee e;

SELECT  
	e.HireDate,
	DATE(e.HireDate) AS 'Date - No Time',
	STRFTIME('%Y', e.HireDate) AS 'Hire Date Year',
	DATE(e.HireDate, '+1 Month') AS 'Probation Date',
	DATE(e.HireDate, '-1 Month') AS 'First Interviewed Date'
FROM Employee e;

SELECT e.HireDate, 
	CASE
		WHEN STRFTIME('%Y', e.HireDate) = '2002' THEN 'Senior'
		WHEN STRFTIME('%Y', e.HireDate) = '2003' THEN 'Mid-Level'
		ELSE 'Associate'
	END as 'Employee Level'
FROM Employee e; 

SELECT 
	t.Name,
	t.Composer,
	COALESCE(t.Composer,'N/A')	
FROM Track t
WHERE t.Composer LIKE '%Joe Perry%';

SELECT 
	t.Name,
	t.UnitPrice,
	ROUND(t.UnitPrice * 1.1, 2) AS NewPrice,
	ROUND(CAST(t.Milliseconds AS REAL) / 60000, 2) AS Minutes 
FROM Track t
WHERE Minutes > 10;
