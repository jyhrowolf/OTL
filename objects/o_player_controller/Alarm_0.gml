/// @description Next player
action_taken = true;
action = 0;

if(active_player + 1 < array_length(players))
	active_player++;
else
	active_player = 1;

var gc = instance_find(o_game_controller,0);

var next_round = true;
for(var i = 1; i < array_length(players); i++)
{
	if(!players[i].passed && !players[i].lost)
	{
		next_round = false;
		break;
	}
}

var combat = false;
var list = [];
ds_map_values_to_array(gc.map,list);
for(var i = 0; i < array_length(list); i++) // find all hexes that have 2 different ships.
{
	if(is_ship_combat(list[i]))
	{
		combat = true;
		gc.combat_hex = list[i];
		break;
	}
	else if(is_planet_combat(list[i]))
	{
		combat = true;
		gc.combat_hex = list[i];
		break;
	}
}

if(!next_round)
{
	action_taken = false;
	while(players[active_player].passed || players[active_player].lost)
	{
		if(active_player + 1 < array_length(players))
			active_player++;
		else
			active_player = 1;
	}
	
	var cur_player = players[active_player];
	var cur_civ = cur_player.civilization;
	cur_civ.calculate_colony(cur_civ.colony);
	cur_civ.calculate_resources([0,0,0]);
	cur_player.calculate_resource_income([0,0,0]);
	cur_player.calculate_influence_upkeep(0);
	
	gc.selected_hex = cur_player.last_selected_hex;
	gc.busy = 0;
	
	bottom_bar.my_buttons[6].image_index = 2;

	rotate_camera(self,0,cur_player.last_selected_hex);
}
else if(combat)
{
	bottom_bar.my_buttons[6].image_index = 3;
	ds_map_clear(gc.combat_initiative);
	gc.combat_reward = [1,1];
	gc.combat_list = [];
	gc.action = 8;
	gc.busy = 0;
	alarm[8] = 1;
	gc.alarm[8] = 2;
}
else // Next round
{
	var list = [];
	ds_map_values_to_array(gc.map,list);
	for (var i = 0; i < array_length(list); i++) {
	    list[i].sieged = false; // reset siege status
	}
	
	bottom_bar.my_buttons[6].image_index = 2;
	
	var cur_player;
	var cur_civ;
	for(var i = 1; i < array_length(players); i++)
	{
		cur_player = players[i];
		cur_civ = cur_player.civilization;
		//upkeep
		cur_player.calculate_resource_income([0,0,0]);
		cur_player.calculate_influence_upkeep(0);
		cur_civ.calculate_resource(0, cur_civ.resources_income[0] - cur_civ.upkeep);
		if(cur_civ.resources[0] < 0)
		{
			show_debug_message("PLAYER " + string(i) + " BANKRUPT");
			cur_player.lost = true;
		}
		
		cur_civ.calculate_resource(1, cur_civ.resources_income[1]);
		cur_civ.calculate_resource(2, cur_civ.resources_income[2]);
		//upkeep end
	}
	
	for(var i = 1; i < array_length(players); i++)
	{
		cur_player = players[i];
		cur_civ = cur_player.civilization;
		//clean up
		for(var j = 0; j < 3; j++)
		{
			cur_civ.resources_built[j] -= cur_civ.resources_destroyed[j];
			cur_civ.resources_destroyed[j] = 0;
		}
		
		for(var j = 0; j < 6; j++)
		{
			cur_civ.influence += cur_civ.influence_spent[j];
			cur_civ.influence_spent[j] = 0;
		}
		cur_civ.colony = cur_player.species.max_colony;
		cur_player.passed = false;
		
		//clean up end
		if(array_length(cur_civ.systems) == 0)
		{
			show_debug_message("PLAYER " + string(i) + " EXTINCT");
			cur_player.lost = true;
		}
	}
	
	var rc = instance_find(o_research_controller,0);
	rc.alarm[0] = 1; //draw new tech tiles
	
	active_player = next_round_active_player;
	next_round_active_player = 0;
	
	var playable = [0,0,0,0,0,0,0];
	for(var i = 1; i < array_length(players); i++)
	{
		cur_player = players[i];
		if(!cur_player.lost)
			playable[i] = 1;
	}
	var sum = 0;
	for(var i = 0; i < array_length(playable); i++)
	{
		sum += playable[i];
	}
	
	while(players[active_player].lost && sum > 0)
	{
		if(active_player + 1 < array_length(players))
			active_player++;
		else
			active_player = 1;
	}
	
	cur_player = players[active_player];
	cur_civ = cur_player.civilization;
	cur_civ.calculate_colony(cur_civ.colony);
	cur_civ.calculate_resources([0,0,0]);
	cur_player.calculate_resource_income([0,0,0]);
	cur_player.calculate_influence_upkeep(0);
	gc.selected_hex = cur_player.last_selected_hex;
	rotate_camera(self,0,cur_player.last_selected_hex);
	
	if(sum > 1)
	{
		if(round_count < 9)
		{
			var scores = [0,0,0,0,0,0,0];
			for(var i = 1; i < array_length(players); i++)
			{
				scores[i] = players[i].civilization.calculate_victory_points();
			}
			var found = ds_map_create();
			for(var i = 1; i < array_length(players); i++)
			{
				var temp = [];
				array_copy(temp,0,scores,0,7);
				array_sort(temp,false);
				var temp_score = temp[i-1];
				var p = 1;
				for(var j = 1; j < array_length(players); j++)
				{
					if(scores[j] == temp_score && !ds_map_exists(found,j))
					{
						found[?j] = temp_score;
						p = j;
						break;
					}
				}
				show_debug_message("Player " + string(p) + " with score " + string(temp_score));
			}
			ds_map_destroy(found);
		}
		round_count++;
		show_debug_message("ROUND: " + string(round_count));
		action_taken = false;
	}
	else // game is over
	{
		for(var i = 0; i < array_length(playable); i++)
		{
			if(playable[i] == 1)
			{
				show_debug_message("PLAYER " + string(i) + " WON");
				game_end();
				exit;
			}
		}
		show_debug_message("NO WINNERS");
		game_end();
		exit;
	}
}