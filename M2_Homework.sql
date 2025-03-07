/*
 * Name: Module 2 Homework
 * Author: Austin Strobel
 * Date: 10/21/24
 * Description: This script is to test my basic SQL knowledge of queries/operators, based on module 2 lectures 
 * Changes: 10/21/24 Queries were created to answer homework assignment questions
*/

--Q1 A Sales Manager would like to understand how the company's sales are performing.  Below are a few questions they have asked you.  Only use the Invoice table to answer these questions

--How many sales have we had?
SELECT 
	COUNT(InvoiceId),
	SUM(i.Total)
FROM Invoice i; -- Number of sales invoices = 412, Total sales revenue = 2,328.6

--How many sales have we had in the USA that were between $5 and $15?
SELECT 
	COUNT(InvoiceId)
FROM Invoice i
WHERE i.Total BETWEEN 5 AND 15; -- Number of invoiced sales ranging from $5 to $15 = 168

--How many countries have we sold to?
SELECT 
	COUNT(DISTINCT(BillingCountry))
FROM Invoice i; -- Returns the number of distinct countries that were invoiced = 24

--Have we had any customer's outside the US that have spent more than $20 on an order?
SELECT 
	COUNT(InvoiceId)
FROM Invoice i
WHERE i.BillingCountry != 'USA' AND i.Total > 20; -- Returns the number of invoices outside of the US that spent more than $20 = 3

-- Q2 Combine all of the questions above into 1 SQL statement.
SELECT
	COUNT(i.InvoiceId) AS "Number of Invoices",
	SUM(i.Total) AS "Total Sales Revenue",
	COUNT(CASE WHEN i.Total BETWEEN 5 AND 15 THEN InvoiceId END) AS "Invoices Between 5 & 15",
	COUNT(DISTINCT(BillingCountry)) AS "Distinct Countries Billed",
	COUNT(CASE WHEN i.BillingCountry != 'USA' AND i.Total > 20 THEN InvoiceId END) AS "Non-US Invoices More Than $20"
FROM Invoice i; -- Returns all the results from Q1 in one query
