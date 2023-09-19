{{config( materialized = 'table', tags = ["special"])}}

with customer_data as(
    select * from {{ ref('stg_customers') }}
),
Payments_data as(
    select * from {{ ref('stg_payments')}}
),
orders_data as(
    select * from {{ ref('stg_orders')}}
),
customers_aggregation as(
    select customer_data.full_name as full_name, 
    sum(Payments_data.amount)/100 as Total_expenditure,
    '{{ dbt_utils.pretty_time(format="%Y-%m-%d %H:%M:%S") }}' as created_at

    from customer_data 
    join orders_data 
        on customer_data.payment_id = orders_data.customer_id
    join Payments_data 
        on Payments_data.order_id = orders_data.order_id
    group by customer_data.full_name
    order by Total_expenditure desc 

)
select * from customers_aggregation
