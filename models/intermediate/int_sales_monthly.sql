
SELECT 
    movie_id,
    location_id,
    DATETRUNC(transaction_date, MONTH) AS transaction_month,
    SUM(ticket_amount) AS sum_ticket_amount,
    SUM(ticket_price) AS sum_ticket_price
FROM {{ ref('int_sales') }}
GROUP BY 1, 2, 3