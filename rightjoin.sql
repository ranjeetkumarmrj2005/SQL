CREATE DATABASE RightJoinPractice;
USE RightJoinPractice;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    course_id INT
);

INSERT INTO Students VALUES
(1, 'Ravi', 101),
(2, 'Aman', 102),
(3, 'Priya', 103),
(4, 'Neha', 105),
(5, 'Karan', 106);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

INSERT INTO Courses VALUES
(101, 'CSE'),
(102, 'ECE'),
(103, 'IT'),
(104, 'ME');

SELECT * FROM Students;
SELECT * FROM Courses;

SELECT
    Students.student_id,
    Students.student_name,
    Students.course_id,
    Courses.course_name
FROM Students
Right JOIN Courses
ON Students.course_id = Courses.course_id;


SELECT *
FROM Courses
RIGHT JOIN Students
ON Students.course_id = Courses.course_id;