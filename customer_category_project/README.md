# Customer Purchase Category Coverage (SQL Project)

## Task
Create a complex SQL query that lists customers who have purchased **every product category**, using subqueries and set operators / anti-join logic.

## Database
This project uses portable SQL compatible with PostgreSQL (recommended). The main query uses `NOT EXISTS`, which is broadly supported. An `INTERSECT` example is also included for learning.

## Project structure
```text
customer_category_project/
├── README.md
├── schema.sql
├── sample_data.sql
├── solution.sql
├── alternative_intersect.sql
└── validation.sql
```

## Run with PostgreSQL
1. Install PostgreSQL and open `psql`, pgAdmin, or another SQL client.
2. Create a database, for example `customer_category_db`.
3. Run these files in order:
   - `schema.sql`
   - `sample_data.sql`
   - `solution.sql`
   - `validation.sql`
4. Optional: run `alternative_intersect.sql` to inspect the set-operator approach.

Example using `psql`:
```bash
createdb customer_category_db
psql -d customer_category_db -f schema.sql
psql -d customer_category_db -f sample_data.sql
psql -d customer_category_db -f solution.sql
psql -d customer_category_db -f validation.sql
```

## Tables and relationships
- `customers(customer_id, customer_name)`
- `categories(category_id, category_name)`
- `products(product_id, product_name, category_id)`
- `orders(order_id, customer_id, order_date)`
- `order_items(order_id, product_id, quantity)`

An order item links a purchased product to a customer through `orders`.

## Expected result
With the included sample data, the main query returns:
- Asha Patil
- Rahul Sharma

These customers have purchased at least one product from each category in the sample database. Customers with no orders or missing a category are excluded.

## Query logic
For each customer, the outer query checks that there is **no category** for which that customer has no matching purchase. This is the double `NOT EXISTS` pattern:
- Outer `NOT EXISTS`: no missing category exists.
- Inner `NOT EXISTS`: no order item from that customer matches the category.

This avoids relying on a fixed category count and handles new categories automatically.

## Notes
- The query treats a category as purchased if the customer has purchased at least one product in that category.
- The sample data uses three categories: Electronics, Books, and Home.
