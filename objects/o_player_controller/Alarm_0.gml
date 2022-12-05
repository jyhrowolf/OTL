/// @description Next player
action_taken = false;
bottom_bar.alarm[0] = 1;
action = 0;

if(active_player + 1 < array_length(players))
	active_player++;
else
	active_player = 1;

var next_round = true;
for(var i = 1; i < array_length(players); i++)
{
	if(!players[i].passed)
	{
		next_round = false;
		break;
	}
}

if(!next_round)
{
	while(players[active_player].passed)
	{
		if(active_player + 1 < array_length(players))
			active_player++;
		else
			active_player = 1;
	}
	
	var gc = instance_find(o_game_controller,0);
	var cur_player = players[active_player];
	var cur_civ = cur_player.civilization;
	cur_civ.calculate_colony(cur_civ.colony);
	cur_civ.calculate_resources([0,0,0]);
	cur_player.calculate_resource_income([0,0,0]);
	cur_player.calculate_influence_upkeep(0);
	
	gc.selected_hex = cur_player.last_selected_hex;
	gc.done = 0;
	gc.busy = 0;
	
	bottom_bar.my_buttons[6].image_index = 2;

	rotate_camera(self,0,cur_player.last_selected_hex);
}
else // Next round
{
	active_player = next_round_active_player;
	next_round_active_player = 0;
	
	var gc = instance_find(o_game_controller,0);
	var cur_player = players[active_player];
	var cur_civ = cur_player.civilization;

	bottom_bar.my_buttons[6].image_index = 2;

	for(var i = 1; i < array_length(players); i++)
	{
		cur_player = players[i];
		cur_civ = cur_player.civilization;
		//upkeep
		cur_player.calculate_resource_income([0,0,0]);
		cur_player.calculate_influence_upkeep(0);
		cur_civ.calculate_resource(0, cur_civ.resources_income[0] - cur_civ.upkeep);
		if(cur_civ.resources[0] < 0)
			show_debug_message("BANKRUPT");
		
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
	}
	var rc = instance_find(o_research_controller,0);
	rc.alarm[0] = 1; //draw new tech tiles
	
	cur_player = players[active_player];
	cur_civ = cur_player.civilization;
	cur_civ.calculate_colony(cur_civ.colony);
	cur_civ.calculate_resources([0,0,0]);
	cur_player.calculate_resource_income([0,0,0]);
	cur_player.calculate_influence_upkeep(0);
	gc.selected_hex = cur_player.last_selected_hex;
	rotate_camera(self,0,cur_player.last_selected_hex);
	
	round_count++;
	show_debug_message("ROUND: " + string(round_count));
}