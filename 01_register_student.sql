CREATE OR REPLACE PROCEDURE register_student (
    p_student_id   IN a4_students.student_id%TYPE,
    p_first_name   IN a4_students.first_name%TYPE,
    p_last_name    IN a4_students.last_name%TYPE,
    p_email        IN a4_students.email%TYPE,
    p_program_name IN a4_students.program_name%TYPE
) AS
    e_invalid_email EXCEPTION;
BEGIN
    IF INSTR(p_email, '@') = 0 THEN
        RAISE e_invalid_email;
    END IF;

    INSERT INTO a4_students (student_id, first_name, last_name, email, program_name)
    VALUES (p_student_id, p_first_name, p_last_name, p_email, p_program_name);

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' student registered: ' || p_first_name || ' ' || p_last_name);
    END IF;
EXCEPTION
    WHEN e_invalid_email THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invalid email address. Include an @ symbol.');
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20002, 'Student ID or email already exists.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Registration failed: ' || SQLERRM);
END register_student;
/
SHOW ERRORS
