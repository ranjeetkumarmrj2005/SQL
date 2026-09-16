-- =========================================
-- CREATE DATABASE
-- =========================================

DROP DATABASE IF EXISTS JoinPractice;
CREATE DATABASE JoinPractice;
USE JoinPractice;


-- =========================================
-- 1. EMPLOYEE TABLE
-- =========================================

CREATE TABLE employee (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    email_ID VARCHAR(100),
    phone_number VARCHAR(15),
    city_name VARCHAR(50)
);


-- Insert Employee Data

INSERT INTO employee
(id, first_name, last_name, age, email_ID, phone_number, city_name)
VALUES
(1, 'Aman', 'Proto', 32, 'aman@gmail.com', '898', 'Delhi'),
(2, 'Yagya', 'Narayan', 44, 'yagya@gmail.com', '222', 'Palam'),
(3, 'Rahul', 'BD', 22, 'rahul@gmail.com', '444', 'Kolkata'),
(4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', '666', 'Raipur'),
(5, 'PK', 'Pandey', 21, 'pk@gmail.com', '555', 'Jaipur');


-- =========================================
-- 2. CLIENT TABLE
-- =========================================

CREATE TABLE client (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    email_ID VARCHAR(100),
    phone_number VARCHAR(15),
    city_name VARCHAR(50),
    employee_ID INT,
    FOREIGN KEY (employee_ID) REFERENCES employee(id)
);


-- Insert Client Data

INSERT INTO client
(id, first_name, last_name, age, email_ID, phone_number, city_name, employee_ID)
VALUES
(1, 'Mac', 'Rogers', 47, 'mac@hotmail.com', '333', 'Kolkata', 3),
(2, 'Max', 'Poiner', 27, 'max@gmail.com', '222', 'Kolkata', 1),
(3, 'Peter', 'Jain', 24, 'peter@abc.com', '111', 'Delhi', 3),
(4, 'Sushant', 'Aggarwal', 23, 'sushant@yahoo.com', '45454', 'Hyderabad', 5),
(5, 'Pratap', 'Singh', 36, 'p@xyz.com', '77767', 'Mumbai', 2);

DESC client;
-- =========================================
-- 3. PROJECT TABLE
-- =========================================

CREATE TABLE project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    startdate DATE,
    employee_ID INT,
    clientID INT,
    FOREIGN KEY (employee_ID) REFERENCES employee(id),
    FOREIGN KEY (clientID) REFERENCES client(id)
);


-- Insert Project Data

INSERT INTO project
(project_id, employee_ID, project_name, startdate, clientID)
VALUES
(1, 1, 'A', '2021-04-21', 3),
(2, 2, 'B', '2021-03-12', 1),
(3, 3, 'C', '2021-01-16', 5),
(4, 3, 'D', '2021-04-27', 2),
(5, 5, 'E', '2021-05-01', 4);


SHOW CREATE TABLE project;
ALTER TABLE project
DROP FOREIGN KEY project_ibfk_2;
ALTER TABLE client
RENAME COLUMN id TO client_id;

ALTER TABLE project
ADD CONSTRAINT project_ibfk_2
FOREIGN KEY (clientID)
REFERENCES client(Client_ID);

-- =========================================
-- CHECK ALL TABLES
-- =========================================

SELECT * FROM employee;

SELECT * FROM client;

SELECT * FROM project;