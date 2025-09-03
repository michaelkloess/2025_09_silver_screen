
SELECT
    movie_id,
    MONTH AS invoice_date,
    location_id,
    studio,
    invoice_id,
    weekly_price
FROM {{ source('source_name', 'object_name') }}