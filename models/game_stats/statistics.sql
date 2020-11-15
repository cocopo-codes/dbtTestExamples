{{
  config(
    materialized = "table"
  )
}}

with log as (
	select 
		distinct username,
		sum(kills) as total_kills,
		sum(deaths) as total_deaths,
		sum(damage_done) as total_damage_done

	from postgres.games

	group by username

)

select 
	users.username,
	users.date_joined,
	users.email,
	log.total_kills,
	log.total_deaths,
	log.total_damage_done

from postgres.users

left join log using (username)