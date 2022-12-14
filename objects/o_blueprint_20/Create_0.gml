/// @description Setup Basic interceptor
event_inherited();

add_ship_part(o_ship_part_20,0); // source
add_ship_part(o_ship_part_10,1); // drive
add_ship_part(o_ship_part_40,2); // weapon

add_innate_part([3,1]); // base +1 computer
add_innate_part([2,2]); // base +2 source

update_ship_display();
// settup blueprint display
ship_parts_pos = [
				[81,-25],
				[74,-39],
				[88,-39]
				];
