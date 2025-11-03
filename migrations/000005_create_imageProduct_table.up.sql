CREATE TABLE imageProduct (
  id SERIAL PRIMARY KEY,
  image TEXT,
  productId INT,
  created_At DATE,
  updated_At DATE
);