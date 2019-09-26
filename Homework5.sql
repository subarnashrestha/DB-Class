-- Homework 5
-- October 25, 2019
-- Subarna B. Shrestha

--Queries

--1
SELECT u.name AS 'users', r.Name AS 'roles' FROM users u
LEFT JOIN roles r ON u.RoleId = r.Id

--2
SELECT c.Name AS [Classes], COUNT(l.guestid) AS [Count of Guests] FROM Classes c
JOIN Levels l ON c.Id = l.ClassId
join Guests g ON l.GuestId = g.Id
GROUP BY c.Name

--3
SELECT g.name AS [Guest Name], c.Name AS [Class], c.Level,  
CASE WHEN (c.Level >= 1 and c.Level <=5) THEN 'Beginner (lvl 1-5)' 
	WHEN (c.Level > 5 and c.Level <=10) THEN 'Intermedaite (lvl 5-10)'
	WHEN (c.Level > 10) THEN 'Expert (lvl 10+)'
END AS Groups
FROM guests g
JOIN Levels l ON g.id = l.GuestId
JOIN Classes c ON l.ClassId = c.Id
ORDER BY g.name ASC

--4
DROP FUNCTION IF EXISTS levelReturnsGroup;

CREATE FUNCTION levelReturnsGroup(@level int)
RETURNS TABLE
AS
RETURN
(
SELECT DISTINCT c.Level,  
CASE WHEN (c.Level >= 1 and c.Level <=5) THEN 'Beginner (lvl 1-5)' 
	WHEN (c.Level > 5 and c.Level <=10) THEN 'Intermedaite (lvl 5-10)'
	WHEN (c.Level > 10) THEN 'Expert (lvl 10+)'
END AS Groups
FROM guests g
JOIN Levels l ON g.id = l.GuestId
JOIN Classes c ON l.ClassId = c.Id
WHERE c.Level = 3
);

-- TEST -->> SELECT * FROM levelReturnsGroup(3)

-- 5
IF OBJECT_ID (N'dbo.getOpenRoomsByDate', N'IF') IS NOT NULL
	DROP FUNCTION dbo.getOpenRoomsByDate;
GO  
CREATE FUNCTION dbo.getOpenRoomsByDate (@date Date)  
RETURNS TABLE  
AS  
RETURN   
(  
SELECT Rooms.Id, Room_Status.Name, Room_Stays.Date, Taverns.Name as [Tavern]
from Room_Stays
JOIN Rooms on Room_Stays.RoomId = Rooms.Id
JOIN Room_Status on Rooms.StatusId = Room_Status.Id
JOIN Taverns on Rooms.TavernId = Taverns.Id
WHERE Room_Status.Name = 'open' AND date = @date     
);  


-- TEST -->>  SELECT * FROM dbo.getOpenRoomsByDate ('2019-05-15')

-- 6
IF OBJECT_ID (N'dbo.getMinMaxPrice', N'IF') IS NOT NULL
	DROP FUNCTION dbo.getMinMaxPrice;
GO  
CREATE FUNCTION dbo.getMinMaxPrice (@min float, @max float)  
RETURNS TABLE  
AS  
RETURN   
(  
SELECT Rooms.Id, Taverns.Name AS [Tavern], Room_Stays.Rate
FROM Room_Stays
JOIN Rooms ON Room_Stays.RoomId = Rooms.Id
JOIN Room_Status ON Rooms.StatusId = Room_Status.Id
JOIN Taverns ON Rooms.TavernId = Taverns.Id
WHERE Room_Stays.Rate BETWEEN @min AND @max     
);  


-- TEST -->> SELECT * FROM dbo.getMinMaxPrice(100, 1000)
