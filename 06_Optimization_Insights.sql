-- ======================================================
-- BUSINESS OPTIMIZATION INSIGHTS
-- ======================================================

-- 1. Total Revenue
SELECT SUM(TotalCost) AS Total_Revenue
FROM supply_chain;

-- 2. Highest Revenue Category
SELECT Category,
SUM(TotalCost) AS Revenue
FROM supply_chain
GROUP BY Category
ORDER BY Revenue DESC;

-- 3. Highest Revenue Product
SELECT ProductName,
SUM(TotalCost) AS Revenue
FROM supply_chain
GROUP BY ProductName
ORDER BY Revenue DESC
LIMIT 10;

-- 4. Best Supplier (Highest Rating)
SELECT SupplierName,
ROUND(AVG(SupplierRating),2) AS Avg_Rating
FROM supply_chain
GROUP BY SupplierName
ORDER BY Avg_Rating DESC
LIMIT 10;

-- 5. Worst Supplier (Lowest Rating)
SELECT SupplierName,
ROUND(AVG(SupplierRating),2) AS Avg_Rating
FROM supply_chain
GROUP BY SupplierName
ORDER BY Avg_Rating ASC
LIMIT 10;

-- 6. Suppliers with Highest Delivery Delay
SELECT SupplierName,
ROUND(AVG(DelayDays),2) AS Avg_Delay
FROM supply_chain
GROUP BY SupplierName
ORDER BY Avg_Delay DESC;

-- 7. High Risk Orders
SELECT OrderID,
ProductName,
RiskLevel
FROM supply_chain
WHERE RiskLevel='High';

-- 8. Risk Level Distribution
SELECT RiskLevel,
COUNT(*) AS Orders
FROM supply_chain
GROUP BY RiskLevel;

-- 9. Warehouse Performance
SELECT Warehouse,
ROUND(AVG(DelayDays),2) AS Avg_Delay,
SUM(TotalCost) AS Revenue
FROM supply_chain
GROUP BY Warehouse
ORDER BY Revenue DESC;

-- 10. Best Warehouse
SELECT Warehouse,
ROUND(AVG(DelayDays),2) AS Avg_Delay
FROM supply_chain
GROUP BY Warehouse
ORDER BY Avg_Delay ASC
LIMIT 5;

-- 11. Worst Warehouse
SELECT Warehouse,
ROUND(AVG(DelayDays),2) AS Avg_Delay
FROM supply_chain
GROUP BY Warehouse
ORDER BY Avg_Delay DESC
LIMIT 5;

-- 12. Products with Highest Return Rate
SELECT ProductName,
ReturnRate
FROM supply_chain
ORDER BY ReturnRate DESC
LIMIT 10;

-- 13. Products with Most Defects
SELECT ProductName,
SUM(DefectiveUnits) AS Defective
FROM supply_chain
GROUP BY ProductName
ORDER BY Defective DESC
LIMIT 10;

-- 14. Inventory Requiring Immediate Attention
SELECT ProductName,
InventoryLevel,
StockStatus
FROM supply_chain
WHERE StockStatus='Low'
OR StockStatus='Out of Stock';

-- 15. Shipping Mode Performance
SELECT ShippingMode,
ROUND(AVG(DelayDays),2) AS Avg_Delay,
SUM(TotalCost) AS Revenue
FROM supply_chain
GROUP BY ShippingMode
ORDER BY Avg_Delay;

-- 16. Carrier Performance
SELECT Carrier,
ROUND(AVG(DelayDays),2) AS Avg_Delay,
COUNT(*) AS Orders
FROM supply_chain
GROUP BY Carrier
ORDER BY Avg_Delay;

-- 17. Countries with Highest Orders
SELECT DestinationCountry,
COUNT(*) AS Orders
FROM supply_chain
GROUP BY DestinationCountry
ORDER BY Orders DESC;

-- 18. Countries with Highest Revenue
SELECT DestinationCountry,
SUM(TotalCost) AS Revenue
FROM supply_chain
GROUP BY DestinationCountry
ORDER BY Revenue DESC;

-- 19. Overall Supply Chain KPI
SELECT
COUNT(*) AS Total_Orders,
SUM(TotalCost) AS Total_Revenue,
AVG(LeadTimeDays) AS Avg_Lead_Time,
AVG(DelayDays) AS Avg_Delay,
SUM(DefectiveUnits) AS Total_Defective,
AVG(ReturnRate) AS Avg_ReturnRate
FROM supply_chain;

-- 20. Business Recommendations
SELECT
'Increase inventory for frequently ordered products.' AS Recommendation
UNION ALL
SELECT
'Improve supplier performance by reducing delivery delays.'
UNION ALL
SELECT
'Focus on reducing defective units to lower return rates.'
UNION ALL
SELECT
'Optimize warehouse operations with higher average delays.'
UNION ALL
SELECT
'Use the best-performing carriers for high-priority shipments.';
