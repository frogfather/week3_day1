DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists(
id serial4 primary key,
name VARCHAR(255) NOT NULL
);

CREATE TABLE albums(
id serial4 primary key,
name VARCHAR(255) NOT NULL,
artist_id INT4 references artists(id),
genre VARCHAR(255)
);
