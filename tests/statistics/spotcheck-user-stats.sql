-- Spotchecking a user's statistics to make sure nothing's changed historically on their account

select total_damage_done
	from {{ ref('statistics')}}
	where username = 'horsegirl'
	and total_damage_done < 1800