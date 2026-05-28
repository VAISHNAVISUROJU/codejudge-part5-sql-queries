-- 1. Update invalid email safely

SELECT student_id, email
FROM students
WHERE email NOT LIKE '%@%.%';

UPDATE students
SET email = 'updated@gmail.com'
WHERE student_id = 101;

SELECT *
FROM students
WHERE student_id = 101;

-- Safe because WHERE clause targets only one row.


-- 2. Update missing batch

SELECT *
FROM students
WHERE batch_id IS NULL;

UPDATE students
SET batch_id = 2
WHERE student_id = 105;

SELECT *
FROM students
WHERE student_id = 105;

-- Safe because primary key condition is used.


-- 3. Correct negative score

SELECT submission_id, score
FROM submissions
WHERE score < 0;

UPDATE submissions
SET score = 0
WHERE submission_id = 501;

SELECT *
FROM submissions
WHERE submission_id = 501;

-- Safe because only one submission is modified.


-- 4. Fix invalid submission status

SELECT submission_id, status
FROM submissions
WHERE status = 'done';

UPDATE submissions
SET status = 'successful'
WHERE submission_id = 601;

SELECT *
FROM submissions
WHERE submission_id = 601;

-- Safe because targeted update is used.
