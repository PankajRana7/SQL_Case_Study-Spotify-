/* Q1.Find id and name of the track which are at position between 8-12.*/
SELECT
Id,
Trackname
FROM Spotify
Where
Position BETWEEN 8 AND 12
ORDER BY Id ASC

/* Q2.Find the total number of streams for the top 100 ranked songs.*/
SELECT
SUM(Streams) AS Total_Streams
FROM Spotify
WHERE
Position <=100

/* Q3.Find the top 10 ranked songs by position. The Output should have track
name along with the corresponding position. Sort the records by the
position in descending order first and then in ascending order of track
name, as there are many tracks that are tied for the same position.*/

SELECT
Trackname,
Position
FROM Spotify
Where
Position <= 10
GROUP BY
Trackname,Position
ORDER BY
Position DESC,Trackname ASC

/* Q4.Find Artist names having a lowest total stream.*/

SELECT
Artist,
SUM(Streams) AS Total_Streams
FROM Spotify
GROUP BY 1
ORDER BY 2 ASC
LIMIT 1

/*Q5.Find the name of the track having 10th highest stream according to the data.*/

WITH Stream_Wise_Rank AS(
SELECT
Trackname
Rank()OVER(ORDER BY Streams DESC) AS Stream_Rank
FROM Spotify)
SELECT
Trackname
FROM Stream_Wise_Rank
WHERE Stream_Rank=10

/* Q6.Who is the artist of the track having 40th highest stream according to the
data.*/

WITH Stream_Wise_Rank AS (
SELECT
*,
Rank() OVER (ORDER BY Streams DESC) AS Stream_Rank
FROM Spotify)
SELECT
Artist
FROM Stream_Wise_Rank
WHERE Stream_Rank = 40

/*Q7.What is the name of the track having the 25th lowest stream according to
the data.*/

WITH Stream_Wise_Rank AS (
SELECT
*,
Rank() OVER (ORDER BY Streams ASC) AS Stream_Rank
FROM Spotify)
SELECT
Trackname
FROM Stream_Wise_Rank
WHERE Stream_Rank = 25


















