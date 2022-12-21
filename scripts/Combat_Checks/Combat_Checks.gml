// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function combat_reward_calculate(_reward,_player)
{
	if(_player.player != 0)
	{
		if(_reward > 5)
			_reward = 5;
		var max_vp = noone;
		for(var i = 0; i < _reward; i++)
		{
			var temp_cr = instance_create_layer(_player.x,_player.y,"Controllers",o_exp_combat);
			temp_cr.combat_reward();
			if(max_vp == noone)
				max_vp = temp_cr;
			else if(max_vp.victory_points < temp_cr.victory_points)
			{
				instance_destroy(max_vp);
				max_vp = temp_cr;
			}
			else
				instance_destroy(temp_cr);
		}
		_player.civilization.add_reputation(max_vp,_player.species);
	}
}

function combat_civ_solve(c_hex,_pc,_player)
{
	c_hex.sieged = true;
	var sieged_player = _pc.players[c_hex.player];
	var d_applied_traits = sieged_player.civilization.trait_list
	d_applied_traits = calculate_applied_traits(d_applied_traits,"system_loss");
	var a_applied_traits = _pc.players[_player].civilization.trait_list;
	a_applied_traits = calculate_applied_traits(a_applied_traits,"system_combat");
	
	var loss = 0;
	if(array_length(d_applied_traits) != 0)
	{
		loss = d_applied_traits[0].trait();
	}

	if((array_length(a_applied_traits) != 1 && loss == 0) || loss == 1)
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
					for(var m = 0; m < array_length(m_attack); m++)
					{
						m_attack[m][2] = list[s];
					}
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
			combat_system_solve(c_hex,attacker_dmg,sieged_player);
		}
	}
	else if(loss == 2) // plant suck
	{
		show_debug_message("PLANTS");
		d_applied_traits[0].plant_bomb(c_hex,_pc);
		var explo = instance_create_depth(c_hex.x,c_hex.y,depth,o_explosion_1);
		explo.image_blend = sieged_player.species.faction_color;
		explo.image_xscale = 5;
		explo.image_yscale = 5;
	}
	else // NEUTRON BOMB
	{
		show_debug_message("NEUTRON BOMB");
		a_applied_traits[0].trait(c_hex,_pc);
		var explo = instance_create_depth(c_hex.x,c_hex.y,depth,o_explosion_1);
		explo.image_blend = _pc.players[_player].species.faction_color;
		explo.image_xscale = 5;
		explo.image_yscale = 5;
	}
	
	if(is_system_unpopulated(c_hex))
	{	
		instance_destroy(c_hex.system_center);
		
		c_hex.player = 0;
		array_remove(sieged_player.civilization.systems,c_hex);
		sieged_player.civilization.influence++;
	}
}

function combat_system_solve(c_hex,dmg,_player)
{
	var sum = 0;
	for(var i = 0; i < array_length(dmg); i++)
	{
		for(var j = 0; j < array_length(dmg[i]); j++)
		{
			var ship = dmg[i][j][2];
			var offset = ship.weapon_offset[irandom_range(0,array_length(ship.weapon_offset)-1)];
			offset[0] *= dcos(ship.direction);
			offset[1] *= dsin(ship.direction);
			var shot = instance_create_depth(ship.x + offset[0],ship.y+ offset[1],ship.depth-1,o_shot);
			shot.class = ship.class + (ship.class == 3);
			shot.weapons = true;
			shot.damage = dmg[i][j][0];
			if(dmg[i][j][1] == 0 || dmg[i][j][1] >= 6)
			{
				sum += dmg[i][j][0];
				shot.target = c_hex;
			}
			else
			{
				shot.image_alpha = 0.35;
			}
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
			var planets = c_hex.planets;
			if(planets[i].resource < 3) // planet
				_sieged.civilization.resources_destroyed[c_hex.planets[i].resource]++;
			else if(planets[i].resource < 4) // white
			{
				if(_sieged.civilization.resources_built[2] > 0)
					_sieged.civilization.resources_destroyed[2]++;
				else if(_sieged.civilization.resources_built[1] > 0)
					_sieged.civilization.resources_destroyed[1]++;
				else
					_sieged.civilization.resources_destroyed[0]++;
			}
			else if(planets[i].resource < 5) // orbital
			{
				if(_sieged.civilization.resources_built[1] > 0)
					_sieged.civilization.resources_destroyed[1]++;
				else
					_sieged.civilization.resources_destroyed[0]++;
			}
			c_hex.planets[i].resources--;
			return true;
		}
	}
	return false;
}

function combat_round_solve(c_hex,c_r,a_dmg,d_dmg,att,def,_type)
{
	c_r[0] += round_solve(c_hex,d_dmg,att,_type);
	c_r[1] += round_solve(c_hex,a_dmg,def,_type);
	return c_r;
}

function round_solve(c_hex,dmg,to_player,_type)
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
			var temp = [dmg[i][j][0],dmg[i][j][2]];
			array_push(damage[dmg[i][j][1]], temp);
		}
	}
	for(var i = 1; i < 12; i++) // all of the rolls
	{
		if(hittable_ships(to_ships,i))
		{
			for(var j = 0; j < array_length(damage[i]); j++)
			{
				show_debug_message("Hits with a " + string(i));
				vp += lowest_ship(c_hex,to_ships,i,damage[i][j],_type);
			}
		}
		else
		{
			for(var j = 0; j < array_length(damage[i]); j++)
			{
				var ship = noone;
				if(instance_exists(damage[i][j][1]))
					ship = damage[i][j][1];
				else
					ship = instance_find(o_ship_corpse, instance_number(o_ship_corpse)-1);
				
				var offset = ship.weapon_offset[irandom_range(0,array_length(ship.weapon_offset)-1)];
				offset[0] *= dcos(ship.direction);
				offset[1] *= dsin(ship.direction);
				var shot = instance_create_depth(ship.x + offset[0],ship.y+ offset[1],ship.depth-1,o_shot);
				shot.class = ship.class + (ship.class == 3);
				shot.weapons = _type;
				shot.damage = damage[i][j][0];
				shot.image_alpha = 0.35;
			}
		}
	}
	for(var j = 0; j < array_length(damage[0]); j++) // all of the 6s
	{
		show_debug_message("Hits with a crit");
		vp += lowest_ship(c_hex,to_ships,0,damage[0][j],_type);
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

function lowest_ship(c_hex,to_ships,roll,dmg,_type)
{
	var ship = noone;
	if(instance_exists(dmg[1]))
		ship = dmg[1];
	else
		ship = instance_find(o_ship_corpse, instance_number(o_ship_corpse)-1);
		
	var offset = ship.weapon_offset[irandom_range(0,array_length(ship.weapon_offset)-1)];
	offset[0] *= dcos(ship.direction);
	offset[1] *= dsin(ship.direction);
	var shot = instance_create_depth(ship.x + offset[0],ship.y+ offset[1],ship.depth-1,o_shot);
	shot.class = ship.class + (ship.class == 3);
	shot.weapons = _type;
	shot.damage = dmg[0];
				
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
							string(dmg[0]) + " to " + string(ls.hull) + " Hull");
							
		shot.target = ls;
				
		ls.hull -= dmg[0];
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
			var corpse = instance_create_depth(ls.x,ls.y,depth,o_ship_corpse);
			corpse.update_ship(ls);
			instance_destroy(ls);
			shot.target = corpse;
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