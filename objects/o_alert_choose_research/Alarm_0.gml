/// @description Yes button
if(choice > -1)
{
	var current_civ = current_player.civilization;
	var discount = current_civ.research.discount[choice];
	
	var expected_cost = (variable.cost - discount)*(discount <= variable.cost - variable.discount) + variable.discount*(discount > variable.cost - variable.discount);
	var buyable = (current_civ.resources[1] - expected_cost >= 0);
	if(array_length(current_civ.research.researched[choice]) >= 7)
		buyable = false;
	
	if(buyable)
	{
		current_civ.calculate_resource(1,-expected_cost);
		current_civ.add_rare_research(variable,choice);
		var research_controller = instance_find(o_research_controller,0);
		research_controller.delete_research(variable);
			
		var gc = instance_find(o_game_controller,0);
		gc.busy = 1;
		player_controller.alarm[2] = 1;
		var ar = instance_find(o_alert_research,0);
		ar.alarm[2] = 1;
		instance_destroy(self);
	}
}