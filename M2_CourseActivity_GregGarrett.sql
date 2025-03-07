/*
 * Name: Module 2 Course Activity
 * Author: Greg Garrett
 * Date: 10/21/24
 * Description: This script is practice writing queries based on module 2 lectures 
 * Changes: 10/21/24 Queries were created to answer assignment questions
*/

-- Question 1: How many employees are in the Employee Table? 
SELECT 
	COUNT(EmployeeId)	
FROM Employee; -- Answer is 8, since EmployeeId is a unique contraint (even if there are two employees with the same name, they will have different EmployeeIds)

-- Question 2: Write a query to show all employee information only for employees with the title Sales Support Agent? 
SELECT *	
FROM Employee
WHERE Title = 'Sales Support Agent'
LIMIT 10; -- Result displays a maximum value of 10 entries in the database that would meet the criteria of Title = 'Sales Support Agent'

-- Question 3: Use an aggregate function to count how many customers are in the customer table
SELECT 
	COUNT(CustomerId)
FROM Customer; -- Answer is 59 Customers, since CustomerId is a unique contraint/identifier (even if there are two Customers with the same name, they will have different CustomerIds)

-- Question 4: How many invoices have we had for each billing country in the invoice table?
SELECT  
	COUNT(InvoiceId),
	BillingCountry 
FROM Invoice
GROUP BY BillingCountry
ORDER BY COUNT(InvoiceId) DESC, BillingCountry ASC; -- Orders results by Largest number of invoices, followed by alphabetical Billing Country