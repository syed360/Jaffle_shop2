{% snapshot orders_snapshot %}
{{
    config(
        target_database= 'DEMO_DB',
        target_schema= 'snapshot',
        unique_key= 'order_id',
        strategy='timestamp',
        updated_at = 'Order_timestamp'

    )
}}

select * from {{ source('orders_source' , 'order_details')}}

{% endsnapshot %}