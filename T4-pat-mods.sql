/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T4-pat-mods.sql

--Student ID: 34693807
--Student Name: King Jian Rong


/* Comments for your marker:

At the bottom of this file I inserted test data that are used to display the result outcome of this task
So I did not commit as I didnt want the test data to be saved in the database

*/




/*(a)*/
SELECT * FROM OFFICIAL;
DESC OFFICIAL;


Alter table OFFICIAL
ADD off_role Varchar2(13) DEFAULT 'General' NOT NULL;

COMMENT ON COLUMN OFFICIAL.off_role IS
    'Role of the official';

Alter table OFFICIAL
    Add CONSTRAINT off_role_chk CHECK ( off_role IN ( 'General', 'Administrator', 'Head Coach', 'Coach', 'Physician' ));



update OFFICIAL
set off_role = 'Administrator'
where off_cdm is NULL;

COMMIT;


SELECT * FROM OFFICIAL;
DESC OFFICIAL;




/*(b)*/

drop SEQUENCE CATEGORY_SEQ;

Create sequence CATEGORY_SEQ
start with 1 increment by 1;

DROP TABLE CATEGORY CASCADE CONSTRAINTS;

CREATE TABLE CATEGORY (
    category_id NUMBER(4) NOT NULL, -- set as pk
    category_name VARCHAR2(20) NOT NULL UNIQUE,
    category_demerit_pt NUMBER(2) NOT NULL
);

COMMENT ON COLUMN CATEGORY.category_id IS
    'Unique identifier for each category';

COMMENT ON COLUMN CATEGORY.category_name IS
    'Name of the category';

COMMENT ON COLUMN CATEGORY.category_demerit_pt IS
    'Demerit points for this category';


alter table CATEGORY
ADD CONSTRAINT category_pk PRIMARY KEY (category_id);

DESC CATEGORY;

INSERT INTO CATEGORY (
    category_id, category_name, category_demerit_pt
) VALUES (1, 'late arrival', 1);

INSERT INTO CATEGORY (
    category_id, category_name, category_demerit_pt
) VALUES (2, 'rude behaviour', 2);

INSERT INTO CATEGORY (
    category_id, category_name, category_demerit_pt
) VALUES (3, 'poor driving', 2);

INSERT INTO CATEGORY (
    category_id, category_name, category_demerit_pt
) VALUES (4, 'failing to assist', 1);

COMMIT;


select * from CATEGORY;




DROP TABLE COMPLAINT CASCADE CONSTRAINTS;


CREATE TABLE COMPLAINT (
    trip_id NUMBER NOT NULL,
    off_id NUMBER NOT NULL,
    complaint_date DATE NOT NULL,
    category_id NUMBER NOT NULL,
    detailed_comment VARCHAR2(100),
    validated_flag CHAR(1) DEFAULT 'N' NOT NULL,

    FOREIGN KEY (trip_id) REFERENCES TRIP (trip_id),
    FOREIGN KEY (category_id) REFERENCES CATEGORY (category_id)
);

ALTER TABLE COMPLAINT ADD CONSTRAINT complain_pk PRIMARY KEY ( trip_id
,complaint_date);

Alter table Complaint
ADD CONSTRAINT complaint_validated_flag_chk CHECK ( validated_flag IN ('Y', 'N') );

COMMENT ON COLUMN COMPLAINT.trip_id IS
    'Trip Id for this complaint';

COMMENT ON COLUMN COMPLAINT.off_id IS
    'Official Id for this complaint';

COMMENT ON COLUMN COMPLAINT.complaint_date IS
    'Date of the complaint';

COMMENT ON COLUMN COMPLAINT.category_id IS
    'Category Of Complain Id for this complaint';

COMMENT ON COLUMN COMPLAINT.detailed_comment IS
    'Detailed comment for this complaint';

COMMENT ON COLUMN COMPLAINT.validated_flag IS
    'Flag to indicate if the complaint has been validated';


Desc COMPLAINT;





-- test data
INSERT INTO Trip (
    trip_id, trip_nopassengers, trip_int_pickupdt, trip_act_pickupdt, trip_int_dropoffdt, trip_act_dropoffdt, veh_vin, driver_id, pickup_locn_id, dropoff_locn_id, lang_iso_code, off_id
) VALUES (
    5111, 4, To_date('01-JAN-2020 10:00', 'DD-Mon-YYYY HH24:MI'), To_date('01-JAN-2020 10:20', 'DD-Mon-YYYY HH24:MI'), To_date('01-JAN-2020 12:00', 'DD-Mon-YYYY HH24:MI'), To_date('01-JAN-2020 12:25', 'DD-Mon-YYYY HH24:MI'), '1C4SDHCT9FC614231', 2001, 101, 111, 'en', 2134);


INSERT INTO COMPLAINT (
    trip_id, off_id, complaint_date, category_id, detailed_comment, validated_flag
) VALUES (5111, 3727, to_date('01-JAN-2020 12:00', 'DD-Mon-YYYY HH24:MI'), 1, 'late arrival', 'N');


SELECT * FROM COMPLAINT; 
