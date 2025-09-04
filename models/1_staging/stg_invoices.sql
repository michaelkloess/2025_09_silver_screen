
SELECT

    movie_id,
    month AS invoice_date,
    location_id,
    studio,
    invoice_id,
    weekly_price

FROM {{ source('raw', 'invoices') }}