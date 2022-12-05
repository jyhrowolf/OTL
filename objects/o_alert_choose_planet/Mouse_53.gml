/// @description Click the Alert
if(global.mouse_state <= state)
{
	var m_x = device_mouse_x_to_gui(0);
	var m_y = device_mouse_y_to_gui(0);

	for(var i = 0; i < array_length(my_buttons); i++)
		if(position_meeting(m_x, m_y, my_buttons[i]))
		{
			if(i < array_length(my_buttons)-2)
			{
				my_buttons[choice].highlighted = 0;
				my_buttons[choice].depth = -16;
				choice = i;
				my_buttons[i].highlighted = 1;
				my_buttons[choice].depth = -17;
			}
			else if (i < array_length(my_buttons)-1)
				alarm[0] = 1;
			else
				alarm[1] = 1;
			break;
		}
}