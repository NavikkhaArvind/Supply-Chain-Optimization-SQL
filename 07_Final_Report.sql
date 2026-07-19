-- ======================================================
-- FINAL REPORT
-- SUPPLY CHAIN OPTIMIZATION DASHBOARD
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

-- 5. Total Products
SELECT COUNT(DISTINCT ProductID) AS Total_Products
FROM supply_chain;

-- 6. Total Suppliers
SELECT COUNT(DISTINCT SupplierID) AS Total_Suppliers
FROM supply_chain;

-- 7. Total Warehouses
SELECT COUNT(DISTINCT Warehouse) AS Total_Warehouses
FROM supply_chain;

-- 8. Total Destination Countries
SELECT COUNT(DISTINCT DestinationCountry) AS Total_Countries
FROM supply_chain;

-- 9. Average Supplier Rating
SELECT ROUND(AVG(SupplierRating),2) AS Average_Supplier_Rating
FROM supply_chain;

-- 10. Average Lead Time
SELECT ROUND(AVG(LeadTimeDays),2) AS Average_Lead_Time
FROM supply_chain;

-- 11. Average Delay
SELECT ROUND(AVG(DelayDays),2) AS Average_Delay
FROM supply_chain;

-- 12. Total Defective Units
SELECT SUM(DefectiveUnits) AS Total_Defective_Units
FROM supply_chain;

-- 13. Average Return Rate
SELECT ROUND(AVG(ReturnRate),2) AS Average_Return_Rate
FROM supply_chain;

-- 14. Delivery Status Summary
SELECT DeliveryStatus,
COUNT(*) AS Orders
FROM supply_chain
GROUP BY DeliveryStatus;

-- 15. Delivery Performance Summary
SELECT DeliveryPerformance,
COUNT(*) AS Orders
FROM supply_chain
GROUP BY DeliveryPerformance;

-- 16. Stock Status Summary
SELECT StockStatus,
COUNT(*) AS Products
FROM supply_chain
GROUP BY StockStatus;

-- 17. Risk Level Summary
SELECT RiskLevel,
COUNT(*) AS Orders
FROM supply_chain
GROUP BY RiskLevel;

-- 18. Top 5 Products by Revenue
SELECT ProductName,
SUM(TotalCost) AS Revenue
FROM supply_chain
GROUP BY ProductName
ORDER BY Revenue DESC
LIMIT 5;

-- 19. Top 5 Suppliers by Revenue
SELECT SupplierName,
SUM(TotalCost) AS Revenue
FROM supply_chain
GROUP BY SupplierName
ORDER BY Revenue DESC
LIMIT 5;

-- 20. Executive Summary
SELECT
COUNT(*) AS Total_Orders,
SUM(TotalCost) AS Total_Revenue,
SUM(OrderQuantity) AS Total_Quantity,
ROUND(AVG(SupplierRating),2) AS Avg_Supplier_Rating,
ROUND(AVG(LeadTimeDays),2) AS Avg_Lead_Time,
ROUND(AVG(DelayDays),2) AS Avg_Delay,
SUM(DefectiveUnits) AS Total_Defects,
ROUND(AVG(ReturnRate),2) AS Avg_Return_Rate
FROM supply_chain;
