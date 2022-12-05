// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_influence(_gc,_pc, choose_hex)
{
	var c_width = camera_get_view_width(view_camera[0]);
	var c_height = camera_get_view_height(view_camera[0]);
	var current_player = _pc.players[_pc.active_player];
	
	camera_set_view_pos(view_camera[0],choose_hex.x-c_width/2,choose_hex.y-c_height/2);
	if(_gc.busy >= 0)
	{
		if(choose_hex.highlighted)
		{
			if(!_pc.action_taken)
			{
				_pc.action_taken = true;
				current_player.civilization.calculate_colony(current_player.civilization.colony + 2);
				_gc.bottom_bar.alarm[0] = 1;
			}
			if(choose_hex.player == 0 && _gc.complete > 0)
			{
				choose_hex.player = _pc.active_player;
				array_push(current_player.civilization.systems,choose_hex);
				current_player.civilization.influence--;
				current_player.calculate_influence_upkeep(0);
				current_player.last_selected_hex = choose_hex;
				_gc.complete--;
				if(_gc.complete + _gc.busy <= 0)
				{
					_gc.busy = 0;
					_pc.alarm[6] = 1;
					alarm[11] = 1;
				}
				alarm[6] = 1;
			}
			else if(choose_hex.player == current_player.player && _gc.busy > 0)
			{
				var p_systems = current_player.civilization.systems;
				if(array_length(p_systems) > 1)
				{
					var index = 0;
					for(var i = 0; i < array_length(p_systems);i++)
					{
						if(p_systems[i].object_index == choose_hex.object_index)
						{
							index = i;
							break;
						}
					}
					choose_hex.player = 0;
					for(var i = 0; i < array_length(choose_hex.planets); i++)
					{
						if(choose_hex.planets[i].resource < 3) // planet
							current_player.civilization.resources_built[choose_hex.planets[i].resource] -= array_length(choose_hex.planets[i].resources);
						else if(choose_hex.planets[i].resource < 4) // white
							current_player.civilization.resources_built[2] -= array_length(choose_hex.planets[i].resources);
						else if(choose_hex.planets[i].resource < 5) // orbital
							current_player.civilization.resources_built[1] -= array_length(choose_hex.planets[i].resources);
										
						choose_hex.planets[i].resources = [];
					}
					current_player.calculate_resource_income([0,0,0]);
								
					array_delete(current_player.civilization.systems,index,1);
					current_player.civilization.influence++;
					current_player.calculate_influence_upkeep(0);
					current_player.last_selected_hex = p_systems[0];
								
					_gc.busy--;
					if(_gc.complete + _gc.busy <= 0)
					{
						_gc.busy = 0;
						_pc.alarm[6] = 1;
						alarm[11] = 1;
					}
					alarm[6] = 1;
				}
			}
			else if(_gc.complete + _gc.busy <= 0)
			{
				_gc.busy = 0;
				_pc.alarm[6] = 1;
				alarm[11] = 1;
			}
		}
	}
}