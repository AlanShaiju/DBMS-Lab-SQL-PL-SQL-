set serveroutput on;
create or replace trigger ta_trigger before insert on students for each row--trigger for total and average
begin
:new.total:= :new.mark1+:new.mark2+:new.mark3;
:new.average := (:new.total)/3;

end ta_trigger;
/

