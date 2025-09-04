
-- Ensures at least some movies are profitable

SELECT 1

FROM {{ ref('mart_movie_performance') }}

HAVING COUNT(CASE WHEN performance_category IN ('Profitable', 'Rainmaker') THEN 1 END) = 0