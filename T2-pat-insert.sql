/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-pat-insert.sql

--Student ID: 34693807
--Student Name: King Jian Rong

/* Comments for your marker:

13 Official entries
10 Vehicle entries
20 trip entries

*/

--------------------------------------
--INSERT INTO official
--------------------------------------




Insert INTO OFFICIAL (
    off_id, off_given, off_family, cr_ioc_code, off_cdm
) 
VALUES (2134, 'David', 'King', 'MAS', NULL);


Insert INTO OFFICIAL (
    off_id, off_given, off_family, cr_ioc_code, off_cdm
) 
VALUES (3727, 'ChongWei', 'Lee', 'MAS', 2134);



Insert INTO OFFICIAL (
    off_id, off_given, off_family, cr_ioc_code, off_cdm
) 
VALUES (4382, 'Wilson', 'Tan', 'MAS', 2134);



Insert INTO OFFICIAL (
    off_id, off_given, off_family, cr_ioc_code, off_cdm
) 
VALUES (1823, 'James', 'Le', 'CHN', NULL);



Insert INTO OFFICIAL (
    off_id, off_given, off_family, cr_ioc_code, off_cdm
) 
VALUES (8837, 'Kevin', 'Ng', 'CHN', 1823);



Insert INTO OFFICIAL (
    off_id, off_given, off_family, cr_ioc_code, off_cdm
) 
VALUES (9912, 'Ola', 'Amadea', 'CHN', 1823);



Insert INTO OFFICIAL (
    off_id, off_given, off_family, cr_ioc_code, off_cdm
)
VALUES (1123, 'Lebron', 'James', 'USA', NULL);



Insert INTO OFFICIAL (
    off_id, off_given, off_family, cr_ioc_code, off_cdm
) 
VALUES (3723, 'Kevin', 'Durian', 'USA', 1123);



Insert INTO OFFICIAL (
    off_id, off_given, off_family, cr_ioc_code, off_cdm
) 
VALUES (5117, 'Kyrie', 'Irving', 'USA', 1123);


Insert INTO OFFICIAL (
    off_id, off_given, off_family, cr_ioc_code, off_cdm
) 
VALUES (5417, 'Suka', 'Yea', 'JPN', NULL);



Insert INTO OFFICIAL (
    off_id, off_given, off_family, cr_ioc_code, off_cdm
) 
VALUES (1929, 'Suzuki', 'Wasabi', 'JPN', 5417);



Insert INTO OFFICIAL (
    off_id, off_given, off_family, cr_ioc_code, off_cdm
) 
VALUES (1981, 'Sashimi', 'Oden', 'JPN', 5417);




Insert INTO OFFICIAL (
    off_id, off_given, off_family, cr_ioc_code, off_cdm
) 
VALUES (6666, 'Geroge', 'Russel', 'NZL', NULL);






--------------------------------------
--INSERT INTO vehicle
--------------------------------------

Insert INTO vehicle (
    veh_vin, veh_rego, veh_year, veh_curr_odo, veh_nopassenngers, vm_model_id
) VALUES ('JDTqpyttyuopqwert', 'IL126GG', To_date('2018', 'YYYY'), 12345, 4, 1);



Insert INTO vehicle (
    veh_vin, veh_rego, veh_year, veh_curr_odo, veh_nopassenngers, vm_model_id
) VALUES ('OMGqwertyuNewJean', 'CC323DD', To_date('2019', 'YYYY'), 12845, 4, 1);



Insert INTO vehicle (
    veh_vin, veh_rego, veh_year, veh_curr_odo, veh_nopassenngers, vm_model_id
) VALUES ('JDIMeantyuoHEHErt', 'EE122LL', To_date('2010', 'YYYY'), 12145, 4, 1);



Insert INTO vehicle (
    veh_vin, veh_rego, veh_year, veh_curr_odo, veh_nopassenngers, vm_model_id
) VALUES ('BROOwertyHELPwert', 'PP63CC', To_date('2011', 'YYYY'), 10005, 4, 1);



Insert INTO vehicle (
    veh_vin, veh_rego, veh_year, veh_curr_odo, veh_nopassenngers, vm_model_id
) VALUES ('JUEUEUrtyuopqweUU', 'BA737CC', To_date('2019', 'YYYY'), 23345, 6, 4);



Insert INTO vehicle (
    veh_vin, veh_rego, veh_year, veh_curr_odo, veh_nopassenngers, vm_model_id
) VALUES ('LMoowertyuKJRwert', 'OO123KK', To_date('2019', 'YYYY'), 17745, 6, 4);



Insert INTO vehicle (
    veh_vin, veh_rego, veh_year, veh_curr_odo, veh_nopassenngers, vm_model_id
) VALUES ('Sucowkrtyuoyayert', 'OK146PP', To_date('2019', 'YYYY'), 10099, 6, 4);



Insert INTO vehicle (
    veh_vin, veh_rego, veh_year, veh_curr_odo, veh_nopassenngers, vm_model_id
) VALUES ('LMaqwertyuopqwert', 'FF887BB', To_date('2019', 'YYYY'), 14243, 6, 7);



Insert INTO vehicle (
    veh_vin, veh_rego, veh_year, veh_curr_odo, veh_nopassenngers, vm_model_id
) VALUES ('LBJqwertyuopqwert', 'NP183DP', To_date('2019', 'YYYY'), 18743, 6, 7);



Insert INTO vehicle (
    veh_vin, veh_rego, veh_year, veh_curr_odo, veh_nopassenngers, vm_model_id
) VALUES ('ILUVUerOMGoREALLY', 'WW120EE', To_date('2019', 'YYYY'), 19231, 6, 5);




--------------------------------------
--INSERT INTO trip
--------------------------------------

INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    1111, 4, To_date('21-Jul-2024 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('21-Jul-2024 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('21-Jul-2024 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('21-Jul-2024 12:25', 'DD-Mon-YYYY HH24:MI'), 'JDTqpyttyuopqwert', 2001, 101, 111, 'en', 2134);



INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    1200, 4, To_date('22-Jul-2024 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('22-Jul-2024 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('22-Jul-2024 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('22-Jul-2024 12:25', 'DD-Mon-YYYY HH24:MI'), 'JDTqpyttyuopqwert', 2013, 121, 104, 'zh', 1823);



INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    1300, 6, To_date('23-Jul-2024 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('23-Jul-2024 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('23-Jul-2024 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('23-Jul-2024 12:25', 'DD-Mon-YYYY HH24:MI'), 'JUEUEUrtyuopqweUU', 2002, 106, 121, 'fr', 1123);


INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    1400, 6, To_date('24-Jul-2024 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('24-Jul-2024 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('24-Jul-2024 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('24-Jul-2024 12:25', 'DD-Mon-YYYY HH24:MI'), 'JUEUEUrtyuopqweUU', 2002, 121, 104, 'en', 5417);


INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    1500, 6, To_date('25-Jul-2024 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('25-Jul-2024 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('25-Jul-2024 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('25-Jul-2024 12:25', 'DD-Mon-YYYY HH24:MI'), 'LBJqwertyuopqwert', 2003, 119, 104, 'en', 2134);


INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    1600, 6, To_date('26-Jul-2024 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('26-Jul-2024 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('26-Jul-2024 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('26-Jul-2024 12:25', 'DD-Mon-YYYY HH24:MI'), 'LBJqwertyuopqwert', 2013, 117, 115, 'zh', 1823);



INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    1510, 6, To_date('27-Jul-2024 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('27-Jul-2024 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('27-Jul-2024 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('27-Jul-2024 12:25', 'DD-Mon-YYYY HH24:MI'), 'ILUVUerOMGoREALLY', 2004, 104, 120, 'pt', 1123);



INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    1610, 6, To_date('28-Jul-2024 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('28-Jul-2024 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('28-Jul-2024 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('28-Jul-2024 12:25', 'DD-Mon-YYYY HH24:MI'), 'ILUVUerOMGoREALLY', 2004, 111, 102, 'en', 2134);



INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    1700, 4, To_date('29-Jul-2024 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('29-Jul-2024 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('29-Jul-2024 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('29-Jul-2024 12:25', 'DD-Mon-YYYY HH24:MI'), 'OMGqwertyuNewJean', 2005, 113, 103, 'es', 5417);



INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    1800, 4, To_date('30-Jul-2024 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('30-Jul-2024 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('30-Jul-2024 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('30-Jul-2024 12:25', 'DD-Mon-YYYY HH24:MI'), 'Sucowkrtyuoyayert', 2005, 104, 113, 'en', 1123);



INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    1900, 6, To_date('01-Aug-2024 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('01-Aug-2024 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('01-Aug-2024 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('01-Aug-2024 12:25', 'DD-Mon-YYYY HH24:MI'), 'ILUVUerOMGoREALLY', 2006, 111, 113, 'kk', 6666);


INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    2000, 6, To_date('01-Aug-2024 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('01-Aug-2024 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('01-Aug-2024 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('01-Aug-2024 12:25', 'DD-Mon-YYYY HH24:MI'), 'Sucowkrtyuoyayert', 2010, 113, 101, 'ja', 6666);


INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    2010, 6, To_date('02-Aug-2024 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('02-Aug-2024 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('02-Aug-2024 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('02-Aug-2024 12:25', 'DD-Mon-YYYY HH24:MI'), 'ILUVUerOMGoREALLY', 2010, 111, 121, 'ja', 6666);



INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    2020, 6, To_date('02-Aug-2024 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('02-Aug-2024 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('02-Aug-2024 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('02-Aug-2024 12:25', 'DD-Mon-YYYY HH24:MI'), 'ILUVUerOMGoREALLY', 2001, 111, 121, 'en', 6666);



INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    2030, 6, To_date('04-Aug-2024 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('04-Aug-2024 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('04-Aug-2024 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('04-Aug-2024 12:25', 'DD-Mon-YYYY HH24:MI'), 'Sucowkrtyuoyayert', 2010, 105, 106, 'ja', 6666);



INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    2040, 6, To_date('04-Aug-2024 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('04-Aug-2024 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('04-Aug-2024 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('04-Aug-2024 12:25', 'DD-Mon-YYYY HH24:MI'), 'ILUVUerOMGoREALLY', 2005, 105, 106, 'es', 6666);



INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    2050, 6, To_date('06-Aug-2024 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('06-Aug-2024 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('06-Aug-2024 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('06-Aug-2024 12:25', 'DD-Mon-YYYY HH24:MI'), 'Sucowkrtyuoyayert', 2010, 106, 101, 'ja', 6666);


INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    2060, 6, To_date('06-Aug-2024 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('06-Aug-2024 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('06-Aug-2024 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('06-Aug-2024 12:25', 'DD-Mon-YYYY HH24:MI'), 'ILUVUerOMGoREALLY', 2005, 106, 101, 'es', 6666);



INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    2070, 6, To_date('08-Aug-2024 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('08-Aug-2024 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('08-Aug-2024 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('08-Aug-2024 12:25', 'DD-Mon-YYYY HH24:MI'), 'ILUVUerOMGoREALLY', 2013, 101, 102, 'zh', 1823);



INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    2081, 4, To_date('09-Aug-2024 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('09-Aug-2024 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('09-Aug-2024 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('09-Aug-2024 12:25', 'DD-Mon-YYYY HH24:MI'), 'OMGqwertyuNewJean', 2005, 113, 103, 'es', 5417);



COMMIT;





