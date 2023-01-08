WITH all_data_combined AS (
  SELECT 
  customers.customer_unique_id, 
  orders.order_purchase_timestamp,
  orders.order_id,
  product_category.product_category_name_english as product_category_name
  FROM {{ ref('olist_customers_dataset') }} as customers
  LEFT JOIN {{ ref('olist_orders_dataset') }} as orders
  USING(customer_id)
  LEFT JOIN {{ ref('olist_order_items_dataset') }} as order_items
  USING(order_id)
  LEFT JOIN {{ ref('olist_products_dataset') }} as products
  USING(product_id)
  LEFT JOIN {{ ref('product_category_name_translation') }} as product_category
  USING(product_category_name)
)

SELECT
DISTINCT
a1.product_category_name,
a1.customer_unique_id,
a1.order_purchase_timestamp,
a1.order_id,
a2.product_category_name as product_category_name_prev,
a2.order_purchase_timestamp as order_purchase_timestamp_prev,
a2.order_id as order_id_prev,
FROM all_data_combined as a1
LEFT JOIN all_data_combined as a2
-- previous order purchased by the same customer in a different product category 
ON a1.customer_unique_id = a2.customer_unique_id AND a1.order_purchase_timestamp > a2.order_purchase_timestamp AND a1.product_category_name != a2.product_category_name
WHERE a2.order_purchase_timestamp IS NOT NULL
