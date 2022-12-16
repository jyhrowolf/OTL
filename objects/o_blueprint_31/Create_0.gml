/// @description Setup Basic Cruiser
event_inherited();

add_ship_part(o_ship_part_20,0); // source
add_ship_part(o_ship_part_10,2); // drive
add_ship_part(o_ship_part_00,1); // hull
add_ship_part(o_ship_part_40,3); // Weapon

add_innate_part([3,1]); // base +1 computer
add_innate_part([2,2]); // base +2 source

update_ship_display();
// settup blueprint display
ship_parts_pos = [
				[81,-23],
				[81,-37],
				[81,-51],
				[95,-40],
				[67,-40]
				];