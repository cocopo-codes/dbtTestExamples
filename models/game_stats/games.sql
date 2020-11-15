{{
  config(
    materialized = "table"
  )
}}

with games as (

    select * from  {{ source('seed_db', 'game_log') }}
)

select * from games