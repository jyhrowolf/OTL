/// @description create functions
//initiallize upgrades
upgrades = [
			[1,0,0,0],	//hulls			- 0
			[1,0,0,0],	//drives		- 1
			[1,0,0,0],	//sources		- 2
			[1,0,0],	//computers		- 3
			[1,0,0,0],	//weapons		- 4
			[0,0],		//missiles		- 5
			[0,0,0],	//shields		- 6
			[]			//rare			- 7
			];
//initiallize research	
research = instance_create_layer(x,y,"Player",o_research);

calculate_victory_points = function()
{
	victory_points = [0,0,0,0];
	// go through kept exploration tokens
	for(var i = 0; i < array_length(exploration_tokens); i++)
	{
		if(instance_exists(exploration_tokens[i]))
		{
			victory_points[0] += exploration_tokens[i].victory_points;
		}
	}
	
	var bonus = 0;
	var applied_traits = trait_list;
	applied_traits = calculate_applied_traits(applied_traits,"system_reward");
	if(array_length(applied_traits) != 0)
	{
		bonus = applied_traits[0].trait();
	}
	
	// go through all systems including monoliths
	for(var i = 0; i < array_length(systems); i++)
	{
		victory_points[1] += systems[i].victory_points + bonus;
	}
	
	applied_traits = trait_list;
	applied_traits = calculate_applied_traits(applied_traits,"pirate_reward");
	if(array_length(applied_traits) != 0)
	{
		victory_points[1] += instance_number(o_pirate);
	}
	
	// go through research
	victory_points[2] += research.calculate_research_victory_points();
	
	// go through reputation track
	for(var i = 0; i < array_length(rep_track); i++)
	{
		if(instance_exists(rep_track[i]))
		{
			victory_points[3] += rep_track[i].victory_points;
		}
	}
	
	return victory_points;
}

add_exploration = function(_exploration, _choice)
{
	if(_choice)
	{
		_exploration.exploration_reward(self);
		_exploration.victory_points = 0;
	}
	else
	{
		array_push(exploration_tokens,_exploration);
	}
	update_info();
}

add_trait = function(_add_trait)
{
	array_push(trait_list,instance_create_layer(0,0,"Controllers",_add_trait));
	update_info();
}

add_research = function(_research)
{
	_research.research_trial(self);
	research.add_research(_research);
	update_info();
}

add_reputation = function(_reputation,_species)
{
	var r_t = _species.rep_track;
	
	for(var i = 0; i < array_length(rep_track);i++)
	{
		var nm = object_get_name(rep_track[i].object_index);
		if(nm == "o_exp_combat" && r_t[0] > 0)
		{
			r_t[0]--;
		}
	}
	if(r_t[0] >= 1)
	{
		array_push(rep_track,_reputation);
		update_info();
		return;
	}
	
	for(var i = 0; i < array_length(rep_track);i++)
	{
		var nm = object_get_name(rep_track[i].object_index);
		if(r_t[0] < _species.rep_track[0])
		{
			r_t[0]++;
		}
		else if(nm == "o_exp_combat" || nm == "o_trade")
		{
			if(nm == "o_trade" && r_t[1] > 0)
			{
				r_t[1]--;
			}
			else if(r_t[2] > 0)
			{
				r_t[2]--;
			}
		}
	}
	if(r_t[2] >= 1)
	{
		array_push(rep_track,_reputation);
		update_info();
		return;
	}
	
	var index = 0;
	var min_vp = -1;
	for(var i = 0; i < array_length(rep_track);i++)
	{
		var nm = object_get_name(rep_track[i].object_index);
		if(nm == "o_exp_combat")
		{
			if(min_vp == -1)
			{
				min_vp = rep_track[i].victory_points;
				index = i;
			}
			else if(min_vp > rep_track[i].victory_points)
			{
				min_vp = rep_track[i].victory_points;
				index = i;
			}
		}
	}
	instance_destroy(rep_track[index]);
	array_set(rep_track,index,_reputation);
	update_info();
}

add_rare_research = function(_research,index)
{
	_research.research_trial(self);
	research.add_rare_research(_research,index);
	update_info();
}

check_research = function(_research)
{
	for(var i = 0; i < array_length(research.researched);i++)
		for(var j = 0; j < array_length(research.researched[i]);j++)
			if(object_get_name(_research.object_index) == object_get_name(research.researched[i][j].object_index))
				return false;
	return true;
}

calculate_resources = function(_amount)
{
	for(var i = 0; i<3; i++)
	{
		resources[i] += _amount[i];
		var tl = instance_find(o_top_label,i);
		tl.resource = resources[i];
	}
	update_info();
}

calculate_resource = function(_index,_amount)
{
	resources[_index] += _amount;
	var tl = instance_find(o_top_label,_index);
	tl.resource = resources[_index];
	update_info();
}

calculate_resource_income = function(_index,_amount)
{
	resources_income[_index] = _amount;
	var tl = instance_find(o_top_label,_index);
	tl.income = resources_income[_index];
	update_info();
}

buildable_cost_calculation = function(_amount)
{
	buildable_cost[0] = 3 - _amount;		// interceptor
	buildable_cost[1] = 5 - _amount;		// cruiser
	buildable_cost[2] = 8 - _amount;		// dreadnought
	buildable_cost[3] = 3 - _amount;		// starbase
	buildable_cost[4] = 4 - _amount;		// orbital
	buildable_cost[5] = 10 - 2*_amount;		// monolith
	update_info();
}


calculate_influence_upkeep = function(_amount)
{
	upkeep = _amount;
	var tl = instance_find(o_top_label,0);
	tl.upkeep = upkeep;
	update_info();
}

calculate_colony = function(_amount)
{
	colony = _amount;
	if(colony > max_colony)
		colony = max_colony;
	var tb = instance_find(o_top_colony,0);
	tb.colony = colony;
	tb.max_colony = max_colony;
	update_info();
}

connect_info = function(_info_panel)
{
	info_panel = _info_panel;
}

update_info = function()
{
	if(info_panel != noone)
	{
		info_panel.recalculate_civilization();
	}
}