----- For individual_lesson-------
INSERT INTO historical_lessons (lesson_type, instrument, lesson_price, student_name, student_email, genre)
SELECT 
    'individual' AS lesson_type,
    il.instrument,
    pl.lesson_price,
    CONCAT(p.first_name, ' ', p.last_name) AS student_name,
    p.email AS student_email,
    NULL AS genre
FROM individual_lesson il
JOIN student s ON il.student_id = s.student_id
JOIN person p ON s.person_id = p.person_id
JOIN price_list pl ON il.price_list_id = pl.price_list_id;


----- For group lesson-------
INSERT INTO historical_lessons (lesson_type, instrument, lesson_price, student_name, student_email, genre)
SELECT 
    'group' AS lesson_type,
    gl.instrument,
    pl.lesson_price,
    CONCAT(p.first_name, ' ', p.last_name) AS student_name,
    p.email AS student_email,
    NULL AS genre
FROM group_lesson gl
JOIN group_lesson_student gls ON gl.group_lesson_id = gls.group_lesson_id
JOIN student s ON gls.student_id = s.student_id
JOIN person p ON s.person_id = p.person_id
JOIN price_list pl ON gl.price_list_id = pl.price_list_id;


----- For ensembles------
INSERT INTO historical_lessons (lesson_type, instrument, lesson_price, student_name, student_email, genre)
SELECT 
    'ensemble' AS lesson_type,
    NULL AS instrument,
    pl.lesson_price,
    CONCAT(p.first_name, ' ', p.last_name) AS student_name,
    p.email AS student_email,
    e.genre
FROM ensemble e
JOIN ensemble_student es ON e.ensemble_id = es.ensemble_id
JOIN student s ON es.student_id = s.student_id
JOIN person p ON s.person_id = p.person_id
JOIN price_list pl ON e.price_list_id = pl.price_list_id;
