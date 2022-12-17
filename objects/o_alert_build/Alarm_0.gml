/// @description Yes button
if(selected_blueprint > -1)
{
	if(my_buttons[selected_blueprint].ships != 0 && current_civ.resources[2] - my_buttons[selected_blueprint].cost >= 0
		&& my_buttons[selected_blueprint].buyable)
	{
		var gc = instance_find(o_game_controller,0);
		gc.busy = selected_blueprint + 1;
		gc.alarm[4] = 1;
		instance_destroy(self);
	}
}
