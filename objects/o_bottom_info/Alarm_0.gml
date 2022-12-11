/// @description Do Button Thing
var pc = instance_find(o_player_controller,0);
show_debug_message("INFO");
show_debug_message("Player " + string(pc.active_player) + " has " +	
					string(pc.players[pc.active_player].civilization.calculate_victory_points()) +
					" victory points");