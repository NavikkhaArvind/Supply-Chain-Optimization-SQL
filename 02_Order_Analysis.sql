-- ======================================================
-- ORDER ANALYSIS
-- ======================================================

-- 1. Total Orders
SELECT COUNT(*) AS Total_Orders
FROM supply_chain;

-- 2. Total Revenue
SELECT SUM(TotalCost) AS Total_Revenue
FROM supply_chain;

-- 3. Average Order Value
SELECT ROUND(AVG(TotalCost),2) AS Average_Order_Value
FROM supply_chain;

-- 4. Total Quantity Ordered
SELECT SUM(OrderQuantity) AS Total_Quantity
FROM supply_chain;

-- 5. Orders by Category
SELECT Category,
COUNT(*) AS Total_Orders
FROM supply_chain
GROUP BY Category
ORDER BY Total_Orders DESC;

-- 6. Revenue by Category
SELECT Category,
SUM(TotalCost) AS Revenue
FROM supply_chain
GROUP BY Category
ORDER BY Revenue DESC;

-- 7. Orders by Product
SELECT ProductName,
COUNT(*) AS Total_Orders
FROM supply_chain
GROUP BY ProductName
ORDER BY Total_Orders DESC;

-- 8. Top 10 Products by Revenue
SELECT ProductName,
SUM(TotalCost) AS Revenue
FROM supply_chain
GROUP BY ProductName
ORDER BY Revenue DESC
LIMIT 10;

-- 9. Orders by Destination Country
SELECT DestinationCountry,
COUNT(*) AS Orders
FROM supply_chain
GROUP BY DestinationCountry
ORDER BY Orders DESC;

-- 10. Revenue by Destination Country
SELECT DestinationCountry,
SUM(TotalCost) AS Revenue
FROM supply_chain
GROUP BY DestinationCountry
ORDER BY Revenue DESC;

-- 11. Orders by Warehouse
SELECT Warehouse,
COUNT(*) AS Orders
FROM supply_chain
GROUP BY Warehouse
ORDER BY Orders DESC;

-- 12. Revenue by Warehouse
SELECT Warehouse,
SUM(TotalCost) AS Revenue
FROM supply_chain
GROUP BY Warehouse
ORDER BY Revenue DESC;

-- 13. Orders by Shipping Mode
SELECT ShippingMode,
COUNT(*) AS Orders
FROM supply_chain
GROUP BY ShippingMode
ORDER BY Orders DESC;

-- 14. Revenue by Shipping Mode
SELECT ShippingMode,
SUM(TotalCost) AS Revenue
FROM supply_chain
GROUP BY ShippingMode
ORDER BY Revenue DESC;

-- 15. Orders by Carrier
SELECT Carrier,
COUNT(*) AS Orders
FROM supply_chain
GROUP BY Carrier
ORDER BY Orders DESC;

-- 16. Revenue by Carrier
SELECT Carrier,
SUM(TotalCost) AS Revenue
FROM supply_chain
GROUP BY Carrier
ORDER BY Revenue DESC;

-- 17. Highest Value Orders
SELECT OrderID,
ProductName,
TotalCost
FROM supply_chain
ORDER BY TotalCost DESC
LIMIT 10;

-- 18. Largest Quantity Orders
SELECT OrderID,
ProductName,
OrderQuantity
FROM supply_chain
ORDER BY OrderQuantity DESC
LIMIT 10;

-- 19. Average Unit Price by Category
SELECT Category,
ROUND(AVG(UnitPrice),2) AS Avg_UnitPrice
FROM supply_chain
GROUP BY Category
ORDER BY Avg_UnitPrice DESC;

-- 20. Average Order Quantity by Category
SELECT Category,
ROUND(AVG(OrderQuantity),2) AS Avg_Order_Quantity
FROM supply_chain
GROUP BY Category
ORDER BY Avg_Order_Quantity DESC;
