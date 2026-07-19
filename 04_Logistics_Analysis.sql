-- ======================================================
-- LOGISTICS ANALYSIS
-- ======================================================

-- 1. Total Orders Shipped
SELECT COUNT(*) AS Total_Orders
FROM supply_chain;

-- 2. Orders by Shipping Mode
SELECT ShippingMode,
COUNT(*) AS Total_Orders
FROM supply_chain
GROUP BY ShippingMode
ORDER BY Total_Orders DESC;

-- 3. Orders by Carrier
SELECT Carrier,
COUNT(*) AS Total_Orders
FROM supply_chain
GROUP BY Carrier
ORDER BY Total_Orders DESC;

-- 4. Orders by Warehouse
SELECT Warehouse,
COUNT(*) AS Total_Orders
FROM supply_chain
GROUP BY Warehouse
ORDER BY Total_Orders DESC;

-- 5. Orders by Destination Country
SELECT DestinationCountry,
COUNT(*) AS Total_Orders
FROM supply_chain
GROUP BY DestinationCountry
ORDER BY Total_Orders DESC;

-- 6. Average Lead Time by Shipping Mode
SELECT ShippingMode,
ROUND(AVG(LeadTimeDays),2) AS Avg_Lead_Time
FROM supply_chain
GROUP BY ShippingMode
ORDER BY Avg_Lead_Time ASC;

-- 7. Average Delay by Shipping Mode
SELECT ShippingMode,
ROUND(AVG(DelayDays),2) AS Avg_Delay
FROM supply_chain
GROUP BY ShippingMode
ORDER BY Avg_Delay DESC;

-- 8. Average Lead Time by Carrier
SELECT Carrier,
ROUND(AVG(LeadTimeDays),2) AS Avg_Lead_Time
FROM supply_chain
GROUP BY Carrier
ORDER BY Avg_Lead_Time ASC;

-- 9. Average Delay by Carrier
SELECT Carrier,
ROUND(AVG(DelayDays),2) AS Avg_Delay
FROM supply_chain
GROUP BY Carrier
ORDER BY Avg_Delay DESC;

-- 10. Average Lead Time by Warehouse
SELECT Warehouse,
ROUND(AVG(LeadTimeDays),2) AS Avg_Lead_Time
FROM supply_chain
GROUP BY Warehouse
ORDER BY Avg_Lead_Time ASC;

-- 11. Average Delay by Warehouse
SELECT Warehouse,
ROUND(AVG(DelayDays),2) AS Avg_Delay
FROM supply_chain
GROUP BY Warehouse
ORDER BY Avg_Delay DESC;

-- 12. Delivery Status Distribution
SELECT DeliveryStatus,
COUNT(*) AS Total_Orders
FROM supply_chain
GROUP BY DeliveryStatus
ORDER BY Total_Orders DESC;

-- 13. Delivery Performance Distribution
SELECT DeliveryPerformance,
COUNT(*) AS Total_Orders
FROM supply_chain
GROUP BY DeliveryPerformance
ORDER BY Total_Orders DESC;

-- 14. Average Delay by Destination Country
SELECT DestinationCountry,
ROUND(AVG(DelayDays),2) AS Avg_Delay
FROM supply_chain
GROUP BY DestinationCountry
ORDER BY Avg_Delay DESC;

-- 15. Warehouse Revenue
SELECT Warehouse,
SUM(TotalCost) AS Revenue
FROM supply_chain
GROUP BY Warehouse
ORDER BY Revenue DESC;

-- 16. Carrier Revenue
SELECT Carrier,
SUM(TotalCost) AS Revenue
FROM supply_chain
GROUP BY Carrier
ORDER BY Revenue DESC;

-- 17. Shipping Mode Revenue
SELECT ShippingMode,
SUM(TotalCost) AS Revenue
FROM supply_chain
GROUP BY ShippingMode
ORDER BY Revenue DESC;

-- 18. Delayed Deliveries
SELECT *
FROM supply_chain
WHERE DelayDays > 0
ORDER BY DelayDays DESC;

-- 19. Orders Delivered On Time
SELECT COUNT(*) AS On_Time_Deliveries
FROM supply_chain
WHERE DeliveryStatus = 'Delivered';

-- 20. Top 10 Longest Delivery Delays
SELECT OrderID,
ProductName,
Carrier,
Warehouse,
DelayDays
FROM supply_chain
ORDER BY DelayDays DESC
LIMIT 10;
