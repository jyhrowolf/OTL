/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

sprite_index = s_alert_upgrade_rare;
image_index = real(string_digits(object_get_name(object_index)));

exploration_reward = function(_civilization)
{
	array_push(_civilization.upgrades[7],self);
	var ac = instance_find(o_alert_controller,0);
	show_debug_message("UPGRADE");
	array_push(ac.alerts,o_alert_upgrade);
	ac.next_alert("rare");
}