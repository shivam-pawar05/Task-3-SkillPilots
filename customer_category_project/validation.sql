-- 1) Show all customers and the categories they have purchased from.
SELECT c.customer_name, cat.category_name
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
JOIN categories cat ON cat.category_id = p.category_id
GROUP BY c.customer_name, cat.category_name
ORDER BY c.customer_name, cat.category_name;

-- 2) Expected result of the main query: Asha Patil and Rahul Sharma.
SELECT c.customer_id, c.customer_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM categories cat
    WHERE NOT EXISTS (
        SELECT 1
        FROM orders o
        JOIN order_items oi ON oi.order_id = o.order_id
        JOIN products p ON p.product_id = oi.product_id
        WHERE o.customer_id = c.customer_id
          AND p.category_id = cat.category_id
    )
)
ORDER BY c.customer_id;

-- 3) Sanity check: should return 2.
SELECT COUNT(*) AS qualifying_customer_count
FROM (
    SELECT c.customer_id
    FROM customers c
    WHERE NOT EXISTS (
        SELECT 1
        FROM categories cat
        WHERE NOT EXISTS (
            SELECT 1
            FROM orders o
            JOIN order_items oi ON oi.order_id = o.order_id
            JOIN products p ON p.product_id = oi.product_id
            WHERE o.customer_id = c.customer_id
              AND p.category_id = cat.category_id
        )
    )
) AS qualifying_customers;
