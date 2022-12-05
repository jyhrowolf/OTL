/// @description Handle hover
if(global.mouse_state <= state)
{
	var m_x = device_mouse_x_to_gui(0);
	var m_y = device_mouse_y_to_gui(0);
	var hov = false;
	for(var i = 0; i < array_length(my_buttons); i++)
	{
		if(i >= array_length(my_buttons) - 2 || i < array_length(my_buttons) - 2 - 4)
		{
			if(position_meeting(m_x, m_y, my_buttons[i]))
			{
				my_buttons[i].image_alpha = 0.8;
				my_buttons[i].depth = -17;
				if(i < array_length(my_buttons) - 2 - 4)
				{
					hov = true;
					upgrade_name = my_buttons[i].upgrade_name;
					equipment = my_buttons[i].equipment;
				}
			}
			else 
			{
				my_buttons[i].image_alpha = 1.0;
				my_buttons[i].depth = -16;
			}
		}
		else if(position_meeting(m_x, m_y, my_buttons[i]))
			my_buttons[i].hovered = true;
		else
			my_buttons[i].hovered = false;
	}
	if(!hov)
	{
		if(selected_button != -1)
		{
			upgrade_name = my_buttons[selected_button].upgrade_name;
			equipment = my_buttons[selected_button].equipment;
		}
		else
		{
			upgrade_name = "";
			equipment = [];
		}
	}
}