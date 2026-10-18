-- Alternative using INTERSECT.
-- Build the set of customers who bought from every category, then join names.
-- Add one INTERSECT branch per category in the current data.
WITH customers_all_categories AS (
    SELECT o.customer_id
    FROM orders o
    JOIN order_items oi ON oi.order_id = o.order_id
    JOIN products p ON p.product_id = oi.product_id
    WHERE p.category_id = 1

    INTERSECT

    SELECT o.customer_id
    FROM orders o
    JOIN order_items oi ON oi.order_id = o.order_id
    JOIN products p ON p.product_id = oi.product_id
    WHERE p.category_id = 2

    INTERSECT

    SELECT o.customer_id
    FROM orders o
    JOIN order_items oi ON oi.order_id = o.order_id
    JOIN products p ON p.product_id = oi.product_id
    WHERE p.category_id = 3
)
SELECT c.customer_id, c.customer_name
FROM customers c
JOIN customers_all_categories x ON x.customer_id = c.customer_id
ORDER BY c.customer_id;

-- Note: this INTERSECT example assumes category IDs 1, 2, and 3.
-- Prefer solution.sql if categories can be added or removed.
