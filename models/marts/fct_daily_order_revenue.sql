SELECT
    stg_orders.order_date,
    stg_orders.order_id,
    sum(stg_order_items.total_price) AS total_price
FROM
    {{ ref('stg_orders') }} AS stg_orders
LEFT JOIN {{ ref('stg_order_items') }} AS stg_order_items ON stg_orders.order_id = stg_order_items.order_id
GROUP BY stg_orders.order_date, stg_orders.order_id
