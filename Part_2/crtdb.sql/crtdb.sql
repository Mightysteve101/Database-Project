--
-- File generated with SQLiteStudio v3.4.3 on Thu Feb 9 11:12:08 2023
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;


-- Table: AdmWorkHours
CREATE TABLE IF NOT EXISTS AdmWorkHours (
    empId INTEGER  REFERENCES Administrator (empId),
    day   DATE,
    hours NUMERIC (4, 2),
    PRIMARY KEY (
        empId,
        day
    )
);

-- Table: Administers
CREATE TABLE IF NOT EXISTS Administers (
    empId    INTEGER REFERENCES Administrator (empId),
    siteCode INTEGER REFERENCES Site (siteCode),
    PRIMARY KEY (
        empId,
        siteCode
    )
);


-- Table: Administrator
CREATE TABLE IF NOT EXISTS Administrator (
    empId  INTEGER      PRIMARY KEY,
    name   VARCHAR (40),
    gender CHAR (1) 
);


-- Table: AirtimePackage
CREATE TABLE IF NOT EXISTS AirtimePackage (
    packageId INTEGER      PRIMARY KEY,
    class     VARCHAR 
    startDate  DATE,
    lastDate  DATE,
    frequency INTEGER,
    videoCode INTEGER, CHECK (class = 'Economy' OR class = 'Whole Day' OR class = 'Golden Hours')
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
    clientId INTEGER       PRIMARY KEY,
    name     VARCHAR (40),
    phone    VARCHAR (16),
    address  VARCHAR (100) 
);


-- Table: DigitalDisplay
CREATE TABLE IF NOT EXISTS DigitalDisplay (
    serialNo        CHAR (10) PRIMARY KEY,
    schedulerSystem CHAR (10) CHECK (schedulerSystem IN ('Random', 'Smart', 'Virtue')),
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
    clientId      INTEGER        REFERENCES Client (clientId),
    empId         INTEGER        REFERENCES Salesman (empId),
    packageId     INTEGER        REFERENCES AirtimePackage (packageId),
    commissionRate NUMERIC (4, 2),
    PRIMARY KEY (
        clientId,
        empId,
        packageId
    )
);


-- Table: Salesman
CREATE TABLE IF NOT EXISTS Salesman (
    empId  INTEGER     PRIMARY KEY,
    name   VARCHAR (10),
    gender CHAR (1) 
);


-- Table: Site
CREATE TABLE IF NOT EXISTS Site (
    siteCode INTEGER      PRIMARY KEY,
    type     VARCHAR (16) ,
    address  VARCHAR (100),
    phone    VARCHAR (16), CHECK (type = 'bar' OR type = 'restaurant') 
);




-- Table: Specializes
CREATE TABLE IF NOT EXISTS Specializes (
    empId   INTEGER   REFERENCES TechnicalSupport (empId),
    modelNo CHAR (10) REFERENCES Model (modelNo),
    PRIMARY KEY (
        empId,
        modelNo
    )
);


-- Table: TechnicalSupport
CREATE TABLE IF NOT EXISTS TechnicalSupport (
    empId  INTEGER      PRIMARY KEY,
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
