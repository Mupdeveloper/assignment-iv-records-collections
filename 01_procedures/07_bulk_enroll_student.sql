CREATE OR REPLACE PROCEDURE bulk_enroll_student (
    p_student_id IN a4_students.student_id%TYPE,
    p_semester   IN a4_enrollments.semester%TYPE
) AS
    TYPE t_course_ids IS TABLE OF a4_courses.course_id%TYPE INDEX BY PLS_INTEGER;
    v_course_ids t_course_ids;
    v_student_count PLS_INTEGER;
    e_bulk_errors EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_bulk_errors, -24381);
BEGIN
    SELECT COUNT(*) INTO v_student_count
    FROM a4_students
    WHERE student_id = p_student_id;

    IF v_student_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20030, 'Student ' || p_student_id || ' does not exist.');
    END IF;

 
    SELECT course_id BULK COLLECT INTO v_course_ids
    FROM a4_courses
    ORDER BY course_id;

    
    FORALL i IN INDICES OF v_course_ids SAVE EXCEPTIONS
        INSERT INTO a4_enrollments (student_id, course_id, semester, score)
        VALUES (p_student_id, v_course_ids(i), p_semester, NULL);

    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' enrollments inserted by FORALL.');
EXCEPTION
    WHEN e_bulk_errors THEN
        DBMS_OUTPUT.PUT_LINE('Bulk operation had ' || SQL%BULK_EXCEPTIONS.COUNT || ' row error(s).');
        FOR i IN 1 .. SQL%BULK_EXCEPTIONS.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('Array index ' || SQL%BULK_EXCEPTIONS(i).ERROR_INDEX ||
                                 ': ORA-' || SQL%BULK_EXCEPTIONS(i).ERROR_CODE);
        END LOOP;
        RAISE_APPLICATION_ERROR(-20031, 'Bulk enrollment completed with one or more errors.');
END bulk_enroll_student;
/
SHOW ERRORS
