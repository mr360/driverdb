/* Set database to apply changes to*/
use driverdb;

INSERT INTO manufacturer_list (company)
VALUES 
        ('Realtek'),
        ('Kionix'),
        ('Intel'),
        ('AMD'),
        ('ATI'),
        ('Nvidia'),
        ('Broadcom'),
        ('Qualcomm'),
        ('Mediatek'),
        ('Texas Instruments'),
        ('TP-Link'),
        ('Atheros'),
        ('Ralink'),
        ('Conexant'),
        ('IDT'),
        ('Synaptics'),
        ('Logitech'),
        ('Unknown'),
        ('VIA');

INSERT INTO driver_category_list (category)
VALUES 
        ('Graphics'),
        ('Chipset'),
        ('Audio'),
        ('Network'),
        ('Storage'),
        ('Perpherials'),
        ('BIOS'),
        ('Misc');

INSERT INTO driver_status_list (release_status)
VALUES 
	    ('Beta'),
        ('WHQL'),
        ('Release');

INSERT INTO operating_system_list (operating_system)
VALUES 
        ('Windows XP'),
        ('Windows Vista'),
        ('Windows 7'),
        ('Windows 8'),
        ('Windows 8.1'),
        ('Windows 10'),
        ('Windows Server 2008'),
        ('Windows Server 2008 R2'),
        ('Windows Server 2012'),
        ('Windows Server 2012 R2'),
        ('Windows Server 2016');
 
/* TODO */ 
INSERT INTO device_category_list (category)
VALUES 
        (); 

INSERT INTO device_series_list (series)
VALUES 
        (); 