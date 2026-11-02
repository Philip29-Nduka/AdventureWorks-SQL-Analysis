--  Products Compared With Average Standard Cost
-- The finance team wants to compare individual product costs against the overall average.
-- Display each product's ID, name, standard cost, and the average standard cost of all products.
-- Table:production_Product Production_Product

SELECT
    ProductID,
    Name AS ProductName,
    StandardCost,
    (
        SELECT AVG(StandardCost)
        FROM Production_Product
    ) AS AverageStandardCost
FROM Production_Product
ORDER BY StandardCost DESC;
i need the table
