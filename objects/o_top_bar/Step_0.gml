/// @description Hover capture
var m_x = device_mouse_x_to_gui(0);
var m_y = device_mouse_y_to_gui(0);
if(global.mouse_state <= 1)
{
	if((position_meeting(m_x, m_y, my_buttons[0]) || position_meeting(m_x, m_y, my_buttons[1])) || position_meeting(m_x, m_y, bottom_bar))
	{
		global.mouse_state = 1;
		for(var i = 0; i < array_length(my_buttons); i++)
		{
			if(position_meeting(m_x, m_y, my_buttons[i]))
				my_buttons[i].image_alpha = 0.8;
			else
				my_buttons[i].image_alpha = 1.0;
		}
	}
	else
	{
		global.mouse_state = 0;
		for(var i = 0; i < array_length(my_buttons); i++)
			my_buttons[i].image_alpha = 1.0;
	}
}