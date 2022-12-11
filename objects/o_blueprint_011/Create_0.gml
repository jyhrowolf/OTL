/// @description Setup Basic Cruiser
event_inherited();

add_ship_part(o_ship_part_20,0); // source
add_ship_part(o_ship_part_10,1); // drive
add_ship_part(o_ship_part_00,3); // hull
add_ship_part(o_ship_part_30,4); // Computer
add_ship_part(o_ship_part_40,2); // Weapon

add_innate_part([7,1]); // base +1 iniative
add_innate_part([2,1]); // base +1 power

update_ship_display();
// settup blueprint display
ship_parts_pos = [
				[81,-37],
				[81,-51],
				[95,-44],
				[95,-58],
				[67,-44],
				[67,-58]
				];