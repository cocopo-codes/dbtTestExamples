with users as (

    select * from  {{ref('games_users')}}
)

select * from users