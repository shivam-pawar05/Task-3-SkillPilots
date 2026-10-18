-- Main solution: customers who purchased at least one product in every category.
-- PostgreSQL-compatible double-NOT-EXISTS query.
SELECT c.customer_id, c.customer_name
FROM customers AS c
WHERE NOT EXISTS (
    SELECT 1
    FROM categories AS cat
    WHERE NOT EXISTS (
        SELECT 1
        FROM orders AS o
        JOIN order_items AS oi ON oi.order_id = o.order_id
        JOIN products AS p ON p.product_id = oi.product_id
        WHERE o.customer_id = c.customer_id
          AND p.category_id = cat.category_id
    )
)
ORDER BY c.customer_id;
