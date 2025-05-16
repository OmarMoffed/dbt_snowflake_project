SELECT
    id AS customer_id,
    name AS customer_name,
    email,
    country
FROM {{ source('snowflake_raw_data', 'customers') }}
