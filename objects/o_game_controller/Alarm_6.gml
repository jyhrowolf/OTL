/// @description Influence
var current_player = player_controller.players[player_controller.active_player];
if(busy >= 0) // find hexes that are influenceable
{
	var applied_traits = player_controller.players[player_controller.active_player].civilization.trait_list;
	applied_traits = calculate_applied_traits(applied_traits,"move");
	
	var whg = array_length(applied_traits);
	
	applied_traits = player_controller.players[player_controller.active_player].civilization.trait_list;
	applied_traits = calculate_applied_traits(applied_traits,"pirate_move");
	
	var p_f = array_length(applied_traits);
	
	if(!player_controller.action_taken)
		busy = complete;
		
	if(!player_controller.action_taken)
	{
		player_controller.action_taken = true;
		current_player.civilization.calculate_colony(current_player.civilization.colony + 2);
		player_controller.bottom_bar.alarm[0] = 1;
	}
	//settup connections
	get_moveable(self);

	var systems = ds_map_values_to_array(moveable_hex); 
	for(var i = 0; i < array_length(systems); i++) // clean all hexes
	{
		if(systems[i].highlighted)
		{
			systems[i].highlighted = false;
			systems[i].depth = 3;
		}
	}

	for(var i = 0; i < array_length(systems); i++)
	{
		if(systems[i].player == current_player.player || 
			(is_player_ship(current_player.player,systems[i],false) && systems[i].player == 0 && !is_other_player_ship(current_player.player,systems[i])) ||
			(p_f && is_player_ship(current_player.player,systems[i],false) && systems[i].player == 0 && !is_other_player_ship_ignore(current_player.player,systems[i],o_pirate)))
		{
			systems[i].highlighted = true;
			systems[i].depth = 2;
		}
		else if(systems[i].player != current_player.player && !is_player_ship(current_player.player,systems[i],false))
			array_delete(systems,i--,1);
	}
		
	var adv = [
	    [1,0], [1,-1], [0,-1], 
	    [-1,0], [-1,1], [0,1] 
	];
	var moveable = ds_map_values_to_array(moveable_hex); 
	for(var i = 0; i < array_length(systems); i++)
	{
		var old_hex = systems[i];
		var old_coord = old_hex.hex_coord;
		for(var j = 0; j < 6; j++)
		{
			if(old_hex.connections[j] == 2 || (whg && old_hex.connections[j] == 1))
			{
				var new_coord = [old_coord[0] + adv[j][0], old_coord[1] + adv[j][1]];
				var new_hex = moveable_hex[? map_hash(new_coord)];
				if(new_hex.player == 0)
				{
					if(p_f)
					{
						if(!is_other_player_ship_ignore(current_player.player,new_hex,o_pirate))
						{
							new_hex.highlighted = true;
							new_hex.depth = 2;
						}
					}
					else if(!is_other_player_ship(current_player.player,new_hex))
					{
						new_hex.highlighted = true;
						new_hex.depth = 2;
					}
					
				}
			}
		}
		if(old_hex.warp_gate)
		{
			for(var i = 0; i < array_length(moveable); i++)
			{
				if(moveable[i].warp_gate && moveable[i] != old_hex)
				{
					var new_coord = moveable[i].hex_coord;
					var new_hex = moveable_hex[? map_hash(new_coord)];
					if(new_hex.player == 0)
					{
						if(p_f)
						{
							if(!is_other_player_ship_ignore(current_player.player,new_hex,o_pirate))
							{
								new_hex.highlighted = true;
								new_hex.depth = 2;
							}
						}
						else if(!is_other_player_ship(current_player.player,new_hex))
						{
							new_hex.highlighted = true;
							new_hex.depth = 2;
						}
					}
				}
			}
		}
	}
}

if(player_controller.action != 6)
	alarm[11] = 1;