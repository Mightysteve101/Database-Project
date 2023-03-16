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

--AdmWorkHours
INSERT INTO AdmWorkHours (day, hours)
       VALUES ('Monday', 08.00),
              ('Tuesday', 08.00),
              ('Wednesday', 08.00),
              ('Thursday', 08.00),
              ('Friday', 05.00);

--Administers
INSERT INTO Administers(empID, siteCode)
       VALUES (1, 1),
              (2, 2),
              (3, 3),
              (4, 4),
              (5, 5);

--Administrator
INSERT INTO Administrator (empID, name, gender)
       VALUES (1, "Alex", 'M')
              (2, "Alden", 'F'),
              (3, "Randall", 'M'),
              (4, "Oakley", 'M'),
              (5, "Curtis", 'M');

--AirtimePackage
INSERT INTO AirtimePackage(packageID, class, startDate, lastDate, frequency, videoCode)
       VALUES (1, "Economy", 2023-03-16, 2023-03-22, 7, 1),
              (3, "Whole Day", 2023-03-29, 2023-04-20, 14, 2),
              (4, "Golden Hours", 2023-04-28, 2023-05-01, 7, 3),
              (5, "Economy", 2023-05-02, 2023-05-15, 7, 4),
              (6, "Economy", 2023-06-01, 2023-06-10, 14, 5);

--Broadcasts
INSERT INTO Broadcasts(videoCode, siteCode)
       VALUES (1, 1),
              (2, 2),
              (3, 3),
              (4, 4),
              (5, 5);



--Client
INSERT INTO Client (clientID, name, phone, address)
       VALUES (1, "Caleb", 304-390-5453, "1232 W Mud River Rd" ),
              (2, "Nancy", 856-848-2774, "1290 Buford Way Dm"),
              (3, "Reg", 714-826-5012, "8287 E Chadwick Pkwy"),
              (4, "Genevieve", 252-449-8107, "110 E Meadowlark St"),
              (5, "Elroe", 414-377-8492, "9095 W Highland Park Ave");

--DigitalDisplay
INSERT INTO DigitalDisplay(serialNo, schedularSystem, modelNo)
       VALUES (1, "Random", 1),
              (2, "Smart", 2),
              (3, "Virtue", 3),
              (4, "Virtue", 4),
              (5, "Smart", 5);

--Locates
INSERT INTO Locates(serialNo, siteCode)
       VALUES (1, 1),
              (2, 2),
              (3, 3),
              (4, 4),
              (5, 5);

--Model
INSERT INTO Model(modelNo, width, height, weight, depth, screenSize)
       VALUES (1, 3530.95, 6135.58, 4354.90, 9354.10, 3705.93),
              (2, 7972.95, 1403.44, 8050.46, 4941.01, 3408.53),
              (3, 6691.53, 3072.34, 5511.09, 3787.53, 7382.24),
              (4, 6374.25, 7982.34, 8957.81, 6271.60, 2371.49),
              (5, 7959.80, 8286.09, 5217.63, 5700.50, 2795.59);

--Purchases
INSERT INTO Purchases(clientID, empID, packageID, commissionRate)
       VALUES (1, 1, 1, 40.00),
              (2, 2, 2, 30.00),
              (3, 3, 3, 40.00),
              (4, 4, 4, 30.00),
              (5, 5, 5, 35.00); 

--Salesman
INSERT INTO Salesman(empID, name, gender)
       VALUES (1, "Willie", 'M'),
              (2, "Gypsy", 'F'),
              (3, "Johnnie", 'M'),
              (4, "Chanelle", 'F'),
              (5, "Margery", 'F');

--Site
INSERT INTO Site(siteCode, type, address, phone)
       VALUES (1, "Bar", "2891 Garrett Street", 269-203-8123),
              (2, "Restaurant", "1675 Walt Nuzum Farm Road", 585-463-1052),
              (3, "Bar", "4890 Blane Street", 314-608-2228),
              (4, "Bar", "384 Hartland Avenue", 920-378-3132),
              (5, "Restaurant", "4764 Davis Court", 618-977-5316);

--Specializes
INSERT INTO Specializes(empID, modelNo)
       VALUES (1, 1),
              (2, 2),
              (3, 3),
              (4, 4),
              (5, 5);

--TechnicalSupport
INSERT INTO TechnicalSupport(empID, name, gender)
       VALUES (1, "Rainbow",'M'),
              (2, "Kehlani",'F'),
              (3, "Brynn",'F'),
              (4, "Erik",'M'),
              (5, "Jaslyn",'F');

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
