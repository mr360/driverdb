/*Create the database and set to default*/
create schema driverdb;
use driverdb;

/*Lookup table(s)*/
/*
manufacturer_list    =  List the manufactures E.g : ATI, AMD, Intel, Nvidia, Ch..ect
driver_category_list =  List what type of driver E.g : Graphics, Chipset, Audio..ect
device_category_list =  List the product category E.g : Quadro, Geforce, Radeon..ect 
device_series_list   =  List the series of the product E.g : Quadro Series, 7 Series..ect
driver_status_list   =  List the driver status. E.g : WHQL, Beta, Nvidia Ready, GameReady..ect
operating_system_list = List of all the operating systems 
*/
CREATE TABLE IF NOT EXISTS manufacturer_list (
	id        mediumint unsigned not null auto_increment,
    company   varchar(128) not null, 
    PRIMARY KEY(id, company)
);

CREATE TABLE IF NOT EXISTS driver_category_list (
	id         tinyint unsigned not null auto_increment,
    category   varchar(128) not null, 
    PRIMARY KEY(id, category)
);

CREATE TABLE IF NOT EXISTS device_category_list (
	id         mediumint unsigned not null auto_increment,
    category   varchar(128) not null, 
    PRIMARY KEY(id, category)
);

CREATE TABLE IF NOT EXISTS device_series_list (
	id        mediumint unsigned not null auto_increment,
    series    varchar(128) not null, 
    PRIMARY KEY(id, series)   
);

CREATE TABLE IF NOT EXISTS driver_status_list (
	id                tinyint unsigned not null auto_increment,
    release_status    varchar(128) not null, 
    PRIMARY KEY(id, release_status)
);

CREATE TABLE IF NOT EXISTS operating_system_list (
	id                  tinyint unsigned not null auto_increment,
    operating_system    varchar(128) not null, 
    PRIMARY KEY(id, operating_system)
);


/* Database */
/*
driver            = List the drivers
driver_download   = List the download link to driver
driver_notes      = Driver release notes, features and requirements 
operating_system  = Driver compatible operating system(s)
devices           = List of devices supported by the said driver
*/
CREATE TABLE IF NOT EXISTS driver (
    driver_id                int unsigned not null auto_increment,
    driver_category          tinyint unsigned not null,
    driver_name              varchar(128) not null,
    driver_version           varchar(128) not null,
    driver_status            tinyint unsigned not null,
    driver_manufacturer      mediumint unsigned not null,
    PRIMARY KEY(driver_id),
    FOREIGN KEY(driver_status) REFERENCES driver_status_list(id),
    FOREIGN KEY(driver_category) REFERENCES driver_category_list(id),
    FOREIGN KEY(driver_manufacturer) REFERENCES manufacturer_list(id)
);

CREATE TABLE IF NOT EXISTS driver_download (
    driver_id                int unsigned not null,
    link                     varchar(512) not null,
    PRIMARY KEY(driver_id),
    FOREIGN KEY(driver_id) REFERENCES driver(driver_id)
);

CREATE TABLE IF NOT EXISTS driver_notes (
    driver_id                int unsigned not null,
    features                 varchar(2048),
    notes                    varchar(2048),
    PRIMARY KEY(driver_id),
    FOREIGN KEY(driver_id) REFERENCES driver(driver_id)
);

CREATE TABLE IF NOT EXISTS operating_system (
    driver_id                 int unsigned not null,
    operating_system          tinyint unsigned not null,
    amd64                     boolean not null,
    service_pack              set('1','2','3','4'),
    PRIMARY KEY(driver_id, operating_system, amd64, service_pack),
    FOREIGN KEY(driver_id) REFERENCES driver(driver_id),
    FOREIGN KEY(operating_system) REFERENCES operating_system_list(id)
);

CREATE TABLE IF NOT EXISTS devices (
    driver_id                 int unsigned not null,
    device_category           mediumint unsigned,  
    device_series             mediumint unsigned,
    device_name               varchar(128),
    PRIMARY KEY(driver_id, device_name),
    FOREIGN KEY(driver_id) REFERENCES driver(driver_id),
    FOREIGN KEY(device_series) REFERENCES  device_series_list(id),
    FOREIGN KEY(device_category) REFERENCES device_series_list(id)
);


