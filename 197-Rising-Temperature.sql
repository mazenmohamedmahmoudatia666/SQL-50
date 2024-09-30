SELECT w1.id
from Weather as w1
join Weather as w2
on date(w1.recordDate) = date(w2.recordDate) + interval  1 day 
where w1.temperature > w2.temperature;
