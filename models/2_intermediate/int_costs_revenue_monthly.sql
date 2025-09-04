
SELECT 

    movie_id,
    location_id,
    studio,
    DATE_TRUNC('MONTH', invoice_date) AS invoice_month,
    SUM(weekly_price) AS weekly_price,
    SUM(weekly_price) * 4 AS monthly_price,
    COUNT(invoice_id) AS count_invoices

FROM {{ ref('stg_invoices') }}

GROUP BY 1, 2, 3, 4