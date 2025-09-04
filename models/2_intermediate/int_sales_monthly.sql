
SELECT 

    movie_id,
    location_id,
    DATE_TRUNC('MONTH', transaction_date) AS transaction_month,
    SUM(daily_tickets_sold) AS monthly_tickets_sold,
    SUM(daily_revenue) AS monthly_revenue

FROM {{ ref('int_sales_daily_union') }}

GROUP BY 1, 2, 3