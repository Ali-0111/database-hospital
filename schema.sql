CREATE TABLE hospital (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE nurse (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    last_name VARCHAR(100) NOT NULL DEFAULT 'safari',
    phone VARCHAR(30) NOT NULL DEFAULT '0749641270',
    address VARCHAR(255) NOT NULL DEFAULT 'Kabul Af',
    hospital_id INTEGER NOT NULL,
    FOREIGN KEY (hospital_id) REFERENCES hospital(id)
);

CREATE TABLE child (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    nurse_id INTEGER NOT NULL,
    hospital_id INTEGER NOT NULL,
    FOREIGN KEY (nurse_id) REFERENCES nurse(id),
    FOREIGN KEY (hospital_id) REFERENCES hospital(id)
);

-- new version for child 

-- CREATE TABLE child (
--     id SERIAL PRIMARY KEY,
--     name VARCHAR(255) NOT NULL,
--     parent_id INTEGER NOT NULL,
--     FOREIGN KEY (parent_id) REFERENCES parent(id)
-- );

CREATE TABLE vaccine (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE vaccination_program (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    number_of_steps INT NOT NULL
);

CREATE TABLE vaccination_program_step(
    id SERIAL PRIMARY KEY,
    vaccination_program_id INT NOT NULL,
    step_rank INT NOT NULL,
    step_name VARCHAR(255) NOT NULL,
    vaccine_id INT NOT NULL,
    FOREIGN KEY (vaccination_program_id) REFERENCES vaccination_program(id),
    FOREIGN KEY (vaccine_id) REFERENCES vaccine(id) 
);

CREATE TABLE vaccine_record (
    id SERIAL PRIMARY KEY,
    child_id INT NOT NULL REFERENCES child(id),
    nurse_id INT NOT NULL REFERENCES nurse(id),
    hospital_id INT NOT NULL REFERENCES hospital(id),
    vaccination_program_id INT NOT NULL REFERENCES vaccination_program(id),
    vaccine_id INT NOT NULL REFERENCES vaccine(id),
    step_rank INT NOT NULL,
    step_name VARCHAR(255) NOT NULL,
    step_status VARCHAR(50) NOT NULL,
    vaccination_date TIMESTAMP
);

-- auth tables 

CREATE TABLE hospital_credentials (
    id SERIAL PRIMARY KEY,
    hospital_id INTEGER NOT NULL UNIQUE REFERENCES hospital(id) ON DELETE CASCADE,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE nurse_credentials (
    id SERIAL PRIMARY KEY,
    nurse_id INTEGER NOT NULL UNIQUE REFERENCES nurse(id) ON DELETE CASCADE,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE parent_credentials (
    id SERIAL PRIMARY KEY,
    parent_id INTEGER NOT NULL UNIQUE REFERENCES parent(id) ON DELETE CASCADE,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE parent (
    id SERIAL PRIMARY KEY,
    family_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    president_name VARCHAR(255) NOT NULL
);

ALTER TABLE child 
ADD COLUMN parent_id INTEGER,
ADD FOREIGN KEY (parent_id) REFERENCES parent(id);

ALTER TABLE child DROP CONSTRAINT child_nurse_id_fkey;
ALTER TABLE child DROP CONSTRAINT child_hospital_id_fkey;