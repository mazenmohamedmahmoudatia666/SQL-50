SELECT COALESCE (MAX(num), null) AS num FROM myNumbers
WHERE num IN
(SELECT 
num
FROM MyNumbers 
GROUP BY num 
HAVING count(num) = 1 
ORDER BY num DESC)

