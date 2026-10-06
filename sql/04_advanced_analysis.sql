-- Q11. Percentage contribution of each pizza type to total revenue

SELECT
    pt.name AS pizza_name,
    SUM(p.price * od.quantity) AS pizza_revenue,
    ROUND(
        SUM(p.price * od.quantity) * 100.0 /
        SUM(SUM(p.price * od.quantity)) OVER (),
        2
    ) AS revenue_percentage
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY revenue_percentage DESC;
-- Q12. Cumulative revenue generated over time

SELECT
    order_date,
    daily_revenue,
    SUM(daily_revenue) OVER (
        ORDER BY order_date
    ) AS cumulative_revenue
FROM (
    SELECT
        o.date AS order_date,
        SUM(p.price * od.quantity) AS daily_revenue
    FROM orders o
    JOIN order_details od
        ON o.order_id = od.order_id
    JOIN pizzas p
        ON od.pizza_id = p.pizza_id
    GROUP BY o.date
) AS daily_sales
ORDER BY order_date;
-- Q13. Top 3 pizza types by revenue for each category

WITH pizza_revenue AS (
    SELECT
        pt.category,
        pt.name AS pizza_name,
        SUM(p.price * od.quantity) AS total_revenue
    FROM order_details od
    JOIN pizzas p
        ON od.pizza_id = p.pizza_id
    JOIN pizza_types pt
        ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY
        pt.category,
        pt.name
),

ranked_pizzas AS (
    SELECT
        category,
        pizza_name,
        total_revenue,
        RANK() OVER (
            PARTITION BY category
            ORDER BY total_revenue DESC
        ) AS revenue_rank
    FROM pizza_revenue
)

SELECT
    category,
    pizza_name,
    total_revenue,
    revenue_rank
FROM ranked_pizzas
WHERE revenue_rank <= 3
ORDER BY
    category,
    revenue_rank;