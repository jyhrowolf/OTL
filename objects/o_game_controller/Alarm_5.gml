/// @description Move
var current_player = player_controller.players[player_controller.active_player];
if(busy == 0) // find hexes with ships
{
	//settup connections
	get_moveable(self);
	var moveable = false;
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
		if(is_player_ship(current_player.player,systems[i],true))
		{
			moveable = true;
			systems[i].highlighted = true;
			systems[i].depth = 2;
		}
	}
	if(!moveable)
	{
		show_debug_message("NO SHIPS MOVEABLE");
		busy = 0;
		complete = 0;
		player_controller.alarm[5] = 1;
		alarm[11] = 1;
	}
}
else if(busy >= 1)
{
	var applied_traits = player_controller.players[player_controller.active_player].civilization.trait_list;
	applied_traits = calculate_applied_traits(applied_traits,"move");
	
	var whg = array_length(applied_traits);
	
	var systems = ds_map_values_to_array(moveable_hex); 
	for(var i = 0; i < array_length(systems); i++) // clean all hexes
	{
		if(systems[i].highlighted)
		{
			systems[i].highlighted = false;
			systems[i].depth = 3;
		}
	}
	var adv = [
	    [1,0], [1,-1], [0,-1], 
	    [-1,0], [-1,1], [0,1] 
	];
	
	var traveled = ds_map_create();
	var travelable = [];
	var deep = [];
	
	array_insert(travelable,0,selected_hex);
	array_insert(deep,0,current_player.blueprints[busy-1].drive);
	traveled[? map_hash(selected_hex.hex_coord)] = 1;
	
	while(array_length(travelable) > 0)
	{
		var old_hex = array_pop(travelable);
		var distance = array_pop(deep);
		var old_coord = old_hex.hex_coord;
		old_hex.highlighted = true;
		old_hex.depth = 2;
		if(distance > 0) // if we can continue
		{
			if(!is_player_pinned(current_player.player,old_hex,!(old_hex == selected_hex)))
			{
				for(var i = 0; i < array_length(old_hex.connections); i++)
				{
					if(old_hex.connections[i] == 2 || (whg && old_hex.connections[i] == 1))
					{
						var new_coord = [old_coord[0] + adv[i][0], old_coord[1] + adv[i][1]];
						if(!ds_map_exists(traveled,map_hash(new_coord)))
						{
							var new_hex = moveable_hex[? map_hash(new_coord)];
							traveled[? map_hash(new_coord)] = 1;
							array_insert(travelable,0,new_hex);
							array_insert(deep,0,distance - 1);
						}
					}
				}
				if(old_hex.warp_gate)
				{
					for(var i = 0; i < array_length(systems); i++)
					{
						if(systems[i].warp_gate && systems[i] != old_hex)
						{
							var new_coord = systems[i].hex_coord;
							if(!ds_map_exists(traveled,map_hash(new_coord)))
							{
								var new_hex = moveable_hex[? map_hash(new_coord)];
								traveled[? map_hash(new_coord)] = 1;
								array_insert(travelable,0,new_hex);
								array_insert(deep,0,distance - 1);
							}
						}
					}
				}
			}
		}
	}
	
	ds_map_destroy(traveled);
}

if(player_controller.action != 5)
	alarm[11] = 1;