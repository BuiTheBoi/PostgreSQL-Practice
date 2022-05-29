SET search_path TO company;

-- SQL - Creating VIEWs

CREATE VIEW works_on1
AS SELECT fname, lname, pname
FROM employee, project, works_on
WHERE ssn = essn AND Pno = Pnumber;

SELECT * FROM works_on1;

DROP VIEW works_on1;