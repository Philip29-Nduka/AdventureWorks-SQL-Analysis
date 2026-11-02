Customer and Sales Order Analysis Using RIGHT JOIN
The Adventure Works sales department wants to review all customer records alongside their sale
 transactions. Management wants to identify customers who have placed orders and retain sales transaction records even when a matching customer record is unavailable.
 Write an SQL query to display:
Customer ID,Customer's Full Name,Sales Order ID, Order Date,Subtotal,Total Amount Due
table:Sales_Customer,Person_Person,Sales_SalesOrderHeader.

SELECT
    C.CustomerID,
    CONCAT_WS(' ', P.FirstName, P.MiddleName, P.LastName) AS CustomerName,
    SOH.SalesOrderID,
    SOH.OrderDate,
    SOH.SubTotal,
    SOH.TotalDue
FROM Sales_Customer AS C
INNER JOIN Person_Person AS P
    ON C.PersonID = P.BusinessEntityID
RIGHT JOIN Sales_SalesOrderHeader AS SOH
    ON C.CustomerID = SOH.CustomerID
ORDER BY SOH.OrderDate DESC;
