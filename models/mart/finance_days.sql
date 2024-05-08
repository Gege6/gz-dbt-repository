WITH nbtransac AS (
    SELECT
        date_date,
        COUNT(orders_id) AS nb_transactions,
        ROUND(SUM(revenue),2) AS revenue,
        ROUND(SUM(margin),2) AS margin,
        ROUND(SUM(operational_margin),2) AS operational_margin
    FROM {{ref('int_orders_operational')}}
    GROUP BY date_date
)

SELECT 
date_date,
nb_transactions,
revenue,
ROUND((revenue / nb_transactions),2) AS average_basket,
margin,
operational_margin,
FROM nbtransac
ORDER BY date_date DESC



