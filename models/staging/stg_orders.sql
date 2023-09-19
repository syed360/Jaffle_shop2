{{ config( materialized = 'table') }}

with source_data as (  
    select * from {{ ref('raw_orders')}}
),
column_rename as(

    select id as order_id,
    user_id as customer_id,
    TO_TIMESTAMP(order_date) as Order_timestamp,
    status

    from source_data
),
final as(
    select * from 
    column_rename
)
select * from final