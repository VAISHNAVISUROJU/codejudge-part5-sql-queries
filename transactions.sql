-- TRANSACTION 1 : Insert submission and result together

BEGIN TRANSACTION;

INSERT INTO submissions
(submission_id, student_id, problem_id, score, status)
VALUES
(9001, 101, 301, 95, 'successful');

INSERT INTO test_results
(result_id, submission_id, status)
VALUES
(7001, 9001, 'passed');

COMMIT;

-- Result:
-- Both records inserted successfully.


-- TRANSACTION 2 : Rollback invalid enrollment

BEGIN TRANSACTION;

INSERT INTO enrollments
(enrollment_id, student_id, course_id)
VALUES
(5001, 9999, 101);

ROLLBACK;

-- Result:
-- Invalid enrollment cancelled completely.


-- TRANSACTION 3 : SAVEPOINT usage

BEGIN TRANSACTION;

UPDATE submissions
SET score = 80
WHERE submission_id = 501;

SAVEPOINT score_update;

UPDATE submissions
SET status = 'successful'
WHERE submission_id = 501;

ROLLBACK TO score_update;

COMMIT;

-- Result:
-- Score update saved.
-- Status update reverted.
