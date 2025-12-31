-- Создание таблицы Artists
CREATE TABLE Artists (
    Artist_id INTEGER PRIMARY KEY,
    Title TEXT NOT NULL
);

-- Создание таблицы Albums
CREATE TABLE Albums (Album_id INTEGER PRIMARY KEY,
    Title TEXT NOT NULL,
    Release_year INTEGER
);

-- Создание таблицы Album_Artists (связь многие-ко-многим между Artists и Albums)
CREATE TABLE Album_Artists (
    Artist_id INTEGER,
    Album_id INTEGER,
    PRIMARY KEY (Artist_id, Album_id),
    FOREIGN KEY (Artist_id) REFERENCES Artists(Artist_id) ON DELETE CASCADE,
    FOREIGN KEY (Album_id) REFERENCES Albums(Album_id) ON DELETE CASCADE
);

-- Создание таблицы Genres
    CREATE TABLE Genres (
    Gener_id INTEGER PRIMARY KEY,
    Name TEXT NOT NULL UNIQUE
);

-- Создание таблицы Artists_Genres (связь многие-ко-многим между Artists и Genres)
CREATE TABLE Artists_Genres (
    Gener_id INTEGER,
    Artist_id INTEGER,
    PRIMARY KEY (Gener_id, Artist_id),
    FOREIGN KEY (Gener_id) REFERENCES Genres (Gener_id) ON DELETE CASCADE,
    FOREIGN KEY (Artist_id) REFERENCES Artists (Artist_id) ON DELETE CASCADE
);

-- Создание таблицы Tracks
CREATE TABLE Tracks (
    Track_id INTEGER PRIMARY KEY,
    Title TEXT NOT NULL,
    Duration INTEGER, -- В секундах
    Album_id INTEGER,
FOREIGN KEY (Album_id) REFERENCES Albums(Album_id) ON DELETE SET NULL
);

-- Создание таблицы Collections
CREATE TABLE Collections (
    Collection_id INTEGER PRIMARY KEY,
    Title TEXT NOT NULL,
    Release_year INTEGER
);

-- Создание таблицы Collections_Tracks (связь многие-ко-многим между Collections и Tracks)
CREATE TABLE Collections_Tracks (
    Collection_id INTEGER,
    Track_id INTEGER,
    PRIMARY KEY (Collection_id, Track_id),
    FOREIGN KEY (Collection_id) REFERENCES Collections(Collection_id) ON DELETE CASCADE,
    FOREIGN KEY (Track_id) REFERENCES Tracks(Track_id) ON DELETE CASCADE
);