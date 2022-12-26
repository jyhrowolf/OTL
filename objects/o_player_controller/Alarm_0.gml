/// @description Next player
action_taken = true;
action = 0;

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
ds_map_values_to_array(gc.moveable_hex,list);
for(var i = 0; i < array_length(list); i++) // find all hexes that have 2 different ships.
{
	if(is_ship_combat(list[i]))
	{
		combat = true;
		gc.combat_hex = list[i];
		gc.selected_hex = gc.combat_hex;
		break;
	}
	else if(is_planet_combat(list[i]))
	{
		combat = true;
		gc.combat_hex = list[i];
		gc.selected_hex = gc.combat_hex;
		break;
	}
	else if(list[i].hive)
	{
		if(array_length(list[i].ships) > 0 && array_length(list[i].ships) == list[i].neutrals)
		{
			combat = true;
			gc.combat_hex = list[i];
			gc.selected_hex = gc.combat_hex;
			break;
		}
	}
}

if(!next_round)
{
	action_taken = false;
	if(active_player + 1 < array_length(players))
			active_player++;
		else
			active_player = 1;
	
	while(players[active_player].passed || players[active_player].lost)
	{
		if(active_player + 1 < array_length(players))
			active_player++;
		else
			active_player = 1;
	}
	
	var cur_player = players[active_player];
	cursor.update_cursor(cur_player);
	var cur_civ = cur_player.civilization;
	cur_civ.calculate_colony(cur_civ.colony);
	cur_civ.calculate_resources([0,0,0]);
	cur_player.calculate_resource_income([0,0,0]);
	cur_player.calculate_influence_upkeep(0);
	
	var ifp = instance_find(o_info_panel,0);
	if(ifp != noone)
		instance_destroy(ifp);
	
	if(cur_player.info_panel)
		bottom_bar.my_buttons[7].alarm[1] = 1;
	
	gc.selected_hex = cur_player.last_selected_hex;
	gc.busy = 0;
	
	bottom_bar.my_buttons[6].image_index = 2;

	rotate_camera(self,0,cur_player.last_selected_hex);
}
else if(combat)
{
	action_taken = true;
	bottom_bar.my_buttons[6].image_index = 3;
	bottom_bar.alarm[0] = 1;
	ds_map_clear(gc.combat_initiative);
	gc.combat_reward = [1,1];
	gc.combat_list = [];
	gc.busy = 0;
	alarm[8] = 1;
	gc.alarm[8] = 2;
}
else // Next round
{
	var list = [];
	ds_map_values_to_array(gc.moveable_hex,list);
	for (var i = 0; i < array_length(list); i++) {
	    list[i].sieged = false; // reset siege status
		if(list[i].hive)
			list[i].neutrals = array_length(list[i].ships);
	}
	
	bottom_bar.my_buttons[6].image_index = 2;
	bottom_bar.my_buttons[6].golden = true;
	
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
	
	var playable = [0,0,0,0,0,0,0,0,0,0];
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
	cursor.update_cursor(cur_player);
	cur_civ = cur_player.civilization;
	cur_civ.calculate_colony(cur_civ.colony);
	cur_civ.calculate_resources([0,0,0]);
	cur_player.calculate_resource_income([0,0,0]);
	cur_player.calculate_influence_upkeep(0);
	gc.selected_hex = cur_player.last_selected_hex;
	rotate_camera(self,0,cur_player.last_selected_hex);
	
	
	var ifp = instance_find(o_info_panel,0);
	if(ifp != noone)
		instance_destroy(ifp);
	
	if(cur_player.info_panel)
		bottom_bar.my_buttons[7].alarm[1] = 1;
	
	if(sum > 1)
	{
		var player_list = [];
		var scores = [0,0,0,0,0,0,0,0,0,0];
		for(var i = 1; i < array_length(players); i++)
		{
			var temp_scores = players[i].civilization.calculate_victory_points();
			for(var j = 0; j < array_length(temp_scores); j++)
			{
				scores[i] += temp_scores[j];
			}
		}
		var found = ds_map_create();
		for(var i = 1; i < array_length(players); i++)
		{
			var temp = [];
			array_copy(temp,0,scores,0,10);
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
			array_push(player_list,[p,scores[p]]);
		}
		ds_map_destroy(found);
		round_count++;
		show_debug_message("ROUND: " + string(round_count));
		action_taken = false;
		if(round_count >= round_end)
		{
			var end_c = instance_create_depth(0,0,1,o_end_controller);
			end_c.players = player_list;
			room_goto_next();
			instance_destroy(instance_find(o_game_controller,0));
			instance_destroy(self);
		}
	}
	else // game is over
	{
		for(var i = 0; i < array_length(playable); i++)
		{
			if(playable[i] == 1)
			{
				var end_c = instance_create_depth(0,0,1,o_end_controller);
				end_c.players = [[i,"the only"]];
				room_goto_next();
				instance_destroy(instance_find(o_game_controller,0));
				instance_destroy(self);
				exit;
			}
		}
		var end_c = instance_create_depth(0,0,1,o_end_controller);
		end_c.players = [[0,"0"]];
		room_goto_next();
		instance_destroy(instance_find(o_game_controller,0));
		instance_destroy(self);
		exit;
	}
}