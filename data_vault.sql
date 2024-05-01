CREATE TABLE hub_student (
  student_id INTEGER PRIMARY KEY,
  student_name VARCHAR(255) NOT NULL,
  student_email VARCHAR(255) NOT NULL,
  load_date TIMESTAMP NOT NULL
);

CREATE TABLE hub_subject (
  subject_id INTEGER PRIMARY KEY,
  subject_name VARCHAR(255) NOT NULL,
  load_date TIMESTAMP NOT NULL
);

CREATE TABLE hub_teacher (
  teacher_id INTEGER PRIMARY KEY,
  teacher_name VARCHAR(255) NOT NULL,
  teacher_email VARCHAR(255) NOT NULL,
  load_date TIMESTAMP NOT NULL
);

CREATE TABLE link_student_subject (
  student_id INTEGER NOT NULL,
  subject_id INTEGER NOT NULL,
  load_date TIMESTAMP NOT NULL,
  PRIMARY KEY (student_id, subject_id, load_date),
  FOREIGN KEY (student_id) REFERENCES hub_student(student_id),
  FOREIGN KEY (subject_id) REFERENCES hub_subject(subject_id)
);

CREATE TABLE link_student_teacher (
  student_id INTEGER NOT NULL,
  teacher_id INTEGER NOT NULL,
  load_date TIMESTAMP NOT NULL,
  PRIMARY KEY (student_id, teacher_id, load_date),
  FOREIGN KEY (student_id) REFERENCES hub_student(student_id),
  FOREIGN KEY (teacher_id) REFERENCES hub_teacher(teacher_id)
);

CREATE TABLE sat_exam (
  exam_id INTEGER PRIMARY KEY,
  exam_name VARCHAR(255) NOT NULL,
  exam_date DATE NOT NULL,
  subject_id INTEGER NOT NULL,
  load_date TIMESTAMP NOT NULL,
  FOREIGN KEY (subject_id) REFERENCES hub_subject(subject_id)
);

CREATE TABLE sat_student_exam (
  student_id INTEGER NOT NULL,
  exam_id INTEGER NOT NULL,
  exam_score INTEGER NOT NULL,
  load_date TIMESTAMP NOT NULL,
  PRIMARY KEY (student_id, exam_id, load_date),
  FOREIGN KEY (student_id) REFERENCES hub_student(student_id),
  FOREIGN KEY (exam_id) REFERENCES sat_exam(exam_id)
);
