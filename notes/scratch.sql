-- The finance department from our studio needs to know how much is spent on the
-- actors' salary. Write a query that adds up all of the values from the salary
-- column in the Actors table.

SELECT SUM(salary) FROM Actors; 

-- Write a query that calculates the average salary for all actors in our Actors
-- table.
-- Now filter the query in order to calculate the average of only American
-- actors.

SELECT AVG(salary) FROM Actors WHERE country = 'USA';

-- Write a query that returns the largest value for the salary column in the
-- Actors table. Let's add another value to the return of this query. This time,
-- add a function call that returns the minimum value for the salary column in
-- the Actors table.

SELECT MAX(salary), MIN(salary) FROM Actors;

-- Use the GROUP BY clause to write a query that returns the country name and
-- total salary paid to actors for each country.

SELECT country, SUM(salary)
FROM Actors
GROUP BY country;

-- Now use the HAVING clause to add a filter so that only countries with more
-- than 1 actor are returned from our SQL query.

SELECT country, SUM(salary)
FROM Actors
GROUP BY country
HAVING COUNT(*) > 1;

-- Lastly, let’s add a condition to filter only actors with a supporting role.
-- This condition will need to be run before the grouping of records happen.

SELECT country, SUM(salary)
FROM Actors
WHERE role = 'supporting'
GROUP BY country
HAVING COUNT(*) > 1;

-- Currently, our Actors table is allowing NULL values to be set on the name
-- column. We don't want that! Add a constraint that prevents NULL values on the
-- name column.

CREATE TABLE Actors (
  name varchar(50) NOT NULL,
  country varchar(50)
);

-- The Actors table is also allowing duplicate values for the name column. 
-- All values for this column must be unique, so let’s add a constraint that 
-- prevents a duplicate name from being inserted.

CREATE TABLE Actors (
  name varchar(50) NOT NULL UNIQUE.
  country varchar(50)
);

-- First, move the UNIQUE constraint on the name column from a column constraint
-- syntax to a table constraint syntax. Give this constraint the name
-- name_lang. Add the language column to the unique table constraint as well.

CREATE TABLE Movies (
  name varchar(50) NOT NULL,
  language varchar(50),
  CONSTRAINT name_lang UNIQUE (name, language)
);

-- Add a FOREIGN KEY constraint to the country_id column in the Actors table
-- that ensures values set to the country_id column match existing values for
-- the id column on the Countries table. Add a PRIMARY KEY constraint to the id
-- column on the Actors table. Lastly, add a constraint that ensures values set
-- to the name column are neither NULL or duplicates.

CREATE TABLE Actors (
  id int PRIMARY KEY,
  name varchar(50) NOT NULL UNIQUE,
  country_id int REFERENCES Countries(id)
);

-- Add a CHECK constraint to prevent values less than 500 from being assigned to
-- the salary column. On top of their salaries, actors will start receiving
-- bonuses. However, values for bonus need to be less than values for salary.
-- Add a CHECK column constraint to enforce this condition on the bonus column.

CREATE TABLE Actors (
  id int PRIMARY KEY,
  name varchar(50) NOT NULL UNIQUE,
  salary integer CHECK (salary >= 500),
  bonus integer CHECK (bonus < salary),
  country_id int REFERENCES Countries(id)
);

-- Join Table Creation SQL - First, let's add the new columns. The new columns
-- we add should have type int type to match the data they will hold. Per
-- convention, let's name these columns actor_id and movie_id. Now, let's add
-- FOREIGN KEY constraints to both of these columns, as column constraints,
-- referencing the appropriate tables.

CREATE TABLE Actors_Movies (
  actor_id int REFERENCES actors,
  movie_id int REFERENCES movies
);

-- Join the Movies table with the Rooms table so that we only fetch movies that
-- have an associated room.

SELECT * FROM Movies
INNER JOIN Rooms
ON Movies.id = Rooms.movie_id;

-- Let's get a little more specific, and only return the movie title, the id for
-- the room, and number of seats in the theatre.

SELECT Movies.title, Rooms.id, Rooms.seats, FROM Movies
INNER JOIN Rooms
ON Movies.id = Rooms.movie_id;

-- Now, let's filter the results more by only showing theatres with more than 75
-- seats. Remember, the WHERE clause should go after the JOIN syntax.

SELECT Movies.title, Rooms.id, Rooms.seats FROM Movies
INNER JOIN Rooms
ON Movies.id = Rooms.movie_id
WHERE Rooms.seats > 75;

-- Finally, let's sort the result by seats in the theatre from most to least
-- seats.

SELECT Movies.title, Rooms.id, Rooms.seats FROM Movies
INNER JOIN Rooms
ON Movies.id = Rooms.movie_id
WHERE Rooms.seats > 75
ORDER BY seats DESC;

-- Let's build a query, step by step, that joins the Actors and the Movies
-- table. First, join the Actors table with the Actors_Movies table so that only
-- actors participating in movies are returned on the result.

SELECT * FROM Actors
INNER JOIN Actors_Movies
ON Actors.id = Actors_Movies.actor_id;

-- Next, create another INNER JOIN from the Actors_Movies table to the Movies
-- table so that our result shows information about the movies.

SELECT * FROM Actors
INNER JOIN Actors_Movies
ON Actors.id = Actors_Movies.actor_id
INNER JOIN Movies
ON Actors_Movies.movie_id = Movies.id;

-- Now change the query to only fetch actor names and movie titles.

SELECT Actors.name, Movies.title FROM Actors
INNER JOIN Actors_Movies
ON Actors.id = Actors_Movies.actor_id
INNER JOIN Movies
ON Actors_Movies.movie_id = Movies.id;

-- Lastly, let's sort this query by movie title, alphabetically.

SELECT Actors.name, Movies.title FROM Actors
INNER JOIN Actors_Movies
ON Actors.id = Actors_Movies.actor_id
INNER JOIN Movies
ON Actors_Movies.movie_id = Movies.id
ORDER BY Movies.title;

-- Modify the query to have better output and be shorter. First, change the
-- query to output "Movie Title" instead of just title on the result.

SELECT Movie.title "Movie Title", Rooms.id, Rooms.seats
FROM Movies
INNER JOIN Rooms
ON Movies.id = Rooms.movie_id
WHERE Rooms.seats > 75
ORDER BY Rooms.seats DESC;

-- Next, change the id field to print "Theatre Number".

SELECT Movie.title "Movie Title", Rooms.id "Theatre Number", Rooms.seats
FROM Movies
INNER JOIN Rooms
ON Movies.id = Rooms.movie_id
WHERE Rooms.seats > 75
ORDER BY Rooms.seats DESC;

-- Now, let's use table aliases to shorten the query. Alias Rooms to use "r" and
-- Movies to "m".

SELECT m.title "Movie Title", r.id "Theatre Number", r.seats
FROM Movies m
INNER JOIN Rooms r
ON m.id = r.movie_id
WHERE r.seats > 75
ORDER BY r.seats desc;

-- Your First Outer Join. Let's create a query that returns all movies with some
-- additional data. First, create a query that returns all movies and also
-- displays a movie's room if it's playing in a room. For this query, select
-- everything ( *).

SELECT * FROM Movies
LEFT OUTER JOIN Rooms
ON Movies.id = Rooms.movie_id;

-- Now, let's select just the movie title and room id if it exists, and set a
-- column alias for the room id to "Theatre Number".

SELECT Movies.title, Rooms.id "Theatre Number"
FROM Movies
LEFT OUTER JOIN Rooms
ON Movies.id = Rooms.movie_id;

-- Lastly, it doesn't look like we've used table aliases with this query, which
-- is usually a good practice. Why don't we do that now?

SELECT m.title, r.id "Theatre Number"
FROM Movies m
LEFT OUTER JOIN Rooms r
ON m.id = r.movie_id;

-- Let's write our first subquery.

SELECT title FROM movies
WHERE id
IN (SELECT movie_id FROM rooms WHERE seats > 75);

-- Write a subquery that returns the id of the rooms that have greater than the
-- average number of seats.

SELECT id FROM rooms
WHERE seats > (SELECT AVG(seats) FROM rooms);

-- Add a join to the query so we can find movies playing in our rooms. Remember,
-- not all rooms will have movies. Also, we may need to prefix the id column
-- with the correct table name.

SELECT rooms.id FROM rooms
LEFT OUTER JOIN movies
ON rooms.movie_id = movies.id
WHERE seats > (SELECT AVG(seats) FROM rooms);

-- Let's also return the movie title in the result.

SELECT rooms.id, movies.title FROM rooms
LEFT OUTER JOIN movies
ON rooms.movie_id = movies.id
WHERE seats > (SELECT AVG(seats) FROM rooms);

-- Lastly, create table aliases for both Rooms and Movies.

SELECT r.id, m.title FROM Rooms r
LEFT OUTER JOIN Movies m
ON r.movie_id = m.id
WHERE seats > (SELECT AVG(seats) FROM Rooms);
