--  Customers With Above-Average Spending
--  Management wants to identify high-value customers.
--  Calculate each customer's total order amount, then return customers whose total spending is above the average customer spending.
--  Subquery in FROM, followed by an outer query using WHERE.
-- TABLES:Sales_SalesOrderHeader


SELECT
    CustomerID,
    TotalSpending
FROM (
    SELECT
        CustomerID,
        SUM(TotalDue) AS TotalSpending
    FROM Sales_SalesOrderHeader
    GROUP BY CustomerID
) AS CustomerSpending
WHERE TotalSpending > (
    SELECT AVG(TotalSpending)
    FROM (
        SELECT
            CustomerID,
            SUM(TotalDue) AS TotalSpending
        FROM Sales_SalesOrderHeader
        GROUP BY CustomerID
    ) AS AverageSpending
)
ORDER BY TotalSpending DESC;
