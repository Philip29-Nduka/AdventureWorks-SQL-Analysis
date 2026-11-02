-- Products Priced Higher Than Products in a Selected Subcategory
-- The pricing manager wants to compare product prices within a particular subcategory.
-- Identify products whose list prices are higher than at least one product in subcategory 1.
-- Table:Production_Product
SELECT
    ProductID,
    Name AS ProductName,
    ListPrice
FROM Production_Product
WHERE ListPrice > ANY (
    SELECT ListPrice
    FROM Production_Product
    WHERE ProductSubcategoryID = 1
)
ORDER BY ListPrice DESC;
