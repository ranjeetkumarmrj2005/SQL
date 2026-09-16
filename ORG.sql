

CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker(
	WORKER_ID	INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME VARCHAR(255),
    LAST_NAME VARCHAR(255),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT VARCHAR(255)
);

INSERT INTO Worker
    (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
    (001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
    (002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
    (003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
    (004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
    (005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
    (006, 'Vipul', 'Diwan', 75000, '14-06-11 09.00.00', 'Account'),
    (007, 'Satish', 'Kumar', 95000, '14-01-20 09.00.00', 'Account'),
    (008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

SELECT * FROM Worker;

CREATE TABLE Bonus (
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT(10),
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
    (001, 5000, '16-02-20'),
    (002, 3000, '16-06-11'),
    (003, 4000, '16-02-20'),
    (001, 4500, '16-02-20'),
    (002, 3500, '16-06-11');
    
CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
    (001, 'Manager', '2016-02-20 00:00:00'),
    (002, 'Executive', '2016-06-11 00:00:00'),
    (008, 'Executive', '2016-06-11 00:00:00'),
    (005, 'Manager', '2016-06-11 00:00:00'),
    (004, 'Asst. Manager', '2016-06-11 00:00:00'),
    (007, 'Executive', '2016-06-11 00:00:00'),
    (006, 'Lead', '2016-06-11 00:00:00'),
    (003, 'Lead', '2016-06-11 00:00:00');
    
    
SELECT * FROM Worker;
SELECT SALARY FROM Worker;
SELECT FIRST_NAME, SALARY FROM Worker;
SELECT 44+11;
SELECT now();
SELECT lcase('RANJEET');
SELECT * FROM Worker WHERE SALARY > 100000;
SELECT * FROM Worker WHERE DEPARTMENT= 'HR';

SELECT * FROM Worker WHERE SALARY BETWEEN  100000 AND 300000;
SELECT * FROM Worker WHERE DEPARTMENT ='HR' OR DEPARTMENT='Admin' OR DEPARTMENT='Account';
SELECT * FROM Worker WHERE DEPARTMENT IN('HR','Admin');
SELECT * FROM Worker WHERE DEPARTMENT NOT IN('HR','Admin');
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%i%';
select * from Worker where FIRST_NAME LIKE '%i%';
select * from Worker order by salary;
select * from Worker order by salary DESC;
select distinct department from worker;
select department from worker group by department;
select department, COUNT(department) from worker group by department;
select department, AVG(salary) from worker group by department;
select department, MIN(salary) from worker group by department;
select department, MAX(salary) from worker group by department;
select department, SUM(salary) from worker group by department;
select department, Count(department) from worker group by department HAVING COUNT(department) > 2;




