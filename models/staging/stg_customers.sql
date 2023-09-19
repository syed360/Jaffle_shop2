{{ config( materialized = 'table') }}
with source as (
    
    select * from {{ ref('raw_customers') }}

),

renamed as (

    select
        id as payment_id,
        concat(first_name,' ', last_name) as Full_name

    from source

)

select * from renamed