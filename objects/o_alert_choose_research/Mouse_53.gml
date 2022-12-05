/// @description Click the Alert
if(global.mouse_state <= state)
{
	var m_x = device_mouse_x_to_gui(0);
	var m_y = device_mouse_y_to_gui(0);

	for(var i = 0; i < array_length(my_buttons); i++)
		if(position_meeting(m_x, m_y, my_buttons[i]))
		{
			if(i < array_length(my_buttons)-1)
				choice = i;
			else
				alarm[0] = 1;
			break;
		}
}