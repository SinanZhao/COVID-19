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

CREATE TABLE search_Excel (search_term VARCHAR,
                           area VARCHAR,
                           date VARCHAR,
                           search_intensity INT);

CREATE TABLE summary (date VARCHAR,
                      country VARCHAR,
                      province VARCHAR,
                      city VARCHAR,
                      confirmed INT,
                      suspected INT,
                      cured INT,
                      dead INT);


-- Sets the input data to be in CSV form
.mode csv

-- Reads data from each .csv file and inserts into the specified table.
.import history_China.csv history_China
.import search_Zoom.csv search_Zoom
.import search_telecommuting.csv search_telecommuting
.import search_Excel.csv search_Excel
.import summary.csv summary
