use mydata;
/*select * from sales;
-- Duplicate entries
select saleid, count(*) from sales group by salesid having count(*) > 1;*/
select contact, count(*) from sales group by contact having count(*) > 1;
-- Total sales amount
select sum(saleprice) AS TOTALSALESAMOUNT , sum(profit) AS TOTALPROFIT from sales;
-- AVG sale price by product type
select productType, AVG(saleprice) AS AvgSalePrice from sales group by productType;
-- count statewise sale
select state, count(*) AS Totalsales from sales group by state;
-- maximum and minimum sales prices
select max(Saleprice) AS Maxsaleprice, min(Saleprice) AS Minsaleprice from sales;
-- Total sales by year
select saleyear, SUM(Saleprice) AS TotalSaleAmount from sales group by saleyear;
-- sales distribution by productType and month
select ProductType,SaleMonth, COUNT(*) AS TotalSales from sales group by SaleMonth,ProductType;
-- Sales by AGE GROUP
select case
WHEN Age BETWEEN 18 AND 30 THEN '18-30'
WHEN Age BETWEEN 31 AND 45 THEN '31-45'
WHEN Age BETWEEN 46 AND 60 THEN '46-60'
ELSE 'Above 60'
END AS AgeGroup, COUNT(*) AS TotalSales from sales group by Agegroup;
-- Sales Trend over Months
select SaleYear,SaleMonth,count(*) AS TotalSales From Sales group by SaleYear,SaleMonth order by SaleYear,month(CASE SaleMonth
WHEN 'January' THEN '01'
WHEN 'February' THEN '02'
WHEN 'March' THEN '03'
WHEN 'April' THEN '04'
WHEN 'May' THEN '05'
WHEN 'June' THEN '06'
WHEN 'July' THEN '07'
WHEN 'August' THEN '08'
WHEN 'September' THEN '09'
WHEN 'October' THEN '10'
WHEN 'November' THEN '11'
WHEN 'December' THEN '12'
END);
-- Profit and SalePrice analysis BY Gender
select Gender AS Gender,
 count(*) AS TotalSales,
 AVG(SalePrice) AS AvgSalePrice,
 MIN(Saleprice) AS MinSalePrice,
 MAX(Saleprice) AS MaxSalePrice 
 FROM sales GROUP BY Gender;
-- Contactwise sales and profit 
select Contact,sum(SalePrice) AS Totalsales,sum(Profit) AS TotalProfit from sale group by contact,profit;
-- Top 5 sales profit wise
select * from sales order by profit desc limit 5;
-- Bottom wise sales profit wise
select * from sales order by profit asc limit 5;
-- To get 2nd Hightest Profit
select * from sales order by profit desc limit 1 offset 1;
-- Distinct values 2nd hightest
select * from sales 
WHERE Profit = (select distinct Profit From Sales Order by Profit Desc Limit 1 offset 2);
-- Alter the Table
Alter table sales add Avg_saleprice varchar (255);
select * from sales;
-- Min of saleprice
select  min(saleprice) as Avg_saleprice from sales;
set sql_safe_updates = 0;
-- Update the table
Update sales set Avg_saleprice = '179.99' where Avg_saleprice is null;
select * from sales;
start transaction;
Delete from sales where Avg_saleprice = '179.99';
rollback;
commit;







 