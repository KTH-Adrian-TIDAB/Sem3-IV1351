    --Task 1
    CREATE VIEW lessons_per_month AS
    SELECT 
        TO_CHAR(start_time, 'Month') AS month,
        COUNT(*) AS total_lessons,
        SUM(CASE WHEN lesson_type = 'individual' THEN 1 ELSE 0 END) AS individual_lessons,
        SUM(CASE WHEN lesson_type = 'group' THEN 1 ELSE 0 END) AS group_lessons,
        SUM(CASE WHEN lesson_type = 'ensemble' THEN 1 ELSE 0 END) AS ensemble_lessons
    FROM (
        SELECT start_time, 'individual' AS lesson_type FROM individual_lesson
        UNION ALL
        SELECT start_time, 'group' AS lesson_type FROM group_lesson
        UNION ALL
        SELECT start_time, 'ensemble' AS lesson_type FROM ensemble
    ) AS lessons
    WHERE EXTRACT(YEAR FROM start_time) = 2024
    GROUP BY TO_CHAR(start_time, 'Month')
    ORDER BY MIN(start_time);

    --Task 2
    CREATE VIEW number_of_siblings AS
    SELECT 
        siblings.sibling_count AS "No of Siblings",
        COALESCE(COUNT(students.student_id), 0) AS "No of Students"
    FROM 
        (VALUES (0), (1), (2)) AS siblings(sibling_count) 
    LEFT JOIN (
        SELECT 
            s.student_id,
            COUNT(ss.sibling_id) AS sibling_count
        FROM 
            student s
        LEFT JOIN 
            student_sibling ss ON s.student_id = ss.student_id
        GROUP BY 
            s.student_id
    ) students ON siblings.sibling_count = students.sibling_count
    GROUP BY 
        siblings.sibling_count
    ORDER BY 
        siblings.sibling_count;


    --Task 3
    CREATE VIEW overworked_instructors_corrected_2 AS
    SELECT
        i.instructor_id,
        p.first_name,
        p.last_name,
        COUNT(*) AS total_lessons
    FROM
        instructor i
    JOIN
        person p ON i.person_id = p.person_id
    LEFT JOIN (
        SELECT 
            individual_lesson_id AS lesson_id, 
            instructor_id, 
            start_time 
        FROM 
            individual_lesson
        UNION ALL
        SELECT 
            group_lesson_id AS lesson_id, 
            instructor_id, 
            start_time 
        FROM 
            group_lesson
        UNION ALL
        SELECT 
            ensemble_id AS lesson_id, 
            instructor_id, 
            start_time 
        FROM 
            ensemble
    ) lessons ON i.instructor_id = lessons.instructor_id
            AND DATE_PART('month', lessons.start_time) = DATE_PART('month', CURRENT_DATE)
    GROUP BY
        i.instructor_id, p.first_name, p.last_name
    HAVING
        COUNT(*) > 1
    ORDER BY


    --Task 4  
    CREATE MATERIALIZED VIEW available_ensemble_slots AS
    SELECT 
        TO_CHAR(start_time, 'Day') AS day,
        genre,
        CASE 
            WHEN (maximum_number_of_attendees - COUNT(student_id)) = 0 THEN 'No Seats'
            WHEN (maximum_number_of_attendees - COUNT(student_id)) BETWEEN 1 AND 2 THEN '1 or 2 Seats'
            ELSE 'Many Seats'
        END AS no_of_free_seats
    FROM 
        ensemble e
    LEFT JOIN 
        ensemble_student es ON e.ensemble_id = es.ensemble_id
    WHERE 
        start_time >= CURRENT_DATE AND start_time < CURRENT_DATE + INTERVAL '7 days'
    GROUP BY 
        TO_CHAR(start_time, 'Day'), genre, maximum_number_of_attendees
    ORDER BY 
        TO_CHAR(start_time, 'Day'), genre;
