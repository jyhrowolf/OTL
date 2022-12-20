/// @description Setup Basic Starbase
event_inherited();

add_ship_part(o_ship_part_00,2); // hull
add_ship_part(o_ship_part_00,3); // hull
add_ship_part(o_ship_part_30,0); // Computer
add_ship_part(o_ship_part_40,4); // Weapon
add_ship_part(o_ship_part_60,1); // shield

add_innate_part([7,5]); // base +5 iniative
add_innate_part([2,3]); // base +3 source

update_ship_display();
// settup blueprint display
ship_parts_pos = [
				[89,-32],
				[75,-32],
				[89,-46],
				[75,-46],
				[82,-18]
				];