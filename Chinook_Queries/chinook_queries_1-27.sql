
-- 1. non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
select CustomerId, FirstName, LastName, Country
from Customer
where Country != "USA"
-- 46 rows returned in 1ms from: SELECT CustomerId, FirstName, LastName, Country
-- FROM  Customer
-- WHERE Country != 'USA'


-- 2. brazil_customers.sql: Provide a query only showing the Customers from Brazil.
select CustomerId, FirstName, LastName, Country 
from Customer
where Country == "Brazil"
-- 5 rows returned in 1ms from: select CustomerId, FirstName, LastName, Country
-- from Customer
-- where Country = "Brazil"


-- 3. brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
select CustomerId, FirstName, LastName, Country 
from Customer as c Invoice as i
where c.Country == "Brazil" and c.CustomerId = i.CustomerId
-- 35 rows returned in 2ms from: SELECT c.FirstName, c.LastName, i.InvoiceId, i.InvoiceDate, i.BillingCountry
-- FROM  Customer as c, Invoice as i
-- WHERE c.Country = 'Brazil' and c.CustomerId = i.CustomerId


-- 4. sales_agents.sql: Provide a query showing only the Employees who are Sales Support Agents.
SELECT EmployeeId, FirstName, LastName, Title
FROM Employee as e
WHERE e.Title = "Sales Support Agent"
-- 3 rows returned in 1ms from: SELECT EmployeeId, FirstName, LastName, Title
-- FROM Employee as e
-- WHERE e.Title = "Sales Support Agent"


-- 5. unique_invoice_countries.sql: Provide a query showing a unique/distinct list of billing countries from the Invoice table.
SELECT BillingCountry, COUNT(BillingCountry) as "Invoices per Country"
FROM Invoice
GROUP BY BillingCountry   
-- 24 rows returned in 2ms from: SELECT BillingCountry, COUNT(BillingCountry) as "Invoices per Country"
-- FROM Invoice
-- GROUP BY BillingCountry






