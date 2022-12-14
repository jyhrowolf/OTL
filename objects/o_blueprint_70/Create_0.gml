/// @description Setup Basic Pirate
event_inherited();

var in = 0;
if(global.neutrals_difficulty == 0) // 1 hull 1 computer 2 1 weapon 2 init
{
	add_ship_part(o_ship_part_00,in++); // hull
	add_ship_part(o_ship_part_30,in++); // computer
	add_ship_part(o_ship_part_40,in++); // weapon 
	add_ship_part(o_ship_part_40,in++); // weapon 

	add_innate_part([7,2]); // base +2 iniative
}
else if(global.neutrals_difficulty == 1) // 2 hull 1 computer 1 2 weapon 1 init
{
	add_ship_part(o_ship_part_00,in++); // hull
	add_ship_part(o_ship_part_00,in++); // hull
	add_ship_part(o_ship_part_30,in++); // computer
	add_ship_part(o_ship_part_41,in++); // weapon 

	add_innate_part([7,1]); // base +1 iniative
}
else
{
	add_ship_part(o_ship_part_00,in++); // hull
}