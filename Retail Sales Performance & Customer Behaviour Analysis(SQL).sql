 -- Top Spending Customer
SELECT 
    c.customer_name, SUM(o.total_amount) AS Total_Amount
FROM
    customers c
        JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY SUM(o.total_amount) DESC;
 -- Most Selling Product
SELECT 
    p.product_name, SUM(od.quantity) AS Quantity
FROM
    products p
        JOIN
    order_details od ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY SUM(od.quantity) DESC;
 -- Monthly Revenue
SELECT 
    MONTH(order_date) AS Month,
    SUM(total_amount) AS Total_Amount
FROM
    orders
GROUP BY MONTH(order_date);
 -- Repeat Customers
SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM
    customers c
        JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id , c.customer_name
HAVING COUNT(o.order_id) > 1;
 -- Top 3 Customers
SELECT 
    c.customer_name, SUM(o.total_amount) AS total_spent
FROM
    customers c
        JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY SUM(o.total_amount) DESC
LIMIT 3;
 -- Category Wise Revenue
SELECT 
    p.category, SUM(od.subtotal) AS total_revenue
FROM
    products p
        JOIN
    order_details od ON p.product_id = od.product_id
GROUP BY p.category;
 -- Average Order Value
SELECT 
    AVG(total_amount) AS avg_order_value
FROM
    orders;
 -- Highest Revenue Month
SELECT 
    MONTH(o.order_date) AS Month,
    p.category,
    SUM(od.subtotal) AS total_revenue
FROM
    orders o
        JOIN
    order_details od ON od.order_id = o.order_id
        JOIN
    products p ON od.product_id = p.product_id
GROUP BY MONTH(o.order_date) , p.category
ORDER BY Month , total_revenue DESC;
 -- Product Wise Sales Performance
SELECT 
    p.product_id,
    p.product_name,
    SUM(od.quantity) AS total_quantity_sold,
    SUM(od.subtotal) AS total_revenue
FROM
    products p
        JOIN
    order_details od ON od.product_id = p.product_id
GROUP BY p.product_id , p.product_name
ORDER BY SUM(od.subtotal) DESC;
 -- Revenue Contribution Per Customer
SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    SUM(od.subtotal) AS customer_revenue
FROM
    customers c
        JOIN
    orders o ON o.customer_id = c.customer_id
        JOIN
    order_details od ON od.order_id = o.order_id
GROUP BY c.customer_id , c.customer_name , c.city
ORDER BY SUM(od.subtotal) DESC;