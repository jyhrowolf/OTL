// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_moveable(_gc)
{
	/*
	var applied_traits = _gc.player_controller.players[_gc.player_controller.active_player].civilization.trait_list;
	applied_traits = calculate_applied_traits(applied_traits,"move");
	*/

	var adv = [
	    [1,0], [1,-1], [0,-1], 
	    [-1,0], [-1,1], [0,1] 
	];

	ds_map_clear(_gc.moveable_hex);
	var list = [];
	ds_map_values_to_array(_gc.map,list);
	for(var i = 0; i < array_length(list); i++) // find all hexes explored hexes and set their connections
	{
		var old_hex = list[i];
		if(old_hex.explored)
		{
			var old_coord = old_hex.hex_coord;
			if(!ds_map_exists(_gc.moveable_hex, map_hash(old_coord)))
			{
				old_hex.connections = [0,0,0,0,0,0];
				_gc.moveable_hex[? map_hash(old_coord)] = old_hex;
			}

			for(var j = 0; j < 6; j++)
			{
				var new_coord = [old_coord[0] + adv[j][0], old_coord[1] + adv[j][1]];
				if (ds_map_exists(_gc.map, map_hash(new_coord)))
				{
					var new_hex = _gc.map[? map_hash(new_coord)];
					if(new_hex.explored)
					{
						if(!ds_map_exists(_gc.moveable_hex, map_hash(new_coord)))
						{
							new_hex.connections = [0,0,0,0,0,0];
							_gc.moveable_hex[? map_hash(new_coord)] = new_hex;
						}
						
						if(new_hex.layout[(j+3)*(j+3 < 6) + (j-3)*(j+3>=6)] == 1) // if adjacent explored hex has a gateway into hex
						{
							if(old_hex.layout[j] == 1) // both point strong connection
							{
								new_hex.connections[(j+3)*(j+3 < 6) + (j-3)*(j+3>=6)] = 2;
								old_hex.connections[j] = 2;
							}
							else // other points in
							{
								new_hex.connections[(j+3)*(j+3 < 6) + (j-3)*(j+3>=6)] = 1;
								old_hex.connections[j] = 1;
							}
						}
					}
				}
			}
		}
	}
}