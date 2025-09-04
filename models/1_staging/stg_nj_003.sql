
SELECT

    timestamp::DATE AS transaction_date,
    details AS movie_id,
    COALESCE(amount, 0) AS ticket_amount,
    COALESCE(price, 0) AS ticket_price,
    'NJ_003' AS location_id

FROM {{ source('raw', 'nj_003') }}

WHERE product_type = 'ticket'