CREATE DATABASE DSA_KMS_PROJECT
------------IMPORT TABLE--------
SELECT *FROM   KMS_INVENTORY_PROJECT
SELECT TOP 5 * FROM KMS_INVENTORY_PROJECT;

---------------------CASE SCENARIO 1 SOLUTIONS--------------
----Q1------------------------
WITH RegionalSales AS (
    SELECT
        region,
        SUM(sales) AS total_sales,
        ROW_NUMBER() OVER (ORDER BY SUM(sales) DESC) AS rank_desc,
        ROW_NUMBER() OVER (ORDER BY SUM(sales)) AS rank_asc
    FROM 
        KMS_INVENTORY_PROJECT
    GROUP BY 
        region
)

SELECT 
    CASE 
        WHEN rank_desc <= 3 THEN 'Top 3'
        WHEN rank_asc <= 3 THEN 'Bottom 3'
    END AS ranking,
    region,
    total_sales
FROM 
    RegionalSales
WHERE 
    rank_desc <= 3 OR rank_asc <= 3
ORDER BY
    ranking DESC, total_sales DESC;
	----Q3-----------------------
	SELECT 
    SUM(sales) AS ontario_appliance_sales
FROM 
    KMS_INVENTORY_PROJECT
WHERE 
    product_sub_category = 'Appliances'
    AND region = 'Ontario';
	---------Q4---------------------
	WITH CustomerSales AS (
    SELECT
        customer_name,
        SUM(sales) AS total_spent,
        COUNT(DISTINCT order_id) AS order_count
    FROM 
        KMS_INVENTORY_PROJECT
    GROUP BY 
        customer_name
    ORDER BY 
        total_spent ASC
    OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY
)

SELECT
    customer_name,
    total_spent,
    CASE
        WHEN total_spent < 1000 THEN 'Send discount coupon + free shipping offer'
        WHEN order_count = 1 THEN 'Win-back campaign: "We miss you!"'
        ELSE 'Assign dedicated account manager'
    END AS recommendation
FROM 
    CustomerSales;

	----Q5------------------
	SELECT TOP 1
    ship_mode,
    SUM(shipping_cost) AS total_shipping_cost
FROM 
    KMS_INVENTORY_PROJECT
GROUP BY 
    ship_mode
ORDER BY 
    total_shipping_cost DESC;
	---------------------CASE SCENARIO 2 SOLUTIONS---------------
	------------Q6-----------------------------
	SELECT TOP 5
    customer_name,
    customer_segment,
    SUM(sales) AS lifetime_value,
    STRING_AGG(CONVERT(NVARCHAR(MAX), product_category), ', ') WITHIN GROUP (ORDER BY product_category) AS purchased_categories
FROM 
    KMS_INVENTORY_PROJECT
GROUP BY 
    customer_name, customer_segment
ORDER BY 
----Q7-----------------------------------
SELECT TOP 1
    customer_name,
    SUM(sales) AS total_sales,
    COUNT(DISTINCT order_id) AS order_count
FROM 
    KMS_INVENTORY_PROJECT
WHERE 
    customer_segment = 'Small Business'
GROUP BY 
    customer_name
ORDER BY 
    total_sales DESC;

	---Q8--------------------------------
	SELECT TOP 1
    customer_name,
    COUNT(DISTINCT order_id) AS order_count,
    SUM(sales) AS total_spend
FROM 
    KMS_INVENTORY_PROJECT
WHERE 
    customer_segment = 'Corporate'
    AND order_date BETWEEN '2009-01-01' AND '2012-12-31'
GROUP BY 
    customer_name
ORDER BY 
    order_count DESC;

	----Q9-------------
	SELECT TOP 1
    customer_name,
    SUM(profit) AS total_profit,
    (SUM(profit)/SUM(sales))*100 AS profit_margin
FROM 
    KMS_INVENTORY_PROJECT
WHERE 
    customer_segment = 'Consumer'
GROUP BY 
    customer_name
ORDER BY 
    total_profit DESC;

	---Q11-------------------
	
SELECT
    order_priority,
    ship_mode,
    COUNT(*) AS order_count,
    AVG(shipping_cost) AS avg_shipping_cost,
    AVG(DATEDIFF(day, order_date, ship_date)) AS avg_delivery_days,
    CASE
        WHEN order_priority = 'High' AND ship_mode = 'Express Air' THEN 'Optimal'
        WHEN order_priority = 'High' AND ship_mode = 'Delivery Truck' THEN 'Inefficient'
        WHEN order_priority = 'Low' AND ship_mode = 'Delivery Truck' THEN 'Optimal'
        ELSE 'Needs Review'
    END AS efficiency_rating
FROM 
    KMS_INVENTORY_PROJECT
GROUP BY 
    order_priority, ship_mode
ORDER BY 
    order_priority, avg_shipping_cost DESC;

-- Part 2: Percentage of optimal shipping decisions
SELECT
   (SUM(CASE 
        WHEN (order_priority = 'High' AND ship_mode = 'Express Air') OR
             (order_priority = 'Low' AND ship_mode = 'Delivery Truck')
        THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS optimal_shipping_percentage
FROM 
    KMS_INVENTORY_PROJECT