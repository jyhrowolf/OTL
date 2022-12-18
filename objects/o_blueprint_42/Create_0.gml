/// @description Setup Basic Dreadnought
event_inherited();

add_ship_part(o_ship_part_20,0); // source
add_ship_part(o_ship_part_10,1); // drive
add_ship_part(o_ship_part_00,2); // hull
add_ship_part(o_ship_part_00,3); // hull
add_ship_part(o_ship_part_30,4); // Computer
add_ship_part(o_ship_part_40,6); // Weapon
add_ship_part(o_ship_part_40,7); // Weapon

update_ship_display();
// settup blueprint display
ship_parts_pos = [
				[82,-42],
				[82,-56],
				[96,-53],
				[68,-53],
				[110,-47],
				[54,-47],
				[107,-33],
				[57,-33]
				];