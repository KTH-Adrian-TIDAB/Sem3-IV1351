
    CREATE TABLE person (
        person_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        first_name VARCHAR(200) NOT NULL,
        last_name VARCHAR(200) NOT NULL,
        person_number VARCHAR(12) UNIQUE NOT NULL,
        phone_number VARCHAR(200) NOT NULL,
        email VARCHAR(200)
    );

    CREATE TABLE address (
        person_id INT NOT NULL PRIMARY KEY,
        zip VARCHAR(200) NOT NULL,
        city VARCHAR(200) NOT NULL,
        street_name VARCHAR(200) NOT NULL,
        FOREIGN KEY (person_id) REFERENCES person (person_id)
    );

    CREATE TABLE student (
        student_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        person_id INT NOT NULL,
        FOREIGN KEY (person_id) REFERENCES person (person_id)
    );

    CREATE TABLE student_sibling (
        sibling_id INT NOT NULL,
        student_id INT NOT NULL,
        PRIMARY KEY (sibling_id, student_id),
        FOREIGN KEY (student_id) REFERENCES student (student_id),
        FOREIGN KEY (sibling_id) REFERENCES student (student_id)
    );

    CREATE TABLE contact_person (
        student_id INT NOT NULL,
        person_id INT NOT NULL,
        PRIMARY KEY (student_id),
        FOREIGN KEY (student_id) REFERENCES student (student_id),
        FOREIGN KEY (person_id) REFERENCES person (person_id)
    );

    CREATE TABLE instrument_inventory (
        instrument_inventory_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        instrument_name VARCHAR(200) NOT NULL,
        instrument_rental_price NUMERIC,
        brand VARCHAR (500) NOT NULL,
        instrument_count INT NOT NULL,
        date_of_price_change DATE
    );

    CREATE TABLE instructor (
        instructor_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        person_id INT NOT NULL,
        employment_id VARCHAR(20) UNIQUE NOT NULL,
        can_teach_ensembles BOOLEAN NOT NULL,
        FOREIGN KEY (person_id) REFERENCES person (person_id)
    );

    CREATE TABLE instructor_instrument (
        instructor_id INT NOT NULL,
        instrument_name VARCHAR(200) NOT NULL,
        PRIMARY KEY (instructor_id),
        FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id) ON DELETE CASCADE
    );

    CREATE TABLE availability_of_instructor (
        availability_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        instructor_id INT NOT NULL,
        FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id) ON DELETE CASCADE
    );

    CREATE TABLE time_span (
        availability_id INT NOT NULL,
        instructor_id INT NOT NULL,
        start_time TIMESTAMP(10) NOT NULL,
        end_time TIMESTAMP(10) NOT NULL,
        PRIMARY KEY (availability_id, instructor_id),
        FOREIGN KEY (availability_id) REFERENCES availability_of_instructor (availability_id), 
        FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id) ON DELETE CASCADE
    );

    CREATE TABLE instrument (
        instrument_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        instrument_inventory_id INT NOT NULL,
        FOREIGN KEY (instrument_inventory_id) REFERENCES instrument_inventory (instrument_inventory_id)
    );
    
    CREATE TABLE instrument_rental (
        rental_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        rental_start_date DATE NOT NULL,
        rental_end_date DATE NOT NULL,
        student_id INT NOT NULL,
        instrument_id INT NOT NULL,
        FOREIGN KEY (student_id) REFERENCES student (student_id),
        FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id)
    );

    CREATE TABLE lesson_type (
        lesson_type_id VARCHAR(200) NOT NULL PRIMARY KEY,
        lesson_name VARCHAR(200) UNIQUE NOT NULL
    );

    CREATE TABLE difficulty (
        difficulty_id VARCHAR(200) NOT NULL PRIMARY KEY,
        difficulty_type VARCHAR(200) UNIQUE NOT NULL 
    );
    

    CREATE TABLE price_list (
        price_list_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        lesson_price NUMERIC,
        lesson_type_id VARCHAR(200) NOT NULL,
        difficulty_id VARCHAR(200) NOT NULL,
        FOREIGN KEY (lesson_type_id) REFERENCES lesson_type (lesson_type_id),
        FOREIGN KEY (difficulty_id) REFERENCES difficulty (difficulty_id)
    );

    CREATE TABLE group_lesson (
        group_lesson_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        start_time TIMESTAMP(10),
        end_time TIMESTAMP(10),
        place VARCHAR(200),
        instrument VARCHAR(200),
        minimum_number_of_attendees INT NOT NULL,
        maximum_number_of_attendees INT,
        instructor_id INT NOT NULL,
        price_list_id INT,        
        lesson_type_id VARCHAR(200),
        difficulty_id VARCHAR(200),
        FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id),
        FOREIGN KEY (price_list_id) REFERENCES price_list (price_list_id),
        FOREIGN KEY (lesson_type_id) REFERENCES lesson_type (lesson_type_id),
        FOREIGN KEY (difficulty_id) REFERENCES difficulty (difficulty_id)    
    );
    

    CREATE TABLE individual_lesson (
        individual_lesson_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        start_time TIMESTAMP(10),
        end_time TIMESTAMP(10),
        place VARCHAR(200),
        instrument VARCHAR(200),
        student_id INT,
        instructor_id INT NOT NULL,
        price_list_id INT,        
        lesson_type_id VARCHAR(200),
        difficulty_id VARCHAR(200),
        FOREIGN KEY (student_id) REFERENCES student (student_id),
        FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id),
        FOREIGN KEY (price_list_id) REFERENCES price_list (price_list_id),
        FOREIGN KEY (lesson_type_id) REFERENCES lesson_type (lesson_type_id),
        FOREIGN KEY (difficulty_id) REFERENCES difficulty (difficulty_id) 
    );
    

    CREATE TABLE ensemble (
        ensemble_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        genre VARCHAR(200),
        start_time TIMESTAMP(10),
        end_time TIMESTAMP(10),
        place VARCHAR(200),
        instrument VARCHAR(200),
        minimum_number_of_attendees INT NOT NULL,
        maximum_number_of_attendees INT,
        instructor_id INT NOT NULL,
        price_list_id INT,        
        lesson_type_id VARCHAR(200),
        difficulty_id VARCHAR(200),
        FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id),
        FOREIGN KEY (price_list_id) REFERENCES price_list (price_list_id),
        FOREIGN KEY (lesson_type_id) REFERENCES lesson_type (lesson_type_id),
        FOREIGN KEY (difficulty_id) REFERENCES difficulty (difficulty_id)
    );

    CREATE TABLE ensemble_student (
        student_id INT NOT NULL,
        ensemble_id INT NOT NULL,
        PRIMARY KEY(ensemble_id, student_id),
        FOREIGN KEY(student_id) REFERENCES student (student_id),
        FOREIGN KEY(ensemble_id) REFERENCES ensemble (ensemble_id)
    );

    CREATE TABLE group_lesson_student (
        student_id INT NOT NULL,
        group_lesson_id INT NOT NULL,
        PRIMARY KEY(group_lesson_id),
        FOREIGN KEY(student_id) REFERENCES student (student_id),
        FOREIGN KEY(group_lesson_id) REFERENCES group_lesson (group_lesson_id)
    );
    
    CREATE TABLE company_rules (
        rule_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        rule_name VARCHAR(200),
        rule_description VARCHAR(1000),
        rule_value INT NOT NULL,
        valid_date DATE NOT NULL
    );
