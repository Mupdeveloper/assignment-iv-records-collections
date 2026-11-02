CREATE OR REPLACE PROCEDURE update_student_email (
    p_student_id IN a4_students.student_id%TYPE,
    p_new_email  IN a4_students.email%TYPE
) AS
    v_student a4_students%ROWTYPE;
BEGIN
    -- %ROWTYPE creates one record holding every a4_students column.
    SELECT * INTO v_student
    FROM a4_students
    WHERE student_id = p_student_id;

    UPDATE a4_students
    SET email = p_new_email
    WHERE student_id = p_student_id;

    IF SQL%ROWCOUNT = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Email changed for ' || v_student.first_name || ' ' || v_student.last_name);
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20010, 'Cannot update email: student ' || p_student_id || ' does not exist.');
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20011, 'Cannot update email: this email already belongs to another student.');
END update_student_email;
/
SHOW ERRORS
