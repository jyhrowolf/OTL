/// @description Setup Basic Cruiser
event_inherited();

add_ship_part(o_ship_part_20,0); // source
add_ship_part(o_ship_part_10,3); // drive
add_ship_part(o_ship_part_00,1); // hull
add_ship_part(o_ship_part_30,2); // Computer
add_ship_part(o_ship_part_40,4); // Weapon

add_innate_part([7,1]); // base +1 iniative

update_ship_display();
// settup blueprint display
ship_parts_pos = [
				[81,-24],
				[81,-38],
				[88,-52],
				[74,-52],
				[95,-21],
				[67,-21]
				];