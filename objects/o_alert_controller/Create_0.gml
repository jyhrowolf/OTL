/// @description Settup variables
next_alert = function(variable)
{
	var gc = instance_find(o_game_controller,0);
	var pc = gc.player_controller;
	
	if(array_length(alerts) > 0)
	{
		queue++;
		if(current_action == 0)
			current_action = pc.action;
		pc.action = -1;
		var alert = array_pop(alerts);
		var a = instance_create_layer(0,0,"GUI",alert);
		
		a.variable = variable;
		if(variable != noone)
			a.do_function(variable);
	}
	else if(queue > 0)
	{
		queue--;
		global.mouse_state--;
	}
	if(queue == 0)
	{
		show_debug_message("PC: " + string(pc.action)+" CA: " + string(current_action));
		if(pc.action == current_action)
			pc.action = 0;
		else
			pc.action = current_action;
		global.mouse_state = 0; // reset mouse to map
		current_action = 0;
	}
}
