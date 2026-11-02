--  Products Above Average Cost
-- Management wants to identify products with standard costs higher than the average cost of all products.
-- Question: Display the product ID, product name, and standard cost for products above the overall average.
-- TABLES:Production_Product


SELECT
    ProductID,
    Name AS ProductName,
    StandardCost
FROM Production_Product
WHERE StandardCost > (
    SELECT AVG(StandardCost)
    FROM Production_Product
)
ORDER BY StandardCost DESC;
