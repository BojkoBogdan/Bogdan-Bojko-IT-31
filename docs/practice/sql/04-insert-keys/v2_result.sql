-- Варіант 2. Інтернет-магазин одягу
-- Повний стан бази ПІСЛЯ завершення Практики 4 (див. коментар у
-- v1_result.sql — той самий файл перевикористовується Практикою 5 і
-- далі, до Практики 13).

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS замовлення;
DROP TABLE IF EXISTS клієнти;
DROP TABLE IF EXISTS товари;

CREATE TABLE товари (
    id INTEGER PRIMARY KEY,
    назва TEXT NOT NULL,
    категорія TEXT,
    розмір TEXT,
    ціна REAL NOT NULL,
    кількість_на_складі INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE клієнти (
    id INTEGER PRIMARY KEY,
    прізвище TEXT NOT NULL,
    "ім'я" TEXT NOT NULL,
    email TEXT UNIQUE,
    місто TEXT
);

CREATE TABLE замовлення (
    id INTEGER PRIMARY KEY,
    product_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    дата TEXT NOT NULL,
    кількість INTEGER NOT NULL DEFAULT 1,
    статус TEXT NOT NULL DEFAULT 'в обробці',
    FOREIGN KEY (product_id) REFERENCES товари (id) ON DELETE RESTRICT,
    FOREIGN KEY (customer_id) REFERENCES клієнти (id) ON DELETE RESTRICT
);

INSERT INTO товари (назва, категорія, розмір, ціна, кількість_на_складі) VALUES
    ('Футболка базова', 'Футболки', 'M', 299.0, 40),
    ('Джинси класичні', 'Джинси', '32', 899.0, 15),
    ('Куртка зимова', 'Куртки', 'L', 2499.0, 8),
    ('Сукня літня', 'Сукні', 'S', 650.0, 20),
    ('Кросівки спортивні', 'Взуття', '42', 1899.0, 12),
    ('Шапка вовняна', 'Аксесуари', 'один розмір', 250.0, 30);

INSERT INTO клієнти (прізвище, "ім'я", email, місто) VALUES
    ('Коваленко', 'Марія', 'maria.k@example.com', 'Київ'),
    ('Бондар', 'Ігор', 'bondar.i@example.com', 'Львів'),
    ('Шевченко', 'Ольга', 'shevchenko.o@example.com', 'Одеса'),
    ('Мельник', 'Андрій', 'melnyk.a@example.com', 'Харків'),
    ('Ткачук', 'Наталія', 'tkachuk.n@example.com', 'Дніпро'),
    ('Гончар', 'Павло', 'honchar.p@example.com', 'Вінниця');

INSERT INTO замовлення (product_id, customer_id, дата, кількість, статус) VALUES
    (1, 1, '2026-05-01', 2, 'виконано'),
    (2, 2, '2026-05-02', 1, 'виконано'),
    (3, 3, '2026-05-03', 1, 'в дорозі'),
    (4, 4, '2026-05-04', 1, 'скасовано'),
    (5, 5, '2026-05-05', 1, 'виконано'),
    (6, 6, '2026-05-06', 2, 'в дорозі'),
    (1, 2, '2026-05-07', 1, 'виконано'),
    (2, 3, '2026-05-08', 3, 'виконано'),
    (3, 1, '2026-05-09', 1, 'в обробці'),
    (4, 5, '2026-05-10', 2, 'виконано');
