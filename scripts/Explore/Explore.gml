// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_explore(_gc,_pc, hex, choose_hex)
{
	var c_width = camera_get_view_width(view_camera[0]);
	var c_height = camera_get_view_height(view_camera[0]);
	var current_player = _pc.players[_pc.active_player];
	
	var applied_traits = _pc.players[_pc.active_player].civilization.trait_list;
	applied_traits = calculate_applied_traits(applied_traits,"explore");
	var whg = 1;
	if(array_length(applied_traits) <= 0) // no explore actions
	{
		applied_traits[0] = instance_create_layer(0,0,"Controllers",o_explore_generic);
		whg = 0;
	}
	switch (_gc.busy)
	{
		case 0: //get the system
			camera_set_view_pos(view_camera[0],choose_hex.x-c_width/2,choose_hex.y-c_height/2);
			if(_gc.selected_hex.player == _pc.active_player)
				current_player.last_selected_hex = _gc.selected_hex;
			else if(!_gc.selected_hex.explored)
				if(ds_map_exists(_gc.connected_hex,map_hash(hex)))
				{
					if(connected_to_player(_gc.selected_hex,map,_pc.active_player)||applied_traits[0].trait(_gc.selected_hex,_gc))
					{
						var tier = _gc.selected_hex.tier;
						tier = tier*(tier<4) + 3*(tier>=4);
						if(array_length(_gc.system_tokens[tier-1]) > 0)
						{
							var sys = array_pop(_gc.system_tokens[tier-1]);
							var asset = asset_get_index("o_system_" + string(sys));
							show_debug_message("o_system_"+string(sys));
							var system = instance_create_layer(_gc.selected_hex.x, _gc.selected_hex.y,
										"Map", asset);
							system.hex_coord = hex;
							system.explored = true;
							system.tier = tier_calculate(hex);
							system.depth = -2;
							instance_destroy(_gc.map[? map_hash(hex)])
							_gc.map[? map_hash(hex)] = system;
							_gc.hovered_hex = system;
							_gc.selected_hex = system;
							while(!valid_rotation(_gc.selected_hex,map,_pc.active_player,whg))
								rotate_layout(_gc.selected_hex,1);
							rotate_camera(_pc,0,_gc.selected_hex);
							
							if(!_pc.action_taken)
								_gc.bottom_bar.alarm[0] = 1; // darken buttons
							_pc.action_taken = true;
							_gc.complete--;
							_gc.busy = 1;
							
							alarm[11] = 1; //clear highlighted
						}
					}
				}
		break;
		case 1: //place the system
			camera_set_view_pos(view_camera[0],choose_hex.x-c_width/2,choose_hex.y-c_height/2);
			if(choose_hex.player == _pc.active_player)
				current_player.last_selected_hex = choose_hex;
			if(choose_hex == _gc.selected_hex)
			{
				if(array_length(_gc.selected_hex.ships) > 0) // it is not controllable
				{
					_gc.busy = 0;
					_gc.selected_hex = current_player.last_selected_hex;
					if(_gc.complete <= 0)
					{
						_gc.bottom_bar.my_buttons[6].image_index = 0; //reset cancel button, to end
						_pc.action = 0;
					}
					alarm[1] = 1; // update map
				}
				else
				{
					current_player.last_selected_hex = _gc.selected_hex;
					if(_gc.selected_hex.exploration_token != noone)
					{
						var ac = instance_find(o_alert_controller,0);
						array_push(ac.alerts,o_alert_choose_exploration);
						show_debug_message("CHOOSE EXPLORATION")
						ac.next_alert(_gc.selected_hex.exploration_token);
						_gc.selected_hex.exploration_token = noone;
					}
					_gc.busy = 2;
				}
			}
		break;
		case 2: //take the system
			camera_set_view_pos(view_camera[0],choose_hex.x-c_width/2,choose_hex.y-c_height/2);
			if(choose_hex.player == _pc.active_player)
				current_player.last_selected_hex = choose_hex;
			if(choose_hex == _gc.selected_hex)
			{
				_gc.selected_hex.player = _pc.active_player;
				update_planets(_gc.selected_hex);
				array_push(current_player.civilization.systems,_gc.selected_hex);
				current_player.civilization.influence--;
				current_player.calculate_influence_upkeep(0);
				_gc.busy = 0;
				current_player.last_selected_hex = _gc.selected_hex;
				if(_gc.complete <= 0)
				{
					_gc.bottom_bar.my_buttons[6].image_index = 0; //reset cancel button, to end
					_pc.action = 0;
				}
				alarm[1] = 1; // update map
			}
		break;
	}
}