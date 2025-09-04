
SELECT 

    sc.movie_id,
    m.movie_title,
    m.genre,
    m.studio,
    sc.transaction_month AS month,
    sc.location_id AS location,
    sc.rental_cost,
    sc.monthly_tickets_sold AS tickets_sold,
    sc.monthly_revenue AS revenue,
    
    -- Business-relevant metrics

    sc.monthly_revenue - sc.rental_cost AS profit,
    CASE 
        WHEN sc.monthly_tickets_sold = 0 THEN 0 
        ELSE ROUND(sc.monthly_revenue::NUMERIC / sc.monthly_tickets_sold, 2) 
    END AS revenue_per_ticket,
    CASE 
        WHEN sc.rental_cost = 0 THEN NULL 
        ELSE ROUND((sc.monthly_revenue::NUMERIC / sc.rental_cost) * 100, 1) 
    END AS roi_percentage,
    
    -- Performance-Classification

    CASE 
        WHEN sc.monthly_revenue - sc.rental_cost > 1000 THEN 'Rainmaker'
        WHEN sc.monthly_revenue - sc.rental_cost > 0 THEN 'Profitable'
        WHEN sc.monthly_revenue - sc.rental_cost = 0 THEN 'Break Even'
        ELSE 'Loss Making'
    END AS performance_category

FROM {{ ref('int_sales_and_costs_monthly') }} sc

LEFT JOIN {{ ref('stg_movie_catalogue') }} m
    ON sc.movie_id = m.movie_id