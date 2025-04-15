--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T1-pat-schema.sql

--Student ID: 34693807
--Student Name: King Jian Rong


/* Comments for your marker:




*/

-- Task 1 Add Create table statements for the Missing TABLES below.
-- Ensure all column comments, and constraints (other than FK's)are included. 
-- FK constraints are to be added at the end of this script




Create Table OFFICIAL
(
    off_id   Number(4) Not NULL,
    off_given VARCHAR2(30),
    off_family VARCHAR2(30),
    cr_ioc_code char(3) Not NULL,
    off_cdm     Number(4)
);

Alter table official Add CONSTRAINT official_pk PRIMARY KEY (off_id);

Comment On column OFFICIAL.off_id is 'Identifier for an official';

Comment on column OFFICIAL.off_given is 'Given name of the official';

Comment on column OFFICIAL.off_family is 'Family name of the official';

Comment on column OFFICIAL.cr_ioc_code is 'IOC country code for the official';

Comment on column OFFICIAL.off_cdm is 'Identifier for Chef De Mission for the official';


Create Table VEHICLE
(
    veh_vin char(17) Not NULL,
    veh_rego char(7) Not NULL,
    veh_year Date not NULL,
    veh_curr_odo Number(6) not null,
    veh_nopassenngers Number(2) not NULL,
    vm_model_id number(4) not NULL
);

Alter table vehicle Add CONSTRAINT vehicle_pk PRIMARY KEY (veh_vin);

Comment on column vehicle.veh_vin is 'Identifier for vehicle';

Comment on column vehicle.veh_rego is 'Registration plate of vehicle';

Comment on column vehicle.veh_year is 'Year of manufacture of vehicle';

Comment on column vehicle.veh_curr_odo is 'Current odometer reading of vehicle';

Comment on column vehicle.veh_nopassenngers is 's Number of passengers vehicle can seat';

Comment on column vehicle.vm_model_id is 'Identifier for vehicle_model';


Create Table TRIP
(
    trip_id NUMBER(4) Not NULL,
    trip_nopassengers NUMBER(2) Not NULL,   
    trip_int_pickupdt DATE not NULL,
    trip_act_pickupdt Date,
    trip_int_dropoffdt Date not NULL,
    trip_act_dropoffdt Date,
    veh_vin char(17) not NULL,
    driver_id number(4) not NULL,
    pickup_locn_id number(3) not NULL,
    dropoff_locn_id number(3) not NULL,
    lang_iso_code char(2) not NULL,
    off_id number(4) not NULL
);

Alter table trip Add CONSTRAINT trip_pk PRIMARY KEY (trip_id);

Alter table trip Add CONSTRAINT trip_int_pickdrop_veh_driver_uq UNIQUE (trip_int_pickupdt, trip_int_dropoffdt, veh_vin, driver_id);


Comment on column trip.trip_id is 'Identifier for trip';

Comment on column trip.trip_nopassengers is 'Number of passengers on trip';

Comment on column trip.trip_int_pickupdt is 'Intended pickup date and time for trip';

Comment on column trip.trip_act_pickupdt is 'Actual pickup date and time for trip';

Comment on column trip.trip_int_dropoffdt is 'Intended dropoff date and time for trip';

Comment on column trip.trip_act_dropoffdt is 'Actual dropoff date and time for trip';

Comment on column trip.veh_vin is 'Identifier for a vehicle';

Comment on column trip.driver_id is 'Identifier for a driver';

Comment on column trip.pickup_locn_id is 'Identifier for the pickup location';

Comment on column trip.dropoff_locn_id is 'Identifier for the dropoff location';

Comment on column trip.lang_iso_code is 'ISO639-1 two-character language codes';

Comment on column trip.off_id is 'Identifier for an official';

-- Add all missing FK Constraints below here


Alter Table Vehicle
    ADD CONSTRAINT vehicle_model_vehicle_fk FOREIGN key (vm_model_id) 
        REFERENCES vehicle_model (vm_model_id);


Alter Table Trip
    ADD CONSTRAINT vehicle_trip_fk FOREIGN key (veh_vin) 
        REFERENCES vehicle (veh_vin);


Alter Table Trip
    ADD CONSTRAINT driver_trip_fk FOREIGN key (driver_id) 
        REFERENCES driver (driver_id);


Alter table Trip
    ADD CONSTRAINT language_trip_fk FOREIGN key (lang_iso_code) 
        REFERENCES language (lang_iso_code);


Alter table official
    ADD CONSTRAINT country_region_official_fk FOREIGN key (cr_ioc_code) 
        REFERENCES country_region (cr_ioc_code);


Alter table trip
    ADD CONSTRAINT official_trip_fk FOREIGN key (off_id) 
        REFERENCES official (off_id);


Alter table trip
    ADD CONSTRAINT pickup_location_trip_fk FOREIGN key (pickup_locn_id) 
        REFERENCES location (locn_id);


Alter table trip
    ADD CONSTRAINT dropoff_location_trip_fk FOREIGN key (dropoff_locn_id) 
        REFERENCES location (locn_id);


Alter table official
    ADD CONSTRAINT official_cdm_official_fk FOREIGN key (off_cdm) 
        REFERENCES official (off_id);


