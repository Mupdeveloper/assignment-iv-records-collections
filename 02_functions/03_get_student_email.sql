CREATE OR REPLACE FUNCTION get_student_email (
    p_student_id IN a4_students.student_id%TYPE
) RETURN VARCHAR2 AS
    v_email a4_students.email%TYPE;
BEGIN
    SELECT email INTO v_email
    FROM a4_students
    WHERE student_id = p_student_id;
    RETURN v_email;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20041, 'Student ' || p_student_id || ' does not exist.');
END get_student_email;
/
SHOW ERRORS
