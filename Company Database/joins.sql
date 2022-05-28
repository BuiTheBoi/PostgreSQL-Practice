-- SQL Joins

SET search_path TO company;

-- You can change the left and right joins to see the difference
SELECT ssn, fname, dependent.dependent_name, dependent.relationship
FROM employee
RIGHT JOIN dependent 
ON employee.ssn = dependent.essn;

-- Full joins
SELECT employee.ssn, employee.fname
FROM employee
FULL JOIN dependent 
ON employee.ssn = dependent.essn;