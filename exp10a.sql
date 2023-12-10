SET SERVEROUTPUT ON;
DECLARE
v_consumer_number float;
v_present_reading float;
v_past_reading float;
v_units_consumed float;
v_unit_charge float;
v_total_bill float;
CURSOR consumer IS
SELECT cno, present, past
FROM electricity;
BEGIN
v_consumer_number := &v_consumer_number;
FOR rec IN consumer
LOOP
if v_consumer_number=rec.cno then
v_present_reading := rec.present;
v_past_reading := rec.past;
end if;
END LOOP;
v_units_consumed := v_present_reading - v_past_reading;
IF v_units_consumed > 500 THEN
v_total_bill := (100*5)+(200*7.5)+(200*15)+(v_units_consumed-500)*22.5;
ELSIF 300< v_units_consumed and v_units_consumed<501 THEN
v_total_bill := (100*5)+(200*7.5)++(v_units_consumed-300)*15;
ELSIF 100< v_units_consumed and v_units_consumed<301 THEN
v_total_bill := (100*5)+(v_units_consumed-100)*7.5;
ELSE
v_total_bill := (v_units_consumed)*5;
END IF;
DBMS_OUTPUT.PUT_LINE('Consumer Number: ' || v_consumer_number);
DBMS_OUTPUT.PUT_LINE('Units Consumed: ' || v_units_consumed);
DBMS_OUTPUT.PUT_LINE('Total Bill: $' || v_total_bill);
END;
/