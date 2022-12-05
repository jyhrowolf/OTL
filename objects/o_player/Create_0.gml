/// @description initiallize
setup_species = function(_specie)
{
	species = _specie;
	civilization = instance_create_layer(x,y,"Player",o_civilization);
	civilization.influence = _specie.max_influence;
	civilization.influence_action = _specie.influence_action;
	civilization.trade = _specie.trade;
	civilization.calculate_resources(_specie.resources);
	civilization.max_colony = _specie.max_colony;
	civilization.calculate_colony(_specie.max_colony);
	civilization.max_ships = _specie.max_ships;
	
	for(var i = 0; i < array_length(species.blueprints); i++) //add all species blueprints
	{
		species.blueprints[i].player = player;
		array_push(blueprints,species.blueprints[i]);
	}
	for(var i = 0; i < 3; i++) //settup interceptor, cruiser, dreadnought
	{
		civilization.buildable[i] = _specie.buildable[i];
	}
	for(var i = 0; i < array_length(species.research); i++) //add all species research
	{
		civilization.add_research(species.research[i]);
	}
	civilization.buildable_cost_calculation(_specie.buildable_cost);
}
calculate_resource_income = function(_hypo)
{
	for(var i = 0 ; i <3; i++)
	{
		var inc = civilization.resources_built[i] + _hypo[i];
		
		var r = 2;
		var t = 1;
		for(var j = 0; j < inc; j++)
		{
			if(j % 4 == 3)
				t++;
			r += t;
		}
		//var r = round(0.126124*inc*inc + 0.97977*upk + 1.87637);
		civilization.calculate_resource_income(i,r);
	}
}
calculate_influence_upkeep = function(_hypo)
{
	var upk = 13 - civilization.influence;
	if(upk < 0)
		upk = 0;
	var u = 0.215285*upk*upk - 0.0834166*upk + 0.043956;
	civilization.calculate_influence_upkeep(round(u));
}