
SELECT

    s.movie_id,
    m.movie_title,
    m.genre,
    m.studio,
    s.transaction_month,
    s.location_id,
    COALESCE(c.monthly_price, 0) AS rental_cost,
    s.monthly_tickets_sold,
    s.monthly_revenue

FROM {{ ref('int_sales_monthly') }} s

LEFT JOIN {{ ref('stg_movie_catalogue') }} m
    ON s.movie_id = m.movie_id

LEFT JOIN {{ ref('int_costs_revenue_monthly') }} c
    ON s.movie_id = c.movie_id 
    AND s.location_id = c.location_id 
    AND s.transaction_month = c.invoice_month