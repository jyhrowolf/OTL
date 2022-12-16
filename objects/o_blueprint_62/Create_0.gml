/// @description Setup Basic Dreadnought
event_inherited();

add_ship_part(o_ship_part_20,0); // source
add_ship_part(o_ship_part_10,1); // drive
add_ship_part(o_ship_part_00,3); // hull
add_ship_part(o_ship_part_00,5); // hull
add_ship_part(o_ship_part_30,6); // Computer
add_ship_part(o_ship_part_40,2); // Weapon
add_ship_part(o_ship_part_40,4); // Weapon
add_ship_part(o_ship_part_60,7); // Shield

add_innate_part([7,1]); // base +1 iniative
add_innate_part([2,3]); // base +3 source

update_ship_display();
// settup blueprint display
ship_parts_pos = [
				[89,-40],
				[89,-54],
				[103,-47],
				[103,-61],
				[61,-47],
				[61,-61],
				[75,-40],
				[75,-54]
				];