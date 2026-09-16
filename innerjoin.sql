CREATE DATABASE JoinPractice;
USE JoinPractice;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    course_id INT
);
INSERT INTO Students VALUES
(1, 'Ravi', 101),
(2, 'Aman', 102),
(3, 'Priya', 103),
(4, 'Neha', 101),
(5, 'Karan', 105);

SELECT * FROM Students;

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);
INSERT INTO Courses VALUES
(101, 'CSE'),
(102, 'ECE'),
(103, 'IT'),
(104, 'ME');

SELECT * FROM Courses;

SELECT 
	Students.student_id AS StudentId,
    Students.student_name AS cName,
    Courses.course_name AS Course
FROM Students
INNER JOIN Courses
ON Students.course_id=Courses.course_id;

