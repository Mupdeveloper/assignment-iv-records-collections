CREATE OR REPLACE PROCEDURE record_grade (
    p_student_id IN a4_enrollments.student_id%TYPE,
    p_course_id  IN a4_enrollments.course_id%TYPE,
    p_semester   IN a4_enrollments.semester%TYPE,
    p_score      IN a4_enrollments.score%TYPE
) AS
    e_invalid_score EXCEPTION;
BEGIN
    IF p_score < 0 OR p_score > 100 THEN
        RAISE e_invalid_score;
    END IF;

    UPDATE a4_enrollments
    SET score = p_score
    WHERE student_id = p_student_id
      AND course_id = p_course_id
      AND semester = p_semester;

    IF SQL%NOTFOUND THEN
        RAISE_APPLICATION_ERROR(-20020, 'Enrollment was not found; no grade was recorded.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Grade updated. Rows affected: ' || SQL%ROWCOUNT);
    END IF;
EXCEPTION
    WHEN e_invalid_score THEN
        RAISE_APPLICATION_ERROR(-20021, 'Score must be between 0 and 100.');
END record_grade;
/
SHOW ERRORS
