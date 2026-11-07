```sql
-- E-COMMERCE SALES ANALYSIS
-- STEP 11: BUSINESS INSIGHTS
-- Database: ecommerce_project

USE ecommerce_project;


-- 1. Identify the highest revenue-generating country

SELECT
    Country,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM ecommerce_sales_analysis
GROUP BY Country
ORDER BY Total_Revenue DESC
LIMIT 10;


-- 2. Identify the most valuable customers

SELECT
    CustomerID,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Spending,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM ecommerce_sales_analysis
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Total_Spending DESC
LIMIT 10;


-- 3. Compare products by revenue and quantity

SELECT
    Description,
    SUM(Quantity) AS Total_Quantity,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue
FROM ecommerce_sales_analysis
GROUP BY Description
ORDER BY Total_Revenue DESC
LIMIT 10;


-- 4. Identify the highest revenue-generating month

SELECT
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS Sales_Month,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Monthly_Revenue
FROM ecommerce_sales_analysis
GROUP BY DATE_FORMAT(InvoiceDate, '%Y-%m')
ORDER BY Monthly_Revenue DESC;


-- 5. Identify customers who may need re-engagement

SELECT
    CustomerID,
    Recency,
    Frequency,
    Monetary,
    Customer_Segment
FROM customer_segments
WHERE Customer_Segment IN ('At Risk', 'Hibernating')
ORDER BY Monetary DESC;


-- 6. Analyze customer segment revenue

SELECT
    Customer_Segment,
    COUNT(*) AS Total_Customers,
    ROUND(SUM(Monetary), 2) AS Segment_Revenue
FROM customer_segments
GROUP BY Customer_Segment
ORDER BY Segment_Revenue DESC;


-- 7. Identify countries with potential growth opportunities

SELECT
    Country,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue,
    ROUND(
        SUM(Quantity * UnitPrice) /
        COUNT(DISTINCT InvoiceNo),
        2
    ) AS Average_Order_Value
FROM ecommerce_sales_analysis
GROUP BY Country
HAVING COUNT(DISTINCT InvoiceNo) >= 50
ORDER BY Total_Revenue DESC;
```