-- Student Registration and Grading System
-- Run this file while connected to your assignment schema in PRACTICEPDB.

SET SERVEROUTPUT ON

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE a4_enrollments CASCADE CONSTRAINTS PURGE';
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE a4_courses CASCADE CONSTRAINTS PURGE';
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE a4_students CASCADE CONSTRAINTS PURGE';
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

CREATE TABLE a4_students (
    student_id   NUMBER PRIMARY KEY,
    first_name   VARCHAR2(50) NOT NULL,
    last_name    VARCHAR2(50) NOT NULL,
    email        VARCHAR2(100) NOT NULL UNIQUE,
    program_name VARCHAR2(100) NOT NULL,
    status       VARCHAR2(10) DEFAULT 'ACTIVE' NOT NULL
                 CHECK (status IN ('ACTIVE', 'INACTIVE')),
    created_at   DATE DEFAULT SYSDATE NOT NULL
);

CREATE TABLE a4_courses (
    course_id    NUMBER PRIMARY KEY,
    course_code  VARCHAR2(15) NOT NULL UNIQUE,
    course_name  VARCHAR2(100) NOT NULL,
    credits      NUMBER(1) NOT NULL CHECK (credits BETWEEN 1 AND 6)
);

CREATE TABLE a4_enrollments (
    student_id   NUMBER NOT NULL REFERENCES a4_students(student_id),
    course_id    NUMBER NOT NULL REFERENCES a4_courses(course_id),
    semester     VARCHAR2(10) NOT NULL,
    score        NUMBER(5,2) CHECK (score BETWEEN 0 AND 100 OR score IS NULL),
    enrolled_on  DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT pk_a4_enrollments PRIMARY KEY (student_id, course_id, semester)
);

PROMPT Tables created successfully.
