-- Number of Orders per week
SELECT
EXTRACT(WEEK FROM order_purchase_timestamp) as week_num,
EXTRACT(YEAR FROM order_purchase_timestamp) as year,
COUNT(DISTINCT order_id) as num_orders 
FROM {{ ref('olist_orders_dataset') }}
GROUP BY 1, 2
