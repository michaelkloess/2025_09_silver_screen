
SELECT

    transaction_date,
    location_id,
    movie_id,
    SUM(ticket_amount) AS tickets_sold,
    SUM(ticket_amount * ticket_price) AS revenue
    
FROM {{ ref('stg_nj_003') }}

GROUP BY 1, 2, 3