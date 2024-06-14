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
    nurse_id INTEGER NOT NULL,
    hospital_id INTEGER NOT NULL,
    FOREIGN KEY (nurse_id) REFERENCES nurse(id),
    FOREIGN KEY (hospital_id) REFERENCES hospital(id)
);

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
    step_status VARCHAR(50) NOT NULL,
    vaccine_id INT NOT NULL,
    FOREIGN KEY (vaccination_program_id) REFERENCES vaccination_program(id),
    FOREIGN KEY (vaccine_id) REFERENCES vaccine(id) 
)


-- CREATE TABLE child_vaccine_progress (
--     id SERIAL PRIMARY KEY,
--     child_id INT NOT NULL,
--     hospital_id INT NOT NULL,
--     nurse_id INT NOT NULL,
--     step_number INT NOT NULL,
--     vaccine_id INT NOT NULL,
--     vaccine_timed_at TIMESTAMP,
--     time_taken INTERVAL,
--     status VARCHAR(50) NOT NULL,
--     FOREIGN KEY (child_id) REFERENCES child(id),
--     FOREIGN KEY (hospital_id) REFERENCES hospital(id),
--     FOREIGN KEY (nurse_id) REFERENCES nurse(id),
--     FOREIGN KEY (vaccine_id) REFERENCES vaccine(id)
-- );
