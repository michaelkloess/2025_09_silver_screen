
SELECT 

    movie_id,
    location_id,
    DATE_TRUNC('MONTH', transaction_date) AS transaction_month,
    SUM(ticket_amount) AS sum_ticket_amount,
    SUM(ticket_price) AS sum_ticket_price

FROM {{ ref('int_sales_daily_union') }}

GROUP BY 1, 2, 3