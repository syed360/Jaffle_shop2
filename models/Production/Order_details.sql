{{config( materialized = 'table')}}
{% set order_methods = ['placed', 'shipped', 'completed', 'return_pending', 'returned'] %}
{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}

with customer_data as(
    select * from {{ ref('stg_customers') }}
),
Payments_data as(
    select * from {{ ref('stg_payments')}}
),
orders_data as(
    select * from {{ ref('stg_orders')}}
),
order_details as(
    select orders_data.order_id,
    case
    {% for order_method in order_methods -%}
        when orders_data.status = '{{ order_method }}' then orders_data.status
    {% endfor -%}
    END AS order_method,
    orders_data.Order_timestamp

    from orders_data

),
payments_details as(
    select order_details.order_id,
    order_details.order_method,
    order_details.Order_timestamp,
    payments_data.amount/100 as In_dollars
    from order_details
    left join payments_data on order_details.order_id = payments_data.order_id
)
select * from payments_details


