-- ============================================================
-- E-Commerce Sales & Customer Analytics
-- File: 01_create_tables.sql
-- Database: Microsoft SQL Server
-- ============================================================

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    city VARCHAR(50) NOT NULL,
    age INT CHECK (age >= 18)
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price > 0)
);

-- Sales Table
CREATE TABLE sales (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    order_date DATE NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price > 0),
    total_amount DECIMAL(10,2) NOT NULL CHECK (total_amount >= 0),
    order_status VARCHAR(20) NOT NULL
        CHECK (order_status IN ('Delivered','Shipped','Pending','Returned','Cancelled')),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Payments Table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    payment_status VARCHAR(20) NOT NULL
        CHECK (payment_status IN ('Paid','Pending','Refunded')),
    payment_amount DECIMAL(10,2) NOT NULL CHECK (payment_amount >= 0),
    payment_date DATE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES sales(order_id)
);

-- Advances Table
CREATE TABLE advances (
    advance_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    advance_amount DECIMAL(10,2) NOT NULL CHECK (advance_amount >= 0),
    advance_date DATE NOT NULL,
    advance_status VARCHAR(20) NOT NULL
        CHECK (advance_status IN ('Adjusted','Pending','Refunded')),
    FOREIGN KEY (order_id) REFERENCES sales(order_id)
);