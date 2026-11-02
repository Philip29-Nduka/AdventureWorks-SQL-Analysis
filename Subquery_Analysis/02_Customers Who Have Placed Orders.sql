-- Customers Who Have Placed Orders
--The marketing team wants to identify customers who have purchased from the company.
-- Return customer IDs for customers whose IDs appear in the sales order header table.
-- Subquery in WHERE using IN.
-- TABLES:Sales_Customer,Sales_SalesOrderHeader.


SELECT
    CustomerID
FROM Sales_Customer
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Sales_SalesOrderHeader
)
ORDER BY CustomerID ASC;
