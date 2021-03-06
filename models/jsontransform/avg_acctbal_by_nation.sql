{{ config(materialized='view') }}

SELECT
nation_key,
avg(account_balance) as avg_acct_bal_by_nation
  FROM {{ ref('customer_nation_region') }}
    GROUP BY nation_key