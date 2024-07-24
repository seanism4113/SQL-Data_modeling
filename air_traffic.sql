-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE country (
  country_id SERIAL PRIMARY KEY,
  country_name VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE city_country (
  city_country_id SERIAL PRIMARY KEY,
  city_name VARCHAR(20) NOT NULL,
  country_id INTEGER NOT NULL REFERENCES country(country_id)
);

CREATE TABLE passenger (
  pass_id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines (
  airline_id SERIAL PRIMARY KEY,
  airline_name TEXT UNIQUE NOT NULL
);

CREATE TABLE tickets
(
  ticket_id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passenger(pass_id),
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER NOT NULL REFERENCES airlines(airline_id),
  from_city_country INTEGER REFERENCES city_country(city_country_id),
  to_city_country INTEGER REFERENCES city_country(city_country_id)
);

INSERT INTO passenger
 (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO airlines 
 (airline_name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO country 
  (country_name)
VALUES
  ('United States'),
  ('Japan'),
  ('France'),
  ('UAE'),
  ('Brazil'),
  ('United Kingdom'),
  ('Mexico'),
  ('Morocco'),
  ('China'),
  ('Chile');

INSERT INTO city_country
  (city_name, country_id)
VALUES
  ('Washington DC', 1),
  ('Seattle', 1),
  ('Tokyo', 2),
  ('London', 6),
  ('Los Angeles', 1),
  ('Las Vegas', 1),
  ('Mexico City', 7),
  ('Paris', 3),
  ('Casablanca', 8),
  ('Dubai', 4),
  ('Beijing', 9),
  ('New York', 1),
  ('Charlotte', 1),
  ('Cedar Rapids', 1),
  ('Chicago', 1),
  ('New Orleans', 1),
  ('Sao Paolo', 5),
  ('Santiago', 10);


INSERT INTO tickets
  (passenger_id, seat, departure, arrival, airline_id, from_city_country, to_city_country)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 4),
  (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 6),
  (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 7),
  (4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 9),
  (2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 11),
  (5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 13),
  (6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 15),
  (5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 16),
  (7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 18);