-- Homework 5 
-- September 25th, 2019
-- Subarna B. Shrestha

-- Drop Tables --
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Services;
DROP TABLE IF EXISTS ServiceStatuses;
DROP TABLE IF EXISTS Room_Stays;
DROP TABLE IF EXISTS Rooms;
DROP TABLE IF EXISTS Room_Status;

DROP TABLE IF EXISTS Taverns;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Roles;
DROP TABLE IF EXISTS Location;

DROP TABLE IF EXISTS Levels;
DROP TABLE IF EXISTS Guests; 
DROP TABLE IF EXISTS GuestStatus;
DROP TABLE IF EXISTS Classes;

-- Create Tables --

CREATE TABLE Taverns 
(
Id			int IDENTITY,
Name		varchar(250),
LocationId	int,
Ownerid		int
);

CREATE TABLE Users 
(
Id			int IDENTITY,
Name		varchar(250),
RoleId		int,
);


CREATE TABLE Roles
(
Id			int	IDENTITY,
Name		varchar(50),
Description	varchar(max), 
);

CREATE TABLE Location 
(
Id			int IDENTITY, 
Name		varchar(100)
);


CREATE TABLE GuestStatus 
(
Id			int IDENTITY,
Name		varchar(50),
);


CREATE TABLE Guests 
(
Id			int IDENTITY,
Name		varchar(250),
Notes		varchar(Max),
Birthdate	date,
Cakeday		date,
StatusId	int
);


CREATE TABLE Classes 
(
Id			int IDENTITY,
Name		varchar(50),
Level		int
);


CREATE TABLE Levels 
(
Id				int IDENTITY,
GuestId			int,
ClassId			int,
Date			date,
);


CREATE TABLE ServiceStatuses 
(
Id					int IDENTITY,
Name				varchar(50),
);


CREATE TABLE Services 
(
Id					int IDENTITY,
Name				varchar(50),
StatusId			int,
TavernId			int
);


CREATE TABLE Sales 
(
Id				int IDENTITY,
ServiceId		int,
GuestId			int,
Price			decimal(18, 2),
Date			date,
Amount			int,
TavernId		int,
);


CREATE TABLE Room_Status(
Id			int IDENTITY,
Name		varchar(250)
);

CREATE TABLE Rooms(
Id					int IDENTITY,
StatusId			int,
TavernId			int,
);

CREATE TABLE Room_Stays(
Id					int IDENTITY,
SalesId				int,
GuestId				int,
RoomId				int,
Date				date,
Rate				decimal(18, 2),
);


-- Alter Tables --
ALTER TABLE Taverns ADD PRIMARY KEY (Id);
ALTER TABLE Users ADD PRIMARY KEY (Id);
ALTER TABLE Roles ADD PRIMARY KEY (Id);
ALTER TABLE Location ADD PRIMARY KEY (Id);

ALTER TABLE Guests ADD PRIMARY KEY (Id); 
ALTER TABLE GuestStatus ADD PRIMARY KEY (Id); 
ALTER TABLE Classes ADD PRIMARY KEY (Id); 
ALTER TABLE Levels ADD PRIMARY KEY (Id); 

ALTER TABLE ServiceStatuses ADD PRIMARY KEY (Id);
ALTER TABLE Services ADD PRIMARY KEY (Id);
ALTER TABLE Sales ADD PRIMARY KEY (Id);

--
ALTER TABLE Room_Status ADD PRIMARY KEY (Id);
ALTER TABLE Rooms ADD PRIMARY KEY (Id);
ALTER TABLE Room_Stays ADD PRIMARY KEY (Id);


ALTER TABLE Taverns ADD FOREIGN KEY (LocationId) REFERENCES Location(Id);
ALTER TABLE Taverns ADD FOREIGN KEY (OwnerId) REFERENCES Users(Id);
ALTER TABLE Users ADD FOREIGN KEY (RoleId) REFERENCES Roles(Id);

ALTER TABLE Guests ADD FOREIGN KEY (StatusId) REFERENCES GuestStatus (Id); 
ALTER TABLE Levels ADD FOREIGN KEY (GuestId) REFERENCES Guests (Id); 
ALTER TABLE Levels ADD FOREIGN KEY (ClassId) REFERENCES Classes (Id); 

ALTER TABLE Sales ADD FOREIGN KEY (ServiceId) REFERENCES Services(Id);
ALTER TABLE Sales ADD FOREIGN KEY (GuestId) REFERENCES Guests(Id);
ALTER TABLE Sales ADD FOREIGN KEY (TavernId) REFERENCES Taverns(Id);

ALTER TABLE Services ADD FOREIGN KEY (TavernId) REFERENCES Taverns(Id);
ALTER TABLE Services ADD FOREIGN KEY (StatusId) REFERENCES ServiceStatuses(Id);

ALTER TABLE Rooms ADD FOREIGN KEY (StatusId) REFERENCES Room_Status(Id);
ALTER TABLE Rooms ADD FOREIGN KEY (TavernId) REFERENCES Taverns(Id);
ALTER TABLE Room_Stays ADD FOREIGN KEY (RoomId) REFERENCES Rooms(Id);


-- Insert Data --
INSERT INTO Location (Name)
VALUES
('Marlton'),
('Berlin'),
('Haddon Township'),
('Philadelphia'),
('Lumberton'),
('Cherry Hill');

INSERT INTO Roles (Name, Description)
VALUES
('Admin', 'Administrator'),
('Operator', 'General User'),
('Guest', 'Guest User'),
('Lead', 'Team Leader' ),
('Pro', 'Project Manager'), 
('Test', 'Testers');

INSERT INTO Users (Name, RoleId)
VALUES
('Bob', 1),
('Paul', 3),
('Jim', 5),
('Linda', 2 ),
('Su', 1), 
('Charles', 1);

INSERT INTO Taverns (Name, LocationId, Ownerid)
VALUES
('Marlton Tavern', 1, 1),
('Town Tavern', 4, 2),
('Brewers Towne Tavern',3 , 4),
('Good Time Tavern', 2, 5),
('Park Tavern', 4, 1);

INSERT INTO GuestStatus(Name)
VALUES
('sick'),
('fine'),
('hangry'),
('raging'),
('placid');

INSERT INTO Guests (Name, Notes, Birthdate, Cakeday, StatusId)
VALUES
('Alex',	'Extended_Stay',	'2018-01-19', '2018-01-19', 1),
('Linda',	'Regular Customer',	'2018-11-21', '2018-01-19', 4),
('Bob',		'Online booking',	'2018-12-14', '2018-01-19', 3),
('Tom',		'Regular Customer',	'2019-01-01', '2018-01-19', 2),
('Mike',	'Weekly Booking',	'2019-03-11', '2018-01-19', 3),
('Su',		'Online Booking',	'2019-02-10', '2018-01-19', 5),
('Rudy',	'Paid Booking',		'2019-01-10', '2018-01-19', 3),
('Sam',		'Credit Booking',	'2019-03-15', '2018-01-19', 2);

INSERT INTO Classes(Name, Level)
VALUES
('Manager', 2),
('fighter', 3),
('Officer', 4),
('Associate' ,12),
('Senior Associate' ,11),
('GM', 1);

INSERT INTO Levels (GuestId, ClassId, Date)
VALUES
(1,  2,  '2018-01-19'),
(1,  1,  '2018-01-19'),
(3,  3,  '2018-11-21'),
(6,  2,  '2018-12-14'),
(5,  4,  '2019-01-01'),
(4,  1,  '2019-03-11'),
(6,  4,  '2019-04-10'),
(6,  5,  '2019-05-12'),
(2,  6,  '2018-01-19'),
(1,  1,  '2018-01-19'),
(3,  3,  '2018-11-21'),
(6,  2,  '2018-12-14'),
(2,  6,  '2019-01-01'),
(7,  1,  '2019-03-11'),
(8,  4,  '2019-04-10'),
(7,  5,  '2019-05-12');


INSERT INTO ServiceStatuses(Name)
VALUES
('Actvie'),
('Inactive'),
('Out of stock'),
('Discontinued');


INSERT INTO Services (Name, StatusId, TavernId)
VALUES
('Pool', 2, 3),
('Weapon sharpening', 1, 2);


INSERT INTO Sales (ServiceId, GuestId, Price, Date, Amount, TavernId	)
VALUES
(1,  2, 20, '2018-01-19', 1000, 1),
(1,  3, 40, '2018-11-21', 2000, 4),
(2,  4, 60, '2018-12-14', 500, 3),
(2,  5, 80, '2019-01-01', 6000, 2),
(1,  4, 100, '2019-03-11', 500, 1),
(1,  2, 20, '2018-01-19', 100, 1),
(1,  3, 40, '2018-11-21', 2200, 4),
(2,  4, 60, '2014-12-14', 5000, 3),
(2,  5, 80, '2011-01-01', 60000, 2),
(1,  4, 100, '2011-03-11', 1500, 1),
(1,  2, 20, '2018-01-19', 100, 1),
(1,  3, 40, '2010-11-21', 200, 4),
(2,  4, 60, '2011-12-14', 50, 3),
(2,  5, 80, '2012-01-01', 6000, 2),
(1,  4, 100, '2014-03-11', 500, 1);

