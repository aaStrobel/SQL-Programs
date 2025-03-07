/*
 * Name: Module 3 Lecture Examples
 * Author: Greg Garrett
 * Date: 10/28/24
 * Description: This script is to test my basic SQL knowledge of queries/operators, based on module 3 lectures 
 * Changes: 
*/

/*
CREATE TABLE TableA (
FoodID INTEGER,
Food VARCHAR(20)
);
-- Creates Table A with two columns
INSERT INTO TableA VALUES
(1, 'Pancakes'),
(2, 'Bacon'),
(3, 'Eggs'),
(4, 'Waffles');

CREATE TABLE TableB (
ToppingID INTEGER,
Topping VARCHAR(20)
); -- Creates Table B with two columns
INSERT INTO TableB VALUES
(3, 'Syrup'),
(4, 'Hot Sause'),
(5, 'Fruit'),
(6, 'Whipped Cream');

-- INNER JOIN
SELECT 
	a.FoodId,
	b.ToppingId
	FROM TableA a
	INNER JOIN TableB b
	ON a.FoodId = b.ToppingId;

-- LEFT JOIN
SELECT 
	a.FoodId,
	b.ToppingId
	FROM TableA a
	LEFT JOIN TableB b
	ON a.FoodId = b.ToppingId;

-- RIGHT JOIN
SELECT 
	a.FoodId,
	b.ToppingId
	FROM TableA a
	RIGHT JOIN TableB b
	ON a.FoodId = b.ToppingId;

-- FULL JOIN
SELECT 
	a.FoodId,
	b.ToppingId
	FROM TableA a
	FULL JOIN TableB b
	ON a.FoodId = b.ToppingId;

-- CROSS JOIN/Cartesean Product
SELECT 
	a.Food,
	b.Topping
	FROM TableA a
	JOIN TableB b;

SELECT * FROM TableB;
--DROP TABLE TableB;

*/

SELECT * FROM Track;

SELECT * FROM Genre;

SELECT 
	t.Name,
	g.Name 
FROM Track t
JOIN Genre g
ON t.GenreId = g.GenreId;
	
SELECT * FROM PlaylistTrack pt;

SELECT 
	pt.PlaylistId,
	pt.TrackId,
	t.Name,
	t.Composer
FROM PlaylistTrack pt
FULL JOIN Track t 
ON pt.TrackId = t.TrackId 
WHERE t.Composer = 'Kurt Cobain';

SELECT
	c.LastName,
	c.CustomerId,
	i.CustomerId,
	i.InvoiceId,
	il.InvoiceId,
	il.InvoiceLineId 
FROM Customer c 
JOIN Invoice i 
	ON c.CustomerId = i.InvoiceId 
JOIN InvoiceLine il 
	ON i.InvoiceId  = il.InvoiceLineId
ORDER BY c.LastName;

