-- 1 --
create procedure AllGuests @className varchar(50)
as
begin
select g.Name, c.Name, c.Level from Classes c
join Levels l on c.id = l.ClassId
join Guests g on l.GuestId = g.id
where c.Name = @className
end

-- Test1 ->>
exec AllGuests @className = "Manager"

-- 2 --
create procedure TotalSpentOnServices @GuestId varchar(50)
as
begin
select g.Id, sum(s.Amount) from guests g
join Sales s on g.id = s.GuestId
where GuestId = @GuestId
group by g.Id
end

-- Test2 ->>
exec TotalSpentOnServices @GuestId = 4


-- 3 --
create procedure LevelHighLow 
(
 @levelLow as int = 0,
 @levelHigh as int = 99
)
as
begin
select g.Name, c.Name, c.Level from Classes c
join Levels l on c.id = l.ClassId
join Guests g on l.GuestId = g.id
where c.Level <= @levelLow or
	 c.Level >= @levelHigh
end

-- Test2 ->>
exec LevelHighLow @levelHigh =10
exec LevelHighLow @levelLow =10

-- 4 --
create procedure DeleteTavern @Name varchar(50)
as
begin
BEGIN Transaction
delete from Taverns where Name=@Name
Rollback
end

-- Test4 ->>
exec  DeleteTavern @Name='Marlton Tavern'


-- 5 --
create trigger DeleteAllTavernInfo
on Taverns
after delete
as
begin
begin transaction
delete from Rooms where TavernId = (select top 1 id from deleted);
delete from Services where TavernId = (select top 1 id from deleted);
delete from Received where TavernId = (select top 1 id from deleted);
delete from Counts where TavernId = (select top 1 id from deleted);
rollback
end

-- Test5 ->>
delete from Taverns where Name='Marlton Tavern'

-- 6 & 7 help please!
