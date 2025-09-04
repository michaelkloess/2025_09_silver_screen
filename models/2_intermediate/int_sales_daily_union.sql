
SELECT *
FROM {{ ref('int_nj_001_daily') }} 

UNION ALL

SELECT *
FROM {{ ref('int_nj_002_daily') }}

UNION ALL

SELECT *
FROM {{ ref('int_nj_003_daily') }}