/// @description Setup Basic Cruiser
event_inherited();

add_ship_part(o_ship_part_20,0); // source
add_ship_part(o_ship_part_10,1); // drive
add_ship_part(o_ship_part_00,3); // hull
add_ship_part(o_ship_part_30,2); // Computer
add_ship_part(o_ship_part_40,4); // Weapon

add_innate_part([7,1]); // base +1 iniative

update_ship_display();
// settup blueprint display
ship_parts_pos = [
				[81,-37],
				[81,-51],
				[95,-48],
				[67,-48],
				[100,-34],
				[62,-34]
				];