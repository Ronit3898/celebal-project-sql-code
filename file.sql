WITH DepartmentAverages AS (
    SELECT
        d.Name AS DepartmentName,
        AVG(e.Salary) AS AverageSalary,
        COUNT(e.EmployeeID) AS NumberOfEmployees
    FROM
        Employees e
    JOIN
        Departments d ON e.DepartmentID = d.DepartmentID
    GROUP BY
        d.Name
),
OverallAverage AS (
    SELECT
        AVG(Salary) AS OverallAverageSalary
    FROM
        Employees
)
SELECT
    da.DepartmentName,
    da.AverageSalary,
    da.NumberOfEmployees
FROM
    DepartmentAverages da
JOIN
    OverallAverage oa ON da.AverageSalary > oa.OverallAverageSalary
ORDER BY
    da.DepartmentName;
