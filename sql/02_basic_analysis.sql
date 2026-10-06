-- =========================================
-- PIZZA SALES SQL ANALYSIS
-- BASIC ANALYSIS
-- =========================================


-- Q1. Retrieve the total number of orders placed

SELECT COUNT(*) AS total_orders
FROM orders;


-- Q2. Calculate the total revenue generated from pizza sales

SELECT
    SUM(p.price * od.quantity) AS total_revenue
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id;
-- Q3. Identify the highest-priced pizza

SELECT
    pt.name AS pizza_name,
    p.size,
    p.price
FROM pizzas p
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;
-- Q4. Identify the most common pizza size ordered

SELECT
    p.size,
    SUM(od.quantity) AS total_quantity
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY total_quantity DESC
LIMIT 1;
-- Q5. Top 5 most ordered pizza types

SELECT
    pt.name AS pizza_name,
    SUM(od.quantity) AS total_quantity
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_quantity DESC
LIMIT 5;