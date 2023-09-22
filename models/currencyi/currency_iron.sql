{{
    config(
        materialized='incremental',
        unique_key='UTC_date',
        incremental_strategy='merge'
    )
}}
with source as( 
    select * from {{ ref('currency')}}
),
pivoted as(
    select UTC_date,
    {{ dbt_utils.pivot('currency',
                    values=['USD','INR','EUR','AUD','NNN'],
                    prefix= 'usd_to',
                    agg='sum',
                    then_value='exchange_rate_USD') }}
    from source 
    group by UTC_date
)
{% if is_incremental() %}
    select *,'{{ dbt_utils.pretty_time(format="%Y-%m-%d %H:%M:%S") }}'  as invocation_date from pivoted 
    where UTC_date > (select max(UTC_date) from {{this}})
{% else %}

    select *,'{{ dbt_utils.pretty_time(format="%Y-%m-%d %H:%M:%S") }}' as invocation_date from pivoted

{% endif %}

