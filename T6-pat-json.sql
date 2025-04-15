/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-pat-json.sql

--Student ID: 34693807
--Student Name: King Jian Rong


/* Comments for your marker:




*/

-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT TO GENERATE 
-- THE COLLECTION OF JSON DOCUMENTS HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


SELECT 
    JSON_OBJECT(
        '_id' VALUE d.driver_id, 
        'name' VALUE d.driver_given 
        || ' ' || d.driver_family,
        'licence_num' VALUE d.driver_licence,
        'no_of_trips' VALUE COUNT(t.trip_id),
        'suspended' VALUE d.driver_suspended,
        'trips_info' VALUE JSON_ARRAYAGG(
            JSON_OBJECT(
                'trip_id' VALUE t.trip_id,
                'veh_vin' VALUE t.veh_vin,
                'pick-up' VALUE JSON_OBJECT(
                    'location_id' VALUE t.pickup_locn_id,
                    'location_name' VALUE p_loc.locn_name,
                    'intended_datetime' VALUE TO_CHAR(t.trip_int_pickupdt, 'DD/MM/YYYY HH24:MI'),
                    'actual_datetime' VALUE TO_CHAR(t.trip_act_pickupdt, 'DD/MM/YYYY HH24:MI')
                ),
                'drop off' VALUE JSON_OBJECT(
                    'location_id' VALUE t.dropoff_locn_id,
                    'location_name' VALUE d_loc.locn_name,
                    'intended_datetime' VALUE TO_CHAR(t.trip_int_dropoffdt, 'DD/MM/YYYY HH24:MI'),
                    'actual_datetime' VALUE TO_CHAR(t.trip_act_dropoffdt, 'DD/MM/YYYY HH24:MI')
                )
            )
        ) FORMAT JSON) || ',' 

FROM 
    driver d
JOIN 
    trip t ON d.driver_id = t.driver_id
JOIN 
    location p_loc ON t.pickup_locn_id = p_loc.locn_id
JOIN 
    location d_loc ON t.dropoff_locn_id = d_loc.locn_id
WHERE 
    t.trip_act_dropoffdt IS NOT NULL 
GROUP BY 
    d.driver_id, d.driver_given, d.driver_family, d.driver_licence, d.driver_suspended;
