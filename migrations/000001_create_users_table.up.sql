CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  fullname VARCHAR(50),
  email VARCHAR(20),
  password VARCHAR(10),
  role VARCHAR(10),
  profileId INT,
  created_At DATE,
  updated_At DATE
);