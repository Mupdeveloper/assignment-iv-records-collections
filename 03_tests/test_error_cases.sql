SET SERVEROUTPUT ON

PROMPT === Invalid email: user-defined exception and RAISE_APPLICATION_ERROR ===
BEGIN
    register_student(7, 'Invalid', 'Email', 'not-an-email', 'Information Management');
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Expected error: ' || SQLERRM);
END;
/

PROMPT === Missing student: NO_DATA_FOUND ===
DECLARE
    v_email VARCHAR2(100);
BEGIN
    v_email := get_student_email(999);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Expected error: ' || SQLERRM);
END;
/

PROMPT === Too many rows ===
DECLARE
    v_name VARCHAR2(101);
BEGIN
    v_name := get_single_active_student;
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Expected error: ' || SQLERRM);
END;
/

PROMPT === Invalid score ===
BEGIN
    record_grade(1, 101, '2026A', 105);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Expected error: ' || SQLERRM);
END;
/

PROMPT === Missing enrollment: SQL%NOTFOUND and application error ===
BEGIN
    record_grade(999, 101, '2026A', 80);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Expected error: ' || SQLERRM);
END;
/

PROMPT === Bulk DML errors: duplicate enrollments ===
BEGIN
    bulk_enroll_student(6, '2026A');
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Expected error: ' || SQLERRM);
END;
/
