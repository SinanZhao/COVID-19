-- Creates tables to import our flight data into.
CREATE TABLE history_China (date VARCHAR,
                            country_nowConfirm INT,
                            country_heal INT,
                            country_dead INT);

CREATE TABLE search_telecommuting (search_term VARCHAR,
                                   area VARCHAR,
                                   date VARCHAR,
                                   search_intensity INT);

CREATE TABLE search_Zoom (search_term VARCHAR,
                          area VARCHAR,
                          date VARCHAR,
                          search_intensity INT);


-- Sets the input data to be in CSV form
.mode csv

-- Reads data from each .csv file and inserts into the specified table.
.import history_China.csv history_China
.import search_Zoom.csv search_Zoom
.import search_telecommuting.csv search_telecommuting
