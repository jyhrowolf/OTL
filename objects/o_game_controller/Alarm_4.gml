/// @description Build
if(busy == 0)
{
	var ac = instance_find(o_alert_controller,0);
	show_debug_message("BUILD");
	if(player_controller.action >= 0) // trigger research alert
	{
		array_push(ac.alerts,o_alert_build);
		ac.next_alert(noone);
	}
}
else if(busy <= 6 && busy > 0)// find buildable
{
	var current_player = player_controller.players[player_controller.active_player];
	var systems = current_player.civilization.systems;
	for(var i = 0; i < array_length(systems); i++)
	{
		if(is_buildable(busy,systems[i]))
		{
			systems[i].highlighted = true;
			systems[i].depth = 2;
		}
	}
}

if(player_controller.action != 4)
	alarm[11] = 1;