/// @description Combat
if(busy == 0) //initiallize a combat
{
	if(is_ship_combat(combat_hex))
	{
		var c_list = [0,0,0,0,0,0,0];
		// fill list
		for(var i = 0; i < array_length(combat_hex.ships); i++)
		{
			if(c_list[combat_hex.ships[i].player] != 1)
			{
				c_list[combat_hex.ships[i].player] = 1;
				array_push(combat_list,combat_hex.ships[i].player);
			}
		
		}
		var attacker = combat_list[array_length(combat_list) - 1];
		var defender = combat_list[array_length(combat_list) - 2];
		if(attacker == combat_hex.player)
		{
			var temp = attacker;
			attacker = defender;
			defender = temp;
		}
		show_debug_message("Player " + string(attacker) + " attacks Player " + string(defender));
	
		for(var i = 0; i < array_length(combat_hex.ships); i++) // initiative
		{
			if(combat_hex.ships[i].player == defender || combat_hex.ships[i].player == attacker)
			{
				combat_hex.ships[i].hull = combat_hex.ships[i].blueprint.hull;
				var init = combat_hex.ships[i].blueprint.initiative;
				if(ds_map_exists(combat_initiative, init))
					array_push(combat_initiative[? init], combat_hex.ships[i]);
				else
					combat_initiative[? init] = [combat_hex.ships[i]];
			}
		}
		// fire missiles
		var list = [];
		var attacker_dmg;
		var defender_dmg;
		ds_map_values_to_array(combat_initiative,list);
		for(var i = array_length(list) - 1; i >= 0; i--) // initiative
		{
			attacker_dmg = [];
			defender_dmg = [];
			for(var s = 0; s < array_length(list[i]); s++) // initiative
			{
				if(instance_exists(list[i][s]))
				{
					if(list[i][s].blueprint.has_missiles())
					{
						var m_attack = list[i][s].blueprint.roll_missiles();
						if(list[i][s].player == attacker)
							array_push(attacker_dmg,m_attack);
						else if(list[i][s].player == defender)
							array_push(defender_dmg,m_attack);
					}
				}
				else
				{
					array_delete(list[i],s,1);
					s--;
				}
			}
			if(array_length(attacker_dmg) != 0 || array_length(defender_dmg) != 0)
			{
				combat_reward = combat_round_solve(combat_hex,combat_reward,attacker_dmg,defender_dmg,attacker,defender);
			}
		}
		if(combat_over(combat_hex,attacker,defender))
		{
			combat_reward_calculate(combat_reward[0],player_controller,defender);
			combat_reward_calculate(combat_reward[1],player_controller,attacker);
			if(combat_player_won(combat_hex,attacker)) // attacker wins
			{
			
				combat_hex.enemy = noone;
				combat_civ_solve(combat_hex,player_controller,combat_hex.ships[0].player);
				if(is_system_unpopulated(combat_hex))
				{
					busy = 2;
					player_controller.active_player = attacker;
					bottom_bar.my_buttons[6].image_index = 1;
					bottom_bar.alarm[0] = 1;
				}
			}
		}
		else
		{
			busy = 1;
		}
	}
	else if(is_planet_combat(combat_hex))
	{
		var attacker = combat_hex.ships[0].player;
		combat_civ_solve(combat_hex,player_controller,attacker);
		if(is_system_unpopulated(combat_hex))
		{
			busy = 2;
			player_controller.active_player = attacker;
			bottom_bar.my_buttons[6].image_index = 1;
			bottom_bar.alarm[0] = 1;
		}
		else
		{
			busy = 0;
			action = 0;
			player_controller.alarm[0] = 1;
		}
	}
}
else if(busy == 1)
{
	var attacker = combat_list[array_length(combat_list) - 1];
	var defender = combat_list[array_length(combat_list) - 2];
	if(attacker == combat_hex.player)
	{
		var temp = attacker;
		attacker = defender;
		defender = temp;
	}
	
	// fire weapons
	var list = [];
	var attacker_dmg;
	var defender_dmg;
	ds_map_values_to_array(combat_initiative,list);
	for(var i = array_length(list) - 1; i >= 0; i--) // initiative
	{
		attacker_dmg = [];
		defender_dmg = [];
		show_debug_message("Initiative: " + string(i));
		for(var s = 0; s < array_length(list[i]); s++) // initiative
		{
			if(instance_exists(list[i][s]))
			{
				if(list[i][s].blueprint.has_weapons())
				{
					var m_attack = list[i][s].blueprint.roll_weapons();
					if(list[i][s].player == attacker)
						array_push(attacker_dmg,m_attack);
					else if(list[i][s].player == defender)
						array_push(defender_dmg,m_attack);
				}
			}
			else
			{
				array_delete(list[i],s,1);
				s--;
			}
		}
		if(array_length(attacker_dmg) != 0 || array_length(defender_dmg) != 0)
		{
			
			combat_reward = combat_round_solve(combat_hex,combat_reward,attacker_dmg,defender_dmg,attacker,defender);
		}
	}
	if(combat_over(combat_hex,attacker,defender))
	{
		combat_reward_calculate(combat_reward[0],player_controller,defender);
		combat_reward_calculate(combat_reward[1],player_controller,attacker);
		if(combat_player_won(combat_hex,attacker)) // attacker wins
		{
			combat_hex.enemy = noone;
			if(!is_system_unpopulated(combat_hex))
				combat_civ_solve(combat_hex,player_controller,combat_hex.ships[0].player);
			if(is_system_unpopulated(combat_hex))
			{
				busy = 2;
				player_controller.active_player = attacker;
				bottom_bar.my_buttons[6].image_index = 1;
				bottom_bar.alarm[0] = 1;
			}
		}
		else
		{
			busy = 0;
			action = 0;
			player_controller.alarm[0] = 1;
			bottom_bar.my_buttons[6].image_index = 2;
		}
	}
}