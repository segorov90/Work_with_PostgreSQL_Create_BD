-- Задание № 2
-- 1. Название и продолжительность самого длительного трека
SELECT
    title AS "Название трека",
    duration AS "Длительность (сек)"
FROM Tracks
WHERE duration = (SELECT MAX(duration) FROM Tracks);

-- 2. Название треков, продолжительность которых не менее 3,5 минут (210 секунд)
SELECT
    title AS "Название трека",
    duration AS "Длительность (сек)"
FROM Tracks
WHERE duration >= 210
ORDER BY duration DESC;

-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT
    title AS "Название сборника",
    release_year AS "Год выпуска"
FROM Collections
WHERE release_year BETWEEN 2018 AND 2020
ORDER BY release_year;

-- 4. Исполнители, чьё имя состоит из одного слова
SELECT
    name AS "Исполнитель"
FROM Artists
WHERE name NOT LIKE '% %'
   AND name NOT LIKE '%-%';

-- 5. Название треков, которые содержат слово «мой» или «my» (как отдельные слова)
SELECT
    title AS "Название трека",
    duration AS "Длительность (сек)"
FROM Tracks
WHERE (
    LOWER(title) ~ '\m(my|мой)\M'
    OR LOWER(title) IN ('my', 'мой')
)
ORDER BY title;

-- Задание № 3

-- 1. Количество исполнителей в каждом жанре
SELECT
    g.title AS "Жанр",
    COUNT(ag.artist_id) AS "Количество исполнителей"
FROM Genres g
LEFT JOIN Artist_Genres ag ON g.id = ag.genre_id
GROUP BY g.id, g.title
ORDER BY COUNT(ag.artist_id) DESC;

-- 2. Количество треков, вошедших в альбомы 2019–2020 годов
SELECT
    COUNT(t.id) AS "Количество треков в альбомах 2019-2020"
FROM Tracks t
JOIN Albums a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- 3. Средняя продолжительность треков по каждому альбому
SELECT
    a.title AS "Альбом",
    a.release_year AS "Год выпуска",
    ROUND(AVG(t.duration), 2) AS "Средняя продолжительность (сек)",
    COUNT(t.id) AS "Количество треков"
FROM Albums a
LEFT JOIN Tracks t ON a.id = t.album_id
GROUP BY a.id, a.title, a.release_year
ORDER BY a.release_year DESC;

-- 4. Все исполнители, которые не выпустили альбомы в 2020 году
SELECT DISTINCT
    ar.name AS "Исполнитель"
FROM Artists ar
WHERE ar.id NOT IN (
    SELECT DISTINCT aa.artist_id
    FROM Album_Artists aa
    JOIN Albums al ON aa.album_id = al.id
    WHERE al.release_year = 2020
)
ORDER BY ar.name;

-- 5. Названия сборников, в которых присутствует конкретный исполнитель (например, "Джиган" id = 4)
SELECT DISTINCT
    c.title AS "Сборник",
    c.release_year AS "Год выпуска"
FROM Collections c
JOIN Collection_Tracks ct ON c.id = ct.collection_id
JOIN Tracks t ON ct.track_id = t.id
JOIN Albums a ON t.album_id = a.id
JOIN Album_Artists aa ON a.id = aa.album_id
JOIN Artists ar ON aa.artist_id = ar.id
WHERE ar.id = 4
ORDER BY c.release_year;

-- Задание № 4

-- 1. Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT DISTINCT
    a.title AS "Альбом",
    a.release_year AS "Год выпуска"
FROM Albums a
JOIN Album_Artists aa ON a.id = aa.album_id
JOIN Artists ar ON aa.artist_id = ar.id
WHERE ar.id IN (
    SELECT artist_id
    FROM Artist_Genres
    GROUP BY artist_id
    HAVING COUNT(genre_id) > 1
)
ORDER BY a.title;

-- 2. Наименования треков, которые не входят в сборники
SELECT
    t.title AS "Трек не в сборниках",
    t.duration AS "Длительность (сек)"
FROM Tracks t
LEFT JOIN Collection_Tracks ct ON t.id = ct.track_id
WHERE ct.track_id IS NULL
ORDER BY t.title;

-- 3. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек
SELECT DISTINCT
    ar.name AS "Исполнитель",
    t.title AS "Самый короткий трек",
    t.duration AS "Длительность (сек)"
FROM Tracks t
JOIN Albums a ON t.album_id = a.id
JOIN Album_Artists aa ON a.id = aa.album_id
JOIN Artists ar ON aa.artist_id = ar.id
WHERE t.duration = (SELECT MIN(duration) FROM Tracks);

-- 4. Названия альбомов, содержащих наименьшее количество треков
SELECT
    a.title AS "Альбом",
    a.release_year AS "Год выпуска",
    COUNT(t.id) AS "Количество треков"
FROM Albums a
LEFT JOIN Tracks t ON a.id = t.album_id
GROUP BY a.id, a.title, a.release_year
HAVING COUNT(t.id) = (
    SELECT MIN(track_count)
    FROM (
        SELECT COUNT(t2.id) as track_count
        FROM Albums a2
        LEFT JOIN Tracks t2 ON a2.id = t2.album_id
        GROUP BY a2.id
    ) AS album_tracks
)
ORDER BY a.title;