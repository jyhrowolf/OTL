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
	victory_points = 0;
	// go through kept exploration tokens, and combat tokens
	for(var i = 0; i < array_length(exploration_tokens); i++)
	{
		if(instance_exists(exploration_tokens[i]))
		{
			victory_points += exploration_tokens[i].victory_points;
		}
	}
	
	// go through all systems including monoliths
	for(var i = 0; i < array_length(systems); i++)
	{
		victory_points += systems[i].victory_points;
	}
	
	// go through research
	victory_points += research.calculate_research_victory_points();
	
	return victory_points;
}

add_exploration = function(_exploration, _choice)
{
	if(_choice)
	{
		_exploration.exploration_reward(self);
		_exploration.victory_points = 0;
	}
	array_push(exploration_tokens,_exploration);
}

add_trait = function(add_trait)
{
	array_push(trait_list,instance_create_layer(0,0,"Controllers",add_trait));
}

add_research = function(_research)
{
	_research.research_trial(self);
	research.add_research(_research);
}

add_rare_research = function(_research,index)
{
	_research.research_trial(self);
	research.add_rare_research(_research,index);
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
}

calculate_resource = function(_index,_amount)
{
	resources[_index] += _amount;
	var tl = instance_find(o_top_label,_index);
	tl.resource = resources[_index];
}

calculate_resource_income = function(_index,_amount)
{
	resources_income[_index] = _amount;
	var tl = instance_find(o_top_label,_index);
	tl.income = resources_income[_index];
}

buildable_cost_calculation = function(_amount)
{
	buildable_cost[0] = 3 - _amount;		// interceptor
	buildable_cost[1] = 5 - _amount;		// cruiser
	buildable_cost[2] = 8 - _amount;		// dreadnought
	buildable_cost[3] = 3 - _amount;		// starbase
	buildable_cost[4] = 4 - _amount;		// orbital
	buildable_cost[5] = 10 - 2*_amount;		// monolith
}


calculate_influence_upkeep = function(_amount)
{
	upkeep = _amount;
	var tl = instance_find(o_top_label,0);
	tl.upkeep = upkeep;
}

calculate_colony = function(_amount)
{
	colony = _amount;
	if(colony > max_colony)
		colony = max_colony;
	var tb = instance_find(o_top_colony,0);
	tb.colony = colony;
	tb.max_colony = max_colony;
}
