

-- Q1-------------------------------
SELECT *
FROM `drivers` 
WHERE first_name='parham'


-- Q2--------------------------------------------------------------
SELECT
    driver
FROM
    rides
GROUP BY
    driver
HAVING 
    COUNT(*) > 20
	
-- Q3--------------------------------
 SELECT *
  FROM drivers 
  WHERE (SELECT COUNT(*) 
       FROM rides
       WHERE (rides.passenger = 1) AND (rides.driver = drivers.id)) > 1
	
-- Q4--------------------------------
  SELECT *
  FROM passengers 
  WHERE (SELECT COUNT(*) 
       FROM rides
       WHERE (rides.driver = 1) AND (rides.passenger = passengers.id)) > 1
		
-- Q5--------------------------------
DELETE FROM discounts                      
  WHERE discounts.availables = 0

-- Q6--------------------------------
SELECT A.score
FROM (SELECT driver , AVG(score) as score
FROM rides
GROUP by driver) as A
WHERE A.driver = 1

-- Q7--------------------------------
SELECT A.driver
FROM (  SELECT driver , AVG(score) as score
        FROM rides
        GROUP by driver) as A
WHERE A.score >= ALL 
        (SELECT A.score
        FROM 
            (SELECT driver , AVG(score) as score
            FROM rides
            GROUP by driver) as A
        )

-- Q8--------------------------------
SELECT id 
FROM  rides 
WHERE discount = '12346'

-- Q9--------------------------------
SELECT id 
FROM  rides 
WHERE source_lat = 00.00 and source_lng = 00.00

-- Q10--------------------------------
SELECT id 
FROM  rides 
WHERE start_time =  '2018-10-10 00:00:00'

-- Q11--------------------------------
SELECT id 
FROM  rides 
WHERE finish_time =  '2018-10-10 00:00:00'

-- Q12--------------------------------
UPDATE discount 
SET available = (   SELECT available 
                    FROM discount 
                    WHERE discount.code = '123456' 
                    and discount.passenger=1) -1 
WHERE discount.code = '123456' and discount.passenger = 1
-- Q13--------------------------------
SELECT * 
FROM rides 
WHERE rides.start_time > '2018-10-21 00:00:00' and rides.finish_time < '2018-10-22 00:00:00' and rides.final_price > ALL (
    	
    SELECT AVG(A.final_price)
    FROM (SELECT final_price 
              FROM rides 
              WHERE rides.start_time > '2018-10-21 00:00:00' and rides.finish_time < '2018-10-22 00:00:00') as A
)
-- Q14--------------------------------
SELECT *
FROM drivers 
WHERE drivers.id in (
    SELECT A.driver 
    FROM (
        SELECT driver , AVG(score) as score
        FROM rides
        WHERE rides.start_time > '2018-10-21 00:00:00' and rides.finish_time < '2018-10-22 00:00:00'
        GROUP by driver
        HAVING score > 4
    ) as A
)


-- -------
-- Concession questions--------------------------------
-- -------

-- Q3--------------------------------
SELECT 
  DISTINCT(driver)
FROM 
  rides as A
WHERE driver in (SELECT driver
    From 
    rides as B
    WHERE
      A.driver = B.driver and A.passenger = B.passenger and A.id != B.id
)
  
-- Q4--------------------------------
SELECT 
  DISTINCT(passenger)
FROM 
  rides as A
WHERE passenger in (SELECT passenger
    From 
    rides as B
    WHERE
      A.driver = B.driver and A.passenger = B.passenger and A.id != B.id
)


