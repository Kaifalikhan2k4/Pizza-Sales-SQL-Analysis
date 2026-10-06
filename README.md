# 🍕 Pizza Sales SQL Analysis

## 📌 Project Overview

This project analyzes pizza sales data using PostgreSQL and SQL to identify
sales trends, product performance, ordering patterns, and revenue insights.

The project covers Basic, Intermediate, and Advanced SQL analysis.

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

The dataset contains four tables:

- `orders`
- `order_details`
- `pizzas`
- `pizza_types`

### Database Relationships

```text
orders
   │
   │ order_id
   ↓
order_details
   │
   │ pizza_id
   ↓
pizzas
   │
   │ pizza_type_id
   ↓
pizza_types