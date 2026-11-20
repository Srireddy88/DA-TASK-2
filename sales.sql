CREATE DATABASE retail_sales;
Use retail_sales;
SHOW DATABASES;
SELECT DATABASE();
SHOW TABLES;

DESCRIBE customers_table;
DESCRIBE orders_table;
DESCRIBE products_table;

SELECT COUNT(*) FROM customers_table;
SELECT COUNT(*) FROM orders_table;
SELECT COUNT(*) FROM products_table;

select  * from customers_table
limit 5;
select * from orders_table
limit 5;
select * from products_table
limit 5;

select c.customer_id , c.gender,
		o.order_id,o.quantity,o.payment_method,
        p.product_name,p.price,p.category 
from customers_table c
inner join orders_table o
on c.customer_id=o.customer_id
inner join products_table p
on p.product_id=o.product_id;

select count(order_id) as total_orders
from orders_table;

select count(customer_id) as total_customers
from customers_table;

select count(product_id) as total_products
from products_table;

select distinct category from products_table;

select category,product_name,price from products_table 
order by price desc
limit 10;

SELECT
    SUM(o.quantity * p.price) AS total_revenue
FROM orders_table o
INNER JOIN products_table p
    ON o.product_id = p.product_id;
    
SELECT
    AVG(quantity) AS average_quantity
FROM orders_table;

SELECT
    MAX(price) AS highest_price,
    MIN(price) AS lowest_price
FROM products_table;

SELECT
    p.category,
    SUM(o.quantity * p.price) AS total_revenue
FROM orders_table o
INNER JOIN products_table p
    ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

SELECT
    payment_method,
    COUNT(order_id) AS total_orders
FROM orders_table
GROUP BY payment_method
ORDER BY total_orders DESC;

SELECT
    p.product_name,
    SUM(o.quantity) AS total_quantity_sold
FROM orders_table o
INNER JOIN products_table p
    ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC;

SELECT *
FROM orders_table
WHERE quantity > 3;

SELECT
    p.category,
    SUM(o.quantity * p.price) AS total_revenue
FROM orders_table o
INNER JOIN products_table p
    ON o.product_id = p.product_id
GROUP BY p.category
HAVING SUM(o.quantity * p.price) > 10000;

SELECT
    payment_method,
    COUNT(order_id) AS total_orders
FROM orders_table
GROUP BY payment_method
HAVING COUNT(order_id) > 1000;

SELECT
    category,
    AVG(price) AS average_price
FROM products_table
GROUP BY category
HAVING AVG(price) > 100;

SELECT
    c.customer_id,
    c.gender,
    c.city,
    COUNT(o.order_id) AS total_orders
FROM customers_table c
INNER JOIN orders_table o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.gender,
    c.city
HAVING COUNT(o.order_id) > 3
ORDER BY total_orders DESC;

SELECT
    p.product_id,
    p.product_name,
    SUM(o.quantity) AS total_quantity_sold
FROM products_table p
INNER JOIN orders_table o
    ON p.product_id = o.product_id
GROUP BY
    p.product_id,
    p.product_name
HAVING SUM(o.quantity) > 100
ORDER BY total_quantity_sold DESC;

SELECT
    product_id,
    product_name,
    price
FROM products_table
WHERE price > (
    SELECT AVG(price)
    FROM products_table
);

SELECT
    customer_id,
    gender,
    age,
    city
FROM customers_table
WHERE age > (
    SELECT AVG(age)
    FROM customers_table
);

SELECT
    product_id,
    product_name,
    price
FROM products_table
WHERE price = (
    SELECT MAX(price)
    FROM products_table
);

SELECT
    customer_id,
    gender,
    city
FROM customers_table
WHERE customer_id IN (
    SELECT customer_id
    FROM orders_table
);

SELECT
    product_id,
    product_name,
    price
FROM products_table
WHERE price < (
    SELECT AVG(price)
    FROM products_table
);

SELECT
    order_id,
    customer_id,
    product_id,
    quantity,
    payment_method
FROM orders_table
WHERE quantity > (
    SELECT AVG(quantity)
    FROM orders_table
);

WITH avg_age AS (
    SELECT AVG(age) AS average_age
    FROM customers_table
)
SELECT
    c.customer_id,
    c.age,
    c.city
FROM customers_table c
CROSS JOIN avg_age a
WHERE c.age > a.average_age;

WITH category_revenue AS (
    SELECT
        p.category,
        SUM(o.quantity * p.price) AS total_revenue
    FROM orders_table o
    INNER JOIN products_table p
        ON o.product_id = p.product_id
    GROUP BY p.category
)
SELECT *
FROM category_revenue
WHERE total_revenue > 10000;

WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(order_id) AS total_orders
    FROM orders_table
    GROUP BY customer_id
)
SELECT *
FROM customer_orders
ORDER BY total_orders DESC
LIMIT 5;

WITH avg_age AS (
    SELECT AVG(age) AS average_age
    FROM customers_table
)
SELECT
    c.customer_id,
    c.age,
    c.city
FROM customers_table c
CROSS JOIN avg_age a
WHERE c.age < a.average_age;

WITH product_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(o.quantity) AS total_quantity
    FROM products_table p
    INNER JOIN orders_table o
        ON p.product_id = o.product_id
    GROUP BY
        p.product_id,
        p.product_name
)
SELECT *
FROM product_sales
WHERE total_quantity > 100
ORDER BY total_quantity DESC;

WITH payment_orders AS (
    SELECT
        payment_method,
        COUNT(order_id) AS total_orders
    FROM orders_table
    GROUP BY payment_method
)
SELECT *
FROM payment_orders
ORDER BY total_orders DESC
LIMIT 1;

CREATE VIEW sales_details AS
SELECT
    c.customer_id,
    c.gender,
    c.city,
    o.order_id,
    o.order_date,
    p.product_name,
    p.category,
    o.quantity,
    p.price,
    o.payment_method
FROM customers_table c
INNER JOIN orders_table o
    ON c.customer_id = o.customer_id
INNER JOIN products_table p
    ON o.product_id = p.product_id;
    
SELECT *
FROM sales_details;

SELECT *
FROM sales_details
WHERE category = 'Beauty';

CREATE VIEW category_revenue AS
SELECT
    p.category,
    SUM(o.quantity * p.price) AS total_revenue,
    SUM(o.quantity) AS total_quantity
FROM orders_table o
INNER JOIN products_table p
    ON o.product_id = p.product_id
GROUP BY p.category;
    
SHOW FULL TABLES
WHERE Table_type = 'VIEW';

CREATE VIEW customer_order_details AS
SELECT
    c.customer_id,
    o.order_id,
    p.product_name,
    o.quantity
FROM customers_table c
INNER JOIN orders_table o
    ON c.customer_id = o.customer_id
INNER JOIN products_table p
    ON o.product_id = p.product_id;
    
SELECT *
FROM customer_order_details;

CREATE VIEW payment_summary AS
SELECT
    payment_method,
    COUNT(order_id) AS total_orders
FROM orders_table
GROUP BY payment_method;

SELECT *
FROM payment_summary;

SELECT *
FROM sales_details
WHERE payment_method = 'Cash';
    