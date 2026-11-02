CREATE OR REPLACE PROCEDURE remove_enrollment (
    p_student_id IN a4_enrollments.student_id%TYPE,
    p_course_id  IN a4_enrollments.course_id%TYPE,
    p_semester   IN a4_enrollments.semester%TYPE
) AS
BEGIN
    DELETE FROM a4_enrollments
    WHERE student_id = p_student_id
      AND course_id = p_course_id
      AND semester = p_semester;

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Enrollment removed. Rows deleted: ' || SQL%ROWCOUNT);
    ELSE
        RAISE_APPLICATION_ERROR(-20022, 'Enrollment was not found; nothing was deleted.');
    END IF;
END remove_enrollment;
/
SHOW ERRORS
