-- The Inventory Management department wants to improve stock visibility across warehouse locations to support effectivestock allocation, storage planning, and operational 
-- efficiency.How can product, inventory, and warehouse location records be combined to generate an inventory report showing each product's name, warehouse location, 
-- shelf, bin, and available,quantity at each location?
-- TABLES: Production_Product,Production_ProductInventory,Production_Location.

  
  SELECT
    P.ProductID,
    P.Name AS ProductName,
    L.Name AS WarehouseLocation,
    PI.Shelf,
    PI.Bin,
    PI.Quantity AS AvailableQuantity
FROM Production_Product AS P
INNER JOIN Production_ProductInventory AS PI
    ON P.ProductID = PI.ProductID
INNER JOIN Production_Location AS L
    ON PI.LocationID = L.LocationID
ORDER BY P.Name, L.Name ASC;
