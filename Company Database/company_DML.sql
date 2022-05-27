-- This file demonstrates the many possible things you can do with
-- DML commands like DELETE, SELECT, UPDATE, etc...

SET search_path TO company;

SELECT * FROM works_on;

-- Deleting table
DELETE FROM works_on WHERE pno = '30';
DELETE FROM project WHERE pnumber = '30';


-- Updating table
UPDATE employee
SET salary = '27000'
WHERE ssn = '999887777';

DELETE FROM works_on
WHERE essn = '999887777' AND Pno = '10';

-- Selecting fields from multiple tables at the same time
SELECT Pnumber, Dnum, Lname, address, bdate
FROM project, department, employee
WHERE dnum = dnumber AND mgr_ssn = ssn AND Plocation = 'Houston';

-- Selecting all supervisors (If the employees SSN corresponds to itself as also a supervisor)
SELECT E.fname, E.lname, S.fname, S.lname
FROM employee AS E, employee AS S
WHERE E.super_ssn = S.ssn;

-- DISTINCT
SELECT DISTINCT salary
FROM employee;

-- Demonstrating how cross products work
-- |employee| * |department|
SELECT ssn, dname
FROM employee, department;	-- This gets all combos of SSN's and department names

-- Finding out all details of all employees who work for administration department
SELECT *
FROM employee, department
WHERE dname = 'Administration' AND dno = 4;



-- Nested Queries: We want to make a list of all project numbers for projects who
-- involve an employee who's last name is 'Smith' (Whether worker or manager) of department
(SELECT DISTINCT Pnumber	-- THIS SET IS FOR MANAGERS with lname Smith
FROM project, department, employee
WHERE dnum = dnumber AND Mgr_ssn = ssn AND lname = 'Smith')
UNION
(SELECT DISTINCT Pnumber	-- THIS SET IS FOR EMPLOYEES with lname Smith
FROM project, works_on, employee
WHERE Pnumber = Pno AND Essn = ssn AND lname = 'Smith');


-- Name of employees who have no dependence
SELECT fname, lname
FROM employee
WHERE NOT Exists (SELECT * FROM dependent WHERE ssn = essn);

-- Name of managers who have at least 1 dependence
SELECT fname, lname
FROM employee
WHERE EXISTS (SELECT * FROM dependent WHERE ssn = essn) 
AND EXISTS (SELECT * FROM department WHERE mgr_ssn = ssn);



