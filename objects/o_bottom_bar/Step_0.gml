/// @description Capture mouse, and handle mouse hover
var m_x = device_mouse_x_to_gui(0);
var m_y = device_mouse_y_to_gui(0);
if(global.mouse_state <= 1)
{
	if(position_meeting(m_x, m_y, self) || (position_meeting(m_x, m_y, top_bar.my_buttons[0]) || position_meeting(m_x, m_y, top_bar.my_buttons[1])))
	{
		global.mouse_state = 1;
		for(var i = 0; i < array_length(my_buttons); i++)
			if(!gc.player_controller.action_taken || i > 5)
				if(position_meeting(m_x, m_y, my_buttons[i]))
					my_buttons[i].image_alpha = 0.8;
				else
					my_buttons[i].image_alpha = 1.0;
	}
	else
	{
		global.mouse_state = 0;
		for(var i = 0; i < array_length(my_buttons); i++)
			if(i < array_length(my_buttons) - 2)
			{
				if(!gc.player_controller.action_taken)
					my_buttons[i].image_alpha = 1.0;
			}
			else
				my_buttons[i].image_alpha = 1.0;
	}
}
	