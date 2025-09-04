
SELECT

    transaction_date,
    location_id, 
    movie_id,
    ticket_amount AS daily_tickets_sold,
    ticket_amount * ticket_price AS daily_revenue

FROM {{ ref('stg_nj_002') }}