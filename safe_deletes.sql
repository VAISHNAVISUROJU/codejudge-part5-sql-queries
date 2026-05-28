-- 1. Delete duplicate student records from staging table

SELECT student_id, COUNT(*)
FROM students_staging
GROUP BY student_id
HAVING COUNT(*) > 1;

DELETE FROM students_staging
WHERE rowid NOT IN
(
SELECT MIN(rowid)
FROM students_staging
GROUP BY student_id
);

SELECT student_id, COUNT(*)
FROM students_staging
GROUP BY student_id
HAVING COUNT(*) > 1;

-- Safe because only duplicate rows are removed.


-- 2. Delete orphan enrollments

SELECT *
FROM enrollments
WHERE student_id NOT IN
(
SELECT student_id
FROM students
);

DELETE FROM enrollments
WHERE student_id NOT IN
(
SELECT student_id
FROM students
);

SELECT *
FROM enrollments
WHERE student_id NOT IN
(
SELECT student_id
FROM students
);

-- Safe because invalid orphan records are deleted.
