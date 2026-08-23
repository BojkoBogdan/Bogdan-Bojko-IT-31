-- Варіант 1. Бібліотека
-- Повний стан бази ПІСЛЯ завершення Практики 4: усі три таблиці зі
-- зв'язками (не лише таблиця-вимір 1, як у v1_prerequisites.sql).
-- Це стан, з якого починаються Практика 5 і всі наступні практики аж
-- до Практики 13 (де схема знову зміниться) — той самий файл достатньо
-- перевикористати, окремий файл під кожну таку практику не потрібен.
-- ON DELETE RESTRICT для обох FK — орієнтовний варіант (у Завданні 2
-- Практики 4 ви обираєте дію самостійно й обґрунтовуєте її письмово).

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS видачі;
DROP TABLE IF EXISTS читачі;
DROP TABLE IF EXISTS книги;

CREATE TABLE книги (
    id INTEGER PRIMARY KEY,
    назва TEXT NOT NULL,
    автор TEXT,
    рік_видання INTEGER,
    жанр TEXT,
    кількість_екземплярів INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE читачі (
    id INTEGER PRIMARY KEY,
    прізвище TEXT NOT NULL,
    "ім'я" TEXT NOT NULL,
    email TEXT UNIQUE,
    дата_реєстрації TEXT
);

CREATE TABLE видачі (
    id INTEGER PRIMARY KEY,
    book_id INTEGER NOT NULL,
    reader_id INTEGER NOT NULL,
    дата_видачі TEXT NOT NULL,
    дата_повернення TEXT,
    FOREIGN KEY (book_id) REFERENCES книги (id) ON DELETE RESTRICT,
    FOREIGN KEY (reader_id) REFERENCES читачі (id) ON DELETE RESTRICT
);

INSERT INTO книги (назва, автор, рік_видання, жанр, кількість_екземплярів) VALUES
    ('Кобзар', 'Тарас Шевченко', 1840, 'поезія', 3),
    ('Тигролови', 'Іван Багряний', 1944, 'пригоди', 2),
    ('Захар Беркут', 'Іван Франко', 1883, 'історична проза', 4),
    ('Земля', 'Ольга Кобилянська', 1902, 'проза', 2),
    ('Місто', 'Валер''ян Підмогильний', 1928, 'роман', 2),
    ('Собор', 'Олесь Гончар', 1968, 'роман', 3);

INSERT INTO читачі (прізвище, "ім'я", email, дата_реєстрації) VALUES
    ('Коваль', 'Олена', 'koval.o@example.com', '2026-01-15'),
    ('Гриценко', 'Максим', 'hrytsenko.m@example.com', '2026-02-03'),
    ('Іванова', 'Софія', 'ivanova.s@example.com', '2026-02-20'),
    ('Петренко', 'Андрій', 'petrenko.a@example.com', '2026-03-05'),
    ('Ткаченко', 'Юлія', 'tkachenko.y@example.com', '2026-03-18');

INSERT INTO видачі (book_id, reader_id, дата_видачі, дата_повернення) VALUES
    (1, 1, '2026-04-01', '2026-04-15'),
    (2, 2, '2026-04-02', NULL),
    (3, 1, '2026-04-05', '2026-04-20'),
    (4, 3, '2026-04-06', NULL),
    (5, 4, '2026-04-08', '2026-04-22'),
    (1, 5, '2026-04-10', NULL),
    (2, 3, '2026-04-12', NULL),
    (3, 4, '2026-04-14', NULL);
