-- A quick test to check that the table is present
select count(*) as row_count
	from {{ref('user_data_vw')}}
	where USERNAME is not null
	having row_count <= 0