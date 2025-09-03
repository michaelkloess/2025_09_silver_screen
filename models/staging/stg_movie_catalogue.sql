
SELECT 
    movie_id,
    COALESCE(movie_title, 'Unknown'),
    COALESCE(genre, 'Unknown'),
    COALESCE(studio, 'Unknown'),
    budget
FROM {{ source('raw_', 'object_name') }}