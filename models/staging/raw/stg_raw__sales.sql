with 

source as (

    select * from {{ source('raw', 'sales') }}

),

renamed as (

    select
        date_date,
        orders_id,
        pdt_id AS products_id,
        CONCAT(date_date,"_",orders_id,"_",pdt_id) AS date_date_orders_product_id,
        revenue,
        CAST(quantity AS FLOAT64) AS quantity

    from source

)

select * from renamed
