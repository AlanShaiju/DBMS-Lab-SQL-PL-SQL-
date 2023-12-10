set serveroutput on;
create or replace trigger student_trigger before insert or update or delete on student for each row
declare
message varchar(100);
begin
if inserting then
message:='Inserting '|| :new.name;
elsif deleting then
message:='Deleting:'|| :old.name;
elsif updating ('name') then
-- message:='Updating to new name from: '||old.name||' to :'||new.name;
message:='Updating to new name from: '||:new.name;
elsif updating('rollno') or updating('s1') or updating('s2') then
message:='Details Updated For:'||:new.name;
end if;
dbms_output.put_line(message);
end student_trigger;
/
