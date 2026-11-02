CREATE OR REPLACE FUNCTION get_single_active_student
RETURN VARCHAR2 AS
    v_name VARCHAR2(101);
BEGIN
    -- This deliberately requires one row, so the test can demonstrate TOO_MANY_ROWS.
    SELECT first_name || ' ' || last_name INTO v_name
    FROM a4_students
    WHERE status = 'ACTIVE';
    RETURN v_name;
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(-20042, 'More than one active student exists; use a cursor or add a filter.');
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20043, 'No active student exists.');
END get_single_active_student;
/
SHOW ERRORS
