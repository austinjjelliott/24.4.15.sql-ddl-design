-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE cities 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country TEXT NOT NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY, 
  name TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airlines(id),
  from_city_id INTEGER REFERENCES cities(id),
  to_city_id INTEGER REFERENCES cities(id)
);

INSERT INTO cities (name, country) VALUES
  ('Washington DC', 'United States'),
  ('Seattle', 'United States'),
  ('Tokyo', 'Japan'),
  ('London', 'United Kingdom'),
  ('Los Angeles', 'United States'),
  ('Las Vegas', 'United States'),
  ('Paris', 'France'),
  ('Casablanca', 'Morocco'),
  ('Dubai', 'UAE'),
  ('Beijing', 'China'),
  ('New York', 'United States'),
  ('Charlotte', 'United States'),
  ('Chicago', 'United States'),
  ('Sao Paolo', 'Brazil'),
  ('Santiago', 'Chile');

INSERT INTO airlines (name) VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');


INSERT INTO tickets (first_name, last_name, seat, departure, arrival, airline_id, from_city_id, to_city_id) VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', (SELECT id FROM airlines WHERE name = 'United'), (SELECT id FROM cities WHERE name = 'Washington DC'), (SELECT id FROM cities WHERE name = 'Seattle')),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', (SELECT id FROM airlines WHERE name = 'British Airways'), (SELECT id FROM cities WHERE name = 'Tokyo'), (SELECT id FROM cities WHERE name = 'London')),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', (SELECT id FROM airlines WHERE name = 'Delta'), (SELECT id FROM cities WHERE name = 'Los Angeles'), (SELECT id FROM cities WHERE name = 'Las Vegas')),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', (SELECT id FROM airlines WHERE name = 'Delta'), (SELECT id FROM cities WHERE name = 'Seattle'), (SELECT id FROM cities WHERE name = 'Mexico City')),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', (SELECT id FROM airlines WHERE name = 'TUI Fly Belgium'), (SELECT id FROM cities WHERE name = 'Paris'), (SELECT id FROM cities WHERE name = 'Casablanca')),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', (SELECT id FROM airlines WHERE name = 'Air China'), (SELECT id FROM cities WHERE name = 'Dubai'), (SELECT id FROM cities WHERE name = 'Beijing')),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', (SELECT id FROM airlines WHERE name = 'United'), (SELECT id FROM cities WHERE name = 'New York'), (SELECT id FROM cities WHERE name = 'Charlotte')),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', (SELECT id FROM airlines WHERE name = 'American Airlines'), (SELECT id FROM cities WHERE name = 'Cedar Rapids'), (SELECT id FROM cities WHERE name = 'Chicago')),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', (SELECT id FROM airlines WHERE name = 'American Airlines'), (SELECT id FROM cities WHERE name = 'Charlotte'), (SELECT id FROM cities WHERE name = 'New Orleans')),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', (SELECT id FROM airlines WHERE name = 'Avianca Brasil'), (SELECT id FROM cities WHERE name = 'Sao Paolo'), (SELECT id FROM cities WHERE name = 'Santiago'));
