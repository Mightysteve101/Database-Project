<<<<<<< HEAD:Part_2/crtdb.sql
--
-- File generated with SQLiteStudio v3.4.3 on Thu Feb 9 11:12:08 2023
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Administers
CREATE TABLE IF NOT EXISTS Administers (
    empID    INTEGER REFERENCES Administrator (empID),
    siteCode INTEGER REFERENCES Site (siteCode),
    PRIMARY KEY (
        empID,
        siteCode
    )
);


-- Table: Administrator
CREATE TABLE IF NOT EXISTS Administrator (
    empID  INTEGER      PRIMARY KEY,
    name   VARCHAR (40),
    gender CHAR (1) 
);


-- Table: AdmWorkHours
CREATE TABLE IF NOT EXISTS AdmWorkHours (
    empId INTEGER  REFERENCES Administrator (empID),
    day   DATE,
    hours NUMERIC (4, 2),
    PRIMARY KEY (
        empId,
        day
    )
);


-- Table: AirtimePackage
CREATE TABLE IF NOT EXISTS AirtimePackage (
    packageID INTEGER      PRIMARY KEY,
    class     VARCHAR (16),
    starDate  DATE,
    lastDate  DATE,
    frequency INTEGER,
    videoCode INTEGER
);


-- Table: Broadcasts
CREATE TABLE IF NOT EXISTS Broadcasts (
    videoCode INTEGER REFERENCES Video (videoCode),
    siteCode  INTEGER REFERENCES Site (siteCode),
    PRIMARY KEY (
        videoCode,
        siteCode
    )
);


-- Table: Client
CREATE TABLE IF NOT EXISTS Client (
    clientID INTEGER       PRIMARY KEY,
    name     VARCHAR (40),
    phone    VARCHAR (16),
    address  VARCHAR (100) 
);


-- Table: DigitalDisplay
CREATE TABLE IF NOT EXISTS DigitalDisplay (
    serialNo        CHAR (10) PRIMARY KEY,
    schedularSystem CHAR (10),
    modelNo         CHAR (10) REFERENCES Model (modelNo) 
);


-- Table: Locates
CREATE TABLE IF NOT EXISTS Locates (
    serialNo CHAR (10) REFERENCES DigitalDisplay (serialNo),
    siteCode INTEGER   REFERENCES Site (siteCode),
    PRIMARY KEY (
        serialNo,
        siteCode
    )
);


-- Table: Model
CREATE TABLE IF NOT EXISTS Model (
    modelNo    CHAR (10)      PRIMARY KEY,
    width      NUMERIC (6, 2),
    height     NUMERIC (6, 2),
    weight     NUMERIC (6, 2),
    depth      NUMERIC (6, 2),
    screenSize NUMERIC (6, 2) 
);


-- Table: Purchases
CREATE TABLE IF NOT EXISTS Purchases (
    clientID      INTEGER        REFERENCES Purchases (clientID),
    empID         INTEGER        REFERENCES Salesman (empID),
    packageID     INTEGER        REFERENCES AirtimePackage (packageID),
    commissionRate NUMERIC (4, 2),
    PRIMARY KEY (
        clientID,
        empID,
        packageID
    )
);


-- Table: Salesman
CREATE TABLE IF NOT EXISTS Salesman (
    empID  INTEGER     PRIMARY KEY,
    name   VARCHAR (10),
    gender CHAR (1) 
);


-- Table: Site
CREATE TABLE IF NOT EXISTS Site (
    siteCode INTEGER       PRIMARY KEY,
    type     VARCHAR (16),
    address  VARCHAR (100),
    phone    VARCHAR (16) 
);


-- Table: Specializes
CREATE TABLE IF NOT EXISTS Specializes (
    empID   INTEGER   REFERENCES TechnicalSupport (empID),
    modelNO CHAR (10) REFERENCES Model (modelNo),
    PRIMARY KEY (
        empID,
        modelNO
    )
);


-- Table: TechnicalSupport
CREATE TABLE IF NOT EXISTS TechnicalSupport (
    empID  INTEGER      PRIMARY KEY,
    name   VARCHAR (40),
    gender CHAR (1) 
);


-- Table: Video
CREATE TABLE IF NOT EXISTS Video (
    videoCode   INTEGER PRIMARY KEY,
    videoLength INTEGER
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
=======
--DML statements for ABC.sqlite

--Administrator
INSERT INTO Administrator (empID, name, gender)
            VALUES (1, "Alex", 'M')
                   (2, "ALDEN", 'F'),
                   (3, "Randall", 'M'),
                   (4, "Oakley", 'M'),
                   (5, "Curtis", 'M');

--Client
INSERT INTO Client (clientID, name, phone, address)
            VALUES (1, "Caleb Anabella", 304-390-5453, "1232 W Mud River Rd" ),
                   (2, "Nancy Sandra", 856-848-2774, "1290 Buford Way Dm"),
                   (3, "Reg Camellia", 714-826-5012, "8287 E Chadwick Pkwy"),
                   (4, "Genevieve Ralf", 252-449-8107, "110 E Meadowlark St"),
                   (5, "Elroy Cate", 414-377-8492, "9095 W Highland Park Ave");

--Model
INSERT INTO Model(modelNo, width, height, weight, depth, screenSize)
            VALUES (1, 3530.95, 6135.58, 4354.90, 9354.10, 3705.93),
                   (2, 7972.95, 1403.44, 8050.46, 4941.01, 3408.53),
                   (3, 6691.53, 3072.34, 5511.09, 3787.53, 7382.24),
                   (4, 6374.25, 7982.34, 8957.81, 6271.60, 2371.49),
                   (5, 7959.80, 8286.09, 5217.63, 5700.50, 2795.59);

--AdmWorkHours
INSERT INTO AdmWorkHours (day, hours)
            VALUES ('Monday', 08.00),
                   ('Tuesday', 08.00),
                   ('Wednesday', 08.00),
                   ('Thursday', 08.00),
                   ('Friday', 05.00);

--Salesman
INSERT INTO Salesman(empdID, name, gender)
            VALUES (1, "Willie Kayley", 'M'),
                   (2, "Gypsy Tessie", 'F'),
                   (3, "Johnnie Candyce", 'M'),
                   (4, "Chanelle Kayly", 'F'),
                   (5, "Margery Ceara", 'F');

--Site
INSERT INTO Site(siteCode, type, address, phone)
            VALUES (1, "TYPE_1", "2891 Garrett Street", 269-203-8123),
                   (2, "TYPE_2", "1675 Walt Nuzum Farm Road", 585-463-1052),
                   (3, "TYPE_2", "4890 Blane Street", 314-608-2228),
                   (4, "TYPE_4", "384 Hartland Avenue", 920-378-3132),
                   (5, "TYPE_3", "4764 Davis Court", 618-977-5316);

--TechnicalSupport
INSERT INTO TechnicalSupport(empID, name, gender)
            VALUES (1, "Rainbow Nick",'M'),
                   (2, "Kehlani Sophia",'F'),
                   (3, "Brynn Berniece",'F'),
                   (4, "Erik Tianna",'M'),
                   (5, "Jaslyn Eunice",'F');

--Video
INSERT INTO Video(videoCode, videoLength)
            VALUES (1, 25),
                   (2, 25),
                   (3, 40),
                   (4, 25),
                   (5, 40);

-- Table: Administers
INSERT INTO Administers(empID, siteCode)
            VALUES (1, 1),
                   (2, 2),
                   (3, 3),
                   (4, 4),
                   (5, 5);


-- Table: Broadcasts
INSERT INTO Broadcasts(videoCode, siteCode)
             VALUES (1, 1),
                    (2, 2),
                    (3, 3),
                    (4, 4),
                    (5, 5);
                    
-- Table: DigitalDisplay
INSERT INTO DigitalDisplay(serialNo, schedularSystem, modelNo)
             VALUES (1, Sys1, 1),
                    (2, Sys2, 2),
                    (3, Sys3, 3),
                    (4, Sys4, 4),
                    (5, Sys5, 5);


--Purchases
INSERT INTO Purchases(clientID, empID, packageID, commissionRate)
             VALUES (1, 1, 1, 40.00),
                    (2, 2, 2, 30.00),
                    (3, 3, 3, 40.00),
                    (4, 4, 4, 30.00),
                    (5, 5, 5, 35.00); 


--Locates
INSERT INTO Locates(serialNo, siteCode)
             VALUES (1, 1),
                    (2, 2),
                    (3, 3),
                    (4, 4),
                    (5, 5);
>>>>>>> 37d411eb5d86d2b122ef9c5543e29318e0f90aaa:Part_2/insdb.sql/insdb.sql
