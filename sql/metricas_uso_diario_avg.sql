SELECT 
  COUNT(*) / COUNT(DISTINCT trip_date) AS avg_daily_trips,
  AVG(tripduration_minutes) AS avg_trip_duration,
  MAX(tripduration_minutes) AS max_trip_duration,
  MIN(tripduration_minutes) AS min_trip_duration,
  STDDEV(tripduration_minutes) AS stddev_trip_duration
FROM (
  SELECT 
    DATE(starttime_calculated) AS trip_date,
    tripduration_minutes
  FROM `citybikes-432718.citybikestrips.dataset_citibikes`
)


