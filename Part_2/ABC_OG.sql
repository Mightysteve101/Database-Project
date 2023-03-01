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
