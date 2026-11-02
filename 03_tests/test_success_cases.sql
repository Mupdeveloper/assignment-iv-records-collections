SET SERVEROUTPUT ON

PROMPT === 1. Register a new student: implicit INSERT cursor attributes ===
BEGIN
    register_student(6, 'Mukunzi', 'Prince', 'student6@example.edu', 'Information Management');
END;
/

PROMPT === 2. %ROWTYPE record and implicit UPDATE cursor attributes ===
BEGIN
    update_student_email(6, 'student6.updated@example.edu');
END;
/

PROMPT === 3. BULK COLLECT and FORALL ===
BEGIN
    bulk_enroll_student(6, '2026A');
END;
/

PROMPT === 4. User-defined record ===
BEGIN
    show_student_record(6);
END;
/

PROMPT === 5. Grade update and SQL%NOTFOUND demonstration path ===
BEGIN
    record_grade(6, 101, '2026A', 90);
END;
/

PROMPT === 6. Explicit cursor: OPEN, FETCH, CLOSE ===
BEGIN
    list_student_enrollments(6);
END;
/

PROMPT === 7. Stored functions called from SQL ===
COLUMN average_score FORMAT 990.00
COLUMN letter_grade FORMAT A12
SET LINESIZE 120
SELECT calculate_student_average(6) AS average_score,
       get_letter_grade(calculate_student_average(6)) AS letter_grade
FROM dual;

PROMPT === 8. Implicit DELETE cursor attributes ===
BEGIN
    remove_enrollment(5, 104, '2026A');
END;
/

COMMIT;
