/// @description Upgrade
var gc = instance_find(o_game_controller, 0);
var current_player = players[active_player];
if(action == 0)
{
	action = 3;
	// spend influence
	current_player.civilization.influence_spent[2]++;
	current_player.civilization.influence--;
	current_player.calculate_influence_upkeep(0);
}
else if(action == 3 || action == -1)
{
	if(gc.busy == 0) // do not upgrade
	{
		if(!action_taken)
		{
			current_player.civilization.influence_spent[2]--;
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
	else if(gc.busy == 1) //finish
	{
		if(!action_taken)
		{
			action_taken = true;
			bottom_bar.alarm[0] = 1; // flush bottom buttons
		}
		if(gc.complete <= 0) // finish upgrading
		{
			action = 3;
			gc.busy = 0;
			bottom_bar.my_buttons[6].image_index = 0; // button to end
			
			var alert_upgrade = instance_find(o_alert_upgrade,0);
			instance_destroy(alert_upgrade);
		}
	}
}