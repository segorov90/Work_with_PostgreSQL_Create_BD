-- Заполнение таблицы Artists
insert into artists(name) values
('Егор'),
('Кристина'),
('Антон'),
('Джиган');

-- Заполнение таблицы Albums
insert into albums (title, release_year) values
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
insert into genres(title) values ('Рок'),
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
insert into Tracks (title, duration, albums) values
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