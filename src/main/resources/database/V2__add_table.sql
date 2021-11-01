CREATE TABLE attendance
(
    schedule_id INT NOT NULL REFERENCES schedule (id) ON UPDATE CASCADE ON DELETE CASCADE,
    student_id  INT NOT NULL REFERENCES student (id) ON UPDATE CASCADE ON DELETE CASCADE,
    present     BOOLEAN    DEFAULT FALSE,
    CONSTRAINT attendance_pk PRIMARY KEY (student_id, schedule_id)
);

CREATE TABLE task
(
    id SERIAL NOT NULL,
    schedule_id INT NOT NULL REFERENCES schedule (id) ON UPDATE CASCADE ON DELETE CASCADE,
    grade_max INT DEFAULT NULL,
    CONSTRAINT task_pk PRIMARY KEY (id)
);

CREATE TABLE grade
(
    task_id INT NOT NULL REFERENCES task (id) ON UPDATE CASCADE ON DELETE CASCADE,
    student_id INT NOT NULL REFERENCES student (id) ON UPDATE CASCADE ON DELETE CASCADE,
    grade NUMERIC(1) DEFAULT NULL,
    CONSTRAINT grade_pk PRIMARY KEY (task_id, student_id)
);