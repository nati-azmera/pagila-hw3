/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */


with cte as (
select DISTINCT actor.actor_id
from actor 
join film_actor using (actor_id)
where film_id in (
select film_id
from film_actor
join actor using (actor_id)
where last_name = 'BACALL'
)
and last_name != 'BACALL'
order by 1
),

cte2 as(
select film_id
from film
join film_actor using (film_id)
join actor using (actor_id)
where actor.actor_id in (select actor_id from cte)
)
select distinct first_name || ' ' || last_name as "Actor Name"
from actor
join film_actor using (actor_id)
join film using (film_id)
where film.film_id in (select * from cte2) and actor.actor_id not in (select * from cte) and last_name != 'BACALL'
order by 1;
