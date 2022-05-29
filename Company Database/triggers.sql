SET search_path TO company;

CREATE TABLE Audit(EMPID CHAR(9) NOT NULL, ENTRYDATE TEXT NOT NULL);

-- Function I created, which returns a trigger as example_table whenever something
-- is inserted into the audit table
CREATE OR REPLACE FUNCTION auditlogfunc() RETURNS TRIGGER AS $example_table$
BEGIN 
INSERT INTO audit (EMPID, ENTRYDATE) VALUES (new.ssn, current_timestamp);
RETURN NEW;
END;

$example_table$ LANGUAGE plpgsql;	-- Specifying that it is in SQL language
CREATE TRIGGER example_trigger AFTER INSERT ON employee FOR EACH ROW EXECUTE PROCEDURE auditlogfunc();

INSERT INTO employee VALUES ('Kevin', 'T', 'Nguyen', '111225555', '1937-11-10', '330 Rocker, Los Angeles, CA', 'M', '64000', NULL, '1');

SELECT * FROM audit;