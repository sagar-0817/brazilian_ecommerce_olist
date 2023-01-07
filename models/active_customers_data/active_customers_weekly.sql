WITH active_customers_stg AS (
SELECT 
EXTRACT(WEEK FROM orders.order_purchase_timestamp) as week,
EXTRACT(YEAR FROM orders.order_purchase_timestamp) as year,
customers.customer_unique_id,
COUNT(orders.order_id) as num_orders
FROM {{ ref('olist_customers_dataset') }} as customers 
LEFT JOIN {{ ref('olist_orders_dataset') }} as orders
USING(customer_id)
GROUP BY 1, 2, 3
-- customers having at least 1 order
HAVING COUNT(orders.order_id) >= 1
)

SELECT
week, 
year,
COUNT(customer_unique_id) as num_active_customers
FROM active_customers_stg
GROUP BY 1, 2
