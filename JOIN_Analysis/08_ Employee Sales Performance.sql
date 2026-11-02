-- Employee Sales Performance
-- The Sales Director seeks to assess individual sales performance by evaluating the volume of sales orders managed by each salesperson and the total revenue generated.
-- This analysis will support performance monitoring, revenue accountability, and the identification of high-performing sales personnel.
-- How can salesperson records, personal information, and sales order transactions be integrated to generate a performance report showing each 
-- salesperson’s full name, the number of sales orders handled, and the total sales value, restricted to salespeople whose aggregate sales value exceeds 
-- $50,000?
-- Tables: Sales_SalesPerson, Person_Person, Sales_SalesOrderHeader.


SELECT
    SP.BusinessEntityID,
    CONCAT_WS(' ', PP.FirstName, PP.MiddleName, PP.LastName) AS FullName,
    COUNT(SOH.SalesOrderID) AS NumberOfOrders,
    SUM(SOH.SubTotal) AS TotalSalesValue
FROM Sales_SalesPerson AS SP
INNER JOIN Person_Person AS PP
    ON SP.BusinessEntityID = PP.BusinessEntityID
INNER JOIN Sales_SalesOrderHeader AS SOH
    ON SP.BusinessEntityID = SOH.SalesPersonID
GROUP BY SP.BusinessEntityID,PP.FirstName,PP.MiddleName,PP.LastName
HAVING SUM(SOH.SubTotal) > 50000
ORDER BY TotalSalesValue DESC;
