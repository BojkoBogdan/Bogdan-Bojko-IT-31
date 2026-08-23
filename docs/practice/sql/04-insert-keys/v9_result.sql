-- Варіант 9. Університет (деканат)
-- Повний стан бази ПІСЛЯ завершення Практики 4 (див. коментар у
-- v1_result.sql — той самий файл перевикористовується Практикою 5 і
-- далі, до Практики 13).

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS оцінки;
DROP TABLE IF EXISTS курси;
DROP TABLE IF EXISTS студенти;

CREATE TABLE студенти (
    id INTEGER PRIMARY KEY,
    прізвище TEXT NOT NULL,
    "ім'я" TEXT NOT NULL,
    група TEXT,
    рік_вступу INTEGER
);

CREATE TABLE курси (
    id INTEGER PRIMARY KEY,
    назва TEXT NOT NULL,
    кредити INTEGER,
    семестр INTEGER
);

CREATE TABLE оцінки (
    id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    оцінка INTEGER NOT NULL,
    дата TEXT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES студенти (id) ON DELETE RESTRICT,
    FOREIGN KEY (course_id) REFERENCES курси (id) ON DELETE RESTRICT
);

INSERT INTO студенти (прізвище, "ім'я", група, рік_вступу) VALUES
    ('Коваленко', 'Олена', 'ІС-21', 2021),
    ('Бондаренко', 'Максим', 'ІС-21', 2021),
    ('Шевчук', 'Ірина', 'ІС-22', 2022),
    ('Мельник', 'Андрій', 'ІС-22', 2022),
    ('Ткаченко', 'Софія', 'ІС-23', 2023),
    ('Гнатюк', 'Дмитро', 'ІС-23', 2023);

INSERT INTO курси (назва, кредити, семестр) VALUES
    ('Бази даних', 5, 3),
    ('Програмування', 6, 1),
    ('Математичний аналіз', 5, 1),
    ('Дискретна математика', 4, 2),
    ('Операційні системи', 5, 4),
    ('Комп''ютерні мережі', 4, 5);

INSERT INTO оцінки (student_id, course_id, оцінка, дата) VALUES
    (1, 1, 90, '2026-05-15'),
    (2, 1, 85, '2026-05-15'),
    (3, 2, 78, '2026-05-16'),
    (4, 2, 92, '2026-05-16'),
    (5, 3, 88, '2026-05-17'),
    (6, 3, 95, '2026-05-17'),
    (1, 4, 81, '2026-05-18'),
    (2, 5, 74, '2026-05-18'),
    (3, 6, 90, '2026-05-19'),
    (4, 1, 87, '2026-05-19');
