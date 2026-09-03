E-Commerce Sales & Customer Analytics using SQL
📌 Project Overview

This project analyzes e-commerce sales and customer transaction data using Microsoft SQL Server.

The objective is to understand sales performance, customer purchasing behavior, product and category performance, payment trends, order status, and customer value using SQL-based analysis.

The project demonstrates practical SQL skills used in Data Analyst and Business Analyst roles, including data aggregation, joins, subqueries, CTEs, CASE statements, and window functions.

🎯 Business Objectives

The analysis focuses on answering key business questions such as:

How much revenue is generated from sales?
What is the average order value?
What percentage of orders are returned?
Which customers generate the highest revenue?
Which products sell the most?
Which categories generate the most revenue?
Which cities contribute the highest sales?
What are the most frequently used payment methods?
Which customers have multiple purchases?
How does customer spending vary?
How are orders distributed across different statuses?
How does revenue change month by month?
🗂️ Database Structure

The project contains five related tables:

1. Customers

Contains customer information.

Column	Description
customer_id	Unique customer identifier
customer_name	Customer name
email	Customer email
city	Customer city
age	Customer age
2. Products

Contains product information.

Column	Description
product_id	Unique product identifier
product_name	Product name
category	Product category
unit_price	Product unit price
3. Sales

Contains order and transaction information.

Column	Description
order_id	Unique order identifier
customer_id	Customer reference
product_id	Product reference
order_date	Date of order
quantity	Quantity purchased
unit_price	Unit price recorded for the order
total_amount	Transaction/order amount
order_status	Current order status
4. Payments

Contains payment information.

Column	Description
payment_id	Unique payment identifier
order_id	Order reference
payment_method	Payment method
payment_status	Payment status
payment_amount	Payment amount
payment_date	Payment date
5. Advances

Contains advance payment information.

Column	Description
advance_id	Unique advance identifier
order_id	Order reference
advance_amount	Advance amount
advance_date	Advance payment date
advance_status	Advance payment status
🔗 Table Relationships

The database follows a relational structure:

Customers
    │
    │ customer_id
    ▼
Sales
    │
    ├──────── product_id ────────► Products
    │
    ├──────── order_id ──────────► Payments
    │
    └──────── order_id ──────────► Advances
📊 Key KPIs

The project calculates important business KPIs including:

Total Customers
Total Orders
Total Revenue
Average Order Value (AOV)
Return Rate
Revenue by Customer
Revenue by Product
Revenue by Category
Revenue by City
Orders by Status
Payment Method Usage
🔍 Analysis Performed
Customer Analysis
Customer-wise order count
Customer-wise revenue
Identification of repeat customers
Customers with multiple orders
Customer spending segmentation
Ranking customers based on revenue
Identification of customers with no orders
Product Analysis
Product sales performance
Quantity sold by product
Best-selling products
Average product price
Product performance by category
Category Analysis
Orders by category
Units sold by category
Revenue by category
Identification of high-performing categories
Sales & Order Analysis
Total orders
Revenue by order status
Returned orders
Order status distribution
Monthly order trends
Monthly revenue trends
Payment Analysis
Payment method usage
Paid, pending, and refunded payments
Payment amount analysis
City Analysis
Customer count by city
Orders by city
Revenue by city
Identification of top-performing cities
🧠 Advanced SQL Techniques

The project uses the following SQL concepts:

SELECT
WHERE
ORDER BY
DISTINCT
GROUP BY
HAVING
Aggregate functions
COUNT()
SUM()
AVG()
MAX()
MIN()
INNER JOIN
LEFT JOIN
CASE
Subqueries
Common Table Expressions (CTEs)
Window Functions
RANK()
ROW_NUMBER()
LAG()
LEAD()
SUM() OVER()
Date functions
Conditional aggregation
Primary keys
Foreign keys
Constraints
📈 Business Questions Answered

The SQL analysis addresses questions including:

What is the total revenue generated?
What is the average order value?
What percentage of orders are returned?
Which customer has placed the most orders?
Which customers generate the highest revenue?
Which customers have placed more than one order?
Which product has the highest sales quantity?
Which category generates the highest revenue?
Which city generates the highest revenue?
Which payment method is used most frequently?
How many orders are delivered, shipped, pending, returned, or cancelled?
Which customers have not placed any orders?
Which customers have spending above the average customer spend?
How does revenue change month by month?
How does each customer's order value compare with their previous order?
📁 Project Structure
ecommerce-sales-customer-analytics-sql
│
├── README.md
│
└── sql
    ├── 01_create_tables.sql
    ├── 02_insert_data.sql
    └── 03_analysis_queries.sql
SQL Files

01_create_tables.sql

Creates the database tables, primary keys, foreign keys, and data validation constraints.

02_insert_data.sql

Inserts the sample customer, product, sales, payment, and advance transaction data.

03_analysis_queries.sql

Contains SQL queries used for KPI calculation, customer analysis, product analysis, category analysis, payment analysis, city analysis, monthly trends, CTE analysis, window functions, and business questions.

⚙️ Tools & Technologies
Microsoft SQL Server
SQL Server Management Studio (SSMS)
SQL
Relational Database Concepts
▶️ How to Run the Project
Step 1 — Create the Database

Create a new database in SQL Server Management Studio.

Example:

CREATE DATABASE EcommerceAnalytics;

Then select the database:

USE EcommerceAnalytics;
Step 2 — Create Tables

Open:

sql/01_create_tables.sql

Execute the script to create all five tables.

Step 3 — Insert Data

Open:

sql/02_insert_data.sql

Execute the script to populate the tables with sample data.

Step 4 — Run Analysis

Open:

sql/03_analysis_queries.sql

Run the queries to perform the complete analysis.

💡 Key Analytical Insights

The analysis can be used to identify:

High-value customers who contribute significantly to revenue
Repeat customers and purchasing behavior
Best-performing products
High-revenue product categories
Cities with stronger sales performance
Returned and pending orders
Customer spending patterns
Monthly revenue trends
Payment method preferences

These insights can support business decisions related to customer retention, product strategy, sales planning, and revenue growth.

🚀 Future Enhancements

Possible improvements to the project include:

Connecting the SQL database to Microsoft Power BI
Building an interactive sales dashboard
Adding more historical transaction data
Creating customer lifetime value analysis
Adding monthly and yearly sales comparisons
Developing customer cohort analysis
Adding profit and cost analysis
Creating automated KPI reports
👩‍💻 Skills Demonstrated

This project demonstrates practical experience in:

SQL | Data Analysis | Business Analytics | Data Cleaning | Data Aggregation | Relational Databases | Joins | CTEs | Window Functions | KPI Analysis | Customer Analytics | Sales Analytics

📌 Project Purpose

This is a portfolio project created to demonstrate SQL-based data analysis and business problem-solving skills for entry-level Data Analyst and Business Analyst roles.

## 📸 Project Screenshots

### Executive Sales Dashboard
![Executive Sales Dashboard](screenshots/01_executive_sales_dashboard.png)

### Customer Analysis
![Customer Analysis](screenshots/02_customer_analysis.png)

### Performance Analysis
![Performance Analysis](screenshots/03_performance_analysis.png)
