SELECT  s.user_id ,
 round(count(action) filter(where action = 'confirmed') /  count(*):: numeric , 2)  as confirmation_rate

 from  
 Signups as s 
 left join Confirmations as c on s.user_id = c.user_id

 group by s.user_id

