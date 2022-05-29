-- Modifying Data Practice Problems: https://pgexercises.com/questions/updates/


-- PRACTICE PROBLEM 1: Insert some data into a table
INSERT INTO cd.facilities VALUES(9, 'Spa', 20, 30, 100000, 800);


-- PRACTICE PROBLEM 2: Insert multiple rows of data into a table
INSERT INTO cd.facilities
	(facid, name, membercost, guestcost, initialoutlay, monthlymaintenance)
		VALUES (9, 'Spa', 20, 30, 100000, 800), (10, 'Squash Court 2', 3.5, 17.5, 5000, 80);


-- PRACTICE PROBLEM 3: Insert calculated data into a table
INSERT INTO cd.facilities
	(facid, name, membercost, guestcost, initialoutlay, monthlymaintenance)
	VALUES ((SELECT MAX(facid) FROM cd.facilities)+1, 'Spa', 20, 30, 100000, 800);
	

-- PRACTICE PROBLEM 4: Update some existing data
UPDATE cd.facilities
SET initialoutlay = 10000
WHERE name = 'Tennis Court 2';


-- PRACTICE PROBLEM 5: Update multiple rows and columns at the same time
UPDATE cd.facilities
SET membercost = 6, guestcost = 30
WHERE name LIKE 'Tennis Court _';


-- PRACTICE PROBLEM 6: Update a row based on the contents of another row
UPDATE cd.facilities
SET 
	membercost = membercost + (membercost * 0.1),
	guestcost = guestcost + (guestcost * 0.1)
WHERE name = 'Tennis Court 2';


-- PRACTICE PROBLEM 7: Delete all bookings
TRUNCATE TABLE cd.bookings;


-- PRACTICE PROBLEM 8: Delete a member from the cd.members table
DELETE
FROM cd.members
WHERE memid = 37;


-- PRACTICE PROBLEM 9: Delete based on a subquery
DELETE FROM cd.members
WHERE memid NOT IN
(
  SELECT memid FROM cd.bookings
);