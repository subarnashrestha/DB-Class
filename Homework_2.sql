-- Homework 2
-- September 15th, 2019
-- Subarna B. Shrestha


--DROP TABLE IF EXISTS

-- Foreign Key and Primary Key added in these tables
DROP TABLE IF EXISTS Taverns;
DROP TABLE IF EXISTS Location;

-- Used ALTER command to add Foreign key in these tables
-- and
-- example of INSERT Failed due to foreign key constraints --

DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Roles;

-- BasementsRats tables dropped
DROP TABLE IF EXISTS BasementsRats;

DROP TABLE IF EXISTS Supplies
DROP TABLE IF EXISTS Counts 
DROP TABLE IF EXISTS Received
DROP TABLE IF EXISTS Service 
DROP TABLE IF EXISTS ServiceStatus
DROP TABLE IF EXISTS Guests 
DROP TABLE IF EXISTS GuestStatus
DROP TABLE IF EXISTS Levels
DROP TABLE IF EXISTS Classes
DROP TABLE IF EXISTS Counts
DROP TABLE IF EXISTS Sales 





-- Create Tables using PRIMARY KEY and FOREIGN KEY in Location and Tavern tables

-- Location
CREATE TABLE Location 
(
Id			int IDENTITY PRIMARY KEY,
Name		varchar(100)
);

INSERT INTO Location (Name)
VALUES
('Marlton'),
('Berlin'),
('Haddon Township'),
('Philadelphia'),
('Lumberton'),
('Cherry Hill');


-- Taverns
CREATE TABLE Taverns 
(
Id			int IDENTITY PRIMARY KEY,
Name		varchar(250),
LocationId	int,
Ownerid		int
FOREIGN KEY (LocationId) REFERENCES Location(Id)
);



INSERT INTO Taverns (Name, LocationId, Ownerid)
VALUES
('Marlton Tavern', 1, 1),
('Town Tavern', 4, 12),
('Brewers Towne Tavern',3 , 10),
('Good Time Tavern', 2, 15),
('Park Tavern', 4, 1);

-- INSERT Failed due to foreign key constraints --

/*
INSERT INTO Taverns (Name, LocationId, Ownerid)
VALUES
('XZY Tavern', 100, 100);
*/

-- insertions failed with following error message :
--The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Taverns__Ownerid__6754599E". The conflict occurred in database "SShrestha_2019", table "dbo.Location", column 'Id'.





---------------------------------------------------------------

-- ALTER commnad to modify and add PRIMARY KEY and FOREIGN KEY in USERS and ROLES tables

--- Roles
CREATE TABLE Roles
(
Id			int	IDENTITY PRIMARY KEY,
Name		varchar(50),
Description	varchar(max), 
);

INSERT INTO Roles (Name, Description)
VALUES
('Admin', 'Administrator'),
('Operator', 'General User'),
('Guest', 'Guest User'),
('Lead', 'Team Leader' ),
('Pro', 'Project Manager'), 
('Test', 'Testers');



-- Users
CREATE TABLE Users 
(
Id			int IDENTITY PRIMARY KEY,
Name		varchar(250),
RoleId		int,
);

INSERT INTO Users (Name, RoleId)
VALUES
('Bob', 1),
('Paul', 3),
('Jim', 5),
('Linda', 2 ),
('Su', 1), 
('Charles', 1);

ALTER TABLE USERS
ADD FOREIGN KEY (RoleId) REFERENCES Roles(Id);

---------------------------------------------------
-- Basements Rats Table dropped
-- Basements Rats
CREATE TABLE BasementsRats
(
Id			int IDENTITY PRIMARY KEY,
Name		varchar(50)
);

INSERT INTO BasementsRats (Name)
VALUES
('Musi'),
('Max'),
('Golu'),
('Tutu'),
('Ru');

DROP TABLE IF EXISTS BasementsRats;

-------------------------------------------------------------

--- Home Work

-- Supplies
CREATE TABLE Supplies 
(
Id			int IDENTITY PRIMARY KEY,
Name		varchar(50),
Unit		varchar(50)
);

INSERT INTO Supplies (Name, Unit)
VALUES
('Strong Ale', 'Ounce'),
('Corona', 'Ounce'),
('Draft Beer', 'Gallon'),
('Red Lable',  'Ounce' ),
('Kendal Jackson',  'ml'); 


-- Counts
CREATE TABLE Counts 
(
SupplyId	int,
Date		date,
TravleId	int,
Count		decimal(18, 2)		
);

INSERT INTO Counts (Count)
VALUES
(10),
(20),
(50),
(25),
(100)


-- Received
CREATE TABLE Received 
(
Id				int IDENTITY PRIMARY KEY,
SupplyId		int,
Date			date,
Amount			float,
Cost			float,
TavernId		int
);

INSERT INTO Received (SupplyId, Date, Amount, Cost, TavernId)
VALUES
(1,  '2018-01-19', 5000, 50, 3),
(1,  '2018-11-21', 2502, 20, 1),
(2,  '2018-12-14', 2000, 10, 4),
(2,  '2019-01-01', 1000, 50, 5),
(1,  '2019-03-11', 1000, 12, 2);



-- Service
CREATE TABLE Service 
(
Id					int IDENTITY PRIMARY KEY,
Name				varchar(50),
StatusId			int,
TavenrId			int
);

INSERT INTO Service (Name, StatusId, TavenrId)
VALUES
('Pool', 2, 3),
('Weapon sharpening', 1, 2);



-- ServiceStatus
CREATE TABLE ServiceStatus 
(
Id					int IDENTITY PRIMARY KEY,
Name				varchar(50),
);

INSERT INTO ServiceStatus(Name)
VALUES
('Actvie'),
('Inactive'),
('Out of stock'),
('Discontinued');

-- Sales
CREATE TABLE Sales 
(
Id				int IDENTITY PRIMARY KEY,
ServiceId		int,
GuestId			int,
Price			decimal(18, 2),
Date			date,
Amount			int,
TavernId		int,
);

INSERT INTO Sales (ServiceId, GuestId, Price, Date, Amount, TavernId	)
VALUES
(1,  2, 20, '2018-01-19', 1000, 1),
(1,  3, 40, '2018-11-21', 2000, 4),
(2,  4, 60, '2018-12-14', 500, 3),
(2,  5, 80, '2019-01-01', 6000, 2),
(1,  9, 100, '2019-03-11', 500, 1);

-- Guests
CREATE TABLE Guests 
(
Id			int IDENTITY PRIMARY KEY,
Name		varchar(250),
Notes		varchar(Max),
Birthdate	date,
Cakeday		date,
StatusId	int
);

INSERT INTO Guests (Name, Notes, Birthdate, Cakeday, StatusId)
VALUES
('Alex',	'Extended_Stay',	'2018-01-19', '2018-01-19', 1),
('Linda',	'Regular Customer',	'2018-11-21', '2018-01-19', 4),
('Bob',		'Online booking',	'2018-12-14', '2018-01-19', 3),
('Tom',		'Regular Customer',	'2019-01-01', '2018-01-19', 2),
('Mike',	'Online Booking',	'2019-03-11', '2018-01-19', 1);

--GuestStatus
CREATE TABLE GuestStatus 
(
Id			int IDENTITY PRIMARY KEY,
Name		varchar(50),
);

INSERT INTO GuestStatus(Name)
VALUES
('sick'),
('fine'),
('hangry'),
('raging'),
('placid');

-- Levels
CREATE TABLE Levels 
(
Id				int IDENTITY PRIMARY KEY,
GuestId			int,
ServiceId		int,
Date			date,
);

INSERT INTO Sales (GuestId, ServiceId, Date)
VALUES
(1,  2,  '2018-01-19'),
(3,  3,  '2018-11-21'),
(6,  2,  '2018-12-14'),
(5,  4,  '2019-01-01'),
(4,  1,  '2019-03-11');







--Classes
CREATE TABLE Classes 
(
Id			smallint IDENTITY PRIMARY KEY,
Name		varchar(50),
Level		varchar(50)
);

INSERT INTO Classes(Name, Level)
VALUES
('Manager', 'lvl 2'),
('fighter', 'lvl 3'),
('Officer', 'lvl 1'),
('Associate' ,'lvl 4'),
('GM', 'lvl1');





