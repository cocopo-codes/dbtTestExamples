{{
  config(
    materialized = "table"
  )
}}

with users as (

    select * from  {{ source('seed_db', 'games_users') }}
)

select * from users