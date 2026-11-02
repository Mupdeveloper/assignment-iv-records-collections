CREATE OR REPLACE FUNCTION get_letter_grade (
    p_score IN NUMBER
) RETURN VARCHAR2 AS
BEGIN
    IF p_score IS NULL THEN
        RETURN 'Not graded';
    ELSIF p_score >= 80 THEN
        RETURN 'A';
    ELSIF p_score >= 70 THEN
        RETURN 'B';
    ELSIF p_score >= 60 THEN
        RETURN 'C';
    ELSIF p_score >= 50 THEN
        RETURN 'D';
    ELSE
        RETURN 'F';
    END IF;
END get_letter_grade;
/
SHOW ERRORS
