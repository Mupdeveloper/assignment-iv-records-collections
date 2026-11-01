SET SERVEROUTPUT ON
@@00_schema/01_create_tables.sql
@@00_schema/02_insert_sample_data.sql
@@01_procedures/01_register_student.sql
@@01_procedures/02_update_student_email.sql
@@01_procedures/03_show_student_record.sql
@@01_procedures/04_list_student_enrollments.sql
@@01_procedures/05_record_grade.sql
@@01_procedures/06_remove_enrollment.sql
@@01_procedures/07_bulk_enroll_student.sql
@@02_functions/01_calculate_student_average.sql
@@02_functions/02_get_letter_grade.sql
@@02_functions/03_get_student_email.sql
@@02_functions/04_get_single_active_student.sql
@@03_tests/test_success_cases.sql
@@03_tests/test_error_cases.sql
