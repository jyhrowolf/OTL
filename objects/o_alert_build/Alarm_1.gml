/// @description Delete button
if(variable == noone)
{
	var gc = instance_find(o_game_controller,0);
	gc.busy = 0;
	player_controller.alarm[4] = 1;
}
instance_destroy(self);