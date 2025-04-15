// *****PLEASE ENTER YOUR DETAILS BELOW*****
// T6-pat-mongo.mongodb.js

// --Student ID: 34693807
// --Student Name: King Jian Rong

//Comments for your marker:

// ===================================================================================
// Do not add new comments to this playground
// OR modify or remove any of the comments below (items marked with //)
// ===================================================================================

// Use (connect to) your database - you MUST update xyz001
// with your authcate username

use("jkin0029");

// (b)
// PLEASE PLACE REQUIRED MONGODB COMMAND TO CREATE THE COLLECTION HERE
// YOU MAY PICK ANY COLLECTION NAME
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Drop collection
db.getCollectionNames();


db.driveinfo.drop();


// Create collection and insert documents


db.createCollection("driveinfo");

db.driveinfo.insertMany([
    {"_id":2001,"name":"Pierre Martin","licence_num":"120501123456","no_of_trips":2,"suspended":"N","trips_info":[{"trip_id":1111,"veh_vin":"JDTqpyttyuopqwert","pick-up":{"location_id":101,"location_name":"Bordeaux Stadium","intended_datetime":"21/07/2024 10:00","actual_datetime":"21/07/2024 10:20"},"drop off":{"location_id":111,"location_name":"Porte de La Chapelle Arena","intended_datetime":"21/07/2024 12:00","actual_datetime":"21/07/2024 12:25"}},{"trip_id":2020,"veh_vin":"ILUVUerOMGoREALLY","pick-up":{"location_id":111,"location_name":"Porte de La Chapelle Arena","intended_datetime":"02/08/2024 10:00","actual_datetime":"02/08/2024 10:20"},"drop off":{"location_id":121,"location_name":"Saint-Quentin-en-Yvelines Velodrome","intended_datetime":"02/08/2024 12:00","actual_datetime":"02/08/2024 12:25"}}]},
    {"_id":2002,"name":"Marie Dupont","licence_num":"34082A789012","no_of_trips":2,"suspended":"N","trips_info":[{"trip_id":1300,"veh_vin":"JUEUEUrtyuopqweUU","pick-up":{"location_id":106,"location_name":"La Beaujoire Stadium","intended_datetime":"23/07/2024 10:00","actual_datetime":"23/07/2024 10:20"},"drop off":{"location_id":121,"location_name":"Saint-Quentin-en-Yvelines Velodrome","intended_datetime":"23/07/2024 12:00","actual_datetime":"23/07/2024 12:25"}},{"trip_id":1400,"veh_vin":"JUEUEUrtyuopqweUU","pick-up":{"location_id":121,"location_name":"Saint-Quentin-en-Yvelines Velodrome","intended_datetime":"24/07/2024 10:00","actual_datetime":"24/07/2024 10:20"},"drop off":{"location_id":104,"location_name":"Eiffel Tower Stadium","intended_datetime":"24/07/2024 12:00","actual_datetime":"24/07/2024 12:25"}}]},
    {"_id":2003,"name":"Louis Dubois","licence_num":"45112B654321","no_of_trips":1,"suspended":"N","trips_info":[{"trip_id":1500,"veh_vin":"LBJqwertyuopqwert","pick-up":{"location_id":119,"location_name":"Arc de Triomphe","intended_datetime":"25/07/2024 10:00","actual_datetime":"25/07/2024 10:20"},"drop off":{"location_id":104,"location_name":"Eiffel Tower Stadium","intended_datetime":"25/07/2024 12:00","actual_datetime":"25/07/2024 12:25"}}]},
    {"_id":2004,"name":"Antoine Lefevre","licence_num":"670495098765","no_of_trips":2,"suspended":"N","trips_info":[{"trip_id":1510,"veh_vin":"ILUVUerOMGoREALLY","pick-up":{"location_id":104,"location_name":"Eiffel Tower Stadium","intended_datetime":"27/07/2024 10:00","actual_datetime":"27/07/2024 10:20"},"drop off":{"location_id":120,"location_name":"The Basilica of the Sacred Heart of Paris","intended_datetime":"27/07/2024 12:00","actual_datetime":"27/07/2024 12:25"}},{"trip_id":1610,"veh_vin":"ILUVUerOMGoREALLY","pick-up":{"location_id":111,"location_name":"Porte de La Chapelle Arena","intended_datetime":"28/07/2024 10:00","actual_datetime":"28/07/2024 10:20"},"drop off":{"location_id":102,"location_name":"Bercy Arena","intended_datetime":"28/07/2024 12:00","actual_datetime":"28/07/2024 12:25"}}]},
    {"_id":2005,"name":"Sophie Bernard","licence_num":"89122a345678","no_of_trips":5,"suspended":"N","trips_info":[{"trip_id":1700,"veh_vin":"OMGqwertyuNewJean","pick-up":{"location_id":113,"location_name":"Olympic and Paralympic village","intended_datetime":"29/07/2024 10:00","actual_datetime":"29/07/2024 10:20"},"drop off":{"location_id":103,"location_name":"Champ de Mars Arena","intended_datetime":"29/07/2024 12:00","actual_datetime":"29/07/2024 12:25"}},{"trip_id":2081,"veh_vin":"OMGqwertyuNewJean","pick-up":{"location_id":113,"location_name":"Olympic and Paralympic village","intended_datetime":"09/08/2024 10:00","actual_datetime":"09/08/2024 10:20"},"drop off":{"location_id":103,"location_name":"Champ de Mars Arena","intended_datetime":"09/08/2024 12:00","actual_datetime":"09/08/2024 12:25"}},{"trip_id":2060,"veh_vin":"ILUVUerOMGoREALLY","pick-up":{"location_id":106,"location_name":"La Beaujoire Stadium","intended_datetime":"06/08/2024 10:00","actual_datetime":"06/08/2024 10:20"},"drop off":{"location_id":101,"location_name":"Bordeaux Stadium","intended_datetime":"06/08/2024 12:00","actual_datetime":"06/08/2024 12:25"}},{"trip_id":2040,"veh_vin":"ILUVUerOMGoREALLY","pick-up":{"location_id":105,"location_name":"South Paris Arena","intended_datetime":"04/08/2024 10:00","actual_datetime":"04/08/2024 10:20"},"drop off":{"location_id":106,"location_name":"La Beaujoire Stadium","intended_datetime":"04/08/2024 12:00","actual_datetime":"04/08/2024 12:25"}},{"trip_id":1800,"veh_vin":"OMGqwertyuNewJean","pick-up":{"location_id":104,"location_name":"Eiffel Tower Stadium","intended_datetime":"30/07/2024 10:00","actual_datetime":"30/07/2024 10:20"},"drop off":{"location_id":113,"location_name":"Olympic and Paralympic village","intended_datetime":"30/07/2024 12:00","actual_datetime":"30/07/2024 12:25"}}]},
    {"_id":2006,"name":"Arman ","licence_num":"23072b567890","no_of_trips":1,"suspended":"N","trips_info":[{"trip_id":1900,"veh_vin":"ILUVUerOMGoREALLY","pick-up":{"location_id":111,"location_name":"Porte de La Chapelle Arena","intended_datetime":"01/08/2024 10:00","actual_datetime":"01/08/2024 10:20"},"drop off":{"location_id":113,"location_name":"Olympic and Paralympic village","intended_datetime":"01/08/2024 12:00","actual_datetime":"01/08/2024 12:25"}}]},
    {"_id":2010,"name":"Naoki Fujimoto","licence_num":"110685765432","no_of_trips":4,"suspended":"N","trips_info":[{"trip_id":2000,"veh_vin":"ILUVUerOMGoREALLY","pick-up":{"location_id":113,"location_name":"Olympic and Paralympic village","intended_datetime":"01/08/2024 10:00","actual_datetime":"01/08/2024 10:20"},"drop off":{"location_id":101,"location_name":"Bordeaux Stadium","intended_datetime":"01/08/2024 12:00","actual_datetime":"01/08/2024 12:25"}},{"trip_id":2050,"veh_vin":"ILUVUerOMGoREALLY","pick-up":{"location_id":106,"location_name":"La Beaujoire Stadium","intended_datetime":"06/08/2024 10:00","actual_datetime":"06/08/2024 10:20"},"drop off":{"location_id":101,"location_name":"Bordeaux Stadium","intended_datetime":"06/08/2024 12:00","actual_datetime":"06/08/2024 12:25"}},{"trip_id":2030,"veh_vin":"ILUVUerOMGoREALLY","pick-up":{"location_id":105,"location_name":"South Paris Arena","intended_datetime":"04/08/2024 10:00","actual_datetime":"04/08/2024 10:20"},"drop off":{"location_id":106,"location_name":"La Beaujoire Stadium","intended_datetime":"04/08/2024 12:00","actual_datetime":"04/08/2024 12:25"}},{"trip_id":2010,"veh_vin":"ILUVUerOMGoREALLY","pick-up":{"location_id":111,"location_name":"Porte de La Chapelle Arena","intended_datetime":"02/08/2024 10:00","actual_datetime":"02/08/2024 10:20"},"drop off":{"location_id":121,"location_name":"Saint-Quentin-en-Yvelines Velodrome","intended_datetime":"02/08/2024 12:00","actual_datetime":"02/08/2024 12:25"}}]},
    {"_id":2013,"name":"Lei Xiong","licence_num":"441270890123","no_of_trips":3,"suspended":"N","trips_info":[{"trip_id":1200,"veh_vin":"JDTqpyttyuopqwert","pick-up":{"location_id":121,"location_name":"Saint-Quentin-en-Yvelines Velodrome","intended_datetime":"22/07/2024 10:00","actual_datetime":"22/07/2024 10:20"},"drop off":{"location_id":104,"location_name":"Eiffel Tower Stadium","intended_datetime":"22/07/2024 12:00","actual_datetime":"22/07/2024 12:25"}},{"trip_id":2070,"veh_vin":"ILUVUerOMGoREALLY","pick-up":{"location_id":101,"location_name":"Bordeaux Stadium","intended_datetime":"08/08/2024 10:00","actual_datetime":"08/08/2024 10:20"},"drop off":{"location_id":102,"location_name":"Bercy Arena","intended_datetime":"08/08/2024 12:00","actual_datetime":"08/08/2024 12:25"}},{"trip_id":1600,"veh_vin":"LBJqwertyuopqwert","pick-up":{"location_id":117,"location_name":"Tuileries Garden","intended_datetime":"26/07/2024 10:00","actual_datetime":"26/07/2024 10:20"},"drop off":{"location_id":115,"location_name":"Eiffel Tower","intended_datetime":"26/07/2024 12:00","actual_datetime":"26/07/2024 12:25"}}]},
    {"_id":2014,"name":"Claire Robert","licence_num":"55052a543210","no_of_trips":1,"suspended":"N","trips_info":[{"trip_id":100,"veh_vin":"1C4SDHCT9FC614231","pick-up":{"location_id":113,"location_name":"Olympic and Paralympic village","intended_datetime":"30/07/2024 12:30","actual_datetime":"30/07/2024 12:30"},"drop off":{"location_id":111,"location_name":"Porte de La Chapelle Arena","intended_datetime":"30/07/2024 14:00","actual_datetime":"30/07/2024 14:15"}}]},
]);


// List all documents you added
db.driveinfo.find();

// (c)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer



db.driveinfo.find(
    {
      "$or": [
        { "trips_info.drop off.location_name": /.*Champions Park.*/ },
        { "trips_info.drop off.location_name": /.*Porte de La Chapelle Arena.*/ }
      ]
    },
    { "name": 1, "licence_num": 1 }
  );



// (d)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer




// Show document before the new trip is added and the driver is suspended
db.driveinfo.find({"_id":2004});



// Add new trip and set the driver to suspended
db.driveinfo.updateOne(
    { "_id": 2004 },
    { 
        "$set": { "suspended" : "Y" },
        "$push": { "trips_info": { "trip_id": 7346, "veh_vin": "ILUVUerOMGoREALLY", "pick-up": { "location_id": 117, "location_name": "Tuileries Garden", "intended_datetime": "10/08/2024 10:00", "actual_datetime": "10/08/2024 10:20" }, "drop off": { "location_id": 118, "location_name": "Sainte-Chapelle", "intended_datetime": "10/08/2024 12:00", "actual_datetime": "10/08/2024 12:25" } } }
    }
);


// Illustrate/confirm changes made
db.driveinfo.find({"_id":2004});