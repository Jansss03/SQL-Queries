use MoviesDb
go

create view vw_movies as
select*from Movies

create procedure sp as
select*from theatre

create procedure sp_getnamesthatstartwithi as
select*from movies where name like 'I%'  order by id,name desc
go

create function fn_get ()
returns int
as
begin
return(select count(*)from movies)

end

--in how many theatres movie is running
--given movie id value = 1
create function fn_gettheatrecountformovie(@movieid int)
returns int
as
begin
return(select count(*) as theatrecount from Movietheatre where movieid=@movieid)
end


----executing above objects
--executing view
select*from vw_movies

--executing stored procedure
exec sp_getnamesthatstartwithi

--execute scalar function

select [dbo].[fn_get]()

select[dbo].[fn_gettheatrecountformovie](2)
--call both functions in one select statement
select [dbo].[fn_get]() output1,[dbo].[fn_gettheatrecountformovie](1) output2

--create a variable
declare @variable1 int 
set @variable1=2
select [dbo].[fn_get]() output1,[dbo].[fn_gettheatrecountformovie](@variable1) output2
go

--assign the value of a function output to a variable
alter function fn_getoutputs(@movieid int)
returns @result table(col1 int,col2 int)
as
begin

declare @output1 int
declare @output2 int
declare @variable1 int
set @variable1=@movieid


set @output1= (select [dbo].[fn_get]())
set @output2= (select[dbo].[fn_gettheatrecountformovie](@variable1))
insert into @result select @output1 o1 , @output2 o2
return
end

---execute functions that return a table
select * from [dbo].[fn_getoutputs](2)





