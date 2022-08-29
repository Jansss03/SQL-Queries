declare @moviename nvarchar(max)
declare @theatrecount int

declare c1 cursor for


select m.name , count (mt.theatreid) as theatrecount from movies m left outer join movietheatre mt on
m.id= mt.movieid group by m.Name

open c1
fetch next from c1
into @moviename,@theatrecount

while @@fetch_status = 0
begin

if @theatrecount > 2
print @moviename +' is a super hit movie'
else if @theatrecount >=1
print @moviename + 'has average ratings'

else 
print @moviename + 'is a flop'
fetch next from c1
into @moviename,@theatrecount


end
close c1
deallocate c1

----using case instead of cursor
select top 2 m.name , case when count (mt.theatreid) > 2 then m.name +'is a superhit movie'
when count(mt.theatreid) >= 1 then m.name +'has average ratings'
else m.name +'is a flop movie'
end as movieverdict
from movies m left outer join movietheatre mt on
m.id= mt.movieid group by m.Name