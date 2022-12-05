/// @description Explore
var applied_traits = player_controller.players[player_controller.active_player].civilization.trait_list;
applied_traits = calculate_applied_traits(applied_traits,"explore");

var adv = [
    [1,0], [1,-1], [0,-1], 
    [-1,0], [-1,1], [0,1] 
];

ds_map_clear(connected_hex);
var list = [];
ds_map_values_to_array(map,list);
for(var i = 0; i < array_length(list); i++) // find all hexes around explored hexes, create new ones, and make them explorable
{
	var old_hex = list[i];
	if(old_hex.explored)
	{
		var old_coord = old_hex.hex_coord;
		for(var j = 0; j < 6; j++)
		{
			var new_coord = [old_coord[0] + adv[j][0], old_coord[1] + adv[j][1]];
			if (ds_map_exists(map, map_hash(new_coord)))
			{
				var new_hex = map[? map_hash(new_coord)]
				new_hex.explorable = true;
				connected_hex[? map_hash(new_coord)] = new_hex;
			}
			else
			{
				var point = flat_hex_to_pixel(new_coord,global.hex_size)
				var new_hex = instance_create_layer(point[0], point[1],"Map",o_system);
				new_hex.hex_coord = new_coord;
				new_hex.tier = tier_calculate(new_coord);
				new_hex.depth = new_hex.tier + 2;
				new_hex.explorable = true;
				map[? map_hash(new_coord)] = new_hex;
				connected_hex[? map_hash(new_coord)] = new_hex;
			}
		}
	}
}
list = [];
ds_map_values_to_array(connected_hex,list);
for(var i = 0; i < array_length(list); i++) // calculate all hex connections
{
	var connected = false;
	var old_hex = list[i];
	var old_coord = old_hex.hex_coord;
	for(var j = 0; j < 6; j++)
	{
		var new_coord = [old_coord[0] + adv[j][0], old_coord[1] + adv[j][1]];
		if (ds_map_exists(map, map_hash(new_coord)))
		{
			var new_hex = map[? map_hash(new_coord)];
			if(new_hex.explored)
			{
				if(array_length(applied_traits) > 0 && !old_hex.explored)
				{
					if(applied_traits[0].trait(old_hex,self))
					{
						connected = true;
						var tier = old_hex.tier;
						tier = (tier-1)*(tier<4) + 2*(tier>=4);
						if(array_length(system_tokens[tier]) > 0)
						{
							old_hex.highlighted = true;
							old_hex.depth = 2;
						}
						break;
					}
				}
				else if(new_hex.layout[(j+3)*(j+3 < 6) + (j-3)*(j+3>=6)] == 1) // if adjacent explored hex has a gateway into hex
				{
					if(old_hex.explored)
					{
						if(old_hex.layout[j] == 1)
						{
							new_hex.connections[(j+3)*(j+3 < 6) + (j-3)*(j+3>=6)] = 1;
							old_hex.connections[j] = 1
							connected = true;
						}
						else
						{
							new_hex.connections[(j+3)*(j+3 < 6) + (j-3)*(j+3>=6)] = 1;
							old_hex.connections[j] = 2;
						}
					}
					else
					{
						new_hex.connections[(j+3)*(j+3 < 6) + (j-3)*(j+3>=6)] = 1;
						old_hex.connections[j] = 1
						connected = true;
						var tier = old_hex.tier;
						tier = (tier-1)*(tier<4) + 2*(tier>=4);
						if((new_hex.player == player_controller.active_player || 
							(is_player_ship(player_controller.active_player,new_hex,false) && !is_player_pinned(player_controller.active_player,new_hex,0,false))) 
							&& array_length(system_tokens[tier]) > 0)
						{
							old_hex.highlighted = true;
							old_hex.depth = 2;
						}
					}
				}
			}
		}
	}
	if(!connected)
	{
		ds_map_delete(connected_hex,map_hash(old_coord));
	}
}
if(player_controller.action != 1)
	alarm[11] = 1;