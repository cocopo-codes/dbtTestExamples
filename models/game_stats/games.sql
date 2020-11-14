with games as (

    select * from  {{ source('seed_db', 'games_numbers') }}
)

select * from games