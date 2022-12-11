/// @description Setup Basic Cruiser
event_inherited();

add_ship_part(o_ship_part_20,0); // source
add_ship_part(o_ship_part_10,1); // drive
add_ship_part(o_ship_part_00,3); // hull
add_ship_part(o_ship_part_30,4); // Computer
add_ship_part(o_ship_part_40,2); // Weapon
add_ship_part(o_ship_part_60,5); // shield

add_innate_part([7,2]); // base +2 iniative
add_innate_part([2,2]); // base +2 source

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