
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS timeslots CASCADE;
DROP TABLE IF EXISTS events CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  availability BOOLEAN,
  cookie VARCHAR(255)
);

CREATE TABLE timeslots (
  id SERIAL PRIMARY KEY NOT NULL,
  time TIMESTAMP,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
);

CREATE TABLE events (
  id SERIAL PRIMARY KEY NOT NULL,
  description TEXT,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  timeslot_id INTEGER REFERENCES timeslots(id) ON DELETE CASCADE,
  url VARCHAR(255)
);
