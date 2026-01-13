-- Создание таблицы Artists
create table if not exists Artists(
	id serial primary key,
	Name text not null
);

-- Создание таблицы Albums
create table if not exists Albums(
	id serial primary key,
	Title text not null,
	Release_year integer
);

-- Сoздание таблицы Album_Artists (связь многие-ко-многим между Artists и Album)
create table if not exists Album_Artists(
	artists integer,
	albums integer,
	primary key (artists, albums),
	foreign key (artists) references artists(id) on delete cascade,
	foreign key (albums) references albums(id) on delete cascade
);

-- Создание таблицы Genres
create table if not exists Genres (
	id serial primary key,
	Title text not null unique
);

-- Создание таблицы Artists_Genres (связь многие-ко-многим между Artists и Genres)
create table if not exists Artist_genres (
	Genres integer,
	Artists integer,
	primary key (Genres, Artists),
	foreign key (Genres) references Genres(id) on delete cascade,
	foreign key (Artists) references Artists(id) on delete cascade
);

-- Создание таблицы Tracks
create table if not exists Tracks (
	id serial primary key,
	Title text not null,
	Duration integer, -- в секундах
	Albums integer,
	foreign key (Albums) references Albums(id) on delete cascade
);

-- Создание таблицы Collections
create table if not exists Collections (
	id serial primary key,
	Title text not null,
	Release_year integer
);

-- Создание таблицы Collection_Tracks (связь многие-ко-многим между Collections и Tracks)
CREATE TABLE IF NOT EXISTS Collection_Tracks (
    Track_id INTEGER REFERENCES Tracks(id) ON DELETE CASCADE,
    Collection_id INTEGER REFERENCES Collections(id) ON DELETE CASCADE,
    PRIMARY KEY (Track_id, Collection_id)
);