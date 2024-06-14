/*
products table:
-------------------------
product_id (integer)
product_name (varchar)
category (varchar)
price (numeric)

orders table:
-------------------------
order_id (integer)
customer_id (integer)
order_date (date)
total_amount (numeric)

order_items table:
-------------------------
order_item_id (integer)
order_id (integer)
product_id (integer)
quantity (integer)
price (numeric)
*/

-- Check for products in the order_items table that do not exist in the products table.

CREATE INDEX1 ON products(category, product_name);

CREATE INDEX2 ON products(product_id);

CREATE INDEX3 ON orders(order_id);

CREATE INDEX4 ON orders(customer_id, order_id);

CREATE INDEX5 ON orders(order_date);

CREATE INDEX6 ON order_items(order_id);

CREATE INDEX7 ON order_items(product_id);

