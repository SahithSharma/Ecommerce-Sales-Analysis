```sql
-- E-COMMERCE SALES ANALYSIS
-- STEP 10: ADVANCED SQL
-- Database: ecommerce_project

USE ecommerce_project;


-- 1. RANK: Rank customers based on spending

SELECT
    CustomerID,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Spending,
    RANK() OVER (
        ORDER BY SUM(Quantity * UnitPrice) DESC
    ) AS Customer_Rank
FROM ecommerce_sales_analysis
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID;


-- 2. DENSE_RANK: Rank products by revenue

SELECT
    Description,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue,
    DENSE_RANK() OVER (
        ORDER BY SUM(Quantity * UnitPrice) DESC
    ) AS Product_Rank
FROM ecommerce_sales_analysis
GROUP BY Description;


-- 3. ROW_NUMBER: Assign a unique row number

SELECT
    CustomerID,
    InvoiceNo,
    InvoiceDate,
    ROW_NUMBER() OVER (
        PARTITION BY CustomerID
        ORDER BY InvoiceDate DESC
    ) AS Row_Number
FROM ecommerce_sales_analysis
WHERE CustomerID IS NOT NULL;


-- 4. CTE: Find customers spending more than £10,000

WITH Customer_Spending AS (
    SELECT
        CustomerID,
        SUM(Quantity * UnitPrice) AS Total_Spending
    FROM ecommerce_sales_analysis
    WHERE CustomerID IS NOT NULL
    GROUP BY CustomerID
)
SELECT *
FROM Customer_Spending
WHERE Total_Spending > 10000;


-- 5. CASE WHEN: Classify customers by spending

SELECT
    CustomerID,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Spending,
    CASE
        WHEN SUM(Quantity * UnitPrice) >= 10000 THEN 'High Value'
        WHEN SUM(Quantity * UnitPrice) >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Category
FROM ecommerce_sales_analysis
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID;


-- 6. Conditional Aggregation: Count different invoice types

SELECT
    COUNT(CASE WHEN InvoiceNo LIKE 'C%' THEN 1 END)
        AS Cancelled_Invoices,
    COUNT(CASE WHEN InvoiceNo LIKE 'A%' THEN 1 END)
        AS Adjustment_Invoices
FROM ecommerce_sales;


-- 7. NULL Functions: Handle missing values

SELECT
    CustomerID,
    COALESCE(CustomerID, 0) AS Customer_ID_Display
FROM ecommerce_sales
LIMIT 20;


-- 8. Date Functions: Analyze monthly sales

SELECT
    YEAR(InvoiceDate) AS Sales_Year,
    MONTHNAME(InvoiceDate) AS Sales_Month,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Monthly_Revenue
FROM ecommerce_sales_analysis
GROUP BY
    YEAR(InvoiceDate),
    MONTH(InvoiceDate),
    MONTHNAME(InvoiceDate)
ORDER BY Sales_Year, MONTH(InvoiceDate);


-- 9. String Functions: Clean and format product names

SELECT
    UPPER(TRIM(Description)) AS Formatted_Product_Name
FROM ecommerce_sales_analysis
LIMIT 20;


-- 10. Numeric Functions: Round revenue values

SELECT
    ROUND(SUM(Quantity * UnitPrice), 2) AS Rounded_Revenue,
    CEIL(AVG(UnitPrice)) AS Rounded_Up_Price,
    FLOOR(AVG(UnitPrice)) AS Rounded_Down_Price
FROM ecommerce_sales_analysis;


-- 11. UNION ALL: Combine two customer lists

SELECT CustomerID
FROM ecommerce_sales_analysis
WHERE Country = 'Germany'
  AND CustomerID IS NOT NULL

UNION ALL

SELECT CustomerID
FROM ecommerce_sales_analysis
WHERE Country = 'France'
  AND CustomerID IS NOT NULL;


-- 12. Temporary Table: Store customer spending

CREATE TEMPORARY TABLE temp_customer_spending AS
SELECT
    CustomerID,
    SUM(Quantity * UnitPrice) AS Total_Spending
FROM ecommerce_sales_analysis
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID;


-- 13. View: Create a reusable sales summary

CREATE OR REPLACE VIEW sales_summary AS
SELECT
    Country,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue
FROM ecommerce_sales_analysis
GROUP BY Country;


-- 14. Index: Improve customer lookup performance

CREATE INDEX idx_customer_id
ON ecommerce_sales_analysis(CustomerID);


-- 15. EXPLAIN: Inspect query execution plan

EXPLAIN
SELECT
    CustomerID,
    SUM(Quantity * UnitPrice) AS Total_Spending
FROM ecommerce_sales_analysis
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID;


-- 16. Transactions: Demonstrate commit and rollback

START TRANSACTION;

SAVEPOINT before_update;

-- Example update on a test table would go here.

ROLLBACK TO SAVEPOINT before_update;

ROLLBACK;
```