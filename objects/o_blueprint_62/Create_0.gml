/// @description Setup Basic Dreadnought
event_inherited();

add_ship_part(o_ship_part_20,0); // source
add_ship_part(o_ship_part_10,1); // drive
add_ship_part(o_ship_part_00,6); // hull
add_ship_part(o_ship_part_00,7); // hull
add_ship_part(o_ship_part_30,4); // Computer
add_ship_part(o_ship_part_40,2); // Weapon
add_ship_part(o_ship_part_40,3); // Weapon
add_ship_part(o_ship_part_60,5); // Shield

add_innate_part([7,1]); // base +1 iniative
add_innate_part([2,3]); // base +3 source

update_ship_display();
// settup blueprint display
ship_parts_pos = [
				[82,-27],
				[82,-55],
				[89,-13],
				[75,-13],
				[89,-41],
				[75,-41],
				[96,-59],
				[68,-59]
				];