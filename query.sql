-- Active: 1761841929294@@127.0.0.1@5432@db_coffeshop
-- CREATE TABLE users (
--   id SERIAL PRIMARY KEY,
--   fullname VARCHAR(50),
--   email VARCHAR(20),
--   password VARCHAR(10),
--   role VARCHAR(10),
--   profileId INT,
--   created_At DATE,
--   updated_At DATE
-- );

-- CREATE TABLE profile (
--   id SERIAL PRIMARY KEY,
--   pic TEXT,
--   phone VARCHAR(20),
--   address TEXT,
--   created_At DATE,
--   updated_At DATE
-- );

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
INSERT INTO profile (pic, phone, address) VALUES
('https://www.freepik.com/free-photo/content-confident-handsome-asian-businessman-looking-camera_3583387.htm#fromView=search&page=1&position=35&uuid=35d27d26-4d28-44e0-8b25-e449b1cca535&query=person', '081234567890', 'Jl. Sudirman No. 123, Jakarta'),
('https://www.freepik.com/free-photo/content-confident-handsome-asian-businessman-looking-camera_3583387.htm#fromView=search&page=1&position=35&uuid=35d27d26-4d28-44e0-8b25-e449b1cca535&query=person', '081234567891', 'Jl. Gatot Subroto No. 45, Bandung'),
('https://www.freepik.com/free-photo/content-confident-handsome-asian-businessman-looking-camera_3583387.htm#fromView=search&page=1&position=35&uuid=35d27d26-4d28-44e0-8b25-e449b1cca535&query=person', '081234567892', 'Jl. Ahmad Yani No. 78, Surabaya'),
('https://www.freepik.com/free-photo/content-confident-handsome-asian-businessman-looking-camera_3583387.htm#fromView=search&page=1&position=35&uuid=35d27d26-4d28-44e0-8b25-e449b1cca535&query=person', '081234567893', 'Jl. Diponegoro No. 90, Semarang'),
('https://www.freepik.com/free-photo/content-confident-handsome-asian-businessman-looking-camera_3583387.htm#fromView=search&page=1&position=35&uuid=35d27d26-4d28-44e0-8b25-e449b1cca535&query=person', '081234567894', 'Jl. Merdeka No. 12, Yogyakarta');

INSERT INTO users (fullname, email, password, role, profileId) VALUES
('Ahmad Rizki', 'ahmad@email.com', 'pass123', 'customer', 1),
('Siti Nurhaliza', 'siti@email.com', 'pass456', 'customer', 2),
('Budi Santoso', 'budi@email.com', 'pass789', 'customer', 3),
('Dewi Lestari', 'dewi@email.com', 'pass012', 'admin', 4),
('Eko Prasetyo', 'eko@email.com', 'pass345', 'customer', 5);

INSERT INTO category_product (name) VALUES
('Pizza'),
('Pasta'),
('Appetizers'),
('Desserts'),
('Beverages');

INSERT INTO product (name, price, description, productSize, stock, isFlashSale, tempelatur, category_productId) VALUES
('Meat Lovers', 89000, 'Pepperoni, ham, Italian sausage, pork, and beef', 'Regular', 50, false, 'Hot', 1),
('Super Supreme', 95000, 'Pepperoni, Italian sausage, green peppers, onions, and mushrooms', 'Regular', 45, true, 'Hot', 1),
('Hawaiian', 75000, 'Ham and pineapple', 'Regular', 60, false, 'Hot', 1),
('Pepperoni', 69000, 'Classic pepperoni with extra cheese', 'Regular', 70, false, 'Hot', 1),
('Veggie Lovers', 79000, 'Green peppers, onions, mushrooms, tomatoes, and black olives', 'Regular', 40, false, 'Hot', 1),
('Cheese Lovers', 85000, 'Extra mozzarella, cheddar, and parmesan', 'Regular', 55, false, 'Hot', 1),
('BBQ Chicken', 89000, 'Grilled chicken, BBQ sauce, onions, and bacon', 'Regular', 50, true, 'Hot', 1),
('Buffalo Chicken', 89000, 'Spicy buffalo chicken with ranch sauce', 'Regular', 45, false, 'Hot', 1),
('Spicy Italian', 92000, 'Pepperoni, Italian sausage, jalapeños, and crushed red pepper', 'Regular', 35, false, 'Hot', 1),
('Margherita', 65000, 'Fresh mozzarella, tomatoes, and basil', 'Regular', 55, false, 'Hot', 1),
('Chicken Supreme', 89000, 'Grilled chicken, mushrooms, onions, and green peppers', 'Regular', 50, false, 'Hot', 1),
('Seafood Delight', 105000, 'Shrimp, crab, and tuna with special sauce', 'Regular', 30, false, 'Hot', 1),
('Beef Pepperoni', 85000, 'Premium beef pepperoni with extra cheese', 'Regular', 45, false, 'Hot', 1),
('Sausage Supreme', 89000, 'Italian sausage, onions, and bell peppers', 'Regular', 40, false, 'Hot', 1),
('Mushroom Lovers', 75000, 'Three types of mushrooms with garlic butter', 'Regular', 35, false, 'Hot', 1),
('Bacon Cheeseburger', 95000, 'Beef, bacon, cheddar, pickles, and special sauce', 'Regular', 40, true, 'Hot', 1),
('Chicken Alfredo', 92000, 'Grilled chicken with creamy alfredo sauce', 'Regular', 45, false, 'Hot', 1),
('Taco Pizza', 89000, 'Seasoned beef, lettuce, tomatoes, and taco sauce', 'Regular', 35, false, 'Hot', 1),
('Four Cheese', 85000, 'Mozzarella, cheddar, provolone, and parmesan', 'Regular', 50, false, 'Hot', 1),
('Chicken Bacon Ranch', 95000, 'Chicken, bacon, and ranch dressing', 'Regular', 45, false, 'Hot', 1),
('Mediterranean', 89000, 'Feta cheese, olives, tomatoes, and spinach', 'Regular', 30, false, 'Hot', 1),
('Philly Cheese Steak', 95000, 'Steak, onions, peppers, and cheese sauce', 'Regular', 35, false, 'Hot', 1),
('Pesto Chicken', 89000, 'Grilled chicken with basil pesto sauce', 'Regular', 40, false, 'Hot', 1),
('Chicken Teriyaki', 92000, 'Teriyaki chicken with pineapple and onions', 'Regular', 45, true, 'Hot', 1),
('Ultimate Meat', 105000, 'Five types of meat with extra cheese', 'Regular', 35, false, 'Hot', 1);

INSERT INTO product (name, price, description, productSize, stock, isFlashSale, tempelatur, category_productId) VALUES
('Spaghetti Carbonara', 45000, 'Creamy carbonara with bacon', 'Regular', 40, false, 'Hot', 2),
('Fettuccine Alfredo', 42000, 'Classic alfredo sauce with parmesan', 'Regular', 45, false, 'Hot', 2),
('Spaghetti Bolognese', 45000, 'Rich meat sauce with herbs', 'Regular', 50, false, 'Hot', 2),
('Penne Arrabiata', 40000, 'Spicy tomato sauce with garlic', 'Regular', 35, false, 'Hot', 2),
('Lasagna Beef', 55000, 'Layers of pasta with beef and cheese', 'Regular', 30, false, 'Hot', 2),
('Chicken Pesto Pasta', 48000, 'Penne with chicken and pesto sauce', 'Regular', 40, false, 'Hot', 2),
('Mac and Cheese', 38000, 'Creamy macaroni with cheddar', 'Regular', 50, false, 'Hot', 2),
('Seafood Marinara', 65000, 'Mixed seafood in tomato sauce', 'Regular', 25, false, 'Hot', 2),
('Garlic Bread', 25000, 'Toasted bread with garlic butter', 'Regular', 60, false, 'Hot', 3),
('Chicken Wings', 45000, '8 pieces of spicy buffalo wings', 'Regular', 45, false, 'Hot', 3),
('Mozzarella Sticks', 35000, '6 pieces with marinara sauce', 'Regular', 50, false, 'Hot', 3),
('Onion Rings', 30000, 'Crispy breaded onion rings', 'Regular', 55, false, 'Hot', 3),
('Bruschetta', 32000, 'Toasted bread with tomato and basil', 'Regular', 40, false, 'Hot', 3),
('Cheese Breadsticks', 28000, 'Breadsticks with melted cheese', 'Regular', 50, false, 'Hot', 3),
('Chicken Tenders', 42000, '5 pieces with honey mustard', 'Regular', 45, false, 'Hot', 3),
('Chocolate Lava Cake', 35000, 'Warm chocolate cake with ice cream', 'Regular', 30, false, 'Hot', 4),
('Tiramisu', 38000, 'Classic Italian coffee dessert', 'Regular', 25, false, 'Cold', 4),
('Cheesecake', 35000, 'New York style cheesecake', 'Regular', 30, false, 'Cold', 4),
('Brownie Sundae', 32000, 'Warm brownie with vanilla ice cream', 'Regular', 35, false, 'Hot', 4),
('Apple Pie', 30000, 'Classic apple pie with cinnamon', 'Regular', 40, false, 'Hot', 4),
('Coca Cola', 12000, 'Refreshing cola drink', 'Regular', 100, false, 'Cold', 5),
('Iced Tea', 10000, 'Fresh brewed iced tea', 'Regular', 100, false, 'Cold', 5),
('Orange Juice', 15000, 'Fresh squeezed orange juice', 'Regular', 80, false, 'Cold', 5),
('Mineral Water', 8000, 'Bottled mineral water', 'Regular', 150, false, 'Cold', 5),
('Cappuccino', 25000, 'Italian style coffee', 'Regular', 60, false, 'Hot', 5);

INSERT INTO imageProduct (image, productId) VALUES
('https://www.freepik.com/free-photo/large-mixed-pizza-with-meat_6087692.htm#fromView=search&page=1&position=46&uuid=ff40f714-e977-49da-8184-beefdd310aa9&query=pizza', 1),
('https://www.freepik.com/free-photo/mixed-pizza-with-sliced-lemon_6356094.htm#fromView=search&page=2&position=4&uuid=ff40f714-e977-49da-8184-beefdd310aa9&query=pizza', 2),
('https://www.freepik.com/free-photo/top-view-pizza-with-sausages-tomato-bell-pepper-cheese_7359724.htm#fromView=search&page=2&position=12&uuid=ff40f714-e977-49da-8184-beefdd310aa9&query=pizza', 3),
('https://www.freepik.com/free-photo/top-view-hot-espresso-with-brown-coffee-seeds-brown-wooden-desk-coffee-cup-drink_10186901.htm#fromView=search&page=1&position=38&uuid=e4330d17-bc3d-4fe0-9d84-227bb9db817a&query=coffe', 4),
('https://www.freepik.com/free-photo/top-view-appetizing-seafood-mix-wooden-table_17115730.htm#fromView=search&page=1&position=4&uuid=5f5412d8-3e7c-495e-b2c6-6cf3172283e8&query=Seafood+Delight', 5);

INSERT INTO diskon (percentage, name, startDate, endDate, isActive) VALUES
(20.00, 'Weekend Special', '2025-11-01', '2025-11-30', true),
(15.00, 'Flash Sale', '2025-11-01', '2025-11-15', true),
(10.00, 'Member Discount', '2025-11-01', '2025-12-31', true),
(25.00, 'Black Friday', '2025-11-29', '2025-11-29', false),
(30.00, 'Year End Sale', '2025-12-20', '2025-12-31', false);

INSERT INTO product_diskon (productId, diskonId) VALUES
(2, 2), 
(7, 2), 
(16, 1), 
(24, 2),
(1, 1); 

INSERT INTO orders (userId, paymentMethod, status, total) VALUES
(1, 'Credit Card', 'completed', 194000),
(2, 'Cash', 'pending', 150000),
(3, 'E-Wallet', 'completed', 280000),
(4, 'Debit Card', 'processing', 175000),
(5, 'Credit Card', 'completed', 320000);

INSERT INTO orderItems (productId, quantity, subtotal, orderId) VALUES
(1, 2, 178000, 1), 
(3, 1, 75000, 2),  
(7, 2, 178000, 3), 
(2, 3, 135000, 4), 
(16, 2, 190000, 5);

INSERT INTO tax (orderId, name, tax) VALUES
(1, 'PPN 11%', 21340),
(2, 'PPN 11%', 16500),
(3, 'PPN 11%', 30800),
(4, 'PPN 11%', 19250),
(5, 'PPN 11%', 35200);

INSERT INTO delivery (orderId, type, fee) VALUES
(1, 'Regular', 15000),
(2, 'Express', 25000),
(3, 'Regular', 15000),
(4, 'Pickup', 0),
(5, 'Express', 25000);

INSERT INTO rating (userId, productId, rating) VALUES
(1, 1, 5), 
(2, 3, 4),  
(3, 7, 5),  
(4, 5, 4), 
(5, 16, 5); 