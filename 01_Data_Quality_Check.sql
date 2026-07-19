-- ====================================================
-- DATA QUALITY CHECK
-- ====================================================

-- Total Records
SELECT COUNT(*) AS Total_Records
FROM supply_chain;

-- View Dataset
SELECT *
FROM supply_chain;

-- Check NULL Values
SELECT *
FROM supply_chain
WHERE OrderID IS NULL
   OR ProductName IS NULL
   OR SupplierName IS NULL
   OR Category IS NULL;

-- Duplicate Order IDs
SELECT OrderID,
COUNT(*) AS Duplicate_Count
FROM supply_chain
GROUP BY OrderID
HAVING COUNT(*) > 1;

-- Negative Quantity
SELECT *
FROM supply_chain
WHERE OrderQuantity < 0;

-- Invalid Price
SELECT *
FROM supply_chain
WHERE UnitPrice <= 0;

-- Invalid Inventory
SELECT *
FROM supply_chain
WHERE InventoryLevel < 0;

-- Negative Lead Time
SELECT *
FROM supply_chain
WHERE LeadTimeDays < 0;

-- Negative Delay
SELECT *
FROM supply_chain
WHERE DelayDays < 0;

-- Distinct Categories
SELECT DISTINCT Category
FROM supply_chain;

-- Distinct Suppliers
SELECT DISTINCT SupplierName
FROM supply_chain;

-- Distinct Warehouses
SELECT DISTINCT Warehouse
FROM supply_chain;

-- Distinct Countries
SELECT DISTINCT DestinationCountry
FROM supply_chain;

-- Distinct Risk Levels
SELECT DISTINCT RiskLevel
FROM supply_chain;

-- Distinct Delivery Status
SELECT DISTINCT DeliveryStatus
FROM supply_chain;
