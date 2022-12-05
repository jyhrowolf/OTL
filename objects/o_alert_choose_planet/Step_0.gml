/// @description Handle hover
if(global.mouse_state <= state)
{
	var m_x = device_mouse_x_to_gui(0);
	var m_y = device_mouse_y_to_gui(0);
	for(var i = 0; i < array_length(my_buttons); i++)
		if(position_meeting(m_x, m_y, my_buttons[i]))
		{
			my_buttons[i].image_alpha = 0.8;
		}
		else
		{
			my_buttons[i].image_alpha = 1.0;
		}
}