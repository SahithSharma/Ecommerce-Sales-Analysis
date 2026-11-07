-- E-COMMERCE SALES ANALYSIS
-- STEP 1: DATA IMPORT
-- Database: ecommerce_project

-- Select database
USE ecommerce_project;

-- Check raw table
SELECT *
FROM online_retail_raw
LIMIT 10;

-- Check total imported records
SELECT COUNT(*) AS Total_Records
FROM online_retail_raw;

-- Check table structure
DESCRIBE online_retail_raw;

-- Load CSV into raw table
-- Run this only when importing the dataset for the first time.

LOAD DATA LOCAL INFILE
'C:/Coding Files/Ecommerce-Sales-Analysis/data/OnlineRetail.csv'
INTO TABLE online_retail_raw
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;