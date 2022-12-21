/// @description Combat
var gc = instance_find(o_game_controller, 0);

if(action == 0)
{
	action = 8;
}
else if(action == 8)
{
	gc.busy = 1;
	gc.alarm[8] = 1;
}