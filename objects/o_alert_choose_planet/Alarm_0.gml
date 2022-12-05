/// @description Yes button
if(choice > -1)
{
	var gc = instance_find(o_game_controller,0);
	if(is_planet_colonizable(current_player,variable,choice))
	{
		gc.complete--;
		current_player.civilization.resources_built[choice]++;
		current_player.calculate_resource_income([0,0,0]);
		current_player.civilization.calculate_colony(current_player.civilization.colony - 1);
		array_push(variable.resources,player_controller.active_player);
		
		gc.player_controller.alarm[7] = 1;
		gc.alarm[7] = 2;
		instance_destroy(self);
	}
}