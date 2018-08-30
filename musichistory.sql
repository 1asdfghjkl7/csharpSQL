DELETE FROM Song;
DELETE FROM Album;
DELETE FROM Artist;
DELETE FROM Genre;
DELETE FROM RecordLabel;

DROP TABLE IF EXISTS Genre;
DROP TABLE IF EXISTS Artist;
DROP TABLE IF EXISTS Album;
DROP TABLE IF EXISTS Song;
DROP TABLE IF EXISTS RecordLabel;

CREATE TABLE `Genre` (
	`GenreId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Label`	TEXT NOT NULL
);

CREATE TABLE `Artist` (
    `ArtistId`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `ArtistName`    TEXT NOT NULL,
    `YearEstablished`    INTEGER NOT NULL
);


CREATE TABLE `Album` (
	`AlbumId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Title`  TEXT NOT NULL,
	`ReleaseDate` TEXT NOT NULL,
	`AlbumLength` INTEGER NOT NULL,
	`RecordLabelId` INTEGER NOT NULL,
	`ArtistId` INTEGER NOT NULL,
	`GenreId`	INTEGER,
	FOREIGN KEY(`ArtistId`) REFERENCES `Artist`(`ArtistId`),
	FOREIGN KEY(`GenreId`) REFERENCES `Genre`(`GenreId`),
	FOREIGN KEY(`RecordLabelId`) REFERENCES `RecordLabel`(`RecordLabelId`)
);

CREATE TABLE `RecordLabel` (
	`RecordLabelId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Title`  TEXT NOT NULL
);




CREATE TABLE `Song` (
	`SongId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Title`	TEXT NOT NULL,
	`SongLength`	INTEGER NOT NULL,
	`ReleaseDate`	TEXT NOT NULL,
	`GenreId`	INTEGER,
	`ArtistId` INTEGER NOT NULL,
	`AlbumId` INTEGER NOT NULL,
	FOREIGN KEY(`GenreId`) REFERENCES `Genre`(`GenreId`),
	FOREIGN KEY(`ArtistId`) REFERENCES `Artist`(`ArtistId`),
	FOREIGN KEY(`AlbumId`) REFERENCES `Album`(`AlbumId`)

);

INSERT INTO Genre VALUES (null, 'Soul');
INSERT INTO Genre VALUES (null, 'Rock');
INSERT INTO Genre VALUES (null, 'Blues');
INSERT INTO Genre VALUES (null, 'Jazz');
INSERT INTO Genre VALUES (null, 'Heavy Metal');
INSERT INTO Genre VALUES (null, 'R&B');
INSERT INTO Genre VALUES (null, 'Pop');
INSERT INTO Genre VALUES (null, 'Bluegrass');
INSERT INTO Genre VALUES (null, 'Punk');
INSERT INTO Genre VALUES (null, 'Classical');
INSERT INTO Genre VALUES (null, 'Country');
INSERT INTO Genre VALUES (null, 'Latin');
INSERT INTO Genre VALUES (null, 'Rap');
INSERT INTO Genre VALUES (null, 'Electronic');
INSERT INTO Genre VALUES (null, 'Folk');


INSERT INTO Artist VALUES (null, "Judas Priest", 1969);
INSERT INTO Artist VALUES (null, "Def Leppard", 1977);
INSERT INTO Artist VALUES (null, "ZZTop", 1969);
INSERT INTO Artist VALUES (null, "Genesis", 1967);
INSERT INTO Artist VALUES (null, "Journey", 1973);
INSERT INTO Artist VALUES (null, "Beatles", 1960);
INSERT INTO Artist VALUES (null, "Howlin' Wolf", 1959);
INSERT INTO Artist VALUES (null, "Black Flag", 1981);
INSERT INTO Artist VALUES (null, "Porcupine Tree", 1987);
INSERT INTO Artist VALUES (null, "Grateful Dead", 1965);
INSERT INTO Artist VALUES (null, "The Shins", 1996);
INSERT INTO Artist VALUES (null, "Rush", 1968);
INSERT INTO Artist VALUES (null, "The Features", 1998);
INSERT INTO Artist VALUES (null, "Squeeze", 1977);
INSERT INTO Artist VALUES (null, "Midnight Oil", 1976);
INSERT INTO Artist VALUES (null, "Dire Straits", 1977);
INSERT INTO Artist VALUES (null, "Hoodoo Gurus", 1981);
INSERT INTO Artist VALUES (null, "U2", 1976);
INSERT INTO Artist VALUES (null, "Mayer Hawthorne", 2009);
INSERT INTO Artist VALUES (null, "David Bowie", 1968);
INSERT INTO Artist VALUES (null, "Sigur Ros", 1997);
INSERT INTO Artist VALUES (null, "deadmau5", 2006);
INSERT INTO Artist VALUES (null, "Justice", 2007);
INSERT INTO Artist VALUES (null, "Miles Davis", 1948);
INSERT INTO Artist VALUES (null, "The Sheepdogs", 2006);
INSERT INTO Artist VALUES (null, "Coheed & Cambria", 2001);
INSERT INTO Artist VALUES (null, "Jay Z", 1986);
INSERT INTO Artist VALUES (null, "Avett Brothers", 2000);

INSERT INTO RecordLabel VALUES (null, 'American');
INSERT INTO RecordLabel VALUES (null, 'Def Jam');
INSERT INTO RecordLabel VALUES (null, 'Stones Throw');
INSERT INTO RecordLabel VALUES (null, 'Parlophone');
INSERT INTO RecordLabel VALUES (null, 'Columbia');
INSERT INTO RecordLabel VALUES (null, 'Chess');
INSERT INTO RecordLabel VALUES (null, 'Warner Bros');
INSERT INTO RecordLabel VALUES (null, 'SST');
INSERT INTO RecordLabel VALUES (null, 'Stones Throw Records');


INSERT INTO Album
	SELECT null,
		   "True Sadness",
		   '6/24/2016',
		   SUBSTR(ABS(RANDOM())||'', 0, 5),
		   r.RecordLabelId,
		   a.ArtistId,
		   g.GenreId
	FROM Artist a, Genre g, RecordLabel r WHERE a.ArtistName = "Avett Brothers" AND g.Label = "Folk" AND r.Title = 'American';

INSERT INTO Album
	SELECT null,
		   "I and Love and You",
		   '11/29/2009',
		   SUBSTR(ABS(RANDOM())||'', 0, 5),
		   r.RecordLabelId,
		   ArtistId,
		   g.GenreId
	FROM Artist a, Genre g, RecordLabel r WHERE a.ArtistName = "Avett Brothers" AND g.Label = "Folk" AND r.Title = 'American';

INSERT INTO Album
	SELECT null,
		   "The Black Album",
		   '11/14/2003',
		   SUBSTR(ABS(RANDOM())||'', 0, 5),
		   r.RecordLabelId,
		   ArtistId,
		   g.GenreId
	FROM Artist a, Genre g, RecordLabel r WHERE a.ArtistName = "Jay Z" AND g.Label = "Rap" AND r.Title = 'Def Jam';


INSERT INTO Album
	SELECT null,
		   "A Strange Arrangement",
		   '09/08/2009',
		   2082,
		   r.RecordLabelId,
		   ArtistId,
		   g.GenreId
	FROM Artist a, Genre g, RecordLabel r WHERE a.ArtistName = "Mayer Hawthorne" AND g.Label = "Soul" AND r.Title = 'Stones Throw Records';

INSERT INTO Album
	SELECT null,
		   "How Do You Do",
		   '10/11/2011',
		   2357,
		   r.RecordLabelId,
		   ArtistId,
		   g.GenreId
	FROM Artist a, Genre g, RecordLabel r WHERE a.ArtistName = "Mayer Hawthorne" AND g.Label = "Soul" AND r.Title = 'Stones Throw Records';

INSERT INTO Album
	SELECT null,
		   "Where Does This Door Go",
		   '06/16/2013',
		   3114,
		   r.RecordLabelId,
		   a.ArtistId,
		   g.GenreId
	FROM Artist a, Genre g, RecordLabel r WHERE a.ArtistName = "Mayer Hawthorne" AND g.Label = "Soul" AND r.Title = 'Stones Throw Records';



INSERT INTO Album VALUES (null, "Revolver", '08/05/1966', 2083, 4, 6, 2);
INSERT INTO Album VALUES (null, "Sgt. Pepper's Lonely Hearts Club Band", '06/01/1967', 2392, 9, 6, 2);
INSERT INTO Album VALUES (null, "Magical Mystery Tour", '11/27/1967', 1148, 9, 6, 2);

INSERT INTO Album VALUES (null, 'Screaming for Vengeance', '06/17/1982', 2322, 5, 1, 2);
INSERT INTO Album VALUES (null, 'Point of Entry', '02/26/1981', 2262, 5, 1, 2);
INSERT INTO Album VALUES (null, 'Defenders of the Faith', '01/04/1984', 2383, 5, 1, 2);

INSERT INTO Album VALUES (null, 'Round About Midnight', '03/06/1957', 2327, 5, 24, 4);
INSERT INTO Album VALUES (null, 'Miles Ahead', '10/21/1957', 2132, 5, 24, 4);
INSERT INTO Album VALUES (null, 'Milestones', '09/02/1958', 2856, 5, 24, 4);

INSERT INTO Album VALUES (null, "Moanin' in the Moonlight", '05/14/1959', 2033, 6, 7, 3);
INSERT INTO Album VALUES (null, "Howlin' Wolf", '10/21/1957', 1917, 6, 7, 3);
INSERT INTO Album VALUES (null, "The Howlin' Wolf Album", '09/02/1969', 2459, 6, 7, 3);

INSERT INTO Album
  SELECT null, "Eliminator", '3/23/1983', 2668, r.RecordLabelId,
    a.ArtistId, g.GenreId
FROM Artist a, Genre g, RecordLabel r
WHERE a.ArtistName = "ZZTop" AND g.Label = "Rock" AND r.Title = 'Warner Bros.';

INSERT INTO Album
SELECT null, "Afterburner", '1/1/2011', SUBSTR(ABS(RANDOM())||'', 0, 4),
		r.RecordLabelId, ArtistId, GenreId
FROM Artist a, Genre g, RecordLabel r
WHERE a.ArtistName = "ZZTop" AND g.Label = "Rock" AND r.Title = 'Warner Bros.';

INSERT INTO Album
SELECT null, "Tres Hombres", '6/14/1979', SUBSTR(ABS(RANDOM())||'', 0, 4),
		r.RecordLabelId, ArtistId, GenreId
FROM Artist a, Genre g, RecordLabel r
WHERE a.ArtistName = "ZZTop" AND g.Label = "Rock" AND r.Title = 'Warner Bros.';


INSERT INTO Album VALUES (null, "Damaged", '12/05/1981', 2098, 8, 8, 9);
INSERT INTO Album VALUES (null, "TV Party", '07/12/1982', 409, 8, 8, 9);
INSERT INTO Album VALUES (null, "Everything Went Black", '12/03/1982', 3718, 8, 8, 9);




INSERT INTO Song
	SELECT null,
		   "Revenge",
		   61,
		   '12/03/1982',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Black Flag" AND g.Label = "Punk" AND al.Title = "Everything Went Black";

INSERT INTO Song
	SELECT null,
		   "White Minority",
		   69,
		   '12/03/1982',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Black Flag" AND g.Label = "Punk" AND al.Title = "Everything Went Black";

INSERT INTO Song
	SELECT null,
		   "Gimme Gimme Gimme",
		   120,
		   '12/03/1982',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Black Flag" AND g.Label = "Punk" AND al.Title = "Everything Went Black";

INSERT INTO Song
	SELECT null,
		   "No Values",
		   118,
		   '12/03/1982',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Black Flag" AND g.Label = "Punk" AND al.Title = "Everything Went Black";

INSERT INTO Song
	SELECT null,
		   "TV Party",
		   232,
		   '06/12/1982',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Black Flag" AND g.Label = "Punk" AND al.Title = "TV Party";

INSERT INTO Song
	SELECT null,
		   "I've Got To Run",
		   105,
		   '06/12/1982',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Black Flag" AND g.Label = "Punk" AND al.Title = "TV Party";

INSERT INTO Song
	SELECT null,
		   "My Rules",
		   71,
		   '06/12/1982',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Black Flag" AND g.Label = "Punk" AND al.Title = "TV Party";

INSERT INTO Song
	SELECT null,
		   "Gimme All Your Lovin",
		   SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '3/23/1983',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "ZZTop" AND g.Label = "Rock" AND al.Title = "Eliminator";

INSERT INTO Song
	SELECT null,
		   "Sharp Dressed Man",
		   SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '3/23/1983',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "ZZTop" AND g.Label = "Rock" AND al.Title = "Eliminator";

INSERT INTO Song
	SELECT null,
		   "Legs",
		   SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '3/23/1983',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "ZZTop" AND g.Label = "Rock" AND al.Title = "Eliminator";

INSERT INTO Song
	SELECT null,
		   "I Need You Tonight",
		   SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '3/23/1983',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "ZZTop" AND g.Label = "Rock" AND al.Title = "Eliminator";

INSERT INTO Song
	SELECT null,
		   "TV Dinners",
		   SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '3/23/1983',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "ZZTop" AND g.Label = "Rock" AND al.Title = "Eliminator";

INSERT INTO Song
	SELECT null,
		   "Thug",
		   SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '3/23/1983',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "ZZTop" AND g.Label = "Rock" AND al.Title = "Eliminator";


INSERT INTO Song
	SELECT null,
		   "Taxman",
       SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '8/5/1966',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Beatles" AND g.Label = "Pop" AND al.Title = "Revolver";

INSERT INTO Song
	SELECT null,
		   "Eleanor Rigby",
       SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '8/5/1966',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Beatles" AND g.Label = "Pop" AND al.Title = "Revolver";

INSERT INTO Song
	SELECT null,
		   "Good Day Sunshine",
       SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '8/5/1966',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Beatles" AND g.Label = "Pop" AND al.Title = "Revolver";

INSERT INTO Song
	SELECT null,
		   "Got To Get You Into My Life",
       SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '8/5/1966',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Beatles" AND g.Label = "Pop" AND al.Title = "Revolver";





INSERT INTO Song
	SELECT null,
		   "Interlude",
       SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '12/03/1982',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Jay Z" AND g.Label = "Rap" AND al.Title = "The Black Album";

INSERT INTO Song
	SELECT null,
		   "What More Can I Say",
       SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '12/03/1982',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Jay Z" AND g.Label = "Rap" AND al.Title = "The Black Album";

INSERT INTO Song
	SELECT null,
		   "Encore",
           SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '12/03/1982',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Jay Z" AND g.Label = "Rap" AND al.Title = "The Black Album";

INSERT INTO Song
	SELECT null,
		   "Dirt Off Your Shoulder",
       SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '12/03/1982',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Jay Z" AND g.Label = "Rap" AND al.Title = "The Black Album";
	
	INSERT INTO Song
	SELECT null,
		   "Dirt Off Your Shoulder 2",
       SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '12/03/1972',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Jay Z" AND g.Label = "Rap" AND al.Title = "Revolver";



SELECT s.Title 'Song', s.SongLength 'Duration',
	   al.Title 'Album',
       a.ArtistName 'Artist',
	   g.Label 'Genre'
FROM Song s
JOIN Album al ON s.AlbumId = al.AlbumId
JOIN Artist a ON al.ArtistId = a.ArtistId
JOIN Genre g ON s.GenreId = g.GenreId;


/* List all songs with album information */
SELECT a.Title 'Album', s.Title 'Song'
FROM Song s
LEFT JOIN Album a ON s.AlbumId = a.AlbumId;


/* Find Albums with no songs */
select a.Title 'Album', s.Title 'Song'
from Album a
left join Song s on s.AlbumId = a.AlbumId
where s.Title is null;





select * from artist;
select * from album;
select * from genre;
select * from song;


SELECT s.Title 'Song', a.Title 'Album', r.Title 'Record Label'
From Song s
LEFT JOIN Album a ON s.AlbumId = a.AlbumId
LEFT JOIN RecordLabel r ON a.RecordLabelId = r.RecordLabelId;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




-- Query all of the entries in the Genre table
SELECT * FROM Genre;

SELECT Label FROM Genre;

-- Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist VALUES (null, "Jisie", 1989);

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album VALUES (null, "Jisie's Album","11/11/11",1234,4, 28, 1);

-- Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song VALUES (null, "Jisie's first song", 400, "12/12/12", 1, 28, 22);
INSERT INTO Song VALUES (null, "Jisie's second song", 450, "13/13/13", 1, 28, 22);

/** Write a SELECT query that provides the song titles, album title, and artist name for all of 
the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the 
WHERE keyword to filter the results to the album and artist you added. **/
SELECT s.Title, a.Title, ar.ArtistName 
FROM ((Song s 
LEFT JOIN Album a ON s.AlbumId = a.AlbumId) 
LEFT JOIN Artist ar ON s.ArtistId = ar.ArtistId) 
WHERE s.ArtistId = 28;

-- Using SELECT and LEFT JOIN, write a query that displays the song title, the song duration, the album label, and the genre name for every song.
SELECT s.Title, s.SongLength, r.Title, g.Label FROM ((Song s LEFT JOIN Album a, RecordLabel r ON s.AlbumId = a.AlbumId AND a.RecordLabelId = r.RecordLabelId) LEFT JOIN Genre g ON s.GenreId = g.GenreId);

-- Using a WHERE clause, modify the previous query to only show the information for songs that have a duration of 250 or greater.
SELECT s.Title, s.SongLength, r.Title, g.Label "Genre" FROM ((Song s LEFT JOIN Album a, RecordLabel r ON s.AlbumId = a.AlbumId AND a.RecordLabelId = r.RecordLabelId) LEFT JOIN Genre g ON s.GenreId = g.GenreId) WHERE s.SongLength >=250;

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

-- Which album has the most songs?
SELECT a.Title, count(a.AlbumId) as "num" FROM Album a JOIN Song s ON s.AlbumId = a.AlbumId GROUP BY a.AlbumId ORDER BY "num" DESC LIMIT 1;

-- Which genre has been assigned to the most songs?
SELECT g.Label, count(s.GenreId) as "num" FROM Genre g JOIN Song s ON s.GenreId = g.GenreId GROUP BY g.GenreId ORDER BY "num" DESC LIMIT 1;

-- Which record label has released the most albums?
SELECT r.Title, COUNT(a.AlbumId) as "num" FROM RecordLabel r JOIN Album a ON r.RecordLabelId = a.RecordLabelId GROUP BY r.RecordLabelId ORDER BY "num" DESC LIMIT 1;


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