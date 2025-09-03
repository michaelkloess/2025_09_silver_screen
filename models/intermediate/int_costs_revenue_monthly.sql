
SELECT 
    movie_id,
    location_id,
    studio,
    DATETRUNC(invoice_date, MONTH) AS invoice_month,
    SUM(weekly_price) AS sum_weekly_price,
    SUM(weekly_price) * 4 AS total_price,
    COUNT(invoice_id) AS count_invoices
FROM {{ ref('stg_invoices') }}
GROUP BY 1, 2, 3, 4