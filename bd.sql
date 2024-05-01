CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE subjects (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE teachers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  subject_id INTEGER REFERENCES subjects(id)
);

CREATE TABLE exams (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  date DATE NOT NULL,
  subject_id INTEGER REFERENCES subjects(id)
);

CREATE TABLE student_exam (
  student_id INTEGER REFERENCES students(id),
  exam_id INTEGER REFERENCES exams(id),
  grade INTEGER CHECK(grade >= 0 AND grade <= 100),
  PRIMARY KEY (student_id, exam_id)
);

CREATE TABLE study_materials (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL,
  subject_id INTEGER REFERENCES subjects(id)
);

CREATE TABLE student_material (
  student_id INTEGER REFERENCES students(id),
  material_id INTEGER REFERENCES study_materials(id),
  PRIMARY KEY (student_id, material_id)
);
