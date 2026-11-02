Manufacturing Work Order Analysis
Business Scenario: The Production Management department seeks to improve oversight of manufacturing operations by monitoring work order activities, 
evaluating production output, and assessing material wastage and production costs. This analysis will support production planning, cost control, and 
 operational efficiency.How can manufacturing work order records be integrated with product information to generate a comprehensive production report showing 
each work order ID, product name, order quantity, scrapped quantity, and actual production cost where available, thereby enabling management to evaluate
 production performance, monitor wastage, and assess manufacturing cost efficiency?Tables: Production_WorkOrder, Production_Product
 
  
  SELECT
    W.WorkOrderID,
    P.Name AS ProductName,
    W.OrderQty,
    W.ScrappedQty,
    SUM(WR.ActualCost) AS ActualProductionCost
FROM Production_WorkOrder AS W
INNER JOIN Production_Product AS P
ON W.ProductID = P.ProductID
LEFT JOIN Production_WorkOrderRouting AS WR
ON W.WorkOrderID = WR.WorkOrderID
GROUP BY W.WorkOrderID,P.Name,W.OrderQty,W.ScrappedQty
ORDER BY W.WorkOrderID ASC;
