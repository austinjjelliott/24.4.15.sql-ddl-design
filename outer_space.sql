-- from the terminal run:
-- psql < outer_space.sql


DROP DATABASE IF EXISTS outer_space;
CREATE DATABASE outer_space;
\c outer_space

CREATE TABLE celestial_bodies
(
 id SERIAL PRIMARY KEY,
 name TEXT NOT NULL UNIQUE,
 type TEXT NOT NULL CHECK (type in ('Star', 'Planet', 'Moon')),
 galaxy TEXT NOT NULL
);

CREATE TABLE planets
(
 id SERIAL PRIMARY KEY,
 name TEXT NOT NULL,
 orbital_period_in_years FLOAT NOT NULL,
 orbits_around INTEGER REFERENCES celestial_bodies(id),
 galaxy TEXT NOT NULL
);

CREATE TABLE moons
(
 id SERIAL PRIMARY KEY,
 name text NOT NULL,
 planet_id INTEGER references planets(id)
);

INSERT INTO celestial_bodies (name, type, galaxy)
VALUES
 ('The Sun', 'Star', 'Milky Way'),
 ('Proxima Centauri', 'Star', 'Milky Way'),
 ('Gliese 876', 'Star', 'Milky Way');


INSERT INTO planets
 (name, orbital_period_in_years, orbits_around, galaxy)
VALUES
 ('Earth', 1.00, (SELECT id FROM celestial_bodies WHERE name = 'The Sun'), 'Milky Way'),
 ('Mars', 1.88, (SELECT id FROM celestial_bodies WHERE name = 'The Sun'), 'Milky Way'),
 ('Venus', 0.62, (SELECT id FROM celestial_bodies WHERE name = 'The Sun'), 'Milky Way'),
 ('Neptune', 164.8, (SELECT id FROM celestial_bodies WHERE name = 'The Sun'), 'Milky Way'),
 ('Proxima Centauri b', 0.03, (SELECT id FROM celestial_bodies WHERE name = 'Proxima Centauri'), 'Milky Way'),
 ('Gliese 876 b', 0.23, (SELECT id FROM celestial_bodies WHERE name = 'Gliese 876'), 'Milky Way');

INSERT INTO moons (name, planet_id)
VALUES
  ('The Moon', (SELECT id FROM planets WHERE name = 'Earth')),
  ('Phobos', (SELECT id FROM planets WHERE name = 'Mars')),
  ('Deimos', (SELECT id FROM planets WHERE name = 'Mars')),
  ('Naiad', (SELECT id FROM planets WHERE name = 'Neptune')),
  ('Thalassa', (SELECT id FROM planets WHERE name = 'Neptune')),
  ('Despina', (SELECT id FROM planets WHERE name = 'Neptune')),
  ('Galatea', (SELECT id FROM planets WHERE name = 'Neptune')),
  ('Larissa', (SELECT id FROM planets WHERE name = 'Neptune')),
  ('S/2004 N 1', (SELECT id FROM planets WHERE name = 'Neptune')),
  ('Proteus', (SELECT id FROM planets WHERE name = 'Neptune')),
  ('Triton', (SELECT id FROM planets WHERE name = 'Neptune')),
  ('Nereid', (SELECT id FROM planets WHERE name = 'Neptune')),
  ('Halimede', (SELECT id FROM planets WHERE name = 'Neptune')),
  ('Sao', (SELECT id FROM planets WHERE name = 'Neptune')),
  ('Laomedeia', (SELECT id FROM planets WHERE name = 'Neptune')),
  ('Psamathe', (SELECT id FROM planets WHERE name = 'Neptune')),
  ('Neso', (SELECT id FROM planets WHERE name = 'Neptune'));

