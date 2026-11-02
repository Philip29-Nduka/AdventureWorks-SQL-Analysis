Employee and Departmental Workforce Analysis
The Human Resources (HR) department aims to strengthen workforce planning and improve the accuracy of employee records to support strategic staffing decisions,
 departmental resource allocation, and organisational reporting.
 How can employee, personal, employment, and departmental data be integrated to produce a comprehensive workforce directory containing each employee’s full name,
 job title, hire date, and current department, thereby providing management with reliable information for workforce analysis and planning?

SELECT
    E.BusinessEntityID,
    CONCAT_WS(' ', P.FirstName, P.MiddleName, P.LastName) AS FullName,
    E.JobTitle,
    E.HireDate,
    D.Name AS CurrentDepartment
FROM HumanResources_Employee AS E
INNER JOIN Person_Person AS P
    ON E.BusinessEntityID = P.BusinessEntityID
INNER JOIN HumanResources_EmployeeDepartmentHistory AS EDH
    ON E.BusinessEntityID = EDH.BusinessEntityID
INNER JOIN HumanResources_Department AS D
    ON EDH.DepartmentID = D.DepartmentID
WHERE EDH.EndDate IS NULL
    AND E.CurrentFlag = 1
ORDER BY FullName ASC;
