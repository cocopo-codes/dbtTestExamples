with game_log as (
    select
		distinct "username" as USERNAME,
		sum("kills") as TOTAL_KILLS,
		sum("deaths") as TOTAL_DEATHS,
		sum("damage_done") as TOTAL_DAMAGE_DONE
	from {{ ref('game_log_vw') }} t2
	where t2."username" is not null
	group by t2."username"
),

users_info as (
 select "username", "date_joined", "email"
 from {{ ref('user_data_vw') }}
 group by "username", "date_joined", "email"
),

join_all as (
    select t1.USERNAME as gamertag,
           t1.TOTAL_KILLS,
           t1.TOTAL_DEATHS,
           t1.TOTAL_DAMAGE_DONE,
           t2."date_joined",
           t2."email"
    from game_log t1
    left join users_info t2 on t2."username" = t1.USERNAME
)

select * from join_all