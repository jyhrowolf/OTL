/// @description Setup Basic Cruiser
event_inherited();

add_ship_part(o_ship_part_20,0); // source
add_ship_part(o_ship_part_10,1); // drive
add_ship_part(o_ship_part_00,3); // hull
add_ship_part(o_ship_part_30,5); // Computer
add_ship_part(o_ship_part_40,2); // Weapon

add_innate_part([7,1]); // base +1 iniative

update_ship_display();
// settup blueprint display
ship_parts_pos = [
				[81,-35],
				[81,-49],
				[95,-25],
				[95,-39],
				[67,-25],
				[67,-39]
				];