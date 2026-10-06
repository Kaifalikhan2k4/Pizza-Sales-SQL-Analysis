# 🍕 Pizza Sales SQL Analysis

## 📌 Project Overview

This project analyzes pizza sales data using PostgreSQL and SQL.

The objective is to extract meaningful business insights from pizza
orders, products, pricing, categories, and sales trends.

The project covers basic, intermediate, and advanced SQL analysis.

---

## 🛠️ Tools & Technologies

- PostgreSQL
- SQL
- pgAdmin
- VS Code
- Git
- GitHub

---

## 📂 Dataset

The dataset contains four main tables:

- `orders`
- `order_details`
- `pizzas`
- `pizza_types`

### Table Relationships

`orders` → `order_details` → `pizzas` → `pizza_types`

---

## 🔍 Analysis Performed

### Basic Analysis

- Total number of orders
- Total revenue
- Highest-priced pizza
- Most common pizza size
- Top 5 most ordered pizza types

### Intermediate Analysis

- Quantity ordered by pizza category
- Orders by hour of the day
- Category-wise pizza distribution
- Average pizzas ordered per day
- Top 3 pizza types by revenue

### Advanced Analysis

- Revenue contribution by pizza type
- Cumulative revenue over time
- Top 3 pizza types by revenue within each category

---

## 📁 Project Structure

```text
Pizza-Sales-SQL-Analysis/
│
├── data/
├── sql/
├── screenshots/
├── README.md
└── .gitignore