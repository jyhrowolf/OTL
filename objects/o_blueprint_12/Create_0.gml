/// @description Setup Basic Dreadnought
event_inherited();

add_ship_part(o_ship_part_20,2); // source
add_ship_part(o_ship_part_10,3); // drive
add_ship_part(o_ship_part_00,6); // hull
add_ship_part(o_ship_part_00,7); // hull
add_ship_part(o_ship_part_30,1); // Computer
add_ship_part(o_ship_part_40,4); // Weapon
add_ship_part(o_ship_part_40,5); // Weapon

add_innate_part([2,1]); // base +1 power

update_ship_display();
// settup blueprint display
ship_parts_pos = [
				[82,-17],
				[82,-31],
				[82,-45],
				[82,-59],
				[96,-39],
				[68,-39],
				[105,-53],
				[59,-53]
				];