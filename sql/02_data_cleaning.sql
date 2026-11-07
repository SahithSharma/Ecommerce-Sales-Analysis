-- E-COMMERCE SALES ANALYSIS
-- STEP 2: DATA CLEANING
-- Database: ecommerce_project

USE ecommerce_project;

-- 1. Check raw data
SELECT *
FROM online_retail_clean
LIMIT 10;

-- 2. Convert raw data into properly typed columns
-- CustomerID empty strings are converted to NULL.

INSERT INTO ecommerce_sales (
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country
)
SELECT
    InvoiceNo,
    StockCode,
    Description,
    CAST(Quantity AS SIGNED),
    STR_TO_DATE(InvoiceDate, '%d-%m-%Y %H:%i'),
    CAST(UnitPrice AS DECIMAL(10,2)),
    CAST(NULLIF(TRIM(CustomerID), '') AS UNSIGNED),
    Country
FROM online_retail_clean;

-- 3. Create analysis-ready sales table
-- Exclude cancelled invoices, adjustments,
-- negative quantities and zero/negative prices.

CREATE TABLE ecommerce_sales_analysis AS
SELECT *
FROM ecommerce_sales
WHERE InvoiceNo NOT LIKE 'C%'
  AND InvoiceNo NOT LIKE 'A%'
  AND Quantity > 0
  AND UnitPrice > 0;

-- 4. Check cleaned records
SELECT COUNT(*) AS Cleaned_Records
FROM ecommerce_sales_analysis;

-- 5. Calculate total eligible sales revenue
SELECT
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue
FROM ecommerce_sales_analysis;