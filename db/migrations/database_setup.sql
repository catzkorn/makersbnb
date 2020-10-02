CREATE EXTENSION pgcrypto;
CREATE TABLE users(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(), 
  email VARCHAR(30) NOT NULL UNIQUE,
  name VARCHAR(30) NOT NULL,
  password TEXT NOT NULL
  );

CREATE TABLE spaces(
  id SERIAL PRIMARY KEY, 
  name VARCHAR(30) NOT NULL,
  description VARCHAR(240) NOT NULL,
  price MONEY NOT NULL,
  userid UUID NOT NULL REFERENCES users(id)
  );

CREATE TABLE bookings(
  bookingid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  spaceid SERIAL NOT NULL REFERENCES spaces(id),
  guestID UUID NOT NULL REFERENCES users(id),
  stay_date DATE NOT NULL,
  confirmation BOOLEAN 
);