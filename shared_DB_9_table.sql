

DROP DATABASE IF EXISTS PracticeBookDB;
CREATE DATABASE PracticeBookDB;
USE PracticeBookDB;

-- 1. DEPARTMENTS
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Engineering'),
(2, 'Sales'),
(3, 'Marketing'),
(4, 'Human Resources'),
(5, 'Finance');

-- 2. EMPLOYEES
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    city VARCHAR(50),
    department_id INT,
    manager_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

INSERT INTO employees (employee_id, first_name, last_name, email, salary, hire_date, city, department_id, manager_id) VALUES
(101, 'Alex', 'Morgan', 'alex.morgan@example.com', 120000.00, '2019-01-15', 'New York', 1, NULL),
(102, 'Sara', 'Connor', 'sara.connor@example.com', 95000.00, '2020-03-20', 'Chicago', 1, 101),
(103, 'James', 'Miller', 'james.miller@example.com', 82000.00, '2021-06-01', 'Austin', 1, 101),
(104, 'Emily', 'Davis', 'emily.davis@example.com', 75000.00, '2022-02-10', 'New York', 2, 101),
(105, 'Michael', 'Brown', 'michael.brown@example.com', 68000.00, '2021-09-15', 'Austin', 2, 104),
(106, 'Rachel', 'Green', 'rachel.green@example.com', 64000.00, '2020-11-05', 'Chicago', 3, 101),
(107, 'David', 'Clark', 'david.clark@example.com', 58000.00, '2023-01-12', 'New York', 4, 101),
(108, 'Lisa', 'Ray', 'lisa.ray@example.com', 91000.00, '2020-08-18', 'Austin', 5, 101);

-- 3. CUSTOMERS
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50),
    signup_date DATE
);

INSERT INTO customers (customer_id, customer_name, email, city, country, signup_date) VALUES
(1, 'Alice Smith', 'alice@gmail.com', 'New York', 'USA', '2022-01-10'),
(2, 'Bob Johnson', 'bob@yahoo.com', 'London', 'UK', '2022-02-14'),
(3, 'Charlie Lee', 'charlie@gmail.com', 'Toronto', 'Canada', '2022-03-05'),
(4, 'Diana Patel', 'diana@outlook.com', 'Mumbai', 'India', '2022-05-19'),
(5, 'Ethan Hall', 'ethan@gmail.com', 'Sydney', 'Australia', '2022-07-22'),
(6, 'Fiona White', 'fiona@yahoo.com', 'Chicago', 'USA', '2022-09-01'),
(7, 'George King', 'george@gmail.com', 'Austin', 'USA', '2023-01-11');

-- 4. PRODUCTS
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50), 
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);

INSERT INTO products (product_id, product_name, category, price, stock_quantity) VALUES
(201, 'Wireless Mouse', 'Electronics', 25.00, 150),
(202, 'Mechanical Keyboard', 'Electronics', 85.00, 60),
(203, 'HD Monitor 27-inch', 'Electronics', 220.00, 30),
(204, 'Ergonomic Desk Chair', 'Furniture', 180.00, 45),
(205, 'Standing Desk Converter', 'Furniture', 130.00, 20),
(206, 'USB-C Multiport Hub', 'Accessories', 45.00, 100),
(207, 'Noise Cancelling Headphones', 'Electronics', 150.00, 40);

-- 5. ORDERS
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    order_date DATE,
    status VARCHAR(50),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO orders (order_id, customer_id, employee_id, order_date, status, total_amount) VALUES
(1001, 1, 104, '2023-01-15', 'Delivered', 245.00),
(1002, 2, 104, '2023-01-18', 'Delivered', 85.00),
(1003, 3, 105, '2023-02-01', 'Delivered', 400.00),
(1004, 1, 105, '2023-02-14', 'Delivered', 130.00),
(1005, 4, 104, '2023-03-05', 'Shipped', 195.00),
(1006, 5, 105, '2023-03-20', 'Pending', 25.00),
(1007, 6, 104, '2023-04-02', 'Cancelled', 220.00);

-- 6. ORDER_ITEMS
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1001, 201, 1, 25.00),
(2, 1001, 203, 1, 220.00),
(3, 1002, 202, 1, 85.00),
(4, 1003, 204, 1, 180.00),
(5, 1003, 203, 1, 220.00),
(6, 1004, 205, 1, 130.00),
(7, 1005, 207, 1, 150.00),
(8, 1005, 206, 1, 45.00),
(9, 1006, 201, 1, 25.00),
(10, 1007, 203, 1, 220.00);

-- 7. PAYMENTS
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO payments (payment_id, order_id, payment_date, amount, payment_method, payment_status) VALUES
(501, 1001, '2023-01-15', 245.00, 'Card', 'Success'),
(502, 1002, '2023-01-18', 85.00, 'UPI', 'Success'),
(503, 1003, '2023-02-01', 400.00, 'Card', 'Success'),
(504, 1004, '2023-02-14', 130.00, 'Cash', 'Success'),
(505, 1005, '2023-03-05', 195.00, 'UPI', 'Success'),
(506, 1006, '2023-03-20', 25.00, 'UPI', 'Success'),
(507, 1007, '2023-04-02', 220.00, 'Card', 'Refunded');

-- 8. PROJECTS
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    start_date DATE,
    end_date DATE,
    budget DECIMAL(10,2)
);

INSERT INTO projects (project_id, project_name, start_date, end_date, budget) VALUES
(301, 'Cloud Migration', '2023-01-01', '2023-06-30', 50000.00),
(302, 'CRM Modernization', '2023-02-15', NULL, 75000.00),
(303, 'Brand Relaunch', '2023-03-01', '2023-05-31', 30000.00),
(304, 'ERP Overhaul', '2023-04-01', NULL, 120000.00);

-- 9. EMPLOYEE_PROJECTS
CREATE TABLE employee_projects (
    employee_id INT,
    project_id INT,
    hours_worked DECIMAL(10,2),
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO employee_projects (employee_id, project_id, hours_worked) VALUES
(101, 301, 45.50),
(102, 301, 120.00),
(103, 301, 95.00),
(102, 302, 60.00),
(104, 302, 40.00),
(106, 303, 85.00),
(108, 304, 55.00);

-- Final Check
SHOW TABLES;

-- Pi --
SELECT * 
FROM employees;

SELECT first_name, last_name,salary 
FROM employees;

SELECT * 
FROM employees 
WHERE city='New York';

SELECT * 
FROM employees 
WHERE salary>75000;

SELECT first_name ,last_name, salary
FROM employees 
WHERE salary>75000;

SELECT *
FROM employees 
WHERE hire_date>'2023-01-01';

SELECT first_name,last_name,salary
FROM employees 
ORDER BY salary DESC;

SELECT first_name,last_name,salary
FROM employees 
ORDER BY salary DESC
LIMIT 5;

SELECT customer_name,city,country
FROM customers
WHERE country ='USA';

SELECT product_name,category,product_id
FROM products
WHERE price>130.0;

SELECT status,order_id
FROM orders
WHERE status='delevered';

SELECT DISTINCT country
FROM customers;

SELECT product_name,category, product_id
FROM products
WHERE category='electronics';


SELECT first_name, last_name,salary
FROM employees
WHERE salary>40000 AND salary<80000;

SELECT first_name, last_name,salary
FROM employees
WHERE salary BETWEEN 40000 AND 80000;

SELECT first_name, last_name,salary
FROM employees
WHERE salary BETWEEN 40000 AND 80000;


SELECT customer_name,city
FROM customers
WHERE city IN('New York','London');


SELECT customer_name,city
FROM customers
WHERE customer_name LIKE 'A%';

SELECT customer_name,city
FROM customers
WHERE customer_name LIKE '%A%';

SELECT customer_name,city
FROM customers
WHERE customer_name LIKE '%A';
