/// @description Setup Basic interceptor
event_inherited();

add_ship_part(o_ship_part_20,0); // source
add_ship_part(o_ship_part_10,1); // drive
add_ship_part(o_ship_part_40,2); // weapon

add_innate_part([7,2]); // base +2 iniative
add_innate_part([2,1]); // base +1 power

update_ship_display();
// settup blueprint display
ship_parts_pos = [
				[81,-34],
				[81,-48],
				[95,-52],
				[67,-52]
				];
