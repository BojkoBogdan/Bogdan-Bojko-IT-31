-- Варіант 3. Кінотеатр
-- Повний стан бази ПІСЛЯ завершення Практики 4 (див. коментар у
-- v1_result.sql — той самий файл перевикористовується Практикою 5 і
-- далі, до Практики 13).

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS квитки;
DROP TABLE IF EXISTS глядачі;
DROP TABLE IF EXISTS фільми;

CREATE TABLE фільми (
    id INTEGER PRIMARY KEY,
    назва TEXT NOT NULL,
    жанр TEXT,
    тривалість_хв INTEGER,
    рік INTEGER,
    вікове_обмеження INTEGER
);

CREATE TABLE глядачі (
    id INTEGER PRIMARY KEY,
    прізвище TEXT NOT NULL,
    "ім'я" TEXT NOT NULL,
    email TEXT UNIQUE,
    телефон TEXT
);

CREATE TABLE квитки (
    id INTEGER PRIMARY KEY,
    movie_id INTEGER NOT NULL,
    viewer_id INTEGER NOT NULL,
    зал INTEGER NOT NULL,
    дата_час TEXT NOT NULL,
    ціна_квитка REAL NOT NULL,
    місце TEXT,
    дата_купівлі TEXT,
    FOREIGN KEY (movie_id) REFERENCES фільми (id) ON DELETE RESTRICT,
    FOREIGN KEY (viewer_id) REFERENCES глядачі (id) ON DELETE RESTRICT
);

INSERT INTO фільми (назва, жанр, тривалість_хв, рік, вікове_обмеження) VALUES
    ('Тіні забутих предків', 'драма', 97, 1965, 12),
    ('Захар Беркут', 'бойовик', 115, 2019, 16),
    ('Мавка. Лісова пісня', 'анімація', 94, 2023, 6),
    ('Я, Ти, Він, Вона', 'комедія', 90, 2021, 16),
    ('Атлантида', 'драма', 108, 2019, 16),
    ('Памфір', 'драма', 106, 2022, 18);

INSERT INTO глядачі (прізвище, "ім'я", email, телефон) VALUES
    ('Петренко', 'Олена', 'petrenko.o@example.com', '0501112233'),
    ('Кравчук', 'Іван', 'kravchuk.i@example.com', '0502223344'),
    ('Мороз', 'Тетяна', 'moroz.t@example.com', '0503334455'),
    ('Сидоренко', 'Максим', 'sydorenko.m@example.com', '0504445566'),
    ('Литвин', 'Софія', 'lytvyn.s@example.com', '0505556677'),
    ('Дяченко', 'Артем', 'diachenko.a@example.com', '0506667788');

INSERT INTO квитки (movie_id, viewer_id, зал, дата_час, ціна_квитка, місце, дата_купівлі) VALUES
    (1, 1, 1, '2026-05-01 18:00', 150, 'A5', '2026-04-28'),
    (2, 2, 2, '2026-05-01 20:00', 180, 'B3', '2026-04-29'),
    (3, 3, 1, '2026-05-02 16:00', 120, 'C7', '2026-04-30'),
    (4, 4, 3, '2026-05-02 19:00', 160, 'A1', '2026-05-01'),
    (5, 5, 2, '2026-05-03 18:00', 170, 'D4', '2026-05-01'),
    (6, 6, 1, '2026-05-03 21:00', 190, 'B2', '2026-05-02'),
    (1, 3, 2, '2026-05-04 18:00', 150, 'C1', '2026-05-02'),
    (2, 1, 1, '2026-05-04 20:00', 180, 'A3', '2026-05-03'),
    (3, 4, 3, '2026-05-05 17:00', 120, 'D5', '2026-05-03'),
    (4, 2, 2, '2026-05-05 19:00', 160, 'B6', '2026-05-04');
