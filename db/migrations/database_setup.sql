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
  description VARCHAR(300) NOT NULL,
  price MONEY,
  userid UUID REFERENCES users(id)
  );

