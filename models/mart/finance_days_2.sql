
{{ config( materialized='table') }}

SELECT
        date_date,
        COUNT(orders_id) AS nb_transactions,
        SUM(revenue) AS revenue,
        SUM(revenue) / COUNT(orders_id) AS average_basket,
        SUM(margin) AS margin,
        SUM(operational_margin) AS operational_margin
    FROM {{ref('int_orders_operational')}}
    GROUP BY date_date