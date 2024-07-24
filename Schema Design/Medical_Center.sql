DROP DATABASE IF EXISTS  Medical_Center;

CREATE DATABASE Medical_Center;

\c Medical_Center

CREATE TABLE Medical_Center (
    center_id SERIAL PRIMARY KEY,
    center_name TEXT NOT NULL,
    address TEXT NOT NULL,
    phone TEXT NOT NULL
);

CREATE TABLE Specialty (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
);

CREATE TABLE Doctors (
    doctor_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    specialty_id INTEGER REFERENCES Specialty(id)
);

CREATE TABLE Patients (
    patient_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER NOT NULL,
    has_insurance BOOLEAN NOT NULL
);

CREATE TABLE Diagnosis (
    id SERIAL PRIMARY KEY,
    category varchar(15) NOT NULL,
    diag_name TEXT NOT NULL
);

CREATE TABLE Visits (
    visit_id SERIAL PRIMARY KEY,
    visit_date DATE NOT NULL,
    facility_id INTEGER REFERENCES Medical_Cente(center_id),
    patient_id INTEGER REFERENCES Patients(patient_id),
    doctor_id INTEGER REFERENCES Doctors(doctor_id),
    diagnosis INTEGER References Diagnosis(id)
);