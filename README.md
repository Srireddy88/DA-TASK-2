
# Retail Sales Data Analysis using MySQL

## 📌 Project Overview

This project focuses on analysing retail sales data using MySQL. The objective is to explore customer, order, and product information and answer business questions using SQL queries.

## 🛠️ Tools and Technologies

- MySQL
- MySQL Workbench
- Microsoft Excel
- GitHub

## 📂 Dataset Description

The project uses three CSV datasets:

### 1. Customers
Contains customer information such as:
- Customer ID
- Gender
- Age
- City
- Registration Date
- Subscription Status

### 2. Orders
Contains order information such as:
- Order ID
- Customer ID
- Product ID
- Order Date
- Quantity
- Payment Method

### 3. Products
Contains product information such as:
- Product ID
- Product Name
- Category
- Price

## 🧹 Data Preparation

The datasets were inspected using Microsoft Excel before importing them into MySQL.

Data quality checks included:

- Checking for missing values
- Checking for duplicate records
- Inspecting leading and trailing spaces
- Reviewing column formats and data consistency

## 🗄️ Database Structure

**Database Name:** `retail_sales`

The database contains three tables:

- `customers_table`
- `orders_table`
- `products_table`

### Table Relationships

- `customers_table.customer_id` → `orders_table.customer_id`
- `orders_table.product_id` → `products_table.product_id`

These relationships allow customer, order, and product information to be analysed together.

## 💻 SQL Concepts Practised

- Basic queries: `SELECT`, `WHERE`, `DISTINCT`, `ORDER BY`, `LIMIT`
- Aggregate functions: `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`
- Grouping and filtering: `GROUP BY`, `HAVING`
- Joins: `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
- Subqueries
- Common Table Expressions (CTEs)
- Views

## 📊 Business Questions

This SQL analysis explores questions such as:

1. How many orders are recorded?
2. How many customers are in the dataset?
3. Which product categories are available?
4. What are the highest-priced products?
5. What is the total sales revenue?
6. What is the average order quantity?
7. Which product categories generate the highest revenue?
8. Which payment method is used most frequently?
9. Which customers have placed more than three orders?
10. Which products have a total quantity sold greater than 100?
11. Which products are priced above or below the average product price?
12. Which customers have never placed an order?

## ▶️ How to Run the Project

1. Install and open MySQL Workbench.
2. Create the database:

```sql
CREATE DATABASE retail_sales;
USE retail_sales;
```

3. Import the three CSV files into their respective tables.
4. Open `sql/retail_sales_analysis.sql` in MySQL Workbench.
5. Execute the queries section by section.
<img width="1296" height="623" alt="Screenshot 2026-11-20 130931" src="https://github.com/user-attachments/assets/81287741-a0ab-408d-97c2-d132ab24feb7" />
<img width="1352" height="777" alt="Screenshot 2026-11-20 131017" src="https://github.com/user-attachments/assets/d28c1fbc-67d2-49a6-a219-68fcc2174b2d" />
<img width="1081" height="673" alt="Screenshot 2026-11-20 131040" src="https://github.com/user-attachments/assets/72367c72-2603-4db6-b461-20594e17ffd5" />
<img width="1191" height="765" alt="Screenshot 2026-11-20 131057" src="https://github.com/user-attachments/assets/60a69b48-0a91-48c5-8e0e-b2631421efa0" />
<img width="1330" height="687" alt="Screenshot 2026-11-20 131111" src="https://github.com/user-attachments/assets/9cfd6282-e40c-4486-b6be-03fffd42f90c" />
<img width="1158" height="920" alt="Screenshot 2026-11-20 131126" src="https://github.com/user-attachments/assets/df8ef743-cbad-4718-a773-869bf1db37cf" />
<img width="1307" height="925" alt="Screenshot 2026-11-20 131223" src="https://github.com/user-attachments/assets/918c331d-1523-485b-bb99-53039972e0e8" />
<img width="1148" height="800" alt="Screenshot 2026-11-20 131240" src="https://github.com/user-attachments/assets/3a14dc60-3c57-482a-908c-04407a4bd851" />
<img width="1173" height="991" alt="Screenshot 2026-11-20 131256" src="https://github.com/user-attachments/assets/914c7939-fd46-40a5-9016-bd3216f50fef" />
<img width="1167" height="1015" alt="Screenshot 2026-11-20 131327" src="https://github.com/user-attachments/assets/86123252-7e0c-49a6-a75f-541b08a77148" />
<img width="1277" height="952" alt="Screenshot 2026-11-20 131346" src="https://github.com/user-attachments/assets/7b7aaeaa-e867-4d5d-a73b-e8e9c54db15a" />
<img width="975" height="1078" alt="Screenshot 2026-11-20 131525" src="https://github.com/user-attachments/assets/f0531f78-bda0-459b-90b1-6e38d7d69dd2" />
<img width="1556" height="1041" alt="Screenshot 2026-11-20 131540" src="https://github.com/user-attachments/assets/c9bd23d0-259e-4fa6-8309-2262492e0d85" />


## 🎯 Project Outcome

This project demonstrates the use of MySQL to query relational datasets, combine information across tables, summarise sales activity, and answer practical business questions.


