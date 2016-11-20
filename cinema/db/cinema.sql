DROP table IF EXISTS tickets;
DROP table IF EXISTS customers;
DROP table IF EXISTS films;

CREATE TABLE customers(
id SERIAL4 primary key,
name VARCHAR(255),
funds NUMERIC(8,2)
);

CREATE TABLE films(
id SERIAL4 primary key,
title VARCHAR(255),
price NUMERIC(8,2)
);

CREATE TABLE tickets(
id SERIAL4 primary key,
customer_id INT4 references customers(id),
film_id INT4 references films(id),
show_time TIME
);