WITH nbtransac AS (
    SELECT
        date_date,
        COUNT(orders_id) AS nb_transactions,
        SUM(revenue) AS revenue,
        SUM(margin) AS margin,
        SUM(operational_margin) AS operational_margin
    FROM {{ref('int_orders_operational')}}
    GROUP BY date_date
)

SELECT 
date_date,
(nb_transactions),
(revenue),
(revenue / nb_transactions) AS average_basket,
(margin),
(operational_margin),
FROM nbtransac
ORDER BY date_date DESC


--SELECT
        --date_date,
        --COUNT(orders_id) AS nb_transactions,
        --SUM(revenue) AS revenue,
        --SUM(revenue) / COUNT(orders_id) AS average_basket,
        --SUM(margin) AS margin,
        --SUM(operational_margin) AS operational_margin
    --FROM {{ref('int_orders_operational')}}
    --GROUP BY date_date
