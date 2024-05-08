

select
    date_date,
    count(orders_id) as nb_transactions,
    sum(revenue) as revenue,
    sum(revenue) / count(orders_id) as average_basket,
    sum(margin) as margin,
    sum(operational_margin) as operational_margin
from {{ ref("int_orders_operational") }}
group by date_date
