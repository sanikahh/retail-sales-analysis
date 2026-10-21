-- Retail Sales & Profitability Analysis
-- Database: MySQL
-- Table: superstore

-- 1. Overall sales, profit and profit margin
SELECT
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    ROUND(
        100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0),
        2
    ) AS profit_margin_percent
FROM superstore;

-- 2. Sales and profit by category
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY Category
ORDER BY total_sales DESC;

-- 3. Sales by region
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY Region
ORDER BY total_sales DESC;

-- 4. Top 10 products by sales
SELECT
    `Product Name`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;

-- 5. Monthly sales trend
SELECT
    DATE_FORMAT(`Order Date`, '%Y-%m') AS sales_month,
    ROUND(SUM(Sales), 2) AS monthly_sales
FROM superstore
GROUP BY DATE_FORMAT(`Order Date`, '%Y-%m')
ORDER BY sales_month;

-- 6. Category profitability comparison
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(
        100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0),
        2
    ) AS profit_margin_percent
FROM superstore
GROUP BY Category
ORDER BY total_profit DESC;
