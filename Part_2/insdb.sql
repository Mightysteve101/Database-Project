--DML statements for ABC.sqlite

--Administrator
INSERT INTO Administrator (empID, name, gender)
            VALUES (1, "Alex Garden", 'M')
                   (2, "ALDEN TRINITY", 'F'),
                   (3, "RANDALL URSULA", 'M'),
                   (4, "OAKLEY BENNETT", 'M'),
                   (5, "CURTIS CAMERON", 'M');

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


--These are the last two tables to figure outP
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