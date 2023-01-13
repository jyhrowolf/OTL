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
			if(i < array_length(my_buttons) - 2 - 4)
			{
				selected_button = i;
				cursor.hover_sprite = my_buttons[selected_button].upgrade_sprite;
				cursor.hover_index = my_buttons[selected_button].upgrade_index;
				cursor.hover_offset = [(my_buttons[selected_button].x - cursor.x) div 2,
										(my_buttons[selected_button].y - cursor.y) div 2];
			}
			else if (i < array_length(my_buttons) - 2)
			{
				selected_blueprint = i;
				alarm[3] = 1;
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
		selected_button = -1;
		selected_blueprint = -1;
	}
}