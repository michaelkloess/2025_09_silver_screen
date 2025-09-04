
SELECT 

    movie_id,
    COALESCE(movie_title, 'Unknown') AS movie_title,
    COALESCE(genre, 'Unknown') AS genre,
    COALESCE(studio, 'Unknown') AS studio,
    budget
    
FROM {{ source('raw', 'movie_catalogue') }}