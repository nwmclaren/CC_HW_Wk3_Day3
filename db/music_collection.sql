DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL4 PRIMARY KEY,
  album_name VARCHAR(255),
  album_genre VARCHAR(255),
  artist_id INT4 REFERENCES artists(id)
);


-- CREATE TABLE customers (
--   id SERIAL4 PRIMARY KEY,
--   name VARCHAR(255)
-- );
--
-- CREATE TABLE pizza_orders (
--   id SERIAL4 PRIMARY KEY,
--   topping VARCHAR(255),
--   quantity INT8,
--   customer_id INT4 REFERENCES customers(id)
-- );
