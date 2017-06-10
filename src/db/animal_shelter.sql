DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS animals;

CREATE TABLE animals(
  id SERIAL8 PRIMARY KEY,
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
  last_name VARCHAR(255),
  animal_id INT REFERENCES animals(id)
);
