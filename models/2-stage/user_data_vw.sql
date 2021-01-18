{{
  config(
    materialized = "view"
  )
}}

with user_data as (

    select * from  {{ref('users_src')}}
)

select * from user_data