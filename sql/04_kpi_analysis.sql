```sql
-- E-COMMERCE SALES ANALYSIS
-- STEP 4: KPI ANALYSIS
-- Database: ecommerce_project

USE ecommerce_project;

-- 1. Total sales revenue
SELECT
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue
FROM ecommerce_sales_analysis;

-- 2. Total number of orders
SELECT
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM ecommerce_sales_analysis;

-- 3. Total number of customers
SELECT
    COUNT(DISTINCT CustomerID) AS Total_Customers
FROM ecommerce_sales_analysis;

-- 4. Total unique products
SELECT
    COUNT(DISTINCT StockCode) AS Unique_Products
FROM ecommerce_sales_analysis;

-- 5. Total units sold
SELECT
    SUM(Quantity) AS Total_Units_Sold
FROM ecommerce_sales_analysis;

-- 6. Average unit price
SELECT
    ROUND(AVG(UnitPrice), 2) AS Average_Unit_Price
FROM ecommerce_sales_analysis;

-- 7. Complete business KPI summary
SELECT
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    COUNT(DISTINCT CustomerID) AS Total_Customers,
    COUNT(DISTINCT StockCode) AS Unique_Products,
    SUM(Quantity) AS Total_Units_Sold,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue,
    ROUND(AVG(UnitPrice), 2) AS Average_Unit_Price
FROM ecommerce_sales_analysis;
```