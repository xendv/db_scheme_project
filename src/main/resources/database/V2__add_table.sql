CREATE TABLE grade
(
    schedule_id INT NOT NULL REFERENCES schedule (id) ON UPDATE CASCADE ON DELETE CASCADE,
    student_id  INT NOT NULL REFERENCES student (id) ON UPDATE CASCADE ON DELETE CASCADE,
    grade       NUMERIC(1) DEFAULT NULL,
    present     BOOLEAN    DEFAULT FALSE,
    CONSTRAINT grade_pk PRIMARY KEY (student_id, schedule_id)
);