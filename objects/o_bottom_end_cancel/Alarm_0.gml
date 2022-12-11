/// @description Do Button Thing
if(image_index == 0) // end turn
{
	var pc = instance_find(o_player_controller,0);
	pc.alarm[0] = 1;
}
else if(image_index == 1) // cancel
{
	var gc = instance_find(o_game_controller,0);
	if(gc.player_controller.action == 8)
	{
		var pc = instance_find(o_player_controller,0);
		pc.alarm[0] = 1;
	}
	else if(gc.player_controller.action != 0)
	{
		gc.player_controller.alarm[gc.player_controller.action] = 1;
		gc.alarm[gc.player_controller.action] = 2;
	}
	else
	{
		show_debug_message("how did you get here?");
		image_index = 0;
	}
}
else if(image_index == 2) // pass
{
	var pc = instance_find(o_player_controller,0);
	pc.alarm[11] = 1;
}
else if(image_index == 3) // battle
{
	var gc = instance_find(o_game_controller,0);

	gc.player_controller.alarm[8] = 1;
	gc.alarm[8] = 2;
}