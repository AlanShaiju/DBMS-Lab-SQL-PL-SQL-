set serveroutput on;
create or replace trigger train_trigger before insert on train for each row
declare
max_tno int;
begin
select nvl(max(tno),0)+1 into max_tno from train;
:new.tno:=max_tno;
end ;
/
insert into train(tname,tdate,destination,seats) values('Hello There','05-JUN-2017','africa',90);
insert into train(tname,tdate,destination,seats) values('Hello Way','05-JAN-2027','mars',900);
insert into train(tname,tdate,destination,seats) values('Hello Neigh','05-JUL-2407','jupiter',9080);
insert into train(tname,tdate,destination,seats) values('Hello Bye','05-NOV-2907','saturn',910);
create or replace procedure reservation(tid in number,pid in number) is
begin
insert into reservations values(tid,pid,'booked');
commit;
EXCEPTION
when others then 
rollback;
raise;
end reservation;
/
begin
reservation(tid=>2,pid=>534);
reservation(tid=>4,pid=>544);
reservation(tid=>6,pid=>524);
reservation(tid=>5,pid=>512);
end;
/
create or replace procedure cancel(pid in number) is
begin
update reservations set status='cancelled' where passengerid=pid;
commit;
EXCEPTION
when others then 
rollback;
raise;
end cancel;
/
begin
cancel(pid=>544);
cancel(pid=>514);
end;
/