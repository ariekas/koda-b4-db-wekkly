-- Active: 1761841929294@@127.0.0.1@5432@db_coffeshop
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

CREATE TABLE profile (
  id SERIAL PRIMARY KEY,
  pic TEXT,
  phone VARCHAR(20),
  address TEXT,
  created_At DATE,
  updated_At DATE
);

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

CREATE TABLE imageProduct (
  id SERIAL PRIMARY KEY,
  image TEXT,
  productId INT,
  created_At DATE,
  updated_At DATE
);

CREATE TABLE rating (
  id SERIAL PRIMARY KEY,
  userId INT,
  productId INT,
  rating INT,
  created_At DATE,
  updated_At DATE
);

CREATE TABLE diskon (
  id SERIAL PRIMARY KEY,
  percentage DECIMAL(10,2),
  name VARCHAR(100),
  startDate DATE,
  endDate DATE,
  isActive BOOLEAN,
  created_At DATE,
  updated_At DATE
);

CREATE TABLE product_diskon (
  id SERIAL PRIMARY KEY,
  productId INT,
  diskonId INT,
  created_At DATE,
  updated_At DATE
);

CREATE TABLE orderItems (
  id SERIAL PRIMARY KEY,
  productId INT,
  quantity INT,
  subtotal DECIMAL(10,2),
  orderId int,
  created_At DATE,
  updated_At DATE
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  userId INT,
  paymentMethod VARCHAR(50),
  status VARCHAR(50),
  total DECIMAL(10,2),
  created_At DATE,
  updated_At DATE
);

CREATE TABLE tax (
  id SERIAL PRIMARY KEY,
  orderId INT,
  name VARCHAR(50),
  tax DECIMAL(10,2),
  created_At DATE,
  updated_At DATE
);

CREATE TABLE delivery (
  id SERIAL PRIMARY KEY,
  orderId INT,
  type VARCHAR(50),
  fee DECIMAL(10,2),
  created_At DATE,
  updated_At DATE
);

CREATE TABLE category_product (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);

ALTER TABLE rating ADD FOREIGN KEY (productId) REFERENCES product (id);

ALTER TABLE rating ADD FOREIGN KEY (userId) REFERENCES users (id);

ALTER TABLE imageProduct ADD FOREIGN KEY (productId) REFERENCES product (id);

ALTER TABLE orderItems ADD FOREIGN KEY (orderId) REFERENCES orders (id);

ALTER TABLE orders ADD FOREIGN KEY (userId) REFERENCES users (id);

ALTER TABLE orderItems ADD FOREIGN KEY (productId) REFERENCES product (id);

ALTER TABLE delivery ADD FOREIGN KEY (orderId) REFERENCES orders (id);

ALTER TABLE users ADD FOREIGN KEY (profileId) REFERENCES profile (id);

ALTER TABLE product ADD FOREIGN KEY (category_productId) REFERENCES category_product (id);

ALTER TABLE product_diskon ADD FOREIGN KEY (productId) REFERENCES product (id);

ALTER TABLE product_diskon ADD FOREIGN KEY (diskonId) REFERENCES diskon (id);

ALTER TABLE tax ADD FOREIGN KEY (orderId) REFERENCES orders (id);