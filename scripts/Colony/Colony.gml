// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_colony(_gc,_pc, selected_hex)
{
	var c_width = camera_get_view_width(view_camera[0]);
	var c_height = camera_get_view_height(view_camera[0]);
	var current_player = _pc.players[_pc.active_player];
	
	switch (_gc.busy)
	{
		case 0: //get system
			camera_set_view_pos(view_camera[0],selected_hex.x-c_width/2,selected_hex.y-c_height/2);
			if(selected_hex.player == _pc.active_player)
			{
				current_player.last_selected_hex = selected_hex;
				if(is_colonizable(current_player,selected_hex))
					_gc.busy = 1;
			}
		break;
		case 1: //choose the planet
			var m_x = device_mouse_x(0);
			var m_y = device_mouse_y(0);
			for(var i = 0; i < array_length(selected_hex.planets); i++)
				if(position_meeting(m_x, m_y, selected_hex.planets[i]))
					if(is_planet_colonizable(current_player,selected_hex.planets[i],selected_hex.planets[i].resource,false)) //spend a colony on planet
						if(selected_hex.planets[i].resource < 3)
						{
							_gc.complete--;
							current_player.civilization.resources_built[selected_hex.planets[i].resource]++;
							current_player.calculate_resource_income([0,0,0]);
							current_player.civilization.calculate_colony(current_player.civilization.colony - 1);
							selected_hex.planets[i].resources++;
							_gc.alarm[7] = 1;
						}
						else
						{
							var ac = instance_find(o_alert_controller,0);
							array_push(ac.alerts,o_alert_choose_planet);
							show_debug_message("CHOOSE PLANET")
							ac.next_alert(selected_hex.planets[i]);
							_gc.busy = 2;
						}
		break;
	}
}