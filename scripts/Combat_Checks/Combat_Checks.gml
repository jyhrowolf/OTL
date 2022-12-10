// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function combat_round_solve(c_hex,a_dmg,d_dmg,att,def)
{
	round_solve(c_hex,d_dmg,att);
	round_solve(c_hex,a_dmg,def);
}

function round_solve(c_hex,dmg,to_player)
{
	var ships = c_hex.ships;
	var to_ships = [[],[],[],[],[],[],[],[],[],[],[]];
	for(var i = 0; i < array_length(ships); i++)
	{
		if(instance_exists(ships[i]))
		{
			if(ships[i].player == to_player)
			{
				array_push(to_ships[ships[i].blueprint.shield], ships[i]);
			}
		}
	}
	var damage = [[],[],[],[],[],[],[],[],[],[],[],[],[]];
	for(var i = 0; i < array_length(dmg); i++)
	{
		for(var j = 0; j < array_length(dmg[i]); j++)
		{
			array_push(damage[dmg[i][j][1]], dmg[i][j][0]);
		}
	}
	for(var i = 6; i < 12; i++)
	{
		if(hittable_ships(to_ships,i))
		{
			for(var j = 0; j < array_length(damage[i]); j++)
			{
				show_debug_message("Hits with a " + string(i));
				lowest_ship(c_hex,to_ships,i,damage[i][j]);
			}
		}
	}
}

function hittable_ships(to_ships, roll)
{
	for(var d = 0; d <= roll - 6; d++)
	{
		for(var i = 0; i < array_length(to_ships[roll-6 - d]); i++)
		{
			var ships = to_ships[roll-6 - d];
			if(instance_exists(ships[i]))
			{
				return true;
			}
			else
			{
				array_delete(ships,i,1);
				i--;
			}
		}
	}
	return false;
}

function lowest_ship(c_hex,to_ships,roll,dmg)
{
	var ls = noone;
	for(var d = 0; d <= roll - 6; d++)
	{
		for(var i = 0; i < array_length(to_ships[roll-6 - d]); i++)
		{
			var ships = to_ships[roll-6 - d];
			if(instance_exists(ships[i]))
			{
				if(ls == noone)
					ls = ships[i];
			
				if(ls.hull > ships[i].hull)
					ls = ships[i];
				else if(ls.hull == ships[i].hull)
					if(ls.class < ships[i].class)
						ls = ships[i];
			}
			else
			{
				array_delete(ships,i,1);
				i--;
			}
			
		}
	}
	if(ls != noone)
	{
		show_debug_message("Ship takes " + string(dmg) + " to " + string(ls.hull) + " Hull");
		ls.hull -= dmg;
		if(ls.hull <= 0)
		{
			for(var i = 0; i < array_length(c_hex.ships); i++)
			{
				if(c_hex.ships[i].id == ls.id)
				{
					array_delete(c_hex.ships,i,1);
					show_debug_message("DESTROYED");
					break;
				}
			}
			instance_destroy(ls);
		}
	}
}

function combat_over(c_hex,att,def)
{
	var as = 0;
	var ds = 0;
	for(var i = 0; i < array_length(c_hex.ships); i++)
	{
		if(instance_exists(c_hex.ships[i]))
		{
			if(c_hex.ships[i].player == att)
				as = 1;
			else if(c_hex.ships[i].player == def)
				ds = 1;
		}
		if(as != 0 && ds != 0)
			return false;
	}
	return true;
}

function combat_player_won(c_hex,att)
{
	for(var i = 0; i < array_length(c_hex.ships); i++)
	{
		if(c_hex.ships[i].player != att)
			return false;
	}
	return true;
}