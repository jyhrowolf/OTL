/// @description Click the bottom bar
var pc = instance_find(o_player_controller,0);
if(global.mouse_state == 1)
{
	var m_x = device_mouse_x_to_gui(0);
	var m_y = device_mouse_y_to_gui(0);
	for(var i = 0; i < array_length(my_buttons); i++)
	{
		if(position_meeting(m_x, m_y, my_buttons[i]))
		{
			my_buttons[i].alarm[0] = 1;
			if((i != 6 && i != 7) && !pc.action_taken)
				my_buttons[6].image_index = 1;
		}
	}
}