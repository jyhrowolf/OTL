/// @description Build
var gc = instance_find(o_game_controller, 0);
var current_player = players[active_player];
if(action == 0)
{
	action = 4;
	// spend influence
	current_player.civilization.influence_spent[3]++;
	current_player.civilization.influence--;
	current_player.calculate_influence_upkeep(0);
}
else if(action == 4 || action == -1)
{
	if(gc.busy == 0) // do not build
	{
		if(!action_taken)
		{
			current_player.civilization.influence_spent[3]--;
			current_player.civilization.influence++;
			current_player.calculate_influence_upkeep(0);
		}
		action = 0;
		gc.complete = 0;
		if(!action_taken)
			bottom_bar.my_buttons[6].image_index = 2; // button to pass
		else
			bottom_bar.my_buttons[6].image_index = 0; // button to end
	}
	else if(gc.busy >= 1) //build
	{
		gc.busy = 0;
		gc.alarm[4] = 1;
	}
}