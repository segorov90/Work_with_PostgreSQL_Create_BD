-- Заполнение таблицы Artists
INSERT INTO artists(name) VALUES
('Егор'),
('Кристина'),
('Антон'),
('Джиган');

-- Заполнение таблицы Albums
INSERT INTO albums (title, release_year) VALUES
('Баллады', 2012),
('Зима', 2013),
('Темная ночь', 2000);

-- Заполняем таблицу Album_Artists
INSERT INTO Album_Artists (artists, albums) VALUES
(1, 3),
(4, 2),
(3, 2),
(2, 1),
(2, 3);

-- Заполнение таблицы Genres
INSERT INTO genres(title) VALUES
('Рок'),
('Поп'),
('Джаз');

-- Заполняем таблицу Artists_Genres
INSERT INTO Artist_genres (Genres, Artists) VALUES
(1, 3),
(2, 1),
(2, 2),
(3, 4),
(2, 4);

-- Заполнение таблицы Tracks
INSERT INTO Tracks (title, duration, albums) VALUES
('Мой город', 240, 1),
('Снежинки', 180, 2),
('Звезды', 210, 1),
('Метель', 195, 2),
('Ночной звонок', 265, 3),
('Не твоя вина', 230, 1),
('Тает дым', 200, 2),
('Беги', 185, 3);

-- Заполняем таблицу Collections
INSERT INTO Collections (Title, Release_year) VALUES
('Лучшие хиты 2012-2013', 2014),
('Зимние песни', 2015),
('Романтические баллады', 2016),
('Ночная музыка', 2017),
('Рок-коллекция', 2018),
('Поп-хиты', 2019);

-- Заполняем таблицу Collection_Tracks

-- Лучшие хиты 2012-2013 (ID: 1)
INSERT INTO Collection_Tracks (Track_id, Collection_id) VALUES
(1, 1),
(2, 1),
(3, 1),
(6, 1);

-- Зимние песни (ID: 2)
INSERT INTO Collection_Tracks (Track_id, Collection_id) VALUES
(2, 2),
(4, 2),
(7, 2);

-- Романтические баллады (ID: 3)
INSERT INTO Collection_Tracks (Track_id, Collection_id) VALUES
(1, 3),
(3, 3),
(6, 3);

-- Ночная музыка (ID: 4)
INSERT INTO Collection_Tracks (Track_id, Collection_id) VALUES
(5, 4),
(8, 4);

-- Рок-коллекция (ID: 5) - треки Антона (рок)
INSERT INTO Collection_Tracks (Track_id, Collection_id) VALUES
(5, 5),
(8, 5);

-- Поп-хиты (ID: 6) - поп-треки
INSERT INTO Collection_Tracks (Track_id, Collection_id) VALUES
(1, 6),
(2, 6),
(3, 6),
(4, 6),
(6, 6),
(7, 6);

-- Подготовка таблицы ко 2 заданию, добавление в таблицу недостающих данных
-- 1. Добавим трек длительностью более 3,5 минут (210 секунд)
INSERT INTO Tracks (title, duration, albums) VALUES
('Моя любовь', 250, 1),  -- 4 минуты 10 секунд, содержит "мой"
('My Way', 300, 2),      -- 5 минут, содержит "my"
('Долгая дорога', 400, 3); -- 6 минут 40 секунд

-- 2. Добавим сборники в период 2018-2020
UPDATE Collections
SET Release_year = 2018
WHERE id = 5; -- Рок-коллекция теперь 2018

UPDATE Collections
SET Release_year = 2019
WHERE id = 6; -- Поп-хиты теперь 2019

INSERT INTO Collections (Title, Release_year) VALUES
('Хиты 2020', 2020);

-- 3. Добавим исполнителей с одним словом в имени
INSERT INTO Artists (name) VALUES
('Земфира'),
('БИ-2');

-- Подготовка таблицы к 3 заданию, добавление в таблицу недостающих данных

-- Добавим больше исполнителей для разнообразия жанров
INSERT INTO Artists (name) VALUES
('Григорий Лепс'),
('Леди Гага'),
('Металлика'),
('Луи Армстронг'),
('Eminem');

-- Добавим больше жанров
INSERT INTO Genres (title) VALUES
('Шансон'),
('Рэп'),
('Метал');

-- Добавим связи исполнителей с жанрами
INSERT INTO Artist_genres (Genres, Artists) VALUES
-- Григорий Лепс - шансон
(4, 9),
-- Леди Гага - поп
(2, 10),
-- Металлика - метал, рок
(7, 11),
(1, 11),
-- Луи Армстронг - джаз
(3, 12),
-- Eminem - рэп
(6, 13);

-- Добавим альбомы 2019-2020 годов
INSERT INTO Albums (title, release_year) VALUES
('Chromatica', 2020),
('Music to Be Murdered By', 2020),
('72 Seasons', 2023),
('В центре Земли', 2019),
('Легенды', 2018);

-- Добавим связи новых альбомов с исполнителями
INSERT INTO Album_Artists (artists, albums) VALUES
(10, 4),
(13, 5),
(11, 6),
(9, 7),
(1, 8);

-- Добавим треки в новые альбомы 2019-2020
INSERT INTO Tracks (title, duration, albums) VALUES
('Rain On Me', 182, 4),
('Stupid Love', 193, 4),
('Godzilla', 210, 5),
('Darkness', 337, 5),
('В центре Земли', 245, 7),
('Рюмка водки', 231, 7),
('Lux Æterna', 187, 6),
('Легенда', 215, 8);

-- Добавим сборники с разными исполнителями
INSERT INTO Collections (Title, Release_year) VALUES
('Поп-хиты 2020', 2021),
('Рэп-битвы', 2021),
('Шансон для души', 2020),
('Джаз классика', 2019);

-- Добавим треки в новые сборники
INSERT INTO Collection_Tracks (Track_id, Collection_id) VALUES
-- Поп-хиты 2020 (ID: 7)
(9, 7),
(10, 7),
-- Рэп-битвы (ID: 8)
(11, 8),
(12, 8),
-- Шансон для души (ID: 9)
(13, 9),
(14, 9),
-- Джаз классика (ID: 10)
(1, 10),
(6, 10);

-- Подготовка данных к четвертому заданию

-- Добавим исполнителя, который работает в нескольких жанрах
INSERT INTO Artists (name) VALUES ('Борис Гребенщиков');

-- Добавим связи исполнителя с несколькими жанрами
INSERT INTO Artist_genres (Genres, Artists) VALUES
(1, 14),
(3, 14);

-- Добавим альбом для этого исполнителя
INSERT INTO Albums (title, release_year) VALUES ('Русский альбом', 2021);

-- Добавим связь альбома с исполнителем
INSERT INTO Album_Artists (artists, albums) VALUES (14, 9);

-- Добавим треки в этот альбом
INSERT INTO Tracks (title, duration, albums) VALUES
('Город золотой', 180, 9),
('Под небом голубым', 195, 9),
('Сидя на красивом холме', 210, 9);

-- Добавим исполнителя, который тоже работает в нескольких жанрах (уже есть Джиган с Поп и Джаз)
-- Обновим Джигана - добавим еще жанр Рэп
INSERT INTO Genres (title) VALUES ('Рэп') ON CONFLICT (title) DO NOTHING;

-- Найдем ID жанра Рэп
-- Затем добавим связь Джиган - Рэп
INSERT INTO Artist_genres (Genres, Artists)
SELECT g.id, 4
FROM Genres g
WHERE g.Title = 'Рэп'
AND NOT EXISTS (
    SELECT 1 FROM Artist_genres ag
    WHERE ag.Genres = g.id AND ag.Artists = 4
);

-- Создадим несколько треков, которые НЕ входят в сборники
INSERT INTO Tracks (title, duration, albums) VALUES
('Неизвестный трек 1', 150, 1),
('Редкая песня', 165, 2),
('Бонус-трек', 140, 3);

-- Добавим самый короткий трек
INSERT INTO Tracks (title, duration, albums) VALUES
('Короткий припев', 60, 1),
('Интро', 45, 2);

-- Создадим альбом с минимальным количеством треков
INSERT INTO Albums (title, release_year) VALUES ('Мини-альбом', 2022);

-- Добавим только 1 трек в этот альбом
INSERT INTO Tracks (title, duration, albums) VALUES ('Единственный трек', 200, 10);

-- Добавим связь альбома с исполнителем
INSERT INTO Album_Artists (artists, albums) VALUES (1, 10);