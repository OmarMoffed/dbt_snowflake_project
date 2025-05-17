SELECT
    id AS customer_id,
    name AS customer_name,
    email,
    country AS country_name
FROM {{ source('snowflake_raw_data', 'customers') }}
