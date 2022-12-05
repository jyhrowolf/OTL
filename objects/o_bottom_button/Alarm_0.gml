/// @description Do Button Thing
var gc = instance_find(o_game_controller,0);
if(gc.busy == 0 && !gc.player_controller.action_taken)
{
	if(gc.player_controller.action == 0 || gc.player_controller.action == image_index)
	{
		var current_player = gc.player_controller.players[gc.player_controller.active_player];
		if(current_player.civilization.influence -1 >= 0)
		{
			gc.complete = current_player.civilization.influence_action[image_index - 1];
			gc.player_controller.alarm[image_index] = 1;
			gc.alarm[image_index] = 2;
		}
	}
}