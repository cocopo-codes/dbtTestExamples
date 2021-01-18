{{
  config(
    materialized = "view"
  )
}}

with game_log as (
	select 
		distinct username,
		sum(kills) as total_kills,
		sum(deaths) as total_deaths,
		sum(damage_done) as total_damage_done
	from {{ref('game_log_vw')}}
	group by username
),

user_info as (
    select
        username,
        date_joined
    from {{ref('user_data_vw')}}
),

join_all as (
    select *
    from user_info t1
    full outer join game_log t2
        on t1.username
    order by t2.username
)

select * from join_all