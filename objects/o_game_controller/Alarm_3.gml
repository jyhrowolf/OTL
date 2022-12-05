/// @description Upgrade
var ac = instance_find(o_alert_controller,0);
show_debug_message("UPGRADE");
if(player_controller.action >= 0) // trigger research alert
{
	array_push(ac.alerts,o_alert_upgrade);
	ac.next_alert(noone);
}