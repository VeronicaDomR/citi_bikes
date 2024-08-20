WITH AgeGroups AS (
  SELECT
    bikeid,
    usertype,
    gender,
    CASE
      WHEN EXTRACT(YEAR FROM CURRENT_DATE()) - birth_year BETWEEN 18 AND 24 THEN '18-24'
      WHEN EXTRACT(YEAR FROM CURRENT_DATE()) - birth_year BETWEEN 25 AND 34 THEN '25-34'
      WHEN EXTRACT(YEAR FROM CURRENT_DATE()) - birth_year BETWEEN 35 AND 44 THEN '35-44'
      WHEN EXTRACT(YEAR FROM CURRENT_DATE()) - birth_year BETWEEN 45 AND 54 THEN '45-54'
      WHEN EXTRACT(YEAR FROM CURRENT_DATE()) - birth_year BETWEEN 55 AND 64 THEN '55-64'
      WHEN EXTRACT(YEAR FROM CURRENT_DATE()) - birth_year >= 65 THEN '65+'
      ELSE 'Unknown'
    END AS age_group,
    tripduration_minutes,
    start_station_name,
    COUNT(*) OVER (PARTITION BY bikeid) AS total_trips_by_bike,
    COUNT(*) OVER (PARTITION BY gender) AS total_trips_by_gender,
    COUNT(*) OVER (PARTITION BY usertype) AS total_trips_by_usertype
  FROM
    `citybikes-432718.citybikestrips.dataset_citibike`
)
SELECT
  age_group,
  usertype,
  gender,
  total_trips_by_bike,
  total_trips_by_gender,
  total_trips_by_usertype,
  AVG(tripduration_minutes) AS avg_trip_duration,
  COUNT(DISTINCT start_station_name) AS distinct_start_stations,
  bikeid
FROM
  AgeGroups
WHERE
  age_group != 'Unknown'
GROUP BY
  bikeid,
  usertype,
  gender,
  age_group,
  total_trips_by_bike,
  total_trips_by_gender,
  total_trips_by_usertype
ORDER BY
  bikeid;
