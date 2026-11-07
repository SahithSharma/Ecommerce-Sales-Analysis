```sql
-- E-COMMERCE SALES ANALYSIS
-- STEP 7: TIME ANALYSIS
-- Database: ecommerce_project

USE ecommerce_project;

-- 1. Monthly revenue
SELECT
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS Sales_Month,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Monthly_Revenue
FROM ecommerce_sales_analysis
GROUP BY DATE_FORMAT(InvoiceDate, '%Y-%m')
ORDER BY Sales_Month;

-- 2. Monthly order count
SELECT
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS Sales_Month,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM ecommerce_sales_analysis
GROUP BY DATE_FORMAT(InvoiceDate, '%Y-%m')
ORDER BY Sales_Month;

-- 3. Monthly units sold
SELECT
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS Sales_Month,
    SUM(Quantity) AS Total_Units_Sold
FROM ecommerce_sales_analysis
GROUP BY DATE_FORMAT(InvoiceDate, '%Y-%m')
ORDER BY Sales_Month;

-- 4. Revenue by weekday
SELECT
    DAYNAME(InvoiceDate) AS Weekday,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM ecommerce_sales_analysis
GROUP BY DAYOFWEEK(InvoiceDate), DAYNAME(InvoiceDate)
ORDER BY DAYOFWEEK(InvoiceDate);

-- 5. Average revenue per weekday occurrence
SELECT
    Weekday,
    ROUND(AVG(Daily_Revenue), 2) AS Average_Daily_Revenue
FROM (
    SELECT
        DATE(InvoiceDate) AS Sales_Date,
        DAYNAME(InvoiceDate) AS Weekday,
        SUM(Quantity * UnitPrice) AS Daily_Revenue
    FROM ecommerce_sales_analysis
    GROUP BY DATE(InvoiceDate), DAYNAME(InvoiceDate)
) AS Daily_Sales
GROUP BY Weekday
ORDER BY AVG(Daily_Revenue) DESC;

-- 6. Year-wise revenue
SELECT
    YEAR(InvoiceDate) AS Sales_Year,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue
FROM ecommerce_sales_analysis
GROUP BY YEAR(InvoiceDate)
ORDER BY Sales_Year;
```