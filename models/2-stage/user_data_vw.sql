{{
  config(
    materialized = "view"
  )
}}

with user_data as (

    select * from  {{ref('users')}}
)

select * from user_data