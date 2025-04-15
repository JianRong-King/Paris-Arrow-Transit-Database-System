--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T5-pat-plsql.sql

--Student ID: 34693807
--Student Name: King Jian Rong

/* Comments for your marker:


*/

SET SERVEROUTPUT ON
SET ECHO ON

--(a)
-- Write your trigger statement,
-- finish it with a slash(/) followed by a blank line

alter table DRIVER
drop column driver_dermit_point;

alter table Driver
add  driver_dermit_point number(2) default 0 not null;

Comment on column Driver.DRIVER_DERMIT_POINT is 'Total demerit points accumulated by the driver';

DESC Driver;


CREATE OR REPLACE TRIGGER complain_update_cascade
AFTER UPDATE ON COMPLAINT
FOR EACH ROW
DECLARE
    v_total_demerit_points NUMBER(2);
BEGIN

    IF :NEW.validated_flag = 'Y' THEN

        UPDATE DRIVER 
        SET driver_dermit_point = driver_dermit_point + (
            SELECT category_demerit_pt
            FROM CATEGORY 
            WHERE category_id = :NEW.category_id
        )
        WHERE driver_id = (
            SELECT driver_id
            FROM TRIP 
            WHERE trip_id = :NEW.trip_id
        );

        dbms_output.put_line('Driver demerit points updated');


        SELECT driver_dermit_point
        INTO v_total_demerit_points
        FROM DRIVER
        WHERE driver_id = (
            SELECT driver_id
            FROM TRIP 
            WHERE trip_id = :NEW.trip_id
        );


        IF v_total_demerit_points >= 4 THEN

            UPDATE DRIVER
            SET DRIVER_SUSPENDED = 'Y'
            WHERE driver_id = (
                SELECT driver_id
                FROM TRIP 
                WHERE trip_id = :NEW.trip_id
            );


            dbms_output.put_line('Driver suspended');


        END IF;
    END IF;
END;
/


-- Write Test Harness for (a)


-- driver for testing
INSERT INTO driver (
    driver_id,
    driver_given,
    driver_family,
    driver_licence,
    driver_dob,
    driver_clearance,
    driver_suspended
) VALUES (
    4000,
    'JJ',
    'MAMA',
    '34082CCCCC12',
    TO_DATE('26-AUG-1996', 'DD-MON-YYYY'),
    'R',
    'N'
);


-- driver for testing
INSERT INTO driver (
    driver_id,
    driver_given,
    driver_family,
    driver_licence,
    driver_dob,
    driver_clearance,
    driver_suspended
) VALUES (
    9996,
    'Aba',
    'Aba',
    '1EEE2CCCCC12',
    TO_DATE('26-AUG-1996', 'DD-MON-YYYY'),
    'R',
    'N'
);

-- driver for testing
INSERT INTO driver (
    driver_id,
    driver_given,
    driver_family,
    driver_licence,
    driver_dob,
    driver_clearance,
    driver_suspended
) VALUES (
    9991,
    'JR',
    'YOO',
    '1EEE2CCZZZ12',
    TO_DATE('26-AUG-1996', 'DD-MON-YYYY'),
    'R',
    'N'
);



----------------------------------------------------------------------------------------------------------------------------
-- test if the driver's demerit points are updated, and if demerit point are less than 4, the driver is not suspended
-- before
SELECT * from DRIVER
WHERE DRIVER_ID = 9996;

BEGIN 
    INSERT INTO Trip (
        trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
    ) VALUES (
        5437, 4, To_date('01-JAN-2020 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('01-JAN-2020 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('01-JAN-2020 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('01-JAN-2020 12:25', 'DD-Mon-YYYY HH24:MI'), '1C4SDHCT9FC614231', 9996, 101, 111, 'en', 2134);


    -- Now insert into COMPLAINT
    INSERT INTO COMPLAINT (
        trip_id, off_id, complaint_date, category_id, detailed_comment, validated_flag
    ) VALUES (5437, 2134, to_date('01-JAN-2021 10:00','DD-Mon-YYYY HH24:MI'), 2, 'rude', 'N');

    update COMPLAINT
    set validated_flag = 'Y'
    where TRIP_ID = 5437 and COMPLAINT_DATE = to_date('01-JAN-2021 10:00','DD-Mon-YYYY HH24:MI');

    INSERT INTO COMPLAINT (
        trip_id, off_id, complaint_date, category_id, detailed_comment, validated_flag
    ) VALUES (5437, 2134, to_date('01-JAN-2021 11:00','DD-Mon-YYYY HH24:MI'), 2, 'rude', 'N');

    -- second complain is not valid 

END;
/

-- after 
SELECT * from DRIVER
WHERE DRIVER_ID = 9996;
-- demerit points should be 2 and driver is not suspected
----------------------------------------------------------------------------------------------------------------------------





----------------------------------------------------------------------------------------------------------------------------
-- test if the driver is successfully updated with demerit points to suspected when demerit points are more than 4
-- before 
select * from driver
where DRIVER_ID = 4000;


-- test trigger on update
BEGIN 
    INSERT INTO Trip (
        trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
    ) VALUES (
        5119, 4, To_date('01-JAN-2020 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('01-JAN-2020 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('01-JAN-2020 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('01-JAN-2020 12:25', 'DD-Mon-YYYY HH24:MI'), '1C4SDHCT9FC614231', 4000, 101, 111, 'en', 2134);


    -- Now insert into COMPLAINT
    INSERT INTO COMPLAINT (
        trip_id, off_id, complaint_date, category_id, detailed_comment, validated_flag
    ) VALUES (5119, 2134, to_date('01-JAN-2021 10:00','DD-Mon-YYYY HH24:MI'), 2, 'rude', 'N');

    update COMPLAINT
    set validated_flag = 'Y'
    where TRIP_ID = 5119 and COMPLAINT_DATE = to_date('01-JAN-2021 10:00','DD-Mon-YYYY HH24:MI');

    INSERT INTO COMPLAINT (
        trip_id, off_id, complaint_date, category_id, detailed_comment, validated_flag
    ) VALUES (5119, 2134, to_date('01-JAN-2021 11:00','DD-Mon-YYYY HH24:MI'), 2, 'rude', 'N');

    update COMPLAINT
    set validated_flag = 'Y'
    where TRIP_ID = 5119 and COMPLAINT_DATE = to_date('01-JAN-2021 11:00','DD-Mon-YYYY HH24:MI');
END;
/

-- after 
SELECT * from DRIVER
WHERE DRIVER_ID = 4000;

-- demerit point reached 4 so driver is suspended
----------------------------------------------------------------------------------------------------------------------------






----------------------------------------------------------------------------------------------------------------------------
-- test if the driver is suspected if demerit point reach till 6
-- before 
select * from driver
where DRIVER_ID = 9991;


-- test trigger on update
BEGIN 
    INSERT INTO Trip (
        trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
    ) VALUES (
        3456, 4, To_date('05-JAN-2020 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('05-JAN-2020 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('05-JAN-2020 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('05-JAN-2020 12:25', 'DD-Mon-YYYY HH24:MI'), '1C4SDHCT9FC614231', 9991, 101, 111, 'en', 2134);


    -- Now insert into COMPLAINT
    INSERT INTO COMPLAINT (
        trip_id, off_id, complaint_date, category_id, detailed_comment, validated_flag
    ) VALUES (3456, 2134, to_date('05-JAN-2021 12:00','DD-Mon-YYYY HH24:MI'), 2, 'rude', 'N');

    update COMPLAINT
    set validated_flag = 'Y'
    where TRIP_ID = 3456 and COMPLAINT_DATE = to_date('05-JAN-2021 12:00','DD-Mon-YYYY HH24:MI');

    INSERT INTO COMPLAINT (
        trip_id, off_id, complaint_date, category_id, detailed_comment, validated_flag
    ) VALUES (3456, 2134, to_date('05-JAN-2021 13:00','DD-Mon-YYYY HH24:MI'), 2, 'rude', 'N');

    update COMPLAINT
    set validated_flag = 'Y'
    where TRIP_ID = 3456 and COMPLAINT_DATE = to_date('05-JAN-2021 13:00','DD-Mon-YYYY HH24:MI');


    INSERT INTO COMPLAINT (
        trip_id, off_id, complaint_date, category_id, detailed_comment, validated_flag
    ) VALUES (3456, 2134, to_date('05-JAN-2021 22:00','DD-Mon-YYYY HH24:MI'), 2, 'rude', 'N');

    update COMPLAINT
    set validated_flag = 'Y'
    where TRIP_ID = 3456 and COMPLAINT_DATE = to_date('05-JAN-2021 22:00','DD-Mon-YYYY HH24:MI');

END;
/

-- after 
SELECT * from DRIVER
WHERE DRIVER_ID = 9991;
----------------------------------------------------------------------------------------------------------------------------

-- close transaction
ROLLBACK;


















--(b)
-- Complete the procedure below
-- finish it with a slash(/) followed by a blank line
CREATE OR REPLACE PROCEDURE prc_insert_trip (
    p_off_id            IN NUMBER,
    p_nopassengers      IN NUMBER,
    p_int_pickupdt      IN DATE,
    p_int_dropoffdt     IN DATE,
    p_pickup_locn_name  IN VARCHAR2,
    p_dropoff_locn_name IN VARCHAR2,
    p_lang_name         IN VARCHAR2,
    p_veh_vin           IN CHAR,
    p_driver_id         IN NUMBER,
    p_output            OUT VARCHAR2
) IS
    var_pickup_locn_id NUMBER;
    var_dropoff_locn_id NUMBER;
    var_lang_iso_code CHAR(2);
    var_count NUMBER; 
BEGIN

    SELECT LOCN_ID INTO var_pickup_locn_id
    FROM LOCATION
    WHERE upper(LOCN_NAME) = upper(p_pickup_locn_name);
    
    SELECT LOCN_ID INTO var_dropoff_locn_id
    FROM LOCATION
    WHERE upper(LOCN_NAME) = upper(p_dropoff_locn_name);


    SELECT lang_iso_code INTO var_lang_iso_code
    FROM LANGUAGE
    WHERE upper(lang_name) = upper(p_lang_name);


    IF p_int_pickupdt >= p_int_dropoffdt THEN
        p_output := 'Error: Pick-up date must be before drop-off date.';
    

    SELECT veh_nopassenngers INTO var_count FROM VEHICLE WHERE veh_vin = p_veh_vin;
    ELSIF var_count < p_nopassengers THEN
        p_output := 'Error: Vehicle cannot accommodate the requested number of passengers.';
    

    ELSE
        SELECT COUNT(*) INTO var_count
        FROM TRIP
        WHERE veh_vin = p_veh_vin
          AND (p_int_pickupdt BETWEEN trip_int_pickupdt AND trip_int_dropoffdt
               OR p_int_dropoffdt BETWEEN trip_int_pickupdt AND trip_int_dropoffdt);

        IF var_count > 0 THEN
            p_output := 'Error: Vehicle is not available for the specified time.';
        

        ELSE
            SELECT COUNT(*) INTO var_count
            FROM TRIP
            WHERE driver_id = p_driver_id
              AND (p_int_pickupdt BETWEEN trip_int_pickupdt AND trip_int_dropoffdt
                   OR p_int_dropoffdt BETWEEN trip_int_pickupdt AND trip_int_dropoffdt);

            IF var_count > 0 THEN
                p_output := 'Error: Driver is not available for the specified time.';
            ELSE
  
                INSERT INTO TRIP (
                    trip_id, trip_nopassengers, trip_int_pickupdt, trip_int_dropoffdt,
                    veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
                ) VALUES (
                    trip_seq.NEXTVAL, p_nopassengers, p_int_pickupdt, p_int_dropoffdt,
                    p_veh_vin, p_driver_id, var_pickup_locn_id, var_dropoff_locn_id, var_lang_iso_code, p_off_id
                );
                p_output := 'Trip inserted successfully.';
            END IF;
        END IF;
    END IF;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_output := 'Error: Invalid location or language name provided.';
    WHEN OTHERS THEN
        p_output := sqlerrm;
END;
/













-- Write Test Harness for (b)  

-- testing vehicle 
Insert INTO vehicle (
    veh_vin, veh_rego, veh_year, veh_curr_odo, veh_nopassenngers, vm_model_id
) VALUES ('SucowkrtyuoyaBBBB', 'AA146PP', To_date('2019', 'YYYY'), 10099, 6, 4);

-- testing official 
Insert INTO OFFICIAL (
    off_id, off_given, off_family, cr_ioc_code, off_cdm
) 
VALUES (5222, 'Don', 'Toliver', 'USA', NULL);


----------------------------------------------------------------------------------------------------------------------------
-- test if all inputs are valid
Declare 
    v_output VARCHAR2(100);
BEGIN
    -- Invalid pick and drop location error message
    prc_insert_trip(2134, 4, To_date('25-DEC-2020 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('25-DEC-2020 12:00', 'DD-Mon-YYYY HH24:MI'), 'La Beaujoire Stadium', 'North Paris Arena', 'English', '1C4SDHCT9FC614231', 2001, v_output);
    dbms_output.put_line(v_output);
END;
/

-- should give success messge: Trip inserted successfully
----------------------------------------------------------------------------------------------------------------------------




----------------------------------------------------------------------------------------------------------------------------
-- test if pick up and drop off location is invalid
Declare 
    v_output VARCHAR2(100);
BEGIN
    -- Invalid pick and drop location error message
    prc_insert_trip(2134, 4, To_date('01-DEC-2020 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('01-DEC-2020 12:00', 'DD-Mon-YYYY HH24:MI'), 'ABC', 'YYY', 'English', '1C4SDHCT9FC614231', 2001, v_output);
    dbms_output.put_line(v_output);
END;
/


-- should give Error: Invalid location or language name provided.
----------------------------------------------------------------------------------------------------------------------------





----------------------------------------------------------------------------------------------------------------------------
-- Test for invalid pick and drop time
Declare 
    v_output VARCHAR2(100);
BEGIN
    -- Invalid pick and drop time error message
    prc_insert_trip(2134, 4, To_date('01-DEC-2020 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('01-JAN-2020 12:00', 'DD-Mon-YYYY HH24:MI'), 'La Beaujoire Stadium', 'North Paris Arena', 'English', '1C4SDHCT9FC614231', 2001, v_output);
    dbms_output.put_line(v_output);
END;
/


-- should give Error: Pick-up date must be before drop-off date.
----------------------------------------------------------------------------------------------------------------------------





----------------------------------------------------------------------------------------------------------------------------
-- test error message for Invalid language name
Declare 
    v_output VARCHAR2(100);
BEGIN
    prc_insert_trip(2134, 4, To_date('01-DEC-2020 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('01-DEC-2020 12:00', 'DD-Mon-YYYY HH24:MI'), 'La Beaujoire Stadium', 'North Paris Arena', 'HUHU', '1C4SDHCT9FC614231', 2001, v_output);
    dbms_output.put_line(v_output);
END;
/


-- should give Error: Invalid location or language name provided.
----------------------------------------------------------------------------------------------------------------------------





----------------------------------------------------------------------------------------------------------------------------
-- test if vehicle not available in that time, used bf pick up time
INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    6000, 4, To_date('02-DEC-2020 09:00', 'DD-Mon-YYYY HH24:MI'), To_date('02-DEC-2020 09:00', 'DD-Mon-YYYY HH24:MI'), To_date('02-DEC-2020 11:00', 'DD-Mon-YYYY HH24:MI'), To_date('02-DEC-2020 11:00', 'DD-Mon-YYYY HH24:MI'), 'SucowkrtyuoyaBBBB',2012 , 121, 104, 'en', 5222);


Declare 
    v_output VARCHAR2(100);
BEGIN
    prc_insert_trip(5222, 4, To_date('02-DEC-2020 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('02-DEC-2020 12:00', 'DD-Mon-YYYY HH24:MI'), 'La Beaujoire Stadium', 'North Paris Arena', 'English', 'SucowkrtyuoyaBBBB', 2001, v_output);
    dbms_output.put_line(v_output);
END;
/


-- should give Error: Vehicle is not available for the specified time.
----------------------------------------------------------------------------------------------------------------------------





----------------------------------------------------------------------------------------------------------------------------
-- test when driver occupied before pick up time
INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    7000, 4, To_date('03-DEC-2020 09:00', 'DD-Mon-YYYY HH24:MI'), NULL, To_date('03-DEC-2020 11:00', 'DD-Mon-YYYY HH24:MI'), NULL, 'SucowkrtyuoyaBBBB',2012 , 121, 104, 'en', 5222);


Declare 
    v_output VARCHAR2(100);
BEGIN
    ---
    prc_insert_trip(5222, 4, To_date('03-DEC-2020 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('03-DEC-2020 12:00', 'DD-Mon-YYYY HH24:MI'), 'La Beaujoire Stadium', 'North Paris Arena', 'English', '1C4SDHCT9FC614231', 2012, v_output);
    dbms_output.put_line(v_output);
END;
/



-- should give Error: Driver is not available for the specified time.
----------------------------------------------------------------------------------------------------------------------------





----------------------------------------------------------------------------------------------------------------------------
-- test when driver occupied during the intended pick and drop time
INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    7001, 4, To_date('04-DEC-2020 09:00', 'DD-Mon-YYYY HH24:MI'), NULL, To_date('04-DEC-2020 11:00', 'DD-Mon-YYYY HH24:MI'), NULL, 'SucowkrtyuoyaBBBB',2012 , 121, 104, 'en', 5222);


Declare 
    v_output VARCHAR2(100);
BEGIN
    ---
    prc_insert_trip(5222, 4, To_date('04-DEC-2020 08:00', 'DD-Mon-YYYY HH24:MI'), To_date('04-DEC-2020 10:00', 'DD-Mon-YYYY HH24:MI'), 'La Beaujoire Stadium', 'North Paris Arena', 'English', '1C4SDHCT9FC614231', 2012, v_output);
    dbms_output.put_line(v_output);
END;
/



--  should give Error: Driver is not available for the specified time.
----------------------------------------------------------------------------------------------------------------------------





----------------------------------------------------------------------------------------------------------------------------
-- edge case when driver is occupied drop off time is the next intended pick up time for inserting trip

INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    7002, 4, To_date('05-DEC-2020 09:00', 'DD-Mon-YYYY HH24:MI'), NULL, To_date('05-DEC-2020 11:00', 'DD-Mon-YYYY HH24:MI'), NULL, 'SucowkrtyuoyaBBBB',2012 , 121, 104, 'en', 5222);


Declare 
    v_output VARCHAR2(100);
BEGIN
    ---
    prc_insert_trip(5222, 4, To_date('05-DEC-2020 11:00', 'DD-Mon-YYYY HH24:MI'), To_date('05-DEC-2020 12:00', 'DD-Mon-YYYY HH24:MI'), 'La Beaujoire Stadium', 'North Paris Arena', 'English', '1C4SDHCT9FC614231', 2012, v_output);
    dbms_output.put_line(v_output);
END;
/



-- should give Error: Driver is not available for the specified time. if drop off and next intended pick up time is the same, should give error message.
----------------------------------------------------------------------------------------------------------------------------

-- close transaction
ROLLBACK;


