// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_combat(_gc,_pc, _hex)
{
	var c_width = camera_get_view_width(view_camera[0]);
	var c_height = camera_get_view_height(view_camera[0]);
	var current_player = _pc.players[_pc.active_player];
	
	switch (_gc.busy)
	{
		case 0: //get the system
			camera_set_view_pos(view_camera[0],_hex.x-c_width/2,_hex.y-c_height/2);
		break;
		case 1: //place the system
			camera_set_view_pos(view_camera[0],_hex.x-c_width/2,_hex.y-c_height/2);
		break;
		case 2: //take the system
			camera_set_view_pos(view_camera[0],_hex.x-c_width/2,_hex.y-c_height/2);
			
			if(_hex.exploration_token != noone)
			{
				var ac = instance_find(o_alert_controller,0);
				array_push(ac.alerts,o_alert_choose_exploration);
				show_debug_message("CHOOSE EXPLORATION")
				ac.next_alert(_hex.exploration_token);
				_hex.exploration_token = noone;
			}
			_gc.busy = 2;
			
			_hex.player = _pc.active_player;
			array_push(current_player.civilization.systems,_hex);
			current_player.civilization.influence--;
			current_player.calculate_influence_upkeep(0);
			_gc.busy = 0;
			current_player.last_selected_hex = _hex;
			bottom_bar.my_buttons[6].image_index = 0; //end
			
			alarm[1] = 1; // update map
		break;
	}
}