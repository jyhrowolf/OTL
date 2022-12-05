/// @description Setup Basic Guardian
event_inherited();

var in = 0;
add_ship_part(o_ship_part_00,in++); // hull
add_ship_part(o_ship_part_00,in++); // hull
add_ship_part(o_ship_part_30,in++); // computer
add_ship_part(o_ship_part_40,in++); // weapon
add_ship_part(o_ship_part_40,in++); // weapon
add_ship_part(o_ship_part_40,in++); // weapon


add_innate_part([7,3]); // base +2 iniative