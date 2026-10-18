-- Sample data: 3 categories; Asha and Rahul cover all three.
INSERT INTO customers (customer_id, customer_name) VALUES
(1, 'Asha Patil'),
(2, 'Rahul Sharma'),
(3, 'Neha Deshmukh'),
(4, 'Amit Joshi'),
(5, 'Priya Kulkarni');

INSERT INTO categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Books'),
(3, 'Home');

INSERT INTO products (product_id, product_name, category_id) VALUES
(101, 'Headphones', 1),
(102, 'Keyboard', 1),
(201, 'SQL Basics', 2),
(202, 'Novel', 2),
(301, 'Desk Lamp', 3),
(302, 'Water Bottle', 3);

INSERT INTO orders (order_id, customer_id, order_date) VALUES
(1001, 1, DATE '2026-01-10'),
(1002, 1, DATE '2026-01-12'),
(1003, 1, DATE '2026-01-15'),
(1004, 2, DATE '2026-02-01'),
(1005, 2, DATE '2026-02-03'),
(1006, 2, DATE '2026-02-05'),
(1007, 3, DATE '2026-02-10'),
(1008, 3, DATE '2026-02-12'),
(1009, 4, DATE '2026-02-15');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
-- Asha: Electronics, Books, Home
(1001, 101, 1),
(1002, 201, 1),
(1003, 301, 1),
-- Rahul: Electronics, Books, Home
(1004, 102, 1),
(1005, 202, 2),
(1006, 302, 1),
-- Neha: Electronics and Books only
(1007, 101, 1),
(1008, 201, 1),
-- Amit: Home only
(1009, 301, 1);
-- Priya has no orders.
