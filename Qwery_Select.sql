-- 1. Название и продолжительность самого длительного трека
SELECT
    Title AS "Название трека",
    Duration AS "Продолжительность (сек)",
    CONCAT(FLOOR(Duration / 60), ' мин ', Duration % 60, ' сек') AS "Продолжительность"
FROM Tracks
WHERE Duration = (SELECT MAX(Duration) FROM Tracks);

-- 2. Название треков, продолжительность которых не менее 3,5 минут (210 секунд)
SELECT
    Title AS "Название трека",
    Duration AS "Продолжительность (сек)",
    CONCAT(FLOOR(Duration / 60), ' мин ', Duration % 60, ' сек') AS "Продолжительность"
FROM Tracks
WHERE Duration >= 210
ORDER BY Duration DESC;

-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT
    Title AS "Название сборника",
    Release_year AS "Год выпуска"
FROM Collections
WHERE Release_year BETWEEN 2018 AND 2020
ORDER BY Release_year;

-- 4. Исполнители, чьё имя состоит из одного слова
SELECT
    Name AS "Исполнитель"
FROM Artists
WHERE Name NOT LIKE '% %'
  AND Name NOT LIKE '%-%'
  AND Name NOT LIKE '%''%'
ORDER BY Name;

-- 5. Название треков, которые содержат слово «мой» или «my»
SELECT
    Title AS "Название трека",
    Duration AS "Длительность (сек)"
FROM Tracks
WHERE LOWER(Title) LIKE '%мой%'
   OR LOWER(Title) LIKE '%my%'
ORDER BY Title;

-- Задание № 3

-- 1) Количество исполнителей в каждом жанре
SELECT
    g.Title AS "Жанр",
    COUNT(ag.Artists) AS "Количество исполнителей"
FROM Genres g
LEFT JOIN Artist_genres ag ON g.id = ag.Genres
GROUP BY g.id, g.Title
ORDER BY COUNT(ag.Artists) DESC, g.Title;

-- 2) Количество треков, вошедших в альбомы 2019–2020 годов
SELECT
    COUNT(t.id) AS "Количество треков в альбомах 2019-2020"
FROM Tracks t
JOIN Albums a ON t.Albums = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- С более детальной информацией:
SELECT
    a.Title AS "Альбом",
    a.release_year AS "Год выпуска",
    COUNT(t.id) AS "Количество треков"
FROM Albums a
JOIN Tracks t ON a.id = t.Albums
WHERE a.release_year BETWEEN 2019 AND 2020
GROUP BY a.id, a.Title, a.release_year
ORDER BY a.release_year DESC;

-- 3) Средняя продолжительность треков по каждому альбому
SELECT
    a.Title AS "Альбом",
    a.release_year AS "Год выпуска",
    ROUND(AVG(t.Duration), 2) AS "Средняя продолжительность (сек)",
    CONCAT(
        FLOOR(ROUND(AVG(t.Duration), 0) / 60),
        ' мин ',
        ROUND(AVG(t.Duration), 0) % 60,
        ' сек'
    ) AS "Средняя продолжительность"
FROM Albums a
JOIN Tracks t ON a.id = t.Albums
GROUP BY a.id, a.Title, a.release_year
ORDER BY AVG(t.Duration) DESC;

-- 4) Все исполнители, которые не выпустили альбомы в 2020 году
SELECT
    ar.Name AS "Исполнитель",
    STRING_AGG(DISTINCT a.Title, ', ') AS "Альбомы",
    STRING_AGG(DISTINCT CAST(a.release_year AS TEXT), ', ') AS "Годы выпуска"
FROM Artists ar
LEFT JOIN Album_Artists aa ON ar.id = aa.artists
LEFT JOIN Albums a ON aa.albums = a.id
WHERE ar.id NOT IN (
    SELECT DISTINCT aa2.artists
    FROM Album_Artists aa2
    JOIN Albums a2 ON aa2.albums = a2.id
    WHERE a2.release_year = 2020
)
GROUP BY ar.id, ar.Name
ORDER BY ar.Name;

-- Альтернативный вариант (проще):
SELECT DISTINCT
    ar.Name AS "Исполнитель"
FROM Artists ar
WHERE ar.id NOT IN (
    SELECT DISTINCT aa.artists
    FROM Album_Artists aa
    JOIN Albums a ON aa.albums = a.id
    WHERE a.release_year = 2020
)
ORDER BY ar.Name;

-- 5) Названия сборников, в которых присутствует конкретный исполнитель
-- Выберем исполнителя "Леди Гага" (id = 10)
SELECT
    c.Title AS "Сборник",
    c.Release_year AS "Год выпуска",
    ar.Name AS "Исполнитель",
    STRING_AGG(t.Title, ', ') AS "Треки в сборнике"
FROM Collections c
JOIN Collection_Tracks ct ON c.id = ct.Collection_id
JOIN Tracks t ON ct.Track_id = t.id
JOIN Albums a ON t.Albums = a.id
JOIN Album_Artists aa ON a.id = aa.albums
JOIN Artists ar ON aa.artists = ar.id
WHERE ar.id = 10  -- ID Леди Гаги
GROUP BY c.id, c.Title, c.Release_year, ar.Name
ORDER BY c.Release_year DESC;

-- Для другого исполнителя (например, "Джиган" - id = 4)
SELECT
    c.Title AS "Сборник",
    c.Release_year AS "Год выпуска сборника",
    ar.Name AS "Исполнитель",
    COUNT(t.id) AS "Количество треков"
FROM Collections c
JOIN Collection_Tracks ct ON c.id = ct.Collection_id
JOIN Tracks t ON ct.Track_id = t.id
JOIN Albums a ON t.Albums = a.id
JOIN Album_Artists aa ON a.id = aa.albums
JOIN Artists ar ON aa.artists = ar.id
WHERE ar.id = 4  -- ID Джигана
GROUP BY c.id, c.Title, c.Release_year, ar.Name
ORDER BY c.Release_year DESC;