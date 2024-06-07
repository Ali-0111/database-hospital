CREATE TABLE hospital (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE nurse (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    hospital_id INTEGER NOT NULL,
    FOREIGN KEY (hospital_id) REFERENCES hospital(id)
);

CREATE TABLE child (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    father_name VARCHAR(255) NOT NULL,
    mother_name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    province VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    contact_number VARCHAR(20) NOT NULL
);

CREATE TABLE vaccine_type (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    step INT NOT NULL
);

CREATE TABLE vaccine_step (
    id SERIAL PRIMARY KEY,
    vaccine_type_id INT NOT NULL,
    step_number INT NOT NULL,
    step_name VARCHAR(255) NOT NULL,
    step_timing INTERVAL NOT NULL,
    FOREIGN KEY (vaccine_type_id) REFERENCES vaccine_type(id)
);

CREATE TABLE child_vaccine_progress (
    id SERIAL PRIMARY KEY,
    child_id INT NOT NULL,
    hospital_id INT NOT NULL,
    nurse_id INT NOT NULL,
    step_number INT NOT NULL,
    vaccine_type_id INT NOT NULL,
    vaccine_timed_at TIMESTAMP,
    time_taken INTERVAL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (child_id) REFERENCES child(id),
    FOREIGN KEY (hospital_id) REFERENCES hospital(id),
    FOREIGN KEY (nurse_id) REFERENCES nurse(id),
    FOREIGN KEY (vaccine_type_id) REFERENCES vaccine_type(id)
);
