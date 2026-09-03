-- ============================================================
-- E-Commerce Sales & Customer Analytics
-- File: 03_analysis_queries.sql
-- Database: Microsoft SQL Server
-- ============================================================


-- ============================================================
-- 1. BASIC DATA CHECKS
-- ============================================================

-- View customers
SELECT * FROM customers;

-- View products
SELECT * FROM products;

-- View sales
SELECT * FROM sales;

-- View payments
SELECT * FROM payments;

-- View advances
SELECT * FROM advances;


-- ============================================================
-- 2. PROJECT KPIs
-- ============================================================

-- Total customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- Total orders
SELECT COUNT(*) AS total_orders
FROM sales;

-- Gross revenue
SELECT SUM(total_amount) AS total_revenue
FROM sales;

-- Average Order Value
SELECT AVG(total_amount) AS average_order_value
FROM sales;

-- Return rate
SELECT
    CAST(
        100.0 * SUM(CASE WHEN order_status = 'Returned' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS return_rate_percentage
FROM sales;


-- ============================================================
-- 3. CUSTOMER ANALYSIS
-- ============================================================

-- Customer order count
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(s.order_id) AS order_count
FROM customers c
LEFT JOIN sales s
    ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY order_count DESC;

-- Top customer by number of orders
SELECT TOP 1
    c.customer_name,
    COUNT(s.order_id) AS order_count
FROM customers c
INNER JOIN sales s
    ON c.customer_id = s.customer_id
GROUP BY c.customer_name
ORDER BY order_count DESC;

-- Revenue by customer
SELECT
    c.customer_id,
    c.customer_name,
    SUM(s.total_amount) AS customer_revenue
FROM customers c
INNER JOIN sales s
    ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY customer_revenue DESC;

-- Customers with more than one order
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(s.order_id) AS order_count
FROM customers c
INNER JOIN sales s
    ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(s.order_id) > 1
ORDER BY order_count DESC;

-- Customer segmentation using CASE
SELECT
    c.customer_id,
    c.customer_name,
    SUM(s.total_amount) AS total_spend,
    CASE
        WHEN SUM(s.total_amount) >= 10000 THEN 'High Value'
        WHEN SUM(s.total_amount) >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customers c
INNER JOIN sales s
    ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spend DESC;


-- ============================================================
-- 4. PRODUCT ANALYSIS
-- ============================================================

-- Product count by category
SELECT
    category,
    COUNT(product_id) AS product_count
FROM products
GROUP BY category
HAVING COUNT(product_id) > 1
ORDER BY product_count DESC;

-- Average price by category
SELECT
    category,
    AVG(unit_price) AS average_price
FROM products
GROUP BY category
ORDER BY average_price DESC;

-- Product sales performance
SELECT
    p.product_id,
    p.product_name,
    p.category,
    COUNT(s.order_id) AS order_count,
    SUM(s.quantity) AS total_quantity_sold,
    SUM(s.total_amount) AS total_revenue
FROM products p
LEFT JOIN sales s
    ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_revenue DESC;

-- Best-selling product by quantity
SELECT TOP 1
    p.product_name,
    SUM(s.quantity) AS total_quantity_sold
FROM products p
INNER JOIN sales s
    ON p.product_id = s.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC;


-- ============================================================
-- 5. CATEGORY ANALYSIS
-- ============================================================

SELECT
    p.category,
    COUNT(s.order_id) AS order_count,
    SUM(s.quantity) AS units_sold,
    SUM(s.total_amount) AS category_revenue
FROM products p
INNER JOIN sales s
    ON p.product_id = s.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;


-- ============================================================
-- 6. SALES / ORDER STATUS ANALYSIS
-- ============================================================

-- Orders by status
SELECT
    order_status,
    COUNT(*) AS order_count
FROM sales
GROUP BY order_status
ORDER BY order_count DESC;

-- Revenue by order status
SELECT
    order_status,
    COUNT(*) AS order_count,
    SUM(total_amount) AS revenue
FROM sales
GROUP BY order_status
ORDER BY revenue DESC;

-- Returned orders
SELECT
    s.order_id,
    c.customer_name,
    p.product_name,
    p.category,
    s.quantity,
    s.total_amount,
    s.order_date
FROM sales s
INNER JOIN customers c
    ON s.customer_id = c.customer_id
INNER JOIN products p
    ON s.product_id = p.product_id
WHERE order_status = 'Returned'
ORDER BY order_date;


-- ============================================================
-- 7. PAYMENT ANALYSIS
-- ============================================================

-- Payment method usage
SELECT
    payment_method,
    COUNT(*) AS payment_count,
    SUM(payment_amount) AS total_payment_amount
FROM payments
GROUP BY payment_method
ORDER BY total_payment_amount DESC;

-- Payment status analysis
SELECT
    payment_status,
    COUNT(*) AS payment_count,
    SUM(payment_amount) AS amount
FROM payments
GROUP BY payment_status
ORDER BY amount DESC;


-- ============================================================
-- 8. ADVANCE PAYMENT ANALYSIS
-- ============================================================

-- Total advance amount
SELECT
    SUM(advance_amount) AS total_advance_amount
FROM advances;

-- Advance status analysis
SELECT
    advance_status,
    COUNT(*) AS advance_count,
    SUM(advance_amount) AS total_advance_amount
FROM advances
GROUP BY advance_status
ORDER BY total_advance_amount DESC;


-- ============================================================
-- 9. JOIN ANALYSIS
-- ============================================================

-- Complete order/customer/product view
SELECT
    s.order_id,
    c.customer_name,
    c.city,
    p.product_name,
    p.category,
    s.quantity,
    s.total_amount,
    s.order_status
FROM sales s
INNER JOIN customers c
    ON s.customer_id = c.customer_id
INNER JOIN products p
    ON s.product_id = p.product_id
ORDER BY s.order_id;

-- Orders with payment details
SELECT
    s.order_id,
    c.customer_name,
    s.total_amount,
    pay.payment_method,
    pay.payment_status,
    pay.payment_amount
FROM sales s
INNER JOIN customers c
    ON s.customer_id = c.customer_id
INNER JOIN payments pay
    ON s.order_id = pay.order_id
ORDER BY s.order_id;


-- ============================================================
-- 10. CITY-WISE ANALYSIS
-- ============================================================

SELECT
    c.city,
    COUNT(DISTINCT c.customer_id) AS customer_count,
    COUNT(s.order_id) AS order_count,
    SUM(s.total_amount) AS revenue
FROM customers c
LEFT JOIN sales s
    ON c.customer_id = s.customer_id
GROUP BY c.city
ORDER BY revenue DESC;


-- ============================================================
-- 11. MONTHLY SALES ANALYSIS
-- ============================================================

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    COUNT(*) AS order_count,
    SUM(total_amount) AS monthly_revenue
FROM sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY order_year, order_month;


-- ============================================================
-- 12. CTE ANALYSIS
-- ============================================================

-- Customers whose spending is above the average customer spend
WITH CustomerSpend AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(s.total_amount) AS total_spend
    FROM customers c
    INNER JOIN sales s
        ON c.customer_id = s.customer_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_id,
    customer_name,
    total_spend
FROM CustomerSpend
WHERE total_spend > (
    SELECT AVG(total_spend)
    FROM CustomerSpend
)
ORDER BY total_spend DESC;


-- ============================================================
-- 13. WINDOW FUNCTIONS
-- ============================================================

-- Rank customers by revenue
SELECT
    c.customer_id,
    c.customer_name,
    SUM(s.total_amount) AS total_revenue,
    RANK() OVER (ORDER BY SUM(s.total_amount) DESC) AS revenue_rank
FROM customers c
INNER JOIN sales s
    ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY revenue_rank;

-- Row number for each customer's orders
SELECT
    customer_id,
    order_id,
    order_date,
    total_amount,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS customer_order_number
FROM sales
ORDER BY customer_id, order_date;

-- Running total of sales
SELECT
    order_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        ORDER BY order_date, order_id
    ) AS running_revenue
FROM sales
ORDER BY order_date, order_id;

-- Previous order amount using LAG
SELECT
    order_id,
    customer_id,
    order_date,
    total_amount,
    LAG(total_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_order_amount
FROM sales
ORDER BY customer_id, order_date;

-- Order Value Change Analysis
SELECT
    order_id,
    customer_id,
    order_date,
    total_amount,
    LAG(total_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_order_amount,
    total_amount -
    LAG(total_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS order_value_change
FROM sales
ORDER BY customer_id, order_date;

-- Next order amount using LEAD
SELECT
    order_id,
    customer_id,
    order_date,
    total_amount,
    LEAD(total_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS next_order_amount
FROM sales
ORDER BY customer_id, order_date;


-- ============================================================
-- 14. BUSINESS ANALYSIS QUESTIONS
-- ============================================================

-- 1. Which city generates the highest revenue?
SELECT TOP 1
    c.city,
    SUM(s.total_amount) AS revenue
FROM customers c
INNER JOIN sales s
    ON c.customer_id = s.customer_id
GROUP BY c.city
ORDER BY revenue DESC;

-- 2. Which category generates the highest revenue?
SELECT TOP 1
    p.category,
    SUM(s.total_amount) AS revenue
FROM products p
INNER JOIN sales s
    ON p.product_id = s.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- 3. Which customers have never placed an order?
SELECT
    c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN sales s
    ON c.customer_id = s.customer_id
WHERE s.order_id IS NULL;

-- 4. What percentage of orders are returned?
SELECT
    CAST(
        100.0 * SUM(CASE WHEN order_status = 'Returned' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS return_percentage
FROM sales;

-- 5. Which payment method is most frequently used?
SELECT TOP 1
    payment_method,
    COUNT(*) AS usage_count
FROM payments
GROUP BY payment_method
ORDER BY usage_count DESC;


-- ============================================================
-- 15. FINAL PROJECT KPI QUERY
-- ============================================================

SELECT
    (SELECT COUNT(*) FROM customers) AS total_customers,
    (SELECT COUNT(*) FROM sales) AS total_orders,
    (SELECT SUM(total_amount) FROM sales) AS total_revenue,
    (SELECT AVG(total_amount) FROM sales) AS average_order_value,
    (
        SELECT CAST(
            100.0 * SUM(CASE WHEN order_status = 'Returned' THEN 1 ELSE 0 END)
            / COUNT(*) AS DECIMAL(5,2)
        )
        FROM sales
    ) AS return_rate_percentage;


-- ============================================================
-- END OF PROJECT
-- ============================================================