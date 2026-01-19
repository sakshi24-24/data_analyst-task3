-- View tables
SELECT name FROM sqlite_master WHERE type='table';

-- Sample invoice data
SELECT * FROM Invoice LIMIT 10;

-- Filter invoices from USA
SELECT * FROM Invoice
WHERE BillingCountry = 'USA';

-- Sort invoices by total amount
SELECT * FROM Invoice
ORDER BY Total DESC;

-- Total sales by country
SELECT BillingCountry, SUM(Total) AS TotalSales
FROM Invoice
GROUP BY BillingCountry;

-- Countries with sales greater than 100
SELECT BillingCountry, SUM(Total) AS TotalSales
FROM Invoice
GROUP BY BillingCountry
HAVING SUM(Total) > 100;

-- Customer total spending
SELECT c.CustomerId,
       c.FirstName || ' ' || c.LastName AS CustomerName,
       SUM(i.Total) AS TotalSpent
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId;

-- Top 5 customers by total spend
SELECT c.CustomerId,
       c.FirstName || ' ' || c.LastName AS CustomerName,
       SUM(i.Total) AS TotalSpent
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY TotalSpent DESC
LIMIT 5;

-- Sales summary (exported to CSV)
SELECT BillingCountry, SUM(Total) AS TotalSales
FROM Invoice
GROUP BY BillingCountry
ORDER BY TotalSales DESC;
