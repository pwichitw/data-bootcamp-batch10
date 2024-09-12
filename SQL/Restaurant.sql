
  CREATE TABLE menu (
    id INT UNIQUE,
    name TEXT,
    price REAL,
    type TEXT);

INSERT INTO menu VALUES (
  1, 'CHICKEN NOODLE', 60, 'Food'),
  (2, 'CHICKEN RICE', 65, 'Food'),
  (3, 'CHICKEN FRIED RICE', 65, 'Food'),
  (4, 'PORK NOODLE', 60, 'Food'),
  (5, 'PORK RICE', 65, 'Food'),
  (6, 'PORK FRIED RICE', 65, 'Food'),
  (10, 'COKE', 20 ,'Beverage'),
  (11, 'SPRITE', 20 ,'Beverage'),
  (12, 'WATER', 10 ,'Beverage'),
  (13, 'ORAGE JUICE', 25 ,'Beverage'),
  (14, 'COFFEE', 40 ,'Beverage'),
  (21, 'ICE CREAM', 40 ,'Dessert'),
  (22, 'TOAST', 30 ,'Dessert'),
  (23, 'WAFFLE', 30 ,'Dessert');

CREATE TABLE daily_transaction (
  inv_date DATE,
  inv_id INT,
  customer_id INT,
  menu_id INT
);

INSERT INTO daily_transaction VALUES
  ('01-01-2024', 101, 1, 1),
  ('01-01-2024', 101, 1, 12),
  ('01-01-2024', 101, 1, 23),
  ('02-01-2024', 102, 2, 3 ),
  ('02-01-2024', 103, 3, 4 ),
  ('02-01-2024', 103, 3, 11 ),
  ('03-01-2024', 104, 1, 1 ),
  ('03-01-2024', 105, 1, 1),
  ('03-01-2024', 105, 1, 12),
  ('04-01-2024', 106, 4, 5),
  ('04-01-2024', 107, 2, 22),
  ('04-01-2024', 108, 3, 3),
  ('04-01-2024', 109, 1, 14);

CREATE TABLE customer (
  id INT UNIQUE,
  name TEXT,
  surname TEXT,
  phone TEXT
);

INSERT INTO customer VALUES
  (1, 'James','Musk', '0812345678'),
  (2, 'Mary', 'Luke', '0823456789'),
  (3, 'John', 'Hang', '0834567890'),
  (4, 'Jane', 'Wick', '0845678901');

.mode table
.header on

-- Total spending of each customer with Customer full name 
SELECT 
  c.name || ' ' || c.surname AS Fullname,
  SUM(a.price) AS Total_spending
  FROM menu AS a
  JOIN daily_transaction AS b
  ON a.id = b.menu_id
  JOIN customer AS c
  ON b.customer_id = c.id
  GROUP by c.name
  ORDER BY Total_spending DESC ;

-- SELECT the most popular menu in food category.
SELECT 
  a.name AS Food_name,
  COUNT(a.name) AS Popular_menu
FROM menu AS a
JOIN daily_transaction AS b
ON a.id = b.menu_id
WHERE a.type = 'Food'
GROUP BY a.name
ORDER BY Popular_menu DESC;

-- WITH clause, calculate the total spending of each customer

WITH all_join AS (
  SELECT *
  FROM menu AS a
  JOIN daily_transaction AS b
  ON a.id = b.menu_id
  JOIN customer AS c
  ON b.customer_id = c.id)
  
SELECT 
  type,
  COUNT(name) AS total_order,
  SUM(Price) AS Total_spending
  FROM all_join
  Group by Type
  ORDER BY total_order DESC;

SELECT * FROM menu;
SELECT * FROM daily_transaction;
SELECT * FROM customer;



