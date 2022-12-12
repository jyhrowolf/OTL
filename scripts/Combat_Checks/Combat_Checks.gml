// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function combat_reward_calculate(_reward,_pc,_player)
{
	if(_player != 0)
	{
		var player = _pc.players[_player];
		if(_reward > 5)
			_reward = 5;
		var max_vp = noone;
		for(var i = 0; i < _reward; i++)
		{
			var temp_cr = instance_create_layer(player.x,player.y,"Controllers",o_exp_combat);
			temp_cr.combat_reward();
			if(max_vp == noone)
				max_vp = temp_cr;
			else if(max_vp.victory_points < temp_cr.victory_points)
				max_vp = temp_cr;
			else
				instance_destroy(temp_cr);
		}
		player.civilization.add_exploration(max_vp,0);
	}
}

function combat_civ_solve(c_hex,_pc,_player)
{
	c_hex.sieged = true;
	var sieged_player = _pc.players[c_hex.player];
	var d_applied_traits = _pc.players[_player].civilization.trait_list
	d_applied_traits = calculate_applied_traits(d_applied_traits,"system_loss");
	var a_applied_traits = _pc.players[_player].civilization.trait_list;
	a_applied_traits = calculate_applied_traits(a_applied_traits,"system_combat");
	
	var loss = 0;
	if(array_length(d_applied_traits) != 0)
	{
		loss = d_applied_traits[0].trait();
	}

	if(array_length(a_applied_traits) != 1 || loss == 1)
	{
		var list = c_hex.ships;
		var attacker_dmg = [];
		for(var s = 0; s < array_length(list); s++) // initiative
		{
			if(instance_exists(list[s]))
			{
				if(list[s].blueprint.has_weapons())
				{
					var m_attack = list[s].blueprint.roll_weapons();
					array_push(attacker_dmg,m_attack);
				}
			}
			else
			{
				array_delete(list,s,1);
				s--;
			}
		}
		if(array_length(attacker_dmg) != 0)
		{
			combat_system_solve(combat_hex,attacker_dmg,sieged_player);
		}
	}
	else if(loss == 2) // plant suck
	{
		show_debug_message("PLANTS");
		d_applied_traits[0].plant_bomb(c_hex,_pc);
	}
	else // NEUTRON BOMB
	{
		show_debug_message("NEUTRON BOMB");
		a_applied_traits[0].trait(c_hex,_pc);
	}
}

function combat_system_solve(c_hex,dmg,_player)
{
	var sum = 0;
	for(var i = 0; i < array_length(dmg); i++)
	{
		for(var j = 0; j < array_length(dmg[i]); j++)
		{
			if(dmg[i][j][1] == 0 || dmg[i][j][1] >= 6)
				sum += dmg[i][j][0];
		}
	}
	for(var i = 0; i < sum; i++)
	{
		if(!is_system_unpopulated(c_hex))
		{
			combat_system(c_hex,_player);
		}
		else
			break;
	}
}

function combat_system(c_hex,_sieged)
{
	for(var i = 0; i < array_length(c_hex.planets); i++)
	{
		for(var j = 0; j < c_hex.planets[i].resources; j++)
		{
			_sieged.civilization.resources_destroyed[c_hex.planets[i].resource]++;
			c_hex.planets[i].resources--;
			return true;
		}
	}
	return false;
}

function combat_round_solve(c_hex,c_r,a_dmg,d_dmg,att,def)
{
	c_r[0] += round_solve(c_hex,d_dmg,att);
	c_r[1] += round_solve(c_hex,a_dmg,def);
	return c_r;
}

function round_solve(c_hex,dmg,to_player)
{
	var vp = 0;
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
	for(var i = 6; i < 12; i++) // all of the rolls
	{
		if(hittable_ships(to_ships,i))
		{
			for(var j = 0; j < array_length(damage[i]); j++)
			{
				show_debug_message("Hits with a " + string(i));
				vp += lowest_ship(c_hex,to_ships,i,damage[i][j]);
			}
		}
	}
	for(var j = 0; j < array_length(damage[0]); j++) // all of the 6s
	{
		show_debug_message("Hits with a crit");
		vp += lowest_ship(c_hex,to_ships,0,damage[0][j]);
	}
	return vp;
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
	if(roll == 0)
		roll = 12;
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
		show_debug_message("Player " + string(ls.player) + " Ship takes " + 
							string(dmg) + " to " + string(ls.hull) + " Hull");
		ls.hull -= dmg;
		if(ls.hull <= 0)
		{
			var val = 1;
			switch(ls.class)
			{
				case 0:
					val = 1;
					break;
				case 1:
					val = 2;
					break;
				case 2:
					val = 3;
					break;
				case 3:
					val = 1;
					break;
			}
			array_remove(c_hex.ships,ls);
			show_debug_message("DESTROYED");
			instance_destroy(ls);
			return val;
		}
	}
	return 0;
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