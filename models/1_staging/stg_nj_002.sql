
SELECT

    date AS transaction_date, 
    movie_id,
    COALESCE(ticket_amount, 0) AS ticket_amount,
    COALESCE(ticket_price, 0) AS ticket_price,
    'NJ_002' AS location_id
    
FROM {{ source('raw', 'nj_002') }}