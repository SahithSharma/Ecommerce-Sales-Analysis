```sql
-- E-COMMERCE SALES ANALYSIS
-- STEP 3: DATA VALIDATION
-- Database: ecommerce_project

USE ecommerce_project;

-- 1. Check total records after data conversion
SELECT COUNT(*) AS Total_Records
FROM ecommerce_sales;

-- 2. Check missing product descriptions
SELECT COUNT(*) AS Missing_Descriptions
FROM ecommerce_sales
WHERE Description IS NULL
   OR TRIM(Description) = '';

-- 3. Check missing customer IDs
SELECT COUNT(*) AS Missing_Customer_IDs
FROM ecommerce_sales
WHERE CustomerID IS NULL;

-- 4. Check cancelled invoices
SELECT COUNT(*) AS Cancelled_Invoices
FROM ecommerce_sales
WHERE InvoiceNo LIKE 'C%';

-- 5. Check negative quantities
SELECT COUNT(*) AS Negative_Quantities
FROM ecommerce_sales
WHERE Quantity < 0;

-- 6. Check zero and negative prices
SELECT COUNT(*) AS Zero_Prices
FROM ecommerce_sales
WHERE UnitPrice = 0;

SELECT COUNT(*) AS Negative_Prices
FROM ecommerce_sales
WHERE UnitPrice < 0;

-- 7. Check adjustment invoices
SELECT COUNT(*) AS Adjustment_Invoices
FROM ecommerce_sales
WHERE InvoiceNo LIKE 'A%';

-- 8. Check invalid or missing invoice dates
SELECT COUNT(*) AS Missing_Invoice_Dates
FROM ecommerce_sales
WHERE InvoiceDate IS NULL;

-- 9. Identify possible duplicate invoice-product combinations
SELECT
    InvoiceNo,
    StockCode,
    COUNT(*) AS Occurrences
FROM ecommerce_sales
GROUP BY InvoiceNo, StockCode
HAVING COUNT(*) > 1
ORDER BY Occurrences DESC;

-- 10. Check the final analysis-ready record count
SELECT COUNT(*) AS Analysis_Ready_Records
FROM ecommerce_sales_analysis;
```