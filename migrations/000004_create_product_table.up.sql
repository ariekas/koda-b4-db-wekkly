CREATE TABLE product (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  price NUMERIC(10,2),
  description TEXT,
  productSize VARCHAR(10),
  stock INT,
  isFlashSale BOOLEAN,
  tempelatur VARCHAR(59),
  category_productId INT,
  created_At DATE,
  updated_At DATE
);