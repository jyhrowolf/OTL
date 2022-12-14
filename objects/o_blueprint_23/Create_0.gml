/// @description Setup Basic Starbase
event_inherited();

add_ship_part(o_ship_part_00,2); // hull
add_ship_part(o_ship_part_00,3); // hull
add_ship_part(o_ship_part_30,0); // Computer
add_ship_part(o_ship_part_40,1); // Weapon

add_innate_part([7,2]); // base +2 iniative
add_innate_part([3,1]); // base +1 computer
add_innate_part([2,5]); // base +5 source

update_ship_display();
// settup blueprint display
ship_parts_pos = [
				[82,-37],
				[96,-31],
				[96,-45],
				[68,-31],
				[68,-45]
				];