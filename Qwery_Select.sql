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