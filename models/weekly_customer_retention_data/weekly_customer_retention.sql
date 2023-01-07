WITH customers_orders_combined AS (
  SELECT 
  customers.customer_unique_id, 
  orders.order_purchase_timestamp,
  EXTRACT(WEEK FROM order_purchase_timestamp) as week_num,
  EXTRACT(YEAR FROM order_purchase_timestamp) as year
  FROM {{ ref('olist_customers_dataset') }} as customers
  LEFT JOIN {{ ref('olist_orders_dataset') }} as orders
  USING(customer_id)
)

SELECT 
c1.week_num,
c1.year,
COUNT(DISTINCT c2.customer_unique_id) as num_retained_customers
FROM customers_orders_combined as c1
LEFT JOIN customers_orders_combined as c2
ON 
  c1.customer_unique_id = c2.customer_unique_id 
  -- customers who purchased previously
  AND DATETIME_TRUNC(c1.order_purchase_timestamp, WEEK) > DATETIME_TRUNC(c2.order_purchase_timestamp, WEEK)
GROUP BY 1, 2
