
SELECT

    transaction_date,
    location_id, 
    movie_id,
    ticket_amount AS tickets_sold,
    ticket_amount * ticket_price AS revenue
    
FROM {{ ref('stg_nj_002') }}