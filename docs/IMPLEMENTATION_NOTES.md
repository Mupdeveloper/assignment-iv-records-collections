# Implementation Notes

## Application design

The Student Registration and Grading System stores students, courses, and the many-to-many relationship between them in `a4_enrollments`. A student may take many courses; a course may have many students. The composite primary key prevents the same student from enrolling twice in the same course and semester.

## Records and cursors

`update_student_email` uses `a4_students%ROWTYPE`, which matches the structure of one table row. `show_student_record` uses a user-defined record to combine student data and a calculated course count. `list_student_enrollments` demonstrates an explicit cursor with `OPEN`, `FETCH`, `EXIT WHEN cursor%NOTFOUND`, and `CLOSE`.

## Collections and bulk processing

`bulk_enroll_student` retrieves course IDs into an associative array using `BULK COLLECT`. It inserts the array contents using `FORALL`, so Oracle sends the DML work in bulk rather than issuing one context switch between PL/SQL and SQL for each loop iteration. This is more efficient than row-by-row processing when many rows are involved.

`SAVE EXCEPTIONS` lets the bulk operation continue after individual row errors. The procedure reads `SQL%BULK_EXCEPTIONS` to report each failed array index and Oracle error code, then raises a meaningful application error.

## Exception handling

The project handles predefined `NO_DATA_FOUND`, `TOO_MANY_ROWS`, and `DUP_VAL_ON_INDEX` exceptions. It also defines application errors for invalid emails, invalid scores, missing enrollments, and bulk errors through `RAISE_APPLICATION_ERROR`. Errors are reported rather than silently ignored.
