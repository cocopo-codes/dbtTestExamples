with games as (

    select * from  {{ref('game_log')}}
)

select * from games