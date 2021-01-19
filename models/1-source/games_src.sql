{{
  config(
    materialized = "table"
  )
}}

with games_src as (

    select * from  {{ref('game_log')}}
)

select * from games_src