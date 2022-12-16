/// @description Setup Basic Starbase
event_inherited();

add_ship_part(o_ship_part_00,2); // hull
add_ship_part(o_ship_part_00,4); // hull
add_ship_part(o_ship_part_30,0); // Computer
add_ship_part(o_ship_part_40,1); // Weapon

add_innate_part([7,4]); // base +4 iniative
add_innate_part([2,3]); // base +3 source

update_ship_display();
// settup blueprint display
ship_parts_pos = [
				[82,-37],
				[96,-31],
				[96,-45],
				[68,-31],
				[68,-45]
				];