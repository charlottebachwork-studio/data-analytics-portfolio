
-- UK Online Retail Analysis Project
-- Author: Charlotte Bach
-- Software: PostgreSQL

-----------------------
-- Data Validation
-----------------------

--Row Count
SELECT COUNT(*) AS total_rows
FROM retail;

--Data Range
SELECT 
	MIN(invoicedate) AS earliest_date,
	MAX(invoicedate) AS lastest_date
FROM retail;

--Null Customer IDs
SELECT COUNT(*) AS total_null_customer_ids
FROM retail
WHERE customerid IS 

-----------------------
--Revenue Analysis
-----------------------

--Total Revenue (not including any returns made) 

SELECT
    ROUND(SUM(quantity * unitprice), 2) AS total_revenue
FROM retail
WHERE quantity > 0
  AND unitprice > 0;

-- Top 10 Products Sold

SELECT
    description,
    ROUND(SUM(quantity * unitprice), 2) AS revenue
FROM retail
WHERE quantity > 0
  AND unitprice > 0
GROUP BY description
ORDER BY revenue DESC
LIMIT 10;

