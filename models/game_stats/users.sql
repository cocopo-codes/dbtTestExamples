with users as (

    select * from  {{ source('seed_db', 'users') }}
)

select * from users