INSERT ALL
    INTO a4_students VALUES (1, 'Student', 'One', 'student1@example.edu', 'Information Management', 'ACTIVE', SYSDATE)
    INTO a4_students VALUES (2, 'Student', 'Two', 'student2@example.edu', 'Information Management', 'ACTIVE', SYSDATE)
    INTO a4_students VALUES (3, 'Student', 'Three', 'student3@example.edu', 'Computer Science', 'ACTIVE', SYSDATE)
    INTO a4_students VALUES (4, 'Student', 'Four', 'student4@example.edu', 'Business Administration', 'ACTIVE', SYSDATE)
    INTO a4_students VALUES (5, 'Student', 'Five', 'student5@example.edu', 'Information Management', 'INACTIVE', SYSDATE)
SELECT 1 FROM dual;

INSERT ALL
    INTO a4_courses VALUES (101, 'INSY8311', 'Database Development with PL/SQL', 3)
    INTO a4_courses VALUES (102, 'INSY8301', 'Database Systems', 3)
    INTO a4_courses VALUES (103, 'MATH1201', 'Discrete Mathematics', 3)
    INTO a4_courses VALUES (104, 'COMM1101', 'Academic Communication', 2)
SELECT 1 FROM dual;

INSERT ALL
    INTO a4_enrollments VALUES (1, 101, '2026A', 85, SYSDATE)
    INTO a4_enrollments VALUES (1, 102, '2026A', 78, SYSDATE)
    INTO a4_enrollments VALUES (2, 101, '2026A', 92, SYSDATE)
    INTO a4_enrollments VALUES (2, 103, '2026A', 88, SYSDATE)
    INTO a4_enrollments VALUES (3, 101, '2026A', 74, SYSDATE)
    INTO a4_enrollments VALUES (3, 104, '2026A', 81, SYSDATE)
    INTO a4_enrollments VALUES (4, 102, '2026A', 69, SYSDATE)
    INTO a4_enrollments VALUES (5, 104, '2026A', 95, SYSDATE)
SELECT 1 FROM dual;

COMMIT;
PROMPT Sample data inserted successfully.
