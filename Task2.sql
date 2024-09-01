Create Database Wallmartdata;
Use Wallmartdata;

Create Table Sales ( 
Invoice_ID varchar(25), 
Branch Varchar(25), 
City Varchar(25),
Customer_Type varchar (25),
Gender Varchar (10),
Product_line Varchar (20),
Unit_Price Int,
Quantity Int,
Tax_5 Int,
Total Int,
Date_ Date,
Time_ Time,
Payment Varchar (20),
COGS Int,
Gross_Margin_Percentage Int 
gross_income Int
Ranking Int );

SELECT * FROM wallmartdata.sales;

-- Q1
SELECT * FROM Sales
WHERE Branch = 'A';

-- Q2
SELECT Product_line, sum(Total) AS Total_Sales
FROM Sales
GROUP BY Product_line;

-- Q3
SELECT *
FROM Sales
WHERE Payment = 'Cash';

-- Q4 
SELECT City, sum(COGS) AS Total_Gross_Income
FROM Sales
GROUP BY City;

-- Q5
SELECT Branch, AVG(Rating) AS Average_Rating
FROM Sales
GROUP BY Branch;

-- Q6
SELECT Product_line, sum(Quantity) AS Total_Quantity_Sold
FROM Sales
GROUP BY Product_line;

-- Q7
SELECT Product_line, Unit_price
FROM Sales
ORDER BY Unit_price DESC
LIMIT 5;

-- Q8
SELECT *
FROM Sales
WHERE gross_income > 30;

-- Q9
SELECT *
FROM Sales
WHERE dayofweek(Date_) = 1 OR dayofweek(Date_) = 7;

-- Q10
SELECT 
    YEAR(Date_) AS Year,
    MONTH(Date_) AS Month,
    sum(Total) AS Total_Sales,
    sum(gross_income) AS Total_Gross_Income
FROM Sales
GROUP BY YEAR(Date_), MONTH(Date_)
ORDER BY Year, Month;

-- Q11
SELECT count(*)
FROM Sales
WHERE TIME (Time_) > '18:00:00';

-- Q12
SELECT *
FROM Sales
WHERE total > (SELECT AVG(total) FROM Sales);

-- Q13
SELECT branch, date_,
sum(gross_income) OVER (PARTITION BY branch ORDER BY date) AS cumulative_gross_income
FROM Sales
ORDER BY branch, date;

