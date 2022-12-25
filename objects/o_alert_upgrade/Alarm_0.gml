/// @description Yes button
if(variable == noone)
{
	var gc = instance_find(o_game_controller,0);
	if(changes <= gc.complete)
	{
		for(var i = 0; i < array_length(available_blueprints); i++)
		{
			var index = array_length(my_buttons)-2-4+i;
			available_blueprints[i].display_to_blueprint(my_buttons[index]);
			my_buttons[index].settup_blueprint(available_blueprints[i]);
			my_buttons[index].calculate_changes();
		}
	
		gc.complete -= changes;
		changes = 0;
		for(var i = 0; i < array_length(available_blueprints); i++)
		{
			changes += my_buttons[array_length(my_buttons)-3-i].changes;
		}
	
		gc.busy = 1;
		player_controller.alarm[3] = 1;
	}
}
else if(variable == "rare")
{
	if(selected_blueprint != -1)
	{
		available_blueprints[selected_blueprint-(array_length(my_buttons)-2-4)].display_to_blueprint(my_buttons[selected_blueprint]);
	}
	instance_destroy(self);
}