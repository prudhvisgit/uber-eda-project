-- 1. Total number of requests

SELECT COUNT(*) AS total_requests FROM uber_data;

-- Output: 6745

-- 2. Number of requests from each pickup point

SELECT "Pickup point", COUNT(*) AS request_count
FROM uber_data
GROUP BY "Pickup point"
ORDER BY request_count DESC;

-- Output:
-- City     | 3504
-- Airport  | 3241

-- 3. Most cancelled hour

SELECT DATEPART(hour, "Request timestamp") AS hour, COUNT(*) AS cancelled_count
FROM uber_data
WHERE Status = 'Cancelled'
GROUP BY DATEPART(hour, "Request timestamp")
ORDER BY cancelled_count DESC;

-- Output (example):
-- Hour | Cancelled_Count
-- 5    | 180
-- 6    | 160
-- 7    | 145

-- 4. Most "No Cars Available" hour

SELECT DATEPART(hour, "Request timestamp") AS hour, COUNT(*) AS no_cars_count
FROM uber_data
WHERE Status = 'No Cars Available'
GROUP BY DATEPART(hour, "Request timestamp")
ORDER BY no_cars_count DESC;

-- Output (example):
-- Hour | No_Cars_Count
-- 18   | 220
-- 19   | 205

-- 5. Status count by pickup point

SELECT "Pickup point", Status, COUNT(*) AS status_count
FROM uber_data
GROUP BY "Pickup point", Status
ORDER BY "Pickup point", status_count DESC;

-- Output (example):
-- City     | Trip Completed      | 1600
-- City     | Cancelled           | 1200
-- City     | No Cars Available   | 704
-- Airport  | No Cars Available   | 1900
-- Airport  | Trip Completed      | 1241
-- Airport  | Cancelled           | 100

-- 6. Peak request hours overall

SELECT DATEPART(hour, "Request timestamp") AS hour, COUNT(*) AS total_requests
FROM uber_data
GROUP BY DATEPART(hour, "Request timestamp")
ORDER BY total_requests DESC;

-- Output: Shows hours like 5, 6, 18, 19 as top hours
