-- PRACTICE PROBLEMS: https://pgexercises.com/questions/joins/
-----------------------------------------------------------------
SET search_path TO cd;

SELECT * FROM members;
SElECT * FROM bookings;
SELECT * FROM facilities;

-- JOINS PROBLEM 1: Retrieve the start times of members' bookings
SELECT starttime
FROM cd.bookings AS b
INNER JOIN cd.members AS m
	ON b.memid = m.memid
WHERE firstname = 'David' AND surname = 'Farrell';

-- JOINS PROBLEM 2: Work out the start times of bookings for tennis courts
SELECT starttime AS start, name
FROM cd.bookings AS b
INNER JOIN cd.facilities AS f
	ON b.facid = f.facid
WHERE name LIKE 'Tennis Court _'
	AND starttime >= '2012-09-21' AND starttime < '2012-09-22'
ORDER BY starttime;

-- JOINS PROBLEM 3: Produce a list of all members who have recommended another member
SELECT DISTINCT m2.firstname, m2.surname
FROM cd.members AS m1
INNER JOIN cd.members AS m2
	ON m1.recommendedby = m2.memid
ORDER BY surname, firstname;

-- JOINS PROBLEM 4: Produce a list of all members, along with their recommender
SELECT m1.firstname AS memfname, m1.surname AS memsname,
	m2.firstname AS recfname, m2.surname AS recsname
FROM cd.members AS m1
LEFT OUTER JOIN cd.members AS m2
ON m1.recommendedby = m2.memid
ORDER BY m1.surname, m1.firstname;


-- JOINS PROBLEM 5: Produce a list of all members who have used a tennis court
SELECT DISTINCT firstname || ' ' || surname AS member, f.name AS facility
FROM cd.members AS m
  INNER JOIN cd.bookings AS b
	  ON m.memid = b.memid
  INNER JOIN cd.facilities AS f
	  ON b.facid = f.facid
WHERE f.name LIKE 'Tennis Court _'
ORDER BY member, facility;


-- JOINS PROBLEM 6: Produce a list of costly bookings
SELECT firstname || ' ' || surname AS member, f.name AS facility,
	CASE WHEN m.memid = 0 THEN guestcost * slots
	ELSE membercost * slots
	END AS cost
FROM cd.members AS m
  INNER JOIN cd.bookings AS b
  	ON m.memid = b.memid
  INNER JOIN cd.facilities AS f
  	ON b.facid = f.facid
WHERE (starttime >= '2012-09-14' AND starttime < '2012-09-15') AND -- Start time needs to be on 2012-09-14
	((m.memid = 0 AND guestcost * slots > 30) -- If memid = 0, then do guest cost
	OR (m.memid <> 0 AND membercost * slots > 30))	-- OR if memid is anything else, we know its a membercost so we calculate at that price
ORDER BY cost DESC;



