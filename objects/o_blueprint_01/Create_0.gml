/// @description Setup Basic Guardian
event_inherited();

var in = 0;
if(global.neutrals_difficulty == 0) // 2 hull 2 computer 3 1 weapon 3 init
{
	add_ship_part(o_ship_part_00,in++); // hull
	add_ship_part(o_ship_part_00,in++); // hull
	add_ship_part(o_ship_part_30,in++); // computer
	add_ship_part(o_ship_part_30,in++); // computer
	add_ship_part(o_ship_part_40,in++); // weapon
	add_ship_part(o_ship_part_40,in++); // weapon
	add_ship_part(o_ship_part_40,in++); // weapon

	add_innate_part([7,3]); // base +3 iniative
}
else if(global.neutrals_difficulty == 1) // 3 hull 1 computer 2 2 missile 1 4 weapon 1 init
{
	add_ship_part(o_ship_part_00,in++); // hull
	add_ship_part(o_ship_part_00,in++); // hull
	add_ship_part(o_ship_part_00,in++); // hull
	add_ship_part(o_ship_part_30,in++); // computer
	add_ship_part(o_ship_part_50,in++); // weapon
	add_ship_part(o_ship_part_42,in++); // weapon

	add_innate_part([7,1]); // base +1 iniative
}
else
{
	add_ship_part(o_ship_part_00,in++); // hull
}