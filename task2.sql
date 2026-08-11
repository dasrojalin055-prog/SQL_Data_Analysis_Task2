-- Create Students table
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Insert Students
INSERT INTO students (id, name) VALUES
(1, 'Rahul'),
(2, 'Priya'),
(3, 'Amit'),
(4, 'Sneha'),
(5, 'Riya');
-- SQL Data Analysis Internship - Task 2

-- Create Courses table
CREATE TABLE courses (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Create Enrollments table
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    grade DECIMAL(5,2),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);
-- Insert Courses
INSERT INTO courses (id, name) VALUES
(1, 'Data Science'),
(2, 'Python'),
(3, 'SQL'),
(4, 'Java');

-- Insert Enrollments
INSERT INTO enrollments (student_id, course_id, grade) VALUES
(1, 1, 85),
(1, 3, 90),
(2, 1, 72),
(2, 2, 65),
(3, 2, 88),
(3, 3, 95),
(4, 4, 78),
(5, 1, 35),
(5, 3, 42);
-- 1. List all students enrolled in each course
SELECT c.name AS course_name, s.name AS student_name
FROM enrollments e
JOIN students s ON e.student_id = s.id
JOIN courses c ON e.course_id = c.id
ORDER BY c.name, s.name;


-- 2. Find average grade per course
SELECT c.name AS course_name, AVG(e.grade) AS average_grade
FROM enrollments e
JOIN courses c ON e.course_id = c.id
GROUP BY c.id, c.name;


-- 3. Find top 3 students overall
SELECT s.name AS student_name, AVG(e.grade) AS average_grade
FROM enrollments e
JOIN students s ON e.student_id = s.id
GROUP BY s.id, s.name
ORDER BY average_grade DESC
LIMIT 3;


-- 4. Count students who failed
SELECT COUNT(DISTINCT student_id) AS failed_students
FROM enrollments
WHERE grade < 40;