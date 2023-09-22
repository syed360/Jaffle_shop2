{{config(materialized = 'table')}}
with source as(
    select to_date('2023-09-21') as UTC_date, 'USD' as currency, 1 as exchange_rate_USD
    union all
    select to_date('2023-09-21') as UTC_date, 'INR' as currency, 2 as exchange_rate_USD
    union all 
    select to_date('2023-09-21') as UTC_date, 'EUR' as currency, 3 as exchange_rate_USD
    union all
    select to_date('2023-09-21') as UTC_date, 'AUD' as currency, 3 as exchange_rate_USD
    union all
    select to_date('2023-09-22') as UTC_date, 'USD' as currency, 1 as exchange_rate_USD
    union all
    select to_date('2023-09-22') as UTC_date, 'INR' as currency, 2 as exchange_rate_USD
    union all 
    select to_date('2023-09-22') as UTC_date, 'EUR' as currency, 3 as exchange_rate_USD
    union all
    select to_date('2023-09-22') as UTC_date, 'NNN' as currency, 3 as exchange_rate_USD
    union all
    select to_date('2023-09-23') as UTC_date, 'USD' as currency, 1 as exchange_rate_USD
    union all
    select to_date('2023-09-23') as UTC_date, 'INR' as currency, 2 as exchange_rate_USD
    union all 
    select to_date('2023-09-23') as UTC_date, 'EUR' as currency, 3 as exchange_rate_USD
    union all
    select to_date('2023-09-23') as UTC_date, 'NNN' as currency, 3 as exchange_rate_USD
    union all
    select to_date('2023-09-24') as UTC_date, 'INR' as currency, 3 as exchange_rate_USD
) 
select * from source