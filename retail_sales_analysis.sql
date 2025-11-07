--- DATABASE SETUP ---
drop database if exists retail_sales;
CREATE database retail_sales;
use retail_sales;
--- TABLE CREATION ---
create table retail_sales_data (
Transaction_ID int primary key,
Date date,
Customer_ID varchar(15),
Gender varchar(10),
Age int,
Product_Category varchar(15),	
Quantity int,
Price_per_Unit decimal(10,2),
Total_Amount decimal(10,2)
);
select *from retail_sales_data;
--- DATA IMPORT ---
load data infile"C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\retail_sales_dataset.csv" into table retail_sales_data
fields terminated by ","
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;
---  Preview first 20 rows   ---
select*from retail_sales_data limit 20;
---   -- DATA QUALITY CHECKS  ---
---  Finding NULL values -----
select* from retail_sales_data 
where Transaction_ID is null
or Date is null
or Customer_ID is null
or Gender is null
or Age is null
or Product_Category is null
or Quantity is null	
or Price_per_Unit is null
or Total_Amount is null;
-----       DATA EXPLORATION      -----
---  Total number of sales ---
select count(*) as total_sales from retail_sales_data;
--- Unique customer count -- 
select count(distinct Customer_ID) AS customer_count from retail_sales_data;
--- Distinct product categories ---
select distinct Product_Category from retail_sales_data; 
---   SALES ANALYSIS OVER TIME   ---
--  Total sales per day ---
select date, sum(Total_Amount) as total_sales_per_day from retail_sales_data
group by date
order by date;
---  Total sales per month  ---
select date_format(date,'%m-%Y') as month_of_year,sum(Total_Amount) as Total_sales_per_Month from retail_sales_data
group by date_format(date,'%m-%Y')
order by month_of_year ; 
---     Total sales per year   ---
select year(date) AS sales_year,sum(Total_Amount) as total_sales_per_year from retail_sales_data
group by year(date)
order by sales_year;  
---    PRODUCT PERFORMANCE    ----
---   Highest revenue-generating category   ---
select Product_Category,sum(Total_Amount) as Highest_revenue_category from retail_sales_data
group by Product_Category
order by  Highest_revenue_category desc
limit 1;
--- Total sales and total orders per category ----
select Product_Category, sum(Total_Amount) as total_sales ,
count(*) as total_orders from retail_sales_data
group by Product_Category
order by total_sales desc;
 --- AVERAGE ORDER VALUE (AOV) ANALYSIS ---
 ---    Average Order Value by Gender   ---
 select Gender,round(SUM(Total_Amount) / count(DISTINCT Transaction_ID),2) AS Average_Order_Value
 from retail_sales_data
 group by Gender;
 --- Average Order Value by Month ---
 select date_format(date,'%Y-%m') as month,round(SUM(Total_Amount) / count(DISTINCT Transaction_ID),2) AS Average_Order_Value
 from retail_sales_data
 group by  date_format(date,'%Y-%m');
  --- Average Order Value by Product Category   ---
   select Product_Category,round(SUM(Total_Amount) / count(DISTINCT Transaction_ID),2) AS Average_Order_Value
 from retail_sales_data
 group by Product_Category;
   ---   AOV by Month, Gender, and Product Category   ---
 select date_format(date,'%Y-%m') as month,Gender,Product_Category,
 round(SUM(Total_Amount) / count(DISTINCT Transaction_ID),2) AS Average_Order_Value from retail_sales_data
 group by month,Gender,Product_Category
 order by month,Average_Order_Value desc; 
 ---   CUSTOMER DEMOGRAPHIC ANALYSIS   ---
 ---    Who shops more: Men or Women?   ---
 select Gender,count(DISTINCT Transaction_id) AS total_orders from retail_sales_data
 group by Gender;
 ----  Revenue contribution by Age Group  ---
 select 
 case
     when Age between 0 and 17 then 'Teen'
	 when Age between 18 and 25 then 'Young adult'
	 when Age between 26 and 35 then 'Adult'
     when Age between 36 and 50 then 'Middle Age'
     else 'Senior'
end as age_group,
sum(Total_Amount) as total_revenue from retail_sales_data
group by age_group
order by total_revenue desc; 
---  Average age of customers who purchased Beauty items  ----
select Product_Category, round(Avg(Age),2) as average_age from retail_sales_data
where Product_Category ='beauty';
---     TRANSACTION-LEVEL INSIGHTS   ---
---   Transactions with Total Sales > 1000   ---
select * from retail_sales_data
where Total_Amount >'1000';
---- Transactions by Gender and Product Category  ---   
select Product_Category,Gender, count(*) AS total_count from retail_sales_data
group by Product_Category,Gender
order by Product_Category;
---    MONTHLY SALES PERFORMANCE   ---
---   Find the best-selling month each year ---
select*from(select year(date) as year,month(date)as month,
avg(Total_Amount) as average_sales ,
rank() over(partition by year(date) order by avg(Total_Amount)) as ranking from retail_sales_data
group by year(date),month(date)) as rank_order
where ranking=1;
---    TOP CUSTOMERS   ---
--- Top 5 Customers by Total Sales ---
select Customer_ID,
sum(Total_Amount) as top_customer from retail_sales_data
group by Customer_ID order by top_customer desc
limit 5;
---   CATEGORY ENGAGEMENT   ---
---- Unique customers per category  ---
select Product_Category,
count(distinct Customer_ID) AS unique_customer from retail_sales_data
group by  Product_Category;





     
 
