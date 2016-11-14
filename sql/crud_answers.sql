
--Q1
SELECT * FROM movies;

output:

id |                title                | year | show_time 
----+-------------------------------------+------+-----------
  1 | Iron Man                            | 2008 | 15:40
  2 | The Incredible Hulk                 | 2008 | 23:45
  3 | Iron Man 2                          | 2010 | 17:45
  4 | Thor                                | 2011 | 14:40
  5 | Captain America: The First Avenger  | 2011 | 17:05
  6 | Avengers Assemble                   | 2012 | 12:30
  7 | Iron Man 3                          | 2013 | 18:00
  8 | Thor: The Dark World                | 2013 | 18:55
  9 | Batman Begins                       | 2005 | 16:30
 10 | Captain America: The Winter Soldier | 2014 | 19:20
 11 | Guardians of the Galaxy             | 2014 | 12:10
 12 | Avengers: Age of Ultron             | 2015 | 23:40
 13 | Ant-Man                             | 2015 | 18:20
 14 | Captain America: Civil War          | 2016 | 22:00
 15 | Doctor Strange                      | 2016 | 16:30
(15 rows)


--Q2
SELECT name FROM people;
     
output:     
      name        
-------------------
 Chris Bacon
 John Campbell
 Jane Cargill
 Patrick Collins
 Stephanie Devine
 Ben Faulkner
 Cameron Fulton
 Tegan Gallacher
 Gregor Gilchrist
 Claire Hilditch
 Graeme Bell
 Winnie Ho
 Adam Leel
 Lewis MacNee
 Adam Nattrass
 William Robertson
 Jordan Said
 Logan Smith
 Frederico Zucca
(19 rows)


--Q3
SELECT name FROM people 
WHERE name = 'John Campbell';

output:
     name      
---------------
 John Campbell
(1 row)


--Q4
DELETE FROM movies 
WHERE title = 'Batman Begins';

output:
DELETE 1

--Q5
INSERT INTO people (name) 
VALUES ('John Harper');

output:
INSERT 0 1

--Q6
DELETE FROM people 
WHERE name = 'Graeme Bell';

output:
DELETE 1

--Q7
UPDATE people SET name = 'Jeff 3' 
WHERE name = 'Adam Leel';

output:
UPDATE 1

UPDATE people SET name = 'Jeff 3.2'
WHERE name = 'Adam Nattrass';

output:
UPDATE 1

--Q8
INSERT INTO movies (title, year, show_time) 
VALUES ('Guardians of the Galaxy 2', 2017, '00:00');

output:
INSERT 0 1

--Q9
UPDATE movies SET show_time = '21:30' 
WHERE title = 'Guardians of the Galaxy';

output:
UPDATE 1

--Extension:

--Deleting multiple entries: 

--These all seem to work!

DELETE FROM people 
WHERE id > 2 AND id < 6;

output:
DELETE 3

DELETE FROM movies 
WHERE title = 'Iron Man' OR id = 6;

output:
DELETE 2

DELETE FROM people 
WHERE name like 'John %'; 

output:
DELETE 3
--(bit risky!)

