# Retail-Sales-Data-Analysis-Using-SQL and Power BI

## 📘 Project Overview
This project focuses on Retail Sales Data Analysis using **MySQL** for data cleaning, exploration, and analysis — and **Power BI** for visualization.
The goal is to derive meaningful business insights such as:

•Customer purchasing behavior

•Sales trends across time

•Best-selling product categories

•Gender and age group analysis

•Top-performing customers

---

## 🧩 Dataset Description

File Name: retail_sales_dataset.csv
Total Columns: 9
Total Rows:1000

| Column Name      | Description                           |
| ---------------- | ------------------------------------- |
| Transaction_ID   | Unique ID for each transaction        |
| Date             | Date of transaction                   |
| Customer_ID      | Unique customer identifier            |
| Gender           | Customer gender                       |
| Age              | Age of the customer                   |
| Product_Category | Type of product purchased             |
| Quantity         | Number of items purchased             |
| Price_per_Unit   | Unit price of the item                |
| Total_Amount     | Total purchase amount per transaction |

---
**SQL Project Structure**

1️⃣ **Create Database and Table**
 ```sql
   DROP DATABASE IF EXISTS retail_sales;
   CREATE DATABASE retail_sales;
   USE retail_sales;

#**Create Table Structure**

```sql
   CREATE TABLE retail_sales_data (
    Transaction_ID INT PRIMARY KEY,
    Date DATE,
    Customer_ID VARCHAR(15),
    Gender VARCHAR(10),
    Age INT,
    Product_Category VARCHAR(15),
    Quantity INT,
    Price_per_Unit DECIMAL(10,2),
    Total_Amount DECIMAL(10,2)
   );

#**Import Data**

Make sure your CSV file is placed in MySQL’s Uploads directory:
C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\

#Then load it:

```sql
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\retail_sales_dataset.csv"
INTO TABLE retail_sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

2️⃣ Data Cleaning

•Detect missing or null values

•Validate column data types

3️⃣ Data Exploration

•Total sales and unique customers

•Distinct product categories

•Sales trends (daily, monthly, yearly)

4️⃣ Business Insights

•Highest revenue-generating category

•Average Order Value (AOV) by:

•Gender

•Month

•Product Category

•Most frequent shoppers (Men vs Women)

•Age group contribution to revenue

•Top 5 customers based on total spending

5️⃣ Advanced SQL Analysis

•Window functions (RANK(), AVG(), etc.)

•Identifying best-selling month each year

•Unique customer count per category

---
📊 Power BI Dashboard

After connecting MySQL to Power BI, the following visuals were created:

| Visualization            | Description                                          |
| ------------------------ | ---------------------------------------------------- |
| **Bar Chart**            | Sales trend by month                                 |
| **Stacked column Chart** | Revenue by product category and Gender               |
| **Pie Chart**            | Order distribution by gender                         |
| **Card Visuals**         | KPIs: Total Sales, Avg Order Value, Unique Customers |
| **Stacked Bar Chart**    | Total Revenue by product category                    |
      
---
💼 **Key Insights**

✅ The Beauty and Electronics categories contribute the most revenue.
✅ Adults (26–35 years) are the largest customer group.
✅ Female customers make more frequent purchases.
✅ The average order value (AOV) varies significantly by month and category.
✅ Certain months show seasonal sales spikes.
---
⚙️**Technologies Used**

| Tool                   | Purpose                                                   |
| ---------------------- | --------------------------------------------------------- |
| **MySQL**              | Data storage, cleaning, and analysis                      |
| **Power BI**           | Visualization and dashboard creation                      |
| **Excel / CSV**        | Raw dataset                                               |
| **SQL Functions Used** | COUNT, SUM, AVG, GROUP BY, CASE WHEN, RANK(), DATE_FORMAT |
---

🧠 **Learning Outcomes:**

Through this project, you will:

Write professional SQL queries for analysis

Apply window functions for advanced insights

Perform trend and behavioral analysis

Visualize key metrics using Power BI


