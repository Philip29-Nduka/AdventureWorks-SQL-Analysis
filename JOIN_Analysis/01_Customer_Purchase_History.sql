PROJECT: AdventureWorks SQL Analysis

QUESTION 1: Customer Purchase History
SCENARIO:
The Customer Relationship Management (CRM) team wants to
understand customer purchasing behaviour by analysing
order history, purchase frequency and transaction values.
BUSINESS QUESTION:
Display customer IDs, customer names, sales order IDs,
order dates and total amounts paid.
TABLES:
Sales_Customer,Person_Person,Sales_SalesOrderHeader

  
  SELECT
    C.CustomerID,
    CONCAT_WS(' ', P.FirstName, P.MiddleName, P.LastName) AS CustomerName,
    SOH.SalesOrderID,
    SOH.OrderDate,
    SOH.TotalDue AS TotalAmountPaid
FROM Sales_Customer AS C
INNER JOIN Person_Person AS P
    ON C.PersonID = P.BusinessEntityID
INNER JOIN Sales_SalesOrderHeader AS SOH
    ON C.CustomerID = SOH.CustomerID;
