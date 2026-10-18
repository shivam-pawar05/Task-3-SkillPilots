-- Create the project schema (PostgreSQL)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id   INTEGER PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL
);

CREATE TABLE categories (
    category_id   INTEGER PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE products (
    product_id   INTEGER PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id  INTEGER NOT NULL REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id    INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES customers(customer_id),
    order_date  DATE NOT NULL
);

CREATE TABLE order_items (
    order_id  INTEGER NOT NULL REFERENCES orders(order_id),
    product_id INTEGER NOT NULL REFERENCES products(product_id),
    quantity  INTEGER NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (order_id, product_id)
);
