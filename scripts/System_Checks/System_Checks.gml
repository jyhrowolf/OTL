// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function is_system_unpopulated(_hex)
{
	for(var i = 0; i < array_length(_hex.planets); i++)
	{
		if(_hex.planets[i].resources > 0)
		{
			return false;
		}
	}
	return true;
}

function is_ship_combat(_system)
{
	var pc = instance_find(o_player_controller,0);
	var p_list = [0,0,0,0,0,0,0];
	var p_friend = 0;
	var player_ships = _system.ships;
	for(var i = 0 ; i < array_length(player_ships); i++) // all ships
	{
		if(instance_exists(player_ships[i]))
		{
			var current_player = pc.players[player_ships[i].player];
			var applied_traits = current_player.civilization.trait_list;
			applied_traits = calculate_applied_traits(applied_traits,"pirate_combat");
			if(array_length(applied_traits) != 0)
				p_friend = player_ships[i].player;
			
			p_list[player_ships[i].player] = 1;
		}
	}
	var sum = 0;
	for(var i = 0 ; i < array_length(p_list); i++) // all categories
	{
		sum += p_list[i];
	}
	
	if(p_friend != 0)
	{
		if(p_list[0] > 0 && p_list[p_friend] > 0)
		{
			sum--;
		}
	}
	
	return sum > 1;
}

function is_planet_combat(_system)
{
	if(_system.sieged == false)
	{
		var player_ships = _system.ships;
		for(var i = 0 ; i < array_length(player_ships); i++) // all ships
		{
			if(instance_exists(player_ships[i]))
				if(player_ships[i].player != _system.player && player_ships[i].player != 0)
					return true;
		}
	}
	return false;
}

function is_player_pinned(_player,_system,_hypo)
{
	var pc = instance_find(o_player_controller,0);
	var current_player = pc.players[_player];
	var applied_traits = current_player.civilization.trait_list;
	applied_traits = calculate_applied_traits(applied_traits,"pin");
	
	var cloak = array_length(applied_traits);
	
	applied_traits = current_player.civilization.trait_list;
	applied_traits = calculate_applied_traits(applied_traits,"pirate_move");
	
	var pirate_friend = array_length(applied_traits);
	
	var player_ships = _hypo;
	var enemy_player_ships = 0;
	var enemy_neutral_ships = 0;
	for(var i = 0 ; i < array_length(_system.ships); i++) // all ships
	{
		if(_system.ships[i].player == _player)
			player_ships++;
		else if (_system.ships[i].player != 0)
			enemy_player_ships++;
		else if(!pirate_friend)
			enemy_neutral_ships++;
	}	
	if(map_hash(_system.hex_coord) == 0	&& enemy_neutral_ships > 0) // is the GCDS there
		return true;

	var b = (player_ships <= enemy_player_ships + enemy_neutral_ships);
	if(cloak)
		b = (player_ships <= (enemy_player_ships + enemy_neutral_ships) div 2);
	return b;
}

function is_other_player_ship_ignore(_player,_system,_o)
{
	for(var i = 0 ; i < array_length(_system.ships); i++) // all ships
	{
		if(_system.ships[i].player != _player && _system.ships[i].object_index != _o)
			return true;
	}
	return false;
}

function is_player_ship(_player,_system,_move)
{
	for(var i = 0 ; i < array_length(_system.ships); i++) // all ships
	{
		if(_system.ships[i].player == _player)
			if(_move)
			{
				if(_system.ships[i].class < 3)
					return true;
			}
			else
				return true;
	}
	return false;
}

function is_other_player_ship(_player,_system)
{
	for(var i = 0 ; i < array_length(_system.ships); i++) // all ships
	{
		if(_system.ships[i].player != _player)
			return true;
	}
	return false;
}

function is_buildable(_choice,_system)
{
	if(_choice >= 5) //orbital monolith
	{
		var c = 4 + 2*(_choice - 5);
		var planets = _system.planets;
		for(var i = 0; i < array_length(planets); i++)
		{
			if(planets[i].resource == c)
				return false;
		}
		return true;
	}
	return true;
}


function is_colonizable(_player,_system)
{
	if(_player.civilization.colony > 0)
	{
		for(var i = 0 ; i < array_length(_system.planets); i++) // all planets
		{
			if(is_planet_colonizable(_player,_system.planets[i],_system.planets[i].resource,false))
				return true;
		}
	}
	return false;
}

function is_planet_colonizable(_player,_planet,_choice,_colo)
{
	for(var h = 0 ; h < array_length(_planet.slots); h++) // all slots in planets
		if(_planet.resource < 3)
		{
			if(_player.civilization.colonizable[_choice] >= _planet.slots[h]) // _player can
				if( h >= _planet.resources) // if it is not currently inhibed
					return true;
		}
		else if(_planet.resource < 4) // white planet
		{
			if(_colo)
			{
				if(_player.civilization.colonizable[_choice] >= _planet.slots[h]) // _player can
						if( h >= _planet.resources) // if it is not currently inhibed
							return true;
			}
			else
			{
				for(var c = 0 ; c < 3; c++) // all resources
					if(_player.civilization.colonizable[c] >= _planet.slots[h]) // _player can
						if( h >= _planet.resources) // if it is not currently inhibed
							return true;
			}
		}
		else if(_planet.resource < 5) // orbital
		{
			for(var c = 0 ; c < 2; c++) // Money or Science
				if(_player.civilization.colonizable[c] >= _planet.slots[h]) // _player can
					if( h >= _planet.resources) // if it is not currently inhibed
						return true;
		}
	return false;
}

function valid_rotation(_system,_map,_player,_whg)
{
	var adv = [
	    [1,0], [1,-1], [0,-1], 
	    [-1,0], [-1,1], [0,1] 
	];
	
	var old_coord = _system.hex_coord;
	for(var j = 0; j < 6; j++)
	{
		var new_coord = [old_coord[0] + adv[j][0], old_coord[1] + adv[j][1]];
		if (ds_map_exists(_map, map_hash(new_coord)))
		{
			var sys = _map[? map_hash(new_coord)]
			if(sys.explored)
				if(sys.player == _player || (is_player_ship(_player,sys,false) && !is_player_pinned(_player,sys,0)))
				{
					if(_whg)
					{
						if(sys.layout[(j+3)*(j+3 < 6) + (j-3)*(j+3>=6)] == 1 || _system.layout[j] == 1)
						{
							if(_system.tier == 1 && connected_to_center(_system,_map))
								return true;
							else if(_system.tier != 1)
								return true;
						}
					}
					if(sys.connections[(j+3)*(j+3 < 6) + (j-3)*(j+3>=6)] == 1 && _system.layout[j] == 1)
					{
						if(_system.tier == 1 && connected_to_center(_system,_map))
							return true;
						else if(_system.tier != 1)
							return true;
					}
				}
		}
	}
	return false;
}

function connected_to_hex(_system,_map, _direction)
{
	var old_coord = _system.hex_coord;
	var new_coord = [old_coord[0] + _direction[0], old_coord[1] + _direction[1]];
	if (ds_map_exists(_map, map_hash(new_coord)))
	{
		var sys = _map[? map_hash(new_coord)]
		if(sys.explored)
			return sys;
	}
	return noone;
}

function connected_to_player(_system,_map,_player)
{
	var adv = [
	    [1,0], [1,-1], [0,-1], 
	    [-1,0], [-1,1], [0,1] 
	];
	
	var old_coord = _system.hex_coord;
	for(var j = 0; j < 6; j++)
	{
		var new_coord = [old_coord[0] + adv[j][0], old_coord[1] + adv[j][1]];
		if (ds_map_exists(_map, map_hash(new_coord)))
		{
			var sys = _map[? map_hash(new_coord)]
			if(sys.explored)
				if(sys.player == _player || (is_player_ship(_player,sys,false) && !is_player_pinned(_player,sys,0)))
					if(sys.connections[(j+3)*(j+3 < 6) + (j-3)*(j+3>=6)] == 1)
						return true;
		}
	}
	return false;
}

function connected_to_center(_system,_map)
{
	var adv = [
	    [1,0], [1,-1], [0,-1], 
	    [-1,0], [-1,1], [0,1] 
	];
	var old_coord = [0,0];
	for(var j = 0; j < 6; j++)
	{
		var new_coord = [old_coord[0] + adv[j][0], old_coord[1] + adv[j][1]];
		if (ds_map_exists(_map, map_hash(new_coord)))
		{
			var sys = _map[? map_hash(new_coord)]
			if(sys.explored)
				if(sys == _system)
					if(sys.layout[(j+3)*(j+3 < 6) + (j-3)*(j+3>=6)] == 1)
						return true;
		}
	}
	return false;
}

function rotate_layout(_system,_amount)
{
	var layout = _system.layout;
	var new_layout = array_length(layout);
	
	if(_amount > 0)
		for(var i = 0; i < array_length(layout); i++)
		{
			var loc = (i+_amount)*(i+_amount < 6) + ((i+_amount)%6)*(i+_amount >= 6);
			new_layout[loc] = layout[i];
		}
	else if(_amount < 0)
		for(var i = 0; i < array_length(layout); i++)
		{
			var loc = (i+_amount)*(i+_amount >= 0 ) + (6+(i+_amount))*(i+_amount < 0);
			new_layout[loc] = layout[i]; 
		}
		
	var planets = _system.planets;
	for(var p = 0; p < array_length(planets); p++)
	{
		var Ax =_system.x;
		var Ay =_system.y;
		var Bx = planets[p].x;
		var By = planets[p].y;
		//Cx=Ax+(Bx−Ax)cosα−(By−Ay)sinα
		//Cy=Ay+(Bx−Ax)sinα+(By−Ay)cosα
		planets[p].x = Ax+(Bx-Ax)*cos(pi/3*-_amount)-(By-Ay)*sin(pi/3*-_amount);
		planets[p].y = Ay+(Bx-Ax)*sin(pi/3*-_amount)+(By-Ay)*cos(pi/3*-_amount);
	}
		
	_system.layout = new_layout;
}