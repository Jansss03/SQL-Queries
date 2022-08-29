use [EmpDB.Data]
go


create view vw_employees as
select*from Employees
go

create view vw_department as
select*from depart

create procedure sp_empwithdeptid as
select*from employees where Deptid=101

create procedure sp_empwithdepttax as
select*from employees where deptname like '%tax%'

create function fn_getempcountfordepid()
returns @result  table (col1 int, col2 int)
as
begin

insert into @result select count(id) as empcount,deptid  from employees group by Deptid
return
end
go

create function fn_depname()
returns nvarchar
as
begin
return(Select name from employees where deptname is null)
end




