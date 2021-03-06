select 1
from {{ source('raw_cust_data', 'customer') }}
where not (c_acctbal >= -1000)