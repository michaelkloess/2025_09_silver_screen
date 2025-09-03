
SELECT
    date AS transaction_date, 
    movie_id,
    COALESCE(ticket_amount, 0),
    COALESCE(ticket_price, 0),
    'NJ_002' AS location_id
FROM {{ source('source_name', 'object_name') }}