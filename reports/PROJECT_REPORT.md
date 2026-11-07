# E-commerce Sales Analysis Using MySQL

## 1. Project Overview

The objective of this project is to analyze an online retail dataset using MySQL to understand sales performance, customer purchasing behavior, product performance, and business trends.

The project uses SQL queries to clean data, calculate business KPIs, analyze sales patterns, identify valuable customers, and generate actionable business insights.

**Tools Used:** MySQL 8.0, SQL, Git, GitHub  
**Dataset:** UCI Online Retail Dataset  
**Project Type:** Data Analytics / SQL Portfolio Project

## 2. Dataset Description

This project uses the Online Retail Dataset provided by the UCI Machine Learning Repository.

The dataset contains transactions from a UK-based online retail store between December 2010 and December 2011.

### Dataset Details

- Original records: 541,909
- Time period: December 2010 – December 2011
- Format: CSV
- Currency: British Pound (GBP)

### Dataset Columns

| Column | Description |
|---|---|
| InvoiceNo | Unique invoice number |
| StockCode | Product identification code |
| Description | Product name |
| Quantity | Number of products purchased |
| InvoiceDate | Date and time of transaction |
| UnitPrice | Price per product |
| CustomerID | Customer identification number |
| Country | Customer's country |

## 3. Data Cleaning and Preparation

Data cleaning was performed using MySQL to improve data quality and prepare the dataset for analysis.

The following operations were performed:

1. Imported 541,909 records from the CSV file.
2. Converted text-based columns into appropriate data types.
3. Identified missing CustomerID and Description values.
4. Identified 9,288 cancelled invoices.
5. Investigated 10,624 records containing negative quantities.
6. Identified records containing zero and negative unit prices.
7. Identified adjustment transactions.
8. Identified duplicate records without automatically deleting them, as repeated transaction lines may be legitimate.

### Final Analysis Dataset

An analysis-ready table named `ecommerce_sales_analysis` was created by excluding cancelled invoices, adjustment records, negative quantities, and zero or negative unit prices.

| Metric | Result |
|---|---:|
| Original records | 541,909 |
| Cancelled invoices | 9,288 |
| Analysis-ready records | 530,099 |

The original data was preserved, and a separate table was created for analysis.

## 4. Key Performance Indicators (KPIs)

SQL queries were used to calculate important business performance indicators.

### Overall Sales Performance

| KPI | Result |
|---|---:|
| Total Sales Revenue | £10,655,622.48 |
| Total Orders | 19,959 |
| Total Customers | 4,338 |
| Unique Products | 3,810 |
| Total Units Sold | 5,588,371 |
| Average Unit Price | £3.89 |

These KPIs provide an overview of the store's overall sales performance.

## 5. Product Analysis

Product analysis was performed to identify products generating the highest revenue and products selling in the highest quantities.

### Top Products by Revenue

| Product | Revenue |
|---|---:|
| DOTCOM POSTAGE | £206,248.77 |
| REGENCY CAKESTAND 3 TIER | £174,484.74 |
| PAPER CRAFT, LITTLE BIRDIE | £168,469.60 |
| WHITE HANGING HEART T-LIGHT HOLDER | £106,292.77 |
| PARTY BUNTING | £99,504.33 |

### Top Products by Quantity

| Product | Units Sold |
|---|---:|
| PAPER CRAFT, LITTLE BIRDIE | 80,995 |
| MEDIUM CERAMIC TOP STORAGE JAR | 78,033 |
| WORLD WAR 2 GLIDERS | 55,047 |
| JUMBO BAG RED RETROSPOT | 48,474 |
| WHITE HANGING HEART T-LIGHT HOLDER | 37,891 |

### Key Observation

A product with high sales quantity does not necessarily generate the highest revenue.

For example, WORLD WAR 2 GLIDERS sold 55,047 units but generated £13,841.85 in revenue.

This demonstrates the importance of analyzing both product quantity and revenue.

## 6. Country Analysis

Country analysis was performed to understand geographical sales distribution.

### Top Countries by Revenue

| Country | Revenue |
|---|---:|
| United Kingdom | £9,014,160.02 |
| Netherlands | £285,446.34 |
| EIRE | £283,453.96 |
| Germany | £228,867.14 |
| France | £209,715.11 |

### Key Observations

- The United Kingdom contributed approximately 84.6% of total revenue.
- The Netherlands was the highest revenue-generating market outside the UK.
- Germany and France also represented important international markets.
- Country-level average order values showed differences in purchasing behaviour.

### Business Interpretation

The business depends heavily on the UK market. Maintaining customer relationships in the UK is important, while other countries may offer opportunities for growth.

## 7. Time-Based Analysis

Time-based analysis was performed to understand monthly and weekly sales patterns.

### Monthly Revenue

| Month | Revenue |
|---|---:|
| December 2010 | £823,746.14 |
| January 2011 | £691,364.56 |
| February 2011 | £523,631.89 |
| March 2011 | £717,639.36 |
| April 2011 | £537,808.62 |
| May 2011 | £770,536.02 |
| June 2011 | £761,739.90 |
| July 2011 | £719,221.19 |
| August 2011 | £748,076.32 |
| September 2011 | £1,058,590.17 |
| October 2011 | £1,154,979.30 |
| November 2011 | £1,509,496.33 |
| December 2011 | £638,792.68 |

### Key Observations

- November 2011 generated the highest monthly revenue.
- Sales increased significantly during September, October, and November.
- December 2011 contains only data up to December 9, so it is a partial month.

### Weekly Sales Analysis

Thursday generated the highest total weekday revenue.

| Weekday | Revenue |
|---|---:|
| Thursday | £2,203,161.24 |
| Tuesday | £2,178,632.61 |
| Wednesday | £1,851,147.81 |
| Friday | £1,829,278.17 |
| Monday | £1,779,575.04 |
| Sunday | £813,827.61 |

No Saturday transactions were present in the analysis dataset.

### Business Interpretation

The increase in sales towards November suggests that the business should prepare inventory and marketing campaigns ahead of the high-sales period.

## 8. Customer Analysis

Customer analysis was performed to understand purchasing behaviour and identify high-value customers.

### Top Customers by Revenue

| Customer ID | Orders | Revenue |
|---|---:|---:|
| 14646 | 73 | £280,206.02 |
| 18102 | 60 | £259,657.30 |
| 17450 | 46 | £194,550.79 |
| 16446 | 2 | £168,472.50 |
| 14911 | 201 | £143,825.06 |

### Key Observations

- Customer 14646 generated the highest revenue.
- Customer 18102 was the second-highest revenue-generating customer.
- Some customers generated substantial revenue with relatively few orders.
- Customer purchasing frequency and total spending provide different perspectives on customer value.

### Business Interpretation

High-value customers should receive appropriate retention strategies, personalized offers, and loyalty benefits to encourage repeat purchases.

## 9. RFM Analysis

RFM analysis was performed to segment customers based on their purchasing behaviour.

RFM represents:

- **Recency:** How recently a customer purchased.
- **Frequency:** How often a customer purchased.
- **Monetary:** How much money a customer spent.

The reference date used for recency calculation was December 10, 2011.

### RFM Scoring

The SQL window function `NTILE(5)` was used to divide customers into five scoring groups for Recency, Frequency, and Monetary values.

Customers were then categorized into different segments using CASE WHEN conditions.

### Customer Segments

| Segment | Customers |
|---|---:|
| Champions | 991 |
| Hibernating | 918 |
| Others | 892 |
| At Risk | 526 |
| Potential Loyalists | 522 |
| Loyal Customers | 480 |
| Recent Customers | 9 |
| **Total** | **4,338** |

### Revenue by Customer Segment

| Segment | Revenue |
|---|---:|
| Champions | £5,815,060.48 |
| Loyal Customers | £949,324.68 |
| At Risk | £766,706.74 |
| Others | £714,054.24 |
| Potential Loyalists | £443,340.11 |
| Hibernating | £216,259.39 |
| Recent Customers | £6,662.26 |

### Key Observations

- Champions generated the highest customer-attributed revenue.
- Hibernating customers represented a large group with relatively low spending.
- At Risk customers may need targeted re-engagement campaigns.
- Potential Loyalists could be encouraged to purchase more frequently.

### Business Interpretation

RFM analysis helps businesses understand customer value and develop different marketing strategies for different customer segments.

## 10. Advanced SQL Concepts Used

The project involved several SQL concepts to perform detailed analysis.

| SQL Concept | Purpose |
|---|---|
| SELECT, WHERE | Retrieve and filter records |
| GROUP BY | Group data for aggregation |
| HAVING | Filter grouped results |
| JOIN | Combine related data |
| UNION and UNION ALL | Combine query results |
| Subqueries | Perform nested queries |
| CTEs | Organize complex queries |
| CASE WHEN | Apply conditional logic |
| Window Functions | Perform ranking and analytical calculations |
| RANK, DENSE_RANK, ROW_NUMBER | Rank records |
| NTILE | Divide customers into scoring groups |
| Aggregate Functions | Calculate SUM, AVG, COUNT, MIN, MAX |
| Date Functions | Analyze time-based trends |
| String Functions | Manipulate text values |
| COALESCE and NULLIF | Handle NULL values |
| Views | Store reusable queries |
| Temporary Tables | Store intermediate results |
| Stored Procedures | Create reusable SQL routines |
| Indexes | Improve data retrieval performance |
| EXPLAIN | Examine query execution plans |
| Transactions | Demonstrate COMMIT and ROLLBACK |
| Constraints | Understand data integrity rules |

## 11. Business Insights and Recommendations

Based on the analysis, the following business insights were identified.

### 1. UK Market Concentration

The UK contributed approximately 84.6% of total revenue.

**Recommendation:** Maintain the UK customer base while exploring opportunities in other international markets.

### 2. Champion Customer Retention

The Champions segment contains 991 customers and generated approximately 65% of customer-attributed revenue.

**Recommendation:** Introduce loyalty benefits and personalized offers to retain high-value customers.

### 3. Product Performance

Some products generated high sales quantities but relatively low revenue.

**Recommendation:** Evaluate product pricing, costs, demand, and profitability before making pricing or inventory decisions.

### 4. Monthly Sales Trends

November generated the highest revenue of £1,509,496.33.

**Recommendation:** Prepare inventory and promotional campaigns ahead of the high-sales period.

### 5. At Risk and Hibernating Customers

A combined 1,444 customers were categorized as At Risk or Hibernating.

**Recommendation:** Use targeted re-engagement campaigns and personalized discounts to encourage repeat purchases.

### 6. High-Value Customers

Customers 14646 and 18102 generated the highest individual customer revenues.

**Recommendation:** Monitor high-value customer purchasing patterns and maintain strong customer relationships.

### 7. International Market Opportunities

The Netherlands, Germany, and France generated significant revenue outside the UK.

**Recommendation:** Investigate shipping expenses, customer demand, and market profitability before expanding further.

## 12. Project Conclusion

This project demonstrates how MySQL can be used to transform raw retail transaction data into meaningful business insights.

Through data cleaning, KPI calculations, product analysis, country analysis, time-based analysis, customer analysis, and RFM segmentation, the project identified important patterns in sales performance and customer purchasing behaviour.

The findings highlight the importance of customer retention, product performance evaluation, market diversification, and seasonal sales planning.

The project also provided practical experience with SQL querying, data preparation, aggregation, joins, subqueries, CTEs, window functions, and other advanced SQL concepts.

## 13. Project Structure

```text
Ecommerce-Sales-Analysis/
│
├── data/
│   └── OnlineRetail.csv
│
├── reports/
│   └── PROJECT_REPORT.md
│
├── sql/
│   ├── 01_data_import.sql
│   ├── 02_data_cleaning.sql
│   ├── 03_data_validation.sql
│   ├── 04_kpi_analysis.sql
│   ├── 05_product_analysis.sql
│   ├── 06_country_analysis.sql
│   ├── 07_time_analysis.sql
│   ├── 08_customer_analysis.sql
│   ├── 09_rfm_analysis.sql
│   ├── 10_advanced_sql.sql
│   ├── 11_business_insights.sql
│   └── 12_project_summary.sql
│
├── .gitignore
└── README.md
```

## 14. Dataset Source

UCI Machine Learning Repository:

Online Retail Dataset  
https://archive.ics.uci.edu/dataset/352/online+retail

**Project Repository:**  
https://github.com/SahithSharma/Ecommerce-Sales-Analysis