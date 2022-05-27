-- Creating my tables
CREATE TABLE cd.members
(
	-- Entries of this table
   memid integer NOT NULL, 
   surname character varying(200) NOT NULL, 
   firstname character varying(200) NOT NULL, 
   address character varying(300) NOT NULL, 
   zipcode integer NOT NULL, 
   telephone character varying(20) NOT NULL, 
   recommendedby integer,
   joindate timestamp NOT NULL,
	
	-- Converting certain entries into constraints of this table
   CONSTRAINT members_pk PRIMARY KEY (memid),
   CONSTRAINT fk_members_recommendedby FOREIGN KEY (recommendedby)
		REFERENCES cd.members(memid) ON DELETE SET NULL
);

CREATE TABLE cd.facilities
(
   facid integer NOT NULL, 
   name character varying(100) NOT NULL, 
   membercost numeric NOT NULL, 
   guestcost numeric NOT NULL, 
   initialoutlay numeric NOT NULL, 
   monthlymaintenance numeric NOT NULL, 
   CONSTRAINT facilities_pk PRIMARY KEY (facid)
);

CREATE TABLE cd.bookings
(
   bookid integer NOT NULL, 
   facid integer NOT NULL, 
   memid integer NOT NULL, 
   starttime timestamp NOT NULL,
   slots integer NOT NULL,
   CONSTRAINT bookings_pk PRIMARY KEY (bookid),
   CONSTRAINT fk_bookings_facid FOREIGN KEY (facid) REFERENCES cd.facilities(facid),
   CONSTRAINT fk_bookings_memid FOREIGN KEY (memid) REFERENCES cd.members(memid)
);

-- VALUES (memid, surname, firstname, address, zipcode, telephone, recommendedby, joindate)
INSERT INTO cd.members VALUES (0, 'GUEST', 'GUEST', 'GUEST', '0', '(000)000-0000', NULL, '2012-01-01 00:00:00');
INSERT INTO cd.members VALUES (1, 'John', 'Jackson', '123 Fake Street, Santa Ana', '93826', '(123)123-1234', NULL, '2011-05-12 11:43:12');
INSERT INTO cd.members VALUES (2, 'Samantha', 'Hills', '930 Seventeenth Street, Los Angeles', '12345', '(111)222-3333', NULL, '2012-01-01 00:00:00');
INSERT INTO cd.members VALUES (3, 'GUEST', 'GUEST', 'GUEST', '0', '(000)000-0000', NULL, '2012-01-01 00:00:00');
INSERT INTO cd.members VALUES (4, 'GUEST', 'GUEST', 'GUEST', '0', '(000)000-0000', NULL, '2012-01-01 00:00:00');
INSERT INTO cd.members VALUES (5, 'GUEST', 'GUEST', 'GUEST', '0', '(000)000-0000', NULL, '2012-01-01 00:00:00');
INSERT INTO cd.members VALUES (6, 'GUEST', 'GUEST', 'GUEST', '0', '(000)000-0000', NULL, '2012-01-01 00:00:00');
INSERT INTO cd.members VALUES (7, 'GUEST', 'GUEST', 'GUEST', '0', '(000)000-0000', NULL, '2012-01-01 00:00:00');
INSERT INTO cd.members VALUES (8, 'GUEST', 'GUEST', 'GUEST', '0', '(000)000-0000', NULL, '2012-01-01 00:00:00');
INSERT INTO cd.members VALUES (9, 'GUEST', 'GUEST', 'GUEST', '0', '(000)000-0000', NULL, '2012-01-01 00:00:00');
INSERT INTO cd.members VALUES (10, 'GUEST', 'GUEST', 'GUEST', '0', '(000)000-0000', NULL, '2012-01-01 00:00:00');
INSERT INTO cd.members VALUES (11, 'GUEST', 'GUEST', 'GUEST', '0', '(000)000-0000', NULL, '2012-01-01 00:00:00');
INSERT INTO cd.members VALUES (12, 'GUEST', 'GUEST', 'GUEST', '0', '(000)000-0000', NULL, '2012-01-01 00:00:00');
INSERT INTO cd.members VALUES (13, 'GUEST', 'GUEST', 'GUEST', '0', '(000)000-0000', NULL, '2012-01-01 00:00:00');

