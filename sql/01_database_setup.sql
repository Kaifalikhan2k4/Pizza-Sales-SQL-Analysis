-- =========================================
-- PIZZA SALES SQL ANALYSIS
-- DATABASE SETUP
-- =========================================

-- Create orders table

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    date DATE,
    time TIME
);


-- Create order_details table

CREATE TABLE order_details (
    order_details_id INT PRIMARY KEY,
    order_id INT,
    pizza_id VARCHAR(50),
    quantity INT
);


-- Create pizzas table

CREATE TABLE pizzas (
    pizza_id VARCHAR(50) PRIMARY KEY,
    pizza_type_id VARCHAR(50),
    size VARCHAR(10),
    price NUMERIC(10,2)
);


-- Create pizza_types table

CREATE TABLE pizza_types (
    pizza_type_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(150),
    category VARCHAR(50),
    ingredients TEXT
);