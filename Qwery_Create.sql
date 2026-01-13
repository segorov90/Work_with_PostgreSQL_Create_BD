-- Создание таблицы Artists
CREATE TABLE IF NOT EXISTS Artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Создание таблицы Albums
CREATE TABLE IF NOT EXISTS Albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INTEGER NOT NULL
);

-- Сoздание таблицы Album_Artists (связь многие-ко-многим между Artists и Album)
CREATE TABLE IF NOT EXISTS Album_Artists (
    artist_id INTEGER REFERENCES Artists(id) ON DELETE CASCADE,
    album_id INTEGER REFERENCES Albums(id) ON DELETE CASCADE,
    PRIMARY KEY (artist_id, album_id)
);

-- Создание таблицы Genres
CREATE TABLE IF NOT EXISTS Genres (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL UNIQUE
);

-- Создание таблицы Artists_Genres (связь многие-ко-многим между Artists и Genres)
CREATE TABLE IF NOT EXISTS Artist_Genres (
    artist_id INTEGER REFERENCES Artists(id) ON DELETE CASCADE,
    genre_id INTEGER REFERENCES Genres(id) ON DELETE CASCADE,
    PRIMARY KEY (artist_id, genre_id)
);

-- Создание таблицы Tracks
CREATE TABLE IF NOT EXISTS Tracks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration INTEGER NOT NULL,
    album_id INTEGER REFERENCES Albums(id) ON DELETE CASCADE
);

-- Создание таблицы Collections
CREATE TABLE IF NOT EXISTS Collections (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INTEGER NOT NULL
);

-- Создание таблицы Collection_Tracks (связь многие-ко-многим между Collections и Tracks)
CREATE TABLE IF NOT EXISTS Collection_Tracks (
    track_id INTEGER REFERENCES Tracks(id) ON DELETE CASCADE,
    collection_id INTEGER REFERENCES Collections(id) ON DELETE CASCADE,
    PRIMARY KEY (track_id, collection_id)
);