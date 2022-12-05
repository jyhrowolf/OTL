/// @description Colony
var gc = instance_find(o_game_controller, 0);
var current_player = players[active_player];
if(action == 0)
{
	action = 7;
	if(current_player.last_selected_hex != noone) // center camera on last selected hex
	{
		var hex = current_player.last_selected_hex;
		var c_width = camera_get_view_width(view_camera[0]); 
		var c_height = camera_get_view_height(view_camera[0]);
		camera_set_view_pos(view_camera[0],hex.x-c_width/2,hex.y-c_height/2);
	}
}
else if(action == 7)
{
	if(gc.busy == 0 || gc.busy == 1) // do not colonize
	{
		if(gc.complete <= 0)
		{
			action = 0;
			gc.busy = 0;
			if(action_taken) //reset cancel button
				bottom_bar.my_buttons[6].image_index = 0; //end
			else
				bottom_bar.my_buttons[6].image_index = 2; //pass
		}
		else
			gc.busy = 1;
		
		gc.alarm[11] = 1; // clean map
	}
	else if(gc.busy == 2) // close white planet
	{
		if(gc.complete > 0)
			gc.busy = 1
		else // finish
		{
			action = 0;
			gc.busy = 0;
			if(action_taken) //reset cancel button
				bottom_bar.my_buttons[6].image_index = 0; //end
			else
				bottom_bar.my_buttons[6].image_index = 2; //pass
		}
	}
}