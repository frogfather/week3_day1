
--Q1
SELECT * FROM movies;

--Q2
SELECT name FROM people;

--Q3
SELECT name FROM people 
WHERE name = 'John Campbell';

--Q4
DELETE FROM movies 
WHERE title = 'Batman Begins';

--Q5
INSERT INTO people (name) 
VALUES ('John Harper');

--Q6
DELETE FROM people 
WHERE name = 'Graeme Bell'

--Q7
UPDATE people SET name = 'Jeff 3' 
WHERE name = 'Adam Leel';

UPDATE people SET name = 'Jeff 3.2'
WHERE name = 'Adam Nattrass';

--Q8
INSERT INTO movies (title, year, show_time) 
VALUES ('Guardians of the Galaxy 2', 2017, '00:00');

--Q9
UPDATE movies SET show_time = '21:30' 
WHERE title = 'Guardians of the Galaxy';

--Extension:

Deleting multiple entries: 

These all seem to work!

DELETE FROM people 
WHERE id > 2 AND id < 6;

DELETE FROM movies 
WHERE title = 'Iron Man' OR id = 6;

DELETE FROM people 
WHERE name like 'John %'; (bit risky!)

