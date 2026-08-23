-- Варіант 10. Транспортна компанія
-- Повний стан бази ПІСЛЯ завершення Практики 4 (див. коментар у
-- v1_result.sql — той самий файл перевикористовується Практикою 5 і
-- далі, до Практики 13).

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS поїздки;
DROP TABLE IF EXISTS маршрути;
DROP TABLE IF EXISTS водії;

CREATE TABLE водії (
    id INTEGER PRIMARY KEY,
    прізвище TEXT NOT NULL,
    "ім'я" TEXT NOT NULL,
    стаж_років INTEGER,
    категорія_прав TEXT
);

CREATE TABLE маршрути (
    id INTEGER PRIMARY KEY,
    звідки TEXT NOT NULL,
    куди TEXT NOT NULL,
    відстань_км INTEGER
);

CREATE TABLE поїздки (
    id INTEGER PRIMARY KEY,
    driver_id INTEGER NOT NULL,
    route_id INTEGER NOT NULL,
    дата TEXT NOT NULL,
    тривалість_хв INTEGER NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES водії (id) ON DELETE RESTRICT,
    FOREIGN KEY (route_id) REFERENCES маршрути (id) ON DELETE RESTRICT
);

INSERT INTO водії (прізвище, "ім'я", стаж_років, категорія_прав) VALUES
    ('Кравець', 'Петро', 12, 'CE'),
    ('Захарчук', 'Ігор', 5, 'C'),
    ('Романюк', 'Василь', 20, 'CE'),
    ('Панченко', 'Олег', 8, 'D'),
    ('Гаврилюк', 'Микола', 3, 'B'),
    ('Сидоренко', 'Тарас', 15, 'CE');

INSERT INTO маршрути (звідки, куди, відстань_км) VALUES
    ('Київ', 'Львів', 540),
    ('Київ', 'Одеса', 480),
    ('Харків', 'Дніпро', 220),
    ('Львів', 'Тернопіль', 130),
    ('Одеса', 'Миколаїв', 130),
    ('Дніпро', 'Запоріжжя', 80);

INSERT INTO поїздки (driver_id, route_id, дата, тривалість_хв) VALUES
    (1, 1, '2026-05-01', 360),
    (2, 2, '2026-05-02', 320),
    (3, 3, '2026-05-03', 150),
    (4, 4, '2026-05-04', 95),
    (5, 5, '2026-05-05', 100),
    (6, 6, '2026-05-06', 60),
    (1, 2, '2026-05-07', 330),
    (2, 3, '2026-05-08', 155),
    (3, 4, '2026-05-09', 100),
    (4, 5, '2026-05-10', 105);
