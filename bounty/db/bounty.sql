--You are going to make a table for tracking bounties for Space Cowboys.

--An entry in the bounty table must have a selection of 4 of these properties:

-- name
-- species
-- bounty value
-- danger level (low, medium, high, ermagerdyerderd)
-- last known location
-- homeworld
-- favourite weapon
-- cashed_in
-- collected_by

DROP TABLE IF exists bounty;

CREATE TABLE bounty
(id SERIAL8 primary key,
  name VARCHAR(255),
  bounty_value INT4,
  last_location VARCHAR(255),
  favourite_weapon VARCHAR(255)
); 
