
DROP TABLE Employees;

CREATE TABLE Employees (
  EmpID SERIAL PRIMARY KEY,
  EmpName VARCHAR(50) NOT NULL,
  DepartmentID INT,
  Salary INT,
  JoinDate DATE
);

INSERT INTO Employees(EmpName,DepartmentID,Salary,JoinDate)
 VALUES
('Alice', 101, 70000, '2020-03-01'),
('Bob', 102, 60000, '2019-06-23'),
('Charlie', 101, 80000, '2021-01-15'),
('David', 103, 75000, '2022-11-30'),
('Eve', 102, 72000, '2020-08-09');

SELECT * FROM Employees;


CREATE TABLE Departments (
  DepartmentID SERIAL PRIMARY KEY,
  DepartmentName VARCHAR(50)
);

DROP TABLE Departments;

INSERT INTO Departments VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance');

SELECT * FROM Departments;

CREATE TABLE Projects (
  ProjectID SERIAL PRIMARY KEY,
  ProjectName VARCHAR(100),
  EmpID INT,
  Status VARCHAR(20)
);

INSERT INTO Projects(ProjectName,EmpID,Status) 
VALUES
('Website Redesign', 1, 'Completed'),
('App Development', 2, 'In Progress'),
('Audit Preparation', 4, 'Completed'),
('Server Migration', 2, 'Completed'),
('Training', 3, 'Pending');

SELECT * FROM Projects;

--List all employees and their department names.
SELECT * FROM employees
INNER JOIN departments on employees.DepartmentID = departments.DepartmentID;

--Find employees who joined after January 1, 2020.

SELECT empname,EXTRACT(MONTH FROM joindate) FROM employees
WHERE EXTRACT(MONTH FROM joindate) > 1

--!Get the average salary in each department.
SELECT departmentname, avg(salary) FROM employees
JOIN departments ON employees.DepartmentID = departments.DepartmentID
GROUP BY departmentname

SELECT departmentname, avg(salary) FROM employees
INNER JOIN departments USING(departmentId)
GROUP BY departmentname;

--! Find the highest paid employee.
SELECT empname,salary FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);
SELECT MAX(salary) FROM employees;

--! Count how many projects each employee is working on.
SELECT empname, COUNT(projectid) FROM employees
LEFT JOIN projects on employees.empid = projects.empid
GROUP BY empname

SELECT empname, COUNT(p.ProjectID) AS ProjectCount
FROM Employees e
LEFT JOIN Projects p ON e.EmpID = p.EmpID
GROUP BY empname;

--List employees not assigned to any project.
SELECT empname
FROM employees
LEFT join projects USING(empid)
WHERE projectid IS NULL


--Get names of employees working on completed projects.
SELECT empname, Status from employees
LEFT JOIN projects USING(empid)
WHERE status = 'Completed';

--Find the department with the most employees.
SELECT departmentname, COUNT(empid) FROM departments
LEFT JOIN employees USING(departmentid)
GROUP BY departmentname
ORDER BY count DESC
LIMIT 1 

SELECT departmentname, COUNT(empid) FROM departments
LEFT JOIN employees USING(departmentid)
GROUP BY departmentname
