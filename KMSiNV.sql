Create Database Project_DSA

SELECT * From [KMS Sql Case Study (14)]

ALTER Table [KMS Sql Case Study (14)]
ALTER Column Sales Decimal(18,2);

ALTER Table [KMS Sql Case Study (14)]
ALTER Column Profit Decimal(18,2);

ALTER Table [KMS Sql Case Study (14)]
ALTER Column Shipping_Cost Decimal(18,2);

ALTER Table [KMS Sql Case Study (14)]
ALTER Column Discount Decimal(5,2);

ALTER Table [KMS Sql Case Study (14)]
ALTER Column Unit_Price Decimal(18,2);


----Product Category with the highest sales...


SELECT Product_Category, Sum(Sales) AS Total_Sales
 From [KMS Sql Case Study (14)]
 GROUP BY Product_Category
ORDER BY Total_Sales Desc;

---Highest sale in the product category is Technology, Furniture and Office Supplies----


----Top 3 Region in terms of sales---

SELECT Region, Sum(Sales) AS Total_Sales
From [KMS Sql Case Study (14)]
GROUP BY Region
ORDER BY Total_Sales Desc
OFFSET 0 ROWS FETCH NEXT 3 Rows Only;


----Top 3 Regions with the highest sales are West, Ontario and Prarie---


----Bottom 3 Regions with lowest sales-----


SELECT Region, Sum(Sales) AS Total_Sales
  From [KMS Sql Case Study (14)]
   GROUP BY Region
     ORDER BY Total_Sales Asc
       OFFSET 0 ROWS FETCH NEXT 3 Rows Only;

---3 Regions with the lowest sales are Nunavut, NorthWest Tembories and Yokun---



---Total sales of Appliance in Ontario----

SELECT Sum(Sales) AS Total_Sales_Appliances_Ontario
  FROM [KMS Sql Case Study (14)]
    WHERE Product_Category = 'Appliances'
      AND Province = 'Ontario';

---In Ontario, Appliances salesis 0----


---Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers---
---The 10 lowest perfoming customers

SELECT Customer_Name, Sum(Sales) AS Total_Sales
 FROM [KMS Sql Case Study (14)]
  GROUP BY Customer_Name
   ORDER BY Total_Sales Asc
   OFFSET 0 ROWS FETCH Next 10 Rows Only;

--The lowest performing customer, my advise to the management is to do the following to increase revenue are as follow---
---1 Introduction of discount program
----2 Personalized promotions will go a long way to make them want to buy more--
-----3 Initiate and offer them a loyalty programs, with these there will be improvemrnt in their purchase which will lead to increased revenue---


---KMS incurred the most shipping cost using which shipping method?---

SELECT Ship_Mode, Sum(Shipping_Cost) AS Total_Shipping_Cost
 FROM [KMS Sql Case Study (14)]
  GROUP BY Ship_Mode
   ORDER BY Total_Shipping_Cost Desc;

---KMS incured most shipping cost through Delivery Truck----


--Small Business Customers that had the highest sales---

SELECT Customer_Name, Sum(Sales) AS Total_Sales
    FROM [KMS Sql Case Study (14)]
	 WHERE Customer_Segment = 'Small Business'
	  GROUP BY Customer_Name
	  ORDER BY Total_Sales Desc;


----The most valuable customers by what they purchase, and sales---

SELECT Customer_Name, Sum(Sales) AS Total_Sales
  FROM [KMS Sql Case Study (14)]
   GROUP BY Customer_Name
     ORDER BY Total_Sales Desc
	   OFFSET 0 ROWS FETCH Next 6 Rows Only;


---The 6 most valuable customers are:----
---- Emily Phan
---- Deborah Burnfield
---- Ray Skana
----Sylvia Foulston
---- Grant Carrodi 
---- Alejandro Grove

---Product purchase by each customer that made the top 6 most valuable customer---

SELECT Customer_Name, Product_Category, Count(*) AS Purchase_Count
    FROM [KMS Sql Case Study (14)]
	 WHERE Customer_Name IN (
	    SELECT TOP 6 Customer_Name
		 FROM [KMS Sql Case Study (14)]
		  GROUP BY Customer_Name
		   ORDER BY Sum(Sales) Desc)
GROUP BY Customer_Name, Product_Category
ORDER BY Customer_Name;

---Small business customers with the highest sales---

SELECT Customer_Name, Sum(Sales) AS Total_sales
   FROM [KMS Sql Case Study (14)]
    WHERE Customer_Segment = 'Small Business'
     GROUP BY Customer_Name
       ORDER BY Total_sales Desc;

--- Corperate customers with most number of order from 2009 to 2012---

SELECT Customer_Name, Count(Order_ID) AS Order_Count
   FROM [KMS Sql Case Study (14)]
   WHERE Customer_Segment='Corperate'
    AND Year(Order_Date) Between 2009 AND 2012
	 GROUP BY Customer_Name
	  ORDER BY Order_Count Desc;


	  ---The most profitable consumers--

SELECT Customer_Name, Sum(Profit) AS Total_Profit
  FROM [KMS Sql Case Study (14)]
    WHERE Customer_Segment = 'Consumer'
	GROUP BY Customer_Name
	  ORDER BY Total_Profit Desc;




--- Evaluating Ship mode vs Order priority---

SELECT Order_Priority, Ship_Mode, COUNT(*) AS Orders,
SUM(Shipping_Cost) AS Total_Shipping_Cost
FROM [KMS Sql Case Study (14)]
GROUP BY Order_Priority, Ship_Mode
ORDER BY Order_Priority, Ship_Mode;

--The organiztion or company did not spend the money shipping appropriately because there are 
---instances where orders that are of low 
---and medium priority were flown with air which is very expensive. Only critical and high order
---priority should be flown with air.




