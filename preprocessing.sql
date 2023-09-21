--- eliminar si existe y crear la tabla movies_clean como copia de movies
DROP TABLE IF EXISTS movies_clean;
CREATE TABLE movies_clean AS SELECT * FROM movies;

--------------------------------DUPLICADOS--------------------------------
DELETE FROM movies_clean WHERE movieId = 144606;
DELETE FROM movies_clean WHERE movieId = 26958;
DELETE FROM movies_clean WHERE movieId = 32600;
DELETE FROM movies_clean WHERE movieId = 168358;
DELETE FROM movies_clean WHERE movieId = 64997;


-- CAMBIA EL ID DE MOVIEID DE LA TABLA RATINGS
UPDATE ratings SET movieId = 6003 WHERE movieId = 144606;
UPDATE ratings SET movieId = 838 WHERE movieId = 26958;
UPDATE ratings SET movieId = 147002 WHERE movieId = 32600;
UPDATE ratings SET movieId = 2851 WHERE movieId = 168358;
UPDATE ratings SET movieId = 34048 WHERE movieId = 64997;








----------------------------------------------TABLA SIN DEPURAR----------------------------------------------

--Tabla llamada full_table con movies_clean y ratings con llave movieId
DROP TABLE IF EXISTS full_table;
CREATE TABLE full_table AS 
SELECT movies_clean.movieId
    , movies_clean.title
    , movies_clean.genres
    , ratings.userId
    , ratings.rating
    , ratings.timestamp
FROM movies_clean 
INNER JOIN ratings ON movies_clean.movieId = ratings.movieId;


---------------------------------------------TABLA DEPURADA----------------------------------------------

-- tabla con películas calificadas mas de 30 veces y con usuarios que calificaron mas de 25 películas
DROP TABLE IF EXISTS data_clean;
CREATE TABLE data_clean AS
SELECT full_table.movieId
    , full_table.title
    , full_table.genres
    , full_table.userId
    , full_table.rating
    , full_table.timestamp
FROM full_table
INNER JOIN (
    SELECT movieId
        , COUNT(movieId) AS count_movieId
    FROM full_table
    GROUP BY movieId
    HAVING COUNT(movieId) > 30 --Películas calificadas mas de 30 veces
    ) AS movies ON full_table.movieId = movies.movieId

INNER JOIN (
    SELECT userId
        , COUNT(userId) AS count_userId
    FROM full_table
    GROUP BY userId
    HAVING COUNT(userId) > 25 --Usuarios que calificaron mas de 25 películas
    ) AS users ON full_table.userId = users.userId;


