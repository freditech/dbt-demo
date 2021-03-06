{{ config(materialized='view') }}

WITH customer_nation_region AS (
  SELECT * 
    FROM {{ tbref('customer_test','raw_cust_data','customer') }}
      JOIN {{ tbref('nation_test','raw_cust_data','nation') }}
      ON n_nationkey=c_nationkey
        JOIN {{ tbref('region_test','raw_cust_data','region') }}
        ON n_regionkey=r_regionkey
)
    SELECT
        r_name AS region,
        n_name AS nation,
        n_nationkey AS nation_key,
        c_name AS customer_name,
        c_acctbal AS account_balance,
        c_mktsegment As market_segment
    FROM 
        customer_nation_region