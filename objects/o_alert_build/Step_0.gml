/// @description Handle hover
if(global.mouse_state <= state)
{
	var m_x = device_mouse_x_to_gui(0);
	var m_y = device_mouse_y_to_gui(0);
	var hov = false;
	for(var i = 0; i < array_length(my_buttons); i++)
	{
		if(position_meeting(m_x, m_y, my_buttons[i]))
		{
			my_buttons[i].image_alpha = 0.8;
			my_buttons[i].depth = -17;
			if(i < array_length(my_buttons) - 2)
			{
				hov = true;
				blueprint_name = my_buttons[i].blueprint_name;
				my_buttons[i].hovered = true;
			}
		}
		else 
		{
			if(i < array_length(my_buttons) - 2)
			{
				if(current_civ.buildable[i] == 1)
					my_buttons[i].image_alpha = 1.0;
				else
					my_buttons[i].image_alpha = 0.6;
			}
			else
				my_buttons[i].image_alpha = 1.0;
			my_buttons[i].depth = -16;
			my_buttons[i].hovered = false;
		}
	}
	if(!hov)
	{
		if(selected_blueprint != -1)
		{
			blueprint_name = my_buttons[selected_blueprint].blueprint_name;
			my_buttons[selected_blueprint].hovered = true;
		}
		else
		{
			blueprint_name = "";
		}
	}
}