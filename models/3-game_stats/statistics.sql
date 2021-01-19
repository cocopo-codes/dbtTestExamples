{{
  config(
    materialized = "view"
  )
}}

with game_log as (
    select
		distinct username as username,
		sum(kills) as total_kills,
		sum(deaths) as total_deaths,
		sum(damage_done) as total_damage_done
	from {{ ref('game_log_vw') }} t2
	where t2.username is not null
	group by t2.username
),

users_info as (
 select username, date_joined, email
 from {{ ref('user_data_vw') }}
 group by username, date_joined, email
),

join_all as (
    select t1.username gamertag,
           t1.total_kills,
           t1.total_deaths,
           t1.total_damage_done,
           t2.date_joined,
           t2.email
    from game_log t1
    left join users_info t2 on t2.username = t1.username
)

select * from join_all