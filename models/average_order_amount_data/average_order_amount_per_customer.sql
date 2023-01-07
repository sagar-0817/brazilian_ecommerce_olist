SELECT 
customers.customer_unique_id,
SUM(order_payments.payment_value)/COUNT(DISTINCT orders.order_id) as average_order_amount,
FROM {{ ref('olist_customers_dataset') }} as customers
LEFT JOIN {{ ref('olist_orders_dataset') }} as orders
USING(customer_id)
LEFT JOIN {{ ref('olist_order_payments_dataset') }} as order_payments
USING(order_id)
-- -- Specify date range
-- WHERE DATE(orders.order_purchase_timestamp) BETWEEN "START_DATE" AND "END_DATE"
GROUP BY 1
