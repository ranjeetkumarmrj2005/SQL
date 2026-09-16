-- Create Database
CREATE DATABASE CrossJoinPractice;
USE CrossJoinPractice;


-- Create Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);


-- Insert Students
INSERT INTO Students VALUES
(1, 'Ravi'),
(2, 'Aman'),
(3, 'Priya');


-- Create Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);


-- Insert Courses
INSERT INTO Courses VALUES
(101, 'CSE'),
(102, 'ECE');


-- Check Students
SELECT * FROM Students;


-- Check Courses
SELECT * FROM Courses;


-- CROSS JOIN
SELECT
    Students.student_id,
    Students.student_name,
    Courses.course_id,
    Courses.course_name
FROM Students
CROSS JOIN Courses;