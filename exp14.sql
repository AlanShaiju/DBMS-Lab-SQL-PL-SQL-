create or replace package ep AS
procedure ae(pid in int, pname in varchar2,paddress in varchar2,psalary in number);
procedure de(pid in int);
procedure lae;
-- function getsalary(pid in int) return number;
end ep;
/


set serveroutput on;
create or replace package body ep as
procedure ae(pid in int,pname in varchar2,paddress in varchar2,psalary in number) as
begin 
insert into employee(eid, ename, eaddress, esalary) values(pid,pname,paddress,psalary);
end;
procedure de(pid in int) as
begin
delete from employee where eid=pid;
end;
procedure lae as
begin 
for emp in (select * from employee)
LOOP
dbms_output.put_line('Employee Id:'||emp.eid||'Name:'||emp.ename||'Address:'||emp.eaddress||'Salary:'||emp.esalary);
end loop;
end;

function getsalary(pid in int) return number as v_salary number;
begin 
select esalary into v_salary from employee where eid=pid;
return v_salary;
EXCEPTION
when no_data_found then return null;
end;


end ep;
/




