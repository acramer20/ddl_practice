-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/hWqZG5
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

DROP DATABASE medical_db;
CREATE DATABASE medical_db;
\c medical_db;

CREATE TABLE doctor (
    id SERIAL PRIMARY KEY,
    name TEXT   NOT NULL,
    specialty TEXT  NOT NULL,
    center_id INTEGER   NOT NULL
);

CREATE TABLE medicalcenter (
    id SERIAL PRIMARY KEY,
    center_name text   NOT NULL
);


CREATE TABLE patient (
    id SERIAL PRIMARY KEY,
    doctor_id int   NOT NULL,
    first_name text   NOT NULL,
    last_name text   NOT NULL,
    ssn int   NOT NULL
);

CREATE TABLE visit (
    id SERIAL PRIMARY KEY,
    date text   NOT NULL,
    patient_id int   NOT NULL,
    doctor_id int   NOT NULL
    
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    visit_id int   NOT NULL,
    disease_id int   NOT NULL
    
);

CREATE TABLE disease (
    id SERIAL PRIMARY KEY,
    description text   NOT NULL
);

ALTER TABLE doctor ADD CONSTRAINT fk_doctor_center_id FOREIGN KEY(center_id)
REFERENCES medicalcenter (id);

ALTER TABLE visit ADD CONSTRAINT fk_visit_patient_id FOREIGN KEY(patient_id)
REFERENCES patient (id);

ALTER TABLE visit ADD CONSTRAINT fk_visit_doctor_id FOREIGN KEY(doctor_id)
REFERENCES doctor (id);

ALTER TABLE diagnoses ADD CONSTRAINT fk_diagnoses_visit_id FOREIGN KEY(visit_id)
REFERENCES visit (id);

ALTER TABLE diagnoses ADD CONSTRAINT fk_diagnoses_disease_id FOREIGN KEY(disease_id)
REFERENCES disease (id);

CREATE INDEX "idx_Doctor_Name"
ON doctor (name);

