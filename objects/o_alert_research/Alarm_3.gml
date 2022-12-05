/// @description Cheapest research
if(variable == "cheapest")
{
	state = global.mouse_state;
	var min_cost = 16;
	for(var i = 0; i < array_length(my_buttons)-2; i++)
		if(current_civ.check_research(my_buttons[i].research))
			if(my_buttons[i].expected_cost <= min_cost)
			{
				min_cost = my_buttons[i].expected_cost;
				my_buttons[i].buyable = true;
			}
	show_debug_message("min: " +string(min_cost));
	for(var i = 0; i < array_length(my_buttons)-2; i++)
		if(my_buttons[i].expected_cost != min_cost)
			my_buttons[i].buyable = false;
}