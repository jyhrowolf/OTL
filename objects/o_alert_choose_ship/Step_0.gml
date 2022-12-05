/// @description Handle hover
if(global.mouse_state <= state)
{
	var m_x = device_mouse_x_to_gui(0);
	var m_y = device_mouse_y_to_gui(0);
	var hov = false;
	for(var i = 0; i < array_length(my_buttons); i++)
		if(position_meeting(m_x, m_y, my_buttons[i]))
		{
			hov = true;
			my_buttons[i].image_alpha = 0.8;
			if(i < array_length(my_buttons) - 2)
				ship_name = my_buttons[i].ship_name;
		}
		else
		{
			my_buttons[i].image_alpha = 1.0;
		}
	if(!hov)
		if(selected_button != -1)
		{
			if(selected_button < array_length(my_buttons) - 2)
				ship_name = my_buttons[selected_button].ship_name;
		}
		else
		{
			ship_name = "";
		}
}