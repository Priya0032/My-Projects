CREATE DATABASE student_result_db;
USE student_result_db;
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100),
    class VARCHAR(20),
    gender VARCHAR(10)
);
CREATE TABLE subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(50)
);
CREATE TABLE results (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject_id INT,
    marks INT,
    FOREIGN KEY (student_id)
    REFERENCES students(student_id),

    FOREIGN KEY (subject_id)
    REFERENCES subjects(subject_id)
);
INSERT INTO students
(student_name,class,gender)

VALUES

('Rahul','10A','Male'),
('Priya','10A','Female'),
('Amit','10B','Male'),
('Neha','10B','Female'),
('Rohit','10A','Male');
INSERT INTO subjects(subject_name)

VALUES
('Math'),
('Science'),
('English'),
('Computer');
INSERT INTO results
(student_id,subject_id,marks)

VALUES

(1,1,85),
(1,2,78),
(1,3,90),
(1,4,88),

(2,1,92),
(2,2,95),
(2,3,89),
(2,4,94),

(3,1,70),
(3,2,68),
(3,3,72),
(3,4,75),

(4,1,88),
(4,2,91),
(4,3,85),
(4,4,87),

(5,1,60),
(5,2,65),
(5,3,58),
(5,4,70);
SELECT
s.student_name,
SUM(r.marks) AS total_marks

FROM students s
JOIN results r

ON s.student_id=r.student_id

GROUP BY s.student_name;
SELECT
s.student_name,

ROUND(
AVG(r.marks),2
) AS percentage

FROM students s

JOIN results r

ON s.student_id=r.student_id

GROUP BY s.student_name;
SELECT
s.class,

ROUND(
AVG(r.marks),2
) AS average_marks

FROM students s

JOIN results r

ON s.student_id=r.student_id

GROUP BY s.class;
SELECT
s.student_name,

SUM(r.marks) AS total_marks

FROM students s

JOIN results r

ON s.student_id=r.student_id

GROUP BY s.student_name

ORDER BY total_marks DESC

LIMIT 1;
SELECT
sub.subject_name,

ROUND(
AVG(r.marks),2
) AS avg_marks

FROM subjects sub

JOIN results r

ON sub.subject_id=r.subject_id

GROUP BY sub.subject_name;
SELECT
s.student_name,
r.marks

FROM students s

JOIN results r

ON s.student_id=r.student_id

WHERE r.marks < 40;
SELECT
sub.subject_name,

MAX(r.marks) AS highest_marks

FROM subjects sub

JOIN results r

ON sub.subject_id=r.subject_id

GROUP BY sub.subject_name;
SELECT
s.student_name,

SUM(r.marks) AS total_marks

FROM students s

JOIN results r

ON s.student_id=r.student_id

GROUP BY s.student_name

ORDER BY total_marks DESC

LIMIT 3;