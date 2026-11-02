CREATE OR REPLACE FUNCTION calculate_student_average (
    p_student_id IN a4_students.student_id%TYPE
) RETURN NUMBER AS
    v_average NUMBER(5,2);
BEGIN
    SELECT AVG(score) INTO v_average
    FROM a4_enrollments
    WHERE student_id = p_student_id;

    IF v_average IS NULL THEN
        RAISE_APPLICATION_ERROR(-20040, 'No graded enrollments exist for student ' || p_student_id || '.');
    END IF;

    RETURN ROUND(v_average, 2);
END calculate_student_average;
/
SHOW ERRORS
