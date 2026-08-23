-- Варіант 5. Автосалон
-- Повний стан бази ПІСЛЯ завершення Практики 4 (див. коментар у
-- v1_result.sql — той самий файл перевикористовується Практикою 5 і
-- далі, до Практики 13).

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS продажі;
DROP TABLE IF EXISTS клієнти;
DROP TABLE IF EXISTS автомобілі;

CREATE TABLE автомобілі (
    id INTEGER PRIMARY KEY,
    марка TEXT NOT NULL,
    модель TEXT NOT NULL,
    рік INTEGER,
    ціна REAL,
    статус TEXT NOT NULL DEFAULT 'в наявності'
);

CREATE TABLE клієнти (
    id INTEGER PRIMARY KEY,
    прізвище TEXT NOT NULL,
    "ім'я" TEXT NOT NULL,
    телефон TEXT,
    email TEXT UNIQUE
);

CREATE TABLE продажі (
    id INTEGER PRIMARY KEY,
    car_id INTEGER NOT NULL,
    client_id INTEGER NOT NULL,
    дата_продажу TEXT NOT NULL,
    ціна_продажу REAL NOT NULL,
    FOREIGN KEY (car_id) REFERENCES автомобілі (id) ON DELETE RESTRICT,
    FOREIGN KEY (client_id) REFERENCES клієнти (id) ON DELETE RESTRICT
);

INSERT INTO автомобілі (марка, модель, рік, ціна, статус) VALUES
    ('Toyota', 'Corolla', 2022, 720000, 'в наявності'),
    ('Volkswagen', 'Golf', 2021, 650000, 'продано'),
    ('Skoda', 'Octavia', 2023, 780000, 'в наявності'),
    ('Renault', 'Duster', 2020, 580000, 'в наявності'),
    ('Hyundai', 'Tucson', 2022, 950000, 'зарезервовано'),
    ('Ford', 'Focus', 2019, 490000, 'продано');

INSERT INTO клієнти (прізвище, "ім'я", телефон, email) VALUES
    ('Кравченко', 'Олег', '0671112233', 'kravchenko.o@example.com'),
    ('Іванов', 'Сергій', '0672223344', 'ivanov.s@example.com'),
    ('Петрова', 'Ганна', '0673334455', 'petrova.h@example.com'),
    ('Захарченко', 'Віктор', '0674445566', 'zakharchenko.v@example.com'),
    ('Мельник', 'Юлія', '0675556677', 'melnyk.y@example.com'),
    ('Ткачук', 'Роман', '0676667788', 'tkachuk.r@example.com');

INSERT INTO продажі (car_id, client_id, дата_продажу, ціна_продажу) VALUES
    (1, 1, '2026-04-01', 715000),
    (2, 2, '2026-04-05', 645000),
    (3, 3, '2026-04-10', 775000),
    (4, 4, '2026-04-15', 575000),
    (5, 5, '2026-04-20', 945000),
    (6, 6, '2026-04-25', 485000),
    (2, 1, '2026-04-28', 648000),
    (4, 3, '2026-05-01', 578000),
    (1, 5, '2026-05-03', 718000),
    (3, 6, '2026-05-05', 778000);
