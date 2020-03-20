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



CREATE TABLE travel_Shanghai (date1 INT,
                            intensity1 REAL,
                            date2 INT,
                            intensity2 REAL);

CREATE TABLE travel_Beijing (date1 INT,
                            intensity1 REAL,
                            date2 INT,
                            intensity2 REAL);

CREATE TABLE travel_Guangzhou (date1 INT,
                            intensity1 REAL,
                            date2 INT,
                            intensity2 REAL);

CREATE TABLE travel_Guiyang (date1 INT,
                              intensity1 REAL,
                              date2 INT,
                              intensity2 REAL);

CREATE TABLE travel_Naning (date1 INT,
                            intensity1 REAL,
                            date2 INT,
                            intensity2 REAL);

CREATE TABLE travel_Wuhan (date1 INT,
                            intensity1 REAL,
                            date2 INT,
                            intensity2 REAL);


-- Sets the input data to be in CSV form
.mode csv

-- Reads data from each .csv file and inserts into the specified table.
.import history_China.csv history_China
.import search_Zoom.csv search_Zoom
.import search_telecommuting.csv search_telecommuting
.import search_Excel.csv search_Excel
.import summary.csv summary
.import Travel_Shanghai.csv travel_Shanghai
.import Travel_Beijing.csv travel_Beijing
.import Travel_Guangzhou.csv travel_Guangzhou
.import Travel_Guiyang.csv travel_Guiyang
.import Travel_Naning.csv travel_Naning
.import Travel_Wuxi.csv travel_Wuxi
.import Travel_Wuhan.csv travel_Wuhan
