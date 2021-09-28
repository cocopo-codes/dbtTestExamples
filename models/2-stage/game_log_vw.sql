with game_log as (

    select * from  {{ref('games')}}
)

select * from game_log