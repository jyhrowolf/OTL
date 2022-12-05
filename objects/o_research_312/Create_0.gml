/// @description Ancient Labs
//class = 0, 1, 2, 3 - Millitary, Grid, Nano, Rare
//type = 0, 1, 2, 3, - Ship Part, Build, Instant, Permanent
// Inherit the parent event
event_inherited();
//hulls			- 0
//drives		- 1
//sources		- 2
//computers		- 3
//weapons		- 4
//missiles		- 5
//shields		- 6
research_trial = function(_civilization)
{
	//enable Ancient Labs
	var gc = instance_find(o_game_controller, 0);
	
	var ac = instance_find(o_alert_controller,0);
	array_push(ac.alerts,o_alert_choose_exploration);
	show_debug_message("RESEARCH CHOOSE EXPLORATION")
	var et = instance_create_layer(x,y,"Controllers",asset_get_index(array_pop(gc.exploration_tokens)));
	ac.next_alert(et);
}