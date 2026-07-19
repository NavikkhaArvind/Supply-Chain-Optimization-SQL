-- ======================================================
-- INVENTORY ANALYSIS
-- ======================================================

-- 1. Total Inventory Available
SELECT SUM(InventoryLevel) AS Total_Inventory
FROM supply_chain;

-- 2. Average Inventory Level
SELECT ROUND(AVG(InventoryLevel),2) AS Average_Inventory
FROM supply_chain;

-- 3. Inventory by Product
SELECT ProductName,
SUM(InventoryLevel) AS Inventory
FROM supply_chain
GROUP BY ProductName
ORDER BY Inventory DESC;

-- 4. Inventory by Category
SELECT Category,
SUM(InventoryLevel) AS Inventory
FROM supply_chain
GROUP BY Category
ORDER BY Inventory DESC;

-- 5. Inventory by Warehouse
SELECT Warehouse,
SUM(InventoryLevel) AS Inventory
FROM supply_chain
GROUP BY Warehouse
ORDER BY Inventory DESC;

-- 6. Stock Status Distribution
SELECT StockStatus,
COUNT(*) AS Total_Products
FROM supply_chain
GROUP BY StockStatus;

-- 7. Products with Low Stock
SELECT OrderID,
ProductName,
InventoryLevel,
StockStatus
FROM supply_chain
WHERE StockStatus='Low';

-- 8. Products with Out of Stock
SELECT OrderID,
ProductName,
InventoryLevel,
StockStatus
FROM supply_chain
WHERE StockStatus='Out of Stock';

-- 9. Products with High Stock
SELECT OrderID,
ProductName,
InventoryLevel,
StockStatus
FROM supply_chain
WHERE StockStatus='High';

-- 10. Top 10 Products with Highest Inventory
SELECT ProductName,
InventoryLevel
FROM supply_chain
ORDER BY InventoryLevel DESC
LIMIT 10;

-- 11. Top 10 Products with Lowest Inventory
SELECT ProductName,
InventoryLevel
FROM supply_chain
ORDER BY InventoryLevel ASC
LIMIT 10;

-- 12. Defective Units by Product
SELECT ProductName,
SUM(DefectiveUnits) AS Total_Defective
FROM supply_chain
GROUP BY ProductName
ORDER BY Total_Defective DESC;

-- 13. Defective Units by Category
SELECT Category,
SUM(DefectiveUnits) AS Total_Defective
FROM supply_chain
GROUP BY Category
ORDER BY Total_Defective DESC;

-- 14. Defective Units by Supplier
SELECT SupplierName,
SUM(DefectiveUnits) AS Total_Defective
FROM supply_chain
GROUP BY SupplierName
ORDER BY Total_Defective DESC;

-- 15. Average Return Rate by Category
SELECT Category,
ROUND(AVG(ReturnRate),2) AS Avg_ReturnRate
FROM supply_chain
GROUP BY Category
ORDER BY Avg_ReturnRate DESC;

-- 16. Products with Highest Return Rate
SELECT ProductName,
ReturnRate
FROM supply_chain
ORDER BY ReturnRate DESC
LIMIT 10;

-- 17. Warehouse with Lowest Inventory
SELECT Warehouse,
SUM(InventoryLevel) AS Inventory
FROM supply_chain
GROUP BY Warehouse
ORDER BY Inventory ASC;

-- 18. Inventory by Supplier
SELECT SupplierName,
SUM(InventoryLevel) AS Inventory
FROM supply_chain
GROUP BY SupplierName
ORDER BY Inventory DESC;

-- 19. Inventory by Supplier Country
SELECT SupplierCountry,
SUM(InventoryLevel) AS Inventory
FROM supply_chain
GROUP BY SupplierCountry
ORDER BY Inventory DESC;

-- 20. Inventory Summary
SELECT
COUNT(DISTINCT ProductID) AS Total_Products,
SUM(InventoryLevel) AS Total_Inventory,
AVG(InventoryLevel) AS Average_Inventory,
SUM(DefectiveUnits) AS Total_Defective_Units
FROM supply_chain;
