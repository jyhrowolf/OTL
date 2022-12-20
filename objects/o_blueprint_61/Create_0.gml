/// @description Setup Basic Cruiser
event_inherited();

add_ship_part(o_ship_part_20,0); // source
add_ship_part(o_ship_part_10,1); // drive
add_ship_part(o_ship_part_00,5); // hull
add_ship_part(o_ship_part_30,2); // Computer
add_ship_part(o_ship_part_40,4); // Weapon
add_ship_part(o_ship_part_60,3); // shield

add_innate_part([7,2]); // base +2 iniative
add_innate_part([2,2]); // base +2 source

update_ship_display();
// settup blueprint display
ship_parts_pos = [
				[81,-31],
				[81,-45],
				[95,-31],
				[67,-31],
				[88,-17],
				[74,-17]
				];