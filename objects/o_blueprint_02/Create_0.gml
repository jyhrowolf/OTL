/// @description Setup Basic Center
event_inherited();

var in = 0;
if(global.neutrals_difficulty == 0) // 7 hull 2 computer 4 1 weapon 0 init
{
	add_ship_part(o_ship_part_00,in++); // hull
	add_ship_part(o_ship_part_00,in++); // hull
	add_ship_part(o_ship_part_00,in++); // hull
	add_ship_part(o_ship_part_00,in++); // hull
	add_ship_part(o_ship_part_00,in++); // hull
	add_ship_part(o_ship_part_00,in++); // hull
	add_ship_part(o_ship_part_00,in++); // hull
	add_ship_part(o_ship_part_30,in++); // computer
	add_ship_part(o_ship_part_30,in++); // computer
	add_ship_part(o_ship_part_40,in++); // weapon
	add_ship_part(o_ship_part_40,in++); // weapon
	add_ship_part(o_ship_part_40,in++); // weapon
	add_ship_part(o_ship_part_40,in++); // weapon
}
else if(global.neutrals_difficulty == 1) // 3 hull 2 computer 4 1 missile 1 4 weapon 2 init
{
	add_ship_part(o_ship_part_00,in++); // hull
	add_ship_part(o_ship_part_00,in++); // hull
	add_ship_part(o_ship_part_00,in++); // hull
	add_ship_part(o_ship_part_30,in++); // computer
	add_ship_part(o_ship_part_30,in++); // computer
	add_ship_part(o_ship_part_51,in++); // weapon
	add_ship_part(o_ship_part_51,in++); // weapon
	add_ship_part(o_ship_part_42,in++); // weapon

	add_innate_part([7,2]); // base +1 iniative
}
else
{
	add_ship_part(o_ship_part_00,in++); // hull
}