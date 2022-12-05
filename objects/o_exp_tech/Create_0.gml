/// @description Tech
event_inherited();

exploration_reward = function(_civilization)
{
	var ac = instance_find(o_alert_controller,0);
	show_debug_message("RESEARCH");
	array_push(ac.alerts,o_alert_research);
	ac.next_alert("cheapest");
}