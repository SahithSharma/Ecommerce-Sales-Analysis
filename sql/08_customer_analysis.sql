```sql
-- E-COMMERCE SALES ANALYSIS
-- STEP 8: CUSTOMER ANALYSIS
-- Database: ecommerce_project

USE ecommerce_project;

-- 1. Total number of customers
SELECT
    COUNT(DISTINCT CustomerID) AS Total_Customers
FROM ecommerce_sales_analysis;

-- 2. Top 10 customers by total spending
SELECT
    CustomerID,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Spending
FROM ecommerce_sales_analysis
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Total_Spending DESC
LIMIT 10;

-- 3. Customer-wise order count
SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM ecommerce_sales_analysis
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Total_Orders DESC;

-- 4. Customer-wise total quantity purchased
SELECT
    CustomerID,
    SUM(Quantity) AS Total_Quantity
FROM ecommerce_sales_analysis
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Total_Quantity DESC;

-- 5. Customer average order value
SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Spending,
    ROUND(
        SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo),
        2
    ) AS Average_Order_Value
FROM ecommerce_sales_analysis
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Average_Order_Value DESC;

-- 6. Customer purchase frequency
SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS Purchase_Frequency
FROM ecommerce_sales_analysis
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Purchase_Frequency DESC;
```