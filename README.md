# mysql-sales-analysis
SQL project analyzing sales data using MySQL. Includes schema, queries, and business insights
# MySQL Sales Analysis Project

This is a personal data analytics project built using MySQL. It simulates a sales database and includes analysis of products, customers, and revenue trends.

## 🗂️ Project Structure
- `schema.sql`: SQL code to create tables
- `data.sql`: Sample data for each table
- `queries.sql`: Key SQL queries for analysis
- `insights.txt`: Business findings based on the data

## 🧠 Key Skills
- SQL (joins, aggregation, subqueries)
- Relational database design
- Business insights extraction

## 💡 Sample Query
```sql
SELECT product_name, SUM(quantity) AS total_sold
FROM orders
GROUP BY product_name
ORDER BY total_sold DESC
LIMIT 5;
