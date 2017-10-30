
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

-- 6. sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
SELECT i.InvoiceId, e.Title, e.FirstName, e.LastName 
FROM Employee as e, Invoice as i, Customer as c
WHERE c.SupportRepId = e.EmployeeId and i.CustomerId = c.CustomerId 
ORDER BY e.EmployeeId, i.InvoiceId  
-- 412 rows returned in 10ms from: SELECT i.InvoiceId, e.Title, e.FirstName, e.LastName
-- FROM Employee as e, Invoice as i, Customer as c
-- WHERE c.SupportRepId = e.EmployeeId and i.CustomerId = c.CustomerId
-- ORDER BY e.EmployeeId, i.InvoiceId

-- 7. invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, Country and Sales Agent name for all invoices and customers.
SELECT i.Total, c.FirstName 'Customer First Name', c.LastName 'Customer Last Name', c.Country 'Customer Country', i.BillingCountry 'Invoice Country', e.FirstName 'Employee First Name', e.LastName 'Employee Last Name', e.Title 'Employee Role' 
FROM Invoice as i, Customer as c, Employee as e 
WHERE e.Title = 'Sales Support Agent' and i.InvoiceId = c.CustomerId and e.EmployeeId = c.SupportRepId
ORDER BY c.CustomerId, i.InvoiceId
-- 59 rows returned in 1ms from: SELECT i.Total, c.FirstName 'Customer First Name', c.LastName 'Customer Last Name', c.Country 'Customer Country', i.BillingCountry 'Invoice Country', e.FirstName 'Employee First Name', e.LastName 'Employee Last Name', e.Title 'Employee Role'
-- FROM Invoice as i, Customer as c, Employee as e
-- WHERE e.Title = 'Sales Support Agent' and i.InvoiceId = c.CustomerId and e.EmployeeId = c.SupportRepId
-- ORDER BY c.CustomerId, i.InvoiceId

-- 8. total_invoices_{year}.sql: How many Invoices were there in 2009 and 2011?
SELECT i.InvoiceDate, c.FirstName, c.LastName
FROM Invoice as i, Customer as c 
WHERE InvoiceDate GLOB '2009*' or InvoiceDate GLOB '2011*'
GROUP BY i.InvoiceId, c.CustomerId
-- 9794 rows returned in 18ms from: SELECT i.InvoiceDate, c.FirstName, c.LastName
-- FROM Invoice as i, Customer as c
-- WHERE InvoiceDate GLOB '2009*' or InvoiceDate GLOB '2011*'
-- GROUP BY i.InvoiceId, c.CustomerId


-- 9. total_sales_{year}.sql: What are the respective total sales for each of those years?
SELECT i.InvoiceDate, sum(i.Total) as "Total Sales"
FROM Invoice as i
WHERE InvoiceDate GLOB '2009*' or InvoiceDate GLOB '2011*'
GROUP BY InvoiceDate GLOB '2011*'
-- This seems like a crappy way to do this, but it returned the desired result...
-- 2 rows returned in 2ms from: SELECT i.InvoiceDate, sum(i.Total) as "Total Sales"
-- FROM Invoice as i
-- WHERE InvoiceDate GLOB '2009*' or InvoiceDate GLOB '2011*'
-- GROUP BY InvoiceDate GLOB '2011*'

--10. invoice_37_line_item_count.sql: 
-- Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID # 37.
SELECT Count (*) as "Total line items for Invoice ID #37"
FROM InvoiceLine   
WHERE InvoiceLine.InvoiceID GLOB '37'


-- 11. line_items_per_invoice.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY
SELECT count(*) 
FROM InvoiceLine 
GROUP BY InvoiceId


-- 12. line_item_track.sql: Provide a query that includes the purchased track name with each invoice line item.


--13. line_item_track_artist.sql: Provide a query that includes the purchased track name AND artist name with each invoice line item.
SELECT InvoiceLine.InvoiceLineId, Track.Name, Track.Composer
FROM InvoiceLine
JOIN Track 
WHERE InvoiceLine.TrackId = Track.TrackId

-- How Eric Palmieri did this one, which is more accurate to trace the Artist name to the Track. : 
SELECT a.Name "Artist" t.Name "Track", il.*
FROM InvoiceLine as il JOIN Track as t JOIN Album as ab JOIN Artist as a 
ON il.TrackId = t.TrackId AND t.AlbumId = ab.AlbumId AND ab.ArtistId = a.ArtistId

-- 14. country_invoices.sql: Provide a query that shows the # of invoices per country. HINT: GROUP BY


-- 15. playlists_track_count.sql: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.


-- 16. tracks_no_id.sql: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.


-- 17. invoices_line_item_count.sql: Provide a query that shows all Invoices but includes the # of invoice line items.



-- 18. sales_agent_total_sales.sql: Provide a query that shows total sales made by each sales agent.


--19. top_2009_agent.sql: Which sales agent made the most in sales in 2009?
-- Hint: Use the MAX function on a subquery.
-- This is how Hiatt did this one:
SELECT FullName, TheEmployeeId, MAX(TotalSales)
FROM (SELECT
    (Employee.FirstName || ''|| Employee.LastName) AS FullName,
    Employee.EmployeeId AS TheEmployeeId,
    SUM(Invoice.Total) AS TheTotalSales 
from 
    Customer 
    LEFT JOIN Employee on Customer.SupportRepId == Employee.EmployeeId
    LEFT JOIN Invoice on Customer.CustomerId == Invoice.CostumerId  
WHERE Invoice.InvoiceDate GLOB '2009*'
GROUP BY Employee.EmployeeId)

-- 20. top_agent.sql: Which sales agent made the most in sales over all?


-- 21. sales_agent_customer_count.sql: Provide a query that shows the count of customers assigned to each sales agent.


-- 22. sales_per_country.sql: Provide a query that shows the total sales per country.


-- 23. top_country.sql: Which country's customers spent the most?


-- 24. top_2013_track.sql: Provide a query that shows the most purchased track of 2013.
SELECT t.name as "Track Name", il.Track as "Track Id", Count(il.TrackId) as "# of Times Purchased", i.InvoiceDate 
FROM InvoiceLine as il JOIN Invoice as i JOIN Track as t 
WHERE i.InvoiceDate GLOB "2013?"
AND i.InvoiceId = il.InvoiceId
AND il.TrackId = t.TrackId 
GROUP BY il.TrackId 
ORDER BY Count(il.TrackId) desc
limit 1; 

-- OR the class example from Jisie: 

SELECT trackname, MAX(tracksales) as "Track Sales"
FROM 
    (SELECT t.name as trackname, SUM(il.quantity) as tracksales
    FROM track as t
    JOIN InvoiceLine il on t.trackid = il.trackid
    JOIN invoice as i on il.invoiceid = i.invoiceid
    WHERE i.invoicedate GLOB "2013*"
GROUP BY t.name)

-- ????????????????????????????????

-- 25. top_5_tracks.sql: Provide a query that shows the top 5 most purchased tracks over all.
-- 26. top_3_artists.sql: Provide a query that shows the top 3 best selling artists.
-- 27. top_media_type.sql: Provide a query that shows the most purchased Media Type.




