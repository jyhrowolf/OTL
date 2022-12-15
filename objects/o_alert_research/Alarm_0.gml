/// @description Yes button
if(selected_button > -1)
{
	if(my_buttons[selected_button].buyable)
	{
		var s = object_get_name(my_buttons[selected_button].research.object_index);
		var research_trial = instance_create_layer(0,0,"GUI",asset_get_index(s));
		if(current_civ.check_research(research_trial) && variable == noone)
		{
			if(research_trial.class < 3) // its not a rare research
			{
				current_civ.calculate_resource(1,-my_buttons[selected_button].expected_cost);
				current_civ.add_research(research_trial);
				var research_controller = instance_find(o_research_controller,0);
				research_controller.delete_research(research_trial);
		
				instance_destroy(my_buttons[selected_button]);
				array_delete(my_buttons,selected_button,1);
			
				var gc = instance_find(o_game_controller,0);
				gc.busy = 1;
				player_controller.alarm[2] = 1;
				alarm[2] = 1;
			}
			else
			{
				var ac = instance_find(o_alert_controller,0);
				array_push(ac.alerts,o_alert_choose_research);
				show_debug_message("CHOOSE RARE")
				ac.next_alert(research_trial);
				
				instance_destroy(my_buttons[selected_button]);
				array_delete(my_buttons,selected_button,1);
				selected_button = -1;
			}
		}
		else if(variable == "cheapest")
		{
			current_civ.add_research(research_trial);
			var research_controller = instance_find(o_research_controller,0);
			research_controller.delete_research(research_trial);
		
			instance_destroy(my_buttons[selected_button]);
			array_delete(my_buttons,selected_button,1);
			instance_destroy(self);
		}
	}
}