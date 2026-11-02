-- Product Category Analysis
 -- The product manager wants to understand which categories contribute to sales.
-- Display product category names, product names, quantities sold, and total sales revenue.
-- The Product Management department seeks to evaluate sales performance across product categories to identify key revenue contributors, assess product demand,
  -- and support strategic decisions regarding product development, inventory allocation, and sales planning.
--How can product, product subcategory, and sales transaction records be integrated to generate a comprehensive sales performance report showing product category names, 
  -- individual product names, quantities sold, and total sales revenue, thereby enabling management to assess category-level contributions and identify products that drive revenue?
Tables: Production_ProductCategory, Production_ProductSubcategory, Production_Product, Sales_SalesOrderDetail

SELECT
    PC.Name AS ProductCategory,
    PS.Name AS ProductSubcategory,
    P.Name AS ProductName,
    SUM(SOD.OrderQty) AS QuantitySold,
    SUM(SOD.LineTotal) AS TotalSalesRevenue
FROM Production_ProductCategory AS PC
INNER JOIN Production_ProductSubcategory AS PS
    ON PC.ProductCategoryID = PS.ProductCategoryID
INNER JOIN Production_Product AS P
    ON PS.ProductSubcategoryID = P.ProductSubcategoryID
INNER JOIN Sales_SalesOrderDetail AS SOD
    ON P.ProductID = SOD.ProductID
GROUP BY PC.Name,PS.Name,P.Name
ORDER BY TotalSalesRevenue DESC;
