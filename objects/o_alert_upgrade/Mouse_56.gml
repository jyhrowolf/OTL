/// @description Release click
if(global.mouse_state <= state)
{
	var m_x = device_mouse_x_to_gui(0);
	var m_y = device_mouse_y_to_gui(0);
	var placed = false
	for(var i = 0; i < array_length(my_buttons); i++)
	{
		if(position_meeting(m_x, m_y, my_buttons[i]))
		{
			if(i < array_length(my_buttons) - 2 - 4)
			{
			}
			else if (i < array_length(my_buttons) - 2)
			{
				placed = true;
				selected_blueprint = i;
				alarm[2] = 1;
			}
			break;
		}
	}
	if(!placed)
	{
		if(cursor.hover_asset != noone)
		{
			instance_destroy(cursor.hover_asset);
			cursor.hover_asset = noone;
		}
		cursor.hover_sprite = noone;
		cursor.hover_index = 0;
		cursor.hover_offset = [0,0];
		selected_button = -1;
		
	}
}