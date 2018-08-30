-- Query all of the entries in the Genre table
SELECT * FROM Genre;

SELECT Label FROM Genre;

-- Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist VALUES (null, "Jisie", 1989);

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album VALUES (null, "Jisie's Album","11/11/11",1234,"Jisie Records", 28, 1);

-- Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song VALUES (null, "Jisie's first song", 400, "12/12/12", 1, 28, 23);
INSERT INTO Song VALUES (null, "Jisie's second song", 450, "13/13/13", 1, 28, 23);

/** Write a SELECT query that provides the song titles, album title, and artist name for all of 
the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the 
WHERE keyword to filter the results to the album and artist you added. **/
SELECT s.Title, a.Title, ar.ArtistName FROM ((Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId) LEFT JOIN Artist ar ON s.ArtistId = ar.ArtistId) WHERE s.ArtistId = 28;

-- Using SELECT and LEFT JOIN, write a query that displays the song title, the song duration, the album label, and the genre name for every song.
SELECT s.Title, s.SongLength, a.Label, g.Label FROM ((Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId ) LEFT JOIN Genre g ON s.GenreId = g.GenreId);

-- Using a WHERE clause, modify the previous query to only show the information for songs that have a duration of 250 or greater.
SELECT s.Title, s.SongLength, a.Label, g.Label "Genre" FROM ((Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId ) LEFT JOIN Genre g ON s.GenreId = g.GenreId) WHERE s.SongLength >=250;

-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT s.AlbumId, a.Title, count(s.SongId)
FROM Song s 
JOIN Album a ON s.AlbumId = a.AlbumId
GROUP BY s.AlbumId;

-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT ar.ArtistId, ar.ArtistName, count(s.SongId)
FROM Song s 
JOIN Artist ar ON s.ArtistId = ar.ArtistId
GROUP BY s.ArtistId;

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT g.GenreId, g.Label, count(s.SongId)
FROM Song s 
JOIN Genre g ON s.GenreId = g.GenreId
GROUP BY s.GenreId;

-- Write a SELECT statement to display how many artists exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT g.GenreId, g.Label, count(ar.ArtistId)
FROM Song s 
JOIN Genre g ON s.GenreId = g.GenreId
JOIN ARTIST ar ON s.ArtistId = ar.ArtistId
GROUP BY s.GenreId;

-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT a.Title, MAX(a.AlbumLength)
FROM Album a;

-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT s.Title, MAX(s.SongLength) FROM Song s;

-- Modify the previous query to also display the title of the album.
SELECT s.Title, a.AlbumId, MAX(s.SongLength) FROM Song s JOIN Album a ON s.AlbumId = a.AlbumId;

/**
SELECT * 
FROM Artist 
WHERE ArtistName = "Jisie";

SELECT * FROM Artist WHERE ArtistName = "Jisie" OR ArtistName = "deadmau5";

SELECT * FROM Artist WHERE ArtistName = "Jisie" OR ArtistName LIKE "d%";

SELECT taco.Title, burrito.Title 
FROM Album taco 
LEFT JOIN Song burrito ON burrito.AlbumId = taco.AlbumId;

SELECT taco.Title, burrito.Title 
FROM Album taco 
JOIN Song burrito ON burrito.AlbumId = taco.AlbumId; **/