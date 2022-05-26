CREATE SCHEMA company;

SET search_path TO company;


-- Creating my tables

CREATE TABLE employee (
	fname TEXT NOT NULL,
	mname CHAR NULL,
	lname TEXT NOT NULL,
	ssn CHAR(9) NOT NULL PRIMARY KEY,
	Bdate DATE,
	Address TEXT NOT NULL,
	Sex CHAR NULL,
	Salary DECIMAL (10, 2) NULL,
	super_ssn CHAR(9) NULL,
	Dno INT NOT NULL 
);

CREATE TABLE department (
	Dname TEXT NOT NULL,
	Dnumber INT NOT NULL PRIMARY KEY,
	Mgr_ssn CHAR(9) NOT NULL,
	Mgr_start_date DATE NULL
);

CREATE TABLE dept_locations (
	Dnumber INT NOT NULL,
	Dlocation TEXT NOT NULL,
	PRIMARY KEY(Dnumber, Dlocation)
);

CREATE TABLE project(
	Pname TEXT NOT NULL,
	Pnumber INT NOT NULL,
	Plocation TEXT,
	Dnum INT NOT NULL,
	PRIMARY KEY(Pnumber),
	UNIQUE(Pname)
);

CREATE TABLE works_on(
	Essn CHAR(9) NOT NULL,
	Pno INT NOT NULL,
	Hours DECIMAL(3,1) NOT NULL,
	PRIMARY KEY (Essn, Pno)
);

CREATE TABLE dependent(
	Essn CHAR(9) NOT NULL,
	Dependent_name TEXT NOT NULL,
	Sex CHAR,
	Bdate DATE,
	Relationship TEXT,
	PRIMARY KEY (Essn, Dependent_name)
);

-- Insert into table

INSERT INTO employee VALUES ('John', 'B', 'Smith', '123123123', '1965-01-09', '731 Fondren, Houston, TX', 'M', '300000', '333445555', '5');
INSERT INTO department VALUES ('Research', '5', '333445555', '1988-05-22');
INSERT INTO dependent VALUES ('333445555', 'Theodore', 'M', '1983-10-25', 'Son');
INSERT INTO dept_locations VALUES ('1', 'Houston');
INSERT INTO project VALUES ('ProductX', '1', 'Bellaire', '5');
INSERT INTO works_on VALUES('123456789', '1', '32.5');

INSERT INTO employee VALUES ('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', '40000', '88665555', '5');
INSERT INTO department VALUES ('Administration', '4', '987654321', '1995-01-01');
INSERT INTO dependent VALUES ('333445555', 'Alice', 'F', '1986-04-05', 'Daughter');
INSERT INTO dept_locations VALUES ('4', 'Stafford');
INSERT INTO project VALUES ('ProductY', '2', 'Sugarland', '5');
INSERT INTO works_on VALUES ('123456789', '2', '7.5');

INSERT INTO works_on (Essn, Pno, Hours) VALUES ('453453453', '2', '25');

INSERT INTO employee VALUES ('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 Castle, Spring, TX', 'F', '25000', '987654321', '4');
INSERT INTO employee VALUES ('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F', '43000', '888665555', '4');
INSERT INTO employee VALUES ('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', '38000', '333445555', '5');
INSERT INTO employee VALUES ('Joyce', 'A', 'English', '45353453', '1972-07-31', '5631 Rice, Houston, TX', 'F', '25000', '333445555', '5');
INSERT INTO employee VALUES ('Ahmad', 'V', 'Jabbar', '987987987', '1969-07-31', '980 Dallas, Houston, TX', 'F', '25000', '987654321', '4');
INSERT INTO employee VALUES ('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', '55000', NULL, '1');

INSERT INTO department VALUES ('Headquarters', '1', '888665555', '1981-06-19');

INSERT INTO dependent VALUES ('333445555', 'Joy', 'F', '1958-05-03', 'Spouse');
INSERT INTO dependent VALUES ('987654321', 'Abner', 'M', '1942-05-03', 'Spouse');
INSERT INTO dependent VALUES ('123456789', 'Michael', 'M', '1988-05-03', 'Son');
INSERT INTO dependent VALUES ('123456789', 'Alice', 'F', '1988-12-30', 'Daughter');
INSERT INTO dependent VALUES ('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse');

INSERT INTO dept_locations VALUES ('5', 'Bellaire');
INSERT INTO dept_locations VALUES ('5', 'Sugarland');
INSERT INTO dept_locations VALUES ('5', 'Houston');

INSERT INTO project VALUES ('ProductZ', '3', 'Houston', '5');
INSERT INTO project VALUES ('Computerization', '10', 'Stafford', '4');
INSERT INTO project VALUES ('Reorganization', '20', 'Houston', '1');
INSERT INTO project VALUES ('Newbenefits', '30', 'Stafford', '4');

INSERT INTO works_on VALUES ('666884444', '3', '40.0');
INSERT INTO works_on VALUES ('453453453', '1', '20.0');
INSERT INTO works_on VALUES ('333445555', '2', '10.0');
INSERT INTO works_on VALUES ('333445555', '3', '10.0');
INSERT INTO works_on VALUES ('333445555', '10', '10.0');
INSERT INTO works_on VALUES ('333445555', '20', '10.0');
INSERT INTO works_on VALUES ('333445555', '30', '30.0');
INSERT INTO works_on VALUES ('999887777', '10', '10.0');
INSERT INTO works_on VALUES ('987987987', '30', '5.0');
INSERT INTO works_on VALUES ('987654321', '30', '20.0');
INSERT INTO works_on VALUES ('987654321', '20', '15.0');
INSERT INTO works_on VALUES ('888665555', '20', '10.0');

-- To view all the tables
SELECT * FROM department;
SELECT * FROM dependent;
SELECT * FROM dept_locations;
SELECT * FROM employee;
SELECT * FROM project;
SELECT * FROM works_on;

ALTER TABLE department ADD FOREIGN KEY (mgr_ssn) REFERENCES employee(ssn)




