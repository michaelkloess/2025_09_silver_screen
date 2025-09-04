
-- Validates no transactions in the future

SELECT *

FROM {{ ref('int_sales_daily_union') }}

WHERE transaction_date > CURRENT_DATE