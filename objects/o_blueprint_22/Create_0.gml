/// @description Setup Basic Dreadnought
event_inherited();

add_ship_part(o_ship_part_20,0); // source
add_ship_part(o_ship_part_10,3); // drive
add_ship_part(o_ship_part_00,1); // hull
add_ship_part(o_ship_part_00,2); // hull
add_ship_part(o_ship_part_30,6); // Computer
add_ship_part(o_ship_part_40,4); // Weapon
add_ship_part(o_ship_part_40,5); // Weapon

update_ship_display();
// settup blueprint display
ship_parts_pos = [
				[82,-17],
				[82,-31],
				[82,-45],
				[82,-59],
				[96,-33],
				[68,-33],
				[96,-57],
				[68,-57]
				];