-- Number of Orders per day
SELECT 
DATE(order_purchase_timestamp) as order_date, 
COUNT(DISTINCT order_id) as num_orders 
FROM {{ ref('olist_orders_dataset') }}
GROUP BY 1
