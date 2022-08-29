select*from movietheatre
go

create trigger troninsert on movies
after insert
as
begin

declare @id int
declare @moviename nvarchar(max)
declare @msg varchar(max)

select @Id=id , @moviename=name from inserted
set @msg = 'movie entry inserted with movie name = ' + @moviename +'and Id=' +cast(@id as varchar)
+'at' +cast(GETDATE() as varchar)


INSERT INTO [dbo].[auditlog]
           ([id]
           ,[message])
     VALUES
           (Newid()
           ,@msg)



end

select*from movietheatre
go

alter trigger trdelete on movies
after delete
as 
begin


declare @id int
declare @msg varchar(max)

select @Id=id from deleted
set @msg = 'movie entry deleted with movie Id=' +cast(@id as varchar)
+'at' +cast(GETDATE() as varchar)


INSERT INTO [dbo].[auditlog]
           ([id]
           ,[message])
     VALUES
           (Newid()
           ,@msg)


end




select



end



select*from auditlog