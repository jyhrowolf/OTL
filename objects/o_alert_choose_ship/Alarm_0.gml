/// @description Yes button
if(selected_button > -1)
{
	var gc = instance_find(o_game_controller,0);
	gc.busy = my_buttons[selected_button].class + 1;
	gc.alarm[5] = 1;
	instance_destroy(self);
}