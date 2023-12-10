set serveroutput on;

CREATE OR REPLACE TRIGGER students_trigger
BEFORE INSERT OR UPDATE OR DELETE ON student
FOR EACH ROW
DECLARE
   operation_message VARCHAR2(100);
BEGIN
   IF INSERTING THEN
      operation_message := 'Inserting ' || :NEW.name;
   ELSIF UPDATING('name') THEN
      operation_message := 'Updated to ' || :NEW.name;
   ELSIF UPDATING('rollno') OR UPDATING('s1') OR UPDATING('s2') THEN
     operation_message := 'Roll, grd_s1, or grd_s2 is updated';
   ELSIF DELETING THEN
      operation_message := 'Deleting ' || :OLD.name;
   END IF;

   DBMS_OUTPUT.PUT_LINE(operation_message);
END students_trigger;
/
