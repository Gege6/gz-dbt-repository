SELECT 
orders.orders_id,
orders.date_date,
ROUND((orders.margin + ship.shipping_fee - ship.logcost - ship.ship_cost),2) AS operational_margin,
orders.revenue,
orders.quantity,
orders.purchase_cost,
orders.margin
FROM {{ ref('int_orders_margin') }} orders
LEFT JOIN {{ ref('stg_raw__ship') }} ship
ON orders.orders_id = ship.orders_id
ORDER BY orders_id DESC