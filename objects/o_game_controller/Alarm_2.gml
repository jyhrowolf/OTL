/// @description Research
var ac = instance_find(o_alert_controller,0);
show_debug_message("RESEARCH");
if(player_controller.action >= 0) // trigger research alert
{
	array_push(ac.alerts,o_alert_research);
	ac.next_alert(noone);
}