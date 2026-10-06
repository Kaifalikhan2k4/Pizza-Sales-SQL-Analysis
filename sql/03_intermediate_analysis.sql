-- Q6. Total quantity of each pizza category ordered

SELECT
    pt.category,
    SUM(od.quantity) AS total_quantity
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY total_quantity DESC;
-- Q7. Distribution of orders by hour of the day

SELECT
    EXTRACT(HOUR FROM time) AS order_hour,
    COUNT(*) AS total_orders
FROM orders
GROUP BY EXTRACT(HOUR FROM time)
ORDER BY order_hour;

-- Q8. Category-wise distribution of pizza types

SELECT
    pt.category,
    COUNT(DISTINCT pt.pizza_type_id) AS pizza_type_count
FROM pizza_types pt
GROUP BY pt.category
ORDER BY pizza_type_count DESC;
-- Q9. Average number of pizzas ordered per day

SELECT
    AVG(daily_quantity) AS average_pizzas_per_day
FROM (
    SELECT
        o.date,
        SUM(od.quantity) AS daily_quantity
    FROM orders o
    JOIN order_details od
        ON o.order_id = od.order_id
    GROUP BY o.date
) AS daily_sales;
-- Q10. Top 3 pizza types based on revenue

SELECT
    pt.name AS pizza_name,
    SUM(p.price * od.quantity) AS total_revenue
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_revenue DESC
LIMIT 3;
