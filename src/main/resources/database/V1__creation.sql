CREATE TABLE teacher
(
    id   SERIAL  NOT NULL,
    first_name VARCHAR NOT NULL,
    second_name VARCHAR NOT NULL,
    middle_name VARCHAR NOT NULL,
    email VARCHAR,
    CONSTRAINT teacher_pk PRIMARY KEY (id)
);

CREATE TABLE student
(
    id   SERIAL  NOT NULL,
    first_name VARCHAR NOT NULL,
    second_name VARCHAR NOT NULL,
    middle_name VARCHAR NOT NULL,
    CONSTRAINT student_pk PRIMARY KEY (id)
);

CREATE TABLE course
(
    id SERIAL NOT NULL,
    name VARCHAR NOT NULL,
    CONSTRAINT course_pk PRIMARY KEY (id)
);

CREATE TABLE students_group
(
    id SERIAL NOT NULL,
    course_id INT NOT NULL REFERENCES course (id) ON UPDATE CASCADE ON DELETE CASCADE,
    name VARCHAR NOT NULL,
    CONSTRAINT group_pk PRIMARY KEY (id)
);

CREATE TABLE enrollment
(
    group_id INT NOT NULL REFERENCES students_group (id) ON UPDATE CASCADE ON DELETE CASCADE,
    student_id INT NOT NULL REFERENCES student (id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT enrollment_pk PRIMARY KEY (group_id, student_id)
);

CREATE TABLE lesson
(
    id SERIAL NOT NULL,
    theme VARCHAR NOT NULL,
    CONSTRAINT lesson_pk PRIMARY KEY (id)
);

CREATE TABLE schedule
(
    id SERIAL NOT NULL,
    group_id  INT NOT NULL REFERENCES students_group (id) ON UPDATE CASCADE ON DELETE CASCADE,
    lesson_id  INT NOT NULL REFERENCES lesson (id) ON UPDATE CASCADE ON DELETE CASCADE,
    date TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT schedule_pk PRIMARY KEY (id)
);

CREATE TABLE assigned_teachers
(
    schedule_id  INT NOT NULL REFERENCES schedule (id) ON UPDATE CASCADE ON DELETE CASCADE,
    teacher_id INT NOT NULL REFERENCES teacher (id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT assigned_teachers_pk PRIMARY KEY (schedule_id, teacher_id)
);
