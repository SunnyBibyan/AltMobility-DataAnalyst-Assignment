-- 2.Customer Analysis:Explore customer ordering behavior to identify patterns such as repeat ordering, customer segmentation, and trends over time.


-- A. Total Orders per Customer
SELECT 
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(order_amount) AS total_spent,
    ROUND(AVG(order_amount), 2) AS avg_order_value
FROM customer_orders
GROUP BY customer_id
ORDER BY total_orders DESC;

-- B. Identify Repeat vs. One-Time Customers
SELECT 
    CASE 
        WHEN COUNT(order_id) = 1 THEN 'One-Time Buyer'
        WHEN COUNT(order_id) BETWEEN 2 AND 4 THEN 'Occasional Buyer'
        ELSE 'Frequent Buyer'
    END AS customer_type,
    COUNT(*) AS customer_count
FROM customer_orders
GROUP BY customer_id
ORDER BY customer_count DESC;




-- C. First-Time vs. Repeat Customers
WITH first_orders AS (
    SELECT 
        customer_id,
        MIN(order_date) AS first_order_date
    FROM customer_orders
    GROUP BY customer_id
)
SELECT 
    CASE 
        WHEN co.order_date = fo.first_order_date THEN 'First-Time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS total_orders
FROM customer_orders co
JOIN first_orders fo ON co.customer_id = fo.customer_id
GROUP BY customer_type;




-- D. Monthly Trend of New vs. Returning Customers
WITH first_orders AS (
    SELECT 
        customer_id, 
        MIN(order_date) AS first_order_date
    FROM customer_orders
    GROUP BY customer_id
),
monthly_customers AS (
    SELECT 
        co.customer_id,
        DATE_FORMAT(co.order_date, '%Y-%m') AS order_month,
        CASE 
            WHEN fo.first_order_date = co.order_date THEN 'New'
            ELSE 'Returning'
        END AS customer_type
    FROM customer_orders co
    JOIN first_orders fo ON co.customer_id = fo.customer_id
)
SELECT 
    order_month,
    customer_type,
    COUNT(DISTINCT customer_id) AS total_customers
FROM monthly_customers
GROUP BY order_month, customer_type
ORDER BY order_month, customer_type;
