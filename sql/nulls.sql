SELECT
  COUNTIF(tripduration IS NULL) AS null_tripduration,
  COUNTIF(stoptime IS NULL) AS null_stoptime,
  COUNTIF(start_station_id IS NULL) AS null_start_station_id,
  COUNTIF(start_station_name IS NULL) AS null_start_station_name,
  COUNTIF(start_station_latitude IS NULL) AS null_start_station_latitude,
  COUNTIF(start_station_longitude IS NULL) AS null_start_station_longitude,
  COUNTIF(end_station_id IS NULL) AS null_end_station_id,
  COUNTIF(end_station_name IS NULL) AS null_end_station_name,
  COUNTIF(end_station_latitude IS NULL) AS null_end_station_latitude,
  COUNTIF(end_station_longitude IS NULL) AS null_end_station_longitude,
  COUNTIF(bikeid IS NULL) AS null_bikeid,
  COUNTIF(usertype IS NULL) AS null_usertype,
  COUNTIF(birth_year IS NULL) AS null_birth_year,
  COUNTIF(gender IS NULL) AS null_gender,
  COUNTIF(customer_plan IS NULL) AS null_customer_plan
FROM
  `citi_bike_trips`;
