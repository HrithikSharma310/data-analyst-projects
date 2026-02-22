DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    order_id TEXT,
    order_date DATE,
    year INT,
    month TEXT,
    ship_date DATE,
    customer_name TEXT,
    segment TEXT,
    region TEXT,
    category TEXT,
    sub_category TEXT,
    product_name TEXT,
    sales NUMERIC(10,2),
    quantity INT,
    discount NUMERIC,
    profit NUMERIC
);


SELECT * FROM Sales;

COPY sales
FROM 'D:/My Projects/Superstore cleaned data.csv'
DELIMITER ','
CSV HEADER
ENCODING 'LATIN1';

SELECT 
    SUM(sales) AS total_revenue,
    SUM(profit) AS total_profit
FROM sales;

SELECT region,
SUM(sales) AS revenue
FROM sales
GROUP BY region
ORDER BY region DESC;

SELECT sub_category,
SUM(profit) AS Total_Profit
FROM sales
GROUP BY sub_category
ORDER BY Total_Profit DESC	
LIMIT 5;

SELECT sub_category,
SUM(profit) AS Total_Profit
FROM sales
GROUP BY sub_category
HAVING SUM(profit) < 0;

SELECT year, month,
SUM(sales) AS revenue
FROM sales
GROUP BY month, year
ORDER BY year;




