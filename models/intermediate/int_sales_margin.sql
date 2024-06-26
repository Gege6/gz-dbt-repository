SELECT 
orders_id,
date_date,
revenue,
quantity,
quantity * purchase_price AS purchase_cost,
ROUND(revenue - (quantity * purchase_price),2) AS margin
FROM {{ ref('stg_raw__sales') }} AS sales
LEFT JOIN {{ ref('stg_raw__product') }} AS product
ON sales.products_id = product.products_id
