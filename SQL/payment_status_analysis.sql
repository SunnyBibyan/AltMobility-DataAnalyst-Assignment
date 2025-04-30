-- 3.Payment Status Analysis: Investigate payment status data to identify any potential issues or trends related to payment success and failure.


-- A. Total count of successful vs failed payments
SELECT 
    payment_status,
    COUNT(*) AS total_payments
FROM payments
GROUP BY payment_status
ORDER BY total_payments DESC;


-- B. Calculate percentage of successful payments
SELECT 
    ROUND(
      100.0 * SUM(CASE WHEN payment_status = 'completed' THEN 1 ELSE 0 END) / COUNT(*), 
      2
    ) AS success_rate_percentage
FROM payments;


-- C. Track monthly trend of successful vs failed payments
SELECT 
    DATE_FORMAT(payment_date, '%Y-%m') AS payment_month,
    payment_status,
    COUNT(*) AS total
FROM payments
GROUP BY payment_month, payment_status
ORDER BY payment_month, payment_status;

-- D. Compare success rate across payment methods 
SELECT 
    payment_method,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN LOWER(payment_status) = 'completed' THEN 1 ELSE 0 END) AS successful_transactions,
    ROUND(
      100.0 * SUM(CASE WHEN LOWER(payment_status) = 'completed' THEN 1 ELSE 0 END) / COUNT(*), 
      2
    ) AS success_rate_percentage
FROM payments
GROUP BY payment_method;
