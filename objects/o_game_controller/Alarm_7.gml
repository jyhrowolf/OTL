/// @description Colonize
var colonizable = false;
if(busy == 0)
{
	var list = player_controller.players[player_controller.active_player].civilization.systems;
	for(var i = 0; i < array_length(list); i++)
	{
		var hex = list[i];
		if(hex.player == player_controller.active_player)
		{
			if(is_colonizable(player_controller.players[player_controller.active_player],hex))
			{
				colonizable = true;
				hex.highlighted = true;
				hex.depth = 2;
			}
		}
	}
}
else if(busy == 1)
{
	if(is_colonizable(player_controller.players[player_controller.active_player],selected_hex))
	{
		colonizable = true;
		selected_hex.highlighted = true;
		selected_hex.depth = 2;
	}
}

if(!colonizable)
{
	show_debug_message("NO PLANETS COLON");
	busy = 0;
	complete = 0;
	player_controller.alarm[7] = 1;
	alarm[11] = 1;
}

if(player_controller.action != 7 && player_controller.action != 8)
	alarm[11] = 1;