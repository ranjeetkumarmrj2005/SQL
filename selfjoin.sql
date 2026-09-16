-- Create Database
CREATE DATABASE SelfJoinPractice;
USE SelfJoinPractice;


-- Create Employees Table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    manager_id INT
);


-- Insert Employees
INSERT INTO Employees VALUES
(1, 'Raj', NULL),
(2, 'Ravi', 1),
(3, 'Aman', 1),
(4, 'Priya', 2),
(5, 'Neha', 2);


-- Check the table
SELECT * FROM Employees;


-- SELF JOIN
SELECT
    E.employee_name AS Employee,
    M.employee_name AS Manager
FROM Employees AS E
JOIN Employees AS M
ON E.manager_id = M.employee_id;