
SELECT

    timestamp::DATE AS transaction_date, 
    movie_id,
    COALESCE(ticket_amount, 0) AS ticket_amount,
    COALESCE(price, 0) AS ticket_price,
    'NJ_001' AS location_id

FROM {{ source('raw', 'nj_001') }}