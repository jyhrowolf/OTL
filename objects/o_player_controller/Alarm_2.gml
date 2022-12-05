/// @description Research
var gc = instance_find(o_game_controller, 0);
var current_player = players[active_player];
if(action == 0)
{
	action = 2;
	// spend influence
	current_player.civilization.influence_spent[1]++;
	current_player.civilization.influence--;
	current_player.calculate_influence_upkeep(0);
}
else if(action == 2 || action == -1)
{
	if(gc.busy == 0) // do not research
	{
		if(!action_taken)
		{
			current_player.civilization.influence_spent[1]--;
			current_player.civilization.influence++;
			current_player.calculate_influence_upkeep(0);
		}
		action = 0;
		gc.complete = 0;
		if(!action_taken)
			bottom_bar.my_buttons[6].image_index = 2; // button to pass
		else
			bottom_bar.my_buttons[6].image_index = 0; // button to pass
	}
	else if(gc.busy == 1)
	{
		if(!action_taken)
		{
			action_taken = true;
			bottom_bar.alarm[0] = 1; // flush bottom buttons
		}
		gc.complete--;
		if(gc.complete <= 0) // finish researching
		{
			action = 2;
			gc.busy = 0;
			bottom_bar.my_buttons[6].image_index = 0; // button to end
			
			var alert_research = instance_find(o_alert_research,0);
			instance_destroy(alert_research);
		}
	}
}