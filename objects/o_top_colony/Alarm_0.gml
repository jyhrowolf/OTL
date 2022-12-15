/// @description Do Button Thing
show_debug_message("COLONIZE");
var gc = instance_find(o_game_controller,0);
if(gc.busy == 0)
{
	if(gc.player_controller.action == 0)
	{
		gc.complete = gc.player_controller.players[gc.player_controller.active_player].civilization.colony;
		gc.player_controller.alarm[7] = 1;
		gc.alarm[7] = 2;
	}
	else if(gc.player_controller.action == 8)
	{
		gc.complete = gc.player_controller.players[gc.player_controller.active_player].civilization.colony;
		gc.player_controller.alarm[7] = 1;
		gc.alarm[7] = 2;
	}
	
}