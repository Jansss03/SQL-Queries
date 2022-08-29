use MoviesDb
go

--select all movies
select*from Movies
--select all theatres
select*from theatre
--select all movies that are shown in theatre id = 1
select name from movies where id in (select movieid from movietheatre where theatreid=1)


--sort all movies that start with "I" in descending order
select*from movies where name like 'I%'  order by id,name desc
--second character n
select*from movies where name like'_n%'
--should start with b or d or i
select*from movies where name like 'b%' or name like 'd%' or name like 'i%'
select*from movies where name like'[bdi]%'
--get all theatres that show the movies{1,2,3}
select*from theatre where id in(select theatreid from movietheatre where movieid in (1,2,3))
select*from theatre t inner join movietheatre mt on t.id = mt.theatreid where mt.movieid in (1,2,3) 
--get all theates that show movies
select distinct  t.id , t.name ,t.totalscreens from theatre t left outer join movietheatre mt on t.id=mt.theatreid
--get all theatre details and movie details for a movie 1
select*from theatre where id in(select theatreid from movietheatre where movieid=1)
--get total count of theatres that show movies
select count(distinct t.id) as theatrecount from theatre t left outer join movietheatre mt on t.id=mt.theatreid
--get total theatre count per movie
select count(t.id) as theatrecount ,mt.movieid from theatre t
left outer join movietheatre mt on t.id=mt.theatreid group by mt.movieid
select count(t.Id) as theatrecount , m.name from 
	theatre t left outer join movietheatre mt on t.id=mt.theatreid 
	inner join movies m on mt.movieid = m.id
group by m.name
--get total movie count per theatre

select count(m.id) as moviecount,t.name from movies m left outer join movietheatre mt on m.id=mt.movieid inner join theatre t on mt.theatreid=t.id group by t.name

--get which movie is not shown in any theatres
select * from movies where id not in(select movieid from movietheatre)
--get all movies and theatres that show movies and do not show movies
select * from movies  cross join theatre
--get all theatre details and movie details for a movie 1
select t.name as theatrename ,m.name as moviename from theatre t full outer join movietheatre mt on t.id=mt.theatreid
                       full outer join movies m on m.id = mt.movieid
					   where m.id=1



