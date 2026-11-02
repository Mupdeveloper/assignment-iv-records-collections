CREATE OR REPLACE PROCEDURE show_student_record (
    p_student_id IN a4_students.student_id%TYPE
) AS
    TYPE t_student_summary IS RECORD (
        full_name    VARCHAR2(101),
        email        a4_students.email%TYPE,
        program_name a4_students.program_name%TYPE,
        course_count NUMBER
    );
    v_summary t_student_summary;
BEGIN
    SELECT s.first_name || ' ' || s.last_name,
           s.email,
           s.program_name,
           COUNT(e.course_id)
    INTO v_summary
    FROM a4_students s
    LEFT JOIN a4_enrollments e ON e.student_id = s.student_id
    WHERE s.student_id = p_student_id
    GROUP BY s.first_name, s.last_name, s.email, s.program_name;

    DBMS_OUTPUT.PUT_LINE('Student: ' || v_summary.full_name);
    DBMS_OUTPUT.PUT_LINE('Email: ' || v_summary.email);
    DBMS_OUTPUT.PUT_LINE('Program: ' || v_summary.program_name);
    DBMS_OUTPUT.PUT_LINE('Courses: ' || v_summary.course_count);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20012, 'Student ' || p_student_id || ' was not found.');
END show_student_record;
/
SHOW ERRORS
