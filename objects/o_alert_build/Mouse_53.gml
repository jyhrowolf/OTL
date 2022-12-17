/// @description Click the Alert
if(global.mouse_state <= state)
{
	var m_x = device_mouse_x_to_gui(0);
	var m_y = device_mouse_y_to_gui(0);
	var clicked = false;
	for(var i = 0; i < array_length(my_buttons); i++)
	{
		if(position_meeting(m_x, m_y, my_buttons[i]))
		{
			clicked = true;
			if(i < array_length(my_buttons) - 2)
			{
				if(my_buttons[i].buyable)
					selected_blueprint = i;
				else
					clicked = false;
				break;
			}
			else if (i < array_length(my_buttons) - 1)
				alarm[0] = 1;
			else
				alarm[1] = 1;
			break;
		}
	}
	if(!clicked)
	{
		selected_blueprint = -1;
	}
}