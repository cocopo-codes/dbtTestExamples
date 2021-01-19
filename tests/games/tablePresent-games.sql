-- A quick test to check that the table is present
select count(*) as row_count
	from {{ ref('game_log_vw')}}
	where username is not null
	having row_count <= 0