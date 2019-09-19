-- Homework 3
-- September 19th, 2019
-- Subarna B. Shrestha


--DROP TABLE IF EXISTS

DROP TABLE IF EXISTS Rooms
DROP TABLE IF EXISTS Guests 
DROP TABLE IF EXISTS Classes


-- CREATE TABLE


CREATE TABLE Rooms 
(
Id			int IDENTITY PRIMARY KEY,
RoomNumber	int,
TavernId	int,
Status		int,
GuestId		int,
Rate		decimal(18, 2),
Sales		decimal(18, 2),
StayedDate	datetime

);

INSERT INTO Rooms (RoomNumber, TavernId, Status, GuestId, Rate, Sales, StayedDate)
VALUES
(1, 1, 1, 1,  99,  2000, '2018-01-12'),
(2, 2, 3, 5,  199, 4000, '2018-03-11'),
(3, 4, 6, 3,  299, 400,  '2018-02-10'),
(4, 5, 7, 2,  399, 500,  '2019-03-10'),
(5, 6, 1, 6,  99,  900,  '2019-04-12'),
(6, 7, 7, 8,  199, 2200, '2019-05-13');



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
('Mike',	'Online Booking',	'2019-03-11', '2018-01-19', 1),
('Alex',	'Extended_Stay',	'1996-01-19', '1996-01-19', 1),
('Linda',	'Regular Customer',	'1980-11-21', '1980-01-19', 4),
('Bob',		'Online booking',	'1975-12-14', '1975-01-19', 3),
('Tom',		'Regular Customer',	'1999-01-01', '1999-01-19', 2),
('Mike',	'Online Booking',	'1920-03-11', '1020-01-19', 1);


--Classes
CREATE TABLE Classes 
(
Id			smallint IDENTITY PRIMARY KEY,
Name		varchar(50),
Level		int
);

INSERT INTO Classes(Name, Level)
VALUES
('Manager', '1'),
('fighter', '3'),
('Officer', '5'),
('Associate4' ,'4'),
('Associate5' ,'5'),
('Associate6' ,'6'),
('Associate7' ,'7'),
('Associate12' ,'12');



-- 2
SELECT * FROM Guests WHERE BIRTHDATE <  '2000-01-01'

-- 3
SELECT * FROM ROOMS WHERE RATE > 100


-- 4
SELECT DISTINCT Name FROM Guests;

-- 5
SELECT * FROM Guests
ORDER BY Name ASC

--6
SELECT TOP 10  *  FROM ROOMS
ORDER BY SALES DESC

-- 7 and 9 could not solve.


-- 8
SELECT (CASE WHEN Level in (1,2,3,4,5) THEN 'LVL 1-5'
			 WHEN Level in (6,7,8,910) THEN 'LVL 6-10'
			 ELSE 'OTHERS'
		END) as RoleLEVEL
		FROM CLASSES;
--9


