```sql
-- E-COMMERCE SALES ANALYSIS
-- STEP 12: PROJECT SUMMARY
-- Database: ecommerce_project

USE ecommerce_project;


-- 1. Overall business performance

SELECT
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    COUNT(DISTINCT CustomerID) AS Total_Customers,
    COUNT(DISTINCT StockCode) AS Unique_Products,
    SUM(Quantity) AS Total_Units_Sold,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue,
    ROUND(AVG(UnitPrice), 2) AS Average_Unit_Price
FROM ecommerce_sales_analysis;


-- 2. Top 5 countries by revenue

SELECT
    Country,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue
FROM ecommerce_sales_analysis
GROUP BY Country
ORDER BY Total_Revenue DESC
LIMIT 5;


-- 3. Top 5 products by revenue

SELECT
    Description,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue
FROM ecommerce_sales_analysis
GROUP BY Description
ORDER BY Total_Revenue DESC
LIMIT 5;


-- 4. Monthly revenue performance

SELECT
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS Sales_Month,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Monthly_Revenue
FROM ecommerce_sales_analysis
GROUP BY DATE_FORMAT(InvoiceDate, '%Y-%m')
ORDER BY Sales_Month;


-- 5. Customer segment summary

SELECT
    Customer_Segment,
    COUNT(*) AS Total_Customers,
    ROUND(SUM(Monetary), 2) AS Segment_Revenue
FROM customer_segments
GROUP BY Customer_Segment
ORDER BY Segment_Revenue DESC;


-- 6. Final record count verification

SELECT
    COUNT(*) AS Final_Analysis_Records
FROM ecommerce_sales_analysis;
```