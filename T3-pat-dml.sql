/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T3-pat-dml.sql

--Student ID: 34693807
--Student Name: King Jian Rong

/* Comments for your marker:




*/

/*(a)*/
Drop SEQUENCE OFFICIAL_SEQ;
Drop sequence TRIP_SEQ;

Create Sequence TRIP_SEQ
Start With 100 increment by 10;

Create Sequence OFFICIAL_SEQ
Start With 100 increment by 10;





/*(b)*/

Insert INTO OFFICIAL (
    off_id, off_given, off_family, cr_ioc_code, off_cdm
) 
VALUES (OFFICIAL_SEQ.nextval, 'Franklin', 'Gateau', 
(SELECT CR_IOC_CODE from COUNTRY_REGION
where upper(CR_NAME) = upper('St Vincent and The Grenadines')
), NULL);


Insert INTO vehicle (
    veh_vin, veh_rego, veh_year, veh_curr_odo, veh_nopassenngers, vm_model_id
) VALUES ('1C4SDHCT9FC614231', 'CC887BB', To_date('2019', 'YYYY'), 14243, 6, 
(select VM_MODEL_ID from VEHICLE_MODEL
where upper(VM_MODEL) = upper('ALPHARD') and MAN_ID =
(
    select MAN_ID from MANUFACTURER
    where upper(MAN_NAME) = upper('TOYOTA')
)));

Commit;



/*(c)*/
INSERT INTO TRIP (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    TRIP_SEQ.nextval, 4, To_date('30/JUL/2024 12:30', 'DD/MON/YYYY HH24:MI'), NULL, To_date('30/JUL/2024 12:30', 'DD/MON/YYYY HH24:MI') + 1.5/24, NULL, '1C4SDHCT9FC614231', 
    ( 
        select driver_id from DRIVER
        where DRIVER_LICENCE = '55052a543210'
    ), 
    ( 
        select LOCN_ID from LOCATION
        where upper(LOCN_NAME) = upper('Olympic and Paralympic Village')
    ), 
    ( 
        select LOCN_ID from LOCATION
        where upper(LOCN_NAME) = upper('Porte de la Chapelle Arena')
    ), 
    ( 
        select lang_iso_code from LANGUAGE
        where upper(LANG_NAME) = upper('English')
    ), 
    OFFICIAL_SEQ.currval
);




INSERT INTO TRIP (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    TRIP_SEQ.nextval, 4, To_date('30/JUL/2024 20:00', 'DD/MON/YYYY HH24:MI'), NULL , TO_DATE('30/JUL/2024 20:00', 'DD/MON/YYYY HH24:MI') + 1.25/24, NULL, '1C4SDHCT9FC614231', 
    (
        select driver_id from DRIVER
        where  DRIVER_LICENCE = '55052a543210'
    )  
    , 
    (
        select LOCN_ID from LOCATION
        where upper(LOCN_NAME) = upper('Porte de la Chapelle Arena'))
    , 
    (
        select LOCN_ID from LOCATION
        where upper(LOCN_NAME) = upper('Olympic and Paralympic Village')
    ), 
    (
        select lang_iso_code from LANGUAGE
        where upper(LANG_NAME) = upper('English')
    ), OFFICIAL_SEQ.currval);

Commit;



-- /*(d)*/

update Trip 
set TRIP_ACT_PICKUPDT = To_date('30/JUL/2024 12:30', 'DD/MON/YYYY HH24:MI'),  TRIP_ACT_DROPOFFDT = TRIP_INT_DROPOFFDT + 0.25/24
where DRIVER_ID = (
    select driver_id from DRIVER
    where  DRIVER_LICENCE = '55052a543210'
) and TRIP_INT_PICKUPDT = To_date('30/JUL/2024 12:30', 'DD/MON/YYYY HH24:MI') and PICKUP_LOCN_ID = (
    select LOCN_ID from LOCATION
    where upper(LOCN_NAME) = upper('Olympic and Paralympic Village')
) and DROPOFF_LOCN_ID = (
    select LOCN_ID from LOCATION
    where upper(LOCN_NAME) = upper('Porte de la Chapelle Arena')
);

Commit;





DELETE FROM TRIP
WHERE TRIP_INT_PICKUPDT > to_date('30/JUL/2024 17:00', 'DD/MON/YYYY HH24:MI')
  AND TRIP_INT_PICKUPDT < to_date('31/JUL/2024 00:00', 'DD/MON/YYYY HH24:MI')
  AND DRIVER_ID = (
    SELECT driver_id
    FROM DRIVER
    WHERE DRIVER_LICENCE = '55052a543210'
);

Commit;


