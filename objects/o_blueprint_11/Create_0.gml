/// @description Setup Basic Cruiser
event_inherited();

add_ship_part(o_ship_part_20,2); // source
add_ship_part(o_ship_part_10,3); // drive
add_ship_part(o_ship_part_00,1); // hull
add_ship_part(o_ship_part_30,0); // Computer
add_ship_part(o_ship_part_40,4); // Weapon

add_innate_part([7,1]); // base +1 iniative
add_innate_part([2,1]); // base +1 power

update_ship_display();
// settup blueprint display
ship_parts_pos = [
				[81,-17],
				[81,-31],
				[81,-45],
				[81,-59],
				[95,-52],
				[67,-52]
				];