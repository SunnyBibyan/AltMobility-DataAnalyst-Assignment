--  4.Order Details Report:Create a comprehensive report that provides a detailed overview of order information, payment details, and key metrics.


-- A. Basic order details: order ID, date, amount, status
SELECT 
    order_id,
    order_date,
    order_amount,
    order_status
FROM customer_orders
ORDER BY order_date DESC;


-- B. Payment details: order ID, payment status, payment method, payment amount
SELECT 
     c.order_id,
     c.order_date,
     c.order_amount,
     p.payment_status,
     p.payment_method,
     p.payment_amount,  
     p.payment_date
FROM customer_orders c
JOIN payments p ON c.order_id = p.order_id
ORDER BY p.payment_date DESC;


-- C Order fulfillment: calculate the number of fulfilled vs unfulfilled orders
SELECT 
    order_status,
    COUNT(*) AS total_orders
FROM customer_orders
GROUP BY order_status
ORDER BY total_orders DESC;


-- D Detailed Order and Payment Report with Key Metrics:
SELECT 
     c.order_id,
     c.order_date,
     c.order_amount,
     c.order_status,
     p.payment_status,
     p.payment_method,
     p.payment_amount,
     p.payment_date,
     -- Average Order Value calculated across all orders
     (SELECT ROUND(AVG(order_amount), 2) FROM customer_orders) AS average_order_value,
     -- Count of fulfilled orders
     (SELECT COUNT(*) FROM customer_orders WHERE order_status = 'delivered') AS fulfilled_orders,
     -- Count of unfulfilled orders
     (SELECT COUNT(*) FROM customer_orders WHERE order_status != 'delivered') AS unfulfilled_orders
FROM customer_orders c
JOIN payments p ON c.order_id = p.order_id
ORDER BY c.order_date DESC;

