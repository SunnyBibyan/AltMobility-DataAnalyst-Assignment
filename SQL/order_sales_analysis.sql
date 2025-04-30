-- 1.Order and Sales Analysis:Analyze order status and sales data to provide insights into order fulfillment and revenue trends. Identify key metrics and trends related to order status and sales.




-- A. Order Status Distribution: Total orders by their current status
SELECT 
    order_status, 
    COUNT(*) AS total_orders
FROM 
    customer_orders
GROUP BY 
    order_status
ORDER BY 
    total_orders DESC;


-- B. Daily Order Volume and Revenue: Track day-wise performance
SELECT 
  order_date,
  COUNT(order_id) AS daily_orders,
  SUM(order_amount) AS daily_revenue
FROM customer_orders
GROUP BY order_date
ORDER BY order_date;


-- C. Monthly Revenue and Order Trends (Delivered orders only)
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    SUM(order_amount) AS total_revenue,
    COUNT(order_id) AS total_orders
FROM 
    customer_orders
WHERE 
    LOWER(order_status) = 'delivered'
GROUP BY 
    order_month
ORDER BY 
    order_month;



-- D. Average Order Value (Delivered orders)
SELECT 
    ROUND(AVG(order_amount), 2) AS average_order_value
FROM 
    customer_orders
WHERE 
    LOWER(order_status) = 'delivered';



-- E. Monthly Order Fulfillment & Revenue Summary
SELECT 
  DATE_FORMAT(order_date, '%Y-%m-01') AS month,
  COUNT(order_id) AS total_orders,
  ROUND(SUM(order_amount), 2) AS total_revenue,
  ROUND(AVG(order_amount), 2) AS average_order_value,
  COUNT(CASE WHEN LOWER(order_status) = 'delivered' THEN 1 END) AS fulfilled_orders,
  COUNT(CASE WHEN LOWER(order_status) != 'delivered' THEN 1 END) AS unfulfilled_orders,
  ROUND(
    100.0 * COUNT(CASE WHEN LOWER(order_status) = 'delivered' THEN 1 END) / COUNT(*),
    2
  ) AS fulfillment_rate_percentage
FROM customer_orders
GROUP BY month
ORDER BY month;
