/// @description Handle hover
if(global.mouse_state <= state)
{
	var hov = false;
	var m_x = device_mouse_x_to_gui(0);
	var m_y = device_mouse_y_to_gui(0);
	for(var i = 0; i < array_length(my_buttons); i++)
	{
		if(position_meeting(m_x, m_y, my_buttons[i]))
		{
			my_buttons[i].image_alpha = 0.8;
			my_buttons[i].depth = -17;
			if(i < array_length(my_buttons) - 2)
			{
				hovered_button = i;
				research_name = my_buttons[i].research_name;
				expected_cost = my_buttons[i].expected_cost;
				hov = true;
			}
		}
		else
		{
			my_buttons[i].image_alpha = 1.0;
			my_buttons[i].depth = -16;
		}
	}
	if(!hov)
	{
		hovered_button = -1;
		if(selected_button != -1 && instance_exists(my_buttons[selected_button]))
		{
			research_name = my_buttons[selected_button].research_name;
			expected_cost = my_buttons[selected_button].expected_cost;
		}
		else
		{
			research_name = "";
			expected_cost = 0;
		}
	}
}