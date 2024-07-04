-- Insert into hospital table
INSERT INTO hospital (name, address)
VALUES ('hospital_1', 'Barchi, Kabul Af');

-- Insert into nurse table
INSERT INTO nurse (name, hospital_id)
VALUES 
    ('nurse_1', 1),
    ('nurse_2', 1),
    ('nurse_3', 1),
    ('nurse_4', 1),
    ('nurse_5', 1),
    ('nurse_6', 1),
    ('nurse_7', 1),
    ('nurse_8', 1),
    ('nurse_9', 1),
    ('nurse_10', 1);

-- Insert into child table
INSERT INTO child (name, nurse_id, hospital_id)
VALUES 
    ('child_1', 1, 1),
    ('child_2', 1, 1),
    ('child_3', 1, 1),
    ('child_4', 1, 1),
    ('child_5', 1, 1),
    ('child_6', 1, 1),
    ('child_7', 1, 1),
    ('child_8', 1, 1),
    ('child_9', 1, 1),
    ('child_10', 1, 1);

-- Insert into vaccine table
INSERT INTO vaccine (name)
VALUES 
    ('vaccine_1'),
    ('vaccine_2'),
    ('vaccine_3'),
    ('vaccine_4'),
    ('vaccine_5'),
    ('vaccine_6'),
    ('vaccine_7'),
    ('vaccine_8'),
    ('vaccine_9'),
    ('vaccine_10');

-- Insert into vaccination_program table
INSERT INTO vaccination_program (name, number_of_steps)
VALUES 
    ('polio', 1),
    ('5Gana', 3);

-- Insert into vaccination_program_step table
INSERT INTO vaccination_program_step (vaccination_program_id, step_rank, step_name, vaccine_id)
VALUES 
    (1, 0, 'polio', 1),
    (2, 0, 'After birth', 1),
    (2, 0, 'After birth', 2),
    (2, 0, 'After birth', 3),
    (2, 1, 'Month-1', 4),
    (2, 1, 'Month-1', 5),
    (2, 1, 'Month-1', 6),
    (2, 2, 'Month-2', 7),
    (2, 2, 'Month-2', 8),
    (2, 2, 'Month-2', 9);
