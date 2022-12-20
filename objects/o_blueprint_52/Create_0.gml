/// @description Setup Basic Dreadnought
event_inherited();

add_ship_part(o_ship_part_20,0); // source
add_ship_part(o_ship_part_10,1); // drive
add_ship_part(o_ship_part_00,6); // hull
add_ship_part(o_ship_part_00,3); // hull
add_ship_part(o_ship_part_30,7); // Computer
add_ship_part(o_ship_part_40,4); // Weapon
add_ship_part(o_ship_part_40,5); // Weapon

update_ship_display();
// settup blueprint display
ship_parts_pos = [
				[82,-37],
				[82,-51],
				[75,-23],
				[89,-23],
				[61,-19],
				[103,-19],
				[96,-47],
				[68,-47]
				];