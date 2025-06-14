-- schema.sql

-- Create Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    country VARCHAR(50)
);

-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


-- data.sql

-- Insert Products
INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 1200.00),
(2, 'Smartphone', 'Electronics', 800.00),
(3, 'Headphones', 'Accessories', 150.00),
(4, 'Desk Chair', 'Furniture', 250.00);

-- Insert Customers
INSERT INTO Customers VALUES
(1, 'Alice Smith', 'alice@example.com', 'UAE'),
(2, 'Bob Khan', 'bob@example.com', 'UAE'),
(3, 'Carla Lee', 'carla@example.com', 'UK');

-- Insert Orders
INSERT INTO Orders VALUES
(1, 1, 1, 1, '2024-10-01'),
(2, 2, 2, 2, '2024-10-02'),
(3, 3, 3, 3, '2024-10-03'),
(4, 1, 2, 1, '2024-10-04'),
(5, 2, 4, 1, '2024-10-05');


-- queries.sql

-- Total revenue per product
SELECT p.product_name, SUM(o.quantity * p.price) AS total_revenue
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- Top customer by spending
SELECT c.name, SUM(o.quantity * p.price) AS total_spent
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 1;

-- Orders over time
SELECT order_date, COUNT(*) AS total_orders
FROM Orders
GROUP BY order_date
ORDER BY order_date ASC;

-- Products sold by category
SELECT category, SUM(quantity) AS total_sold
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY category;
