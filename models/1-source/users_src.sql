{{
  config(
    materialized = "table"
  )
}}

with users_src as (

    select * from  {{ref('games_users')}}
)

select * from users_src