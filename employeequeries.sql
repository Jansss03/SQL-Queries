use [EmpDB.Data]
go

select *from Employees
select*from depart
select*from employees where Deptid=101
select*from employees where deptname like '%tax%'
select count(id) as empcount,deptid  from employees group by Deptid
select*from Employees where salary > 200000
select count(Name) as emplcount,deptname from employees group by deptname

select count(id) as emplocount,deptid  from employees where deptid=101 group by Deptid 


Select*from employees where deptname is null
select*from Employees where managerid is not null
select e.name,r.Name as managername from employees e join Employees r on e.managerid=r.ID