-- Создание таблицы Artists
CREATE TABLE IF NOT EXISTS Artists(
	id SERIAL PRIMARY KEY,
	Name TEXT NOT NULL
);

-- Создание таблицы Albums
CREATE TABLE IF NOT EXISTS Albums(
	id SERIAL PRIMARY KEY,
	Title TEXT NOT NULL,
	Release_year INTEGER
);

-- Сoздание таблицы Album_Artists (связь многие-ко-многим между Artists и Album)
CREATE TABLE IF NOT EXISTS Album_Artists(
	artists INTEGER,
	albums INTEGER,
	PRIMARY KEY (artists, albums),
	FOREIGN KEY (artists) REFERENCES artists(id) ON DELETE CASCADE,
	FOREIGN KEY (albums) REFERENCES albums(id) ON DELETE CASCADE
);

-- Создание таблицы Genres
CREATE TABLE IF NOT EXISTS Genres (
	id SERIAL PRIMARY KEY,
	Title TEXT NOT NULL UNIQUE
);

-- Создание таблицы Artists_Genres (связь многие-ко-многим между Artists и Genres)
CREATE TABLE IF NOT EXISTS Artist_genres (
	Genres INTEGER,
	Artists INTEGER,
	PRIMARY KEY (Genres, Artists),
	FOREIGN KEY (Genres) REFERENCES Genres(id) ON DELETE CASCADE,
	FOREIGN KEY (Artists) REFERENCES Artists(id) ON DELETE CASCADE
);

-- Создание таблицы Tracks
CREATE TABLE IF NOT EXISTS Tracks (
	id SERIAL PRIMARY KEY,
	Title TEXT NOT NULL,
	Duration INTEGER, -- в секундах
	Albums INTEGER,
	FOREIGN KEY (Albums) REFERENCES Albums(id) ON DELETE CASCADE
);

-- Создание таблицы Collections
CREATE TABLE IF NOT EXISTS Collections (
	id SERIAL PRIMARY KEY,
	Title TEXT NOT NULL,
	Release_year INTEGER
);

-- Создание таблицы Collection_Tracks (связь многие-ко-многим между Collections и Tracks)
CREATE TABLE IF NOT EXISTS Collection_Tracks (
    Track_id INTEGER REFERENCES Tracks(id) ON DELETE CASCADE,
    Collection_id INTEGER REFERENCES Collections(id) ON DELETE CASCADE,
    PRIMARY KEY (Track_id, Collection_id)
);