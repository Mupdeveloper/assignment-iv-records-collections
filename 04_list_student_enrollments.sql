CREATE OR REPLACE PROCEDURE list_student_enrollments (
    p_student_id IN a4_students.student_id%TYPE
) AS
    CURSOR c_enrollments IS
        SELECT c.course_code, c.course_name, e.semester, e.score
        FROM a4_enrollments e
        JOIN a4_courses c ON c.course_id = e.course_id
        WHERE e.student_id = p_student_id
        ORDER BY c.course_code;
    v_row c_enrollments%ROWTYPE;
    v_count PLS_INTEGER := 0;
BEGIN
    -- Explicit cursor: OPEN, FETCH every row, then CLOSE.
    OPEN c_enrollments;
    LOOP
        FETCH c_enrollments INTO v_row;
        EXIT WHEN c_enrollments%NOTFOUND;
        v_count := v_count + 1;
        DBMS_OUTPUT.PUT_LINE(v_row.course_code || ' | ' || v_row.course_name ||
                             ' | ' || v_row.semester || ' | Score: ' || NVL(TO_CHAR(v_row.score), 'Not graded'));
    END LOOP;
    CLOSE c_enrollments;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No enrollments found for student ' || p_student_id || '.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Rows fetched: ' || v_count);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        IF c_enrollments%ISOPEN THEN CLOSE c_enrollments; END IF;
        RAISE;
END list_student_enrollments;
/
SHOW ERRORS
