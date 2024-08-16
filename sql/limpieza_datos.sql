SELECT 
    stoptime - INTERVAL CAST(tripduration / 60.0 AS INT64) MINUTE AS starttime_calculated,
    stoptime, 
    ROUND(tripduration / 60.0) AS tripduration_minutes,
    start_station_id, start_station_name, 
    start_station_latitude, start_station_longitude, end_station_id, 
    end_station_name, end_station_latitude, end_station_longitude, bikeid, 
    usertype, birth_year, gender
FROM 
    `citybikes-432718.citybikestrips.city_bike_trips`
WHERE 
    birth_year IS NOT NULL
    AND gender != 'unknown';