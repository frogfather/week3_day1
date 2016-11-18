DROP table IF EXISTS customers;
DROP table IF EXISTS films;
DROP table IF EXISTS tickets;

CREATE TABLE customers(
id SERIAL4 primary key,
name VARCHAR(255),
funds numeric(8,2)
);

CREATE TABLE films(
id SERIAL4 primary key,
title VARCHAR(255),
price numeric(8,2)
);

CREATE TABLE tickets(
id SERIAL4 primary key,
customer_id integer4 references customers('id'),
film_id integer4 references films('id'),
show_time time
);