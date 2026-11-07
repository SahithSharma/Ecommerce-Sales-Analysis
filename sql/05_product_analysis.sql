```sql
-- E-COMMERCE SALES ANALYSIS
-- STEP 5: PRODUCT ANALYSIS
-- Database: ecommerce_project

USE ecommerce_project;

-- 1. Top 10 products by revenue
SELECT
    Description,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue
FROM ecommerce_sales_analysis
GROUP BY Description
ORDER BY Total_Revenue DESC
LIMIT 10;

-- 2. Top 10 products by quantity sold
SELECT
    Description,
    SUM(Quantity) AS Total_Quantity
FROM ecommerce_sales_analysis
GROUP BY Description
ORDER BY Total_Quantity DESC
LIMIT 10;

-- 3. Product-wise revenue and quantity
SELECT
    Description,
    SUM(Quantity) AS Total_Quantity,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue
FROM ecommerce_sales_analysis
GROUP BY Description
ORDER BY Total_Revenue DESC;

-- 4. Average selling price of each product
SELECT
    Description,
    ROUND(AVG(UnitPrice), 2) AS Average_Unit_Price
FROM ecommerce_sales_analysis
GROUP BY Description
ORDER BY Average_Unit_Price DESC;

-- 5. Number of unique products sold
SELECT
    COUNT(DISTINCT StockCode) AS Unique_Products
FROM ecommerce_sales_analysis;
```