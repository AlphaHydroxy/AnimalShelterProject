DROP TABLE IF EXISTS adoptions;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;

CREATE TABLE animals(
  id SERIAL8 PRIMARY KEY,
  picture VARCHAR(255),
  name VARCHAR(255),
  type VARCHAR(255),
  breed VARCHAR(255),
  age INT8,
  date_added DATE,
  available BOOLEAN
);

CREATE TABLE owners(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE adoptions(
  id SERIAL8 PRIMARY KEY,
  owner_id INT8 REFERENCES owners(id) ON DELETE CASCADE,
  animal_id INT8 REFERENCES animals(id) ON DELETE CASCADE
)