SELECT 
  COUNT(*) AS total_trips,
  usertype,
  gender,
  EXTRACT(YEAR FROM CURRENT_DATE()) - birth_year AS age,
  COUNT(*) OVER (PARTITION BY usertype) AS total_trips_by_usertype,
  COUNT(*) OVER (PARTITION BY gender) AS total_trips_by_gender,
  COUNT(*) OVER (PARTITION BY EXTRACT(YEAR FROM CURRENT_DATE()) - birth_year) AS total_trips_by_age,
  bikeid
FROM `citybikes-432718.citybikestrips.dataset_citibike`
GROUP BY 
  bikeid,
  usertype, 
  gender, 
  birth_year 
ORDER BY bikeid;

