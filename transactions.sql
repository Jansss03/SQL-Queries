create procedure sp_insertmovie
@Name nvarchar (max),
@Director nvarchar (max),
@Budget float
as
begin

INSERT INTO [dbo].[movies]
           ([Name]
           ,[Director]
           ,[Budget])
     VALUES
           (@Name,
		   @Director,
		   @Budget)
print 'The value for movieid is : '+ cast( @@Identity as varchar)
end
GO



exec sp_insertmovie 'gangubai' , 'slb' , 1234567


create procedure sp_updatemovie

@Id int,
@Name nvarchar (max),
@Director nvarchar (max),
@Budget float
as
begin


UPDATE [dbo].[movies]
   SET [Name] = @Name
      ,[Director] =@Director
      ,[Budget] = @Budget
	  where id = @Id
end
GO


exec sp_updatemovie 1 , 'endgame' , 'russo' , 34567

alter procedure sp_deletemovie
@Id int
as
begin

DELETE FROM [dbo].[movies]
      WHERE id=@Id
	  end
GO

exec sp_deletemovie 8


--------------




create procedure sp_deleteusingtransaction
@Id int
as
begin
begin transaction t1
DELETE FROM [dbo].[Movietheatre]
      WHERE movieid = @Id

 DELETE FROM [dbo].[movies]
      WHERE id = @Id

	  print 'value of @error=' +cast(@@error as varchar)

	  commit transaction t1
	  end

	  exec sp_deleteusingtransaction 5


create procedure sp_insertusingtransaction
@movieid int,
@theatreid int,
@Name nvarchar,
@Director nvarchar,
@Budget float
as
begin
begin transaction t1

INSERT INTO [dbo].[movies]
           ([Name],
		   [Director],
		   [Budget])
     VALUES
           (@Name,
		   @Director,
		   @Budget)



INSERT INTO [dbo].[Movietheatre]
           ([movieid]
           ,[theatreid])
     VALUES
           (@movieid,
		   @theatreid)

commit transaction t1
 end



		   
GO





