DROP TABLE IF EXISTS properties;

CREATE TABLE properties (
  id SERIAL PRIMARY KEY,
  address VARCHAR(255),
  no_bedrooms INT,
  status VARCHAR(255),
  value INT
);
