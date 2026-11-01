# Assignment IV - Records and Collections in Oracle PL/SQL

## Author

Mukunzi Prince

## Application

This project implements a Student Registration and Grading System. It manages students, courses, enrollments, and grades. The application demonstrates records, collections, implicit and explicit cursors, bulk processing, procedures, functions, and meaningful exception handling.

This is an individual implementation by Mukunzi Prince. The brief specifies a two-person group; a second member is not listed.

### Requirements

- Register students with unique IDs and email addresses.
- Maintain courses and credit values.
- Enroll students in courses by semester without duplicate enrollment.
- Record valid scores from 0 to 100, calculate each student's average, and map scores to letter grades.
- Report student details and course enrollments, including useful messages for missing records and invalid operations.

## Database relationships

`a4_students` has a one-to-many relationship with `a4_enrollments`. `a4_courses` also has a one-to-many relationship with `a4_enrollments`. Therefore, students and courses have a many-to-many relationship through enrollments.

## How to run

Connect to `PRACTICEPDB` in Oracle SQL Developer or SQL*Plus using your Oracle account. These scripts create only `A4_` tables and related program objects in that account's schema. Run `run_all.sql` to rebuild the sample schema, compile all program units, and execute both test files.

1. `00_schema/01_create_tables.sql`
2. `00_schema/02_insert_sample_data.sql`
3. Every file in `01_procedures/`, in numerical order
4. Every file in `02_functions/`, in numerical order
5. `03_tests/test_success_cases.sql`
6. `03_tests/test_error_cases.sql`

`01_create_tables.sql` intentionally removes only this project's three tables before recreating them, which makes a clean repeat possible.

## Evidence

Evidence PNGs in `evidence/` are formatted excerpts from the actual SQL*Plus verification output, showing table creation and sample data, program compilation, successful test cases, and expected exception handling. They are output excerpts rather than desktop screenshots.

## AI use disclosure

An AI assistant was used for guidance on project structure, PL/SQL concepts, code review, and explanations. I reviewed and executed the work and remain responsible for understanding and explaining the submitted code.
