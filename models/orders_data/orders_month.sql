-- Number of Orders per month
SELECT
EXTRACT(MONTH FROM order_purchase_timestamp) as month,
EXTRACT(YEAR FROM order_purchase_timestamp) as year,
COUNT(DISTINCT order_id) as num_orders 
FROM {{ ref('olist_orders_dataset') }}
GROUP BY 1, 2
