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

--Crear tabla llamada full_table con movies_clean y ratings con llave movieId
DROP TABLE IF EXISTS full_table;
CREATE TABLE full_table AS 
SELECT movies_clean.movieId
    , movies_clean.title
    , movies_clean.genres
    , ratings.userId
    , ratings.rating
    , ratings.timestamp
FROM movies_clean 
LEFT JOIN ratings ON movies_clean.movieId = ratings.movieId;
