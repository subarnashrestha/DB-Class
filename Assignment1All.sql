--DROP TABLE IF EXISTS

DROP TABLE IF EXISTS Taverns;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Roles;
DROP TABLE IF EXISTS BasementsRats;
DROP TABLE IF EXISTS Supplies
DROP TABLE IF EXISTS Inventory 
DROP TABLE IF EXISTS Received
DROP TABLE IF EXISTS Service 
DROP TABLE IF EXISTS ServiceStatus
DROP TABLE IF EXISTS Sales 

-- Taverns
CREATE TABLE Taverns 
(
Id			int IDENTITY PRIMARY KEY,
Name		varchar(250),
Location	int,
Ownerid		int
);

INSERT INTO Taverns (Name, Location, Ownerid)
VALUES
('Marlton Tavern', 1, 1),
('Town Tavern', 4, 12),
('Brewers Towne Tavern',3 , 10),
('Good Time Tavern', 2, 15),
('Park Tavern', 4, 1);

-- Location
CREATE TABLE Location 
(
Id			int IDENTITY PRIMARY KEY,
Name		varchar(50)
);

INSERT INTO Location (Name)
VALUES
('Marlton'),
('Berlin'),
('Haddon Township'),
('Philadelphia'),
('Lumberton'),
('Cherry Hill');


-- Users
CREATE TABLE Users 
(
Id			int IDENTITY PRIMARY KEY,
Name		varchar(50),
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

--- Roles
CREATE TABLE Roles
(
Id			tinyint	IDENTITY PRIMARY KEY,
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

--- Home Work

-- Supplies
CREATE TABLE Supplies 
(
Id			int IDENTITY PRIMARY KEY,
Name		varchar(50),
voloume 	int,
Unit		varchar(50)
);

INSERT INTO Supplies (Name, voloume, Unit)
VALUES
('Strong Ale', 4, 'Ounce'),
('Corona', 12,'Ounce'),
('Draft Beer', 1, 'Gallon'),
('Red Lable', 32, 'Ounce' ),
('Kendal Jackson', 750, 'ml'); 




-- Inventory
CREATE TABLE Inventory 
(
Id				int IDENTITY PRIMARY KEY,
SupplyId		int,
TravernsId		int,
Date			date,
CurrentCount	int
);

INSERT INTO Inventory (SupplyId, TravernsId, Date, CurrentCount)
VALUES
(1, 1,  '2018-01-11', 6400),
(4, 4,  '2018-11-24', 2320),
(1, 3,  '2019-02-18', 1060),
(3, 2,  '2019-04-21', 6303),
(2, 1,  '2019-04-14', 5130);


-- Received
CREATE TABLE Received 
(
Id				int IDENTITY PRIMARY KEY,
SupplyId		int,
TravernsId		int,
Cost			float,
Amount			float,
Date			date,
);

INSERT INTO Received (SupplyId, TravernsId, Cost, Amount, Date)
VALUES
(1, 1, 12, 1000, '2018-01-19'),
(1, 4, 8, 4000, '2018-11-21'),
(2, 5, 10, 2500, '2018-12-14'),
(2, 2, 20, 4000, '2019-01-01'),
(1, 1, 40, 6000,  '2019-03-11');



-- Service
CREATE TABLE Service 
(
Id					int IDENTITY PRIMARY KEY,
Name				varchar(50),
ServiceStatusId		int
);

INSERT INTO Service (Name, ServiceStatusId)
VALUES
('Pool', 2),
('Weapon sharpening', 1);



-- ServiceStatus
CREATE TABLE ServiceStatus 
(
Id					int IDENTITY PRIMARY KEY,
Status				varchar(50),
);

INSERT INTO ServiceStatus(Status)
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
Guest			varchar(50),
Price			float,
DatePurchased	date,
AmountPurchased	float,
TravernsId		int,
);

INSERT INTO Sales (ServiceId, Guest, Price, DatePurchased, AmountPurchased, TravernsId	)
VALUES
(1, 'Jhon', 20, '2018-01-19', 1000, 1),
(1, 'Bob',  30, '2018-11-21', 2000, 4),
(2, 'Cozy', 40, '2018-12-14', 500, 3),
(2, 'Joe',  25, '2019-01-01', 6000, 2),
(1, 'Mike', 90, '2019-03-11', 500, 1);




