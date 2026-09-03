E-Commerce Sales & Customer Analytics using SQL
📌 Project Overview

This project analyzes e-commerce sales and customer transaction data using Microsoft SQL Server.

The objective is to identify sales trends, customer purchasing behavior, product performance, category performance, payment trends, and order status patterns using SQL.

This portfolio project demonstrates practical SQL and business analysis skills relevant to Data Analyst and Business Analyst roles.

🎯 Business Objectives

The analysis focuses on answering key business questions:

What is the total revenue generated?
What is the average order value?
What percentage of orders are returned?
Which customers generate the highest revenue?
Which products have the highest sales?
Which categories generate the most revenue?
Which cities contribute the highest revenue?
Which payment methods are used most frequently?
Which customers are repeat customers?
Which customers have spending above the average?
How does revenue change month by month?
How are orders distributed across different statuses?
🗂️ Database Structure

The project contains five relational tables.

Customers
Column	Description
customer_id	Unique customer identifier
customer_name	Customer name
email	Customer email
city	Customer city
age	Customer age
Products
Column	Description
product_id	Unique product identifier
product_name	Product name
category	Product category
unit_price	Product unit price
Sales
Column	Description
order_id	Unique order identifier
customer_id	Customer reference
product_id	Product reference
order_date	Order date
quantity	Quantity purchased
unit_price	Unit price recorded for the order
total_amount	Transaction/order amount
order_status	Order status
Payments
Column	Description
payment_id	Unique payment identifier
order_id	Order reference
payment_method	Payment method
payment_status	Payment status
payment_amount	Payment amount
payment_date	Payment date
Advances
Column	Description
advance_id	Unique advance identifier
order_id	Order reference
advance_amount	Advance payment amount
advance_date	Advance payment date
advance_status	Advance payment status
🔗 Table Relationships
Customers
    |
    | customer_id
    v
Sales
    |
    |---------------- product_id ----------> Products
    |
    |---------------- order_id ------------> Payments
    |
    |---------------- order_id ------------> Advances
📊 Key KPIs

The project calculates the following business KPIs:

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
Customer revenue ranking
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
Total order count
Revenue by order status
Returned order analysis
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
🧠 SQL Skills Demonstrated

This project uses:

SELECT
WHERE
ORDER BY
DISTINCT
GROUP BY
HAVING
Aggregate Functions
COUNT()
SUM()
AVG()
MAX()
MIN()
INNER JOIN
LEFT JOIN
CASE Statements
Subqueries
Common Table Expressions (CTEs)
Window Functions
RANK()
ROW_NUMBER()
LAG()
LEAD()
SUM() OVER()
Date Functions
Conditional Aggregation
Primary Keys
Foreign Keys
Data Validation Constraints
📈 Business Questions

The analysis answers questions such as:

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
Which customers spend above the average customer spend?
How does revenue change month by month?
How does each customer's order value compare with their previous order?
📁 Project Structure
ecommerce-sales-customer-analytics-sql
│
├── README.md
│
├── Screenshots
│   ├── 01_executive_sales_dashboard.png
│   ├── 02_customer_analysis.png
│   └── 03_performance_analysis.png
│
└── sql
    ├── 01_create_tables.sql
    ├── 02_insert_data.sql
    └── 03_analysis_queries.sql
🖼️ Project Screenshots

The repository includes screenshots demonstrating:

Executive Sales Dashboard
Customer Analysis
Performance Analysis

The screenshots are available in the Screenshots folder.

⚙️ Tools & Technologies
Microsoft SQL Server
SQL Server Management Studio (SSMS)
SQL
Relational Database Concepts
Data Analysis
Business Analytics
▶️ How to Run the Project
Step 1 — Create the Database

Create a new database in SQL Server Management Studio.

CREATE DATABASE EcommerceAnalytics;

Select the database:

USE EcommerceAnalytics;
Step 2 — Create Tables

Open:

sql/01_create_tables.sql

Execute the script to create the five database tables.

Step 3 — Insert Data

Open:

sql/02_insert_data.sql

Execute the script to populate the tables with the sample e-commerce data.

Step 4 — Run Analysis

Open:

sql/03_analysis_queries.sql

Execute the queries to perform the complete analysis.

💡 Analytical Outcomes

The analysis can help identify:

High-value customers
Repeat purchasing behavior
Best-performing products
High-revenue categories
High-performing cities
Returned and pending orders
Customer spending patterns
Monthly sales trends
Payment method preferences

These insights can support business decisions related to customer retention, product strategy, sales planning, and revenue growth.

🚀 Future Enhancements

Future improvements could include:

Connecting the SQL database to Microsoft Power BI
Building an interactive sales dashboard
Adding larger historical datasets
Customer Lifetime Value analysis
Customer cohort analysis
Profit and cost analysis
Year-over-year sales analysis
Automated KPI reporting
👩‍💻 Skills Demonstrated

SQL | Data Analysis | Business Analytics | KPI Analysis | Customer Analytics | Sales Analytics | Relational Databases | Data Aggregation | Joins | CTEs | Window Functions | Business Problem Solving

📌 Project Purpose

This portfolio project was created to demonstrate practical SQL-based data analysis and business problem-solving skills for entry-level Data Analyst and Business Analyst positions.


