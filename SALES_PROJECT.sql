SELECT *
FROM SLAES_PROJECT.DBO.sales_data_sample

--NUMBER OF COUNTRIES IN WHICH WERE TAKING PLACE
SELECT COUNT(DISTINCT(COUNTRY))
FROM SLAES_PROJECT.DBO.sales_data_sample
--IT WAS FOUND OUT THAT THE COMPANY IS SENDING ORDER IN 19 DIFFERENT COUNTRIES

--DIFFERENT TYPES OF ORDER STATUSES
SELECT DISTINCT(STATUS)
FROM SLAES_PROJECT.DBO.sales_data_sample

SELECT COUNT(DISTINCT(STATUS))
FROM SLAES_PROJECT.DBO.sales_data_sample
--IT WAS FOUND OUT THAT THERE WERE 6 DIFFERENT TYPES OF ORDER STATUSES Resolved, On Hold, Cancelled, Shipped, Disputed, In Process 

--DIFFERENT TYPES OF PRODUCTS
SELECT COUNT(DISTINCT(PRODUCTLINE))
FROM SLAES_PROJECT.DBO.sales_data_sample
--IT WAS FOUND OUT THAT THERE WERE 7 DIFFERENT TYPES OF PRODUCTS 

--NUMBER OF DISTINCT CUSTOMERS
SELECT COUNT(DISTINCT(CUSTOMERNAME))
FROM SLAES_PROJECT.DBO.sales_data_sample
--IT WAS FOUND OUT THAT THERE WERE 92 DIFFERENT CUSTOMERS

--DATA EXPLORATORY ANALYSIS

--1. FINDING OUT THE PRODUCT OF HIGHEST SALES
  
SELECT PRODUCTLINE, SUM(SALES) TOTAL_SALES
FROM SLAES_PROJECT.DBO.sales_data_sample
GROUP BY PRODUCTLINE
ORDER BY 2 DESC
--It was found out that Classical Cars has the most highest sales and Trains have the lowest sales.

--2. FINDING OUT THE BEST YEAR OF SALES

SELECT YEAR_ID, SUM(SALES) REVENUE
FROM SLAES_PROJECT.DBO.sales_data_sample
GROUP BY YEAR_ID
ORDER BY REVENUE DESC 
--It was found out that year 2004 has the highest sales and 2005 has the lowest sales.

--3. FURTHER ANALYSIS WAS DONE IN ORDER TO FIND OUT WHY 2005 HAVE LEAST SALES

SELECT MONTH_ID
FROM SLAES_PROJECT.DBO.sales_data_sample
WHERE YEAR_ID = 2004
GROUP BY MONTH_ID

SELECT MONTH_ID
FROM SLAES_PROJECT.DBO.sales_data_sample
WHERE YEAR_ID = 2003
GROUP BY MONTH_ID

SELECT MONTH_ID
FROM SLAES_PROJECT.DBO.sales_data_sample
WHERE YEAR_ID = 2005
GROUP BY MONTH_ID
--IT WAS FOUND OUT THAT 2005 HAD THE LEAST SALES BECAUSE SALES TOOK PLACE FOR ONLY 5 MONTHS 

--4. WHICH MONTH HAS THE BEST SALES 

SELECT MONTH_ID, SUM(SALES) REVENUE, COUNT(ORDERLINENUMBER) FREQUENCY
FROM SLAES_PROJECT.DBO.sales_data_sample
WHERE YEAR_ID = 2004
GROUP BY MONTH_ID
ORDER BY REVENUE DESC

SELECT MONTH_ID, SUM(SALES) REVENUE, COUNT(ORDERLINENUMBER) FREQUENCY
FROM SLAES_PROJECT.DBO.sales_data_sample
WHERE YEAR_ID = 2005
GROUP BY MONTH_ID
ORDER BY REVENUE DESC

SELECT MONTH_ID, SUM(SALES) REVENUE, COUNT(ORDERLINENUMBER) FREQUENCY
FROM SLAES_PROJECT.DBO.sales_data_sample
WHERE YEAR_ID = 2003
GROUP BY MONTH_ID
ORDER BY REVENUE DESC
--It was found out that the year 2004 and 2003 have their highest sales in  the month of November, while in the year 2005 highest sales took place in month of May

--5. WHICH COUNTRY HAD THE MOST SALES

SELECT COUNTRY, SUM(SALES) REVENUE
FROM SLAES_PROJECT.DBO.sales_data_sample
GROUP BY COUNTRY
ORDER BY REVENUE DESC
--It was found out that USA has the most sales and Ireland has the least sales.

--6. WHO IS THE BEST CUSTOMER

SELECT CUSTOMERNAME, SUM(QUANTITYORDERED) AS ABC
FROM SLAES_PROJECT.DBO.sales_data_sample
GROUP BY CUSTOMERNAME
ORDER BY ABC DESC
  --It was found out that Euro Shopping Channel is the best customer.

--7. FURTHER ANALYSIS WAS DONE TO FIND OUT THE STATUS OF THE CUSTOMERS

SELECT CUSTOMERNAME, COUNT(QUANTITYORDERED) AS ABC,
CASE WHEN COUNT(QUANTITYORDERED) > AVG(QUANTITYORDERED) THEN 'LOYAL'
ELSE 'CHURNED'
END CUNSTOMETR_STATUS
FROM SLAES_PROJECT.DBO.sales_data_sample
GROUP BY CUSTOMERNAME
ORDER BY ABC DESC
