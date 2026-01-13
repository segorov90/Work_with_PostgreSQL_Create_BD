-- Создание таблицы Artists
create table if not exists Artists(
	id serial primary key,
	Name text not null
);

-- Заполнение таблицы Artists
insert into artists(name) values
('Егор'), 
('Кристина'), 
('Антон'), 
('Джиган');

-- Создание таблицы Albums
create table if not exists Albums(
	id serial primary key,
	Title text not null,
	Release_year integer
);

-- Заполнение таблицы Albums
insert into albums (title, release_year) values
('Баллады', 2012), 
('Зима', 2013), 
('Темная ночь', 2000);

-- Сoздание таблицы Album_Artists (связь многие-ко-многим между Artists и Album)
create table if not exists Album_Artists(
	artists integer,
	albums integer,
	primary key (artists, albums),
	foreign key (artists) references artists(id) on delete cascade,
	foreign key (albums) references albums(id) on delete cascade
);

-- Заполняем таблицу Album_Artists
INSERT INTO Album_Artists (artists, albums) VALUES
(1, 3), 
(4, 2),  
(3, 2), 
(2, 1), 
(2, 3); 

-- Создание таблицы Genres
create table if not exists Genres (
	id serial primary key,
	Title text not null unique
);

-- Заполнение таблицы Genres
insert into genres(title) values ('Рок'), 
('Поп'), 
('Джаз');

-- Создание таблицы Artists_Genres (связь многие-ко-многим между Artists и Genres)
create table if not exists Artist_genres (
	Genres integer,
	Artists integer,
	primary key (Genres, Artists),
	foreign key (Genres) references Genres(id) on delete cascade,
	foreign key (Artists) references Artists(id) on delete cascade
);

-- Заполняем таблицу Artists_Genres
INSERT INTO Artist_genres (Genres, Artists) VALUES
(1, 3), 
(2, 1), 
(2, 2), 
(3, 4), 
(2, 4);

-- Создание таблицы Tracks
create table if not exists Tracks (
	id serial primary key,
	Title text not null,
	Duration integer, -- в секундах
	Albums integer,
	foreign key (Albums) references Albums(id) on delete cascade
);

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

-- Создание таблицы Collections
create table if not exists Collections (
	id serial primary key,
	Title text not null,
	Release_year integer
);

-- Заполняем таблицу Collections
INSERT INTO Collections (Title, Release_year) VALUES
('Лучшие хиты 2012-2013', 2014),
('Зимние песни', 2015),
('Романтические баллады', 2016),
('Ночная музыка', 2017),
('Рок-коллекция', 2018),
('Поп-хиты', 2019);

-- Создание таблицы Collection_Tracks (связь многие-ко-многим между Collections и Tracks)
CREATE TABLE IF NOT EXISTS Collection_Tracks (
    Track_id INTEGER REFERENCES Tracks(id) ON DELETE CASCADE,
    Collection_id INTEGER REFERENCES Collections(id) ON DELETE CASCADE,
    PRIMARY KEY (Track_id, Collection_id)
);

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