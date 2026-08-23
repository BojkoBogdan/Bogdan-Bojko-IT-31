-- Варіант 6. Готель
-- Повний стан бази ПІСЛЯ завершення Практики 4 (див. коментар у
-- v1_result.sql — той самий файл перевикористовується Практикою 5 і
-- далі, до Практики 13).

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS бронювання;
DROP TABLE IF EXISTS гості;
DROP TABLE IF EXISTS номери;

CREATE TABLE номери (
    id INTEGER PRIMARY KEY,
    тип TEXT NOT NULL,
    ціна_за_ніч REAL NOT NULL,
    місткість INTEGER,
    статус TEXT NOT NULL DEFAULT 'вільний'
);

CREATE TABLE гості (
    id INTEGER PRIMARY KEY,
    прізвище TEXT NOT NULL,
    "ім'я" TEXT NOT NULL,
    email TEXT UNIQUE,
    телефон TEXT
);

CREATE TABLE бронювання (
    id INTEGER PRIMARY KEY,
    room_id INTEGER NOT NULL,
    guest_id INTEGER NOT NULL,
    дата_заїзду TEXT NOT NULL,
    дата_виїзду TEXT NOT NULL,
    FOREIGN KEY (room_id) REFERENCES номери (id) ON DELETE RESTRICT,
    FOREIGN KEY (guest_id) REFERENCES гості (id) ON DELETE RESTRICT
);

INSERT INTO номери (тип, ціна_за_ніч, місткість, статус) VALUES
    ('Стандарт', 1200, 2, 'вільний'),
    ('Стандарт', 1200, 2, 'зайнятий'),
    ('Комфорт', 1800, 2, 'вільний'),
    ('Люкс', 3200, 4, 'вільний'),
    ('Сімейний', 2500, 4, 'зайнятий'),
    ('Економ', 800, 1, 'вільний');

INSERT INTO гості (прізвище, "ім'я", email, телефон) VALUES
    ('Коваль', 'Андрій', 'koval.a@example.com', '0631112233'),
    ('Гриценко', 'Олена', 'hrytsenko.o@example.com', '0632223344'),
    ('Бондаренко', 'Ігор', 'bondarenko.i@example.com', '0633334455'),
    ('Литвин', 'Марія', 'lytvyn.m@example.com', '0634445566'),
    ('Шевчук', 'Дмитро', 'shevchuk.d@example.com', '0635556677'),
    ('Кравчук', 'Софія', 'kravchuk.s@example.com', '0636667788');

INSERT INTO бронювання (room_id, guest_id, дата_заїзду, дата_виїзду) VALUES
    (1, 1, '2026-05-01', '2026-05-03'),
    (2, 2, '2026-05-02', '2026-05-05'),
    (3, 3, '2026-05-03', '2026-05-06'),
    (4, 4, '2026-05-04', '2026-05-08'),
    (5, 5, '2026-05-05', '2026-05-07'),
    (6, 6, '2026-05-06', '2026-05-07'),
    (1, 3, '2026-05-08', '2026-05-10'),
    (2, 4, '2026-05-09', '2026-05-11'),
    (3, 5, '2026-05-10', '2026-05-12'),
    (4, 6, '2026-05-11', '2026-05-13');
