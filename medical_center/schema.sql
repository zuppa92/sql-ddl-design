-- Create Doctors table
CREATE TABLE Doctors (
    doctor_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100) NOT NULL
);

-- Create Patients table
CREATE TABLE Patients (
    patient_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL
);

-- Create Diseases table
CREATE TABLE Diseases (
    disease_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Create Visits table
CREATE TABLE Visits (
    visit_id SERIAL PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    visit_date DATE NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Create Patient_Diseases table (many-to-many relationship between patients and diseases)
CREATE TABLE Patient_Diseases (
    visit_id INT NOT NULL,
    patient_id INT NOT NULL,
    disease_id INT NOT NULL,
    PRIMARY KEY (visit_id, patient_id, disease_id),
    FOREIGN KEY (visit_id) REFERENCES Visits(visit_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (disease_id) REFERENCES Diseases(disease_id)
);
