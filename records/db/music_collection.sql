DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS albums;

CREATE TABLE artists (
id serial4 primary key,
name VARCHAR(255) NOT NULL,
);

CREATE TABLE albums (
id serial4 primary key,
name VARCHAR(255) NOT NULL,
artist_id INTEGER4 references artists(id),
genre VARCHAR(255),
);
