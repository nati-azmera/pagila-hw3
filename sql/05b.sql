/*
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 */




select f1.title
from film f1
join film_actor fa1 using (film_id)
join film_actor fa2 using (actor_id)
join film f2 on fa2.film_id = f2.film_id
where f2.title = 'AMERICAN CIRCUS'
group by 1
having count(*) >= 2
order by 1
