
SELECT
id AS product_id,
name AS product_name,
category AS product_category,
price AS product_price
FROM {{ source('snowflake_raw_data', 'products') }}
