{{
  config(
    materialized = "view"
  )
}}

with game_log as (

    select * from  {{ref('games_src')}}
)

select * from game_log