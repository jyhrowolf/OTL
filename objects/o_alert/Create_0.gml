/// @description Set Depth
cursor = instance_find(o_cursor,0);
depth = -15;
if(global.mouse_state < state)
{
	global.mouse_state = state;
	show_debug_message("State: " + string(state));
}
do_function = function(variable)
{
	
}