

/*
Project:
Sales & Profitability Analysis

Business Problem:
Despite generating strong sales revenue, profitability remains relatively low.
This analysis aims to identify profitability drivers and uncover factors negatively affecting profit performance.

Tools:
- BigQuery SQL
- Python (Pandas, Matplotlib, Seaborn)
- Looker Studio
*/


--------------------------------- DATA UNDERSTANDING -----------------------------------

# 1. Preview Data
SELECT *
FROM `porto-495915.sales_data.sales`
LIMIT 10;

# 2. Total Rows
SELECT COUNT(*) AS total_rows
FROM `porto-495915.sales_data.sales`;

# 3. Check Date Range
SELECT
  MIN(order_date) AS start_date,
  MAX(order_date) AS end_date
FROM `porto-495915.sales_data.sales`;

# 4. Check Multiple Orders
SELECT
  order_id,
  COUNT(*) AS total
FROM `porto-495915.sales_data.sales`
GROUP BY order_id
HAVING COUNT(*) > 1;



--------------------------------- DATA QUALITY CHECK --------------------------------
# 1. Check Missing Values
SELECT
  COUNTIF(order_id IS NULL) AS null_order_id,
  COUNTIF(order_date IS NULL) AS null_order_date,
  COUNTIF(category IS NULL) AS null_category,
  COUNTIF(sales IS NULL) AS null_sales,
  COUNTIF(profit IS NULL) AS null_profit
FROM `porto-495915.sales_data.sales`;

# 2. Check Duplicate Rows
SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT TO_JSON_STRING(t)) AS unique_rows
FROM `porto-495915.sales_data.sales` t;





--------------------------------- DATA CLEANING -----------------------------------

# Create Clean View
CREATE OR REPLACE VIEW
`porto-495915.sales_data.sales_clean` AS
SELECT DISTINCT *
FROM `porto-495915.sales_data.sales`;

SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT TO_JSON_STRING(t)) AS unique_rows
FROM `porto-495915.sales_data.sales_clean` t;


--------------------------------- KPI ANALYSIS -----------------------------------

# 1. Total Sales
SELECT
  ROUND(SUM(sales), 2) AS total_sales
FROM `porto-495915.sales_data.sales_clean`

# 2. Total Profit
SELECT
  ROUND(SUM(profit), 2) AS total_profit
FROM `porto-495915.sales_data.sales_clean`

# 3. Total Margin
SELECT
  ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_percentage
FROM `porto-495915.sales_data.sales_clean`

# 4. Total Orders
SELECT
  COUNT(DISTINCT order_id) AS total_orders
FROM `porto-495915.sales_data.sales_clean`

# 5. AVG Order Value
SELECT
  ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM `porto-495915.sales_data.sales_clean`



--------------------------------- TREND ANALYSIS -----------------------------------


# 1. Monthly Sales & Profit Trend
SELECT
  FORMAT_DATE('%Y-%m', order_date) AS month,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM `porto-495915.sales_data.sales_clean`
GROUP BY month
ORDER BY month;

# 2. Yearly Performance
SELECT
  EXTRACT(YEAR FROM order_date) AS year,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM `porto-495915.sales_data.sales_clean`
GROUP BY year
ORDER BY year;



---------------------------- PRODUCT PERFORMANCE ANALYSIS -----------------------------

# 1. Profit by Category
SELECT
  category,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM `porto-495915.sales_data.sales_clean`
GROUP BY category
ORDER BY total_profit DESC;


# 2. Profit by Sub Category
SELECT
  sub_category,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM `porto-495915.sales_data.sales_clean`
GROUP BY sub_category
ORDER BY total_profit DESC;

# 3. Top 10 Most Profitable Products
SELECT
  product_name,category,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM `porto-495915.sales_data.sales_clean`
GROUP BY product_name, category
ORDER BY total_profit DESC
LIMIT 10;

# 4. Bottom 10 Products
SELECT
  product_name,category,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM `porto-495915.sales_data.sales_clean`
GROUP BY product_name,category
ORDER BY total_profit ASC
LIMIT 10;

# 5 Profit Margin by Category
SELECT
  category,
  ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_percentage
FROM `porto-495915.sales_data.sales_clean`
GROUP BY category
ORDER BY profit_margin_percentage DESC;




------------------------ DISCOUNT IMPACT ANALYSIS --------------------------

# 1. AVG Profit by Discount Level
SELECT
  discount,
  ROUND(AVG(profit), 2) AS avg_profit,
  ROUND(SUM(sales), 2) AS total_sales
FROM `porto-495915.sales_data.sales_clean`
GROUP BY discount
ORDER BY discount;

# 2. Total Profit by Discount Level
SELECT
  discount,
  ROUND(SUM(profit), 2) AS total_profit,
  COUNT(*) AS total_transactions
FROM `porto-495915.sales_data.sales_clean`
GROUP BY discount
ORDER BY discount;

# 3. Category Most Affected by Discount
SELECT
  category,
  ROUND(AVG(discount) * 100, 2) AS avg_discount_percentage,
  ROUND(SUM(profit), 2) AS total_profit
FROM `porto-495915.sales_data.sales_clean`
GROUP BY category
ORDER BY avg_discount_percentage DESC;






----------------------- REGIONAL PERFORMANCE ANALYSIS ------------------------

# 1. Sales and Profit by Region 
SELECT
  region,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM `porto-495915.sales_data.sales_clean`
GROUP BY region
ORDER BY total_profit DESC;

# 2. Profit Margin by Region
SELECT
  region,
  ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_percentage
FROM `porto-495915.sales_data.sales_clean`
GROUP BY region
ORDER BY profit_margin_percentage DESC;


# 3. Sales and Profit by State
SELECT
  state,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM `porto-495915.sales_data.sales_clean`
GROUP BY state
ORDER BY total_profit DESC;








