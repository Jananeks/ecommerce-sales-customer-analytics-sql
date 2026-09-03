-- ============================================================
-- E-Commerce Sales & Customer Analytics
-- File: 02_insert_data.sql
-- Database: Microsoft SQL Server
-- ============================================================


-- ============================================================
-- 1. INSERT CUSTOMER DATA
-- ============================================================

INSERT INTO customers (customer_id, customer_name, email, city, age)
VALUES
(1,  'Ananya Sharma', 'ananya.sharma@gmail.com', 'Chennai', 24),
(2,  'Priya Kumar', 'priya.kumar@gmail.com', 'Bengaluru', 27),
(3,  'Divya Raj', 'divya.raj@gmail.com', 'Chennai', 23),
(4,  'Sneha Iyer', 'sneha.iyer@gmail.com', 'Coimbatore', 29),
(5,  'Meena Devi', 'meena.devi@gmail.com', 'Madurai', 31),
(6,  'Kavya Nair', 'kavya.nair@gmail.com', 'Kochi', 26),
(7,  'Aishwarya S', 'aishwarya.s@gmail.com', 'Chennai', 25),
(8,  'Harini R', 'harini.r@gmail.com', 'Hyderabad', 30),
(9,  'Pooja Menon', 'pooja.menon@gmail.com', 'Kochi', 28),
(10, 'Nandhini V', 'nandhini.v@gmail.com', 'Bengaluru', 24),
(11, 'Keerthana M', 'keerthana.m@gmail.com', 'Madurai', 32),
(12, 'Lakshmi Priya', 'lakshmi.priya@gmail.com', 'Coimbatore', 27),
(13, 'Ramya K', 'ramya.k@gmail.com', 'Chennai', 22),
(14, 'Shalini T', 'shalini.t@gmail.com', 'Hyderabad', 34),
(15, 'Monika P', 'monika.p@gmail.com', 'Bengaluru', 29);


-- ============================================================
-- 2. INSERT PRODUCT DATA
-- ============================================================

INSERT INTO products (product_id, product_name, category, unit_price)
VALUES
(101, 'Cotton Kurti', 'Clothing', 1200.00),
(102, 'Silk Saree', 'Clothing', 4500.00),
(103, 'Handbag', 'Accessories', 1800.00),
(104, 'Artificial Necklace', 'Jewellery', 1500.00),
(105, 'Earrings Set', 'Jewellery', 800.00),
(106, 'Casual Sandals', 'Footwear', 1600.00),
(107, 'Women Watch', 'Accessories', 2200.00),
(108, 'Embroidered Dupatta', 'Clothing', 1100.00),
(109, 'Bracelet Set', 'Jewellery', 950.00),
(110, 'Heels', 'Footwear', 2100.00);


-- ============================================================
-- 3. INSERT SALES DATA
-- ============================================================

INSERT INTO sales
(order_id, customer_id, product_id, order_date, quantity, unit_price, total_amount, order_status)
VALUES
(1001, 1, 102, '2026-01-05', 1, 4500.00, 3200.00, 'Delivered'),
(1002, 2, 103, '2026-01-07', 2, 1800.00, 4500.00, 'Delivered'),
(1003, 3, 104, '2026-01-10', 2, 1500.00, 2800.00, 'Returned'),
(1004, 4, 102, '2026-01-12', 1, 4500.00, 6100.00, 'Delivered'),
(1005, 5, 107, '2026-01-15', 2, 2200.00, 5200.00, 'Delivered'),
(1006, 6, 106, '2026-01-18', 2, 1600.00, 3900.00, 'Shipped'),
(1007, 7, 101, '2026-01-20', 3, 1200.00, 4700.00, 'Delivered'),
(1008, 8, 110, '2026-01-22', 2, 2100.00, 5500.00, 'Delivered'),
(1009, 9, 105, '2026-01-25', 3, 800.00, 3000.00, 'Returned'),
(1010, 10, 103, '2026-01-28', 2, 1800.00, 4200.00, 'Delivered'),
(1011, 11, 108, '2026-02-01', 3, 1100.00, 5100.00, 'Delivered'),
(1012, 12, 109, '2026-02-03', 4, 950.00, 3600.00, 'Shipped'),
(1013, 13, 101, '2026-02-06', 4, 1200.00, 4800.00, 'Delivered'),
(1014, 14, 102, '2026-02-08', 1, 4500.00, 5900.00, 'Delivered'),
(1015, 15, 104, '2026-02-10', 3, 1500.00, 4100.00, 'Returned'),
(1016, 1, 106, '2026-02-13', 3, 1600.00, 5300.00, 'Delivered'),
(1017, 2, 105, '2026-02-15', 4, 800.00, 2700.00, 'Pending'),
(1018, 3, 107, '2026-02-18', 2, 2200.00, 4600.00, 'Delivered'),
(1019, 4, 110, '2026-02-20', 3, 2100.00, 6200.00, 'Delivered'),
(1020, 5, 108, '2026-02-22', 3, 1100.00, 3500.00, 'Delivered'),
(1021, 6, 102, '2026-02-25', 1, 4500.00, 4400.00, 'Returned'),
(1022, 7, 103, '2026-02-27', 2, 1800.00, 5000.00, 'Delivered'),
(1023, 8, 109, '2026-03-01', 5, 950.00, 3300.00, 'Delivered'),
(1024, 9, 101, '2026-03-04', 3, 1200.00, 5700.00, 'Delivered'),
(1025, 10, 107, '2026-03-07', 2, 2200.00, 13349.00, 'Delivered');


-- ============================================================
-- 4. INSERT PAYMENT DATA
-- ============================================================

INSERT INTO payments
(payment_id, order_id, payment_method, payment_status, payment_amount, payment_date)
SELECT
    5000 + order_id - 1000,
    order_id,
    CASE order_id % 4
        WHEN 0 THEN 'UPI'
        WHEN 1 THEN 'Credit Card'
        WHEN 2 THEN 'Debit Card'
        ELSE 'Cash on Delivery'
    END,
    CASE
        WHEN order_status = 'Returned' THEN 'Refunded'
        WHEN order_status = 'Pending' THEN 'Pending'
        ELSE 'Paid'
    END,
    total_amount,
    order_date
FROM sales;


-- ============================================================
-- 5. INSERT ADVANCE PAYMENT DATA
-- ============================================================

INSERT INTO advances
(advance_id, order_id, advance_amount, advance_date, advance_status)
SELECT
    6000 + order_id - 1000,
    order_id,
    ROUND(total_amount * 0.20, 2),
    order_date,
    CASE
        WHEN order_status = 'Returned' THEN 'Refunded'
        WHEN order_status = 'Pending' THEN 'Pending'
        ELSE 'Adjusted'
    END
FROM sales;