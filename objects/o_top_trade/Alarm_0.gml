/// @description Do Button Thing
var gc = instance_find(o_game_controller,0);
var ac = instance_find(o_alert_controller,0);
show_debug_message("TRADE");
if(gc.player_controller.action >= 0) // trigger trade alert
{
	array_push(ac.alerts,o_alert_trade);
	ac.next_alert(noone);
}