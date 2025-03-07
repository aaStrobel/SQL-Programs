/*
 * Name: Module 3 Homework
 * Author: Austin Strobel
 * Date: 10/30/24
 * Description: This script is to create a list for the HR department of employee names, titles, manager names, manager titles, month and year employee was hired, and years of employee tenure.
 * Changes: 
*/

SELECT 
	CONCAT(emp.FirstName, " ", emp.LastName) AS Employee_Name,                           --Adds Employee first/last names together
	emp.title AS Employee_Title,
	CASE WHEN																			 -- Looks at EmployeeId and if it isn't null will add First/Last names together, Changes Manger name from Null to N/A
		mng.EmployeeId IS NOT NULL THEN CONCAT(mng.FirstName, " ", mng.LastName)
		ELSE 'N/A' 
	END AS Manager_Name,                                                                                     
	COALESCE (mng.Title, 'N/A') AS Manager_Title,                                        -- Changes Manager Title to N/A if Null
	STRFTIME('%Y-%m', emp.HireDate) AS Date_Hired,                                       -- Changes Hire date to YYYY-mm format
	ROUND((JULIANDAY('now') - JULIANDAY(emp.HireDate)) / 365.25) AS Tenure_In_Years      -- Calculates the tenure in years
FROM Employee emp
LEFT JOIN Employee mng 
	ON emp.ReportsTo = mng.EmployeeId;
