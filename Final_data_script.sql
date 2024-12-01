-- Insert data for table: person
INSERT INTO person (first_name, last_name, person_number, phone_number, email) VALUES
('John', 'Doe', '123456789001', '0701234567', NULL),
('Jane', 'Smith', '123456789002', '0709876543', NULL),
('Emily', 'Johnson', '123456789003', '0701122334', 'emily.johnson@example.com'),
('Michael', 'Brown', '123456789004', '0709988776', NULL),
('Chris', 'Davis', '123456789005', '0706677889', 'chris.davis@example.com'),
('Neil', 'Armstrong', '123456789009', '0706325519', 'thereal.neilarmstrong@example.com'),
('Leif', 'Lindbäck', '123456789010', '0706325252', NULL),
('Dalia', 'Aswad', '123456789011', '0706324526', 'dalia.aswad@example.com'),
('Ethan', 'Collins', '123456789012', '0706324186', NULL),
('Olivia', 'Morgan', '123456789013', '0706324098', 'olliemorg@example.com'),
('Benjamin', 'Karlsson', '123456789014', '0706325526', NULL),
('Greggory', 'Hensson', '123456789015', '0706325518', 'greg.hen@example.com'),
('Emma', 'Carter', '123456789016', '0706725518', NULL),
('Liam', 'Peterson', '123456789017', '0706725578', 'liam.pete@example.com'),
('Sophia', 'Bennett', '123456789018', '0706725423', 'sophieben@example.com');


-- Insert data for table: lesson_type
INSERT INTO lesson_type (lesson_type_id, lesson_name) VALUES
('L001', 'group_lesson'),
('L002', 'individual_lesson'),
('L003', 'ensemble');

-- Insert data for table: difficulty
INSERT INTO difficulty (difficulty_id, difficulty_type) VALUES
('D001', 'Beginner'),
('D002', 'Intermediate'),
('D003', 'Advanced');

-- Insert data for table: instrument_inventory
INSERT INTO instrument_inventory (instrument_name, instrument_rental_price, brand, instrument_count, date_of_price_change) VALUES
('Piano', 500.00, 'Yamaha', 3, '2024-11-20'),
('Violin', 300.00, 'Yamaha', 5, '2023-10-03'),
('Guitar', 350.00, 'Fender', 10, '2023-06-16'),
('Drums', 450.00, 'VISIONDRUM', 2, '2022-03-24'),
('Flute', 150.00, 'Yamaha', 7, '2024-05-13');

-- Insert data for table: instructor
INSERT INTO instructor (person_id, employment_id, can_teach_ensembles) VALUES
(6, 'EMP001', TRUE),
(7, 'EMP002', FALSE),
(8, 'EMP003', TRUE),
(9, 'EMP004', FALSE),
(10, 'EMP005', TRUE);

-- Insert data for table: student
INSERT INTO student (person_id) VALUES
(1), (2), (3), (4), (5);

-- Insert data for table: student_sibling
INSERT INTO student_sibling (sibling_id, student_id) VALUES
(1, 2), (3, 4), (5, 1);

-- Insert data for table: contact_person
INSERT INTO contact_person (student_id, person_id) VALUES
(1, 9), (2, 10), (3, 11), (4, 12), (5, 13);

-- Insert data for table: address
INSERT INTO address (person_id, zip, city, street_name) VALUES
(1, '12345', 'Stockholm', 'Main Street 1'),
(2, '23456', 'Gothenburg', 'Second Street 2'),
(3, '34567', 'Malmö', 'Third Street 3'),
(4, '45678', 'Uppsala', 'Fourth Street 4'),
(5, '56789', 'Lund', 'Fifth Street 5'),
(6, '67890', 'Helsingborg', 'Sixth Street 6'),
(7, '78901', 'Västerås', 'Seventh Street 7'),
(8, '89012', 'Örebro', 'Eighth Street 8'),
(9, '90123', 'Linköping', 'Ninth Street 9'),
(10, '01234', 'Norrköping', 'Tenth Street 10'),
(11, '12346', 'Jönköping', 'Eleventh Street 11'),
(12, '23457', 'Karlstad', 'Twelfth Street 12'),
(13, '34568', 'Sundsvall', 'Thirteenth Street 13'),
(14, '45679', 'Eskilstuna', 'Fourteenth Street 14'),
(15, '56780', 'Gävle', 'Fifteenth Street 15');

-- Insert data for table: availability_of_instructor
INSERT INTO availability_of_instructor (instructor_id) VALUES
(1), (2), (3), (4), (5);

-- Insert data for table: instructor_instrument
INSERT INTO instructor_instrument (instructor_id, instrument_name) VALUES
(1, 'Piano'),
(2, 'Violin'),
(3, 'Guitar'),
(4, 'Drums'),
(5, 'Flute');

-- Insert data for table: instrument
INSERT INTO instrument (instrument_inventory_id) VALUES
(1), (2), (3), (4), (5);

-- Insert data for table: instrument_rental
INSERT INTO instrument_rental (rental_start_date, rental_end_date, student_id, instrument_id) VALUES
('2024-01-01', '2024-02-01', 1, 1),
('2024-01-01', '2024-03-01', 2, 2),
('2024-01-15', '2024-02-15', 3, 3),
('2024-02-01', '2024-03-01', 4, 4),
('2024-03-01', '2024-04-01', 5, 5);

-- Insert data for table: price_list
INSERT INTO price_list (lesson_type_id, difficulty_id, lesson_price) VALUES
('L001', 'D001', 150.00),
('L001', 'D002', 200.00),
('L001', 'D003', 250.00),
('L002', 'D001', 300.00),
('L002', 'D002', 350.00),
('L002', 'D003', 400.00),
('L003', 'D001', 180.00),
('L003', 'D002', 230.00),
('L003', 'D003', 280.00);

-- Insert data for table: group_lesson
INSERT INTO group_lesson (start_time, end_time, place, instrument, minimum_number_of_attendees, maximum_number_of_attendees, instructor_id, price_list_id, lesson_type_id, difficulty_id) VALUES
('2024-12-10 10:00:00', '2024-12-10 11:00:00', 'Room A', 'Piano', 2, 5, 1, 1, 'L001', 'D001'),
('2024-12-11 12:00:00', '2024-12-11 13:00:00', 'Room B', 'Violin', 3, 6, 2, 2, 'L001', 'D002'),
('2024-12-12 14:00:00', '2024-12-12 15:00:00', 'Room C', 'Guitar', 4, 8, 3, 3, 'L001', 'D003');

-- Insert data for table: individual_lesson
INSERT INTO individual_lesson (start_time, end_time, place, instrument, student_id, instructor_id, price_list_id, lesson_type_id, difficulty_id) VALUES
('2024-12-20 16:00:00', '2024-12-20 17:00:00', 'Room D', 'Piano', 1, 1, 4, 'L002', 'D001'),
('2024-12-21 16:00:00', '2024-12-21 17:00:00', 'Room E', 'Violin', 2, 2, 5, 'L002', 'D002'),
('2024-12-22 16:00:00', '2024-12-22 17:00:00', 'Room F', 'Guitar', 3, 3, 6, 'L002', 'D003');

-- Insert data for table: ensemble
INSERT INTO ensemble (genre, start_time, end_time, place, instrument, minimum_number_of_attendees, maximum_number_of_attendees, instructor_id, price_list_id, lesson_type_id, difficulty_id) VALUES
('Classical', '2024-12-09 09:00:00', '2024-12-09 10:30:00', 'Room G', 'Violin', 1, 3, 3, 7, 'L003', 'D001'),
('Jazz', '2024-12-10 11:00:00', '2024-12-10 12:30:00', 'Room H', 'Saxophone', 1, 5, 3, 8, 'L003', 'D002'),
('Rock', '2024-12-11 13:00:00', '2024-12-11 14:30:00', 'Room I', 'Guitar', 1, 10, 4, 9, 'L003', 'D003');

INSERT INTO time_span (availability_id, instructor_id, start_time, end_time) VALUES
(1, 1, '2024-12-01 09:00:00', '2024-12-01 12:00:00'),
(2, 2, '2024-12-02 13:00:00', '2024-12-02 15:00:00'),
(3, 3, '2024-12-03 10:00:00', '2024-12-03 14:00:00'),
(4, 4, '2024-12-04 08:00:00', '2024-12-04 11:00:00'),
(5, 5, '2024-12-05 14:00:00', '2024-12-05 17:00:00');

INSERT INTO ensemble_student(ensemble_id, student_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 4),
(3, 5);

INSERT INTO group_lesson_student(group_lesson_id, student_id) VALUES
(1, 2),
(2, 4),
(3, 5);

INSERT INTO company_rules(rule_name, rule_description, rule_value, valid_date) VALUES
('max_rentals', 'The maximum number of rentals per month that a student can have.', 2, '2024-11-27'),
('max_rental_time', 'The maximum time that a student is allowed to rent an instrument.', 12, '2024-11-27'),
('discount_percentage', 'The percentage discount for a student with a sibling that is also a student at Soundgood Co.', 20, '2024-11-20');