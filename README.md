Welcome to your new dbt project!

### Using the starter project

Covered topics like 
macros 
-docs 
-test 
-compiled/run/ query
-sources[snowflake]
- tags to run/test models in group 
- multi repo approach
- ephemeral

Steps in Processing involves:
1. Create the tables for seeds while referencing them with dbt-seed
2. configure schema for seeds in DBT_profile: schema-> Public,Table
3. Freshness failed for when the data is stale, Passed when raw_orders is 
edited with addition of new current_date4.Use Macro to dump tables in specified path without adding the default schema prefix
5.Models:-->>
	a.stg_orders
	b.stg_customers
	c.stg_payments
6.Create customer_details table which will get the total expenditure
done by each customer
Creare order_details table which will use functionalities such as 
macro for, set, etc
customers-->orders-->payments 
7.Create tests for accepted values on stg_customers/stg_orders table
and null/unique for customer_details tables
8.create exposure and documentation of the whole project with the 
lineage	graph