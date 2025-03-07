/*
 * Name: Module 3 Course Activity
 * Author: Greg Garrett
 * Date: 10/30/24
 * Description: This script is practice writing Join queries based on module 3 lectures 
 * Changes: 
*/

-- Inner Join
SELECT 
	t.Name as Song_Title,
	t.Composer,
	a.Title as Album_Title,
	g.Name as Genre,
	ar.Name as Artist_Name
FROM Album a 
INNER JOIN Track t 
	ON a.AlbumId = t.AlbumId 
JOIN Genre g 
	ON t.GenreId = g.GenreId
JOIN Artist ar
	ON a.ArtistId = ar.ArtistId;

-- LEFT JOIN
SELECT  
	t.Name,
	t.AlbumId,
	t.Composer,
	mt.Name 
FROM Track t 
LEFT JOIN MediaType mt 
	ON t.MediaTypeId = mt.MediaTypeId;
	
-- RIGHT JOIN
SELECT 
	i.InvoiceDate,
	i.Total,
	i.BillingCity,
	i.BillingState, 
	i.BillingCountry,
	c.FirstName,
	c.LastName 
FROM  Invoice i 
RIGHT JOIN Customer c 
	ON i.CustomerId = c.CustomerId 
ORDER BY i.BillingCountry ASC, i.InvoiceDate DESC;

-- FULL JOIN
SELECT
	t.Name,
	pt.PlaylistId
FROM Track t 
FULL JOIN PlaylistTrack pt 
	ON t.TrackId = pt.TrackId;

