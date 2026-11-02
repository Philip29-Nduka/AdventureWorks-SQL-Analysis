-- Sales Territory Performance
-- The Sales and Business Development department seeks to evaluate revenue performance across geographical territories to identify high-performing regions,
-- assess regional sales contributions, and support strategic resource allocation and market development decisions.
-- How can sales transaction records be integrated with sales territory and geographical information to generate a regional performance report showing each
-- sales territory, its corresponding country or region, and total sales revenue, ranked from highest to lowest, to enable management to compare regional
-- performance and identify key revenue-generating markets?
--  Tables: Sales_SalesOrderHeader, Sales_SalesTerritory, Person_CountryRegion.


SELECT
    ST.TerritoryID,
    ST.Name AS SalesTerritory,
    CR.Name AS CountryRegion,
    SUM(SOH.TotalDue) AS TotalSalesRevenue
FROM Sales_SalesOrderHeader AS SOH
INNER JOIN Sales_SalesTerritory AS ST
    ON SOH.TerritoryID = ST.TerritoryID
INNER JOIN Person_CountryRegion AS CR
    ON ST.CountryRegionCode = CR.CountryRegionCode
GROUP BY ST.TerritoryID,ST.Name,CR.Name
ORDER BY TotalSalesRevenue DESC;
