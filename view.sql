
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    salary DECIMAL(10, 2)
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);


INSERT INTO Departments VALUES 
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Sales');

INSERT INTO Employees VALUES
(101, 'Alice', 1, 60000),
(102, 'Bob', 2, 75000),
(103, 'Charlie', 3, 90000),
(104, 'David', 3, 85000),
(105, 'Eve', 4, 65000);


CREATE VIEW Employee_Department_View AS
SELECT 
    e.name AS Employee_Name,
    d.department_name AS Department
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id;

SELECT * FROM Employee_Department_View;

CREATE VIEW High AS
SELECT name, salary
FROM Employees
WHERE salary > 70000;

SELECT * FROM High;

CREATE VIEW Department_Avg_Salary AS
SELECT 
    d.department_name,
    AVG(e.salary) AS Avg_Salary
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
GROUP BY d.department_name;

SELECT * FROM Department_Avg_Salary;

CREATE VIEW HR_Employees AS
SELECT * FROM Employees
WHERE department_id = 1
WITH CHECK OPTION;

SELECT * FROM HR_Employees;


CREATE TABLE Employee_Summary AS
SELECT department_id, COUNT(*) AS Total_Employees
FROM Employees
GROUP BY department_id;

SELECT * FROM Employee_Summary;

DROP VIEW IF EXISTS High;

SHOW FULL TABLES WHERE TABLE_TYPE = 'VIEW';

SHOW CREATE VIEW Employee_Department_View;
SHOW CREATE VIEW Department_Avg_Salary;


